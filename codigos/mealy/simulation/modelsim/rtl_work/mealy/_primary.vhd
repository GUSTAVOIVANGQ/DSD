library verilog;
use verilog.vl_types.all;
entity mealy is
    generic(
        iole            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        intermedio1     : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        intermedio2     : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        final           : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        x_i             : in     vl_logic;
        y_o             : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of iole : constant is 1;
    attribute mti_svvh_generic_type of intermedio1 : constant is 1;
    attribute mti_svvh_generic_type of intermedio2 : constant is 1;
    attribute mti_svvh_generic_type of final : constant is 1;
end mealy;
