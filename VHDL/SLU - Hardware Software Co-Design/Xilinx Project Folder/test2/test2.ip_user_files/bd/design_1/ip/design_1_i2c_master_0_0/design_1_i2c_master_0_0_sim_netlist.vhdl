-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Wed Dec  2 15:34:36 2020
-- Host        : Garin-Book running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/work/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_i2c_master_0_0/design_1_i2c_master_0_0_sim_netlist.vhdl
-- Design      : design_1_i2c_master_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_i2c_master_0_0_i2c_master is
  port (
    data_ready : out STD_LOGIC;
    busy : out STD_LOGIC;
    ack_error : out STD_LOGIC;
    scl : out STD_LOGIC;
    samp : out STD_LOGIC_VECTOR ( 15 downto 0 );
    data_rd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sda : inout STD_LOGIC;
    clk : in STD_LOGIC;
    p_2_in : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    ena : in STD_LOGIC;
    data_done : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_i2c_master_0_0_i2c_master : entity is "i2c_master";
end design_1_i2c_master_0_0_i2c_master;

architecture STRUCTURE of design_1_i2c_master_0_0_i2c_master is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \^ack_error\ : STD_LOGIC;
  signal ack_error2_out : STD_LOGIC;
  signal ack_error_i_1_n_0 : STD_LOGIC;
  signal ack_error_i_2_n_0 : STD_LOGIC;
  signal ack_error_i_4_n_0 : STD_LOGIC;
  signal ack_error_i_5_n_0 : STD_LOGIC;
  signal ack_error_i_6_n_0 : STD_LOGIC;
  signal \addr_rw[0]_i_1_n_0\ : STD_LOGIC;
  signal \addr_rw[0]_i_2_n_0\ : STD_LOGIC;
  signal \addr_rw_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \^busy\ : STD_LOGIC;
  signal busy4_out : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_i_2_n_0 : STD_LOGIC;
  signal busy_i_3_n_0 : STD_LOGIC;
  signal busy_i_5_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \count[12]_i_2_n_0\ : STD_LOGIC;
  signal \count[12]_i_4_n_0\ : STD_LOGIC;
  signal \count[12]_i_5_n_0\ : STD_LOGIC;
  signal \count[3]_i_3_n_0\ : STD_LOGIC;
  signal count_0 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \count_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \count_reg[11]_i_2_n_2\ : STD_LOGIC;
  signal \count_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \count_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \count_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \count_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \count_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \count_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \count_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal data_clk : STD_LOGIC;
  signal data_clk_i_1_n_0 : STD_LOGIC;
  signal data_clk_i_2_n_0 : STD_LOGIC;
  signal data_clk_i_3_n_0 : STD_LOGIC;
  signal data_clk_i_4_n_0 : STD_LOGIC;
  signal data_clk_i_5_n_0 : STD_LOGIC;
  signal data_clk_i_6_n_0 : STD_LOGIC;
  signal data_clk_i_7_n_0 : STD_LOGIC;
  signal data_clk_i_8_n_0 : STD_LOGIC;
  signal data_clk_prev : STD_LOGIC;
  signal data_clk_prev_i_1_n_0 : STD_LOGIC;
  signal \data_rd[7]_i_1_n_0\ : STD_LOGIC;
  signal \data_rd[7]_i_2_n_0\ : STD_LOGIC;
  signal \^data_ready\ : STD_LOGIC;
  signal data_ready1 : STD_LOGIC;
  signal data_ready_i_1_n_0 : STD_LOGIC;
  signal data_ready_i_2_n_0 : STD_LOGIC;
  signal data_ready_i_3_n_0 : STD_LOGIC;
  signal \data_rx[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[1]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[2]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[3]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[4]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[5]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[6]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[7]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[7]_i_2_n_0\ : STD_LOGIC;
  signal in14 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal samp0 : STD_LOGIC;
  signal \samp[15]_i_2_n_0\ : STD_LOGIC;
  signal \sample[15]_i_1_n_0\ : STD_LOGIC;
  signal \sample[15]_i_2_n_0\ : STD_LOGIC;
  signal \sample[7]_i_1_n_0\ : STD_LOGIC;
  signal \sample_reg_n_0_[0]\ : STD_LOGIC;
  signal \sample_reg_n_0_[10]\ : STD_LOGIC;
  signal \sample_reg_n_0_[11]\ : STD_LOGIC;
  signal \sample_reg_n_0_[12]\ : STD_LOGIC;
  signal \sample_reg_n_0_[13]\ : STD_LOGIC;
  signal \sample_reg_n_0_[14]\ : STD_LOGIC;
  signal \sample_reg_n_0_[15]\ : STD_LOGIC;
  signal \sample_reg_n_0_[1]\ : STD_LOGIC;
  signal \sample_reg_n_0_[2]\ : STD_LOGIC;
  signal \sample_reg_n_0_[3]\ : STD_LOGIC;
  signal \sample_reg_n_0_[4]\ : STD_LOGIC;
  signal \sample_reg_n_0_[5]\ : STD_LOGIC;
  signal \sample_reg_n_0_[6]\ : STD_LOGIC;
  signal \sample_reg_n_0_[7]\ : STD_LOGIC;
  signal \sample_reg_n_0_[8]\ : STD_LOGIC;
  signal \sample_reg_n_0_[9]\ : STD_LOGIC;
  signal scl_clk : STD_LOGIC;
  signal scl_clk_i_1_n_0 : STD_LOGIC;
  signal scl_clk_i_2_n_0 : STD_LOGIC;
  signal scl_clk_i_3_n_0 : STD_LOGIC;
  signal scl_ena_i_1_n_0 : STD_LOGIC;
  signal scl_ena_i_2_n_0 : STD_LOGIC;
  signal scl_ena_reg_n_0 : STD_LOGIC;
  signal scl_reg0 : STD_LOGIC;
  signal sda_INST_0_i_2_n_0 : STD_LOGIC;
  signal sda_INST_0_i_3_n_0 : STD_LOGIC;
  signal sda_INST_0_i_4_n_0 : STD_LOGIC;
  signal sda_ena_n : STD_LOGIC;
  signal sda_int6_out : STD_LOGIC;
  signal sda_int_i_1_n_0 : STD_LOGIC;
  signal sda_int_i_2_n_0 : STD_LOGIC;
  signal sda_int_i_3_n_0 : STD_LOGIC;
  signal sda_int_i_5_n_0 : STD_LOGIC;
  signal sda_int_i_6_n_0 : STD_LOGIC;
  signal sda_int_i_7_n_0 : STD_LOGIC;
  signal sda_int_i_8_n_0 : STD_LOGIC;
  signal sda_int_i_9_n_0 : STD_LOGIC;
  signal sda_int_reg_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal stretch : STD_LOGIC;
  signal stretch_i_1_n_0 : STD_LOGIC;
  signal stretch_i_2_n_0 : STD_LOGIC;
  signal stretch_i_3_n_0 : STD_LOGIC;
  signal stretch_i_4_n_0 : STD_LOGIC;
  signal stretch_i_5_n_0 : STD_LOGIC;
  signal stretch_i_6_n_0 : STD_LOGIC;
  signal \NLW_count_reg[12]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count_reg[12]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_4\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_1\ : label is "soft_lutpair11";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[3]\ : label is "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[4]\ : label is "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111";
  attribute SOFT_HLUTNM of \addr_rw[0]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bit_cnt[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bit_cnt[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of busy_i_5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[10]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[11]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \count[12]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count[5]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count[6]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \count[7]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \count[8]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \count[9]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of data_clk_i_4 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of data_clk_i_7 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of data_clk_i_8 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of data_clk_prev_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \data_rd[7]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of data_ready_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of data_ready_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \samp[15]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of scl_ena_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of sda_INST_0_i_3 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of sda_INST_0_i_4 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of sda_int_i_6 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of sda_int_i_8 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of sda_int_i_9 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of stretch_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of stretch_i_6 : label is "soft_lutpair5";
begin
  ack_error <= \^ack_error\;
  busy <= \^busy\;
  data_ready <= \^data_ready\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00004F4F0000FF00"
    )
        port map (
      I0 => \data_rd[7]_i_2_n_0\,
      I1 => sda_INST_0_i_3_n_0,
      I2 => state(0),
      I3 => \FSM_sequential_state[0]_i_2_n_0\,
      I4 => state(4),
      I5 => state(3),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02A2FEA4"
    )
        port map (
      I0 => state(2),
      I1 => ena,
      I2 => state(1),
      I3 => \data_rd[7]_i_2_n_0\,
      I4 => state(0),
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBFBEEEEAAAAAAAA"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_2_n_0\,
      I1 => state(1),
      I2 => state(2),
      I3 => \data_rd[7]_i_2_n_0\,
      I4 => state(0),
      I5 => \FSM_sequential_state[1]_i_3_n_0\,
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A802A800A8A2A80"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_4_n_0\,
      I1 => \data_rd[7]_i_2_n_0\,
      I2 => state(0),
      I3 => state(1),
      I4 => state(2),
      I5 => ena,
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state(4),
      I1 => state(3),
      O => \FSM_sequential_state[1]_i_3_n_0\
    );
\FSM_sequential_state[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(3),
      I1 => state(4),
      O => \FSM_sequential_state[1]_i_4_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_2_n_0\,
      I1 => state(4),
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFF5FFFA300F000"
    )
        port map (
      I0 => \data_rd[7]_i_2_n_0\,
      I1 => ena,
      I2 => state(0),
      I3 => state(1),
      I4 => state(3),
      I5 => state(2),
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_2_n_0\,
      I1 => state(4),
      O => \FSM_sequential_state[3]_i_1_n_0\
    );
\FSM_sequential_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2C2CCCFCCCCCCCCC"
    )
        port map (
      I0 => \data_rd[7]_i_2_n_0\,
      I1 => state(3),
      I2 => state(0),
      I3 => ena,
      I4 => state(1),
      I5 => state(2),
      O => \FSM_sequential_state[3]_i_2_n_0\
    );
\FSM_sequential_state[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_clk,
      I1 => data_clk_prev,
      O => data_ready1
    );
\FSM_sequential_state[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7444444444444444"
    )
        port map (
      I0 => data_done,
      I1 => state(4),
      I2 => state(2),
      I3 => state(1),
      I4 => state(3),
      I5 => state(0),
      O => \FSM_sequential_state[4]_i_2_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1)
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => state(2)
    );
\FSM_sequential_state_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_sequential_state[3]_i_1_n_0\,
      Q => state(3)
    );
