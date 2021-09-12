----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:11 03/18/2010 
-- Design Name: 
-- Module Name:    clockDivChip - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
USE ieee.numeric_std.ALL;
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--USE ieee.numeric_std.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity userDesign is
    Port ( bclk : in  STD_LOGIC;
			  clk_50 : in std_logic;
			  --LA: in std_logic_vector(23 downto 17);
			  SA: in std_logic_vector(19 downto 0);
			  SD: inout std_logic_vector(15 downto 0);
			  IOWC: in std_logic;
			  IORC: in std_logic;
			  IO16 : out std_logic;
			  MEM16 : out std_logic;
			  CHRDY: out std_logic;			  
			  countOut : buffer STD_LOGIC_VECTOR(7 downto 0) := "00000000");
			  
			  --clk: buffer std_logic := '0');
			  
end userDesign;



architecture Behavioral of userDesign is
--signal countOut: integer range 1 to 65536 :=1;

--signal genClk: STD_LOGIC;
signal latchedData: STD_LOGIC_VECTOR (7 downto 0);
signal clkDiv : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";

signal acs_n : STD_LOGIC :='0';
--signal ard_n : STD_LOGIC;
--signal awr_n : STD_LOGIC;
signal adReady : STD_LOGIC;
signal adReadyack: STD_LOGIC;
signal adintr_n : STD_LOGIC;
signal ad_out : STD_LOGIC_VECTOR (7 downto 0);
signal awave : STD_LOGIC_VECTOR(1 downto 0) :="00";

component ad0804_waveform
    Port ( --sar_clk : in STD_LOGIC;
           cs_n : in STD_LOGIC;
           rd_n : in STD_LOGIC;
           wr_n : in STD_LOGIC;
           intr_n : out STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (7 downto 0);
           wave : in STD_LOGIC_VECTOR(1 downto 0));
    end component;

begin
	CHRDY <= 'Z';
	MEM16 <= 'Z';
	IO16 <= 'Z';
	SD <= "ZZZZZZZZZZZZZZZZ";

--need a latched buffer between the two
-- use interupt line to 
-- read not also 

converter: ad0804_waveform port map(acs_n, IORC, countOut(0), adintr_n, ad_out, awave);
	
	--process(adintr_n, adReadyack)
	--begin
	--if (adintr_n ='0') then
	--   latchedData <= ad_out;
    --   adReady <= '0';
    --elsif (adReadyack = '0') then
    --    adReady <= '1';
    --end if;
	--end process;
	
	process(SA, IOWC, IORC, adintr_n)
	begin
	   if (adintr_n ='0') then
	       latchedData <= ad_out;
            adReady <= '0';
       end if;
	   if(SA = x"03002") then
	       if(IOWC = '0') then
	           IO16 <= '1';
	           CHRDY <='1';
	           clkDiv <= SD;
           elsif(IORC = '0') then
               if(adReady = '0') then
                   IO16 <='1'; 
                   CHRDY <='1';
                   SD(15 downto 8)<= "00000000";
                   SD(7 downto 0) <= latchedData;
                   adReady <= '1';
               --else
                  -- IO16 <= 'Z';
                   --CHRDY <= 'Z';
                   --SD <= "ZZZZZZZZZZZZZZZZ";
               end if;	       
           else
	           IO16 <= 'Z';
	           CHRDY <= 'Z';
               SD <= "ZZZZZZZZZZZZZZZZ";
	       end if;
	       
       end if;
	end process;
	
	process(clk_50)
	variable counter : integer range 1 to 65536 := 1;
	variable countOut1 : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    variable countOut2 : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
	begin
	   if(rising_edge(clk_50)) then
	       --Counter 1 (variable division)
	       if(counter >= to_integer(unsigned(clkDiv))) then
	           --clk <= not(clk);
	           countOut1 := std_logic_vector(unsigned(countOut1) + 1);
	           counter := 1;
	       elsif (counter < to_integer(unsigned(clkDiv))) then
	           counter := counter + 1;
           end if;
           
           --Counter 2 (div by 2)
	       countOut2 := std_logic_vector(unsigned(countOut2) + 1);
	   end if;
       if(clkDiv = "0000000000000000") then
          countOut(7 downto 1) <= countout2;
          countOut(0) <= not(clk_50);
       else
           countOut <= countOut1;
       end if;
	end process;
	
	
end Behavioral;
