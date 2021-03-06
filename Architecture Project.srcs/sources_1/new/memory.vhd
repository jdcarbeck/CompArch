library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
    port (
        address: in std_logic_vector(15 downto 0);
        DataIn : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        MW : in std_logic;
        DataOut: out std_logic_vector(15 downto 0)
    );
end memory;

architecture Behavioral of memory is
type mem_array is array(0 to 511) of std_logic_vector(15 downto 0);
begin 
    mem_process: process(address, DataIn)
        variable data_mem : mem_array := (
            x"0000", --START
            x"0000", --0    LDI R0, =0 
            x"0045", --1    LDI R1, =5
            x"0080", --2    LRI R2, =0  
            x"00C0", --3    LDI R3, =0 
            x"0100", --4    LDI R4, =0 
            x"0140", --5    LDI R5, =0
            x"0180", --6    LDI R6, =0
            x"01C0", --7    LDI R7, =0
            x"0200", --8    LDR R0, nextValue 
            x"001E", --9    nextValue = 0x1E = 30
            x"02C0", --10   LDR R3, nextValue   
            x"0020", --11   nextValue = 0x20 = 32 
            x"0400", --12   LSL R0, #3 (LSL R0, #1 * 3)
            x"0400", --13   
            x"0400", --14   

            --16
            x"0619", --15   SUB R1, R0, R1 
            x"0000", --16   Branch +3 if R0 is neg
            x"0000", --17   INC R2
            x"0000", --19   Branch -3
            x"0000", --20   ADD R0, R0, R3
            x"0000", --21   LDR R1 nextValue
            x"0000", --22   nextValue = storingAddress
            x"0000", --23   STR
            x"0000",
            x"0000",
            x"0000",
            x"0000",
            x"0000",
            x"0000",
            x"0000",
            x"0000", 
            --32
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --48
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --64
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --80
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --96
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --112
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --128
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --144
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --160
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --176
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --192
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --208
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --224
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --240
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --256
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --272
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --288
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --304
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --320
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --336
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --352
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --368
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --384
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --400
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --416
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --432
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --448
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --464
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --480
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            --496
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000",
            x"0000",x"0000",x"0000",x"0000"
        );
        variable addr:integer;
    begin
        addr:=conv_integer(address(8 downto 0));
        if MW = '1' and clk = '1' then
            data_mem(addr):= DataIn;
        elsif MW = '0' and clk = '1' then
            DataOut <= data_mem(addr) after 10ns;
        end if;
    end process;
end Behavioral;
