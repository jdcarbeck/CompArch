library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Functional_unit_tb is
--  Port ( );
end Functional_unit_tb;

architecture Behavioral of Functional_unit_tb is

    component Functional_unit
        Port ( 
            A: in std_logic_vector(15 downto 0);
            B: in std_logic_vector(15 downto 0);
            FS: in std_logic_vector(4 downto 0);
            F: out std_logic_vector(15 downto 0);
            VFlag: out std_logic;
            CFlag: out std_logic;
            NFlag: out std_logic;
            ZFlag: out std_logic
        );
    end component;

    signal A, B, F : std_logic_vector(15 downto 0);
    signal FS : std_logic_vector(4 downto 0);
    signal VFlag, CFlag, NFlag, ZFlag : std_logic;

begin

    UTT: Functional_unit
        port map (
            A => A,
            B => B,
            FS => FS,
            F => F,
            VFlag => VFlag,
            CFlag => CFlag,
            NFlag => NFlag,
            ZFlag => ZFlag
        );

    process
    begin
    --Initialise
    FS <= "00000";
    A <= x"0000";
    B <= x"0000";
    wait for 50ns;
    
    --F = A
    FS <= "00000";
    A <= x"0001";
    B <= x"0000";
    wait for 50ns;

    --F = A + B
    FS <= "00010";
    A <= x"0002";
    B <= x"0003";
    wait for 50ns;
    
    --F = A + B + 1
    FS <= "00011";
    A <= x"7FFF";
    B <= x"8000";
    wait for 50ns;
    
    --F = A + B'
    FS <= "00100";
    A <= x"0002";
    B <= x"0003";
    wait for 50ns;
    
    --F = A + B' + 1
    FS <= "00101";
    A <= x"0002";
    B <= x"0003";
    wait for 50ns;
    
    --F = A - 1
    FS <= "00110";
    A <= x"0002";
    B <= x"0000";
    wait for 50ns;
    
    --F = A
    FS <= "00111";
    A <= x"0002";
    B <= x"0000";
    wait for 50ns;
    
    --F = A * B
    FS <= "01000";
    A <= x"0800";
    B <= x"FFFF";
    wait for 50ns;
   
    --F = A + B
    FS <= "01010";
    A <= x"0003";
    B <= x"000C";
    wait for 50ns;
    
    --F = A xor B
    FS <= "01100";
    A <= x"AAAA";
    B <= x"5555";
    wait for 50ns;
    
    --F = A'
    FS <= "01110";
    A <= x"0002";
    B <= x"0000";
    wait for 50ns;
    
    -- F = B
    FS <= "10000";    
    A <= x"0001";
    B <= x"0002";
    wait for 50ns;
    
    -- F = srB
    FS <= "10100";    
    A <= x"0001";
    B <= x"0002";
    wait for 50ns;
    
    --F = slB
    FS <= "11000";    
    A <= x"0001";
    B <= x"0002";
    wait for 50ns;
    
    FS <= "00000";
    A <= x"0000";
    B <= x"0000";
    wait for 1000ns;
    end process;


end Behavioral;
