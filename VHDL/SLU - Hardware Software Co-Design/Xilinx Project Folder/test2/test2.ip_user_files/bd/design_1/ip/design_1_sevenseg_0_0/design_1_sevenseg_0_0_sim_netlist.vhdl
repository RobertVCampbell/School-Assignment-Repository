-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Wed Dec  2 11:24:52 2020
-- Host        : Garin-Book running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/work/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_sevenseg_0_0/design_1_sevenseg_0_0_sim_netlist.vhdl
-- Design      : design_1_sevenseg_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_sevenseg_0_0_sevenseg is
  port (
    A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    LED : out STD_LOGIC_VECTOR ( 6 downto 0 );
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    inputNum : in STD_LOGIC_VECTOR ( 0 to 15 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_sevenseg_0_0_sevenseg : entity is "sevenseg";
end design_1_sevenseg_0_0_sevenseg;

architecture STRUCTURE of design_1_sevenseg_0_0_sevenseg is
  signal LEDnum : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \clk10[0]_i_2_n_0\ : STD_LOGIC;
  signal \clk10[0]_i_3_n_0\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \clk10_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \clk10_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \clk10_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \clk10_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \clk10_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \clk10_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \clk10_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \clk10_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \clk10_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \clk10_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clk10_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \clk10_reg_n_0_[0]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[10]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[11]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[12]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[13]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[14]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[15]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[16]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[17]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[1]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[2]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[3]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[4]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[5]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[6]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[7]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[8]\ : STD_LOGIC;
  signal \clk10_reg_n_0_[9]\ : STD_LOGIC;
  signal \decoder__29\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk10_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \A[0]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \A[1]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \A[3]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \LED[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \LED[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \LED[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \LED[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \LED[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \LED[6]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of dp_INST_0 : label is "soft_lutpair3";
begin
\A[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => LEDnum(0),
      I1 => LEDnum(1),
      O => A(0)
    );
\A[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => LEDnum(0),
      I1 => LEDnum(1),
      O => A(1)
    );
\A[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => LEDnum(0),
      I1 => LEDnum(1),
      O => A(3)
    );
\LED[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4025"
    )
        port map (
      I0 => \decoder__29\(3),
      I1 => \decoder__29\(0),
      I2 => \decoder__29\(2),
      I3 => \decoder__29\(1),
      O => LED(0)
    );
\LED[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5390"
    )
        port map (
      I0 => \decoder__29\(3),
      I1 => \decoder__29\(2),
      I2 => \decoder__29\(0),
      I3 => \decoder__29\(1),
      O => LED(1)
    );
\LED[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5710"
    )
        port map (
      I0 => \decoder__29\(3),
      I1 => \decoder__29\(1),
      I2 => \decoder__29\(2),
      I3 => \decoder__29\(0),
      O => LED(2)
    );
\LED[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C014"
    )
        port map (
      I0 => \decoder__29\(3),
      I1 => \decoder__29\(2),
      I2 => \decoder__29\(0),
      I3 => \decoder__29\(1),
      O => LED(3)
    );
\LED[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A210"
    )
        port map (
      I0 => \decoder__29\(3),
      I1 => \decoder__29\(0),
      I2 => \decoder__29\(1),
      I3 => \decoder__29\(2),
      O => LED(4)
    );
\LED[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AC48"
    )
        port map (
      I0 => \decoder__29\(3),
      I1 => \decoder__29\(2),
      I2 => \decoder__29\(0),
      I3 => \decoder__29\(1),
      O => LED(5)
    );
\LED[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2094"
    )
        port map (
      I0 => \decoder__29\(3),
      I1 => \decoder__29\(2),
      I2 => \decoder__29\(0),
      I3 => \decoder__29\(1),
      O => LED(6)
    );
\LED[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inputNum(8),
      I1 => inputNum(12),
      I2 => inputNum(0),
      I3 => LEDnum(1),
      I4 => LEDnum(0),
      I5 => inputNum(4),
      O => \decoder__29\(3)
    );
\LED[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inputNum(9),
      I1 => inputNum(13),
      I2 => inputNum(1),
      I3 => LEDnum(1),
      I4 => LEDnum(0),
      I5 => inputNum(5),
      O => \decoder__29\(2)
    );
\LED[6]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inputNum(11),
      I1 => inputNum(15),
      I2 => inputNum(3),
      I3 => LEDnum(1),
      I4 => LEDnum(0),
      I5 => inputNum(7),
      O => \decoder__29\(0)
    );
\LED[6]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inputNum(10),
      I1 => inputNum(14),
      I2 => inputNum(2),
      I3 => LEDnum(1),
      I4 => LEDnum(0),
      I5 => inputNum(6),
      O => \decoder__29\(1)
    );
\clk10[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset_n,
      O => \clk10[0]_i_2_n_0\
    );
\clk10[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \clk10_reg_n_0_[0]\,
      O => \clk10[0]_i_3_n_0\
    );
\clk10_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[0]_i_1_n_7\,
      Q => \clk10_reg_n_0_[0]\
    );
\clk10_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk10_reg[0]_i_1_n_0\,
      CO(2) => \clk10_reg[0]_i_1_n_1\,
      CO(1) => \clk10_reg[0]_i_1_n_2\,
      CO(0) => \clk10_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \clk10_reg[0]_i_1_n_4\,
      O(2) => \clk10_reg[0]_i_1_n_5\,
      O(1) => \clk10_reg[0]_i_1_n_6\,
      O(0) => \clk10_reg[0]_i_1_n_7\,
      S(3) => \clk10_reg_n_0_[3]\,
      S(2) => \clk10_reg_n_0_[2]\,
      S(1) => \clk10_reg_n_0_[1]\,
      S(0) => \clk10[0]_i_3_n_0\
    );
\clk10_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[8]_i_1_n_5\,
      Q => \clk10_reg_n_0_[10]\
    );
\clk10_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[8]_i_1_n_4\,
      Q => \clk10_reg_n_0_[11]\
    );
\clk10_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[12]_i_1_n_7\,
      Q => \clk10_reg_n_0_[12]\
    );
