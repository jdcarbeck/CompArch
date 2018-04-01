library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity programme_cpu is
    Port (
        clk : in std_logic;
        reset: in std_logic
    );
end programme_cpu;

architecture Behavioral of programme_cpu is
    
    component Datapath
        Port (
            DIn: in std_logic_vector(15 downto 0);
            FS: in std_logic_vector(4 downto 0);
            SB: in std_logic_vector(2 downto 0);
            MBSel: in std_logic;
            MDSel: in std_logic;
            PC : in std_logic_vector(15 downto 0);
            MM : in std_logic;
            Asel : in std_logic_vector(3 downto 0);
            Bsel : in std_logic_vector(3 downto 0);
            Dsel : in std_logic_vector(3 downto 0);
            Clk : in std_logic;
            RW : in std_logic;
            AddOut: out std_logic_vector(15 downto 0); --A bus
            DataOut: out std_logic_vector(15 downto 0); --B bus
            Reg0: out std_logic_vector(15 downto 0); --reg0
            Reg1: out std_logic_vector(15 downto 0); --reg1
            Reg2: out std_logic_vector(15 downto 0); --reg2
            Reg3: out std_logic_vector(15 downto 0); --reg3
            Reg4: out std_logic_vector(15 downto 0); --reg4
            Reg5: out std_logic_vector(15 downto 0); --reg5
            Reg6: out std_logic_vector(15 downto 0); --reg6
            Reg7: out std_logic_vector(15 downto 0);  --reg7
            VFlag: out std_logic;
            CFlag: out std_logic;
            NFlag: out std_logic;
            ZFlag: out std_logic
        );
    end component;
    
    component micro_control
        Port ( 
            Vflag, Cflag, Nflag, Zflag : in std_logic;
            instruction: in std_logic_vector(15 downto 0);
            clk :in std_logic;
            
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
            
            DR : out std_logic_vector(2 downto 0);
            SA : out std_logic_vector(2 downto 0);
            SB : out std_logic_vector(2 downto 0)
        );
    end component;
    
    component memory
        port (
            address: in std_logic_vector(15 downto 0);
            DataIn : in std_logic_vector(15 downto 0);
            MW : in std_logic;
            DataOut: out std_logic_vector(15 downto 0)
        );
    end component;

signal AddOut : std_logic_vector(15 downto 0);
signal DataOut : std_logic_vector(15 downto 0);
signal VFlag : std_logic;
signal CFlag : std_logic;
signal NFlag : std_logic;
signal ZFlag : std_logic;
signal Reg0 : std_logic_vector(15 downto 0); --reg0
signal Reg1 : std_logic_vector(15 downto 0); --reg1
signal Reg2 : std_logic_vector(15 downto 0); --reg2
signal Reg3 : std_logic_vector(15 downto 0); --reg3
signal Reg4 : std_logic_vector(15 downto 0); --reg4
signal Reg5 : std_logic_vector(15 downto 0); --reg5
signal Reg6 : std_logic_vector(15 downto 0); --reg6
signal Reg7 : std_logic_vector(15 downto 0); --reg7

signal PC : std_logic_vector(15 downto 0);
signal TD : std_logic;
signal TA : std_logic;
signal TB : std_logic;
signal MB : std_logic;
signal FS : std_logic_vector(4 downto 0);
signal MD : std_logic;
signal RW : std_logic;
signal MM : std_logic;
signal MW : std_logic;
signal DR : std_logic_vector(2 downto 0);
signal SA : std_logic_vector(2 downto 0);
signal SB : std_logic_vector(2 downto 0);

signal memOut : std_logic_vector(15 downto 0);
signal pcOut : std_logic_vector(15 downto 0);


begin

    MC : micro_control
        port map(
            Vflag => VFlag,
            Cflag => CFlag,
            Nflag => NFlag,
            Zflag => Zflag,
            instruction => memOut,
            clk => clk,
            PC => pcOut,
            TD => TD,
            TA => TA,
            TB => TB,
            MB => MB,
            FS => FS,
            MD => MD,
            RW => RW,
            MM => MM,
            MW => MW,
            DR => DR,
            SA => SA,
            SB => SB
        );

    DP : Datapath
        port map(
            DIn => memOut,
            FS => FS,
            SB => SB,
            MBSel => MB,
            MDSel => MD,
            PC => pcOut,
            MM => MM,
            ASel(2 downto 0) => SA,
            ASel(3) => TD,
            BSel(2 downto 0) => SB,
            BSel(3) => TD,
            DSel(2 downto 0) => DR,
            DSel(3) => TD,
            Clk => clk,
            RW => RW,
            AddOut => AddOut,
            DataOut => DataOut,
            Reg0 => Reg0,
            Reg1 => Reg1,
            Reg2 => Reg2,
            Reg3 => Reg3,
            Reg4 => Reg4,
            Reg5 => Reg5,
            Reg6 => Reg6,
            Reg7 => Reg7,
            VFlag => VFlag,
            CFlag => CFlag,
            NFlag => NFlag,
            ZFlag => ZFlag
        );
        
    mem : memory 
        port map(
            address => AddOut,
            DataIn => DataOut,
            MW => MW,
            DataOut => memOut
        );

end Behavioral;
