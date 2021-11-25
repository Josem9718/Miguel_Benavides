///// Severity Task \\\\\
///// Miguel Benavides \\\\\

`define ERROR(error = "warning", fnum )\

generate case(``error)\

	"warning" : begin\
		$warning("Warning");\
	end\

	"info" : begin\
		$info("Info");\
	end\

	"error" : begin\
		$error("error");\
	end\

	"fatal": begin\
		if(``error == 0)\ 
		$fatal("Fatal. Finish Number: 0");\

		else if(``fnum == 1)\ 
		$fatal("Fatal. Finish Number: 1");\
	
		else\ 
		$fatal("Fatal. Finish Number: 2");\
		end\

endcase endgenerate

// terminar con "\"
