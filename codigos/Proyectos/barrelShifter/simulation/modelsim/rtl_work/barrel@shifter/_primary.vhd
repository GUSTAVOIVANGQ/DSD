library verilog;
use verilog.vl_types.all;
entity barrelShifter is
    port(
        clk_i           : in     vl_logic;
        d_i             : in     vl_logic_vector(3 downto 0);
        distancia_i     : in     vl_logic_vector(1 downto 0);
        sentido_i       : in     vl_logic;
        q_o             : out    vl_logic_vector(3 downto 0)
    );
end barrelShifter;
