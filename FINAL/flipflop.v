module ff(input s, r,
		  output reg q=0);
		  
	always @(posedge s, posedge r) begin
		if(s) q <= ~q;
		else q <= ~q;
		//q <= ~q;
		end 

endmodule		