/*
	Proyecto: FFJK
	Archivo: FFJK.v
	Descripcion: Descripcion de un FFJK
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
module FFJK(
            input                            clk_i,
            input                            rst_i,
            input                            j_i,
            input                            k_i,
            output reg       q_o,
            output              qn_o
);
            //wire   [1:0]     jk_w;
            //assign                       jk_w;    =          {j,k};
            //case ()
                        // J|K
                        assign qn_o = ~q_o;
            always @(posedge clk_i, posedge rst_i)
            begin
                        if(rst_i)
                                   q_o <= 1'b0;
                        else
                                   case    ({j_i,k_i})
                                               2'b00:  q_o      <=       q_o;
                                               2'b10:  q_o      <=       1'b1;
                                               2'b01:  q_o      <=       1'b0;
                                               2'b11:  q_o      <=       ~q_o;
                                   endcase
            end
endmodule
`timescale 1ps / 1ps

module FFJK_tb();

// Señales para conectar con el módulo FFJK
reg clk_i;
reg rst_i;
reg j_i;
reg k_i;
wire q_o;
wire qn_o;

// Instancia del módulo FFJK
FFJK uut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .j_i(j_i),
    .k_i(k_i),
    .q_o(q_o),
    .qn_o(qn_o)
);

// Generación del reloj (período de 100 ps)
always begin
    #50 clk_i = ~clk_i; // Medio período es 50 ps
end

// Proceso de estímulos
initial begin
    // Inicialización de señales
    clk_i = 0;
    rst_i = 1;
    j_i = 0;
    k_i = 0;
    
    // Liberación del reset
    #200 rst_i = 0;
    
    // Prueba de diferentes combinaciones
    #200 j_i = 0; k_i = 0; // No cambio
    #200 j_i = 1; k_i = 0; // Set
    #200 j_i = 0; k_i = 1; // Reset
    #200 j_i = 1; k_i = 1; // Toggle
    #200 j_i = 0; k_i = 0; // No cambio
    
    // Prueba de reset asíncrono
    #200 rst_i = 1;
    #100 rst_i = 0;
    
    // Más pruebas
    #200 j_i = 1; k_i = 0;
    #200 j_i = 1; k_i = 1;
    
    // Fin de la simulación
    #200 $finish;
end

endmodule