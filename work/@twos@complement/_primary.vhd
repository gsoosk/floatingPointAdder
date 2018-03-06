library verilog;
use verilog.vl_types.all;
entity TwosComplement is
    port(
        N               : in     vl_logic_vector(24 downto 0);
        s               : in     vl_logic;
        O               : out    vl_logic_vector(24 downto 0)
    );
end TwosComplement;
