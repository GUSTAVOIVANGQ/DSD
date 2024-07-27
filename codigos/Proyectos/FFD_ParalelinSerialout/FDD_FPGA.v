
/*
	Proyecto: FDD
	Archivo: FDD_FPGA.v
	Descripcion: Descripcion de un flip flop D
					 entrada en paralelo - salida en serie
	Asignatura: DSD
	Prof: Flores Escobar Jose Antonio
	Equipo: Coloque a los integrantes...
				Álvarez Hernández Gabriel Alexander
				Bueno Aguilar Alexis Haziel
				Garcia Quiroz Gustavo Ivan
				Huesca Laureano Josue Alejandro
				Muñoz Valdivia Irving Omar */
module FDD_FPGA(
    input        clk_i,
    input        rst_i,
    input  [3:0] d_i,
	 input 		  serialin_i,
	 input 		  move_load_i,
    output wire  q_o
);
    // Declaración de señales
    wire    ff1q_ff2d	,
            ff2q_ff3d	,
            ff3q_ff4d	,
            clk_df		,
				salidactrl_w3,
				salidactrl_w2,
				salidactrl_w1,
				salidactrl_w0;

    // Instancia del Divisor de Frecuencia
    DivFreq DF(
        .clk_i  (clk_i),
        .rst_i  (rst_i),
        .clk_o  (clk_df)
    );
	 //Instancia de control para el flip flop tipo D


	 //	Instancia control para FFD3
	 FFD_ctrl FFD_ctrl3(
		.serialin_i		(serialin_i),
		.move_i			(move_load_i),
		.move_ni			(~move_load_i),
		.parallelin_i	(d_i[3]),
		.clk_i			(clk_i),
		.rst_i			(rst_i),
		.q_o				(salidactrl3_w)
	 );
    // Instancia del FFD3
    FFD FDD3(
        //.clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i), // Para Simulacion
        .d_i    (salidactrl3_w),
        .rst_i  (rst_i),
        .q_o    (ff1q_ff2d)
    );
	 
	 //	Instancia control para FFD2
	 FFD_ctrl FFD_ctrl2(
		.serialin_i		(ff1q_ff2d),
		.move_i			(move_load_i),
		.move_ni			(~move_load_i),
		.parallelin_i	(d_i[2]),
		.clk_i			(clk_i),
		.rst_i			(rst_i),
		.q_o				(salidactrl2_w)
	 );
    // Instancia del FFD2
    FFD FDD2(
      //.clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i), // Para Simulacion
        .d_i    (salidactrl2_w),
        .rst_i  (rst_i),
        .q_o    (ff2q_ff3d)
    );
	 
	 //	Instancia control para FFD1
	 FFD_ctrl FFD_ctrl1(
		.serialin_i		(ff2q_ff3d),
		.move_i			(move_load_i),
		.move_ni			(~move_load_i),
		.parallelin_i	(d_i[1]),
		.clk_i			(clk_i),
		.rst_i			(rst_i),
		.q_o				(salidactrl1_w)
	 );
    // Instancia del FFD1
    FFD FDD1(
        //.clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i), // Para Simulacion
        .d_i    (salidactrl1_w),
        .rst_i  (rst_i),
        .q_o    (ff3q_ff4d)
    );
	 
	 //	Instancia control para FFD0
	 FFD_ctrl FFD_ctrl0(
		.serialin_i		(ff3q_ff4d),
		.move_i			(move_load_i),
		.move_ni			(~move_load_i),
		.parallelin_i	(d_i[0]),
		.clk_i			(clk_i),
		.rst_i			(rst_i),
		.q_o				(salidactrl0_w)
	 );
    // Instancia del FFD0
    FFD FDD0(
        //.clk_i  (clk_df),// Para FPGA      
		  .clk_i  (clk_i), // Para Simulacion
        .d_i    (salidactrl0_w),
        .rst_i  (rst_i),
        .q_o    (q_o)
    ); 
   
endmodule


//Creando banco de pruebas (test bench)
module FDD_FPGA_tb ();
    reg       clk_i;
    reg       rst_i;
    reg       d_i;
 // wire      q_o;
	 wire		  q_o1;
	 wire		  q_o2;
	 wire		  q_o3;
	 wire		  q_o4;
	 
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
		FDD_FPGA DUT(
        .clk_i  (clk_i),
        .d_i    (d_i),
        .rst_i  (rst_i),
        .q_o1    (q_o1),
		  .q_o2    (q_o2),
		  .q_o3    (q_o3),
		  .q_o4    (q_o4)
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
			d_i	<=	1'b1;
		#100
			d_i	<=	1'b0;
		#100
			d_i	<=	1'b0;
		#100
			d_i	<=	1'b1;
		#100
			d_i	<=	1'b1;
	end
endmodule