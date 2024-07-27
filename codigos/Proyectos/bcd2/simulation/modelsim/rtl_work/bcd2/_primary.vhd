library verilog;
use verilog.vl_types.all;
entity bcd2 is
    port(
        clk_i           : in     vl_logic;
        reset_i         : in     vl_logic;
        j_i             : in     vl_logic;
        k_i             : in     vl_logic;
        q_o             : out    vl_logic_vector(3 downto 0);
        q_no            : out    vl_logic_vector(3 downto 0)
    );
end bcd2;
