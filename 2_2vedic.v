`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 09:20:44 AM
// Design Name: 
// Module Name: 2_2vedic
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


module Vedic_2bit(input [1:0] a, input [1:0] b,output [3:0] q);
wire I1,I2,I3,g,gbar,g1,g2,g3;

BVPPG b1(a[0],b[0],0,b[1],0,g,I1,q[0],I2,g1);
Peres p1(a[1],I1,0,I3,g,g2);
Peres p2(I3,I2,0,g,gbar,g3);
Peres p3(g1,g2,0,g,q[1],g4);
CNOT c1(g4,g3,q[3],q[2]);
endmodule
