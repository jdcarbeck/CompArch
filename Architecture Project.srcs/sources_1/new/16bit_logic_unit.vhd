library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_unit_16bit is
    Port ( 
        S0: in std_logic;
        S1: in std_logic;
        A: in std_logic_vector(15 downto 0);
        B: in std_logic_vector(15 downto 0);
        G: out std_logic_vector(15 downto 0)
    );
end logic_unit_16bit;

architecture Behavioral of logic_unit_16bit is

    component logic_unit
        Port (
            S0: in std_logic;
            S1: in std_logic;
            A: in std_logic;
            B: in std_logic;
            G: out std_logic
        );
    end component;

begin

LU00: logic_unit port map (S0 => S0, S1 => S1, A => A(0), B => B(0), G => G(0));
LU01: logic_unit port map (S0 => S0, S1 => S1, A => A(1), B => B(1), G => G(1));
LU02: logic_unit port map (S0 => S0, S1 => S1, A => A(2), B => B(2), G => G(2));
LU03: logic_unit port map (S0 => S0, S1 => S1, A => A(3), B => B(3), G => G(3));
LU04: logic_unit port map (S0 => S0, S1 => S1, A => A(4), B => B(4), G => G(4));
LU05: logic_unit port map (S0 => S0, S1 => S1, A => A(5), B => B(5), G => G(5));
LU06: logic_unit port map (S0 => S0, S1 => S1, A => A(6), B => B(6), G => G(6));
LU07: logic_unit port map (S0 => S0, S1 => S1, A => A(7), B => B(7), G => G(7));
LU08: logic_unit port map (S0 => S0, S1 => S1, A => A(8), B => B(8), G => G(8));
LU09: logic_unit port map (S0 => S0, S1 => S1, A => A(9), B => B(9), G => G(9));
LU10: logic_unit port map (S0 => S0, S1 => S1, A => A(10), B => B(10), G => G(10));
LU11: logic_unit port map (S0 => S0, S1 => S1, A => A(11), B => B(11), G => G(11));
LU12: logic_unit port map (S0 => S0, S1 => S1, A => A(12), B => B(12), G => G(12));
LU13: logic_unit port map (S0 => S0, S1 => S1, A => A(13), B => B(13), G => G(13));
LU14: logic_unit port map (S0 => S0, S1 => S1, A => A(14), B => B(14), G => G(14));
LU15: logic_unit port map (S0 => S0, S1 => S1, A => A(15), B => B(15), G => G(15));

end Behavioral;
