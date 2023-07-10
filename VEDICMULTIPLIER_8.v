`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 04:33:44 PM
// Design Name: 
// Module Name: VEDICMULTIPLIER_8
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


module Vedic_8bit(input [7:0] a, input [7:0] b,output [15:0] q);
wire [43:0] w;
Vedic_4bit v1(a[3:0],b[3:0],{w[3:0],q[3:0]});
Vedic_4bit v2(a[7:4],b[3:0],w[11:4]);
Vedic_4bit v3(a[3:0],b[7:4],w[19:12]);
Vedic_4bit v4(a[7:4],b[7:4],w[27:20]);

KSA_8bit k1(w[19:12],w[11:4],w[36:28]);
KSA_8bit k2(w[35:28],{0,0,0,0,w[3:0]},{w[41:37],q[7:4]});
UPG u1(w[36],w[41],0, ,w[42], );
KSA_8bit k3(w[27:20],{0,0,0,w[42],w[40:37]},{w[43],q[15:8]});
endmodule
