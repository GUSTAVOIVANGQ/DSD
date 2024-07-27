library verilog;
use verilog.vl_types.all;
entity FDD_FPGA is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        d_i             : in     vl_logic;
        q_o             : out    vl_logic;
        q_o1            : out    vl_logic;
        q_o2            : out    vl_logic;
        q_o3            : out    vl_logic;
        q_o4            : out    vl_logic
    );
end FDD_FPGA;