\FSM_sequential_state_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_sequential_state[4]_i_2_n_0\,
      Q => state(4)
    );
ack_error_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ack_error_i_2_n_0,
      I1 => ack_error2_out,
      I2 => \^ack_error\,
      O => ack_error_i_1_n_0
    );
ack_error_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E4E4E4D8"
    )
        port map (
      I0 => state(2),
      I1 => sda,
      I2 => scl_ena_reg_n_0,
      I3 => state(3),
      I4 => state(1),
      O => ack_error_i_2_n_0
    );
ack_error_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0022000F00000000"
    )
        port map (
      I0 => ack_error_i_4_n_0,
      I1 => state(3),
      I2 => ack_error_i_5_n_0,
      I3 => state(4),
      I4 => state(0),
      I5 => ack_error_i_6_n_0,
      O => ack_error2_out
    );
ack_error_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6071"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => sda,
      I3 => scl_ena_reg_n_0,
      O => ack_error_i_4_n_0
    );
ack_error_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF7CFF7"
    )
        port map (
      I0 => sda,
      I1 => state(3),
      I2 => state(2),
      I3 => state(1),
      I4 => scl_ena_reg_n_0,
      O => ack_error_i_5_n_0
    );
ack_error_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_clk_prev,
      I1 => data_clk,
      O => ack_error_i_6_n_0
    );
