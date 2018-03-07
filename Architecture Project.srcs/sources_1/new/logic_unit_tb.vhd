library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_unit_tb is
--  Port ( );
end logic_unit_tb;

architecture Behavioral of logic_unit_tb is

    component logic_unit
        Port ( 
            S0: in std_logic;
            S1: in std_logic;
            A: in std_logic;
            B: in std_logic;
            G: out std_logic
        );
    end component;

signal S0, S1, A, B, G : std_logic := '0';

begin

    UTT: logic_unit
        Port map( 
            S0 => S0,
            S1 => S1,
            A => A,
            B => B,
            G => G
        );

    process
    begin
    -- A and B
    A <= '1';
    B <= '1';
    S0 <= '0';
    S1 <= '0';
    wait for 10ns;
    
    -- A or B
    A <= '0';
    B <= '1';
    S0 <= '1';
    S1 <= '0';
    wait for 10ns;
    
    -- A xor B
    A <= '0';
    B <= '1';
    S0 <= '0';
    S1 <= '1';
    wait for 10ns;
    
    --not A
    A <= '0';
    B <= '0';
    S0 <= '1';
    S1 <= '1';
    wait for 10ns;
    
    end process;

end Behavioral;
