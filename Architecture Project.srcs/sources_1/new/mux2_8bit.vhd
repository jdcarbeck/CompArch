library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2_8bit is
    Port ( 
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        sel : in std_logic;
        z : out std_logic_vector
    );
end mux2_8bit;

architecture Behavioral of mux2_8bit is

begin

z <= A after 1ns when sel='0' else
    B after 1ns;

end Behavioral;
