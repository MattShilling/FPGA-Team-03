 ////////////////////////////////////////////////////////
//Author: Matt Shilling
//Module Name: parity.sv
//Description: module to check parity for the kb data
///////////////////////////////////////////////////////
 
 module parity(input [8:0] pdata, input en, input reset, output pass);

	reg [3:0] parity_count;
	
	always @(posedge en) begin
		if(pdata[0] == 1) parity_count <= parity_count + 1;
		if(pdata[1] == 1) parity_count <= parity_count + 1;
		if(pdata[2] == 1) parity_count <= parity_count + 1;
		if(pdata[3] == 1) parity_count <= parity_count + 1;
		if(pdata[4] == 1) parity_count <= parity_count + 1;
		if(pdata[5] == 1) parity_count <= parity_count + 1;
		if(pdata[6] == 1) parity_count <= parity_count + 1;
		if(pdata[7] == 1) parity_count <= parity_count + 1;
		if(pdata[8] == 1) parity_count <= parity_count + 1;
		if (reset) parity_count <= 0;
	end 
		
	assign pass = (parity_count % 2);

endmodule
		
