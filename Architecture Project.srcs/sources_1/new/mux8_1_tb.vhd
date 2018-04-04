library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux8_1_tb is
--  Port ( );
end mux8_1_tb;

architecture Behavioral of mux8_1_tb is

    component mux8_1
    	Port ( 
    	   In0: in std_logic; 
    	   In1: in std_logic;
    	   In2: in std_logic; 
    	   In3: in std_logic;
    	   In4: in std_logic;
    	   In5: in std_logic;
    	   In6: in std_logic;
    	   In7: in std_logic;
           S0, S1, S2 : in std_logic;
           Z : out std_logic
        );
    end component;
    
    signal In0, In1, In2, In3, In4, In5, In6, In7 : std_logic;
    signal S0, S1, S2 : std_logic;
    signal Z : std_logic;

begin

    UTT: mux8_1
        port map(
            In0 => In0,
            In1 => In1,
            In2 => In2,
            In3 => In3,
            In4 => In4,
            In5 => In5,
            In6 => In6,
            In7 => In7,
            S0 => S0,
            S1 => S1,
            S2 => S2,
            Z => Z
        );


    process
    begin
    In0 <= '1';
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    In0 <= '0';
    In1 <= '1';
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    In1 <= '0';
    In2 <= '1';
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    In2 <= '0';
    In3 <= '1';
    S0 <= '1';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    In3 <= '0';
    In4 <= '1';
    S0 <= '0';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    In4 <= '0';
    In5 <= '1';
    S0 <= '1';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    In5 <= '0';
    In6 <= '1';
    S0 <= '0';
    S1 <= '1';
    S2 <= '1';
    wait for 10ns;
    In6 <= '0';
    In7 <= '1';
    S0 <= '1';
    S1 <= '1';
    S2 <= '1';
    wait for 10ns;
    end process;



end Behavioral;
