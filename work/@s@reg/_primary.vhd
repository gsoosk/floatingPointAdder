library verilog;
use verilog.vl_types.all;
entity SReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ldF             : in     vl_logic;
        N               : in     vl_logic_vector(23 downto 0);
        O               : out    vl_logic_vector(24 downto 0)
    );
end SReg;
