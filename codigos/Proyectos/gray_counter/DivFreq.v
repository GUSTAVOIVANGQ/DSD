module DivFreq #(
	parameter freqdev = 10000000, // 10MHz
	parameter freqfinal = freqdev / 4 // Dividido en 4
)(
	input 		clk_i,
	input 		rst_ni,
	output reg 	clk_o
);
reg [31:0] counter_r;
always @(posedge clk_i or negedge rst_ni) begin
	if (!rst_ni) begin
		counter_r <= 0;
		clk_o <= 1'b0; // Comenzamos con el reloj en bajo
	end else if (counter_r >= (freqfinal - 1)) begin
		counter_r <= 0;
		clk_o <= ~clk_o;
	end else begin
		counter_r <= counter_r + 1;
	end
end
endmodule