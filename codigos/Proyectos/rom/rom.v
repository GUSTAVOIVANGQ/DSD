module rom#(
	parameter	D = 8, // $clog2(250) //DEPTH
	parameter	W = 32
)
(
	input 		[D-1:0]	addr_i,
	input 					rden_i,
	output reg	[W-1:0]	dato_o
);

	//
	always@(*)
	begin
	if(rden_i)
			case(addr_i)
				8'h0:
					dato_o = 32'h01234567;
				8'h1:
					dato_o = 32'h76543210;
				8'h2:
					dato_o = 32'hABC24681;
				8'h3:
					dato_o = 32'hCD120201;
				8'h4:
					dato_o = 32'hCACA2357;
				8'h5:
					dato_o = 32'hF56AC87F;
				8'h6:
					dato_o = 32'hDED05BA7;
				8'h7:
					dato_o = 32'h11111111;
				default:
					dato_o = {D[4'hF]}; //concatenar
			endcase
		else
			dato_o = {D{4'h0}};
	end

endmodule
