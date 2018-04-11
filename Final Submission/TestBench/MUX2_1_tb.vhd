library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX2_1_tb is
--  Port ( );
end MUX2_1_tb;

architecture Behavioral of MUX2_1_tb is

    component MUX2_1
        Port (
            In0 : in std_logic;
            In1 : in std_logic;
            s : in std_logic;
            Z : out std_logic
        );
    end component;

signal In0, In1, s, Z : std_logic := '0';

begin

    UTT: MUX2_1
        port map (
            In0 => In0,
            In1 => In1,
            s => s,
            Z => Z
        );

    process
    begin
    In0 <= '1';
    In1 <= '0';
    s <= '0';
    wait for 10ns;

    In0 <= '0';
    In1 <= '1';
    s <= '1';
    wait for 10ns;
    
    end process;

end Behavioral;
