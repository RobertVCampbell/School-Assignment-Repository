----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2020 07:19:20 PM
-- Design Name: 
-- Module Name: wordtest - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wordtest is
    Port ( count: out std_logic_vector( 5 downto 0);
            clk : in std_logic;
            div : in std_logic_vector(31 downto 0));
end wordtest;

architecture Behavioral of wordtest is
signal cnt_clk : std_logic := '0';
signal div_cnt : unsigned(31 downto 0) := (others => '0');
signal cnt_out : unsigned(5 downto 0) := (others=>'0');

begin


--Clock divider
process(clk)

begin
    if(unsigned(div) = 0) then
            cnt_clk <= clk;
    elsif rising_edge(clk) then
         if(div_cnt < unsigned(div)) then
            div_cnt <= div_cnt + 1;
            cnt_clk <= '0';
         else
            div_cnt <= (others=>'0');
            cnt_clk <= '1';
         end if;        
        end if;
end process;

process(cnt_clk)

begin
    if rising_edge(cnt_clk) then
        cnt_out <= cnt_out + 1;
        count <= std_logic_vector(cnt_out);
    end if;
    
end process;


end Behavioral;
