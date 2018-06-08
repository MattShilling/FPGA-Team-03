// takes in 11 inputs and outputs the 8 bits to mux
// 11 bit array enters with start bit(0), data bits(1-8), parity(9), stop bit(10), acknowledge(11)

module keyboard_decoder (
input logic clk;
input logic key_in;
output logic [7:0] key_out;
);

logic check_start;
logic check_ack;
logic parity;

//use s2p shift reg to separate data bits
s2p_shift (
.C(clk);
.SI(key_in);
.PO(key_out);
);

endmodule
