library ieee;
use ieee.std_logic_1164.all

entity half_adder is
	port(a,b :in std_logic;
		sum, carry_out : out std_logic);
end half_adder;

architecture mixed of half_adder is
begin
	sum <= a xor b;
	co: process(a,b)
		begin
		if a = '1' then
			carry_out <= b;
		else
			carry_out <= '0';
		end if;
	end process co;
end mixed;