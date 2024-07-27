
 /*
	Proyecto:	FDD
	Archivo:		FDD_FPGA.V
	Descripcion: Descripcion de un Flip Flop D en un FPGA
					 Entrada en serie-Salida en serie
	Asignatura:	DSD
	Prof: 		Toño
	Equipo:		Luis Gerardo Herrera Avila
*/module barrelShifter(
    input                   clk_i,
    input [3:0]             d_i,    
    input   [1:0]           distancia_i,
    input                   sentido_i,
    output reg [3:0]        q_o
);
    reg [7:0]   temp_w; // 2*4 -1
    
    always@(posedge clk_i)
    begin
        //1=derecha 0= izquierda
        temp_w = {d_i, d_i};
        if(sentido_i)
        begin   // 1
            temp_w  = temp_w >> distancia_i;
            q_o     <= temp_w[7:4]; // Selecciona los bits desplazados hacia la derecha
        end
        else
        begin
            temp_w  = temp_w << distancia_i;
            q_o     <= temp_w[3:0]; // Selecciona los bits desplazados hacia la izquierda
        end
        
    end
endmodule


module barrelShifter_tb();
	reg					clk_i;
	reg [3:0]			d_i;
	reg	[1:0]			distancia_i;
	reg 					sentido_i;  
	wire [3:0] 			q_o;
	

	initial
	begin
	clk_i	= 			1'b0;
	d_i	= 			4'b0;
	distancia_i = 	2'b0;
	sentido_i  = 	1'b0;
	end
	
barrelShifter barrelShifter_dut(
	.clk_i		(clk_i		),
	.d_i			(d_i			),	
	.distancia_i(distancia_i),
	.sentido_i	(sentido_i	),
	.q_o			(q_o			)
);	

  initial
  begin
    #50 clk_i <= ~clk_i;
end

  initial
  begin
  #100 
	d_i	= 			4'b1010;
	distancia_i = 	2'b01;
	sentido_i  = 	1'b1;

  #100 
	d_i	= 			4'b0110;
	distancia_i = 	2'b10;
	sentido_i  = 	1'b1;

  #100 
	d_i	= 			4'b1010;
	distancia_i = 	2'b11;
	sentido_i  = 	1'b0;
	
end

endmodule
