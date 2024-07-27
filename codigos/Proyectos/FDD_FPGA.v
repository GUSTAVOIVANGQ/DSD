/*
	Proyecto:	FDD
	Archivo:		FDD_FPGA.V
	Descripcion: Descripcion de un Flip Flop D en un FPGA
					 Entrada en serie-Salida en serie
	Asignatura:	DSD
	Prof: 		Toño
	Equipo:		Luis Gerardo Herrera Avila
*/

module FDD_FPGA(
	input	clk_i,
	input rst_i,
	input d_i,
	output q_o
);
	//Declaracion de señales
	wire			ff1q_ff2d;
	wire			ff2q_ff3d;
	wire			ff3q_ff4d;
	wire 			clk_df;
	
	//Instancia del divisor de frecuencias
	DivFreq DF(
		.clk_i		(clk_i),
		.rst_i		(rst_i),
		.clk_o		(clk_df)
);

	//Instancia el 1er FFD
	FFD FFD1(
		.d_i		(d_i),
		.clk_i	(clk_df),
		.rst_i	(rst_i),
		.q_o		(ff1q_ff2d)
);


FFD FFD2(
		.d_i		(ff1q_ff2d),
		.clk_i	(clk_df),
		.rst_i	(rst_i),
		.q_o		(ff2q_ff3d)
);


FFD FFD3(
		.d_i		(ff2q_ff3d),
		.clk_i	(clk_df),
		.rst_i	(rst_i),
		.q_o		(ff3q_ff4d)
);

FFD FFD4(
		.d_i		(ff3q_ff4d),
		.clk_i	(clk_df),
		.rst_i	(rst_i),
		.q_o		(q_o)
);
	
endmodule
