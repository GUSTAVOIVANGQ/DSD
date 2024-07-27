module gray_counter
#(parameter WIDTH=8)
(
    input clk,
    input enable,
    input reset,
    output reg [WIDTH-1:0] resultado_o,
    output reg [6:0] segmentos_o
);

reg q [WIDTH-1:-1];
reg no_ones_below [WIDTH-1:-1];
reg q_msb;
integer i;
integer j;
integer k;

// Instancia del módulo DivFreq
wire clk_div;
DivFreq #(
    .freqdev(10000000),
    .freqfinal(2500000)
) div_freq (
    .clk_i(clk),
    .rst_ni(reset),
    .clk_o(clk_div)
);

always @ (posedge reset or posedge clk_div)
begin
    if (reset)
    begin
        q[-1] <= 1;
        for (i = 0; i <= WIDTH-1; i = i + 1)
            q[i] <= 0;
    end
    else if (enable)
    begin
        q[-1] <= ~q[-1];
        for (i = 0; i < WIDTH-1; i = i + 1)
        begin
            q[i] <= q[i] ^ (q[i-1] & no_ones_below[i-1]);
        end
        q[WIDTH-1] <= q[WIDTH-1] ^ (q_msb & no_ones_below[WIDTH-2]);
    end
end

always @(*)
begin
    no_ones_below[-1] <= 1;
    for (j = 0; j < WIDTH-1; j = j + 1)
        no_ones_below[j] <= no_ones_below[j-1] & ~q[j-1];
    q_msb <= q[WIDTH-1] | q[WIDTH-2];
    for (k = 0; k < WIDTH; k = k + 1)
        resultado_o[k] <= q[k];
    
    // Decodificador para controlar el display de 7 segmentos
    case (resultado_o)
        4'b0000: segmentos_o = 7'b0000001; // 0
        4'b0001: segmentos_o = 7'b1001111; // 1
        4'b0011: segmentos_o = 7'b0010010; // 2
        4'b0010: segmentos_o = 7'b0000110; // 3
        4'b0110: segmentos_o = 7'b1001100; // 4
        4'b0111: segmentos_o = 7'b0100100; // 5
        4'b0101: segmentos_o = 7'b0100000; // 6
        4'b0100: segmentos_o = 7'b0001111; // 7
        4'b1100: segmentos_o = 7'b0000000; // 8
        4'b1101: segmentos_o = 7'b0000100; // 9
        default: segmentos_o = 7'b1111111; // Apagado
    endcase
end

endmodule
