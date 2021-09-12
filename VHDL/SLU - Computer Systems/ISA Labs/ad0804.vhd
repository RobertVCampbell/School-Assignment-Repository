----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2020 10:50:56 AM
-- Design Name: 
-- Module Name: ad0808 - Behavioral
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

entity ad0804 is
    Port ( --sar_clk : in STD_LOGIC;
           cs_n : in STD_LOGIC;
           rd_n : in STD_LOGIC;
           wr_n : in STD_LOGIC;
           intr_n : out STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (7 downto 0);
           wave : in STD_LOGIC_VECTOR(1 downto 0));
end ad0804;

architecture Behavioral of ad0804 is
type shape is array (integer range <>) of integer;
type shapes is array (integer range <>) of shape(0 to 99);

signal sar_clk : std_logic := '0';
signal intr_int : std_logic := '1';
signal data : std_logic_vector(7 downto 0);
signal sar_cnt : integer := 0;
signal waveform_cnt : integer := 0;
signal waveform : shapes(0 to 3) := ((1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),

                                     (20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20),

                                     (30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
                                     30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
                                     30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
                                     30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30),

                                     (4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
                                     4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
                                     4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
                                     4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4));
begin

intr_n <= intr_int;

process
begin
    sar_clk <= not sar_clk;
    wait for 5 ns;
end process;

process(sar_clk, rd_n, cs_n, wr_n)
    variable read : std_logic;
    variable read_pre : std_logic := '1';
    variable write : std_logic;
    variable write_pre : std_logic := '1';
    variable intr_cnt : integer := 0;
begin
    if rising_edge(sar_clk) then
        read := rd_n nor cs_n;
        write := wr_n nor cs_n;
        if sar_cnt < 65 then
            sar_cnt <= sar_cnt + 1;
            if sar_cnt = 64 then -- take about 64 sar clocks to complete
                data <= std_logic_vector(to_unsigned(waveform(to_integer(unsigned(wave)))(waveform_cnt), 8));
                waveform_cnt <= waveform_cnt + 1;
                if waveform_cnt = 99 then
                    waveform_cnt <= 0;
                end if;
            end if;
        end if;
        if sar_cnt = 65 then -- Set intr_n one clock after data is latched
            sar_cnt <= sar_cnt + 1;
            intr_int <= '0';
            intr_cnt := 0;
        end if;
        if rising_edge(wr_n) then -- start a conversion on rising edge wr_n
            sar_cnt <= 0;
        end if;
        
        if read = '1' and read_pre = '0' then -- and intr_int = '0' then -- clear intr_n on falling edge of rd_n
            intr_int <= '1' after 300 ns;
        end if;
        
        if write = '1' and write_pre = '0' then -- and intr_int = '0'  then -- clear intr_n on falling edge of wr_n
            intr_int <= '1' after 300 ns;
            sar_cnt <= 0;
        end if;
        
        -- intr_n will go for at least 8 sar clocks and at most until one of one of
        if write = '1' and write_pre = '0' and intr_int = '0'  then -- clear intr_n on falling edge of wr_n
            intr_cnt := intr_cnt + 1;
            if intr_cnt > 64 then
                intr_int <= '1';
            end if;
        end if;
        
        write_pre := write; 
        read_pre := read; 
    end if;
end process;

process(cs_n, rd_n)
begin
    if cs_n = '0' and rd_n = '0' then
        d_out <= data;
    end if;
end process;

end Behavioral;
