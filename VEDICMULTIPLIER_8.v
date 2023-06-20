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


module VEDICMULTIPLIER_8(
input [7:0] multiplicand,
  input [7:0] multiplier,
  output [15:0] product
    );
    
    wire [7:0] partial_productA;
     wire [7:0] partial_productB;
      wire [7:0] partial_productC;
       wire [7:0] partial_productD;
       wire [7:0] sumA;
       wire cin1 =0;
       wire C1;
        wire [11:0] sumb;
       wire cin2=0 ;
       wire C2;
         wire [11:0] sumC;
       wire cin3=0 ;
       wire C3;
    
    
    VedicMultiplier_4x4 multiplier_00 (
    . multiplicand(multiplicand[3:0]),
    .multiplier(multiplier[3:0]),
    . product(partial_productA)
  );
  
   
    VedicMultiplier_4x4 multiplier_01 (
    . multiplicand(multiplicand[3:0]),
    .multiplier(multiplier[7:4]),
    . product(partial_productB)
  );
  
   
    VedicMultiplier_4x4 multiplier_10 (
    . multiplicand(multiplicand[7:4]),
    .multiplier(multiplier[3:0]),
    . product(partial_productC)
  );
  
   
    VedicMultiplier_4x4 multiplier_11 (
    . multiplicand(multiplicand[7:4]),
    .multiplier(multiplier[7:4]),
    . product(partial_productD)
  );
  
   KoggeStoneAdder ADD1(.a({4'b0000,partial_productA[7:4]}),.b(partial_productB),.cin(cin1),.sum(sumA),.cout(C1));
    KoggeStoneAdder_12 ADD2(.a({4'b0000,partial_productC}),.b({partial_productD,4'b0000}),.cin(cin2),.sum(sumB),.cout(C2));
     KoggeStoneAdder_12 ADD3(.a({4'b0000,sumA}),.b(sumB),.cin(cin3),.sum(sumC),.cout(C3));
     
     //OUTPUT 
     assign product[3:0] = partial_productA[3:0];
     assign product [15:4] = sumC;
     
endmodule
