/*	Proyecto: MemoriaRAM
	Archivo: DivFreq.v
	Descripcion: Descripcion de un divisor de frecuencia
	Asignatura: DSD
	Prof: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				García Quiroz Gustavo Iván
				Huesca Laureano Josué Alejandro
				Muñoz Valdivia Irving Omar
				Pedroza Villagómez Emir*/
module DivFreq #(
    parameter freqdev = 10_000_000, // 10MHz
    parameter freqfinal = 4 // freqdev Dividido en 4
)(
    input clk_i,
    input rst_ni,
    output reg clk_o);
    reg [31:0] counter_r;	 
    always @(posedge clk_i or posedge rst_ni) begin
        if (rst_ni) begin
            counter_r <= 32'b0;
            clk_o <= 1'b1; // Comenzamos con el reloj en bajo
        end else begin
		  if (counter_r == (32'd10_000)) begin
            counter_r <= 32'b0;
            clk_o <= ~clk_o;
        end else begin
            counter_r <= counter_r + 32'b1;
        end
		  end
    end
endmodule
