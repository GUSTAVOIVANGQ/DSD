module FFD_ctr(
  input 			serialin_i,
  input 			move_i,
  input 			move_ni,
  input 			paralelin_i,
  input 			clk_i,
  input 			rst_i,
  output 		q_o
);
//ParealelnSerialout

wire	andout1_w;
assign	andout1_w = serialin_i & move_i;

wire	andout2_w;
assign	andout2_w = move_i & paralelin_i;

wire	orout_w1;
assign orout_w1 = andout1_w | andout2_w;

wire	outand1;
endmodule