library verilog;
use verilog.vl_types.all;
entity gray_counter is
    generic(
        WIDTH           : integer := 8
    );
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        resultado_o     : out    vl_logic_vector;
        segmentos_o     : out    vl_logic_vector(6 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end gray_counter;
