library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CAR is
 Port ( 
       --Either Next Address (NA) or Opcode from IR
       B : in std_logic_vector(7 downto 0);
       A : in std_logic;
       reset : in std_logic;
       clk : in std_logic;
       z : out std_logic_vector(7 downto 0)
      );
end CAR;

architecture Behavioral of CAR is

begin      
    process(reset, clk)
    variable current : std_logic_vector(7 downto 0);
    begin
        if(reset = '1') then current := x"C0";
        elsif(A = '1' and clk = '1') then current := B;
        end if;
        z <= current after 10ns;
    end process;
end Behavioral;