library verilog;
use verilog.vl_types.all;
entity DivFreq is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        clk_o           : out    vl_logic
    );
end DivFreq;
