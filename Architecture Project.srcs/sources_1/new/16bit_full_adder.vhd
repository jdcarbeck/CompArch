library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_circuit_16bit is
    Port ( 
        A: in std_logic_vector(15 downto 0);
        B: in std_logic_vector(15 downto 0);
        Cin: in std_logic;
        Cout: out std_logic;
        S0: in std_logic;   --Gsel flags for changin value of B
        S1: in std_logic;
        V: out std_logic; --Overflow flag
        Z: out std_logic_vector(15 downto 0)
    );
end arithmetic_circuit_16bit;

architecture Behavioral of arithmetic_circuit_16bit is

    component arithmetic_circuit
        Port ( 
            A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            Cout: out std_logic;
            S0: in std_logic;
            S1: in std_logic;
            Z: out std_logic
        );
    end component;

signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15 : std_logic;

begin
    FA00: arithmetic_circuit port map (A => A(0), B => B(0), Cin => Cin, Cout => C0, S0 => S0, S1 => S1, Z => Z(0));
    FA01: arithmetic_circuit port map (A => A(1), B => B(1), Cin => C0, Cout => C1, S0 => S0, S1 => S1, Z => Z(1));
    FA02: arithmetic_circuit port map (A => A(2), B => B(2), Cin => C1, Cout => C2, S0 => S0, S1 => S1, Z => Z(2));
    FA03: arithmetic_circuit port map (A => A(3), B => B(3), Cin => C2, Cout => C3, S0 => S0, S1 => S1, Z => Z(3));
    FA04: arithmetic_circuit port map (A => A(4), B => B(4), Cin => C3, Cout => C4, S0 => S0, S1 => S1, Z => Z(4));
    FA05: arithmetic_circuit port map (A => A(5), B => B(5), Cin => C4, Cout => C5, S0 => S0, S1 => S1, Z => Z(5));
    FA06: arithmetic_circuit port map (A => A(6), B => B(6), Cin => C5, Cout => C6, S0 => S0, S1 => S1, Z => Z(6));
    FA07: arithmetic_circuit port map (A => A(7), B => B(7), Cin => C6, Cout => C7, S0 => S0, S1 => S1, Z => Z(7));
    FA08: arithmetic_circuit port map (A => A(8), B => B(8), Cin => C7, Cout => C8, S0 => S0, S1 => S1, Z => Z(8));
    FA09: arithmetic_circuit port map (A => A(9), B => B(9), Cin => C8, Cout => C9, S0 => S0, S1 => S1, Z => Z(9));
    FA10: arithmetic_circuit port map (A => A(10), B => B(10), Cin => C9, Cout => C10, S0 => S0, S1 => S1, Z => Z(10));
    FA11: arithmetic_circuit port map (A => A(11), B => B(11), Cin => C10, Cout => C11, S0 => S0, S1 => S1, Z => Z(11));
    FA12: arithmetic_circuit port map (A => A(12), B => B(12), Cin => C11, Cout => C12, S0 => S0, S1 => S1, Z => Z(12));
    FA13: arithmetic_circuit port map (A => A(13), B => B(13), Cin => C12, Cout => C13, S0 => S0, S1 => S1, Z => Z(13));
    FA14: arithmetic_circuit port map (A => A(14), B => B(14), Cin => C13, Cout => C14, S0 => S0, S1 => S1, Z => Z(14));
    FA15: arithmetic_circuit port map (A => A(15), B => B(15), Cin => C14, Cout => C15, S0 => S0, S1 => S1, Z => Z(15));

    V <= C14 xor C15 after 5ns;
    Cout <= C15 after 5ns;

end Behavioral;
