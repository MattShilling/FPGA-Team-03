// http://www.csit-sun.pub.ro/courses/Masterat/Xilinx%20Synthesis%20Technology/toolbox.xilinx.com/docsan/xilinx4/data/docs/xst/hdlcode8.html
//shift register for the KEYBOARD decoder
module s2p_shift( 
 input logic clk; 
 input logic DIN; 
 input logic reset;
 output logic [7:0] DO;
); 

input  clk; 
input logic tmp; 
 
always_ff @(posedge clk, posedge reset) 
  
  
  begin 
    tmp = {tmp[6:0], SI}; 
  end 
  assign PO = tmp; 
endmodule
