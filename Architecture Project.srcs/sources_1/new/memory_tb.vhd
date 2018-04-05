library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory_tb is
--  Port ( );
end memory_tb;

architecture Behavioral of memory_tb is

    component memory
        port (
            address: in std_logic_vector(15 downto 0);
            DataIn : in std_logic_vector(15 downto 0);
            clk : in std_logic;
            MW : in std_logic;
            DataOut: out std_logic_vector(15 downto 0)
        );
    end component;

    signal address : std_logic_vector(15 downto 0);
    signal DataIn : std_logic_vector(15 downto 0);
    signal clk : std_logic;
    signal MW : std_logic;
    signal DataOut : std_logic_vector(15 downto 0);

begin

    UTT: memory
        port map(
            address => address,
            DataIn => DataIn,
            clk => clk,
            MW => MW,
            DataOut => DataOut
        );

    process
        begin
        --read address
        address <= x"0002";
        DataIn <= x"0000";
        MW <= '0';
        clk <= '1';
        wait for 10ns;
        clk <= '0';
        wait for 10ns;
        --write address
        address <= x"0002";
        DataIn <= x"0001";
        MW <= '1';
        clk <= '1';
        wait for 10ns;
        clk <= '0';
        wait for 10ns;
        --read address
        address <= x"0002";
        DataIn <= x"0000";
        MW <= '0';
        clk <= '1';
        wait for 10ns;
        clk <= '0';
        wait for 10ns;
    end process;

end Behavioral;
