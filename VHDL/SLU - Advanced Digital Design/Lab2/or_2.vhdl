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