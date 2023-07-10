`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 09:36:56 AM
// Design Name: 
// Module Name: vedicmultiplier_4
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

module Vedic_4bit(input [3:0] a, input [3:0] b,output [7:0] q);
wire [24:0]w;
Vedic_2bit v1(a[1:0],b[1:0],{w[1:0],q[1:0]});
Vedic_2bit v2(a[1:0],b[3:2],w[5:2]);
Vedic_2bit v3(a[3:2],b[1:0],w[9:6]);
Vedic_2bit v4(a[3:2],b[3:2],w[13:10]);

KSA_4bit k1(w[5:2], w[9:6],w[18:14]);
KSA_4bit k2({0,0,w[1:0]}, w[17:14],{w[21:19],q[3:2]});
Peres p1(w[18],w[21],0,,w[22],w[23]);
KSA_4bit k3({w[23:22],w[20:19]}, w[13:10],{w[24],q[7:4]});
endmodule
