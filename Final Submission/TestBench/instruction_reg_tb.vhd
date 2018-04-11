library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_reg_tb is
--  Port ( );
end instruction_reg_tb;

architecture Behavioral of instruction_reg_tb is

    component instruction_reg
        Port ( 
            IRin : in std_logic_vector(15 downto 0);
            IL : in std_logic;
            clk : in std_logic;
            Opcode : out std_logic_vector(6 downto 0);
            DR : out std_logic_vector(2 downto 0);
            SA : out std_logic_vector(2 downto 0);
            SB : out std_logic_vector(2 downto 0)
        );
    end component;

    signal IRin : std_logic_vector(15 downto 0) := x"0000";
    signal IL : std_logic := '1';
    signal clk : std_logic := '1';
    signal Opcode : std_logic_vector(6 downto 0) := "0000000";
    signal DR : std_logic_vector(2 downto 0) := "000";
    signal SA : std_logic_vector(2 downto 0) := "000";
    signal SB : std_logic_vector(2 downto 0) := "000";  

begin

    UTT: instruction_reg
        port map (
            IRin => IRin,
            IL => IL,
            clk => clk,
            Opcode => Opcode,
            DR => DR,
            SA => SA,
            SB => SB
        );

process begin
    IRin <= x"AAAA";
    IL <= '1';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
    IRin <= x"BBBB";
    IL <= '0';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
    IRin <= x"BBBB";
    IL <= '1';
    clk <= '1';
    wait for 10ns;
    clk <= '0';
    wait for 10ns;
end process;

end Behavioral;
