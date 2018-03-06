library verilog;
use verilog.vl_types.all;
entity ShiftRegister is
    port(
        pi              : in     vl_logic_vector(23 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        shiftEnable     : in     vl_logic;
        Lden            : in     vl_logic;
        sout            : out    vl_logic_vector(23 downto 0)
    );
end ShiftRegister;
