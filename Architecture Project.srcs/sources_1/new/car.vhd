library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


entity CAR is
 Port ( 
       --Either Next Address (NA) or Opcode from IR
       B : in std_logic_vector(7 downto 0);
       A : in std_logic;
       clk : in std_logic;
       z : out std_logic_vector(7 downto 0)
      );
end CAR;

architecture Behavioral of CAR is

begin

z <= std_logic_vector(to_unsigned(to_integer(unsigned( B )) + 1, 8)) after 1ns when A = '1' and clk = '1' 
           else B after 1ns when A = '0' and clk = '1';

end Behavioral;