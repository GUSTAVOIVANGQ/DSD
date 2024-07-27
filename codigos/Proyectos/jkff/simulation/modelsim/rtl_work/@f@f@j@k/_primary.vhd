library verilog;
use verilog.vl_types.all;
entity FFJK is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        j_i             : in     vl_logic;
        k_i             : in     vl_logic;
        q_o             : out    vl_logic;
        qn_o            : out    vl_logic
    );
end FFJK;
