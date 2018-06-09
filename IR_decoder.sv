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
    32'h00000A02: IR_out = 32'h0000_0002;  // Y
    32'h00000A04: IR_out = 32'h0000_0005;  // UP
    32'h00000A06: IR_out = 32'h0000_0006;  // DOWN
    32'h00000A08: IR_out = 32'h0000_0007;  // LEFT
    32'h00000A10: IR_out = 32'h0000_0008;  // RIGHT
    32'h00000A0A: IR_out = 32'h0000_0009;  // A
    32'h00000A12: IR_out = 32'h0000_000A;  // X
    default: IR_out = 32'h0000_0000;  // no change
  endcase
endmodule
