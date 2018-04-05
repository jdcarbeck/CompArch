library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car_tb is
--  Port ( );
end car_tb;

architecture Behavioral of car_tb is

    component car
        port (
            A : in std_logic;
            clk : in std_logic;
            reset: in std_logic;
            B : in std_logic_vector(7 downto 0);
            z : out std_logic_vector(7 downto 0)
        );
    end component;

    signal A, clk, reset: std_logic := '0';
    signal B, z : std_logic_vector(7 downto 0) := x"00";

begin

    UTT: car
        port map (
            A => A,
            clk => clk,
            reset => reset,
            B => B,
            z => z
        );

process begin
    A <= '0';
    B <= x"00";
    reset <= '1';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    reset <= '0';
    wait for 10ns;
    
    A <= '0';
    B <= x"01";
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
   
    A <= '1';
    B <= x"01";
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
end process;


end Behavioral;
