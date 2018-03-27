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
            Reg7: out std_logic_vector(15 downto 0);  --reg7
            temp: out std_logic_vector(15 downto 0)  --temp reg
        );
    end component;

    signal Asel : std_logic_vector(3 downto 0) := "0000";
    signal Bsel : std_logic_vector(3 downto 0) := "0000";
    signal Dsel : std_logic_vector(3 downto 0) := "0000";
    signal Clk, RW: std_logic := '0';
    signal Ddata : std_logic_vector(15 downto 0) := x"0000";
    signal Adata : std_logic_vector(15 downto 0) := x"0000";
    signal Bdata : std_logic_vector(15 downto 0) := x"0000";
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7, temp: std_logic_vector(15 downto 0);

begin
    
    UTT: RegFile
        port map(
            Asel => Asel,
            Bsel => Bsel,
            Dsel => Dsel,
            Clk => Clk,
            RW => RW,
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
            reg7 => reg7,
            temp => temp
        );
    
    process
    begin
        RW <= '1';
        Ddata <= x"0000";
        Dsel <= "0000";
        Asel <= "0000";
        Bsel <= "0000";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"1111";
        Dsel <= "0001";
        Asel <= "0001";
        Bsel <= "0001";
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
 
        Ddata <= x"2222";
        Dsel <= "0010";
        Asel <= "0010";
        Bsel <= "0010";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"3333";
        Dsel <= "0011";
        Asel <= "0011";
        Bsel <= "0011";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
    
        Ddata <= x"4444";
        Dsel <= "0100";
        Asel <= "0100";
        Bsel <= "0100";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"5555";
        Dsel <= "0101";
        Asel <= "0101";
        Bsel <= "0101";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"6666";
        Dsel <= "0110";
        Asel <= "0110";
        Bsel <= "0110";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"7777";
        Dsel <= "0111";
        Asel <= "0111";
        Bsel <= "0111";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
        
        Ddata <= x"9999";
        Dsel <= "1000";
        Asel <= "1000";
        Bsel <= "1000";   
        wait for 10ns;
        Clk <= '1';
        wait for 10ns;
        Clk <= '0';
  
    wait for 1000ns;
    end process;


end Behavioral;
