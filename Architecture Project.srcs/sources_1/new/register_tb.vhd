library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_tb is
--  Port ( );
end register_tb;

architecture Behavioral of register_tb is
    COMPONENT reg16 is
    Port
    (
        D : in std_logic_vector(15 downto 0);
        load : in std_logic;
        Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0)
    );
    end COMPONENT;
    
    signal D : std_logic_vector(15 downto 0) := x"0000";
    signal load : std_logic := '0';
    signal Clk : std_logic := '0';
    signal Q : std_logic_vector(15 downto 0) := x"0000";
    
begin

    UTT: reg16
    Port map
    (
        D => D,
        load => load,
        Clk => Clk,
        Q => Q
    );
    
    process
    begin
    load <= '1';
    Clk <= '1';
    D <= x"FFFF";
    wait for 10ns;
    Clk <= '0';
    wait for 10ns;
    load <= '1';
    Clk <= '1';
    D <= x"AAAA";
    wait for 10ns;
    Clk <= '0';
    wait for 10ns;
    end process;
    
end Behavioral;
