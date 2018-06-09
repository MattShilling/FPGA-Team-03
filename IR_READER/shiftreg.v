module shiftreg #(parameter N = 33)
	(input shift, reset, serial_in, en,
	output reg [N-1:0] q,
	output wire avail);
	
	wire [5:0] count;
	wire reset_count;
	
	always @(posedge shift)
		begin
			//if (reset) q <= 0;
			//if (count >= N) count <= 0;
			if (!reset && en)
				begin 
					q <= {q[N-2:0], serial_in};
					//count <= count + 1;
				end
			else q <= 0;
		end 
	
	counter #(.N(6)) AVAIL_COUNTER(
		.en(en),
		.clk(shift),
		.res(reset_count),
		.q(count) );
	
	assign avail = count == 33;//count == N;
	assign reset_count = count >= N;

endmodule
