----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2020 02:55:16 PM
-- Design Name: 
-- Module Name: sevenseg - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg is
    Port ( clk : in STD_LOGIC;
            reset_n : in STD_LOGIC;
            inputNum : in STD_LOGIC_VECTOR(0 to 15);
            A : out STD_LOGIC_VECTOR(3 downto 0);
            dp : out STD_LOGIC;
            LED : out STD_LOGIC_VECTOR(6 downto 0));
end sevenseg;

architecture Behavioral of sevenseg is
    signal decoder: STD_LOGIC_VECTOR(3 downto 0);
    signal clk10: STD_LOGIC_VECTOR(19 downto 0);
    signal LEDnum: STD_LOGIC_VECTOR(1 downto 0);
    begin
    process(decoder)
        begin
            case decoder is
            when "0000" => LED <= "0000001"; -- "0"     
            when "0001" => LED <= "1001111"; -- "1" 
            when "0010" => LED <= "0010010"; -- "2" 
            when "0011" => LED <= "0000110"; -- "3" 
            when "0100" => LED <= "1001100"; -- "4" 
            when "0101" => LED <= "0100100"; -- "5" 
            when "0110" => LED <= "0100000"; -- "6" 
            when "0111" => LED <= "0001111"; -- "7" 
            when "1000" => LED <= "0000000"; -- "8"     
            when "1001" => LED <= "0000100"; -- "9" 
            when "1010" => LED <= "0000010"; -- a
            when "1011" => LED <= "1100000"; -- b
            when "1100" => LED <= "0110001"; -- C
            when "1101" => LED <= "1000010"; -- d
            when "1110" => LED <= "0110000"; -- E
            when "1111" => LED <= "0111000"; -- F
            end case;
    end process;
    
    process(clk,reset_n)
    begin
        if(reset_n = '0') then
            clk10 <= (others => '0');
        elsif(rising_edge(clk)) then
            clk10 <= clk10 + 1;
        end if;
    end process;
    LEDnum <= clk10(19 downto 18);
    process(LEDnum)
    begin
        case LEDnum is
        when "00" =>
            A <= "0111";
            decoder <= inputNum(12 to 15);
            dp <= '1';
        when "01" =>
            A <= "1011";
            decoder <= inputNum(8 to 11);
            dp <= '0';
        when "10" =>
            A <= "1101";
            decoder <= inputNum(4 to 7);
            dp <= '1';
        when "11" =>
            A <= "1110";
            decoder <= inputNum(0 to 3);
            dp <= '1';
        end case;
    end process;
    
    

end Behavioral;
