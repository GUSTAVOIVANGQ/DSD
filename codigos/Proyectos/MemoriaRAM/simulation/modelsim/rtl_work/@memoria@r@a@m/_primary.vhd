library verilog;
use verilog.vl_types.all;
entity MemoriaRAM is
    generic(
        N               : integer := 4;
        M               : integer := 4
    );
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        addr_i          : in     vl_logic_vector;
        rden_i          : in     vl_logic;
        dato_read_o     : out    vl_logic_vector;
        dato_write_i    : in     vl_logic_vector;
        wren_i          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of M : constant is 1;
end MemoriaRAM;
