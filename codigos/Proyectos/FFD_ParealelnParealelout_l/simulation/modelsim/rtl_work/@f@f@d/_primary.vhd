library verilog;
use verilog.vl_types.all;
entity FFD is
    port(
        d_i             : in     vl_logic;
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        q_o             : out    vl_logic
    );
end FFD;
