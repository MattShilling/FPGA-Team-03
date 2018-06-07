module top(
  input logic reset_n,
  input logic clk,
  input logic kb_in_serial,
  input logic ir_in,
  input logic [7:0] button_in,
  input logic [1:0] dip,
  output logic [2:0] snes_out);
  
  logic [7:0] key_mux, ir_mux, b_mux;
  logic [10:0] kb_data;
  logic [31:0] ir_data;
  logic [7:0] mux_en;
  logic clock_2MHz;

  //built in module that access's our chip's oscillator 
  OSCH #("2.08") osc_int (
    .STDBY(1'b0),
    .OSC(clock_2MHz),
    .SEDSTDBY());
  
  ClockDivider clk_div(
    .clock_2MHz(clock_2MHz),
    .reset_n(reset_n),
  );
    
  
  b_mux = ~button_in;

  multiplexer mux(
    .key_mux(key_mux),
    .ir_mux(ir_mux),
    .b_mux(b_mux),
    .dip(dip),
    .mux_en(mux_en));
  
  snes_encoder snes(
    .clock(ff),
    .reset(),
    .load(),
    .d(mux_en),
    snes_output(snes_out));
  
  
endmodule
