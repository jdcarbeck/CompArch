library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LR_shifter_16bit is
    Port ( 
        B: in std_logic_vector(15 downto 0);
        Hsel: in std_logic_vector(1 downto 0);
        H: out std_logic_vector(15 downto 0)
    );
end LR_shifter_16bit;

architecture Behavioral of LR_shifter_16bit is
    component mux3_1
        Port (
            In0: in std_logic;
            In1: in std_logic;
            In2: in std_logic;
            S0: in std_logic;
            S1: in std_logic;
            Z: out std_logic        
      );
    end component;

signal IR, IL : std_logic := '0';

begin

SHFT00: mux3_1 
    port map(
        In0 => B(0), 
        In1 => B(1), 
        In2 => IL, 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(0)
    );
    
SHFT01: mux3_1
    port map(
        In0 => B(1), 
        In1 => B(2), 
        In2 => B(0), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(1)
    );
 
SHFT02: mux3_1
    port map(
        In0 => B(2), 
        In1 => B(3), 
        In2 => B(1), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(2)
    );
    
SHFT03: mux3_1
    port map(
        In0 => B(3), 
        In1 => B(4), 
        In2 => B(2), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(3)
    );

SHFT04: mux3_1
    port map(
        In0 => B(4), 
        In1 => B(5), 
        In2 => B(3), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(4)
    );

SHFT05: mux3_1
    port map(
        In0 => B(5), 
        In1 => B(6), 
        In2 => B(4), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(5)
    );

SHFT06: mux3_1
    port map(
        In0 => B(6), 
        In1 => B(7), 
        In2 => B(5), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(6)
    );

SHFT07: mux3_1
    port map(
        In0 => B(7), 
        In1 => B(8), 
        In2 => B(6), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(7)
    );
    
SHFT08: mux3_1
    port map(
        In0 => B(8), 
        In1 => B(9), 
        In2 => B(7), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(8)
    );
    
SHFT09: mux3_1
    port map(
        In0 => B(9), 
        In1 => B(10), 
        In2 => B(8), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(9)
    );
    
SHFT10: mux3_1
    port map(
        In0 => B(10), 
        In1 => B(11), 
        In2 => B(9), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(10)
    );
    
SHFT11: mux3_1
    port map(
        In0 => B(11), 
        In1 => B(12), 
        In2 => B(10), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(11)
    );
    
SHFT12: mux3_1
    port map(
        In0 => B(12), 
        In1 => B(13), 
        In2 => B(11), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(12)
    );
    
SHFT13: mux3_1
    port map(
        In0 => B(13), 
        In1 => B(14), 
        In2 => B(12), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(13)
    );
    
SHFT14: mux3_1
    port map(
        In0 => B(14), 
        In1 => B(15), 
        In2 => B(13), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(14)
    );
    
SHFT15: mux3_1
    port map(
        In0 => B(15), 
        In1 => IL, 
        In2 => B(14), 
        S1 => Hsel(1), 
        S0 => Hsel(0),
        Z => H(15)
    );
    

end Behavioral;
    