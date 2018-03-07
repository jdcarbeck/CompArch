library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_16bit_tb is
--  Port ( );
end ALU_16bit_tb;

   architecture Behavioral of ALU_16bit_tb is

    component ALU_16bit
        Port ( 
               Gsel: in std_logic_vector(3 downto 0);
               A: in std_logic_vector(15 downto 0);
               B: in std_logic_vector(15 downto 0);
               VFlag: out std_logic;
               CFlag: out std_logic;
               NFlag: out std_logic;
               ZFlag: out std_logic;
               Gout: out std_logic_vector(15 downto 0)
          );
    end component;
    
    signal Gsel : std_logic_vector(3 downto 0) := "0000";
    signal A, B : std_logic_vector(15 downto 0) := x"0000";
    signal VFlag, CFlag, NFlag, ZFlag : std_logic := '0';
    signal Gout : std_logic_vector(15 downto 0) := x"0000";

begin

    UTT: ALU_16bit
        port map (
            Gsel => Gsel,
            A => A,
            B => B, 
            VFlag => VFlag,
            CFlag => CFlag,
            NFlag => NFlag,
            ZFlag => ZFlag,
            Gout => Gout
        );

    process
    begin 
    --Initialise
    Gsel <= "0000";
    A <= x"0000";
    B <= x"0000";
    wait for 50ns;
    
    --F = A
    Gsel <= "0000";
    A <= x"0001";
    B <= x"0000";
    wait for 50ns;
    
    --F = A + 1
    Gsel <= "0001";
    A <= x"FFFF";
    B <= x"0000";
    wait for 50ns;
    
    
    --F = A + B
    Gsel <= "0010";
    A <= x"0002";
    B <= x"0003";
    wait for 50ns;
    
    --F = A + B + 1
    Gsel <= "0011";
    A <= x"7FFF";
    B <= x"8000";
    wait for 50ns;
    
    --F = A + B'
    Gsel <= "0100";
    A <= x"0002";
    B <= x"0003";
    wait for 50ns;
    
    --F = A + B' + 1
    Gsel <= "0101";
    A <= x"0002";
    B <= x"0003";
    wait for 50ns;
    
    --F = A - 1
    Gsel <= "0110";
    A <= x"0002";
    B <= x"0000";
    wait for 50ns;
    
    --F = A
    Gsel <= "0111";
    A <= x"0002";
    B <= x"0000";
    wait for 50ns;
    
    --F = A * B
    Gsel <= "1000";
    A <= x"0800";
    B <= x"FFFF";
    wait for 50ns;
   
    --F = A + B
    Gsel <= "1010";
    A <= x"0003";
    B <= x"000C";
    wait for 50ns;
    
    --F = A xor B
    Gsel <= "1100";
    A <= x"AAAA";
    B <= x"5555";
    wait for 50ns;
    
    --F = A'
    Gsel <= "1110";
    A <= x"0002";
    B <= x"0000";
    wait for 50ns;
    
    Gsel <= "0000";
    A <= x"0000";
    B <= x"0000";
    wait for 1000ns;
    end process;


end Behavioral;
