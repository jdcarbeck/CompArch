library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_memory_tb is
--  Port ( );
end control_memory_tb;

architecture Behavioral of control_memory_tb is

    component control_memory
        Port ( 
            MW: out std_logic;
            MM: out std_logic;
            RW: out std_logic;
            MD: out std_logic;
            FS: out std_logic_vector(4 downto 0);
            MB: out std_logic;
            TB: out std_logic;
            TA: out std_logic;
            TD: out std_logic;
            PL: out std_logic;
            PI: out std_logic;
            IL: out std_logic;
            MC: out std_logic;
            MS: out std_logic_vector(2 downto 0);
            NA: out std_logic_vector(7 downto 0);
            IN_CAR: in std_logic_vector(7 downto 0)
        );
    end component;

    signal MW, MM, RW, MD, MB, TB, TA, TD, PL, PI, IL, MC : std_logic;
    signal FS : std_logic_vector(4 downto 0);
    signal MS : std_logic_vector(2 downto 0);
    signal NA : std_logic_vector(7 downto 0);
    signal IN_CAR : std_logic_vector(7 downto 0);

begin

    UTT: control_memory
        port map(
            MW => MW,
            MM => MM,
            RW => RW,
            MD => MD,
            FS => FS,
            MB => MB,
            TB => TB,
            TA => TA,
            TD => TD,
            PL => PL,
            PI => PI,
            IL => IL,
            MC => MC,
            MS => MS,
            NA => NA,
            IN_CAR => IN_CAR
        );

    process
    begin
    IN_CAR <= "00000000";
    wait for 10ns;
    IN_CAR <= "00000001";
    wait for 10ns;
    IN_CAR <= "00000010";
    wait for 10ns;
    IN_CAR <= "00000011";
    wait for 10ns;
    end process;

end Behavioral;
