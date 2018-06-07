module shift_register #(parameter N = 8) (
	input logic clk,
	input logic reset,
	input logic load, //jjj
	input logic s_in,
	input logic [N-1:0] d,
	output logic [N-1:0] q,
	output logi s_out
	);
	
always_ff @(posedge clk, posedge reset)
	if (reset)
		q <= 0;
	else if (load)
		q <= d;
	else
		q <= {q[N-2:0], s_in};
		
assign s_out = q[N-1];

endmodule
