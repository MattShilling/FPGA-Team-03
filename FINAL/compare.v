module compare #(parameter N=4)
				(input [3:0] a,
				output wire result);
	
	assign result = (a > N);
	
endmodule
