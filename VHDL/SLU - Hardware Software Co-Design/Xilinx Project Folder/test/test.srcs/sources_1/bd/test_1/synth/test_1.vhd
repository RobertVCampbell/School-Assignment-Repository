--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Sun Oct 11 18:50:28 2020
--Host        : Garin-Book running 64-bit major release  (build 9200)
--Command     : generate_target test_1.bd
--Design      : test_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_1 is
  port (
    a_0 : in STD_LOGIC;
    b_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of test_1 : entity is "test_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=test_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of test_1 : entity is "test_1.hwdef";
end test_1;

architecture STRUCTURE of test_1 is
  component test_1_test_0_0 is
  port (
    a : in STD_LOGIC;
    b : out STD_LOGIC
  );
  end component test_1_test_0_0;
  signal a_0_1 : STD_LOGIC;
  signal test_0_b : STD_LOGIC;
begin
  a_0_1 <= a_0;
  b_0 <= test_0_b;
test_0: component test_1_test_0_0
     port map (
      a => a_0_1,
      b => test_0_b
    );
end STRUCTURE;
