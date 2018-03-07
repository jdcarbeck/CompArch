library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Functional_unit is
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
end Functional_unit;

architecture Behavioral of Functional_unit is

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
    
    component LR_shifter_16bit
        Port ( 
            B: in std_logic_vector(15 downto 0);
            Hsel: in std_logic_vector(1 downto 0);
            H: out std_logic_vector(15 downto 0)
        );
    end component;
    
    component mux2_16bit
        port ( 
            In0 : in std_logic_vector(15 downto 0);
            In1 : in std_logic_vector(15 downto 0);
            s : in std_logic;
            Z : out std_logic_vector(15 downto 0)
        );
    end component;

    signal ALU_out, SHFT_out : std_logic_vector(15 downto 0);

begin

    ALU0: ALU_16bit 
        port map (
            Gsel(0) => FS(0),
            Gsel(1) => FS(1),
            Gsel(2) => FS(2),
            Gsel(3) => FS(3),
            A => A,
            B => B,
            VFlag => VFlag,
            CFlag => CFlag,
            NFlag => NFlag,
            ZFlag => ZFlag,
            Gout => ALU_out
        ); 
        
     SHFT0: LR_shifter_16bit
        port map (
            B => B,
            Hsel(0) => FS(2),
            Hsel(1) => FS(3),
            H => SHFT_out
        );
     
     MUX: mux2_16bit
        port map (
            In0 => ALU_out,
            In1 => SHFT_out,
            s => FS(4),
            Z => F
        );

end Behavioral;
