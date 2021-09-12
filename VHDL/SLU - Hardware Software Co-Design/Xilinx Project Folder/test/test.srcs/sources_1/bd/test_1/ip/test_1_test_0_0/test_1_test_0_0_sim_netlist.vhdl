-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sun Oct 11 18:48:44 2020
-- Host        : Garin-Book running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/work/test/test.srcs/sources_1/bd/test_1/ip/test_1_test_0_0/test_1_test_0_0_sim_netlist.vhdl
-- Design      : test_1_test_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_1_test_0_0 is
  port (
    a : in STD_LOGIC;
    b : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of test_1_test_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of test_1_test_0_0 : entity is "test_1_test_0_0,test,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of test_1_test_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of test_1_test_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of test_1_test_0_0 : entity is "test,Vivado 2019.1";
end test_1_test_0_0;

architecture STRUCTURE of test_1_test_0_0 is
begin
b_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => a,
      O => b
    );
end STRUCTURE;
