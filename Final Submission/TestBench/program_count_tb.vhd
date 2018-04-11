library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity program_count_tb is
--  Port ( );
end program_count_tb;

architecture Behavioral of program_count_tb is

    component program_count
        port (
            PCin : in std_logic_vector(15 downto 0);
            PL : in std_logic;
            PI : in std_logic;
            reset : in std_logic;
            clk : in std_logic;
            PCout : out std_logic_vector(15 downto 0)
        );
    end component;

    signal PCin, PCout : std_logic_vector(15 downto 0) := x"0000";
    signal PL, PI, clk, reset : std_logic := '0';

begin
    UTT: program_count
        port map (
            PCin => PCin,
            PL => PL,
            PI => PI,
            clk => clk,
            reset => reset,
            PCout => PCout
        );
        
process begin
    reset <= '1';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    reset <= '0';
    wait for 10ns;
    PCin <= x"0001";
    PL <= '1';
    PI <= '0';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
    PCin <= x"0001";
    PL <= '0';
    PI <= '1';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
    PCin <= x"0003";
    PL <= '1';
    PI <= '1';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
    PCin <= x"0002";
    PL <= '0';
    PI <= '0';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
end process;

end Behavioral;
