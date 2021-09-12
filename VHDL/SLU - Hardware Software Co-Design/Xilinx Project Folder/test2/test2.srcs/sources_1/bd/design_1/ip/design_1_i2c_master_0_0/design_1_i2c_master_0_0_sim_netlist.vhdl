-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Thu Dec  3 15:26:40 2020
-- Host        : MDD-ECE-FTDG853 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/campbellrobert/Desktop/final/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_i2c_master_0_0/design_1_i2c_master_0_0_sim_netlist.vhdl
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
    debug : out STD_LOGIC_VECTOR ( 1 downto 0 );
    samp : out STD_LOGIC_VECTOR ( 15 downto 0 );
    data_rd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    data_ready : out STD_LOGIC;
    busy : out STD_LOGIC;
    ack_error : out STD_LOGIC;
    scl : inout STD_LOGIC;
    sda : inout STD_LOGIC;
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_i2c_master_0_0_i2c_master : entity is "i2c_master";
end design_1_i2c_master_0_0_i2c_master;

architecture STRUCTURE of design_1_i2c_master_0_0_i2c_master is
  signal \FSM_onehot_state[10]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[11]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[12]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[13]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[8]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[9]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[10]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[11]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[12]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[13]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[14]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[15]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[7]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[8]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[9]\ : STD_LOGIC;
  signal T : STD_LOGIC;
  signal \^ack_error\ : STD_LOGIC;
  signal ack_error_i_1_n_0 : STD_LOGIC;
  signal ack_error_i_2_n_0 : STD_LOGIC;
  signal ack_error_i_3_n_0 : STD_LOGIC;
  signal \addr_rw[0]_i_1_n_0\ : STD_LOGIC;
  signal \addr_rw[0]_i_2_n_0\ : STD_LOGIC;
  signal \addr_rw_reg_n_0_[0]\ : STD_LOGIC;
  signal bit_cnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \bit_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \^busy\ : STD_LOGIC;
  signal busy6_out : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_i_2_n_0 : STD_LOGIC;
  signal busy_i_3_n_0 : STD_LOGIC;
  signal busy_i_4_n_0 : STD_LOGIC;
  signal busy_i_6_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \count0_carry__0_n_0\ : STD_LOGIC;
  signal \count0_carry__0_n_1\ : STD_LOGIC;
  signal \count0_carry__0_n_2\ : STD_LOGIC;
  signal \count0_carry__0_n_3\ : STD_LOGIC;
  signal \count0_carry__1_n_1\ : STD_LOGIC;
  signal \count0_carry__1_n_2\ : STD_LOGIC;
  signal \count0_carry__1_n_3\ : STD_LOGIC;
  signal count0_carry_n_0 : STD_LOGIC;
  signal count0_carry_n_1 : STD_LOGIC;
  signal count0_carry_n_2 : STD_LOGIC;
  signal count0_carry_n_3 : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[12]_i_1_n_0\ : STD_LOGIC;
  signal count_0 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal data0 : STD_LOGIC_VECTOR ( 12 downto 1 );
  signal data_clk : STD_LOGIC;
  signal data_clk_i_10_n_0 : STD_LOGIC;
  signal data_clk_i_1_n_0 : STD_LOGIC;
  signal data_clk_i_2_n_0 : STD_LOGIC;
  signal data_clk_i_3_n_0 : STD_LOGIC;
  signal data_clk_i_4_n_0 : STD_LOGIC;
  signal data_clk_i_5_n_0 : STD_LOGIC;
  signal data_clk_i_6_n_0 : STD_LOGIC;
  signal data_clk_i_7_n_0 : STD_LOGIC;
  signal data_clk_i_8_n_0 : STD_LOGIC;
  signal data_clk_i_9_n_0 : STD_LOGIC;
  signal data_clk_prev : STD_LOGIC;
  signal \data_rd[7]_i_1_n_0\ : STD_LOGIC;
  signal \^data_ready\ : STD_LOGIC;
  signal data_ready1 : STD_LOGIC;
  signal data_ready_i_1_n_0 : STD_LOGIC;
  signal \data_rx[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[1]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[2]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[3]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[3]_i_2_n_0\ : STD_LOGIC;
  signal \data_rx[4]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[5]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[6]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[7]_i_1_n_0\ : STD_LOGIC;
  signal \data_rx[7]_i_2_n_0\ : STD_LOGIC;
  signal data_tx : STD_LOGIC;
  signal \^debug\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal in10 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal samp0 : STD_LOGIC;
  signal \sample[15]_i_1_n_0\ : STD_LOGIC;
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
  signal scl_clk_i_1_n_0 : STD_LOGIC;
  signal scl_clk_i_2_n_0 : STD_LOGIC;
  signal scl_clk_i_3_n_0 : STD_LOGIC;
  signal scl_clk_i_4_n_0 : STD_LOGIC;
  signal scl_clk_i_5_n_0 : STD_LOGIC;
  signal scl_clk_i_6_n_0 : STD_LOGIC;
  signal scl_clk_i_7_n_0 : STD_LOGIC;
  signal scl_ena_i_1_n_0 : STD_LOGIC;
  signal sda_ena_n : STD_LOGIC;
  signal sda_in : STD_LOGIC;
  signal sda_int8_out : STD_LOGIC;
  signal sda_int_i_1_n_0 : STD_LOGIC;
  signal sda_int_i_2_n_0 : STD_LOGIC;
  signal sda_int_i_3_n_0 : STD_LOGIC;
  signal sda_int_i_5_n_0 : STD_LOGIC;
  signal sda_int_i_6_n_0 : STD_LOGIC;
  signal sda_int_i_7_n_0 : STD_LOGIC;
  signal sda_int_i_8_n_0 : STD_LOGIC;
  signal sda_int_reg_n_0 : STD_LOGIC;
  signal NLW_IOBUF_scl_O_UNCONNECTED : STD_LOGIC;
  signal \NLW_count0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[10]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FSM_onehot_state[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FSM_onehot_state[12]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_onehot_state[13]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_state[5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_state[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FSM_onehot_state[7]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FSM_onehot_state[8]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_onehot_state[9]_i_1\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[10]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[11]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[12]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[13]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[14]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[15]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[6]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[7]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[8]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[9]\ : label is "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000";
  attribute box_type : string;
  attribute box_type of IOBUF_scl : label is "PRIMITIVE";
  attribute box_type of IOBUF_sda : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of IOBUF_sda_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of ack_error_i_2 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \bit_cnt[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bit_cnt[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bit_cnt[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of busy_i_4 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of busy_i_6 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of data_clk_i_3 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of data_clk_i_7 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data_rx[3]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \data_rx[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \data_rx[7]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of scl_clk_i_3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of sda_int_i_3 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of sda_int_i_5 : label is "soft_lutpair0";
begin
  ack_error <= \^ack_error\;
  busy <= \^busy\;
  data_ready <= \^data_ready\;
  debug(1 downto 0) <= \^debug\(1 downto 0);
\FSM_onehot_state[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFE00"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      I2 => bit_cnt(2),
      I3 => \FSM_onehot_state_reg_n_0_[10]\,
      I4 => \FSM_onehot_state_reg_n_0_[9]\,
      O => \FSM_onehot_state[10]_i_1_n_0\
    );
\FSM_onehot_state[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[10]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      O => \FSM_onehot_state[11]_i_1_n_0\
    );
\FSM_onehot_state[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFE00"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      I2 => bit_cnt(2),
      I3 => \FSM_onehot_state_reg_n_0_[12]\,
      I4 => \FSM_onehot_state_reg_n_0_[11]\,
      O => \FSM_onehot_state[12]_i_1_n_0\
    );
\FSM_onehot_state[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[12]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      O => \FSM_onehot_state[13]_i_1_n_0\
    );
\FSM_onehot_state[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_clk,
      I1 => data_clk_prev,
      O => data_ready1
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFE00"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      I2 => bit_cnt(2),
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[1]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFE00"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      I2 => bit_cnt(2),
      I3 => \FSM_onehot_state_reg_n_0_[4]\,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_onehot_state[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFE00"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      I2 => bit_cnt(2),
      I3 => \FSM_onehot_state_reg_n_0_[6]\,
      I4 => \FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[6]_i_1_n_0\
    );
\FSM_onehot_state[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[6]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      O => \FSM_onehot_state[7]_i_1_n_0\
    );
\FSM_onehot_state[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFE00"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      I2 => bit_cnt(2),
      I3 => \FSM_onehot_state_reg_n_0_[8]\,
      I4 => \FSM_onehot_state_reg_n_0_[7]\,
      O => \FSM_onehot_state[8]_i_1_n_0\
    );
\FSM_onehot_state[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[8]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      O => \FSM_onehot_state[9]_i_1_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => data_ready1,
      D => \FSM_onehot_state_reg_n_0_[15]\,
      PRE => busy_i_2_n_0,
      Q => data_tx
    );
\FSM_onehot_state_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[10]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[10]\
    );
\FSM_onehot_state_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[11]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[11]\
    );
\FSM_onehot_state_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[12]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[12]\
    );
\FSM_onehot_state_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[13]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[13]\
    );
\FSM_onehot_state_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state_reg_n_0_[13]\,
      Q => \FSM_onehot_state_reg_n_0_[14]\
    );
\FSM_onehot_state_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state_reg_n_0_[14]\,
      Q => \FSM_onehot_state_reg_n_0_[15]\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => data_tx,
      Q => \FSM_onehot_state_reg_n_0_[1]\
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[2]\
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[3]\
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[4]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[4]\
    );
\FSM_onehot_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[5]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[5]\
    );
\FSM_onehot_state_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[6]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[6]\
    );
\FSM_onehot_state_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[7]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[7]\
    );
