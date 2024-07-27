/*
	Proyecto: MemoriaRAM
	Archivo: MemoriaRAM.v
	Descripcion: Descripcion de una MemoriaRAM
					parametrizable con puertos separados 
					para lectura y escritura
	Asignatura: DSD
	Prof: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				García Quiroz Gustavo Iván
				Huesca Laureano Josué Alejandro
				Muñoz Valdivia Irving Omar
				Pedroza Villagómez Emir
*/
module MemoriaRAM #(
	parameter N = 4,
	parameter M = 4
)

(
	//Señales generales
	input					clk_i,
	input					rst_i,
	input		[N-1:0]	addr_i,
	//Señales del puerto de lectura
	input					rden_i,
	output	[M-1:0]	dato_read_o,
	//Señales del puerto de escritura
	input		[M-1:0]	dato_write_i,
	input					wren_i
);

	//Definicion de la memoria
	reg	[M-1:0]	RAM	[0:2**N-1];
	
	//Definición de vector de validación
	reg	[0:2**N-1]	VALID;
	
	//Inicializacion de la memoria
	initial
	begin
		$readmemh("ram_init.hex", RAM);
	end
	
	//Puerto de escritura
	always @(posedge clk_i, posedge rst_i)
	begin
		if(rst_i)
			VALID <= 16'b0011111100011101;
		else	
			if(wren_i)
				RAM[addr_i] <= dato_write_i;
	end
	
	//Puerto de lectura
	assign dato_read_o = (rden_i && VALID[addr_i]) ? RAM[addr_i] : {M{1'b0}};
	
endmodule	
`timescale 100ps / 1ps

module MemoriaRAM_tb();

// Parámetros
parameter N = 4;
parameter M = 4;

// Señales de prueba
reg clk_i;
reg rst_i;
reg [N-1:0] addr_i;
reg rden_i;
wire [M-1:0] dato_read_o;
reg [M-1:0] dato_write_i;
reg wren_i;

integer i; // Variable para bucles

// Instancia del módulo bajo prueba
MemoriaRAM #(
    .N(N),
    .M(M)
) uut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .addr_i(addr_i),
    .rden_i(rden_i),
    .dato_read_o(dato_read_o),
    .dato_write_i(dato_write_i),
    .wren_i(wren_i)
);

// Generación de reloj
initial begin
    clk_i = 0;
    forever #1 clk_i = ~clk_i; // Período de reloj de 2ns
end

// Procedimiento de prueba
initial begin
    // Inicialización
    rst_i = 1;
    addr_i = 0;
    rden_i = 0;
    dato_write_i = 0;
    wren_i = 0;
    
    // Liberación del reset
    #10 rst_i = 0;
    
    // Lectura de valores iniciales
    #2;
    for (i = 0; i < 16; i = i + 1) begin
        addr_i = i;
        rden_i = 1;
        #2;
        $display("Dirección %0d: %h", addr_i, dato_read_o);
    end
    
    // Escritura de nuevos valores
    #2;
    wren_i = 1;
    for (i = 0; i < 16; i = i + 1) begin
        addr_i = i;
        dato_write_i = i + 1;
        #2;
    end
    wren_i = 0;
    
    // Lectura de nuevos valores
    #2;
    for (i = 0; i < 16; i = i + 1) begin
        addr_i = i;
        rden_i = 1;
        #2;
        $display("Dirección %0d después de escritura: %h", addr_i, dato_read_o);
    end
    
    // Fin de la simulación
    #20 $finish;
end

// Monitoreo de señales
initial begin
    $monitor("Tiempo=%0t, Addr=%h, Read=%b, Write=%b, DataIn=%h, DataOut=%h",
             $time, addr_i, rden_i, wren_i, dato_write_i, dato_read_o);
end

endmodule