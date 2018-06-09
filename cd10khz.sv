////////////////////////////////////////////////////////
//Author: Zach Steinberg
//Module Name: Clock Divider
//Description: Outputs a 10 kHz clock signal
///////////////////////////////////////////////////////
module clock_divider(
	input logic clk,
	input logic reset,
	output logic clk_10khz
	);
	
reg [7:0] counter;

always_ff @ (posedge clk, negedge reset)
	if counter > 200
		clk = ~clk 
		counter = 0
	else
		counter++

endmodule