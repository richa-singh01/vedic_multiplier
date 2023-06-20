`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 04:28:21 PM
// Design Name: 
// Module Name: KSA_8
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

module KoggeStoneAdder(
  input wire [7:0] a,
  input wire [7:0] b,
  input wire cin,
  output wire [7:0] sum,
  output wire cout
);

  wire [7:0] p, g, c;
  wire [7:0] pp, gg, cp;

  assign {pp[0], gg[0], cp[0]} = {a[0] ^ b[0], a[0] & b[0], cin};

  assign {p[0], g[0], c[0]} = {pp[0], gg[0], cp[0]};
  
  genvar i;
  
  generate
    for (i = 1; i < 8; i = i + 1) begin
      assign {pp[i], gg[i], cp[i]} = {a[i] ^ b[i] ^ g[i - 1], (a[i] & b[i]) | ((a[i] ^ b[i]) & g[i - 1]), (a[i] & b[i]) | ((a[i] ^ b[i]) & cp[i - 1])};
      assign {p[i], g[i], c[i]} = {pp[i] ^ (g[i - 1] & cp[i - 1]), gg[i] & cp[i - 1], gg[i] | (p[i] & cp[i - 1])};
    end
  endgenerate
  
  assign sum = {p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0]};
  assign cout = c[7];

endmodule