////////////////////////////////////////////////////////
// Author: Marissa Kwon
// Module Name: keyboard_decoder.sv
// Description: takes in 8 bit raw data from keyboard and outputs the corresponding 8 bit value to mux
///////////////////////////////////////////////////////
module keyboard_decoder (
  input logic [7:0] key_dec,
  output logic [7:0] key_out,
  input logic latch
);

  always_ff @ (posedge latch)
  case(key_dec)
    8'b0000_0001: key_out = 8'b0000_0001;  // B
    8'b0000_0010: key_out = 8'b0000_0010;  // Y
    8'b0000_0101: key_out = 8'b0000_0101;  // UP
    8'b0000_0110: key_out = 8'b0000_0110;  // DOWN
    8'b0000_0111: key_out = 8'b0000_0111;  // LEFT
    8'b0000_1000: key_out = 8'b0000_1000;  // RIGHT
    8'b0000_1001: key_out = 8'b0000_1001;  // A
    8'b0000_1010: key_out = 8'b0000_1010;  // X
    default: key_out = 8'b0000_0000;  // no change
  endcase
endmodule
