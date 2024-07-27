/*
	Proyecto:		FDD
	Archivo:			DivFreq.v
	Descripcion: 	Descripcion de un DivFreq
	Asignatura:		DSD
	Profesor: 		Toño
	Equipo:			Alexis Haziel Bueno Aguilar
						Álvarez Hernández Gabriel Alexander
						Garcia Quiroz Gustavo Ivan
						Huesca Laureano Josue Alejandro
						Muñoz Valdivia Irving Omar
*/
module DivFreq(
input		clk_i,
input		rst_i,
output reg clk_o
);
	//Definicion señales
	reg [31:0] ctr;
	//contador
	always @(posedge clk_i, posedge rst_i)
	begin
		if (rst_i)
			begin
				ctr <= 32'b0;
				clk_o <= 1'b1;
			end
		else
			begin
				if(ctr <= 32'd25_000_000)
					begin
						ctr <= 32'b0;
						clk_o <= ~clk_o;
					end
				else
					ctr <= ctr + 1'b1;
			end
	end
endmodule 