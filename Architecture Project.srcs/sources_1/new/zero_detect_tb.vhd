library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detect_tb is
--  Port ( );
end zero_detect_tb;

architecture Behavioral of zero_detect_tb is

    component zero_detect
        Port ( 
            I: in std_logic_vector(15 downto 0);
            O: out std_logic
        );
    end component;

    signal I : std_logic_vector(15 downto 0);
    signal O : std_logic;

begin

    UTT: zero_detect
        port map(
            I => I,
            O => O
        );

    process
    begin
    I <= x"0000";
    wait for 10ns;
    I <= x"0001";
    wait for 10ns;
    end process;
    
end Behavioral;
