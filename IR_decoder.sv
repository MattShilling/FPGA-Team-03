////////////////////////////////////////////////////////
// Author: Marissa Kwon
// Module Name: IR_decoder.sv
// Description: takes in 16 bit raw data from keyboard and outputs the corresponding 8 bit value to mux
///////////////////////////////////////////////////////
module IR_decoder(
  input logic [15:0] IR_in,
  output logic IR_out,
  input logic latch
);

  always_ff @ (posedge latch) 
  case(IR_in)
    32'h00000A0B: IR_out = 32'h0000_0001;  // B
    32'h00000A02: IR_out = 32'h0000_0010;  // Y
    32'h00000A04: IR_out = 32'h0000_0101;  // UP
    32'h00000A06: IR_out = 32'h0000_0110;  // DOWN
    32'h00000A08: IR_out = 32'h0000_0111;  // LEFT
    32'h00000A10: IR_out = 32'h0000_1000;  // RIGHT
    32'h00000A0A: IR_out = 32'h0000_1001;  // A
    32'h00000A12: IR_out = 32'h0000_1010;  // X
    default: IR_out = 32'h0000_0000;  // no change
  endcase
endmodule
