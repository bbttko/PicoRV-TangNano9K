/*
 * simple RAM -- btko
 *
 * 17-May-2022 initial file
 */
//`default_nettype none

module btRAM #(
		parameter DATA_WIDTH = 32,
		parameter DATA_DEPTH = 512
	) (
		input wire [$clog2(DATA_DEPTH)-1:0] address,
		input wire [3:0] byteena,
		input wire clock,
		input wire [DATA_WIDTH-1:0] data,
		input wire wren,
		output reg [DATA_WIDTH-1:0] q
	);

	// -- memory -- 
	reg [DATA_WIDTH-1:0] MEM [DATA_DEPTH-1:0];

	// -- byte select writes --
	genvar bytelane;
	generate
		for (bytelane = 0; bytelane < (DATA_WIDTH / 8); bytelane = bytelane + 1) begin : whatever
			always @(posedge clock) begin
				if (wren && byteena[bytelane]) MEM[address][7+bytelane*8:bytelane*8] <= data[7+bytelane*8:bytelane*8];
			end
		end
	endgenerate
	
	// -- output q --
	always @(posedge clock) q <= MEM[address];
		
endmodule


// ================ junkyard =====================

	/* -- replaced by generate above
	always @(posedge clock) begin
		
		if (wren && byteena[0]) MEM[address][7:0]   <= data[7:0];
		if (wren && byteena[1]) MEM[address][15:8]  <= data[15:8];
		if (wren && byteena[2]) MEM[address][23:16] <= data[23:16];
		if (wren && byteena[3]) MEM[address][31:24] <= data[31:24];
		q <= MEM[address];
		
	end
	*/