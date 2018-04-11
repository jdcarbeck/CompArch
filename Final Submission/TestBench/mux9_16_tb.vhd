library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux9_16_tb is
    --Port ();
end mux9_16_tb;

architecture Behavioral of mux9_16_tb is

    component mux9_16bit
        Port ( 
            In0: in std_logic_vector(15 downto 0);
            In1: in std_logic_vector(15 downto 0);
            In2: in std_logic_vector(15 downto 0);
            In3: in std_logic_vector(15 downto 0);
            In4: in std_logic_vector(15 downto 0);
            In5: in std_logic_vector(15 downto 0);
            In6: in std_logic_vector(15 downto 0);
            In7: in std_logic_vector(15 downto 0);
            In8: in std_logic_vector(15 downto 0);
            S0: in std_logic;
            S1: in std_logic;
            S2: in std_logic;
            S3: in std_logic;
            Z : out std_logic_vector(15 downto 0)
       );
    end component;

    signal In0 : std_logic_vector(15 downto 0) := x"1111";
    signal In1 : std_logic_vector(15 downto 0) := x"2222";
    signal In2 : std_logic_vector(15 downto 0) := x"3333";
    signal In3 : std_logic_vector(15 downto 0) := x"4444";
    signal In4 : std_logic_vector(15 downto 0) := x"5555";
    signal In5 : std_logic_vector(15 downto 0) := x"6666";
    signal In6 : std_logic_vector(15 downto 0) := x"7777";
    signal In7 : std_logic_vector(15 downto 0) := x"8888";
    signal In8 : std_logic_vector(15 downto 0) := x"9999";
    signal S0 : std_logic := '0';
    signal S1 : std_logic := '0';
    signal S2 : std_logic := '0';
    signal S3 : std_logic := '0';
    signal Z : std_logic_vector(15 downto 0) := x"0000";

begin
    UTT: mux9_16bit
        port map(
            In0 => In0,
            In1 => In1,
            In2 => In2,
            In3 => In3,
            In4 => In4,
            In5 => In5,
            In6 => In6,
            In7 => In7,
            In8 => In8,
            S0 => S0,
            S1 => S1,
            S2 => S2,
            S3 => S3,
            Z => Z
        );
process
   begin
   S0 <= '0';
   S1 <= '0';
   S2 <= '0';
   S3 <= '0';
   wait for 5ns;
   S0 <= '1';
   S1 <= '0';
   S2 <= '0';
   S3 <= '0';
   wait for 5ns;
   S0 <= '0';
   S1 <= '1';
   S2 <= '0';
   S3 <= '0';
   wait for 5ns;
   S0 <= '1';
   S1 <= '1';
   S2 <= '0';
   S3 <= '0';
   wait for 5ns;
   S0 <= '0';
   S1 <= '0';
   S2 <= '1';
   S3 <= '0';
   wait for 5ns;
   S0 <= '1';
   S1 <= '0';
   S2 <= '1';
   S3 <= '0';
   wait for 5ns;
   S0 <= '0';
   S1 <= '1';
   S2 <= '1';
   S3 <= '0';
   wait for 5ns;
   S0 <= '1';
   S1 <= '1';
   S2 <= '1';
   S3 <= '0';
   wait for 5ns;
   S0 <= '0';
   S1 <= '0';
   S2 <= '0';
   S3 <= '1';
   wait for 5ns;
end process;

end Behavioral;
