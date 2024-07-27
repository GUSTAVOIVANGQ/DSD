
module FDD_FPGA(
  input clk_i,
  input rst_i,
  input d_i,
  output q_o,
  
  output q_o1,
  output q_o2,
  output q_o3,
  output q_o4
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
		.clk_i	(clk_i),//(clk_df),
    .rst_i(rst_i),
    .q_o(q_o1)
  );

  // Instantiate the 2nd FFD
  FFD FFD2 (
    .d_i(q_o1),
		.clk_i	(clk_i),//(clk_df),
    .rst_i(rst_i),
    .q_o(q_o2)
  );

  // Instantiate the 3rd FFD
  FFD FFD3 (
    .d_i(q_o2),
		.clk_i	(clk_i),//(clk_df),
    .rst_i(rst_i),
    .q_o(q_o3)
  );

  // Instantiate the 4th FFD
  FFD FFD4 (
    .d_i(q_o3),
		.clk_i	(clk_i),//(clk_df),
    .rst_i(rst_i),
    .q_o(q_o4)
  );
  
endmodule

// Define the DivFreq module and FFD module accordingly.
// Ensure the correctness of these modules in your code.
// I've assumed they exist based on your previous code snippets.
module FDD_FPGA_tv();
  reg clk_i;
  reg rst_i;
  reg d_i;
  wire q_o;
  
  wire q_o1;
  wire q_o2;
  wire q_o3;
  wire q_o4;

  
  initial
  begin
    clk_i <= 1'b1;
    rst_i <= 1'b1;
    d_i   <= 1'b0;
    
    // Toggle clk_i every 50 time units
    #50 clk_i <= ~clk_i;

    // De-assert rst_i after 100 time units
    #100 rst_i <= 1'b0;

    // Simulate data changes every 100 time units
    #100 d_i <= 1'b0;
    #100 d_i <= 1'b1;
    #100 d_i <= 1'b1;
    #100 d_i <= 1'b0;
    #100 d_i <= 1'b1;
    #100 d_i <= 1'b0;
    #100 d_i <= 1'b1;
	 
  end
    
  // Instantiate the FDD_FPGA module
  FDD_FPGA Out(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .d_i(d_i),
    .q_o(q_o),
	 
	 .q_o1 (q_o1),
	 .q_o2 (q_o2),
	 .q_o3 (q_o3),
	 .q_o4 (q_o4)
  );
  

endmodule
