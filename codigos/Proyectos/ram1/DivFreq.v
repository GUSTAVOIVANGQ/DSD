module DivFreq #(
    parameter freqdev = 10_000_000, // 10MHz
    parameter freqfinal = 4 // freqdev Dividido en 4
)(
    input clk_i,
    input rst_ni,
    output reg clk_o
);
    reg [31:0] counter_r;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            counter_r <= 32'b0;
            clk_o <= 1'b1; // Comenzamos con el reloj en bajo
        end else begin
//		  if (counter_r >= (freqfinal - 1)) begin
		  if (counter_r == (32'd10_000)) begin
		  
            counter_r <= 32'b0;
            clk_o <= ~clk_o;
        end else begin
            counter_r <= counter_r + 32'b1;
        end
		  end
    end
endmodule