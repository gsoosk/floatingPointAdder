library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        ldS1            : in     vl_logic;
        ldS2            : in     vl_logic;
        ldExp1          : in     vl_logic;
        ldExp2          : in     vl_logic;
        ldM1            : in     vl_logic;
        ldM2            : in     vl_logic;
        ldRegA          : in     vl_logic;
        ldRegB          : in     vl_logic;
        ldRegS          : in     vl_logic;
        shEn            : in     vl_logic;
        cntEn           : in     vl_logic;
        ldC             : in     vl_logic;
        ldFM            : in     vl_logic;
        shM             : in     vl_logic;
        floatOne        : in     vl_logic_vector(31 downto 0);
        floatTwo        : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        complete        : out    vl_logic;
        OV              : out    vl_logic;
        floatAns        : out    vl_logic_vector(31 downto 0);
        signOne         : out    vl_logic;
        signTwo         : out    vl_logic;
        expOne          : out    vl_logic_vector(7 downto 0);
        expTwo          : out    vl_logic_vector(7 downto 0);
        manOne          : out    vl_logic_vector(22 downto 0);
        manTwo          : out    vl_logic_vector(22 downto 0);
        twosOne         : out    vl_logic_vector(24 downto 0);
        twosTwo         : out    vl_logic_vector(24 downto 0);
        B               : out    vl_logic_vector(24 downto 0);
        S               : out    vl_logic_vector(24 downto 0);
        A               : out    vl_logic_vector(23 downto 0);
        subAns          : out    vl_logic_vector(7 downto 0);
        FMInput         : out    vl_logic_vector(24 downto 0);
        addAnswer       : out    vl_logic_vector(24 downto 0)
    );
end dataPath;