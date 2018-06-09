////////////////////////////////////////////////////////
// Author: Marissa Kwon
// Module Name: IR_decoder.sv
// Description: takes in 16 bit raw data from keyboard and outputs the corresponding 8 bit value to mux
///////////////////////////////////////////////////////
module IR_decoder(
  input logic [31:0] IR_in,
  output logic [7:0] IR_out,
  input logic latch
);

  always_ff @ (posedge latch) 
  case(IR_in)
    32'hB857E02F: IR_out <= 8'b0000_1001;  // A
    default: IR_out <= 8'b00000000;  // no change
  endcase
endmodule
