//ENCABEZADO	

module MemoriaRAM_fpga #(
		parameter N = 3,
		parameter M = 4
)
(
		input		wire				clk_i,
		input		wire	[N-1:0]	addr_i,

		input		wire				rden_i,	
		input 	wire	[M-1:0]	dato_write_i,


		
		input		wire				wren_i,
		output 	wire				display_enable,
		output 	wire 	[0:6]   	display_o
);
		wire slow_clk;
		reg 	[M-1:0]	dato_read_o;
		
MemoriaRAM #(
		.N	(N),
		.M	(M) 
)
MemoriaRAM_U0 (
		.addr_i (addr_i),
		.dato_write_i (dato_write_i),
		.wren_i (wren_i),
		.rden_i (rden_i)
		
);

		
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
        .cuenta_i (dato_read_o),
        .enable_i (1'b1),
        .display_o (display_o),
        .daenable_o (display_enable)          
    );

endmodule 