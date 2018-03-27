library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity program_count is
    Port ( 
        PCin : in std_logic_vector(15 downto 0);
        PL : in std_logic;
        PI : in std_logic;
        clk : in std_logic;
        PCout : out std_logic_vector(15 downto 0)
    );
end program_count;

architecture Behavioral of program_count is

signal PCinter : std_logic_vector(15 downto 0);

begin

PCinter <= PCin after 1ns when PL = '1' else
            PCinter after 1ns;

PCout <= std_logic_vector(to_unsigned(to_integer(unsigned( PCinter )) + 1, 16)) after 1ns when PI = '1' and clk = '1' 
           else PCinter after 1ns when PI = '0' and clk = '1';

end Behavioral;
