------------------- Half-adder design entity -----------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity half_adder is
port (a, b : in std_logic;
sum, carry_out: out std_logic);
end half_adder;
architecture dataflow of half_adder is
begin
sum <= a xor b;
carry_out <= a and b;
end dataflow;
------------------- Two input OR gate design entity ----------------------------
library ieee;
use ieee.std_logic_1164.all;
entity or_2 is
port (a, b : in std_logic;
or_out : out std_logic);
end or_2;
architecture dataflow of or_2 is
begin
or_out <= a or b;
end dataflow;
------------------- Full-adder design entity -----------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity first_full_adder is
port (a, b, carry_in : in std_logic;
sum, carry_out: out std_logic);
end first_full_adder;
architecture structure of first_full_adder is
signal s1, s2, s3 : std_logic; -- Signals to interconnect components
begin
-- Each component instantion below is a concurrent statement
ha1: entity half_adder port map (a => a, b => b, sum =>s1, carry_out => s2);
ha2: entity half_adder port map (a => s1, b => carry_in, sum => sum,
carry_out => s3);
or1: entity or_2 port map (a => s3, b => s2, or_out => carry_out);
end structure;