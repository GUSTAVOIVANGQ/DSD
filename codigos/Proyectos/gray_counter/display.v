module display
(
    input [3:0] 		cuenta_i,
    input 				enable_i,
    output reg [6:0] display_o
);
reg [6:0] display_x;
always @(*)
begin
    // Decodificador para controlar el display de 7 segmentos
    case (cuenta_i)
        4'b0000: display_o = 7'b0000001; // 0
        4'b0001: display_o = 7'b1001111; // 1
        4'b0011: display_o = 7'b0010010; // 2
        4'b0010: display_o = 7'b0000110; // 3
        4'b0110: display_o = 7'b1001100; // 4
        4'b0111: display_o = 7'b0100100; // 5
        4'b0101: display_o = 7'b0100000; // 6
        4'b0100: display_o = 7'b0001111; // 7
        4'b1100: display_o = 7'b0000000; // 8
        4'b1101: display_o = 7'b0000100; // 9
        4'b1010: display_o = 7'b0001000; // A
        4'b1011: display_o = 7'b1100000; // B
        4'b1110: display_o = 7'b0110000; // C
        4'b1111: display_o = 7'b1000010; // D
        default: display_o = 7'b1111111; // Apagado
    endcase
end

endmodule 
