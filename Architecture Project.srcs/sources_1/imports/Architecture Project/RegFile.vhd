library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegFile is
Port ( 
	Asel : in std_logic_vector(3 downto 0);
    Bsel : in std_logic_vector(3 downto 0);
	Dsel : in std_logic_vector(3 downto 0);
	Clk : in std_logic;
	RW: in std_logic;
	Ddata : in std_logic_vector(15 downto 0); --D bus
    Adata: out std_logic_vector(15 downto 0); --A bus
    Bdata: out std_logic_vector(15 downto 0); --B bus
    Reg0: out std_logic_vector(15 downto 0); --reg0
    Reg1: out std_logic_vector(15 downto 0); --reg1
    Reg2: out std_logic_vector(15 downto 0); --reg2
    Reg3: out std_logic_vector(15 downto 0); --reg3
    Reg4: out std_logic_vector(15 downto 0); --reg4
    Reg5: out std_logic_vector(15 downto 0); --reg5
    Reg6: out std_logic_vector(15 downto 0); --reg6
    Reg7: out std_logic_vector(15 downto 0); --reg7
    temp: out std_logic_vector(15 downto 0)  --temp reg
    );
end RegFile;

architecture Behavioral of RegFile is
-- components

	-- 16 bit Register for register file
	COMPONENT reg16
	PORT(
		D : IN std_logic_vector(15 downto 0);
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	-- 3 to 8 Decoder
	COMPONENT decoder_4to9
	PORT(
		A0 : IN std_logic;
		A1 : IN std_logic;
		A2 : IN std_logic;
		A3 : IN std_logic;
		RW : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		Q8 : OUT std_logic
		);
	END COMPONENT;
	
	-- 8 to 1 line multiplexer
	COMPONENT mux9_16bit
	PORT(
		In0 : IN std_logic_vector(15 downto 0);
		In1 : IN std_logic_vector(15 downto 0);
		In2 : IN std_logic_vector(15 downto 0);
		In3 : IN std_logic_vector(15 downto 0);
		In4 : IN std_logic_vector(15 downto 0);
		In5 : IN std_logic_vector(15 downto 0);
		In6 : IN std_logic_vector(15 downto 0);
		In7 : IN std_logic_vector(15 downto 0);
		In8 : IN std_logic_vector(15 downto 0);
		S0: IN std_logic;
		S1: IN std_logic;
		S2: IN std_logic;
		S3: IN std_logic;
		Z : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
		
    signal reg0_out, reg1_out, reg2_out, reg3_out, 
           reg4_out, reg5_out, reg6_out, reg7_out, temp_out : std_logic_vector(15 downto 0);
           
    signal reg0_sel, reg1_sel, reg2_sel, reg3_sel, 
           reg4_sel, reg5_sel, reg6_sel, reg7_sel, temp_sel : std_logic;
         
           
	begin
	
	reg00: reg16 port map(D => Ddata, load => reg0_sel, Clk => Clk, Q => reg0_out);
	reg01: reg16 port map(D => Ddata, load => reg1_sel, Clk => Clk, Q => reg1_out);
	reg02: reg16 port map(D => Ddata, load => reg2_sel, Clk => Clk, Q => reg2_out);
	reg03: reg16 port map(D => Ddata, load => reg3_sel, Clk => Clk, Q => reg3_out);
	reg04: reg16 port map(D => Ddata, load => reg4_sel, Clk => Clk, Q => reg4_out);
	reg05: reg16 port map(D => Ddata, load => reg5_sel, Clk => Clk, Q => reg5_out);
	reg06: reg16 port map(D => Ddata, load => reg6_sel, Clk => Clk, Q => reg6_out);
	reg07: reg16 port map(D => Ddata, load => reg7_sel, Clk => Clk, Q => reg7_out);
	temp_reg: reg16 port map(D => Ddata, load => temp_sel, Clk => Clk, Q => temp_out);
	
	Reg0 <= reg0_out;
	Reg1 <= reg1_out;
	Reg2 <= reg2_out;
	Reg3 <= reg3_out;
	Reg4 <= reg4_out;
	Reg5 <= reg5_out;
	Reg6 <= reg6_out;
	Reg7 <= reg7_out;
	temp <= temp_out;
	
	
    AMux: mux9_16bit 
        port map(
            In0 => reg0_out,
            In1 => reg1_out,
            In2 => reg2_out,
            In3 => reg3_out,
            In4 => reg4_out,
            In5 => reg5_out,
            In6 => reg6_out,
            In7 => reg7_out,
            In8 => temp_out,
            S0 => Asel(0),
            S1 => Asel(1),
            S2 => Asel(2),
            S3 => Asel(3),
            Z => Adata
        ); 
     
    BMux: mux9_16bit
        port map(
            In0 => reg0_out,
            In1 => reg1_out,
            In2 => reg2_out,
            In3 => reg3_out,
            In4 => reg4_out,
            In5 => reg5_out,
            In6 => reg6_out,
            In7 => reg7_out,
            In8 => temp_out,
            S0 => Asel(0),
            S1 => Asel(1),
            S2 => Asel(2),
            S3 => Asel(3),
            Z => Adata
        );
	
	Decoder: decoder_4to9 
	   port map (
	       A0 => Dsel(0),
           A1 => Dsel(1),
           A2 => Dsel(2),
           A3 => Dsel(3),
           RW => RW,
           Q0 => reg0_sel,
           Q1 => reg1_sel,
           Q2 => reg2_sel,
           Q3 => reg3_sel,
           Q4 => reg4_sel,
           Q5 => reg5_sel,
           Q6 => reg6_sel,
           Q7 => reg7_sel,
           Q8 => temp_sel
        );
	
end Behavioral;