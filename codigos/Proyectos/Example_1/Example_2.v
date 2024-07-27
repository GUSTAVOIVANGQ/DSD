module Example_2#(
    parameter E0 = 3'b000, //VERDE
    parameter E1 = 3'b010, //AMARILLO
    parameter E2 = 3'b100  // ROJO
)(
    input                         clk_i,
    input                         rst_ni,
    input                         x_i,
    output reg            [2:0] y_o
);
    reg            [2:0] actual_state_w;
    reg                  transicion_verde;
    reg            [2:0] cuenta_verde;
    reg                  transicion_amarilla;
    reg            [2:0] cuenta_amarilla;
    reg                  transicion_roja;
    reg            [2:0] cuenta_roja;
	 // Instancia del divisor de frecuencia
    wire slow_clk;
    DivFreq #(
        .freqdev(10000000),    // Frecuencia de desarrollo de 10MHz
        .freqfinal(2500000)    // Frecuencia final dividida en 4
    ) div_freq_instance (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .clk_o(slow_clk)       // Salida de reloj dividido
    );
    //Proceso secuencial para calcular estados
    always @(posedge slow_clk or negedge rst_ni)
    begin
        if (!rst_ni)
            actual_state_w <= E0;
        else
            case(actual_state_w)
                E0: if (x_i) actual_state_w <= E0; else actual_state_w <= E1;
                E1: if (x_i) actual_state_w <= E1; else actual_state_w <= E2;
                E2: if (x_i) actual_state_w <= E2; else actual_state_w <= E0;
            endcase
    end

    //Proceso para definir las salidas
    always @(*)
    begin
        case(actual_state_w)
            E0: y_o = 3'b100;
            E1: y_o = 3'b010;
            E2: y_o = 3'b001;
        endcase
    end

    //Proceso para calcular cambios de estados
    always @(posedge clk_i or negedge rst_ni)
    begin
        if (!rst_ni) //Si estoy en estado reset
        begin
            transicion_verde        =   1'b0;
            cuenta_verde            =   3'b0;
            transicion_amarilla 		=   1'b0;
            cuenta_amarilla       	=   3'b0;
            transicion_roja       	=   1'b0;
            cuenta_roja             =   3'b0;
        end
        else
        begin
            case(actual_state_w)
                E0: begin
                        if (cuenta_verde == 4'h4)
                        begin
                            transicion_verde   = 1'b1;
                            cuenta_verde       = 3'b0;
                        end
                        else
                        begin
                            transicion_verde   = 1'b0;
                            cuenta_verde       = cuenta_verde + 1'b1;
                        end
                    end
                E1: begin
                        if (cuenta_amarilla == 4'h4)
                        begin
                            transicion_amarilla = 1'b1;
                            cuenta_amarilla     = 3'b0;
                        end
                        else
                        begin
                            transicion_amarilla = 1'b0;
                            cuenta_amarilla     = cuenta_amarilla + 1'b1;
                        end
                    end
                E2: begin
                        if (cuenta_roja == 4'h4)
                        begin
                            transicion_roja     = 1'b1;
                            cuenta_roja         = 3'b0;
                        end
                        else
                        begin
                            transicion_roja     = 1'b0;
                            cuenta_roja         = cuenta_roja + 1'b1;
                        end
                    end
            endcase
        end
    end
endmodule

//Reloj pin 12