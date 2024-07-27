module romboard #(
    parameter D = 8, // Deeph
    parameter W = 32 // Word
) (
    input [D-1:0] addr_i,
    input         rden_i,
    input         byteseclector_i,
    output [6:0]  display_o
);

wire [W-1:0] dato_w;
reg [3:0] displayseclector_i_o;

rom #(
    .D(D), // Deeph
    .W(W)  // Word
) rom_u (
    .addr_i(addr_i),
    .rden_i(rden_i),
    .dato_o(dato_w)
);

always @(*) begin
    case (byteseclector_i)
        3'b000: displayseclector_i_o = dato_w[3:0];
        3'b001: displayseclector_i_o = dato_w[7:4];
        3'b010: displayseclector_i_o = dato_w[11:8];
        3'b011: displayseclector_i_o = dato_w[15:12];
        3'b100: displayseclector_i_o = dato_w[19:16];
        3'b101: displayseclector_i_o = dato_w[23:20];
        3'b110: displayseclector_i_o = dato_w[27:24];
        3'b111: displayseclector_i_o = dato_w[31:28];
        default: displayseclector_i_o = {D[4'hF]};
    endcase
end

endmodule