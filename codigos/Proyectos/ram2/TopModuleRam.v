module TopModuleRam (
    input wire clk_in,      // Reloj de entrada de la FPGA
    input wire rst_i,       // Señal de reinicio
    output wire [6:0] seg,   // Salida al display de 7 segmentos
	 input wire addr_i,
	 input wire rden_i,
	 input wire wren_i,
	 input wire dato_write_i
);

    // Señal de reloj dividido
    wire clk_div;
    wire [3:0] ram_out;

    // Instancia del divisor de frecuencia
    DivisorFrecuencia #(
        .freqdev(10000000),      // Frecuencia de desarrollo, por ejemplo 10 MHz
        .freqfinal(2500000)      // Frecuencia final, por ejemplo 2.5 MHz
    ) divisor_frecuencia_inst (
        .clk_in(clk_in),
        .rst_i(rst_i),
        .clk_o(clk_div)
    );

    // Instancia de la memoria RAM
    MemoriaRAM memoria_ram_inst (
        .clk_i(clk_div),
        .addr_i(addr_i),   // Dirección de ejemplo
        .rst_i(rst_i),
        .rden_i(rden_i),      // Lectura habilitada
        .dato_read_O(ram_out),
        .dato_write_i(dato_write_i), // Datos de ejemplo para escritura
        .wren_i(wren_i)       // Escritura deshabilitada
    );

    // Instancia del convertidor BCD a 7 segmentos
    SieteSegmentos bcd_to_7segment_inst (
        .bcd(ram_out),
        .seg(seg)
    );

endmodule