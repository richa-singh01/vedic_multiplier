`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 06:39:08 PM
// Design Name: 
// Module Name: VEDICMULTIPLIER_16
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

module Vedic_16bit(input [15:0] a, input [15:0] b,output [31:0] q);
wire [83:0] w;
Vedic_8bit v1(a[7:0],b[7:0],{w[7:0],q[7:0]});
Vedic_8bit v2(a[7:0],b[15:8],w[23:8]);
Vedic_8bit v3(a[15:8],b[7:0],w[39:24]);
Vedic_8bit v4(a[15:8],b[15:8],w[55:40]);

KSA_16bit k1(w[23:8],w[39:24],w[72:56]);
KSA_16bit k2(w[71:56],{0,0,0,0,0,0,0,0,w[7:0]},{w[81:73],q[15:8]});
UPG u1(w[72],w[81],0, ,w[82], );
KSA_16bit k3(w[55:40],{0,0,0,0,0,0,0,w[82],w[80:73]},{w[83],q[31:16]});
endmodule


