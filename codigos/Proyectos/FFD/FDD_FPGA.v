//FDD_FPGA.v
/*
	Proyecto: FDD
	Archivo: FDD_FPGA.v
	Descripcion: Descripcion de un flip flop D
					 entrada en serie - salida en serie
	Asignatura: DSD
	Prof: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				Garcia Quiroz Gustavo Ivan
				Huesca Laureano Josue Alejandro
				Muñoz Valdivia Irving Omar */
module FDD_FPGA(
    input       clk_i,
    input       rst_i,
    input       d_i,
    output      q_o
);
    // Declaración de señales
    wire    ff1q_ff2d,
            ff2q_ff3d,
            ff3q_ff4d,
            clk_df;

    // Instancia del Divisor de Frecuencia
    DivFreq DF(
        .clk_i  (clk_i),
        .rst_i  (rst_i),
        .clk_o  (clk_df)
    );

    // Instancia del 1er FFD
    FFD FDD1(
        //.clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i), // Para Simulacion
        .d_i    (d_i),
        .rst_i  (rst_i),
        .q_o    (ff1q_ff2d)
    );
    // Instancia del 2do FFD
    FFD FDD2(
        //.clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i),// Para Simulacion
        .d_i    (ff1q_ff2d),
        .rst_i  (rst_i),
        .q_o    (ff2q_ff3d)
    );
    // Instancia del 3er FFD
    FFD FDD3(
        //.clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i),// Para Simulacion
        .d_i    (ff2q_ff3d),
        .rst_i  (rst_i),
        .q_o    (ff3q_ff4d)
    );
    // Instancia del 4to FFD
    FFD FDD4(
        // .clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i),// Para Simulacion
        .d_i    (ff3q_ff4d),
        .rst_i  (rst_i),
        .q_o    (q_o)
    );
endmodule


//CReando banco de pruebas (test bench)
module FDD_FPGA_tb ();
    reg       clk_i;
    reg       rst_i;
    reg       d_i;
    wire      q_o;
	 //Dando valores iniciales a la simulació
	 initial
	 begin
		clk_i	<=1'b1;
		rst_i	<=1'b1;
		d_i	<=1'b0;
		#100
			rst_i	<=	1'b0;
	 end
	 //Instancia del Device Under Test (DUT) adentro de los parentesis van los de FDD_FPGA_tb
		FDD_FPGA OUT(
        .clk_i  (clk_i),
        .d_i    (d_i),
        .rst_i  (rst_i),
        .q_o    (q_o)
    );
	 //generacion de señal de reloj
	 always
	 begin
		#50 //avanza 50 tiempo y luego se pone en 0 y luego en 1, luego cero y nuevamente 1
			clk_i <=	~clk_i;
	end 
	
	//cambios de valores de señales avanza 100 unidades de tiempo, baja a 0 y así se mantiene
	/*always
	begin
		#100
			rst_i	<=	1'b0
	end*/ //Lo anterior igual se hace en las lineas 74 y 75 de este código
	
	always
	begin
		#100
			d_i	<=	1'b0;
		#100
			d_i	<=	1'b1;
		#100
			d_i	<=	1'b0;
		#100
			d_i	<=	1'b1;
		#100
			d_i	<=	1'b0;
		#100
			d_i	<=	1'b1;
		#100
			d_i	<=	1'b1;
	end
endmodule