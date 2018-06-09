////////////////////////////////////////////////////////
//Author: Matt Shilling
//Module Name: sr.sv
//Description: shift reg module to send data to kb decoder
///////////////////////////////////////////////////////

module kb_shiftreg #(parameter N=11) 
	(input clk, reset, sin,
	 output wire full,
	 output reg [N-1:0] q,
	 output reg [3:0] counter);
	 
	 //reg [3:0] counter;
	 
	 always @(posedge clk, posedge reset) begin
	 
		if(reset) begin 
			q <= 0;
			counter <= 0;
		end
			
		else begin
	
			if(counter == N) begin 
				q <= 0;
				counter <= 0;
			end
			
			else begin	
				q <= {q[N-2:0], sin};
				counter <= counter + 1;
				//full <= 0;
			end 
		end
	end

	assign full = (counter == N);
endmodule
			
			
