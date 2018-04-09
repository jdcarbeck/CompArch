library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity micro_control is
    Port ( 
        Vflag, Cflag, Nflag, Zflag : in std_logic;
        instruction: in std_logic_vector(15 downto 0);
        clk : in std_logic;
        reset: in std_logic;
        
        PC : out std_logic_vector(15 downto 0);
        
        TD : out std_logic;
        TA : out std_logic;
        TB : out std_logic;
        MB : out std_logic;
        FS : out std_logic_vector(4 downto 0);
        MD : out std_logic;
        RW : out std_logic;
        MM : out std_logic;
        MW : out std_logic;
        
        --for testing
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(7 downto 0);
        
        DR : out std_logic_vector(2 downto 0);
        SA : out std_logic_vector(2 downto 0);
        SB : out std_logic_vector(2 downto 0)
    );
end micro_control;

architecture Behavioral of micro_control is
    component control_memory
        Port ( 
        MW: out std_logic;
        MM: out std_logic;
        RW: out std_logic;
        MD: out std_logic;
        FS: out std_logic_vector(4 downto 0);
        MB: out std_logic;
        TB: out std_logic;
        TA: out std_logic;
        TD: out std_logic;
        
        PL: out std_logic;
        PI: out std_logic;
        IL: out std_logic;
        MC: out std_logic;
        MS: out std_logic_vector(2 downto 0);
        NA: out std_logic_vector(7 downto 0);
        
        IN_CAR: in std_logic_vector(7 downto 0)
      );
    end component;
    
    component car
        port (
            A : in std_logic;
            clk : in std_logic;
            reset : in std_logic;
            B : in std_logic_vector(7 downto 0);
            z : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component mux2_8bit
        port (
            A : in std_logic_vector(7 downto 0);
            B : in std_logic_vector(7 downto 0);
            sel : in std_logic;
            z : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component instruction_reg
        Port ( 
            IRin : in std_logic_vector(15 downto 0);
            IL : in std_logic;
            clk : in std_logic;
            Opcode : out std_logic_vector(6 downto 0);
            DR : out std_logic_vector(2 downto 0);
            SA : out std_logic_vector(2 downto 0);
            SB : out std_logic_vector(2 downto 0)
        );
    end component;
    
    component mux8_1
    	Port ( 
    	   In0, In1, In2, In3, In4, In5, In6, In7: in std_logic;
           S0, S1, S2 : in std_logic;
           Z : out std_logic
        );
    end component;
    
    component program_count
        port (
            PCin : in std_logic_vector(15 downto 0);
            PL : in std_logic;
            PI : in std_logic;
            clk : in std_logic;
            reset : in std_logic;
            PCout : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component Extend
        Port ( 
            DRSB : in std_logic_vector(5 downto 0);
            Ext : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal PL_out, PI_out, IL_out, MC_out : std_logic;
    signal MS_out : std_logic_vector(2 downto 0);
    signal NA_out : std_logic_vector(7 downto 0);
    
    
--    signal IL : std_logic; 
--    siganl MC : std_logic; 
    signal MUXS_OUT : std_logic; 
    signal notC : std_logic; 
    signal notZ : std_logic;
--    signal MS : std_logic_vector(2 downto 0); 
    signal DR_PC : std_logic_vector(2 downto 0); 
    signal SA_PC : std_logic_vector(2 downto 0);
    signal SB_PC : std_logic_vector(2 downto 0);
--    signal NA : std_logic_vector(7 downto 0); 
    signal IN_CAR : std_logic_vector(7 downto 0);
    signal MUXC_OUT : std_logic_vector(7 downto 0);
    signal Opcode : std_logic_vector(6 downto 0);
    signal PCin : std_logic_vector(15 downto 0);

begin

    control_memory0: control_memory
        port map (
            IN_CAR => IN_CAR,
            MW => MW,
            MM => MM,
            RW => RW,
            MD => MD,
            FS => FS,
            MB => MB,
            TB => TB,
            TA => TA,
            TD => TD,
            
            PL => PL_out,
            PI => PI_out,
            IL => IL_out,
            MC => MC_out,
            MS => MS_out,
            NA => NA_out
        );
    
    car0: car
        port map (
            A => MUXS_OUT,
            B => MUXC_OUT,
            reset => reset,
            clk => clk,
            z => IN_CAR
        );
    
    muxc: mux2_8bit
        port map (
            B(0) => Opcode(0),
            B(1) => Opcode(1),
            B(2) => Opcode(2),
            B(3) => Opcode(3),
            B(4) => Opcode(4),
            B(5) => Opcode(5),
            B(6) => Opcode(6),
            B(7) => '0',
            A => NA_out,
            sel => MC_out,
            z => MUXC_OUT
        );

    ir0: instruction_reg
        port map (
            IRin => instruction,
            IL => IL_out,
            clk => clk,
            Opcode => Opcode,
            DR => DR_PC,
            SA => SA_PC,
            SB => SB_PC
        );
        
    muxs: mux8_1
        port map(
            In0 => '0',
            In1 => '1',
            In2 => CFlag,
            In3 => VFlag,
            In4 => ZFlag,
            In5 => NFlag,
            In6 => notC,
            In7 => notZ,
            S0 => MS_out(0),
            S1 => MS_out(1),
            S2 => MS_out(2),
            z => MUXS_OUT
        );
        
    ext0: Extend
        port map(
            DRSB(2 downto 0) => SB_PC,
            DRSB(5 downto 3) => DR_PC,
            Ext => PCin
        );
 
    pc0: program_count
        port map(
          PCin =>  PCin,
          PL => PL_out,
          PI => PI_out,
          reset => reset,
          clk => clk,
          PCout => PC
        );

    PL <= PL_out;
    PI <= PI_out;
    IL <= IL_out;
    MC <= MC_out;
    MS <= MS_out;
    NA <= NA_out;
    DR <= DR_PC;
    SA <= SA_PC;
    SB <= SB_PC;
-- add a signal that holds the last PC so when clk and not load is called its not rea
end Behavioral;
