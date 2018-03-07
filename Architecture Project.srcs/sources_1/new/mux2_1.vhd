library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Mux2_1 is
    Port (
        In0 : in std_logic;
        In1 : in std_logic;
        s : in std_logic;
        Z : out std_logic
    );
end Mux2_1;

architecture Behavioral of Mux2_1 is

begin

    Z <= In0 after 1ns when s ='0' else
    In1 after 1ns when s = '1';

end Behavioral;
