module div_freq(
    input clk_in,
    output reg clk_out
);

parameter DIVISOR = 10000000; // Valor del divisor (ajusta según sea necesario)

reg [31:0] contador;

always @(posedge clk_in) begin
    if (contador == DIVISOR - 1) begin
        contador <= 0;
        clk_out <= ~clk_out;
    end else begin
        contador <= contador + 1;
    end
end

endmodule