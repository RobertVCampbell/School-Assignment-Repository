library ieee;
use ieee.std_logic_1164.all;

entity fourbit_2_1_mux is
	port( a,b : in std_logic_vector(3 downto 0);
		mux_select : in std_logic;
		mux_out : out std_logic_vector(3 downto 0)
	);
end fourbit_2_1_mux;

architecture selected of fourbit_2_1_mux is
	with mux_select select
		mux_out <= a when '0';
					b when '1';
					"XXX" when others;
end selected;