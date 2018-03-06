library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        N1              : in     vl_logic_vector(24 downto 0);
        N2              : in     vl_logic_vector(24 downto 0);
        Answer          : out    vl_logic_vector(24 downto 0)
    );
end Adder;
