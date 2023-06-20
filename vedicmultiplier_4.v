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


module VedicMultiplier_4x4 (
  input [3:0] multiplicand,
  input [3:0] multiplier,
  output [7:0] product
);

  // Intermediate signals
  wire [3:0] partial_products [3:0];
  wire [3:0] sumA;
  wire C1;
  wire [3:0] sumB;
  wire C2;
  wire [3:0] sumC;
  wire C3;
  wire cin1 =0;
  wire cin2=0;
  wire cin3=0;

  // Generate partial products using 2x2 Vedic multipliers
  VedicMultiplier_2x2 multiplier_00 (
    . multiplicand(multiplicand[1:0]),
    .multiplier(multiplier[1:0]),
    . product(partial_products[0])
  );
  VedicMultiplier_2x2 multiplier_01 (
    . multiplicand(multiplicand[3:2]),
    .multiplier(multiplier[3:2]),
    . product(partial_products[1])
  );
  VedicMultiplier_2x2 multiplier_10 (
    . multiplicand(multiplicand[1:0]),
    .multiplier(multiplier[3:2]),
    . product(partial_products[2])
  );
  VedicMultiplier_2x2 multiplier_11 (
    .multiplicand(multiplicand[3:2]),
    .multiplier(multiplier[1:0]),
    . product(partial_products[3])
  );

  // Kogge-Stone Adder (4-bit)
  KoggeStoneAdder_4bit adder_1 (
    .inputA(partial_products[1]),.inputB(partial_products[2]),.cin(cin1),
    .sum(sumA),.cout(C1)
  );
   KoggeStoneAdder_4bit adder_2(
    .inputA(sumA),.inputB({2'b00,partial_products[0][3:2]}),.cin(cin2),
    .sum(sumB),.cout(C2)
  );
   KoggeStoneAdder_4bit adder_3 (
    .inputA(partial_products[3]),.inputB({C1,C2,sumB[3:2]}),.cin(cin3),
    .sum(sumC),.cout(C3)
  );

  // Output
  assign product[1:0] = partial_products[0][1:0];
  assign product[3:2] = sumB[1:0];
  assign product[7:4] = sumC;
endmodule