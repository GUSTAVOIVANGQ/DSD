module DivisorFrecuenciaRam #(
    parameter freqdev = 10000000, // Frecuencia de desarrollo, por ejemplo 10 MHz
    parameter freqfinal = freqdev / 4 // Frecuencia final, por ejemplo 2.5 MHz
)(
    input wire clk_in,  // Reloj de entrada
    input wire rst_i,   // Señal de reinicio activa en baja
    output reg clk_o    // Reloj de salida dividido
);

    reg [31:0] counter_r;

    always @(posedge clk_in or negedge rst_i) begin
        if (!rst_i) begin
            counter_r <= 32'b0;
            clk_o <= 1'b0;
        end else begin
            if (counter_r == freqfinal) begin
                counter_r <= 32'b0;
                clk_o <= ~clk_o;
            end else begin
                counter_r <= counter_r + 1'b1;
            end
        end
    end

endmodule