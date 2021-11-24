///// Severity Task \\\\\
///// Miguel Benavides \\\\\

`define ERROR(error = "warning", fnum )\

generate case(``error)\

	"warning" : begin\
		$display("Warning");\
	end\

	"info" : begin\
		$display("Info");\
	end\

	"error" : begin\
		$display("error");\
	end\

	"fatal": begin\
		if(``error == 0)\ 
		$display("Fatal. Finish Number: 0");\

		else if(``fnum == 1)\ 
		$display("Fatal. Finish Number: 1");\
	
		else\ 
		$display"Fatal. Finish Number: 2");\
		end\

endcase endgenerate

// terminar con "\"