\FSM_onehot_state_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[8]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[8]\
    );
\FSM_onehot_state_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => data_ready1,
      CLR => busy_i_2_n_0,
      D => \FSM_onehot_state[9]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[9]\
    );
IOBUF_scl: unisim.vcomponents.IOBUF
     port map (
      I => \^debug\(1),
      IO => scl,
      O => NLW_IOBUF_scl_O_UNCONNECTED,
      T => T
    );
IOBUF_scl_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^debug\(1),
      I1 => \^debug\(0),
      O => T
    );
IOBUF_sda: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => sda,
      O => sda_in,
      T => sda_ena_n
    );
IOBUF_sda_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DDB8"
    )
        port map (
      I0 => data_clk_prev,
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => sda_int_reg_n_0,
      I3 => \FSM_onehot_state_reg_n_0_[14]\,
      O => sda_ena_n
    );
ack_error_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFDFDFAA000000"
    )
        port map (
      I0 => ack_error_i_2_n_0,
      I1 => \^debug\(0),
      I2 => busy_i_3_n_0,
      I3 => ack_error_i_3_n_0,
      I4 => sda_in,
      I5 => \^ack_error\,
      O => ack_error_i_1_n_0
    );
ack_error_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => data_clk,
      I1 => data_clk_prev,
      O => ack_error_i_2_n_0
    );
