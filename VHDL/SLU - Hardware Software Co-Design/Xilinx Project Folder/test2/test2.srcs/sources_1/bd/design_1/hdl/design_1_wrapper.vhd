--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Thu Dec  3 15:26:07 2020
--Host        : MDD-ECE-FTDG853 running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    A_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    LED_0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Myen_sw_0 : in STD_LOGIC;
    Myrst_sw_0 : in STD_LOGIC;
    Reset : in STD_LOGIC;
    debug : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dp_0 : out STD_LOGIC;
    scl_0 : inout STD_LOGIC;
    sda_0 : inout STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    Reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    A_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dp_0 : out STD_LOGIC;
    LED_0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sda_0 : inout STD_LOGIC;
    scl_0 : inout STD_LOGIC;
    Myen_sw_0 : in STD_LOGIC;
    Myrst_sw_0 : in STD_LOGIC;
    debug : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      A_0(3 downto 0) => A_0(3 downto 0),
      LED_0(6 downto 0) => LED_0(6 downto 0),
      Myen_sw_0 => Myen_sw_0,
      Myrst_sw_0 => Myrst_sw_0,
      Reset => Reset,
      debug(7 downto 0) => debug(7 downto 0),
      dp_0 => dp_0,
      scl_0 => scl_0,
      sda_0 => sda_0,
      sys_clock => sys_clock
    );
end STRUCTURE;
