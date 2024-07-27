/*
	Proyecto:	FDD
	Archivo:		FDD_FPGA.V
	Descripcion: Descripcion de un Flip Flop D en un FPGA
					 Entrada en serie-Salida en serie
	Asignatura:	DSD
	Prof: 		Toño
	Equipo:		Luis Gerardo Herrera Avila
*/

module gray
#(
parameter ancho = 3
)
(
	input	clk_i,
	input rst_i,
	output [ancho-1:0] resultado
);
reg [ancho-1:0] q;
reg [ancho-2:0] no_ones_below;
reg q_reg;

integer i,j,k;
    always@(posedge clk_i, posedge rst_i)
    begin
        if(rst_i)
        begin   // 1
            q <= (1'b0),((ancho-1)1'b0);
/*				for (i=0;i<=ancho-1;i=i+1'b1)
					begin   
					q <= 1'b0; // Selecciona los bits desplazados hacia la derecha
					end*/
        end
        else
        begin
            q[ancho-1] <= ~q[ancho-1]; // Selecciona los bits desplazados hacia la izquierda
				for (j=0;j<ancho-1;j=j+1'b1)
					begin   
					q[j] <= q[j-1]  * (q[j-1]  &no_ones_below[j-1]); // Selecciona los bits desplazados hacia la derecha
					end
				q[ancho] <= q[ancho-1]  * q[ancho-1]  &no_ones_below[ancho-2]; // Selecciona los bits desplazados hacia la derecha
				
        end
        
    end
	always@(*)
    begin
		no_ones_below<=1'b1;
			for (k=0;k<ancho-1;k=k+1'b1)
				begin   
				no_ones_below[k] <= no_ones_below[k-1] & ~q[k-1]; // Selecciona los bits desplazados hacia la derecha
				end
			q[ancho] <= q[ancho-1]  * q[ancho-1]  &no_ones_below[ancho-2]; // Selecciona los bits desplazados hacia la derecha
			resultado[ancho] <= q[ancho-1:0];

	 end
endmodule