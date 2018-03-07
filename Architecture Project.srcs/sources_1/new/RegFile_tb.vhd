library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegFile_tb is
--  Port ( );
end RegFile_tb;

architecture Behavioral of RegFile_tb is

    component RegFile
        Port ( 
            Asel : in std_logic_vector(2 downto 0);
            Bsel : in std_logic_vector(2 downto 0);
            Dsel : in std_logic_vector(2 downto 0);
            Clk : in std_logic;
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

    signal Asel : std_logic_vector(2 downto 0) := "000";
    signal Bsel : std_logic_vector(2 downto 0) := "000";
    signal Dsel : std_logic_vector(2 downto 0) := "000";
    signal Clk : std_logic := '0';
    signal Ddata : std_logic_vector(15 downto 0) := x"0000";
    signal Adata : std_logic_vector(15 downto 0) := x"0000";
    signal Bdata : std_logic_vector(15 downto 0) := x"0000";
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);

begin
    
    UTT: RegFile
        port map(
            Asel => Asel,
            Bsel => Bsel,
            Dsel => Dsel,
            Clk => Clk,
            Ddata => Ddata,
            Adata => Adata,
            Bdata => Bdata,
            reg0 => reg0,
            reg1 => reg1,
            reg2 => reg2,
            reg3 => reg3,
            reg4 => reg4,
            reg5 => reg5,
            reg6 => reg6,
            reg7 => reg7
        );
    
    process
    begin
        Ddata <= x"0000";
        Dsel <= "000";
        Asel <= "000";
        Bsel <= "000";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"1111";
        Dsel <= "001";
        Asel <= "001";
        Bsel <= "001";
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
 
        Ddata <= x"2222";
        Dsel <= "010";
        Asel <= "010";
        Bsel <= "010";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"3333";
        Dsel <= "011";
        Asel <= "011";
        Bsel <= "011";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
    
        Ddata <= x"4444";
        Dsel <= "100";
        Asel <= "100";
        Bsel <= "100";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"5555";
        Dsel <= "101";
        Asel <= "101";
        Bsel <= "101";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"6666";
        Dsel <= "110";
        Asel <= "110";
        Bsel <= "110";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"7777";
        Dsel <= "111";
        Asel <= "111";
        Bsel <= "111";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
    wait for 1000ns;
    end process;


end Behavioral;
