`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 06:52:14 PM
// Design Name: 
// Module Name: KSA_16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KSA_16bit(input [15:0] a, input [15:0] b,output [16:0] s);  //16 bit Kogge stone adder
wire [127:0] w;
wire [15:0] c;
genvar i;

generate
    for(i=0; i<16; i=i+1)
    begin : Propagate_Generate  //Label
		Peres p_ran(.A(a[i]),.B(b[i]),.C(0),.P(),.Q(w[2*i+1]),.R(w[2*i]));				 
    end
endgenerate

green_cell g1(w[1],w[0],w[33],w[32]);
genvar g;
  generate
    for(g=0; g<15; g=g+1)
    begin 
		yellow_cell y_ran (.a(w[2*g+3]),.b(w[2*g+2]),.c(w[2*g+1]),.d(w[2*g]),.e(w[2*g+35]),.f(w[2*g+34]));	
    end
  endgenerate

green_cell g2(w[33],w[32],w[65] ,w[64]);
green_cell g3(w[35],w[34],w[67],w[66]);
  generate
    for(i=0; i<14; i=i+1)
    begin
		yellow_cell y_ran1(.a(w[2*i+37]),.b(w[2*i+36]),.c(w[2*i+33]),.d(w[2*i+32]),.e(w[2*i+69]),.f(w[2*i+68]));				 
    end
  endgenerate
  generate
    for(i=0; i<4; i=i+1)
    begin
		green_cell g_ran(.a(w[2*i+65]),.b(w[2*i+64]),.c(w[2*i+97]),.d(w[2*i+96]));				 
    end
endgenerate
generate
    for(i=0; i<12; i=i+1)
    begin
		yellow_cell y_ran2(.a(w[2*i+73]),.b(w[2*i+72]),.c(w[2*i+65]),.d(w[2*i+64]),.e(w[2*i+105]),.f(w[2*i+104]));				 
    end
endgenerate





generate
    for(i=0; i<8; i=i+1)
    begin 
		green_cell g_ran1(.a(w[2*i+97]),.b(w[2*i+96]),.c(),.d(c[i]));				 
    end
endgenerate
generate
    for(i=0; i<8; i=i+1)
    begin 
	 yellow_cell yran (.a(w[2*i+113]),.b(w[2*i+112]),.c(w[2*i+97]),.d(w[2*i+96]),.e(),.f(c[i+8]));				 
    end
endgenerate
assign s[16] = c[15];


CNOT c1(w[1],0, ,s[0]);  
generate
    for(i=0; i<15; i=i+1)
    begin
		CNOT c_ran(.A(w[2*i+3]),.B(c[i]),.P(),.Q(s[i+1]));				 
    end
endgenerate 
endmodule
