library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_reg is
    Port ( 
        IRin : in std_logic_vector(15 downto 0);
        IL : in std_logic;
        clk : in std_logic;
        Opcode : out std_logic_vector(6 downto 0);
        DR : out std_logic_vector(2 downto 0);
        SA : out std_logic_vector(2 downto 0);
        SB : out std_logic_vector(2 downto 0)
    );
end instruction_reg;

architecture Behavioral of instruction_reg is

signal IRout : std_logic_vector(15 downto 0);

begin

    IRout <= IRin after 1 ns when IL = '1' else
             IRout after 1 ns;

    SB <= IRout(2 downto 0) when clk = '1';
    SA <= IRout(5 downto 3) when clk = '1';
    DR <= IRout(8 downto 6) when clk = '1';
    Opcode <= IRout(15 downto 9) when clk = '1';
    

end Behavioral;
