library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is

    component full_adder
        Port ( 
            A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            Cout: out std_logic;
            Sum: out std_logic
        );
    end component;
    
    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal Cin : std_logic := '0';
    signal Cout : std_logic := '0';
    signal Sum : std_logic := '0';

begin

    UTT: full_adder
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Cout => Cout,
            Sum => Sum
        );

    process
    begin
    
    A <= '0';
    B <= '0';
    Cin <= '0';
    wait for 10ns;
    
    A <= '0';
    B <= '1';
    Cin <= '0';
    wait for 10ns;
    
    A <= '1';
    B <= '0';
    Cin <= '0';
    wait for 10ns;
    
    A <= '1';
    B <= '1';
    Cin <= '0';
    wait for 10ns;
    
    A <= '0';
    B <= '0';
    Cin <= '1';
    wait for 10ns;
    
    A <= '0';
    B <= '1';
    Cin <= '1';
    wait for 10ns;
    
    A <= '1';
    B <= '0';
    Cin <= '1';
    wait for 10ns;
    
    A <= '1';
    B <= '1';
    Cin <= '1';
    wait for 10ns;
    
    end process;
end Behavioral;
