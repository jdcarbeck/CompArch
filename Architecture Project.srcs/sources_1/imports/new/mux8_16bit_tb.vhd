library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux8_16bit_tb is
--  Port ( );
end mux8_16bit_tb;

architecture Behavioral of mux8_16bit_tb is
    COMPONENT mux8_16bit is
    Port
    (
       In0: in std_logic_vector(15 downto 0);
       In1: in std_logic_vector(15 downto 0);
       In2: in std_logic_vector(15 downto 0);
       In3: in std_logic_vector(15 downto 0);
       In4: in std_logic_vector(15 downto 0);
       In5: in std_logic_vector(15 downto 0);
       In6: in std_logic_vector(15 downto 0);
       In7: in std_logic_vector(15 downto 0);
       S0: in std_logic;
       S1: in std_logic;
       S2: in std_logic;
       Z : out std_logic_vector(15 downto 0)
    );
    end COMPONENT;
    
    signal In0 : std_logic_vector(15 downto 0) := x"1111";
    signal In1 : std_logic_vector(15 downto 0) := x"2222";
    signal In2 : std_logic_vector(15 downto 0) := x"3333";
    signal In3 : std_logic_vector(15 downto 0) := x"4444";
    signal In4 : std_logic_vector(15 downto 0) := x"5555";
    signal In5 : std_logic_vector(15 downto 0) := x"6666";
    signal In6 : std_logic_vector(15 downto 0) := x"7777";
    signal In7 : std_logic_vector(15 downto 0) := x"8888";
    signal S0 : std_logic := '0';
    signal S1 : std_logic := '0';
    signal S2 : std_logic := '0';
    signal Z : std_logic_vector(15 downto 0) := x"0000";
        
begin

    UTT: mux8_16bit
    Port map
    (
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
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '1';
    wait for 900ns;
    end process;

end Behavioral;
