////////////////////////////////////////////////////////
//Author: Matt Shilling
//Module Name: sr.sv
//Description: shift reg module to send data to kb decoder
///////////////////////////////////////////////////////

module shiftreg #(parameter N=11) 
	(input clk, reset, sin,
	 output reg full,
	 output reg [N-1:0] q);
	 
	 reg [3:0] counter;
	 
	 always @(posedge clk, posedge reset)
	 
		if(reset) begin 
			q <= 0;
			counter <= 0;
		end
			
		else begin
	
			if(counter == N) full <= 1;
			
			else begin	
				q <= {q[N-2:0], sin};
				counter <= counter + 1;
				full <= 0;
			end 
		end

endmodule
			
