// delay - a delay block...
module delay (
        input wire clk_i,
        input wire rst_i,
        output reg rst_o
    );
    parameter ctr_width = 16;

    reg [(ctr_width-1):0] ctr;
	reg prev_rst_i = 1'b0;
	initial rst_o = 0;
	
    always @(posedge clk_i) begin
		if (prev_rst_i != rst_i)  begin
			ctr <= 0;
		end
		
		if (&ctr == 1'b0)
			ctr <= ctr + 1;
		
		if (&ctr == 1'b1) begin
			rst_o <= prev_rst_i;
			prev_rst_i <= rst_i;
		end
    end
endmodule


