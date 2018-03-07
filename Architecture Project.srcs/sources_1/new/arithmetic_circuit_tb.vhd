library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_circuit_tb is
--  Port ( );
end arithmetic_circuit_tb;

architecture Behavioral of arithmetic_circuit_tb is

    component arithmetic_circuit
        Port ( 
           A: in std_logic;
           B: in std_logic;
           Cin: in std_logic;
           S0: in std_logic;
           S1: in std_logic;
           Z: out std_logic;
           Cout: out std_logic
        );
    end component;

signal A, B, Cin, Cout, S0, S1, Z : std_logic := '0';

begin

    UTT: arithmetic_circuit
        Port map ( 
           A => A,
           B => B,
           Cin => Cin,
           S0 => S0,
           S1 => S1,
           Cout => Cout,
           Z => Z
        );

    process
    begin 
    -- Z = A
    A <= '1';
    B <= '0';
    Cin <= '0';
    S0 <= '0';
    S1 <= '0';
    wait for 10ns;
    
    --Z = A + 1
    A <= '0';
    B <= '0';
    Cin <= '1';
    S0 <= '0';
    S1 <= '0';
    wait for 10ns;
    
    --Z = A + B
    A <= '1';
    B <= '1';
    Cin <= '0';
    S0 <= '1';
    S1 <= '0';
    wait for 10ns;
    
    --Z = A + B + 1
    A <= '0';
    B <= '1';
    Cin <= '1';
    S0 <= '1';
    S1 <= '0';
    wait for 10ns;
    
    --Z = A + B'
    A <= '1';
    B <= '1';
    Cin <= '0';
    S0 <= '0';
    S1 <= '1';
    wait for 10ns;
    
    --Z = A + B' + 1
    A <= '1';
    B <= '1';
    Cin <= '1';
    S0 <= '0';
    S1 <= '1';
    wait for 10ns;
    
    --Z = A - 1
    A <= '1';
    B <= '0';
    Cin <= '0';
    S0 <= '1';
    S1 <= '1';
    wait for 10ns;
    
    --Z = A
    A <= '1';
    B <= '0';
    Cin <= '1';
    S0 <= '1';
    S1 <= '1';
    wait for 10ns;
    
    A <= '0';
    B <= '0';
    Cin <= '0';
    S0 <= '0';
    S1 <= '0';
    wait for 1000ns;
    
    end process;

end Behavioral;
