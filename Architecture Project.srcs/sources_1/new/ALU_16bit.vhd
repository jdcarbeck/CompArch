library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_16bit is
    Port ( 
           Gsel: in std_logic_vector(3 downto 0);
           A: in std_logic_vector(15 downto 0);
           B: in std_logic_vector(15 downto 0);
           VFlag: out std_logic;
           CFlag: out std_logic;
           NFlag: out std_logic;
           ZFlag: out std_logic;
           Gout: out std_logic_vector(15 downto 0)
      ); 
end ALU_16bit;

architecture Behavioral of ALU_16bit is

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
    
    component zero_detect
        Port ( 
            I: in std_logic_vector(15 downto 0);
            O: out std_logic
        ); 
    end component;
    
    signal C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, Cout, Zout : std_logic;
    signal output : std_logic_vector(15 downto 0);
begin

    ALU00: ALU 
        port map(
            Cin => Gsel(0), 
            A => A(0), 
            B => B(0), 
            S0 => Gsel(1), 
            S1 => Gsel(2),
            S2 => Gsel(3),
            G => output(0),
            Cout => C1
         );

    ALU01: ALU 
        port map(
            Cin => C1, 
            A => A(1), 
            B => B(1), 
            S0 => Gsel(1), 
            S1 => Gsel(2),
            S2 => Gsel(3),
            G => output(1),
            Cout => C2
         );
         
    ALU02: ALU 
         port map(
             Cin => C2, 
             A => A(2), 
             B => B(2), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(2),
             Cout => C3
         );
         
    AL03: ALU
         port map(
             Cin => C3, 
             A => A(3), 
             B => B(3), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(3),
             Cout => C4
         );

    AL04: ALU
         port map(
             Cin => C4, 
             A => A(4), 
             B => B(4), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(4),
             Cout => C5
         );

    AL05: ALU
         port map(
             Cin => C5, 
             A => A(5), 
             B => B(5), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(5),
             Cout => C6
         );

    AL06: ALU
         port map(
             Cin => C6, 
             A => A(6), 
             B => B(6), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(6),
             Cout => C7
         );

    AL07: ALU
         port map(
             Cin => C7, 
             A => A(7), 
             B => B(7), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(7),
             Cout => C8
         );

    AL08: ALU
         port map(
             Cin => C8, 
             A => A(8), 
             B => B(8), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(8),
             Cout => C9
         );

    AL09: ALU
         port map(
             Cin => C9, 
             A => A(9), 
             B => B(9), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(9),
             Cout => C10
         );

    AL10: ALU
         port map(
             Cin => C10, 
             A => A(10), 
             B => B(10), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(10),
             Cout => C11
         );

    AL11: ALU
         port map(
             Cin => C11, 
             A => A(11), 
             B => B(11), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(11),
             Cout => C12
         );

    AL12: ALU
         port map(
             Cin => C12, 
             A => A(12), 
             B => B(12), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(12),
             Cout => C13
         );

    AL13: ALU
         port map(
             Cin => C13, 
             A => A(13), 
             B => B(13), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(13),
             Cout => C14
         );

    AL14: ALU
         port map(
             Cin => C14, 
             A => A(14), 
             B => B(14), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(14),
             Cout => C15
         );

    AL15: ALU
         port map(
             Cin => C15, 
             A => A(15), 
             B => B(15), 
             S0 => Gsel(1), 
             S1 => Gsel(2),
             S2 => Gsel(3),
             G => output(15),
             Cout => Cout
         );
    
    Gout <= output;
    
    ZDET: zero_detect
        port map (
            I => output,
            O => Zout
        );
         
    VFlag <= (C15 xor Cout) after 1ns;
    CFlag <= Cout after 1ns;
    NFlag <= output(15) after 1ns;
    ZFlag <= Zout after 1ns;
    
end Behavioral;
