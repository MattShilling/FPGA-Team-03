////////////////////////////////////////////////////////
// Author: Marissa Kwon
// Module Name: IR_decoder.sv
// Description: takes in 16 bit raw data from keyboard and outputs the corresponding 8 bit value to mux
///////////////////////////////////////////////////////
module IR_decoder(
  input logic [15:0] IR_in;
  output logic IR_out;
  input logic latch
);

  always_ff @ (posedge latch) 
  case(IR_in)
    4'x0A0B: IR_out = 8'b0000_0001;  // B
    4'x0A02: IR_out = 8'b0000_0010;  // Y
    4'x0A04: IR_out = 8'b0000_0101;  // UP
    4'x0A06: IR_out = 8'b0000_0110;  // DOWN
    4'x0A08: IR_out = 8'b0000_0111;  // LEFT
    4'x0A10: IR_out = 8'b0000_1000;  // RIGHT
    4'x0A0A: IR_out = 8'b0000_1001;  // A
    4'x0A12: IR_out = 8'b0000_1010;  // X
    default: 8'b0000_0000;  // no change
endmodule
