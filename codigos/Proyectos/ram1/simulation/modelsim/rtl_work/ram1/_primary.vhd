library verilog;
use verilog.vl_types.all;
entity ram1 is
    port(
        clk             : in     vl_logic;
        write_enable    : in     vl_logic;
        address         : in     vl_logic_vector(7 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0)
    );
end ram1;
