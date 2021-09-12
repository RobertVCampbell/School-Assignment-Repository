library ieee;
use ieee.std_logic_1164.all;
library parts;
use parts.all;

entity second_full_adder is
	port(a,b, carry_in : in std_logic;
		sum carry_out : out std_logic);
end second_full_adder;

architecture structure of full_adder is
	signal s1, s2, s3 : std_logic;
begin
	ha1: entity half_adder port map(a => a, b=> b, sum => s1, carry_out => s2);
	ha2: entity half_adder port map(a => s1, b => carry_in, sum => sum, carry_out => s3);
	or1: entity or_2 port map(a => s2, b => s3, or_out => carry_out);
	
end structure