ack_error_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_state_reg_n_0_[7]\,
      O => ack_error_i_3_n_0
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
      INIT => X"CFFFFFFFC8000000"
    )
        port map (
      I0 => \addr_rw[0]_i_2_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[4]\,
      I2 => data_tx,
      I3 => reset_n,
      I4 => data_ready1,
      I5 => \addr_rw_reg_n_0_[0]\,
      O => \addr_rw[0]_i_1_n_0\
    );
\addr_rw[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      I2 => bit_cnt(2),
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
      I1 => bit_cnt(0),
      O => \bit_cnt[0]_i_1_n_0\
    );
\bit_cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => \bit_cnt[2]_i_2_n_0\,
      I2 => bit_cnt(1),
      O => \bit_cnt[1]_i_1_n_0\
    );
\bit_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF10"
    )
        port map (
      I0 => bit_cnt(1),
      I1 => bit_cnt(0),
      I2 => \bit_cnt[2]_i_2_n_0\,
      I3 => bit_cnt(2),
      O => \bit_cnt[2]_i_1_n_0\
    );
\bit_cnt[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FF000000FE00"
    )
        port map (
      I0 => busy_i_4_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[6]\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      I3 => data_clk,
      I4 => data_clk_prev,
      I5 => \FSM_onehot_state_reg_n_0_[4]\,
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
      Q => bit_cnt(0)
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
      Q => bit_cnt(1)
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
      Q => bit_cnt(2)
    );
busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFE0000"
    )
        port map (
      I0 => busy_i_3_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[4]\,
      I2 => data_tx,
      I3 => busy_i_4_n_0,
      I4 => busy6_out,
      I5 => \^busy\,
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
busy_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      O => busy_i_3_n_0
    );
busy_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[10]\,
      I1 => \FSM_onehot_state_reg_n_0_[8]\,
      I2 => \FSM_onehot_state_reg_n_0_[12]\,
      O => busy_i_4_n_0
    );
busy_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => busy_i_3_n_0,
      I2 => data_tx,
      I3 => \FSM_onehot_state_reg_n_0_[14]\,
      I4 => data_ready1,
      I5 => busy_i_6_n_0,
      O => busy6_out
    );
busy_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[10]\,
      I1 => \FSM_onehot_state_reg_n_0_[8]\,
      I2 => \FSM_onehot_state_reg_n_0_[12]\,
      I3 => \FSM_onehot_state_reg_n_0_[11]\,
      I4 => \FSM_onehot_state_reg_n_0_[9]\,
      O => busy_i_6_n_0
    );
busy_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => busy_i_1_n_0,
      PRE => busy_i_2_n_0,
      Q => \^busy\
    );
count0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => count0_carry_n_0,
      CO(2) => count0_carry_n_1,
      CO(1) => count0_carry_n_2,
      CO(0) => count0_carry_n_3,
      CYINIT => count(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => count(4 downto 1)
    );
\count0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => count0_carry_n_0,
      CO(3) => \count0_carry__0_n_0\,
      CO(2) => \count0_carry__0_n_1\,
      CO(1) => \count0_carry__0_n_2\,
      CO(0) => \count0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => count(8 downto 5)
    );
\count0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count0_carry__0_n_0\,
      CO(3) => \NLW_count0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \count0_carry__1_n_1\,
      CO(1) => \count0_carry__1_n_2\,
      CO(0) => \count0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => count(12 downto 9)
    );
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count(0),
      O => \count[0]_i_1_n_0\
    );
\count[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => scl_clk_i_3_n_0,
      I1 => data0(10),
      O => count_0(10)
    );
\count[12]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => scl_clk_i_3_n_0,
      O => \count[12]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => count(0),
      R => '0'
    );
\count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => count_0(10),
      Q => count(10),
      R => '0'
    );
\count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(11),
      Q => count(11),
      R => \count[12]_i_1_n_0\
    );
\count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(12),
      Q => count(12),
      R => \count[12]_i_1_n_0\
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(1),
      Q => count(1),
      R => \count[12]_i_1_n_0\
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(2),
      Q => count(2),
      R => \count[12]_i_1_n_0\
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(3),
      Q => count(3),
      R => \count[12]_i_1_n_0\
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(4),
      Q => count(4),
      R => \count[12]_i_1_n_0\
    );
\count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(5),
      Q => count(5),
      R => \count[12]_i_1_n_0\
    );
\count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(6),
      Q => count(6),
      R => \count[12]_i_1_n_0\
    );
\count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(7),
      Q => count(7),
      R => \count[12]_i_1_n_0\
    );
\count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(8),
      Q => count(8),
      R => \count[12]_i_1_n_0\
    );
\count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(9),
      Q => count(9),
      R => \count[12]_i_1_n_0\
    );
data_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFEFEFEFEFE"
    )
        port map (
      I0 => data_clk_i_2_n_0,
      I1 => data_clk_i_3_n_0,
      I2 => data_clk_i_4_n_0,
      I3 => data0(12),
      I4 => data_clk_i_5_n_0,
      I5 => count_0(10),
      O => data_clk_i_1_n_0
    );
data_clk_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFFFF"
    )
        port map (
      I0 => scl_clk_i_7_n_0,
      I1 => count(6),
      I2 => count(5),
      I3 => count(8),
      I4 => count(7),
      I5 => scl_clk_i_5_n_0,
      O => data_clk_i_10_n_0
    );
data_clk_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0004F00000000"
    )
        port map (
      I0 => data0(8),
      I1 => data_clk_i_6_n_0,
      I2 => data0(11),
      I3 => data0(12),
      I4 => data_clk_i_7_n_0,
      I5 => scl_clk_i_3_n_0,
      O => data_clk_i_2_n_0
    );
