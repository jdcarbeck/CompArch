library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux4_4bit is
	Port ( In0, In1, In2, In3, In4, In5, In6, In7: in std_logic_vector(15 downto 0);
		S0, S1, S2 : in std_logic;
		Z : out std_logic_vector(15 downto 0));
end mux4_4bit;

architecture Behavioral of mux4_4bit is
begin
	Z <= In0 after 5 ns when S0='0' and S1='0' and S2 = '0' else
	In1 after 5 ns when S0='0' and S1='0' and S2 = '1'  else
	In2 after 5 ns when S0='0' and S1='1' and S2 = '0'  else
	In3 after 5 ns when S0='0' and S1='1' and S2 = '1'  else
	In4 after 5 ns when S0='1' and S1='0' and S2 = '0'  else
	In5 after 5 ns when S0='1' and S1='0' and S2 = '1'  else
	In6 after 5 ns when S0='1' and S1='1' and S2 = '0'  else
	In7 after 5 ns when S0='1' and S1='1' and S2 = '1'  else
	"0000000000000000" after 5 ns;
end Behavioral;