`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 11:07:18 AM
// Design Name: 
// Module Name: ksa_4_4
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
module KSA_4bit(input [3:0] a, input [3:0] b,output [4:0] s);    
wire [15:0] w;
wire [2:0] c;
Peres p1(a[0],b[0],0,,w[1],w[0]);
Peres p2(a[1],b[1],0,,w[3],w[2]);
Peres p3(a[2],b[2],0,,w[5],w[4]);
Peres p4(a[3],b[3],0,,w[7],w[6]);

green_cell g1(w[1],w[0],w[9],w[8]);
yellow_cell y1(w[3],w[2],w[1],w[0],w[11],w[10]);
yellow_cell y2(w[5],w[4],w[3],w[2],w[13],w[12]);
yellow_cell y3(w[7],w[6],w[5],w[4],w[15],w[14]);

green_cell g2(w[9],w[8], ,c[0]);
green_cell g3(w[11],w[10], ,c[1]);
yellow_cell y4(w[13],w[12],w[9],w[8], ,c[2]);
yellow_cell y5(w[15],w[14],w[11],w[10], ,s[4]);

CNOT c1(w[1],0, ,s[0]);    //0 for Cin
CNOT c2(w[3],c[0], ,s[1]);
CNOT c3(w[5],c[1], ,s[2]);
CNOT c4(w[7],c[2], ,s[3]);
endmodule
