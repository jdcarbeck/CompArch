library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity program_count is
    Port ( 
        PCin : in std_logic_vector(15 downto 0);
        PL : in std_logic;
        PI : in std_logic;
        reset : in std_logic;
        clk : in std_logic;
        PCout : out std_logic_vector(15 downto 0)
    );
end program_count;

architecture Behavioral of program_count is

begin

    process(reset, PL, PI, clk)
    variable pc : std_logic_vector(15 downto 0);
    variable temp_pc : integer;
    variable temp_inc_pc : std_logic_vector(15 downto 0);
    
    begin
        if(reset = '1') then pc := x"0000";
        elsif(PL = '1' and clk = '1') then
            pc := pc + PCin;
        elsif(PI = '1' and clk = '1') then
            temp_pc := conv_integer(pc);
            temp_pc := temp_pc + conv_integer(1);
            temp_inc_pc := conv_std_logic_vector(temp_pc, 16);
            pc := temp_inc_pc;
        end if;
        PCout <= pc after 2ns;
    end process;
end Behavioral;
