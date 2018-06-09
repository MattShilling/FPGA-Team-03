////////////////////////////////////////////////////////
//Author: Matt Shilling
//Module Name: ir_reader_top.sv
//Description: main ir reader module
///////////////////////////////////////////////////////

// INPUT: ir_signal
//	- signal in from the ir port (HIGH OR LOW)

// INPUT: IR_READER_CLK
//	- 10kHz clock from MAIN TOP MODULE used to count width of ir_signal

// INPUT: reset
//	- resets IR reader module

// OUTPUTS: ir_reader_out
//	- output of IR reader

module TOP_IR_READER(
		input ir_signal, IR_READER_CLK, reset,
		output reg avail, 
		output reg [31:0] ir_reader_out);
		
		reg [3:0] ir_width_count; // width count of ir_signal
		reg low_bit;  // low bit from comparator
		reg high_bit; // high bit from comparator
		wire serial_data; // data to store in the ir reader shiftreg
		reg start_bit; // start bit detected 
		reg stop_bit;
		
		// enable to start shifting in to shift reg, 
		// depends on if there was a start bit detected
		reg load_bits; 
		
		// if low & high bit: 9 < ir width = HIGH BIT
		// if low & !high bit: 4 < ir width < 9 = LOW BIT
		assign serial_data = low_bit & high_bit;
		
		// counter to measure ir width, 4 bits wide
		counter #(.N(4)) IR_WIDTH(
		.en(ir_signal),
		.clk(IR_READER_CLK),
		.res(~ir_signal),
		.q(ir_width_count) );
		
		// comparator to detect low bit, 4 counts
		compare #(.N(4)) LOW_BIT(
		.a(ir_width_count),
		.result(low_bit) );
		
		// comparator to detect high bit, 9 counts
		compare #(.N(9)) HIGH_BIT(
		.a(ir_width_count),
		.result(high_bit) );
		
		// comparator to detect start bit, 14 counts
		compare #(.N(14)) START_BIT(
		.a(ir_width_count),
		.result(start_bit) );
		
		// flip flop to stick when there was a start bit
		ff STARTED(
		.s(start_bit), // have we seen the start bit
		.r(avail), // if the SR is full, reset
		.q(load_bits) ); // should we load bits into the SR
		
		// shift register to store serial data from ir
		shiftreg #(.N(33)) SHIFT_REG(
		.shift(~ir_signal),
		.en(load_bits), // able to load bits (aka seen start bit)
		.reset(reset),
		.serial_in(serial_data),
		.q({ir_reader_out, stop_bit}),
		.avail(avail) ); // shift register is full 
	
endmodule
