//FDD_ctrl.v
/* Proyecto: FDD
	Archivo: DivFreq.v
	Descripcion: Descripcion de un flip flop D
	Asignatura: DSD
	Asignatura: DSD
	Prof: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				Garcia Quiroz Gustavo Ivan
				Huesca Laureano Josue Alejandro
				Muñoz Valdivia Irving Omar */
module FFD_ctrl(
	input		serialin_i,
	input		move_i,
	input		move_ni,
	input		parallelin_i,
	input		clk_i,
	input		rst_i,
	output	q_o
	
);
	//Salida de la 1ra AND Gate
	wire 		andoutft1_w;
	assign	andoutft_w = serialin_i & move_ni;
	
	//Salida de la 2ra AND Gate
	wire 		andoutft2_w;
	assign	andoutft2_w = move_i & parallelin_i;
	
	//salida de la OR Gate
	wire 		orout_w;
	assign 	orout_w = andoutft1_w | andoutft2_w;
	
endmodule