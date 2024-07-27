
module x(
  input clk_i,
  input rst_i,
  input d_i,
  output reg q_o
);
  // Declaration of signals
  wire ff1q_ff2d;
  wire ff2q_ff3d;
  wire ff3q_ff4d;
  wire clk_df;

  // Instantiate the divisor of frequencies
  DivFreq DF (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .clk_o(clk_df)
  );

  // Instantiate the 1st FFD
  FFD FFD1 (
    .d_i(d_i),
    .clk_i(clk_df),
    .rst_i(rst_i),
    .q_o(ff1q_ff2d)
  );

  // Instantiate the 2nd FFD
  FFD FFD2 (
    .d_i(ff1q_ff2d),
    .clk_i(clk_df),
    .rst_i(rst_i),
    .q_o(ff2q_ff3d)
  );

  // Instantiate the 3rd FFD
  FFD FFD3 (
    .d_i(ff2q_ff3d),
    .clk_i(clk_df),
    .rst_i(rst_i),
    .q_o(ff3q_ff4d)
  );

  // Instantiate the 4th FFD
  FFD FFD4 (
    .d_i(ff3q_ff4d),
    .clk_i(clk_df),
    .rst_i(rst_i),
    .q_o(q_o)
  );
endmodule
