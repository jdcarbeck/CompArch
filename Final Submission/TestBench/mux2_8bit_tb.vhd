library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2_8bit_tb is
--  Port ( );
end mux2_8bit_tb;

architecture Behavioral of mux2_8bit_tb is

    component mux2_8bit
        port (
            A : in std_logic_vector(7 downto 0);
            B : in std_logic_vector(7 downto 0);
            sel : in std_logic;
            z : out std_logic_vector(7 downto 0)
        );
    end component;

    signal A, B, z : std_logic_vector(7 downto 0) := x"00";
    signal sel : std_logic := '0';

begin

    UTT: mux2_8bit
        port map (
            A => A,
            B => B,
            sel => sel,
            z => z
        );

process begin
    A <= x"11";
    B <= x"22";
    sel <= '0';
    wait for 10ns;
    A <= x"11";
    B <= x"22";
    sel <= '1';
    wait for 10ns;
end process;

end Behavioral;
