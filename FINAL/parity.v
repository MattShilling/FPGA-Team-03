 ////////////////////////////////////////////////////////
//Author: Matt Shilling
//Module Name: parity.sv
//Description: module to check parity for the kb data
///////////////////////////////////////////////////////
 
 module parity(input [10:0] pdata, output wire pass);

	wire [3:0] parity_sum;
	
	wire [1:0] start_stop;
	
	/*always @(posedge en) begin
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
	end*/
	
	assign parity_sum = pdata[1] + pdata[2] + pdata[3] + pdata[4] + pdata[5]
				      + pdata[6] + pdata[7] + pdata[8] + pdata[9];
	
	assign start_stop = pdata[0] + pdata[10];
	
	// data line [1:8] and parity bit [9] always odd number of bits
	// additionally, the start bit should always be 0 and stop, 1
	assign pass = (parity_sum % 2) && (start_stop % 2);
	
	/*
	always @(*) begin
		parity_sum <= pdata[1] + pdata[2] + pdata[3] + pdata[4] + pdata[5]
				      + pdata[6] + pdata[7] + pdata[8] + pdata[9];
		start_stop <= pdata[0] + pdata[10];
		pass <= (parity_sum % 2) && (start_stop % 2);
	end
	*/

endmodule
		