ack_error_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => ack_error_i_1_n_0,
      Q => \^ack_error\
    );
\addr_rw[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF7FF00000000"
    )
        port map (
      I0 => \addr_rw[0]_i_2_n_0\,
      I1 => data_clk,
      I2 => data_clk_prev,
      I3 => reset_n,
      I4 => state(4),
      I5 => \addr_rw_reg_n_0_[0]\,
      O => \addr_rw[0]_i_1_n_0\
    );
\addr_rw[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => ena,
      I1 => state(0),
      I2 => state(3),
      I3 => state(2),
      I4 => state(1),
      O => \addr_rw[0]_i_2_n_0\
    );
\addr_rw_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \addr_rw[0]_i_1_n_0\,
      Q => \addr_rw_reg_n_0_[0]\,
      R => '0'
    );
\bit_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \bit_cnt[2]_i_2_n_0\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      O => \bit_cnt[0]_i_1_n_0\
    );
\bit_cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => \bit_cnt[2]_i_2_n_0\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      O => \bit_cnt[1]_i_1_n_0\
    );
\bit_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF10"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[1]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => \bit_cnt[2]_i_2_n_0\,
      I3 => \bit_cnt_reg_n_0_[2]\,
      O => \bit_cnt[2]_i_1_n_0\
    );
\bit_cnt[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0220220000020020"
    )
        port map (
      I0 => data_ready1,
      I1 => state(4),
      I2 => state(2),
      I3 => state(3),
      I4 => state(1),
      I5 => state(0),
      O => \bit_cnt[2]_i_2_n_0\
    );
\bit_cnt_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \bit_cnt[0]_i_1_n_0\,
      PRE => busy_i_2_n_0,
      Q => \bit_cnt_reg_n_0_[0]\
    );
\bit_cnt_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \bit_cnt[1]_i_1_n_0\,
      PRE => busy_i_2_n_0,
      Q => \bit_cnt_reg_n_0_[1]\
    );
