module Example_3(
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

// Definición de estados
parameter STATE_GREEN = 2'b00;
parameter STATE_YELLOW = 2'b01;
parameter STATE_RED = 2'b10;

// Registro de estado actual
reg [1:0] current_state;

// Contador de ciclos
reg [3:0] cycle_counter;

// Instancia del divisor de frecuencia
wire clk_div; // Señal de reloj dividida
DivFrec divisor(
    .clk(clk),
    .clk_div(clk_div)
);

// Lógica de transición de estados y salidas
always @(posedge clk_div or posedge reset) begin
    if (reset) begin
        current_state <= STATE_GREEN;
        cycle_counter <= 4'd0;
        red <= 0;
        yellow <= 0;
        green <= 1;
    end else begin
        case (current_state)
            STATE_GREEN: begin
                if (cycle_counter == 4'd3) begin
                    current_state <= STATE_YELLOW;
                    cycle_counter <= 4'd0;
                    red <= 0;
                    yellow <= 1;
                    green <= 0;
                end else begin
                    cycle_counter <= cycle_counter + 1'b1;
                    red <= 0;
                    yellow <= 0;
                    green <= 1;
                end
            end
            STATE_YELLOW: begin
                if (cycle_counter == 4'd1) begin
                    current_state <= STATE_RED;
                    cycle_counter <= 4'd0;
                    red <= 1;
                    yellow <= 0;
                    green <= 0;
                end else begin
                    cycle_counter <= cycle_counter + 1'b1;
                    red <= 0;
                    yellow <= 1;
                    green <= 0;
                end
            end
            STATE_RED: begin
                if (cycle_counter == 4'd5) begin
                    current_state <= STATE_GREEN;
                    cycle_counter <= 4'd0;
                    red <= 0;
                    yellow <= 0;
                    green <= 1;
                end else begin
                    cycle_counter <= cycle_counter + 1'b1;
                    red <= 1;
                    yellow <= 0;
                    green <= 0;
                end
            end
            default: begin
                current_state <= STATE_GREEN;
                cycle_counter <= 4'd0;
                red <= 0;
                yellow <= 0;
                green <= 1;
            end
        endcase
    end
end

endmodule

// Módulo del divisor de frecuencia
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