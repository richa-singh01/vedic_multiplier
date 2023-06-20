`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 06:52:14 PM
// Design Name: 
// Module Name: KSA_16
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

module KoggeStoneAdder_16(
  input [15:0] a,
  input [15:0] b,
  input cin,
  output [15:0] sum,
  output cout
);

  wire [15:0] p, g, c;
  wire [15:0] pp, gg, cp;
  
  assign pp[0] = a[0] ^ b[0];
  assign gg[0] = a[0] & b[0];
  assign cp[0] = cin;

  assign p[0] = pp[0];
  assign g[0] = gg[0];
  assign c[0] = cp[0];
  
  genvar i;
  
  generate
    for (i = 1; i < 16; i = i + 1) begin
      assign pp[i] = a[i] ^ b[i] ^ g[i - 1];
      assign gg[i] = (a[i] & b[i]) | ((a[i] ^ b[i]) & g[i - 1]);
      assign cp[i] = (a[i] & b[i]) | ((a[i] ^ b[i]) & cp[i - 1]);
      
      assign p[i] = pp[i] ^ (g[i - 1] & cp[i - 1]);
      assign g[i] = gg[i] & cp[i - 1];
      assign c[i] = gg[i] | (p[i] & cp[i - 1]);
    end
  endgenerate
  
  assign sum = {p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0]};
  assign cout = c[15];

endmodule