\bit_cnt_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \bit_cnt[2]_i_1_n_0\,
      PRE => busy_i_2_n_0,
      Q => \bit_cnt_reg_n_0_[2]\
    );
busy_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => busy_i_3_n_0,
      I1 => busy4_out,
      I2 => \^busy\,
      O => busy_i_1_n_0
    );
busy_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset_n,
      O => busy_i_2_n_0
    );
busy_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00007733000000FC"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => ena,
      I3 => state(3),
      I4 => state(4),
      I5 => state(0),
      O => busy_i_3_n_0
    );
busy_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99C8F9BB00000000"
    )
        port map (
      I0 => state(0),
      I1 => state(3),
      I2 => ena,
      I3 => state(2),
      I4 => state(1),
      I5 => busy_i_5_n_0,
      O => busy4_out
    );
busy_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => data_clk_prev,
      I1 => data_clk,
      I2 => state(4),
      O => busy_i_5_n_0
    );
busy_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => busy_i_1_n_0,
      PRE => busy_i_2_n_0,
      Q => \^busy\
    );
\count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(0),
      O => count_0(0)
    );
\count[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(10),
      O => count_0(10)
    );
\count[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(11),
      O => count_0(11)
    );
\count[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(12),
      O => count_0(12)
    );
\count[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \count[12]_i_4_n_0\,
      I1 => count(4),
      I2 => count(3),
      I3 => count(6),
      I4 => count(5),
      I5 => \count[12]_i_5_n_0\,
      O => \count[12]_i_2_n_0\
    );
\count[12]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => count(8),
      I1 => count(7),
      I2 => count(9),
      I3 => count(10),
      O => \count[12]_i_4_n_0\
    );
\count[12]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
        port map (
      I0 => count(0),
      I1 => count(11),
      I2 => count(12),
      I3 => count(2),
      I4 => count(1),
      O => \count[12]_i_5_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(1),
      O => count_0(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(2),
      O => count_0(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(3),
      O => count_0(3)
    );
\count[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => count(0),
      I1 => stretch,
      O => \count[3]_i_3_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(4),
      O => count_0(4)
    );
\count[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(5),
      O => count_0(5)
    );
\count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(6),
      O => count_0(6)
    );
\count[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(7),
      O => count_0(7)
    );
\count[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(8),
      O => count_0(8)
    );
\count[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(9),
      O => count_0(9)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(0),
      Q => count(0)
    );
\count_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(10),
      Q => count(10)
    );
\count_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(11),
      Q => count(11)
    );
\count_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[7]_i_2_n_0\,
      CO(3) => \count_reg[11]_i_2_n_0\,
      CO(2) => \count_reg[11]_i_2_n_1\,
      CO(1) => \count_reg[11]_i_2_n_2\,
      CO(0) => \count_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(11 downto 8),
      S(3 downto 0) => count(11 downto 8)
    );
\count_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(12),
      Q => count(12)
    );
\count_reg[12]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[11]_i_2_n_0\,
      CO(3 downto 0) => \NLW_count_reg[12]_i_3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_count_reg[12]_i_3_O_UNCONNECTED\(3 downto 1),
      O(0) => data0(12),
      S(3 downto 1) => B"000",
      S(0) => count(12)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(1),
      Q => count(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(2),
      Q => count(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(3),
      Q => count(3)
    );
\count_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_reg[3]_i_2_n_0\,
      CO(2) => \count_reg[3]_i_2_n_1\,
      CO(1) => \count_reg[3]_i_2_n_2\,
      CO(0) => \count_reg[3]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => count(0),
      O(3 downto 0) => data0(3 downto 0),
      S(3 downto 1) => count(3 downto 1),
      S(0) => \count[3]_i_3_n_0\
    );
\count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(4),
      Q => count(4)
    );
\count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(5),
      Q => count(5)
    );
\count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(6),
      Q => count(6)
    );
\count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(7),
      Q => count(7)
    );
\count_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[3]_i_2_n_0\,
      CO(3) => \count_reg[7]_i_2_n_0\,
      CO(2) => \count_reg[7]_i_2_n_1\,
      CO(1) => \count_reg[7]_i_2_n_2\,
      CO(0) => \count_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(7 downto 4),
      S(3 downto 0) => count(7 downto 4)
    );
\count_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(8),
      Q => count(8)
    );
\count_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => count_0(9),
      Q => count(9)
    );
