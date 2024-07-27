/*
	Proyecto:		FDD
	Archivo:			FDD.v
	Descripcion: 	Descripcion de un Flip Flop D
	Asignatura:		DSD
	Profesor: 		Toño
	Equipo:			Alexis Haziel Bueno Aguilar
						Álvarez Hernández Gabriel Alexander
						Garcia Quiroz Gustavo Ivan
						Huesca Laureano Josue Alejandro
						Muñoz Valdivia Irving Omar
*/
module FFD(
	input d_i,
	input clk_i,
	input rst_i,
	output reg q_o
);
	//definicion de un flip flop D 
	always @(posedge clk_i, posedge rst_i)
	begin
		if (rst_i)
			q_o <=1'b0;
		else
			q_o <= d_i;
	end
endmodule