`timescale 1ns / 1ps

module MuxparamTB();

	parameter I_NUM1 = 2;
	parameter w_SEL1 = $clog2(I_NUM1);
	parameter I_NUM2 = 4;
	parameter w_SEL2 = $clog2(I_NUM2);
	
	typedef enum logic [1:0] {EXECUTE, FETCH, DECODE, WB} op_codes_e_t;
	
	typedef struct packed{
			logic [7:0] addr;
			logic [3:0] data;
			enum {RD,WR} op;	
	}mem_ctl_st_t;
	
	
	op_codes_e_t [I_NUM1-1:0]  data1;
	logic  [W_SEL1-1:0]	sel1;
	op_codes_e_t   mux_out1;
	
	mem_ctl_st_t [I_NUM2-1:0]  data2;
	logic  [W_SEL2-1:0]	sel2;
	mem_ctl_st_t	mux_out2;
	
	Mux_param_type #( .IN_NUM (I_NUM1), .IN_TYPE (op_codes_e_t[I_NUM1-1:0]), .OUT_TYPE(op_codes_e_t))UUT1(
			
			.Select (sel1),			
			.Entry(data1),
			.Out(mux_out1)
			
			);
					
	Mux_param_type #( .IN_NUM (I_NUM2), .IN_TYPE (mem_ctl_st_t[I_NUM2-1:0]), .OUT_TYPE(mem_ctl_st_t))UUT2(
			
			.Select (sel2),			
			.Entry(data2),
			.Out(mux_out2)
			
			);
						
	initial begin
		integer idx;
		#1
		for(idx = 0; idx <  I_NUM2; idx++) begin
					if(idx <2)begin
							
							data1[0] = EXECUTE;
							data1[1] = FETCH;
							
							sel1 = idx;
					end
					else begin
					
							data1[0] = DECODE;
							data1[1] = WB;
							
							sel1 = idx - 2;
					end
					
							
					data2[0].addr = 'b00000011;
					data2[0].data = 'b0001;
					data2[0].op = RD; 
					data2[1].addr = 'b00001100;
					data2[1].data = 'b0001;
					data2[1].op = WR;
					data2[2].addr = 'b00110000;
					data2[2].data = 'b0001;
					data2[2].op = RD;
					data2[3].addr = 'b11000000;
					data2[3].data = 'b0001;
					data2[3].op	= WR;
					
					
					sel2 = idx;

				#1;	
					end
			end 
endmodule					
					
					

		
	
	
	
			