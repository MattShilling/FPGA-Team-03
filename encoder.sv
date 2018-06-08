////////////////////////////////////////////////////////
//Author: Zach Steinberg
//Module Name: Encoder
//Description: Converts signal from inputs into signal that the SNES can interpret
///////////////////////////////////////////////////////
module snes_encoder (
	input logic clock, //assigning all inputs and outputs
	input logic reset,
	input logic load,
	input logic [7:0] d,
	output logic snes_output
	);

	logic[7:0] q; //HDL equivalent of a wire, used as variable to set output to

always_ff(posedge clk, posedge reset)
	if (reset)
		q <= 0;
	else if (load)
		q <= d;
	else
		q <= {1, q[7:1]};
		
	assign snes_out = q[0]; //sets the output to the first bit of the q variable

endmodule
