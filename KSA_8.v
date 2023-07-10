`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 04:28:21 PM
// Design Name: 
// Module Name: KSA_8
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

module KSA_8bit(input [7:0] a, input [7:0] b,output [8:0] s);
wire [47:0] w;
wire [6:0] c;
Peres p1(a[0],b[0],0,,w[1],w[0]);
Peres p2(a[1],b[1],0,,w[3],w[2]);
Peres p3(a[2],b[2],0,,w[5],w[4]);
Peres p4(a[3],b[3],0,,w[7],w[6]);
Peres p5(a[4],b[4],0,,w[9],w[8]);
Peres p6(a[5],b[5],0,,w[11],w[10]);
Peres p7(a[6],b[6],0,,w[13],w[12]);
Peres p8(a[7],b[7],0,,w[15],w[14]);

green_cell g1(w[1],w[0],w[17],w[16]);
yellow_cell y1(w[3],w[2],w[1],w[0],w[19],w[18]);
yellow_cell y2(w[5],w[4],w[3],w[2],w[21],w[20]);
yellow_cell y3(w[7],w[6],w[5],w[4],w[23],w[22]);
yellow_cell y4(w[9],w[8],w[7],w[6],w[25],w[24]);
yellow_cell y5(w[11],w[10],w[9],w[8],w[27],w[26]);
yellow_cell y6(w[13],w[12],w[11],w[10],w[29],w[28]);
yellow_cell y7(w[15],w[14],w[13],w[12],w[31],w[30]);

green_cell g2(w[17],w[16],w[33] ,w[32]);
green_cell g3(w[19],w[18],w[35],w[34]);
yellow_cell y8(w[21],w[20],w[17],w[16],w[37],w[36]);
yellow_cell y9(w[23],w[22],w[19],w[18],w[39],w[38]);
yellow_cell y10(w[25],w[24],w[21],w[20],w[41],w[40]);
yellow_cell y11(w[27],w[26],w[23],w[22],w[43],w[42]);
yellow_cell y12(w[29],w[28],w[25],w[24],w[45],w[44]);
yellow_cell y13(w[31],w[30],w[27],w[26],w[47],w[46]);

green_cell g4(w[33],w[32], ,c[0]);
green_cell g5(w[35],w[34], ,c[1]);
green_cell g6(w[37],w[36], ,c[2]);
green_cell g7(w[39],w[38], ,c[3]);
yellow_cell y14(w[41],w[40],w[33],w[32], ,c[4]);
yellow_cell y15(w[43],w[42],w[35],w[34], ,c[5]);
yellow_cell y16(w[45],w[44],w[37],w[36], ,c[6]);
yellow_cell y17(w[47],w[46],w[39],w[38], ,s[8]);

CNOT c1(w[1],0, ,s[0]);  
CNOT c2(w[3],c[0], ,s[1]);  
CNOT c3(w[5],c[1], ,s[2]);
CNOT c4(w[7],c[2], ,s[3]);
CNOT c5(w[9],c[3], ,s[4]);  
CNOT c6(w[11],c[4], ,s[5]);
CNOT c7(w[13],c[5], ,s[6]);
CNOT c8(w[15],c[6], ,s[7]);  
endmodule