data_clk_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => data0(12),
      I1 => data0(9),
      I2 => data0(10),
      I3 => data_clk_i_8_n_0,
      O => data_clk_i_3_n_0
    );
data_clk_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000F80088"
    )
        port map (
      I0 => data_clk_i_9_n_0,
      I1 => data0(6),
      I2 => count_0(10),
      I3 => data0(12),
      I4 => data0(8),
      I5 => data0(9),
      O => data_clk_i_4_n_0
    );
data_clk_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => data0(7),
      I1 => data0(9),
      I2 => data0(5),
      I3 => data0(6),
      I4 => data0(4),
      I5 => data0(3),
      O => data_clk_i_5_n_0
    );
data_clk_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01555555FFFFFFFF"
    )
        port map (
      I0 => data0(6),
      I1 => data0(3),
      I2 => data0(2),
      I3 => data0(5),
      I4 => data0(4),
      I5 => data0(7),
      O => data_clk_i_6_n_0
    );
data_clk_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => data0(9),
      I1 => data0(10),
      O => data_clk_i_7_n_0
    );
data_clk_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => count(0),
      I1 => data0(8),
      I2 => data0(6),
      I3 => data0(3),
      I4 => data0(1),
      I5 => data_clk_i_10_n_0,
      O => data_clk_i_8_n_0
    );
data_clk_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => data0(5),
      I1 => data0(7),
      I2 => data0(1),
      I3 => data0(2),
      I4 => count(0),
      I5 => data0(10),
      O => data_clk_i_9_n_0
    );
data_clk_prev_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_clk,
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
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[12]\,
      I1 => data_clk,
      I2 => data_clk_prev,
      I3 => bit_cnt(2),
      I4 => bit_cnt(1),
      I5 => bit_cnt(0),
      O => \data_rd[7]_i_1_n_0\
    );
\data_rd_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(0),
      Q => data_rd(0)
    );
\data_rd_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(1),
      Q => data_rd(1)
    );
\data_rd_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(2),
      Q => data_rd(2)
    );
\data_rd_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(3),
      Q => data_rd(3)
    );
\data_rd_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(4),
      Q => data_rd(4)
    );
\data_rd_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(5),
      Q => data_rd(5)
    );
\data_rd_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(6),
      Q => data_rd(6)
    );
\data_rd_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \data_rd[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => in10(7),
      Q => data_rd(7)
    );
data_ready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00C00000"
    )
        port map (
      I0 => data_tx,
      I1 => \FSM_onehot_state_reg_n_0_[14]\,
      I2 => data_clk,
      I3 => data_clk_prev,
      I4 => reset_n,
      I5 => \^data_ready\,
      O => data_ready_i_1_n_0
    );
data_ready_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_ready_i_1_n_0,
      Q => \^data_ready\,
      R => '0'
    );
\data_rx[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => sda_in,
      I1 => \data_rx[3]_i_2_n_0\,
      I2 => bit_cnt(0),
      I3 => bit_cnt(1),
      I4 => in10(0),
      O => \data_rx[0]_i_1_n_0\
    );
\data_rx[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => sda_in,
      I1 => bit_cnt(1),
      I2 => bit_cnt(0),
      I3 => \data_rx[3]_i_2_n_0\,
      I4 => in10(1),
      O => \data_rx[1]_i_1_n_0\
    );
\data_rx[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => sda_in,
      I1 => bit_cnt(0),
      I2 => bit_cnt(1),
      I3 => \data_rx[3]_i_2_n_0\,
      I4 => in10(2),
      O => \data_rx[2]_i_1_n_0\
    );
\data_rx[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => sda_in,
      I1 => \data_rx[3]_i_2_n_0\,
      I2 => bit_cnt(0),
      I3 => bit_cnt(1),
      I4 => in10(3),
      O => \data_rx[3]_i_1_n_0\
    );
\data_rx[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => data_clk,
      I1 => data_clk_prev,
      I2 => busy_i_4_n_0,
      I3 => reset_n,
      I4 => bit_cnt(2),
      O => \data_rx[3]_i_2_n_0\
    );
