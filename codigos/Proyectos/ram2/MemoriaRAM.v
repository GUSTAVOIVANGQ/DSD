//Encabezado

module ram2#(
	parameter N = 4,
	parameter M = 4
)
(
		input 			clk_i,
		input [N-1:0]	addr_i,
		input 			rst_i,
		
		input 			rden_i,
		output[M-1:0]	dato_read_O,
		
		input [M-1:0]	dato_write_i,
		input 			wren_i
		
);

	reg [M-1:0]	RAM [0:2**N-1];
	
	reg [0:2**N-1]	VALID;
	
	initial
		begin
			$readmemh("ram_init.hex", RAM);
		end
	
	always @(posedge clk_i, posedge rst_i)
		begin
			if(rst_i)
				VALID <= 16'b001111110011101;
			else
			if(wren_i)
				RAM[addr_i] <= dato_write_i;
		end
		
	assign dato_read_O = (rden_i && VALID[addr_i]) ? RAM[addr_i] : {M[1'b0]};
	
	
endmodule 