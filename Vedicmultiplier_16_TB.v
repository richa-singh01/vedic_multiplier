`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 07:35:57 PM
// Design Name: 
// Module Name: Vedicmultiplier_16_TB
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

module VedicMultiplier16_TB();

  reg [15:0] a;
  reg [15:0] b;
  wire [31:0] product;

  // Instantiate the Vedic Multiplier module
  VedicMultiplier_16x16 dut (
    .multiplicand(a),
    .multiplier(b),
    .product(product)
  );

  initial begin
    // Initialize input values
    a = 16'h1234;
    b = 16'h5678;

    // Wait for some time to allow for computation
    #10;

    // Display the input values
    $display("Input a: %h", a);
    $display("Input b: %h", b);

    // Display the output product
    $display("Product: %h", product);

    // Finish simulation
    $finish;
  end

endmodule