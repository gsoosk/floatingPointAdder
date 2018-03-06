library verilog;
use verilog.vl_types.all;
entity Comprator is
    port(
        e1              : in     vl_logic_vector(7 downto 0);
        e2              : in     vl_logic_vector(7 downto 0);
        LE              : out    vl_logic
    );
end Comprator;
