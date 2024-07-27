library verilog;
use verilog.vl_types.all;
entity FFD_ctrl is
    port(
        serialin_i      : in     vl_logic;
        move_i          : in     vl_logic;
        move_ni         : in     vl_logic;
        parallelin_i    : in     vl_logic;
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        q_o             : out    vl_logic
    );
end FFD_ctrl;
