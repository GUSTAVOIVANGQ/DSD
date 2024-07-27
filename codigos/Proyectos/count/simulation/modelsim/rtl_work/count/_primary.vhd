library verilog;
use verilog.vl_types.all;
entity count is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        dir_i           : in     vl_logic;
        count           : out    vl_logic_vector(2 downto 0)
    );
end count;
