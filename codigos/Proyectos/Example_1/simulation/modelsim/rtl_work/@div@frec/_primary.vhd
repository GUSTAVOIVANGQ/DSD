library verilog;
use verilog.vl_types.all;
entity DivFrec is
    generic(
        DIVISOR         : integer := 100000000
    );
    port(
        clk             : in     vl_logic;
        clk_div         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DIVISOR : constant is 1;
end DivFrec;
