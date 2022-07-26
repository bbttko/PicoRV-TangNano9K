// picorv on Tang 9K
//
// 26-Jul-22 btko   Clean up for use as reference
//
`default_nettype none


module top (
		input wire clock27M,
		input wire S1, S2,            // S1 reset
		output wire [6:1] LEDS,       // leds 6:1 only

        // uart
		output wire TXD,
		input  wire RXD
	);
	
	// ~~~~~~~~~~  memory map ~~~~~~~~~~~~~~~~	sync with sections.lds, update sp in start.s
	localparam ROM_ADDR		=	32'h0000_0000;
	localparam ROM_ADDR_END	=	32'h0000_1FFF;
	localparam RAM_ADDR		=	32'h0000_2000;
	localparam RAM_ADDR_END	=	32'h0000_23ff;
	
	localparam LEDS_ADDR	=	32'h0200_0000;

    localparam UART_DAT_ADDR =  32'h0200_4000;		// for both R & W
	localparam UART_DIV_ADDR =  32'h0200_4008;

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	localparam RESET_ADDR	=	ROM_ADDR;
	localparam IRQ_ADDR		=	32'h0000_0008;		// irq table.. in start.s
	localparam STACK_ADDR	=	RAM_ADDR_END + 1;

	
	// ========================= PLL =========================
	wire clock_main /* synthesis syn_keep = 1 */;
	wire locked     /* synthesis syn_keep = 1 */;
    wire lock_pre   /* synthesis syn_keep = 1 */;

    Gowin_rPLL pll (
        .clkout (clock_main),   //output clkout
        .lock   (lock_pre),     //output lock
        .reset  (~S1),          //input reset
        .clkin  (clock27M)      //input clkin
    );

    delay #( .ctr_width (4) ) pll_delay (       // 320 - 650 ns delay between rst_i and rst_o
        .clk_i  (clock_main),
        .rst_i  (lock_pre),
        .rst_o  (locked)
    );


	// ========================= Button IRQ [20] =========================
	wire dS2;
	always @(posedge clock_main) begin
		irq[20] <= ~dS2;
	end
	dBounce #(
        .CLOCK      (50_000_000),
        .WINDOWSIZE (10_000_000)
    ) db (
        .resetn     (locked),
		.i_clk	    (clock_main),
		.i_db 	    (S2),
		.o_db       (dS2)
	);




	// ========================= CPU =========================
	wire mem_valid;
	wire mem_ready /* synthesis syn_keep = 1 */;
	wire mem_instr;
	wire [31:0] mem_addr /* synthesis syn_keep = 1 */ ;
	wire [31:0] mem_wdata;
	wire [3:0]  mem_wstrb;
	wire [31:0] mem_rdata;
	reg rom_ready;
	wire trapsig;
	reg [31:0] irq;
	wire [31:0] eoi;


	picorv32 #(
		.ENABLE_COUNTERS	(1),
		.BARREL_SHIFTER	    (1),
		.ENABLE_IRQ			(1),
		.ENABLE_IRQ_TIMER	(1),
		.PROGADDR_RESET	    (RESET_ADDR),
		.PROGADDR_IRQ		(IRQ_ADDR),
		.STACKADDR			(STACK_ADDR)
	) cpu (
		.clk		(clock_main),
		.resetn	    (locked),
		.trap		(trapsig),
		.irq		(irq),		// input [31:0] irq
		.eoi		(eoi),		// output [31:0] eoi

		.mem_valid	(mem_valid),	//		output reg        mem_valid,	-- MEMORY ADDRESS VALID
		.mem_instr	(mem_instr),
		.mem_ready	(mem_ready),	//		input             mem_ready,
		.mem_addr	(mem_addr),		//		output reg [31:0] mem_addr,
		.mem_wdata	(mem_wdata),	//		output reg [31:0] mem_wdata,
		.mem_wstrb	(mem_wstrb),	//		output reg [ 3:0] mem_wstrb,
		.mem_rdata	(mem_rdata)		//		input      [31:0] mem_rdata
	);



	// ========================= ROM =========================
	// start addr 	: [0000_0000]
	// end_addr		: [0000_1FFF] = 2048 * 32 / 8
	wire [31:0] romout;
    localparam ROM_DEPTH = 2048;

//    Gowin_pROM rom (
    myrom rom (     // CUSTOM ROM
        .dout   (romout),       //output [31:0] dout
        .clk    (clock_main),   //input clk
        .oce    (1'b0),         //input oce - not used in bypass mode
        .ce     (1'b1),         //input ce
        .reset  (~locked),
        .ad     (mem_addr[$clog2(ROM_DEPTH)+2-1:2])
    );

	always @(posedge clock_main) 
		rom_ready <= mem_valid && !mem_ready && (mem_addr >= ROM_ADDR) && (mem_addr <= ROM_ADDR_END);

		
	// ========================= RAM =========================
	// start addr 	: [0000_2000]
	// end_addr		: [0000_23FF]   = 256 * 32 / 8
	reg ram_ready;
	reg ram_wren;
	wire [31:0] ram_out;
    localparam RAM_DEPTH = 256;

	btRAM #(
		.DATA_WIDTH(32),
		.DATA_DEPTH(RAM_DEPTH)
	) ram (
		.address	(mem_addr[$clog2(RAM_DEPTH)+2-1:2]),
		.byteena    (mem_wstrb),
		.clock	    (clock_main),
		.data		(mem_wdata),
		.wren		(ram_wren),
		.q			(ram_out)
	);


	always @(posedge clock_main) begin
		ram_ready <= mem_valid && !mem_ready && (mem_addr >= RAM_ADDR) && (mem_addr <= RAM_ADDR_END);
		ram_wren <= (mem_valid && !mem_ready &&  (mem_addr >= RAM_ADDR) && (mem_addr <= RAM_ADDR_END) && |mem_wstrb);
	end



	// ========================= LEDS (6-bits) =========================
	// addr 	: [0200_0000]
	reg leds_ready      /* synthesis syn_preserve = 1 */;
	reg [31:0] ledreg   /* synthesis syn_preserve = 1 */;
	always @(posedge clock_main) 
		leds_ready <= mem_valid && !mem_ready && mem_addr == LEDS_ADDR;

	always @(posedge clock_main) begin
		if (!locked) 
			ledreg <= 32'h0000_0033;	// turn off
		else if (mem_valid && mem_addr == LEDS_ADDR) begin
			if (mem_wstrb[0]) ledreg[7:0] <= mem_wdata[7:0];
			if (mem_wstrb[1]) ledreg[15:8] <= mem_wdata[15:8];
			if (mem_wstrb[2]) ledreg[23:16] <= mem_wdata[23:16];
			if (mem_wstrb[3]) ledreg[31:24] <= mem_wdata[31:24];
		end
	end
	assign LEDS = ~ledreg[5:0];


	// ========================= UART =========================
	// divisor register
	wire uart_div_ready = mem_valid && mem_addr == UART_DIV_ADDR /* synthesis syn_keep = 1 */ ;
	wire [31:0] uart_div_reg_do;
	
	// data write register
	wire uart_dat_wait /* synthesis syn_keep = 1 */;
	wire uart_data_ready = mem_valid && (mem_addr == UART_DAT_ADDR) /* synthesis syn_keep = 1 */ ;
	
	// data read register
	wire [31:0] uart_dat_do;
	

	simpleuart uart (
		.clk			( clock_main	),
		.resetn			( locked	),
		.ser_tx			( TXD		),
		.ser_rx			( RXD		),

		// r/w UART divisor register
		.reg_div_we		( uart_div_ready ? mem_wstrb : 4'h0),
		.reg_div_di		( mem_wdata	),
		.reg_div_do		( uart_div_reg_do	),

		// r/w UART data register
		.reg_dat_we		( uart_data_ready ? mem_wstrb[0] : 1'b0),
		.reg_dat_di		( mem_wdata			),
		.reg_dat_wait	( uart_dat_wait	),
		
		.reg_dat_re		( uart_data_ready && !mem_wstrb ),
		.reg_dat_do		( uart_dat_do		)
	);

	// ========================= mem_ready & mem_rdata selector =========================
	assign mem_ready = rom_ready || 
                        ram_ready || 
                        leds_ready || 
                        uart_div_ready ||
                        uart_data_ready && !uart_dat_wait;
							
	assign mem_rdata = 	rom_ready       ? romout : 
                        ram_ready       ? ram_out :
                        leds_ready      ? ledreg :
                        uart_div_ready  ? uart_div_reg_do :
                        uart_data_ready ? uart_dat_do :
                        32'h0;

endmodule




