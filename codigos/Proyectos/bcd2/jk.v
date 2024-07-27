/*
	Proyecto:	FFJK
	Archivo:		FFJK.V
	Descripcion: Descripcion de un Flip Flop JK
	Asignatura:	DSD
	Prof: 		Toño
	Equipo:		Luis Gerardo Herrera Avila
*/

module jk(
	input clk_i,
	input reset_i,
	input j_i,
	input k_i,
	output reg q_o,
	output reg q_no
);


	//definicion de un flip flop D 
	always @(posedge clk_i)
	begin

	case({j_i,k_i})
	2'b00: q_o <= q_o;
	2'b01: q_o <= 1'b0;
	2'b10: q_o <= 1'b1;
	2'b11: q_o <= ~q_o;
	endcase

	
	end
endmodule