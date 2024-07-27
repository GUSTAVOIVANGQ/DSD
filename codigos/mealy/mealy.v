
module mealy #(
	parameter	iole 			= 2'b00,
	parameter	intermedio1 = 2'b01,
	parameter	intermedio2 = 2'b10,
	parameter	final 		= 2'b11
)
(
	input 				clk_i,
	input 				rst_ni,
	input 				x_i,
	output reg [1:0]	y_o
);
	reg [1:0]	actual_state_w;
	
//always@(x_i, actual_state_w)
always@(posedge clk_i, negedge rst_ni)
	begin
			if(!rst_ni)
			begin
			actual_state_w <= iole;
			end
			else
			begin
			case(actual_state_w)
			iole:
				if(x_i)
					actual_state_w<= intermedio1;
					else
					actual_state_w<= intermedio1;
			intermedio1:
				if(x_i)
					actual_state_w<= intermedio2;
					else
					actual_state_w<= intermedio1;
			intermedio2:
				if(x_i)
					actual_state_w<= final;
					else
					actual_state_w<= intermedio1;
			final:
				if(x_i)
					actual_state_w<= intermedio2;
					else
					actual_state_w<= final;
			endcase
			end
	end

//always@(x_i, actual_state_w)
always@(*)
	begin
		case(actual_state_w)
			iole:
				if(x_i)
					y_o <= 2'b00;
					else
					y_o <= 2'b10;
			intermedio1:
				if(x_i)
					y_o<= 2'b01;
					else
					y_o<= 2'b10;
			intermedio2:
				if(x_i)
					y_o<= 2'b11;
					else
					y_o<= 2'b01;
			final:
				if(x_i)
					y_o<= 2'b11;
					else
					y_o<= 2'b01;
		endcase
	end
endmodule
