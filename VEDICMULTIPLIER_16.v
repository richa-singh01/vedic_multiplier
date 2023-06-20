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


module VEDICMULTIPLIER_16(
input [15:0] multiplicand,
  input [15:0] multiplier,
  output [31:0] product
    );
    
    wire [15:0]partial_productA;
    wire [15:0]partial_productB;
    wire [15:0]partial_productC;
    wire [15:0]partial_productD;
    wire [15:0]sumA;
    wire [15:0] sumB;
    wire [15:0]sumC;
    wire cin1=0;
    wire cin2=0;
    wire cin3=0;
    wire C1;
    wire C2;
    wire C3;
    
    
     VEDICMULTIPLIER_8 multiplier_00 (
    . multiplicand(multiplicand[7:0]),
    .multiplier(multiplier[7:0]),
    . product(partial_productA)
  );
    VEDICMULTIPLIER_8 multiplier_01 (
    . multiplicand(multiplicand[15:8]),
    .multiplier(multiplier[7:0]),
    . product(partial_productB)
  );
   VEDICMULTIPLIER_8 multiplier_10 (
    . multiplicand(multiplicand[7:0]),
    .multiplier(multiplier[15:8]),
    . product(partial_productC)
  );
    VEDICMULTIPLIER_8 multiplier_11 (
    . multiplicand(multiplicand[15:8]),
    .multiplier(multiplier[15:8]),
    . product(partial_productD)
  );
    
    
    KoggeStoneAdder_16 ADD1(.a(partial_productB),.b(partialproductC),.cin(cin1),.sum(sumA),.cout(C1));
    KoggeStoneAdder_16 ADD2(.a(sumA),.b({8'b00000000,partial_productA[15:8]}),.cin(cin2),.sum(sumB),.cout(C2));
    KoggeStoneAdder_16 ADD3(.a(partial_productD),.b({C1,7'B0000000,sumB[15:8]}),.cin(cin3),.sum(sumC),.cout(C3));
    
    assign product[7:0] = partial_productA[7:0];
    assign product[15:8] = sumB[7:0];
    assign product[31:16] = sumC;
endmodule
