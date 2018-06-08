// http://www.csit-sun.pub.ro/courses/Masterat/Xilinx%20Synthesis%20Technology/toolbox.xilinx.com/docsan/xilinx4/data/docs/xst/hdlcode8.html

module s2p_shift(C, SI, PO); 
input  C,SI; 
output [7:0] PO; 
reg [7:0] tmp; 
 
  always @(posedge C) 
  begin 
    tmp = {tmp[6:0], SI}; 
  end 
  assign PO = tmp; 
endmodule
