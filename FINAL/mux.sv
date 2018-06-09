////////////////////////////////////////////////////////
//Author: Zach Steinberg
//Module Name: Multiplexer
//Description: Allows user to switch between what input is desired for SNES control
///////////////////////////////////////////////////////
module multiplexer(
	input [7:0] key_mux, //assigning inputs and outputs
	input [7:0] ir_mux,
	input [7:0] b_mux,
	input [1:0] dip,
	output logic [7:0] mux_en
	);
	
always_comb	
	begin
		case(dip) //using the DIP switch on the FPGA to determine which input is sent to the output by a case statement
			0:		mux_en = key_mux;
			1:		mux_en = ir_mux;
			2:		mux_en = b_mux;
		endcase
	end

endmodule
