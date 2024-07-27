/*
	Proyecto: sumador3bits
	Archivo: sumador3bits.v
	Descripcion: contador ascendente/descendente de 3 bits
					 
	Asignatura: DSD
	Profesor: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				Garcia Quiroz Gustavo Ivan
				Huesca Laureano Josue Alejandro
				Muñoz Valdivia Irving Omar 
*/
module count(
    input clk_i,
    input rst_ni,
	 input dir_i,
    output [2:0] count
);

wire clk_div; // Reloj dividido por DivFreq

// Instancia del divisor de frecuencia
DivFreq #(
    .freqdev(10000000), // 10 MHz
    .freqfinal(10000000 / 4) // Dividido en 4
) div_freq (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .clk_o(clk_div)
);

reg [2:0] count_r;

// Contador de 3 bits ascendente
always @(posedge clk_div or negedge rst_ni) begin
    if (!rst_ni) begin
        count_r <= 3'b000; // Reinicia el contador
    end else if (!dir_i) begin
        count_r <= count_r + 1'b1; // Incrementa el contador
			  end else begin 
				count_r <= count_r - 1'b1;
    end
end

assign count = count_r; // Asigna la salida

endmodule