\data_rx[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => sda_in,
      I1 => \data_rx[7]_i_2_n_0\,
      I2 => bit_cnt(0),
      I3 => bit_cnt(1),
      I4 => in10(4),
      O => \data_rx[4]_i_1_n_0\
    );
\data_rx[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => sda_in,
      I1 => bit_cnt(1),
      I2 => bit_cnt(0),
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in10(5),
      O => \data_rx[5]_i_1_n_0\
    );
\data_rx[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => sda_in,
      I1 => bit_cnt(0),
      I2 => bit_cnt(1),
      I3 => \data_rx[7]_i_2_n_0\,
      I4 => in10(6),
      O => \data_rx[6]_i_1_n_0\
    );
\data_rx[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => sda_in,
      I1 => \data_rx[7]_i_2_n_0\,
      I2 => bit_cnt(0),
      I3 => bit_cnt(1),
      I4 => in10(7),
      O => \data_rx[7]_i_1_n_0\
    );
\data_rx[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => data_clk,
      I1 => data_clk_prev,
      I2 => busy_i_4_n_0,
      I3 => reset_n,
      I4 => bit_cnt(2),
      O => \data_rx[7]_i_2_n_0\
    );
\data_rx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[0]_i_1_n_0\,
      Q => in10(0),
      R => '0'
    );
\data_rx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[1]_i_1_n_0\,
      Q => in10(1),
      R => '0'
    );
\data_rx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[2]_i_1_n_0\,
      Q => in10(2),
      R => '0'
    );
\data_rx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[3]_i_1_n_0\,
      Q => in10(3),
      R => '0'
    );
\data_rx_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[4]_i_1_n_0\,
      Q => in10(4),
      R => '0'
    );
\data_rx_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[5]_i_1_n_0\,
      Q => in10(5),
      R => '0'
    );
\data_rx_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[6]_i_1_n_0\,
      Q => in10(6),
      R => '0'
    );
\data_rx_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \data_rx[7]_i_1_n_0\,
      Q => in10(7),
      R => '0'
    );
\samp[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => data_clk,
      I1 => data_clk_prev,
      I2 => reset_n,
      I3 => \FSM_onehot_state_reg_n_0_[14]\,
      O => samp0
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
\sample[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[10]\,
      I1 => bit_cnt(0),
      I2 => bit_cnt(1),
      I3 => bit_cnt(2),
      I4 => data_ready1,
      I5 => reset_n,
      O => \sample[15]_i_1_n_0\
    );
\sample[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[8]\,
      I1 => bit_cnt(0),
      I2 => bit_cnt(1),
      I3 => bit_cnt(2),
      I4 => data_ready1,
      I5 => reset_n,
      O => \sample[7]_i_1_n_0\
    );
\sample_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sample[7]_i_1_n_0\,
      D => in10(0),
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
      D => in10(2),
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
      D => in10(3),
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
      D => in10(4),
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
      D => in10(5),
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
      D => in10(6),
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
      D => in10(7),
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
      D => in10(1),
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
      D => in10(2),
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
      D => in10(3),
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
      D => in10(4),
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
      D => in10(5),
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
      D => in10(6),
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
      D => in10(7),
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
      D => in10(0),
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
      D => in10(1),
      Q => \sample_reg_n_0_[9]\,
      R => '0'
    );
scl_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FE00FA00FA00"
    )
        port map (
      I0 => data0(12),
      I1 => data0(10),
      I2 => scl_clk_i_2_n_0,
      I3 => scl_clk_i_3_n_0,
      I4 => data0(9),
      I5 => data0(11),
      O => scl_clk_i_1_n_0
    );
scl_clk_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => data0(8),
      I1 => data0(11),
      I2 => data0(6),
      I3 => data0(7),
      I4 => scl_clk_i_4_n_0,
      O => scl_clk_i_2_n_0
    );
scl_clk_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => scl_clk_i_5_n_0,
      I1 => scl_clk_i_6_n_0,
      I2 => scl_clk_i_7_n_0,
      I3 => count(0),
      O => scl_clk_i_3_n_0
    );
