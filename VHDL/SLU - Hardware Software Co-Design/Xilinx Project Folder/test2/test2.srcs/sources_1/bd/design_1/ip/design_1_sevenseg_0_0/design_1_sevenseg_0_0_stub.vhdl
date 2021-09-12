-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Wed Dec  2 11:24:52 2020
-- Host        : Garin-Book running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/work/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_sevenseg_0_0/design_1_sevenseg_0_0_stub.vhdl
-- Design      : design_1_sevenseg_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
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
attribute black_box_pad_pin of stub : architecture is "clk,reset_n,inputNum[0:15],A[3:0],dp,LED[6:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "sevenseg,Vivado 2019.1";
begin
end;
