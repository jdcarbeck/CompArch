library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Zero_fill_tb is
-- Port();
end Zero_fill_tb;

architecture Behavioral of Zero_fill_tb is

    component Zero_fill
        Port ( 
            SB : in std_logic_vector(2 downto 0);
            zeroFill : out std_logic_vector(15 downto 0)
        );
    end component;

    signal SB : std_logic_vector(2 downto 0);
    signal zeroFill : std_logic_vector(15 downto 0);

begin

    UTT: Zero_fill
        port map(
            SB => SB,
            zeroFill => zeroFill
        );

    process
    begin
    SB <= "111";
    wait for 10ns;
    end process;

end Behavioral;