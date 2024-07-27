module DivFrec(
    input clk,
    output reg clk_div
);

parameter DIVISOR = 100000000; // Valor para dividir la frecuencia del reloj

reg [31:0] contador = 0;

always @(posedge clk) begin
    if (contador == DIVISOR - 1) begin
        contador <= 0;
        clk_div <= ~clk_div;
    end else begin
        contador <= contador + 1;
    end
end

endmodule