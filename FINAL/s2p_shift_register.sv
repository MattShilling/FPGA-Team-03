// http://www.csit-sun.pub.ro/courses/Masterat/Xilinx%20Synthesis%20Technology/toolbox.xilinx.com/docsan/xilinx4/data/docs/xst/hdlcode8.html
//shift register for the KEYBOARD decoder
/*module s2p_shift( 
 input logic clk, 
 input logic DIN, 
 input logic reset,
 output logic [7:0] DO
); 

logic clk; 
logic [6:0] tmp; 
 
always_ff @(posedge clk, posedge reset) 
  
  
  begin 
    tmp = {tmp[6:0], DO}; 
  end 
  assign DO = tmp; 
*/