data_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAFFFFFFEA0000"
    )
        port map (
      I0 => data_clk_i_2_n_0,
      I1 => data_clk_i_3_n_0,
      I2 => data_clk_i_4_n_0,
      I3 => data_clk_i_5_n_0,
      I4 => reset_n,
      I5 => data_clk,
      O => data_clk_i_1_n_0
    );
data_clk_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000C080800080808"
    )
        port map (
      I0 => data0(11),
      I1 => \count[12]_i_2_n_0\,
      I2 => data0(12),
      I3 => data0(9),
      I4 => data0(10),
      I5 => data0(8),
      O => data_clk_i_2_n_0
    );
data_clk_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000800080000000"
    )
        port map (
      I0 => data_clk_i_6_n_0,
      I1 => data0(7),
      I2 => data0(6),
      I3 => data0(5),
      I4 => data0(1),
      I5 => data_clk_i_7_n_0,
      O => data_clk_i_3_n_0
    );
data_clk_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \count[12]_i_2_n_0\,
      I1 => data0(12),
      O => data_clk_i_4_n_0
    );
data_clk_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404040444440444"
    )
        port map (
      I0 => data_clk_i_8_n_0,
      I1 => data_clk_i_4_n_0,
      I2 => data0(11),
      I3 => data0(7),
      I4 => stretch_i_5_n_0,
      I5 => data0(8),
      O => data_clk_i_5_n_0
    );
data_clk_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(10),
      I1 => data0(9),
      O => data_clk_i_6_n_0
    );
data_clk_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data0(4),
      I1 => data0(3),
      I2 => data0(2),
      O => data_clk_i_7_n_0
    );
data_clk_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => data0(9),
      I1 => data0(10),
      O => data_clk_i_8_n_0
    );
data_clk_prev_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data_clk,
      I1 => reset_n,
      I2 => data_clk_prev,
      O => data_clk_prev_i_1_n_0
    );
data_clk_prev_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_clk_prev_i_1_n_0,
      Q => data_clk_prev,
      R => '0'
    );
data_clk_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_clk_i_1_n_0,
      Q => data_clk,
      R => '0'
    );
\data_rd[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \data_rd[7]_i_2_n_0\,
      I1 => state(1),
      I2 => state(2),
      I3 => \samp[15]_i_2_n_0\,
      I4 => state(4),
      I5 => data_ready1,
      O => \data_rd[7]_i_1_n_0\
    );
\data_rd[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[2]\,
      O => \data_rd[7]_i_2_n_0\
    );
\data_rd_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(0),
      Q => data_rd(0)
    );
\data_rd_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(1),
      Q => data_rd(1)
    );
\data_rd_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(2),
      Q => data_rd(2)
    );
\data_rd_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(3),
      Q => data_rd(3)
    );
\data_rd_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(4),
      Q => data_rd(4)
    );
\data_rd_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(5),
      Q => data_rd(5)
    );
\data_rd_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(6),
      Q => data_rd(6)
    );
\data_rd_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in14(7),
      Q => data_rd(7)
    );
data_ready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7CFFFFFF40000000"
    )
        port map (
      I0 => state(4),
      I1 => state(2),
      I2 => state(3),
      I3 => data_ready_i_2_n_0,
      I4 => data_ready_i_3_n_0,
      I5 => \^data_ready\,
      O => data_ready_i_1_n_0
    );
data_ready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => state(4),
      I1 => reset_n,
      I2 => data_clk_prev,
      I3 => data_clk,
      O => data_ready_i_2_n_0
    );
data_ready_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"81"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      O => data_ready_i_3_n_0
    );
data_ready_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_ready_i_1_n_0,
      Q => \^data_ready\,
      R => '0'
    );
\data_rx[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0100FEFF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[2]\,
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(0),
      I5 => sda,
      O => \data_rx[0]_i_1_n_0\
    );
\data_rx[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0200FDFF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[2]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(1),
      I5 => sda,
      O => \data_rx[1]_i_1_n_0\
    );
\data_rx[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF1000EFFF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[2]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(2),
      I5 => sda,
      O => \data_rx[2]_i_1_n_0\
    );
\data_rx[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF4000BFFF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[2]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(3),
      I5 => sda,
      O => \data_rx[3]_i_1_n_0\
    );
\data_rx[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF1000EFFF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[1]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => \bit_cnt_reg_n_0_[2]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(4),
      I5 => sda,
      O => \data_rx[4]_i_1_n_0\
    );
\data_rx[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0800F7FF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => \bit_cnt_reg_n_0_[2]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(5),
      I5 => sda,
      O => \data_rx[5]_i_1_n_0\
    );
\data_rx[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF4000BFFF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => \bit_cnt_reg_n_0_[2]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(6),
      I5 => sda,
      O => \data_rx[6]_i_1_n_0\
    );
