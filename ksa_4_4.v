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


module KoggeStoneAdder_4bit (
  input [3:0] inputA,
  input [3:0] inputB,
  input cin,
  output [3:0] sum,
  output cout
);

  wire [3:0] carry [3:0];

  // Carry Generation
  assign carry[0] = inputA[0] & inputB[0];
  assign carry[1] = inputA[1] & inputB[1] | inputA[0] & inputB[1] | inputA[1] & carry[0];
  assign carry[2] = inputA[2] & inputB[2] | inputA[1] & inputB[2] | inputA[2] & carry[1] | inputA[0] & inputB[2] | inputA[0] & inputB[1] & inputA[1];
  assign carry[3] = inputA[3] & inputB[3] | inputA[2] & inputB[3] | inputA[3] & carry[2] | inputA[1] & inputB[3] | inputA[2] & inputB[2] & inputA[3] | inputA[0] & inputB[3] & inputA[1] | inputA[0] & inputB[2] & inputA[1] & inputA[2];

  // Sum Generation
  assign sum[0] = inputA[0] ^ inputB[0] ^ cin;
  assign sum[1] = inputA[1] ^ inputB[1] ^ carry[0];
  assign sum[2] = inputA[2] ^ inputB[2] ^ carry[1];
  assign sum[3] = inputA[3] ^ inputB[3] ^ carry[2];

  // Carry-out
  assign cout = carry[3];

endmodule