\clk10_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk10_reg[8]_i_1_n_0\,
      CO(3) => \clk10_reg[12]_i_1_n_0\,
      CO(2) => \clk10_reg[12]_i_1_n_1\,
      CO(1) => \clk10_reg[12]_i_1_n_2\,
      CO(0) => \clk10_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk10_reg[12]_i_1_n_4\,
      O(2) => \clk10_reg[12]_i_1_n_5\,
      O(1) => \clk10_reg[12]_i_1_n_6\,
      O(0) => \clk10_reg[12]_i_1_n_7\,
      S(3) => \clk10_reg_n_0_[15]\,
      S(2) => \clk10_reg_n_0_[14]\,
      S(1) => \clk10_reg_n_0_[13]\,
      S(0) => \clk10_reg_n_0_[12]\
    );
\clk10_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[12]_i_1_n_6\,
      Q => \clk10_reg_n_0_[13]\
    );
\clk10_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[12]_i_1_n_5\,
      Q => \clk10_reg_n_0_[14]\
    );
\clk10_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[12]_i_1_n_4\,
      Q => \clk10_reg_n_0_[15]\
    );
\clk10_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[16]_i_1_n_7\,
      Q => \clk10_reg_n_0_[16]\
    );
\clk10_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk10_reg[12]_i_1_n_0\,
      CO(3) => \NLW_clk10_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \clk10_reg[16]_i_1_n_1\,
      CO(1) => \clk10_reg[16]_i_1_n_2\,
      CO(0) => \clk10_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk10_reg[16]_i_1_n_4\,
      O(2) => \clk10_reg[16]_i_1_n_5\,
      O(1) => \clk10_reg[16]_i_1_n_6\,
      O(0) => \clk10_reg[16]_i_1_n_7\,
      S(3 downto 2) => LEDnum(1 downto 0),
      S(1) => \clk10_reg_n_0_[17]\,
      S(0) => \clk10_reg_n_0_[16]\
    );
\clk10_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[16]_i_1_n_6\,
      Q => \clk10_reg_n_0_[17]\
    );
\clk10_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[16]_i_1_n_5\,
      Q => LEDnum(0)
    );
