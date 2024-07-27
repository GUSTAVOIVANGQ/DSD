module ROM_Board#(
    parameter D = 3,
    parameter W = 32
)
(
    input  wire [D-1:0] addr_i,          // switch 1,2,3
    input  wire         rden_i,          // read enable
    input  wire [D-1:0] byteselector_i,  // byte selector
    output wire [0:6]   display_o,       // display output
	 output wire display_enable
);
    // Sección de definición de señales
    wire [W-1:0] dato_w;
    reg  [3:0]   datodisplay_o;          // Dato que se va a mostrar
    wire         slow_clk;

    // Instancia de la ROM
    ROM #(
        .D (D),
        .W (W)
    )
    ROM_U0 (
        .addr_i (addr_i),
        .rden_i (rden_i),
        .dato_o (dato_w)
    );

    // Sección de selección de byte
    always @(*) begin
        case(byteselector_i)
            3'b000: datodisplay_o = dato_w[3:0];
            3'b001: datodisplay_o = dato_w[7:4];
            3'b010: datodisplay_o = dato_w[11:8];
            3'b011: datodisplay_o = dato_w[15:12];
            3'b100: datodisplay_o = dato_w[19:16];
            3'b101: datodisplay_o = dato_w[23:20];
            3'b110: datodisplay_o = dato_w[27:24];
            3'b111: datodisplay_o = dato_w[31:28];
        endcase
    end
	 
	 // Instancia del divisor de frecuencia
    DivFreq #(
        .freqdev(10_000_000),    // Frecuencia de desarrollo de 10MHz
        .freqfinal(4)            // Frecuencia final dividida en 4
    )div_freq_instance(
        //.clk_i(),
        .rst_ni(),
        //.clk_o(slow_clk)         // Salida de reloj dividido
    );

    // Instancia del display
    display display_instance (
        .cuenta_i (datodisplay_o),
        .enable_i (1'b1),
        .display_o (display_o),
        .daenable_o (display_enable)          
    );

endmodule
