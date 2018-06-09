////////////////////////////////////////////////////////
//Author: Zach Steinberg
//Module Name: Clock Divider
//Description: Outputs a 10 kHz clock signal
///////////////////////////////////////////////////////
module clock_divider(
	input logic clk,
	output logic clk_10khz = 0
	);
	
reg [7:0] counter = 0;

always_ff @ (posedge clk)
	if (counter > 200)
		begin
			clk_10khz <= ~clk_10khz;
			counter <= 0;
		end
	else
		counter <= counter + 1;

endmodule