library verilog;
use verilog.vl_types.all;
entity FDD_FPGA is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        d_i             : in     vl_logic_vector(3 downto 0);
        serialin_i      : in     vl_logic;
        move_load_i     : in     vl_logic;
        q_o             : out    vl_logic
    );
end FDD_FPGA;
