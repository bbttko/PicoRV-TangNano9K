
module dBounce (
		input wire i_clk, i_db, resetn,
		output wire o_db
	);
	parameter CLOCK = 50_000_000;	// 50 MHz
	parameter WINDOWSIZE = 10_000_000;	// in ns.  10 ms window
	parameter PERIOD = 20;	// 20 ns (from 50MHz)

	parameter numpoints = 10;
	
	
	localparam endcount = WINDOWSIZE/PERIOD/numpoints;
	
	
	reg out_pin = 0;
	reg [numpoints:0] window;
	reg [$clog2(endcount):0] counter = 0;
	
	// shifter
	always @(posedge i_clk) begin
		if (counter == endcount) begin
			window = { window[numpoints-1:0] , i_db};
			counter = 0;
		end else begin
			counter = counter + 1;
		end
		
	end

	
	// outpin logic
	always @(posedge i_clk) begin
		if (i_db && &window) out_pin =  1'b1;
		if (i_db == 0 && ~|window) out_pin = 1'b0;

    end
    assign o_db = out_pin;
endmodule


