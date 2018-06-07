module snes_encoder (
	input logic clock,
	input logic reset,
	input logic load,
	input logic [7:0] d,
	output logic snes_output
	);

logic[7:0] q;

always_ff(posedge clk, posedge reset)
	if (reset)
		q <= 0;
	else if (load)
		q <= d;
	else
		q <= {1, q[7:1]};
		
assign snes_out = q[0];

endmodule
