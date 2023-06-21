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


module VedicMultiplier_2x2 (
  input [1:0] multiplicand,
  input [1:0] multiplier,
  output [3:0] product
);

  // BVPGG (Balanced Variable Precision Gray Gates)
  wire [4:0] bvpgg_outputs;
  assign bvpgg_outputs[1] = multiplicand[0] ;
  assign bvpgg_outputs[2] = multiplicand[0] & multiplier[0];
   assign bvpgg_outputs[0] =  multiplier[0];
  assign bvpgg_outputs[3] = multiplicand[1];
   assign bvpgg_outputs[4] = multiplicand[1] & multiplier[0];

  // Peres gates
  wire [2:0] peres_outputs1;
  assign peres_outputs1[0] = multiplier[1];
  assign peres_outputs1[1] = multiplicand[0]^multiplier[1];
  assign peres_outputs1[2] = multiplicand[0]&multiplier[1];
  
   wire [2:0] peres_outputs2;
  assign peres_outputs2[0] = multiplicand[0]^multiplier[1];
  assign peres_outputs2[1] =  multiplicand[0]^multiplier[1];
  assign peres_outputs2[2] =  multiplier[1]&multiplicand[1];
  
   wire [2:0] peres_outputs3;
  assign peres_outputs3[0] =  multiplicand[0]^multiplier[1];
  assign peres_outputs3[1] = (multiplicand[1] & multiplier[0])^( multiplicand[0]&multiplier[1]);
  assign peres_outputs3[2] =(multiplicand[1] & multiplier[0])&( multiplicand[0]&multiplier[1]);


  // Feynman gates
  wire [1:0] feynman_outputs;
  assign feynman_outputs[0] = (multiplicand[1] & multiplier[0])&( multiplicand[0]&multiplier[1]);
;
  assign feynman_outputs[1] = ((multiplicand[1] & multiplier[0])&( multiplicand[0]&multiplier[1]))^( multiplier[1]&multiplicand[1]);
;
 

  // Output
  assign product[0] = bvpgg_outputs[0];
   assign product[1] = peres_outputs3[1];
    assign product[2] = feynman_outputs[0];
     assign product[3] =  feynman_outputs[1];

endmodule