\data_rx[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF80007FFF0000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[2]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in14(7),
      I5 => sda,
      O => \data_rx[7]_i_1_n_0\
    );
\data_rx[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => reset_n,
      I1 => state(4),
      I2 => data_clk_prev,
      I3 => data_clk,
      I4 => \samp[15]_i_2_n_0\,
      I5 => sda_INST_0_i_3_n_0,
      O => \data_rx[7]_i_2_n_0\
    );
\data_rx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[0]_i_1_n_0\,
      Q => in14(0),
      R => '0'
    );
\data_rx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[1]_i_1_n_0\,
      Q => in14(1),
      R => '0'
    );
\data_rx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[2]_i_1_n_0\,
      Q => in14(2),
      R => '0'
    );
\data_rx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[3]_i_1_n_0\,
      Q => in14(3),
      R => '0'
    );
\data_rx_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[4]_i_1_n_0\,
      Q => in14(4),
      R => '0'
    );
\data_rx_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[5]_i_1_n_0\,
      Q => in14(5),
      R => '0'
    );
\data_rx_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[6]_i_1_n_0\,
      Q => in14(6),
      R => '0'
    );
\data_rx_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[7]_i_1_n_0\,
      Q => in14(7),
      R => '0'
    );
\samp[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => \samp[15]_i_2_n_0\,
      I1 => state(1),
      I2 => state(2),
      I3 => data_ready1,
      I4 => reset_n,
      I5 => state(4),
      O => samp0
    );
\samp[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => state(0),
      I1 => state(3),
      O => \samp[15]_i_2_n_0\
    );
\samp_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[0]\,
      Q => samp(0),
      R => '0'
    );
\samp_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[10]\,
      Q => samp(10),
      R => '0'
    );
\samp_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[11]\,
      Q => samp(11),
      R => '0'
    );
\samp_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[12]\,
      Q => samp(12),
      R => '0'
    );
\samp_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[13]\,
      Q => samp(13),
      R => '0'
    );
\samp_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[14]\,
      Q => samp(14),
      R => '0'
    );
\samp_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[15]\,
      Q => samp(15),
      R => '0'
    );
\samp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[1]\,
      Q => samp(1),
      R => '0'
    );
\samp_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[2]\,
      Q => samp(2),
      R => '0'
    );
\samp_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[3]\,
      Q => samp(3),
      R => '0'
    );
\samp_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[4]\,
      Q => samp(4),
      R => '0'
    );
\samp_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[5]\,
      Q => samp(5),
      R => '0'
    );
\samp_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[6]\,
      Q => samp(6),
      R => '0'
    );
\samp_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[7]\,
      Q => samp(7),
      R => '0'
    );
\samp_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[8]\,
      Q => samp(8),
      R => '0'
    );
\samp_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => samp0,
      D => \sample_reg_n_0_[9]\,
      Q => samp(9),
      R => '0'
    );
\sample[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \sample[15]_i_2_n_0\,
      I1 => \data_rd[7]_i_2_n_0\,
      I2 => state(1),
      I3 => state(3),
      I4 => state(0),
      O => \sample[15]_i_1_n_0\
    );
\sample[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000700000"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => data_clk,
      I3 => data_clk_prev,
      I4 => reset_n,
      I5 => state(4),
      O => \sample[15]_i_2_n_0\
    );
\sample[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \sample[15]_i_2_n_0\,
      I1 => \data_rd[7]_i_2_n_0\,
      I2 => state(3),
      I3 => state(0),
      I4 => state(1),
      O => \sample[7]_i_1_n_0\
    );
\sample_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(0),
      Q => \sample_reg_n_0_[0]\,
      R => '0'
    );
\sample_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(2),
      Q => \sample_reg_n_0_[10]\,
      R => '0'
    );
\sample_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(3),
      Q => \sample_reg_n_0_[11]\,
      R => '0'
    );
\sample_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(4),
      Q => \sample_reg_n_0_[12]\,
      R => '0'
    );
\sample_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(5),
      Q => \sample_reg_n_0_[13]\,
      R => '0'
    );
\sample_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(6),
      Q => \sample_reg_n_0_[14]\,
      R => '0'
    );
\sample_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(7),
      Q => \sample_reg_n_0_[15]\,
      R => '0'
    );
\sample_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(1),
      Q => \sample_reg_n_0_[1]\,
      R => '0'
    );
\sample_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(2),
      Q => \sample_reg_n_0_[2]\,
      R => '0'
    );
\sample_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(3),
      Q => \sample_reg_n_0_[3]\,
      R => '0'
    );
