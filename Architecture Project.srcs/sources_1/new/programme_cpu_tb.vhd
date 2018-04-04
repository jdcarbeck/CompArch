library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity programme_cpu_tb is
--  Port ( );
end programme_cpu_tb;

architecture Behavioral of programme_cpu_tb is

    component programme_cpu
        Port (
            clk : in std_logic;
            reset: in std_logic;
            reg0: out std_logic_vector(15 downto 0);
            reg1: out std_logic_vector(15 downto 0);
            reg2: out std_logic_vector(15 downto 0);
            reg3: out std_logic_vector(15 downto 0);
            reg4: out std_logic_vector(15 downto 0);
            reg5: out std_logic_vector(15 downto 0);
            reg6: out std_logic_vector(15 downto 0);
            reg7: out std_logic_vector(15 downto 0)
        );
    end component;
    signal clk, reset : std_logic := '0';
    signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
begin


    UTT: programme_cpu 
        port map(
            clk => clk,
            reset => reset,
            reg0 => reg0,
            reg1 => reg1,
            reg2 => reg2,
            reg3 => reg3,
            reg4 => reg4,
            reg5 => reg5,
            reg6 => reg6,
            reg7 => reg7
        );

    process
        begin
            reset <= '1';
            clk <= '1';
            wait for 50 ns;
            reset <= '0';
            clk <= '0';
            wait for 50 ns;
            clk <= '1';
            wait for 50ns;
            clk <= '0';
            wait for 50ns;
            clk <= '1';
            wait for 50ns;
            clk <= '0';
            wait for 50ns;
            clk <= '1';
            wait for 50ns;
            clk <= '0';
            wait for 50ns;
            clk <= '1';
            wait for 50ns;
            clk <= '0';
            wait for 50ns;
            clk <= '1';
            wait for 50ns;
            clk <= '0';
            wait for 50ns;

    end process;
end Behavioral;
