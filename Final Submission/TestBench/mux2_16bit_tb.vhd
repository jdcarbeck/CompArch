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

entity mux2_16bit_tb is
--  Port ( );
end mux2_16bit_tb;

architecture Behavioral of mux2_16bit_tb is
    COMPONENT mux2_16bit is
    Port
    (
        In0 : in std_logic_vector(15 downto 0);
        In1 : in std_logic_vector(15 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(15 downto 0)
    );
    end COMPONENT;
    
    signal In0 : std_logic_vector(15 downto 0) := x"0000";
    signal In1 : std_logic_vector(15 downto 0) := x"0000";
    signal s : std_logic := '0';
    signal Z : std_logic_vector(15 downto 0) := x"0000";
begin
    
    UTT: mux2_16bit
    Port map
    (
        In0 => In0,
        In1 => In1,
        s => s,
        Z => Z      
    );

    process
    begin
    In0 <= x"AAAA";
    In1 <= x"BBBB";
    s <= '0';
    wait for 10ns;
    In0 <= x"1111";
    In1 <= x"2222";
    s <= '1';
    wait for 10ns;
    end process;

end Behavioral;
