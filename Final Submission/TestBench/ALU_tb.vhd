library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
    
    component ALU
        Port ( 
        Cin : in std_logic;
        A: in std_logic;
        B: in std_logic;
        S0: in std_logic;
        S1: in std_logic;
        S2: in std_logic;
        G: out std_logic;
        Cout : out std_logic
      );
    end component;

signal Cin, A, B, S0, S1, S2, G, Cout : std_logic := '0';

begin

    UTT: ALU
        port map (
            Cin => Cin,
            A => A,
            B => B,
            S0 => S0,
            S1 => S1,
            S2 => S2,
            G => G,
            Cout => Cout
        );

    process
    begin
    Cin <= '0';
    A <= '0';
    B <= '0';
    S0 <= '0';    
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A
    Cin <= '0';
    A <= '1';
    B <= '0';
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A + 1
    Cin <= '1';
    A <= '1';
    B <= '0';
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A + B
    Cin <= '0';
    A <= '1';
    B <= '1';
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A + B + 1
    Cin <= '1';
    A <= '1';
    B <= '1';
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A + B'
    Cin <= '0';
    A <= '1';
    B <= '0';
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A + B' + 1
    Cin <= '1';
    A <= '1';
    B <= '0';
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A - 1
    Cin <= '0';
    A <= '1';
    B <= '0';
    S0 <= '1';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A
    Cin <= '1';
    A <= '0';
    B <= '0';
    S0 <= '1';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    
    --Z = A * B
    Cin <= '0';
    A <= '0';
    B <= '0';
    S0 <= '0';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    
    --Z = A + B
    Cin <= '0';
    A <= '1';
    B <= '0';
    S0 <= '1';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    
    --Z = A xor B
    Cin <= '0';
    A <= '1';
    B <= '0';
    S0 <= '0';
    S1 <= '1';
    S2 <= '1';
    wait for 10ns;
    
    --Z = A'
    Cin <= '0';
    A <= '0';
    B <= '0';
    S0 <= '1';
    S1 <= '1';
    S2 <= '1';
    wait for 10ns;
    
    Cin <= '0';
    A <= '0';
    B <= '0';
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    wait for 1000ns;
    end process;

end Behavioral;
