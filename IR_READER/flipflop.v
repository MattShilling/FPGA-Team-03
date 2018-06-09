module counter #(parameter N=4)
			(input en, clk, res,
			output reg [N-1:0] q = 0);
		
		always @(posedge clk)
			begin
				if (res) q <= 0;
				else if (en)  q <= q + 1;
			end
	
endmodule
