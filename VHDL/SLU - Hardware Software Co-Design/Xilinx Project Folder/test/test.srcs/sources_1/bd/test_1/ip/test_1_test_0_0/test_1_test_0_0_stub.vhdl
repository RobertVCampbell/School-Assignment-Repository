-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sun Oct 11 18:48:44 2020
-- Host        : Garin-Book running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/work/test/test.srcs/sources_1/bd/test_1/ip/test_1_test_0_0/test_1_test_0_0_stub.vhdl
-- Design      : test_1_test_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_1_test_0_0 is
  Port ( 
    a : in STD_LOGIC;
    b : out STD_LOGIC
  );

end test_1_test_0_0;

architecture stub of test_1_test_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a,b";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "test,Vivado 2019.1";
begin
end;
