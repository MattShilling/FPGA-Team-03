////////////////////////////////////////////////////////
//Author: Matt Shilling
//Module Name: kb_reader_top.sv
//Description: Top module for the Keyboard Reader
///////////////////////////////////////////////////////

// INPUTS: [1:0] KB_IN
//	- kb_in[0] = clock from keyboard
//  - kb_in[1] = serial data in from keyboard 

// INPUT: RESET
//  - reset keyboard reader on startup

// OUTPUTS: [7:0] kb_reader_out
//	- strictly data output from keyboard

// OUTPUT: avail
//  - true if data is available from reader (passed parity check)


module TOP(input [1:0] kb_in,
		   input reset, 
		   output reg [7:0] kb_reader_out, 
		   output reg avail);
	
	// wire to connect shift reg to kb_reader_out and parity check
	wire [10:0] data_out;
	
	// signal true when the shiftreg fills up
	wire full_sr;
	
	// signal true when kb data in passes parity check
	wire pass_check;
	
	// debug counter from shiftreg
	wire [3:0] counter;
	
	always @(*) begin 
		// if kb shiftreg is full and passes parity check, make available
		if(pass_check && full_sr) begin
			kb_reader_out <= data_out[9:2];
			avail <= 1;
		end 
		
		// if not, no data available
		else begin 
			kb_reader_out <= 0;
			avail <= 0;
		end
	end 
	
	// initialize shiftreg module, 11 bits read from KB per key press
	shiftreg #(.N(11))KB_data(
		.clk(~kb_in[0]),
		.reset(reset),
		.sin(kb_in[1]),
		.full(full_sr),
		.q(data_out),
		.counter(counter) );
	
	// initialize parity check module, feed in KB data
	parity pcheck(
		.pdata(data_out),
		.pass(pass_check) );

endmodule
