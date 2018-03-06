library verilog;
use verilog.vl_types.all;
entity SFF is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ldF             : in     vl_logic;
        N               : in     vl_logic;
        O               : out    vl_logic
    );
end SFF;
