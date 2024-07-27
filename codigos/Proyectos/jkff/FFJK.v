/*
	Proyecto: FFJK
	Archivo: FFJK.v
	Descripcion: Descripcion de un FFJK
	Asignatura: DSD
	Prof: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				Garcia Quiroz Gustavo Ivan
				Huesca Laureano Josue Alejandro
				Muñoz Valdivia Irving Omar 
*/
module FFJK(
	input			clk_i,
	input			rst_i,
	input			j_i,
	input			k_i,
	output reg	q_o,
	output		qn_o
);
	//wire	[1:0]	jk_w;
	//assign		jk_w;	=	{j,k};
	//case ()
		// J|K
		assign qn_o = ~q_o;
	always @(posedge clk_i, posedge rst_i)
	begin
		if(rst_i)
			q_o <= 1'b0;
		else
			case	({j_i,k_i})
				2'b00:	q_o	<=	q_o;
				2'b10:	q_o	<=	1'b1;
				2'b01:	q_o	<=	1'b0;
				2'b11:	q_o	<=	~q_o;
			endcase
	end
endmodule
