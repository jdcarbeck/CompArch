library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux3_1_tb is
--  Port ( );
end mux3_1_tb;

architecture Behavioral of mux3_1_tb is

    component mux3_1
        Port (
            In0: in std_logic;
            In1: in std_logic;
            In2: in std_logic;
            S0: in std_logic;
            S1: in std_logic;
            Z: out std_logic        
        );
    end component;

    signal In0: std_logic := '0';
    signal In1: std_logic := '0';
    signal In2: std_logic := '0';
    signal S0: std_logic := '0';
    signal S1: std_logic := '0';
    signal Z: std_logic := '0';
    
begin

    UTT: mux3_1
        port map(
            In0 => In0,
            In1 => In1,
            In2 => In2,
            S0 => S0,
            S1 => S1,
            Z => Z    
        );

    process
    begin
    In0 <= '0';
    In1 <= '1';
    In2 <= '0';
    S0 <= '0';
    S1 <= '0';
    wait for 10ns;
    
    In0 <= '0';
    In1 <= '1';
    In2 <= '0';
    S0 <= '1';
    S1 <= '0';
    wait for 10ns;
    
    In0 <= '0';
    In1 <= '1';
    In2 <= '0';
    S0 <= '0';
    S1 <= '1';
    wait for 10ns;
    
    end process;
end Behavioral;
