library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Datapath_tb is
--  Port ( );
end Datapath_tb;

architecture Behavioral of Datapath_tb is

    component Datapath
        Port (
            DIn: in std_logic_vector(15 downto 0);
            FS: in std_logic_vector(4 downto 0);
            SB: in std_logic_vector(2 downto 0); --con in
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
            temp_reg: out std_logic_vector(15 downto 0);
            VFlag: out std_logic;
            CFlag: out std_logic;
            NFlag: out std_logic;
            ZFlag: out std_logic
            );
    end component;

    signal DIn : std_logic_vector(15 downto 0) := x"0000";
    signal FS : std_logic_vector(4 downto 0) := "00000";
    signal SB : std_logic_vector(2 downto 0) := "000";
    signal MBSel : std_logic := '0';
    signal MDSel : std_logic := '0';
    signal PC : std_logic_vector(15 downto 0);
    signal MM : std_logic;
    signal Asel : std_logic_vector(3 downto 0) := "0000";
    signal Bsel : std_logic_vector(3 downto 0) := "0000";
    signal Dsel : std_logic_vector(3 downto 0) := "0000";
    signal Clk : std_logic := '0';
    signal RW : std_logic;
    signal AddOut : std_logic_vector(15 downto 0) := x"0000";
    signal DataOut : std_logic_vector(15 downto 0) := x"0000";
    signal Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, temp_reg : std_logic_vector(15 downto 0) := x"0000";
    signal VFlag : std_logic := '0';
    signal CFlag : std_logic := '0';
    signal NFlag : std_logic := '0';
    signal ZFlag : std_logic := '0';
  
begin

    UTT: Datapath
        port map (
            DIn => DIn,
            FS => FS,
            SB => SB,
            MBSel => MBSel,
            MDSel => MDSel,
            PC => PC,
            MM => MM,
            Asel => Asel,
            Bsel => Bsel,
            Dsel => Dsel,
            Clk => Clk,
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
            temp_Reg => temp_Reg,
            VFlag => VFlag,
            CFlag => CFlag, 
            NFlag => NFlag,
            ZFlag => ZFlag
        );
         
         
    
    process
    begin
    -- Load a value into each reg
    --R0 = 0
    Din <= x"0000";
    RW <= '1';
    MM <= '0';
    MBSel <= '0';
    PC <= x"0000";
    MDSel <= '1';
    Dsel <= "0000";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --R1 = 1
    Din <= x"00f0";
    MDSel <= '1';
    Dsel <= "0001";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --R2 = 2
    Din <= x"0005";
    MDSel <= '1';
    Dsel <= "0010";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --R3 = 3
    Din <= x"8000";
    MDSel <= '1';
    Dsel <= "0011";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --R4 = 4
    Din <= x"7FFF";
    MDSel <= '1';
    Dsel <= "0100";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --R5 = 5
    Din <= x"000C";
    MDSel <= '1';
    Dsel <= "0101";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --R6 = 6
    Din <= x"AAAA";
    MDSel <= '1';
    Dsel <= "0110";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --R7 = 7
    Din <= x"5555";
    MDSel <= '1';
    Dsel <= "0111";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --temp reg = 9
    Din <= x"0009";
    MDSel <= '1';
    Dsel <= "1000";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    --transfer between R7 and R0
    DSel <= "0000";
    ASel <= "0111";
    BSel <= "0001";
    MDSel <= '0';
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';     
    
    --PC to address out 
    PC <= x"0001";
    MM <= '1';
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';   
    
      
    --F = A proved by operations above
    -- F will be stored in R0
    
    -- F = R1 + 1
    ASel <= "0000";
    MDSel <= '0';
    MM <= '0';
    FS <= "00001";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A + B
    ASel <= "0001";
    BSel <= "0010";
    MDSel <= '0';
    FS <= "00010";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A + B + 1
    ASel <= "0011";
    BSel <= "0100";
    MDSel <= '0';
    FS <= "00011";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
   
    -- F = A + B'
    ASel <= "0001";
    BSel <= "0010";
    MDSel <= '0';
    FS <= "00100";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
   
    -- F = A + B' + 1
    ASel <= "0001";
    BSel <= "0010";
    MDSel <= '0';
    FS <= "00101";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A - 1
    ASel <= "0001";
    BSel <= "0010";
    MDSel <= '0';
    FS <= "00110";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A
    ASel <= "0010";
    BSel <= "0000";
    MDSel <= '0';
    FS <= "00111";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A * B
    ASel <= "0100";
    BSel <= "0101";
    MDSel <= '0';
    FS <= "01000";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A + B
    ASel <= "0010";
    BSel <= "0101";
    MDSel <= '0';
    FS <= "01010";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A xor B
    ASel <= "0110";
    BSel <= "0111";
    MDSel <= '0';
    FS <= "01100";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = A'
    ASel <= "0010";
    BSel <= "0101";
    MDSel <= '0';
    FS <= "01110";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = B
    ASel <= "0010";
    BSel <= "0001";
    MDSel <= '0';
    FS <= "10000";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = srB
    ASel <= "0001";
    BSel <= "0001";
    MDSel <= '0';
    FS <= "10100";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    -- F = slB
    ASel <= "0010";
    BSel <= "0001";
    MDSel <= '0';
    FS <= "11000";
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
    Clk <= '0';
    
    wait for 10000ns; 
    end process;
        
end Behavioral;

--Instuctions

