--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Sun Oct 11 18:50:28 2020
--Host        : Garin-Book running 64-bit major release  (build 9200)
--Command     : generate_target test_1_wrapper.bd
--Design      : test_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_1_wrapper is
  port (
    a_0 : in STD_LOGIC;
    b_0 : out STD_LOGIC
  );
end test_1_wrapper;

architecture STRUCTURE of test_1_wrapper is
  component test_1 is
  port (
    a_0 : in STD_LOGIC;
    b_0 : out STD_LOGIC
  );
  end component test_1;
begin
test_1_i: component test_1
     port map (
      a_0 => a_0,
      b_0 => b_0
    );
end STRUCTURE;
