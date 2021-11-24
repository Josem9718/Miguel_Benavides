
module FlipFlop_D (

	input bit clk, rst,
	input logic en, d
	output logic q, q2

);

	`include "FFD_macro"

	`FFD(clk, "negedge", rst, en, d, q );
	
	`FFD(clk, "posedge", rst, en, d, q );

endmodule
