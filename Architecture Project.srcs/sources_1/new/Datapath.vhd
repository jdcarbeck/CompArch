library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Datapath is
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
end Datapath;

architecture Behavioral of Datapath is

    component RegFile
        Port ( 
            Asel : in std_logic_vector(3 downto 0);
            Bsel : in std_logic_vector(3 downto 0);
            Dsel : in std_logic_vector(3 downto 0);
            Clk : in std_logic;
            RW : in std_logic;
            Ddata : in std_logic_vector(15 downto 0); --D bus
            Adata: out std_logic_vector(15 downto 0); --A bus
            Bdata: out std_logic_vector(15 downto 0); --B bus
            Reg0: out std_logic_vector(15 downto 0); --reg0
            Reg1: out std_logic_vector(15 downto 0); --reg1
            Reg2: out std_logic_vector(15 downto 0); --reg2
            Reg3: out std_logic_vector(15 downto 0); --reg3
            Reg4: out std_logic_vector(15 downto 0); --reg4
            Reg5: out std_logic_vector(15 downto 0); --reg5
            Reg6: out std_logic_vector(15 downto 0); --reg6
            Reg7: out std_logic_vector(15 downto 0)  --reg7
        );
    end component;

    component Functional_unit
        Port ( 
            A: in std_logic_vector(15 downto 0);
            B: in std_logic_vector(15 downto 0);
            FS: in std_logic_vector(4 downto 0);
            F: out std_logic_vector(15 downto 0);
            VFlag: out std_logic;
            CFlag: out std_logic;
            NFlag: out std_logic;
            ZFlag: out std_logic
        );
    end component;
    
    component mux2_16bit
        Port(
            In0 : in std_logic_vector(15 downto 0);
            In1 : in std_logic_vector(15 downto 0);
            s : in std_logic;
            Z : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component Zero_fill
        Port ( 
            SB : in std_logic_vector(2 downto 0);
            zeroFill : out std_logic_vector(15 downto 0)
        );
    end component;
    
    
    signal Data, BOut, ABus, BBus, Fsig, ConIn : std_logic_vector(15 downto 0);
    
begin

    reg: RegFile
        port map(
            Asel => Asel,
            Bsel => Bsel,
            Dsel => Dsel,
            RW => RW,
            Clk => Clk,
            Ddata => Data,
            Adata => ABus,
            Bdata => BOut,
            Reg0 => Reg0,
            Reg1 => Reg1,
            Reg2 => Reg2,
            Reg3 => Reg3,
            Reg4 => Reg4,
            Reg5 => Reg5,
            Reg6 => Reg6,
            Reg7 => Reg7
        );
     
   fu: Functional_unit
        port map(
            A => ABus,
            B => BBus,
            FS => FS,
            F => Fsig,
            VFlag => VFlag,
            CFlag => CFlag,
            NFlag => NFlag,
            ZFlag => ZFlag
        );
        
    mb_mux: mux2_16bit
        port map(
            In0 => BOut,
            In1 => ConIn,
            s => MBSel,
            Z => BBus
        );
       
    md_mux: mux2_16bit
        port map(
            In0 => Fsig,
            In1 => Din,
            s => MDsel,
            Z => Data
        );

    mm_mux: mux2_16bit
        port map(
            In0 => ABus,
            In1 => PC,
            s => MM,
            Z => Addout
        );
        
    zfill: Zero_fill
        port map(
            SB => SB,
            zeroFill => ConIn
        );
    
    DataOut <= BBus;    



end Behavioral;
