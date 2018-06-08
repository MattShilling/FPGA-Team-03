module TOP_IR_READER(
		input ir, IR_READER_CLK,
		output en, rdy,
		output reg [7:0] data);
		
		reg [3:0] ir_width_count;
		reg low_bit;
		reg high_bit;
		

		counter IR_WIDTH(
		.en(ir),
		.clk(IR_READER_CLK),
		.res(~ir),
		.q(ir_width_count) );
		
		compare #(.N(4)) LOW_BIT(
		.a(ir_width_count),
		.result(low_bit) );
		
		compare #(.N(9)) HIGH_BIT(
		.a(ir_width_count),
		.result(high_bit) );
		
		assign data[0] = low_bit & high_bit;
	
endmodule
