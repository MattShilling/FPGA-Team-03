
////////////////////////////////////////////////////////
//Author: Matt Shilling
//Module Name: top.sv
//Description: Top module for the Keyboard Reader
///////////////////////////////////////////////////////

module TOP(input [1:0] kb_in, output reg [8:0] kb_out_reader, output reg avail);

	reg [10:0] data_out;
	reg full_sr;
	reg sr_reset;
	reg p_reset;
	reg pass_check;

	always @(*) begin 		 
		if(pass_check && full_sr) begin
			data <= data_out;
			p_reset <= 1;
			avail <= 1;
			sr_reset <= 1;
		end 
			
		else if(full_sr && !pass_check) begin
			data <= 0;
			p_reset <= 1;
			avail <= 0;
			sr_reset <= 1;
		end
		
		else if (!full_sr) begin
			p_reset <= 0;
			sr_reset <= 0;
			avail <= 0;
		end
	end 
	
	shiftreg #(.N(11))KB_data(
		.clk(~kb_in[0]),
		.reset(sr_reset),
		.sin(kb_in[1]),
		.full(full_sr),
		.q(data_out) );
	
	parity pcheck(
		.pdata(data_out[9:1]),
		.en(full_sr),
		.reset(p_reset),
		.pass(pass_check) );

endmodule
