library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Extend_tb is
--  Port ( );
end Extend_tb;

architecture Behavioral of Extend_tb is

    component Extend
        Port ( 
            DRSB : in std_logic_vector(5 downto 0);
            Ext : out std_logic_vector(15 downto 0)
        );
    end component;

    signal DRSB : std_logic_vector(5 downto 0);
    signal Ext : std_logic_vector(15 downto 0);

begin

    UTT: Extend
        port map(
            DRSB => DRSB,
            Ext => Ext
        );

process
    begin
    DRSB <= "111111";
    wait for 10ns;
end process;

end Behavioral;
