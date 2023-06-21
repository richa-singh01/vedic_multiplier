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
  assign bvpgg_outputs[2] = (multiplicand[0] & multiplier[0])^1'b0;
   assign bvpgg_outputs[0] =  multiplier[0];
  assign bvpgg_outputs[3] = multiplicand[1];
   assign bvpgg_outputs[4] = (multiplicand[1] & multiplier[0])^1'b0;

  // Peres gates
  wire [2:0] peres_outputs1;
  assign peres_outputs1[0] = multiplier[1];
  assign peres_outputs1[1] = bvpgg_outputs[0] ;
  assign peres_outputs1[2] = (multiplier[1]& bvpgg_outputs[1])^1'b0;
  
   wire [2:0] peres_outputs2;
  assign peres_outputs2[0] =bvpgg_outputs[0];
  assign peres_outputs2[1] =  bvpgg_outputs[0];
  assign peres_outputs2[2] = (bvpgg_outputs[3] &  peres_outputs1[0])^1'b0;
  
   wire [2:0] peres_outputs3;
  assign peres_outputs3[0] =  bvpgg_outputs[0];
  assign peres_outputs3[1] = bvpgg_outputs[4]^ peres_outputs1[2];
  assign peres_outputs3[2] = (bvpgg_outputs[4]& peres_outputs1[2])^1'b0;


  // Feynman gates
  wire [1:0] feynman_outputs;
  assign feynman_outputs[0] =  peres_outputs3[2];

  assign feynman_outputs[1] = peres_outputs3[2]^peres_outputs2[2];

 

  // Output
  assign product[0] = bvpgg_outputs[2];
   assign product[1] = peres_outputs3[1];
    assign product[2] = feynman_outputs[0];
     assign product[3] =  feynman_outputs[1];

endmodule
