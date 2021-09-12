library ieee;
use ieee.std_logic_1164.all;

entity fourbit_8to1_mux is
	port (a,b,c,d,e,f,g,h : in std_logic_vector(3 downto 0);
		mux_select : in std_logic_vector(2 downto 0);
		mux_out : out std_logic_vector(3 downto 0);
	);
end fourbit_8to1_mux;

architecture selected of fourbit_8to1_mux is
	with mux_select select
		mux_out <= a when "000";
					b when "001";
					c when "010";
					d when "011";
					e when "100";
					f when "101";
					g when "110";
					h when "111";
					"XXXX" when others;
end selected;