\clk10_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[16]_i_1_n_4\,
      Q => LEDnum(1)
    );
\clk10_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[0]_i_1_n_6\,
      Q => \clk10_reg_n_0_[1]\
    );
\clk10_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[0]_i_1_n_5\,
      Q => \clk10_reg_n_0_[2]\
    );
\clk10_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[0]_i_1_n_4\,
      Q => \clk10_reg_n_0_[3]\
    );
\clk10_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[4]_i_1_n_7\,
      Q => \clk10_reg_n_0_[4]\
    );
\clk10_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk10_reg[0]_i_1_n_0\,
      CO(3) => \clk10_reg[4]_i_1_n_0\,
      CO(2) => \clk10_reg[4]_i_1_n_1\,
      CO(1) => \clk10_reg[4]_i_1_n_2\,
      CO(0) => \clk10_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk10_reg[4]_i_1_n_4\,
      O(2) => \clk10_reg[4]_i_1_n_5\,
      O(1) => \clk10_reg[4]_i_1_n_6\,
      O(0) => \clk10_reg[4]_i_1_n_7\,
      S(3) => \clk10_reg_n_0_[7]\,
      S(2) => \clk10_reg_n_0_[6]\,
      S(1) => \clk10_reg_n_0_[5]\,
      S(0) => \clk10_reg_n_0_[4]\
    );
\clk10_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[4]_i_1_n_6\,
      Q => \clk10_reg_n_0_[5]\
    );
\clk10_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[4]_i_1_n_5\,
      Q => \clk10_reg_n_0_[6]\
    );
\clk10_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[4]_i_1_n_4\,
      Q => \clk10_reg_n_0_[7]\
    );
\clk10_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[8]_i_1_n_7\,
      Q => \clk10_reg_n_0_[8]\
    );
\clk10_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk10_reg[4]_i_1_n_0\,
      CO(3) => \clk10_reg[8]_i_1_n_0\,
      CO(2) => \clk10_reg[8]_i_1_n_1\,
      CO(1) => \clk10_reg[8]_i_1_n_2\,
      CO(0) => \clk10_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk10_reg[8]_i_1_n_4\,
      O(2) => \clk10_reg[8]_i_1_n_5\,
      O(1) => \clk10_reg[8]_i_1_n_6\,
      O(0) => \clk10_reg[8]_i_1_n_7\,
      S(3) => \clk10_reg_n_0_[11]\,
      S(2) => \clk10_reg_n_0_[10]\,
      S(1) => \clk10_reg_n_0_[9]\,
      S(0) => \clk10_reg_n_0_[8]\
    );
\clk10_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \clk10[0]_i_2_n_0\,
      D => \clk10_reg[8]_i_1_n_6\,
      Q => \clk10_reg_n_0_[9]\
    );
dp_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => LEDnum(1),
      I1 => LEDnum(0),
      O => A(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_sevenseg_0_0 is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    inputNum : in STD_LOGIC_VECTOR ( 0 to 15 );
    A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dp : out STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_sevenseg_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_sevenseg_0_0 : entity is "design_1_sevenseg_0_0,sevenseg,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_sevenseg_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_sevenseg_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_sevenseg_0_0 : entity is "sevenseg,Vivado 2019.1";
end design_1_sevenseg_0_0;

architecture STRUCTURE of design_1_sevenseg_0_0 is
  signal \^a\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^dp\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of reset_n : signal is "xilinx.com:signal:reset:1.0 reset_n RST";
  attribute x_interface_parameter of reset_n : signal is "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  A(3) <= \^a\(3);
  A(2) <= \^dp\;
  A(1 downto 0) <= \^a\(1 downto 0);
  dp <= \^dp\;
U0: entity work.design_1_sevenseg_0_0_sevenseg
     port map (
      A(3) => \^a\(3),
      A(2) => \^dp\,
      A(1 downto 0) => \^a\(1 downto 0),
      LED(6 downto 0) => LED(6 downto 0),
      clk => clk,
      inputNum(0 to 15) => inputNum(0 to 15),
      reset_n => reset_n
    );
end STRUCTURE;
