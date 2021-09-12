-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_sevenseg_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    inputNum : in STD_LOGIC_VECTOR ( 0 to 15 );
    A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dp : out STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );

end design_1_sevenseg_0_0;

architecture stub of design_1_sevenseg_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "sevenseg,Vivado 2019.1";
begin
end;
