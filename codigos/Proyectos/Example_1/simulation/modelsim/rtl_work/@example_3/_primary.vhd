library verilog;
use verilog.vl_types.all;
entity Example_3 is
    generic(
        STATE_GREEN     : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        STATE_YELLOW    : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        STATE_RED       : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        red             : out    vl_logic;
        yellow          : out    vl_logic;
        green           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of STATE_GREEN : constant is 1;
    attribute mti_svvh_generic_type of STATE_YELLOW : constant is 1;
    attribute mti_svvh_generic_type of STATE_RED : constant is 1;
end Example_3;
