library verilog;
use verilog.vl_types.all;
entity DivFreq is
    generic(
        freqdev         : integer := 10000000;
        freqfinal       : vl_notype
    );
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        clk_o           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of freqdev : constant is 1;
    attribute mti_svvh_generic_type of freqfinal : constant is 3;
end DivFreq;
