////////////////////////////////////////////////////////
//Author: Brittany Taggart
//Module Name: top.sv
//Description: Top module for the whole project
///////////////////////////////////////////////////////

module top(
  input logic reset_n,  
  input logic re_kb,  //reset for keyboard reader
  input logic snes_clk, //connected to encoder
  input logic snes_latch,  //connected to encoder
  input logic [1:0] kb_in_serial,  //keyboard data to FPGA (both clock and data)
  input logic ir_in,  //ir data received by FPGA
  input logic [7:0] button_in,  //button data to FPGA
  input logic [1:0] dip,  //FPGA switches that connect to mux
  output logic snes_out); //output data from encoder to snes console
  
  
  //Internal variables
  logic [7:0] key_mux, ir_mux, b_mux; //connection between each decoder to mux
  logic [7:0] kb_data;  //kb reader to decoder data
  logic [31:0] ir_data; //ir reader to decoder data
  logic [7:0] mux_en; //data from mux to encoder
  logic in_reset;  //inverted reset_n that goes to encoder
  logic clock_2MHz;  //default clk speed
  logic clock_10KHz;
  logic ir_available;
  logic kb_available;

  //built in module that access's our chip's oscillator 
  OSCH #("2.08") osc_int (
    .STDBY(1'b0),
    .OSC(clock_2MHz),
    .SEDSTDBY());
  
  //clock divider
  clock_divider clk_div(
    .clk(clock_2MHz),
    .clk_10khz(clock_10KHz));
    
  //Inverter for button input
  assign b_mux = ~button_in;
  
  //Inverter for reset to connect to encoder
  assign in_reset = ~reset_n;
  
  //reader for IR
  TOP_IR_READER ir_reader(
    .ir_signal(ir_in),
    .IR_READER_CLK(clock_10KHz),
    .reset(reset_n),
    .avail(ir_available),
    .ir_reader_out(ir_data));
  
  
  //decoder for IR
  IR_decoder ir_dec(
    .IR_in(ir_data),
    .IR_out(ir_mux),
    .latch(ir_available));
  
  //reader for keyboard
  TOP kb_top(
    .kb_in(kb_in_serial),
    .reset(re_kb),
    .kb_reader_out(kb_data),
    .avail(kb_available1));
  
  //decoder for keyboard
  keyboard_decoder kb_decoder(
    .key_dec(kb_data),
    .key_out(key_mux),
    .latch(kb_available));
  
  //multiplexer that chooses ir, keyboard, or button board
  multiplexer mux(
    .key_mux(key_mux),
    .ir_mux(ir_mux),
    .b_mux(b_mux),
    .dip(dip),
    .mux_en(mux_en));
  
  //takes in the data from controller and sends that data to the snes console
  snes_encoder snes(
    .clock(snes_clk),
    .reset(in_reset),
    .load(snes_latch),
    .d(mux_en),
    .snes_output(snes_out));
  
  
endmodule
