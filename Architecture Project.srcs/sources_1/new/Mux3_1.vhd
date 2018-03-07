library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux3_1 is
  Port (
    In0: in std_logic;
    In1: in std_logic;
    In2: in std_logic;
    S0: in std_logic;
    S1: in std_logic;
    Z: out std_logic        
  );
end mux3_1;

architecture Behavioral of Mux3_1 is

begin
    Z <= In0 after 5ns when S1='0' and S0= '0' else
    In1 after 5ns when S1='0' and S0='1' else
    In2 after 5ns when S1='1' and S0='0';
end Behavioral;
