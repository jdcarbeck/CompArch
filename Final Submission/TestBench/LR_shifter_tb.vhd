library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LR_shifter_tb is
--  Port ( );
end LR_shifter_tb;

architecture Behavioral of LR_shifter_tb is

    component LR_shifter_16bit
        port( 
            B: in std_logic_vector(15 downto 0);
            Hsel: in std_logic_vector(1 downto 0);
            H: out std_logic_vector(15 downto 0)
        );
    end component;

    signal B : std_logic_vector(15 downto 0) := x"0000";
    signal Hsel : std_logic_vector(1 downto 0) := "00";
    signal H : std_logic_vector(15 downto 0) := x"0000";    
 
begin

    UTT: LR_shifter_16bit
        port map (
            B => B,
            Hsel => Hsel,
            H => H
        );

    process
    begin
    B <= x"FFFF";
    Hsel <= "00";
    wait for 10ns;
    
    B <= x"FFFF";
    Hsel <= "01";
    wait for 10ns;
    
    B <= x"FFFF";
    Hsel <= "10";
    wait for 10ns;   
    
    end process;

end Behavioral;
