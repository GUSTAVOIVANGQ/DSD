library verilog;
use verilog.vl_types.all;
entity MemoriaRAM_tb is
    generic(
        N               : integer := 4;
        M               : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of M : constant is 1;
end MemoriaRAM_tb;