\sample_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(4),
      Q => \sample_reg_n_0_[4]\,
      R => '0'
    );
\sample_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(5),
      Q => \sample_reg_n_0_[5]\,
      R => '0'
    );
\sample_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(6),
      Q => \sample_reg_n_0_[6]\,
      R => '0'
    );
\sample_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in14(7),
      Q => \sample_reg_n_0_[7]\,
      R => '0'
    );
\sample_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(0),
      Q => \sample_reg_n_0_[8]\,
      R => '0'
    );
\sample_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[15]_i_1_n_0\,
      D => in14(1),
      Q => \sample_reg_n_0_[9]\,
      R => '0'
    );
scl_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => '0',
      I1 => scl_reg0,
      I2 => '0',
      I3 => '0',
      I4 => '0',
      I5 => '0',
      O => scl
    );
scl_INST_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => scl_ena_reg_n_0,
      I1 => scl_clk,
      O => scl_reg0
    );
scl_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFA8FFFFFFA80000"
    )
        port map (
      I0 => count_0(11),
      I1 => data0(10),
      I2 => data0(9),
      I3 => scl_clk_i_2_n_0,
      I4 => reset_n,
      I5 => scl_clk,
      O => scl_clk_i_1_n_0
    );
scl_clk_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C888888888888888"
    )
        port map (
      I0 => data0(12),
      I1 => \count[12]_i_2_n_0\,
      I2 => data0(8),
      I3 => data0(11),
      I4 => scl_clk_i_3_n_0,
      I5 => stretch_i_6_n_0,
      O => scl_clk_i_2_n_0
    );
scl_clk_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => data0(6),
      I1 => data0(7),
      O => scl_clk_i_3_n_0
    );
scl_clk_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => scl_clk_i_1_n_0,
      Q => scl_clk,
      R => '0'
    );
scl_ena_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F02FF00FF00FF08"
    )
        port map (
      I0 => scl_ena_i_2_n_0,
      I1 => state(0),
      I2 => state(3),
      I3 => scl_ena_reg_n_0,
      I4 => state(2),
      I5 => state(1),
      O => scl_ena_i_1_n_0
    );
scl_ena_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00450000"
    )
        port map (
      I0 => state(4),
      I1 => state(2),
      I2 => scl_ena_reg_n_0,
      I3 => data_clk,
      I4 => data_clk_prev,
      O => scl_ena_i_2_n_0
    );
scl_ena_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => scl_ena_i_1_n_0,
      Q => scl_ena_reg_n_0
    );
sda_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sda_ena_n,
      I1 => sda_INST_0_i_2_n_0,
      O => sda
    );
sda_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAABFFFD0001"
    )
        port map (
      I0 => data_clk_prev,
      I1 => \samp[15]_i_2_n_0\,
      I2 => sda_INST_0_i_3_n_0,
      I3 => state(4),
      I4 => sda_int_reg_n_0,
      I5 => sda_INST_0_i_4_n_0,
      O => sda_ena_n
    );
sda_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11111115BBBBBBB0"
    )
        port map (
      I0 => sda_INST_0_i_4_n_0,
      I1 => sda_int_reg_n_0,
      I2 => state(4),
      I3 => sda_INST_0_i_3_n_0,
      I4 => \samp[15]_i_2_n_0\,
      I5 => data_clk_prev,
      O => sda_INST_0_i_2_n_0
    );
sda_INST_0_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      O => sda_INST_0_i_3_n_0
    );
sda_INST_0_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => state(0),
      I1 => state(4),
      I2 => state(3),
      I3 => state(2),
      I4 => state(1),
      O => sda_INST_0_i_4_n_0
    );
sda_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABFFAB00"
    )
        port map (
      I0 => sda_int_i_2_n_0,
      I1 => sda_int_i_3_n_0,
      I2 => state(4),
      I3 => sda_int6_out,
      I4 => sda_int_reg_n_0,
      O => sda_int_i_1_n_0
    );
sda_int_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5454501001010101"
    )
        port map (
      I0 => state(4),
      I1 => state(1),
      I2 => state(0),
      I3 => \data_rd[7]_i_2_n_0\,
      I4 => \addr_rw_reg_n_0_[0]\,
      I5 => state(2),
      O => sda_int_i_2_n_0
    );
sda_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55FF5533333303"
    )
        port map (
      I0 => ena,
      I1 => sda_int_i_5_n_0,
      I2 => sda_int_i_6_n_0,
      I3 => state(0),
      I4 => state(2),
      I5 => state(3),
      O => sda_int_i_3_n_0
    );
