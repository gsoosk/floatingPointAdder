library verilog;
use verilog.vl_types.all;
entity controller is
    generic(
        IDLE            : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        STARTING        : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        LOAD_INPUTS     : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        LOAD_AB         : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        SHIFTING        : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0);
        LOAD_FM         : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi1);
        SHIFT_FM        : vl_logic_vector(2 downto 0) := (Hi1, Hi1, Hi0);
        LOAD_S          : vl_logic_vector(2 downto 0) := (Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        complete        : in     vl_logic;
        OV              : in     vl_logic;
        done            : out    vl_logic;
        ldS1            : out    vl_logic;
        ldS2            : out    vl_logic;
        ldExp1          : out    vl_logic;
        ldExp2          : out    vl_logic;
        ldM1            : out    vl_logic;
        ldM2            : out    vl_logic;
        ldRegA          : out    vl_logic;
        ldRegB          : out    vl_logic;
        ldRegS          : out    vl_logic;
        shEn            : out    vl_logic;
        cntEn           : out    vl_logic;
        ldC             : out    vl_logic;
        ldFM            : out    vl_logic;
        shM             : out    vl_logic;
        ps              : out    vl_logic_vector(2 downto 0);
        ns              : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of STARTING : constant is 2;
    attribute mti_svvh_generic_type of LOAD_INPUTS : constant is 2;
    attribute mti_svvh_generic_type of LOAD_AB : constant is 2;
    attribute mti_svvh_generic_type of SHIFTING : constant is 2;
    attribute mti_svvh_generic_type of LOAD_FM : constant is 2;
    attribute mti_svvh_generic_type of SHIFT_FM : constant is 2;
    attribute mti_svvh_generic_type of LOAD_S : constant is 2;
end controller;
