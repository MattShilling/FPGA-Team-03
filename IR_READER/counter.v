module ir_counter(input en, clk, res,
			   output reg [3:0] q);
		
		always @(posedge clk)
			begin
				if (res) q <= 0;
				if (en)  q <= q + 1;
			end
	
endmodule
