//Device: ep4ce22F17c6

/*
	Proyecto:	FDD
	Archivo:		FDD.V
	Descripcion: Descripcion de un Flip Flop D
	Asignatura:	DSD
	Prof: 		Toño
	Equipo:		Luis Gerardo Herrera Avila
*/

module FFT(
	input clk_i,
	input rst_i,
	input t_i,
	output reg q_o
);
	//definicion de un flip flop D 
	always @(posedge clk_i, posedge rst_i)
	begin
		if (rst_i)
			q_o <=1'b0;
		else
		if (t_i)
			q_o <= ~q_o;
			else
			q_o <= q_o;
	end
endmodule