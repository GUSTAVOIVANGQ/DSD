//ENCABEZADO

module MemoriaRAM #(
	parameter	N = 3,
	parameter	M = 4
)
(
	input					clk_i,
	input		[N-1:0]	addr_i,

	input					rden_i,	
	output	[M-1:0]	dato_read_o,
	
	input		[M-1:0]	dato_write_i,
	input					wren_i
);

	reg 		[M-1:0]	RAM [0:2**N-1];
	
	always @(posedge clk_i)
	begin
		if (wren_i)
			RAM[addr_i] <= dato_write_i;
	end
	
	assign	dato_read_o = (rden_i) ? RAM[addr_i] : {M{1'b0}};
endmodule