sda_int_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000F40000"
    )
        port map (
      I0 => state(3),
      I1 => state(1),
      I2 => sda_int_i_7_n_0,
      I3 => data_clk_prev,
      I4 => data_clk,
      I5 => state(4),
      O => sda_int6_out
    );
sda_int_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAEAEAEAAAAAAAA"
    )
        port map (
      I0 => sda_int_i_8_n_0,
      I1 => state(0),
      I2 => \bit_cnt_reg_n_0_[2]\,
      I3 => \bit_cnt_reg_n_0_[1]\,
      I4 => \bit_cnt_reg_n_0_[0]\,
      I5 => sda_int_i_9_n_0,
      O => sda_int_i_5_n_0
    );
sda_int_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAB"
    )
        port map (
      I0 => \addr_rw_reg_n_0_[0]\,
      I1 => \bit_cnt_reg_n_0_[2]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \bit_cnt_reg_n_0_[0]\,
      O => sda_int_i_6_n_0
    );
sda_int_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C0CFCF00AFAAF0"
    )
        port map (
      I0 => ena,
      I1 => \data_rd[7]_i_2_n_0\,
      I2 => state(3),
      I3 => state(1),
      I4 => state(2),
      I5 => state(0),
      O => sda_int_i_7_n_0
    );
sda_int_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00A3"
    )
        port map (
      I0 => \addr_rw_reg_n_0_[0]\,
      I1 => \bit_cnt_reg_n_0_[2]\,
      I2 => state(0),
      I3 => state(1),
      O => sda_int_i_8_n_0
    );
sda_int_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      O => sda_int_i_9_n_0
    );
sda_int_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => sda_int_i_1_n_0,
      PRE => busy_i_2_n_0,
      Q => sda_int_reg_n_0
    );
stretch_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABBABBBAA88A888"
    )
        port map (
      I0 => p_2_in,
      I1 => stretch_i_2_n_0,
      I2 => stretch_i_3_n_0,
      I3 => count_0(11),
      I4 => stretch_i_4_n_0,
      I5 => stretch,
      O => stretch_i_1_n_0
    );
stretch_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00280000"
    )
        port map (
      I0 => data0(11),
      I1 => data0(9),
      I2 => data0(10),
      I3 => data0(12),
      I4 => \count[12]_i_2_n_0\,
      O => stretch_i_2_n_0
    );
stretch_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04040004"
    )
        port map (
      I0 => data0(8),
      I1 => data0(10),
      I2 => data0(12),
      I3 => data0(7),
      I4 => stretch_i_5_n_0,
      O => stretch_i_3_n_0
    );
stretch_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => data0(10),
      I1 => data0(12),
      I2 => data0(8),
      I3 => data0(7),
      I4 => data0(6),
      I5 => stretch_i_6_n_0,
      O => stretch_i_4_n_0
    );
stretch_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000111FFFF"
    )
        port map (
      I0 => data0(4),
      I1 => data0(3),
      I2 => data0(2),
      I3 => data0(1),
      I4 => data0(5),
      I5 => data0(6),
      O => stretch_i_5_n_0
    );
stretch_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(2),
      I1 => data0(3),
      I2 => data0(4),
      I3 => data0(5),
      O => stretch_i_6_n_0
    );
stretch_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => stretch_i_1_n_0,
      Q => stretch
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_i2c_master_0_0 is
  port (
    data_ready : out STD_LOGIC;
    samp : out STD_LOGIC_VECTOR ( 15 downto 0 );
    data_done : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    ena : in STD_LOGIC;
    busy : out STD_LOGIC;
    data_rd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ack_error : out STD_LOGIC;
    sda : inout STD_LOGIC;
    scl : inout STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_i2c_master_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_i2c_master_0_0 : entity is "design_1_i2c_master_0_0,i2c_master,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_i2c_master_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_i2c_master_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_i2c_master_0_0 : entity is "i2c_master,Vivado 2019.1";
end design_1_i2c_master_0_0;

architecture STRUCTURE of design_1_i2c_master_0_0 is
  signal p_2_in : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of reset_n : signal is "xilinx.com:signal:reset:1.0 reset_n RST";
  attribute x_interface_parameter of reset_n : signal is "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.design_1_i2c_master_0_0_i2c_master
     port map (
      ack_error => ack_error,
      busy => busy,
      clk => clk,
      data_done => data_done,
      data_rd(7 downto 0) => data_rd(7 downto 0),
      data_ready => data_ready,
      ena => ena,
      p_2_in => p_2_in,
      reset_n => reset_n,
      samp(15 downto 0) => samp(15 downto 0),
      scl => scl,
      sda => sda
    );
\U0/\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => scl,
      O => p_2_in
    );
end STRUCTURE;
