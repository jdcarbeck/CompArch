library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is
    Port ( 
        A: in std_logic;
        B: in std_logic;
        Cin: in std_logic;
        Cout: out std_logic;
        Sum: out std_logic
    );
end full_adder;

architecture Behavioral of full_adder is
    
    
    
begin
    Sum <= (A xor B) xor Cin after 1ns;
    Cout <= ((A xor B) and Cin) or (A and B) after 1ns;
end Behavioral;
