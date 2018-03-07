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

entity decoder_3to8_tb is
--  Port ( );
end decoder_3to8_tb;

architecture Behavioral of decoder_3to8_tb is
    COMPONENT decoder_3to8 is
	Port ( 
	    A0 : in std_logic;
        A1 : in std_logic;
        A2 : in std_logic;
        Q0 : out std_logic;
        Q1 : out std_logic;
        Q2 : out std_logic;
        Q3 : out std_logic;
        Q4 : out std_logic;
        Q5 : out std_logic;
        Q6 : out std_logic;
        Q7 : out std_logic
        );
    end COMPONENT;

    signal A0 : std_logic := '0';
    signal A1 : std_logic := '0';
    signal A2 : std_logic := '0';
    signal Q0 : std_logic := '0';
    signal Q1 : std_logic := '0';
    signal Q2 : std_logic := '0';
    signal Q3 : std_logic := '0';
    signal Q4 : std_logic := '0';
    signal Q5 : std_logic := '0';
    signal Q6 : std_logic := '0';
    signal Q7 : std_logic := '0';
    
begin

    UTT: decoder_3to8
    Port map
    (
        A0 => A0,
        A1 => A1,
        A2 => A2,
        Q0 => Q0,
        Q1 => Q1,
        Q2 => Q2,
        Q3 => Q3,
        Q4 => Q4,
        Q5 => Q5,
        Q6 => Q6,
        Q7 => Q7
    );
    
    process
    begin
        A0 <= '0';
        A1 <= '0';
        A2 <= '0';
        wait for 50ns;
        A0 <= '0';
        A1 <= '0';
        A2 <= '1';
        wait for 50ns;
        A0 <= '0';
        A1 <= '1';
        A2 <= '0';
        wait for 50ns;
        A0 <= '0';
        A1 <= '1';
        A2 <= '1';
        wait for 50ns;
        A0 <= '1';
        A1 <= '0';
        A2 <= '0';
        wait for 50ns;
        A0 <= '1';
        A1 <= '0';
        A2 <= '1';
        wait for 50ns;
        A0 <= '1';
        A1 <= '1';
        A2 <= '0';
        wait for 50ns;
        A0 <= '1';
        A1 <= '1';
        A2 <= '1';
        wait for 50ns;
    end process;

end Behavioral;
