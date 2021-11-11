`timescale 10ps/1ps 

// Testbench del multiplexor 2 to 1 // --MIGUEL BENAVIDES-- //

module TB_mux();
	// Inputs
    parameter DW = 2;
    reg [DW-1:0] Ia, Ib;
    reg sel;
    integer a_gold, Num_errors;
	 integer i, j, k; //representan los operandos

    // OutputS
    wire [DW-1:0] s;

	// Instanciacion del DUT
   multiplexor M1(
		.input_x(sel), 
		.input_a(Ia), 
		.input_b(Ib), 
		.output_y(s)
	);

	// Inicializaci�n de las entradas
    `ifdef auto_init
        initial begin
            i = 0; j = 0; k =0;
				sel=i; Ia=j; Ib=k;
				#1;
        end
    `endif
	 
initial #1000 $finish;
initial Num_errors = 0;

initial begin
for (i = 0; i <= 1; i = i + 1) begin
 for (j = 0; j < 2**DW; j = j + 1)begin
  for (k = 0; k < 2**DW; k = k + 1)begin


	sel=i; Ia=j; Ib=k;
	
	if (i==1)
	begin	
		a_gold= j;
	end	
	else
	begin
		a_gold=k;
	end
	 

	#1 if (s ^ a_gold) begin  
	Num_errors = Num_errors + 1;
	$display ("Error: select = %b", i);
	$display ("Error: Ia = %d   Ib = %d ", j, k);
	$display ("Error: Valor Esperado = %h  Valor obtenido = %h", a_gold, s);

end
end
end
end
	$display ("Num_errors = %d", Num_errors);
end	  
endmodule

