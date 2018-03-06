library verilog;
use verilog.vl_types.all;
entity Subtractor is
    port(
        N1              : in     vl_logic_vector(7 downto 0);
        N2              : in     vl_logic_vector(7 downto 0);
        Answer          : out    vl_logic_vector(7 downto 0)
    );
end Subtractor;
