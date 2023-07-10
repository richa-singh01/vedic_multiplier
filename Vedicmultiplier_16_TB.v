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

module vedic16_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [31:0] q;

	// Instantiate the Unit Under Test (UUT)
	Vedic_16bit uut (
		.a(a), 
		.b(b), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		a= 16'b1010111101011101; b= 16'b0011001110101011; #250;
		a= 16'b0110100101011101; b= 16'b1000111100001011; #250;
		a= 16'b0101110110000100; b= 16'b1101111010000000; #250;
		a= 16'b0001010001110001; b= 16'b1111110111111111; #250;
		a= 16'b1100011011010100; b= 16'b0011000110011000; #250;

	end
      
endmodule
