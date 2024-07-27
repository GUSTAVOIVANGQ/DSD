/*
	Proyecto: MemoriaRAM
	Archivo: MemoriaRAM_fpga.v
	Descripcion: Descripcion de una MemoriaRAM
					parametrizable con puertos separados para lectura y escritura
	Asignatura: DSD
	Prof: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				García Quiroz Gustavo Iván
				Huesca Laureano Josué Alejandro
				Muñoz Valdivia Irving Omar
				Pedroza Villagómez Emir*/
module MemoriaRAM_fpga #(
    parameter N = 4,
    parameter M = 4
)
(
    // Señales generales
    input wire 			clk_i,
	 input wire				rst_i,
    input wire [N-1:0] 	addr_i,
    // Señales del puerto de lectura
    input wire 			rden_i,
    output wire [M-1:0] dato_read_o,
    // Señales del puerto de escritura
    input wire [M-1:0] 	dato_write_i,
    input wire 			wren_i,
    // Salidas del display
    output wire [0:6] 	display_o,
    output wire 			display_enable
);
	
	// Seccion de definicion de señales
	wire 			slow_clk;
	
	// Instancia de la memoria RAM
    MemoriaRAM #(
        .N(N),
        .M(M)
    )RAM_U0(
        .clk_i(clk_i),
		  .rst_i(rst_i),
        .addr_i(addr_i),
        .rden_i(rden_i),
        .dato_read_o(dato_read_o),
        .dato_write_i(dato_write_i),
        .wren_i(wren_i)
    );
	
    // Instancia del divisor de frecuencia
    DivFreq #(
        .freqdev(10_000_000),	// Frecuencia de desarrollo de 10MHz
        .freqfinal(4)			// Frecuencia final dividida en 4
    )div_freq_instance(
        .clk_i(clk_i),
        .rst_ni(rst_i),
        .clk_o(slow_clk)		// Salida de reloj dividido
    );

    // Instancia del display
    display display_instance (
        .cuenta_i		(dato_read_o), 
        .enable_i		(1'b1),			// Habilitamos el display siempre
        .display_o	(display_o),
        .daenable_o	(display_enable)
    );

endmodule
