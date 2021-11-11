///// Modulo Mux 2 to 1/////
////--MIGUEL BENAVIDES--/////


module multiplexor
#( 
		parameter DW = 2
)

(
	input input_x, // selector
	input logic [DW-1:0] input_a, input_b,
	output logic [DW-1:0]output_y
);


assign output_y = (input_x) ? input_a : input_b;

endmodule 






