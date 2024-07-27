/*
	Proyecto:	Tarjeta
	Archivo:		FDD_FPGA.V
	Descripcion: Descripcion de un Flip Flop D en un FPGA
					 Entrada en serie-Salida en serie
	Asignatura:	DSD
	Prof: 		Toño
	Equipo:		Luis Gerardo Herrera Avila
*/

module T(
	input	switch_i,
	input push_i,
	output led1_o,
	output led2_o
);
assign led1_o = push_i;
assign led2_o = switch_i;
endmodule