scl_clk_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF80"
    )
        port map (
      I0 => data0(1),
      I1 => data0(2),
      I2 => data0(3),
      I3 => data0(5),
      I4 => data0(4),
      O => scl_clk_i_4_n_0
    );
scl_clk_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => count(1),
      I1 => count(2),
      I2 => count(4),
      I3 => count(3),
      O => scl_clk_i_5_n_0
    );
scl_clk_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => count(6),
      I1 => count(5),
      I2 => count(8),
      I3 => count(7),
      O => scl_clk_i_6_n_0
    );
scl_clk_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => count(9),
      I1 => count(10),
      I2 => count(12),
      I3 => count(11),
      O => scl_clk_i_7_n_0
    );
scl_clk_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => scl_clk_i_1_n_0,
      Q => \^debug\(1),
      R => '0'
    );
scl_ena_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCFFF4CCCC"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[14]\,
      I1 => \^debug\(0),
      I2 => \FSM_onehot_state_reg_n_0_[5]\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => data_clk_prev,
      I5 => data_clk,
      O => scl_ena_i_1_n_0
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
      Q => \^debug\(0)
    );
sda_int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEF0FFFFFEF00000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_state_reg_n_0_[6]\,
      I2 => sda_int_i_2_n_0,
      I3 => sda_int_i_3_n_0,
      I4 => sda_int8_out,
      I5 => sda_int_reg_n_0,
      O => sda_int_i_1_n_0
    );
sda_int_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0020"
    )
        port map (
      I0 => busy_i_3_n_0,
      I1 => sda_int_i_5_n_0,
      I2 => \addr_rw_reg_n_0_[0]\,
      I3 => bit_cnt(2),
      I4 => sda_int_i_6_n_0,
      I5 => sda_int_i_7_n_0,
      O => sda_int_i_2_n_0
    );
sda_int_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0203"
    )
        port map (
      I0 => \addr_rw_reg_n_0_[0]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      O => sda_int_i_3_n_0
    );
sda_int_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEAAAAAAAAA"
    )
        port map (
      I0 => sda_int_i_8_n_0,
      I1 => busy_i_6_n_0,
      I2 => \addr_rw[0]_i_2_n_0\,
      I3 => \FSM_onehot_state_reg_n_0_[11]\,
      I4 => \FSM_onehot_state_reg_n_0_[9]\,
      I5 => data_ready1,
      O => sda_int8_out
    );
sda_int_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => bit_cnt(1),
      I1 => bit_cnt(0),
      O => sda_int_i_5_n_0
    );
sda_int_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[9]\,
      I1 => \FSM_onehot_state_reg_n_0_[11]\,
      I2 => \FSM_onehot_state_reg_n_0_[12]\,
      O => sda_int_i_6_n_0
    );
sda_int_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF23332222"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      I5 => \FSM_onehot_state_reg_n_0_[7]\,
      O => sda_int_i_7_n_0
    );
sda_int_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF00FF00FE00"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[6]\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => ack_error_i_3_n_0,
      I3 => data_ready1,
      I4 => busy_i_3_n_0,
      I5 => \FSM_onehot_state_reg_n_0_[4]\,
      O => sda_int_i_8_n_0
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
    scl : inout STD_LOGIC;
    debug : out STD_LOGIC_VECTOR ( 7 downto 0 )
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
  signal \<const0>\ : STD_LOGIC;
  signal \^debug\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of reset_n : signal is "xilinx.com:signal:reset:1.0 reset_n RST";
  attribute x_interface_parameter of reset_n : signal is "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  debug(7) <= \<const0>\;
  debug(6) <= \<const0>\;
  debug(5) <= \<const0>\;
  debug(4) <= \<const0>\;
  debug(3) <= \<const0>\;
  debug(2) <= \<const0>\;
  debug(1 downto 0) <= \^debug\(1 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.design_1_i2c_master_0_0_i2c_master
     port map (
      ack_error => ack_error,
      busy => busy,
      clk => clk,
      data_rd(7 downto 0) => data_rd(7 downto 0),
      data_ready => data_ready,
      debug(1 downto 0) => \^debug\(1 downto 0),
      reset_n => reset_n,
      samp(15 downto 0) => samp(15 downto 0),
      scl => scl,
      sda => sda
    );
end STRUCTURE;
