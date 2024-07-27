module bcd2(
    input clk_i,
    input reset_i,
    input j_i,
    input k_i,
    output [3:0] q_o,
    output [3:0] q_no
);

// Cables internos
wire jb3_w;

// Bit 0
jk jk_bcd0(
    .clk_i(clk_i),
    .reset_i(reset_i),
    .j_i(j_i),
    .k_i(k_i),
    .q_o(q_o[0]),
    .q_no(q_no[0])
);

// Bit 1
jk jk_bcd1(
    .clk_i(q_o[0]),
    .reset_i(reset_i),
    .j_i(j_i),
    .k_i(k_i),
    .q_o(q_o[1]),
    .q_no(q_no[1])
);

// Bit 2
jk jk_bcd2(
    .clk_i(q_o[1]),
    .reset_i(reset_i),
    .j_i(j_i),
    .k_i(k_i),
    .q_o(q_o[2]),
    .q_no(q_no[2])
);

// Lógica para resetear el contador después de 9
and and_u1(jb3_w, q_o[1], q_no[2]);

// Bit 3
jk jk_bcd3(
    .clk_i(q_o[0]),
    .reset_i(reset_i | jb3_w),
    .j_i(j_i),
    .k_i(k_i),
    .q_o(q_o[3]),
    .q_no(q_no[3])
);

endmodule

module tb_jk_bcd();

reg clk_i;
reg reset_i;
reg j_i;
reg k_i;
wire [3:0] q_o;
wire [3:0] q_no;

// Instancia del módulo bcd2
bcd2 dut(
    .clk_i(clk_i),
    .reset_i(reset_i),
    .j_i(j_i),
    .k_i(k_i),
    .q_o(q_o),
    .q_no(q_no)
);

// Inicialización de señales
initial begin
    clk_i = 1'b1;
    reset_i = 1'b1;
    j_i = 1'b1;
    k_i = 1'b1;
    #100 reset_i = 1'b0; // Deshabilitar reset después de 100 unidades de tiempo
end

// Generación de reloj
always #5 clk_i = ~clk_i; // Período de reloj de 10 unidades de tiempo

endmodule