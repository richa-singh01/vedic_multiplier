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
  wire [3:0] bvpgg_outputs;
  assign bvpgg_outputs[0] = multiplicand[0] & multiplier[0];
  assign bvpgg_outputs[1] = multiplicand[1] & multiplier[0];
  assign bvpgg_outputs[2] = multiplicand[0] & multiplier[1];
  assign bvpgg_outputs[3] = multiplicand[1] & multiplier[1];

  // Peres gates
  wire [3:0] peres_outputs;
  assign peres_outputs[0] = bvpgg_outputs[0];
  assign peres_outputs[1] = bvpgg_outputs[1] ^ bvpgg_outputs[2];
  assign peres_outputs[2] = bvpgg_outputs[1] ^ bvpgg_outputs[3];
  assign peres_outputs[3] = bvpgg_outputs[2] ^ bvpgg_outputs[3];

  // Feynman gates
  wire [3:0] feynman_outputs;
  assign feynman_outputs[0] = peres_outputs[0];
  assign feynman_outputs[1] = peres_outputs[1];
  assign feynman_outputs[2] = peres_outputs[2] ^ peres_outputs[3];
  assign feynman_outputs[3] = peres_outputs[3];

  // Output
  assign product = feynman_outputs;

endmodule