library verilog;
use verilog.vl_types.all;
entity Counter is
    port(
        n               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        cen             : in     vl_logic;
        ldC             : in     vl_logic;
        complete        : out    vl_logic
    );
end Counter;
