

module Mux_param_type #(


      parameter type IN_TYPE,
		parameter type OUT_TYPE,
		parameter 	IN_NUM,
		parameter	WIDTH_SEL = $clog2(IN_NUM)
		
) 
(
input [WIDTH_SEL-1:0]	Select,
input IN_TYPE		      Entry,
output OUT_TYPE				Out
);

assign Out = Entry[Select];

endmodule

//module MuxPar #(
//		parameter type T = logic, parameter SEL = 2)(Entry, Selec, Out);
//
//input T Entry[2**SEL];
//input [SEL-1:0] Selec;
//output Out;
//
//assign Out = Entry[Selec];
//
//endmodule 

