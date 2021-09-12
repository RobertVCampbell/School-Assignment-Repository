----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2020 11:01:08 AM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    port ( clock : in STD_LOGIC;
            baud : out std_logic;
           output : out STD_LOGIC);
end main;

architecture Behavioral of main is

-- Array declaration
type myROM is array(natural range <>) of std_logic_vector(7 downto 0);
signal text: myROM(1 to 5) := (x"68", x"65", x"6c", x"6c", x"6f");

-- Message format
signal message: std_logic_vector(9 downto 0);

-- Counter signal declarations
signal counter : integer range 0 to 10420 := 0;
signal bdclk : std_logic := '0';
signal nxtchar: std_logic_vector(7 downto 0);

begin
-- Clock divider to create a baudrate of 9600 given a 100MHz clock
process(clock)
begin
    if rising_edge(clock) then
        counter <= counter + 1;
        
        if counter < 5208 then
            bdclk <= '1';
            baud <= '1';
        else
            bdclk <= '0';
            baud <= '0';
        end if;
        
    end if;
    if (counter > 10415) then
        counter <= 0;
    end if;
end process;

-- Message generation and transmission
process(bdclk)
variable index : integer range 0 to 15 := 0;
variable txtin : integer range 1 to 7 := 1;
begin
    if rising_edge(bdclk) then
        if(index = 0) then
            nxtchar <= text(txtin);
            txtin := txtin + 1;
            index := index + 1;
            output <='1';
        elsif (index = 1) then 
            output <= '0';
            index := index + 1;
        elsif(index <10) then
            output <= nxtchar(natural(index - 2));
            index := index + 1;
        else
            output <= '1';
            index := index + 1;
        end if;
        if(txtin > 5) then
            txtin := 1;
        end if;
    end if;
end process;

end Behavioral;
