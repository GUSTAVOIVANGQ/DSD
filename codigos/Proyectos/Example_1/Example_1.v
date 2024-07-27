module Example_1#(
	parameter STATE_GREEN = 3'b000, //VERDE
	parameter STATE_YELLOW = 3'b010, //AMARIILO
	parameter STATE_RED = 3'b100 // ROJO
) 	//Solamente se pone punto y coma en donde acaba el modulo
(
	input						clk_i,
	input						rst_ni,
	input						x_i,
	output reg		[2:0] y_o
);
	reg		[2:0] actual_state_w;
	
	//Proceso secuencial para calcular estados
	always@(posedge clk_i,negedge rst_ni)
	begin
		if(!rst_ni)
			actual_state_w <= STATE_GREEN;
		else
			case(actual_state_w)
				STATE_GREEN:
					if(x_i)
						actual_state_w <= STATE_GREEN;
					else
						actual_state_w <= STATE_YELLOW;
				STATE_YELLOW:
					if(x_i)
						actual_state_w <= STATE_YELLOW;
					else
						actual_state_w <= STATE_RED;
				STATE_RED:
					if(x_i)
						actual_state_w <= STATE_RED;
					else
						actual_state_w <= STATE_GREEN;
			endcase
	end
	
	//Proceso para definir las salidas
	always@(*)
	begin
		case(actual_state_w)
			STATE_GREEN:
				y_o = 3'b001;
			STATE_YELLOW:
				y_o = 3'b010;
			STATE_RED:
				y_o = 3'b100;
		endcase
	end
	//

endmodule