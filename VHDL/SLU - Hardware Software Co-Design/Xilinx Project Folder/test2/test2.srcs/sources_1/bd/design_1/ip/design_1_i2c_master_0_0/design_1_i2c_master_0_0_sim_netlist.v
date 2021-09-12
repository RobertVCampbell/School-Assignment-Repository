// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Dec  3 15:26:40 2020
// Host        : MDD-ECE-FTDG853 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/campbellrobert/Desktop/final/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_i2c_master_0_0/design_1_i2c_master_0_0_sim_netlist.v
// Design      : design_1_i2c_master_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_i2c_master_0_0,i2c_master,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "i2c_master,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module design_1_i2c_master_0_0
   (data_ready,
    samp,
    data_done,
    clk,
    reset_n,
    ena,
    busy,
    data_rd,
    ack_error,
    sda,
    scl,
    debug);
  output data_ready;
  output [15:0]samp;
  input data_done;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_n;
  input ena;
  output busy;
  output [7:0]data_rd;
  output ack_error;
  inout sda;
  inout scl;
  output [7:0]debug;

  wire \<const0> ;
  wire ack_error;
  wire busy;
  wire clk;
  wire [7:0]data_rd;
  wire data_ready;
  wire [1:0]\^debug ;
  wire reset_n;
  wire [15:0]samp;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVCMOS33" *) 
  (* SLEW = "SLOW" *) wire scl;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVCMOS33" *) 
  (* SLEW = "SLOW" *) wire sda;

  assign debug[7] = \<const0> ;
  assign debug[6] = \<const0> ;
  assign debug[5] = \<const0> ;
  assign debug[4] = \<const0> ;
  assign debug[3] = \<const0> ;
  assign debug[2] = \<const0> ;
  assign debug[1:0] = \^debug [1:0];
  GND GND
       (.G(\<const0> ));
  design_1_i2c_master_0_0_i2c_master U0
       (.ack_error(ack_error),
        .busy(busy),
        .clk(clk),
        .data_rd(data_rd),
        .data_ready(data_ready),
        .debug(\^debug ),
        .reset_n(reset_n),
        .samp(samp),
        .scl(scl),
        .sda(sda));
endmodule

(* ORIG_REF_NAME = "i2c_master" *) 
module design_1_i2c_master_0_0_i2c_master
   (debug,
    samp,
    data_rd,
    data_ready,
    busy,
    ack_error,
    scl,
    sda,
    clk,
    reset_n);
  output [1:0]debug;
  output [15:0]samp;
  output [7:0]data_rd;
  output data_ready;
  output busy;
  output ack_error;
  inout scl;
  inout sda;
  input clk;
  input reset_n;

  wire \FSM_onehot_state[10]_i_1_n_0 ;
  wire \FSM_onehot_state[11]_i_1_n_0 ;
  wire \FSM_onehot_state[12]_i_1_n_0 ;
  wire \FSM_onehot_state[13]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[5]_i_1_n_0 ;
  wire \FSM_onehot_state[6]_i_1_n_0 ;
  wire \FSM_onehot_state[7]_i_1_n_0 ;
  wire \FSM_onehot_state[8]_i_1_n_0 ;
  wire \FSM_onehot_state[9]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[10] ;
  wire \FSM_onehot_state_reg_n_0_[11] ;
  wire \FSM_onehot_state_reg_n_0_[12] ;
  wire \FSM_onehot_state_reg_n_0_[13] ;
  wire \FSM_onehot_state_reg_n_0_[14] ;
  wire \FSM_onehot_state_reg_n_0_[15] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire \FSM_onehot_state_reg_n_0_[6] ;
  wire \FSM_onehot_state_reg_n_0_[7] ;
  wire \FSM_onehot_state_reg_n_0_[8] ;
  wire \FSM_onehot_state_reg_n_0_[9] ;
  wire T;
  wire ack_error;
  wire ack_error_i_1_n_0;
  wire ack_error_i_2_n_0;
  wire ack_error_i_3_n_0;
  wire \addr_rw[0]_i_1_n_0 ;
  wire \addr_rw[0]_i_2_n_0 ;
  wire \addr_rw_reg_n_0_[0] ;
  wire [2:0]bit_cnt;
  wire \bit_cnt[0]_i_1_n_0 ;
  wire \bit_cnt[1]_i_1_n_0 ;
  wire \bit_cnt[2]_i_1_n_0 ;
  wire \bit_cnt[2]_i_2_n_0 ;
  wire busy;
  wire busy6_out;
  wire busy_i_1_n_0;
  wire busy_i_2_n_0;
  wire busy_i_3_n_0;
  wire busy_i_4_n_0;
  wire busy_i_6_n_0;
  wire clk;
  wire [12:0]count;
  wire count0_carry__0_n_0;
  wire count0_carry__0_n_1;
  wire count0_carry__0_n_2;
  wire count0_carry__0_n_3;
  wire count0_carry__1_n_1;
  wire count0_carry__1_n_2;
  wire count0_carry__1_n_3;
  wire count0_carry_n_0;
  wire count0_carry_n_1;
  wire count0_carry_n_2;
  wire count0_carry_n_3;
  wire \count[0]_i_1_n_0 ;
  wire \count[12]_i_1_n_0 ;
  wire [10:10]count_0;
  wire [12:1]data0;
  wire data_clk;
  wire data_clk_i_10_n_0;
  wire data_clk_i_1_n_0;
  wire data_clk_i_2_n_0;
  wire data_clk_i_3_n_0;
  wire data_clk_i_4_n_0;
  wire data_clk_i_5_n_0;
  wire data_clk_i_6_n_0;
  wire data_clk_i_7_n_0;
  wire data_clk_i_8_n_0;
  wire data_clk_i_9_n_0;
  wire data_clk_prev;
  wire [7:0]data_rd;
  wire \data_rd[7]_i_1_n_0 ;
  wire data_ready;
  wire data_ready1;
  wire data_ready_i_1_n_0;
  wire \data_rx[0]_i_1_n_0 ;
  wire \data_rx[1]_i_1_n_0 ;
  wire \data_rx[2]_i_1_n_0 ;
  wire \data_rx[3]_i_1_n_0 ;
  wire \data_rx[3]_i_2_n_0 ;
  wire \data_rx[4]_i_1_n_0 ;
  wire \data_rx[5]_i_1_n_0 ;
  wire \data_rx[6]_i_1_n_0 ;
  wire \data_rx[7]_i_1_n_0 ;
  wire \data_rx[7]_i_2_n_0 ;
  wire data_tx;
  wire [1:0]debug;
  wire [7:0]in10;
  wire reset_n;
  wire [15:0]samp;
  wire samp0;
  wire \sample[15]_i_1_n_0 ;
  wire \sample[7]_i_1_n_0 ;
  wire \sample_reg_n_0_[0] ;
  wire \sample_reg_n_0_[10] ;
  wire \sample_reg_n_0_[11] ;
  wire \sample_reg_n_0_[12] ;
  wire \sample_reg_n_0_[13] ;
  wire \sample_reg_n_0_[14] ;
  wire \sample_reg_n_0_[15] ;
  wire \sample_reg_n_0_[1] ;
  wire \sample_reg_n_0_[2] ;
  wire \sample_reg_n_0_[3] ;
  wire \sample_reg_n_0_[4] ;
  wire \sample_reg_n_0_[5] ;
  wire \sample_reg_n_0_[6] ;
  wire \sample_reg_n_0_[7] ;
  wire \sample_reg_n_0_[8] ;
  wire \sample_reg_n_0_[9] ;
  wire scl;
  wire scl_clk_i_1_n_0;
  wire scl_clk_i_2_n_0;
  wire scl_clk_i_3_n_0;
  wire scl_clk_i_4_n_0;
  wire scl_clk_i_5_n_0;
  wire scl_clk_i_6_n_0;
  wire scl_clk_i_7_n_0;
  wire scl_ena_i_1_n_0;
  wire sda;
  wire sda_ena_n;
  wire sda_in;
  wire sda_int8_out;
  wire sda_int_i_1_n_0;
  wire sda_int_i_2_n_0;
  wire sda_int_i_3_n_0;
  wire sda_int_i_5_n_0;
  wire sda_int_i_6_n_0;
  wire sda_int_i_7_n_0;
  wire sda_int_i_8_n_0;
  wire sda_int_reg_n_0;
  wire NLW_IOBUF_scl_O_UNCONNECTED;
  wire [3:3]NLW_count0_carry__1_CO_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFE00)) 
    \FSM_onehot_state[10]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .I3(\FSM_onehot_state_reg_n_0_[10] ),
        .I4(\FSM_onehot_state_reg_n_0_[9] ),
        .O(\FSM_onehot_state[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[11]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[10] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .O(\FSM_onehot_state[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFE00)) 
    \FSM_onehot_state[12]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .I3(\FSM_onehot_state_reg_n_0_[12] ),
        .I4(\FSM_onehot_state_reg_n_0_[11] ),
        .O(\FSM_onehot_state[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[13]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[12] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .O(\FSM_onehot_state[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_state[15]_i_1 
       (.I0(data_clk),
        .I1(data_clk_prev),
        .O(data_ready1));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFFFE00)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFFFE00)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .O(\FSM_onehot_state[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFFFFFE00)) 
    \FSM_onehot_state[6]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .I3(\FSM_onehot_state_reg_n_0_[6] ),
        .I4(\FSM_onehot_state_reg_n_0_[5] ),
        .O(\FSM_onehot_state[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .O(\FSM_onehot_state[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFE00)) 
    \FSM_onehot_state[8]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .I3(\FSM_onehot_state_reg_n_0_[8] ),
        .I4(\FSM_onehot_state_reg_n_0_[7] ),
        .O(\FSM_onehot_state[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[9]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[8] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .O(\FSM_onehot_state[9]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(data_ready1),
        .D(\FSM_onehot_state_reg_n_0_[15] ),
        .PRE(busy_i_2_n_0),
        .Q(data_tx));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[10] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[10]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[10] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[11] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[11]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[11] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[12] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[12]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[12] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[13] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[13]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[13] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[14] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state_reg_n_0_[13] ),
        .Q(\FSM_onehot_state_reg_n_0_[14] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[15] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state_reg_n_0_[14] ),
        .Q(\FSM_onehot_state_reg_n_0_[15] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(data_tx),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[5] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[6]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[6] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[7]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[7] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[8] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[8]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[8] ));
  (* FSM_ENCODED_STATES = "mstr_ack3:0010000000000000,rd3:0001000000000000,mstr_ack2:0000100000000000,slv_ack1:0000000000001000,command1:0000000000000100,hold:1000000000000000,start1:0000000000000010,rd2:0000010000000000,ready:0000000000000001,mstr_ack1:0000001000000000,command2:0000000001000000,start2:0000000000100000,rd1:0000000100000000,slv_ack3:0000000010000000,slv_ack2:00101,wr:0000000000010000,stop:0100000000000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[9] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_onehot_state[9]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[9] ));
  (* box_type = "PRIMITIVE" *) 
  IOBUF IOBUF_scl
       (.I(debug[1]),
        .IO(scl),
        .O(NLW_IOBUF_scl_O_UNCONNECTED),
        .T(T));
  LUT2 #(
    .INIT(4'hB)) 
    IOBUF_scl_i_1
       (.I0(debug[1]),
        .I1(debug[0]),
        .O(T));
  (* box_type = "PRIMITIVE" *) 
  IOBUF IOBUF_sda
       (.I(1'b0),
        .IO(sda),
        .O(sda_in),
        .T(sda_ena_n));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hDDB8)) 
    IOBUF_sda_i_1
       (.I0(data_clk_prev),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(sda_int_reg_n_0),
        .I3(\FSM_onehot_state_reg_n_0_[14] ),
        .O(sda_ena_n));
  LUT6 #(
    .INIT(64'hFFDFDFDFAA000000)) 
    ack_error_i_1
       (.I0(ack_error_i_2_n_0),
        .I1(debug[0]),
        .I2(busy_i_3_n_0),
        .I3(ack_error_i_3_n_0),
        .I4(sda_in),
        .I5(ack_error),
        .O(ack_error_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h4)) 
    ack_error_i_2
       (.I0(data_clk),
        .I1(data_clk_prev),
        .O(ack_error_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    ack_error_i_3
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[7] ),
        .O(ack_error_i_3_n_0));
  FDCE ack_error_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(ack_error_i_1_n_0),
        .Q(ack_error));
  LUT6 #(
    .INIT(64'hCFFFFFFFC8000000)) 
    \addr_rw[0]_i_1 
       (.I0(\addr_rw[0]_i_2_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(data_tx),
        .I3(reset_n),
        .I4(data_ready1),
        .I5(\addr_rw_reg_n_0_[0] ),
        .O(\addr_rw[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \addr_rw[0]_i_2 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .O(\addr_rw[0]_i_2_n_0 ));
  FDRE \addr_rw_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\addr_rw[0]_i_1_n_0 ),
        .Q(\addr_rw_reg_n_0_[0] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bit_cnt[0]_i_1 
       (.I0(\bit_cnt[2]_i_2_n_0 ),
        .I1(bit_cnt[0]),
        .O(\bit_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \bit_cnt[1]_i_1 
       (.I0(bit_cnt[0]),
        .I1(\bit_cnt[2]_i_2_n_0 ),
        .I2(bit_cnt[1]),
        .O(\bit_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hEF10)) 
    \bit_cnt[2]_i_1 
       (.I0(bit_cnt[1]),
        .I1(bit_cnt[0]),
        .I2(\bit_cnt[2]_i_2_n_0 ),
        .I3(bit_cnt[2]),
        .O(\bit_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FF000000FE00)) 
    \bit_cnt[2]_i_2 
       (.I0(busy_i_4_n_0),
        .I1(\FSM_onehot_state_reg_n_0_[6] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(data_clk),
        .I4(data_clk_prev),
        .I5(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\bit_cnt[2]_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[0]_i_1_n_0 ),
        .PRE(busy_i_2_n_0),
        .Q(bit_cnt[0]));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[1]_i_1_n_0 ),
        .PRE(busy_i_2_n_0),
        .Q(bit_cnt[1]));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[2]_i_1_n_0 ),
        .PRE(busy_i_2_n_0),
        .Q(bit_cnt[2]));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFE0000)) 
    busy_i_1
       (.I0(busy_i_3_n_0),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(data_tx),
        .I3(busy_i_4_n_0),
        .I4(busy6_out),
        .I5(busy),
        .O(busy_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    busy_i_2
       (.I0(reset_n),
        .O(busy_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    busy_i_3
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_state_reg_n_0_[5] ),
        .O(busy_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    busy_i_4
       (.I0(\FSM_onehot_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_state_reg_n_0_[8] ),
        .I2(\FSM_onehot_state_reg_n_0_[12] ),
        .O(busy_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    busy_i_5
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(busy_i_3_n_0),
        .I2(data_tx),
        .I3(\FSM_onehot_state_reg_n_0_[14] ),
        .I4(data_ready1),
        .I5(busy_i_6_n_0),
        .O(busy6_out));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    busy_i_6
       (.I0(\FSM_onehot_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_state_reg_n_0_[8] ),
        .I2(\FSM_onehot_state_reg_n_0_[12] ),
        .I3(\FSM_onehot_state_reg_n_0_[11] ),
        .I4(\FSM_onehot_state_reg_n_0_[9] ),
        .O(busy_i_6_n_0));
  FDPE busy_reg
       (.C(clk),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .PRE(busy_i_2_n_0),
        .Q(busy));
  CARRY4 count0_carry
       (.CI(1'b0),
        .CO({count0_carry_n_0,count0_carry_n_1,count0_carry_n_2,count0_carry_n_3}),
        .CYINIT(count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(count[4:1]));
  CARRY4 count0_carry__0
       (.CI(count0_carry_n_0),
        .CO({count0_carry__0_n_0,count0_carry__0_n_1,count0_carry__0_n_2,count0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(count[8:5]));
  CARRY4 count0_carry__1
       (.CI(count0_carry__0_n_0),
        .CO({NLW_count0_carry__1_CO_UNCONNECTED[3],count0_carry__1_n_1,count0_carry__1_n_2,count0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(count[12:9]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .O(\count[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[10]_i_1 
       (.I0(scl_clk_i_3_n_0),
        .I1(data0[10]),
        .O(count_0));
  LUT1 #(
    .INIT(2'h1)) 
    \count[12]_i_1 
       (.I0(scl_clk_i_3_n_0),
        .O(\count[12]_i_1_n_0 ));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]),
        .R(1'b0));
  FDRE \count_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(count_0),
        .Q(count[10]),
        .R(1'b0));
  FDRE \count_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[11]),
        .Q(count[11]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[12]),
        .Q(count[12]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[1]),
        .Q(count[1]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[2]),
        .Q(count[2]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[3]),
        .Q(count[3]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[4]),
        .Q(count[4]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[5]),
        .Q(count[5]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[6]),
        .Q(count[6]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[7]),
        .Q(count[7]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[8]),
        .Q(count[8]),
        .R(\count[12]_i_1_n_0 ));
  FDRE \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[9]),
        .Q(count[9]),
        .R(\count[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFEFEFEFEFEFE)) 
    data_clk_i_1
       (.I0(data_clk_i_2_n_0),
        .I1(data_clk_i_3_n_0),
        .I2(data_clk_i_4_n_0),
        .I3(data0[12]),
        .I4(data_clk_i_5_n_0),
        .I5(count_0),
        .O(data_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFFFF)) 
    data_clk_i_10
       (.I0(scl_clk_i_7_n_0),
        .I1(count[6]),
        .I2(count[5]),
        .I3(count[8]),
        .I4(count[7]),
        .I5(scl_clk_i_5_n_0),
        .O(data_clk_i_10_n_0));
  LUT6 #(
    .INIT(64'h00F0004F00000000)) 
    data_clk_i_2
       (.I0(data0[8]),
        .I1(data_clk_i_6_n_0),
        .I2(data0[11]),
        .I3(data0[12]),
        .I4(data_clk_i_7_n_0),
        .I5(scl_clk_i_3_n_0),
        .O(data_clk_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    data_clk_i_3
       (.I0(data0[12]),
        .I1(data0[9]),
        .I2(data0[10]),
        .I3(data_clk_i_8_n_0),
        .O(data_clk_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000F80088)) 
    data_clk_i_4
       (.I0(data_clk_i_9_n_0),
        .I1(data0[6]),
        .I2(count_0),
        .I3(data0[12]),
        .I4(data0[8]),
        .I5(data0[9]),
        .O(data_clk_i_4_n_0));
  LUT6 #(
    .INIT(64'h2000200020000000)) 
    data_clk_i_5
       (.I0(data0[7]),
        .I1(data0[9]),
        .I2(data0[5]),
        .I3(data0[6]),
        .I4(data0[4]),
        .I5(data0[3]),
        .O(data_clk_i_5_n_0));
  LUT6 #(
    .INIT(64'h01555555FFFFFFFF)) 
    data_clk_i_6
       (.I0(data0[6]),
        .I1(data0[3]),
        .I2(data0[2]),
        .I3(data0[5]),
        .I4(data0[4]),
        .I5(data0[7]),
        .O(data_clk_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h7)) 
    data_clk_i_7
       (.I0(data0[9]),
        .I1(data0[10]),
        .O(data_clk_i_7_n_0));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    data_clk_i_8
       (.I0(count[0]),
        .I1(data0[8]),
        .I2(data0[6]),
        .I3(data0[3]),
        .I4(data0[1]),
        .I5(data_clk_i_10_n_0),
        .O(data_clk_i_8_n_0));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    data_clk_i_9
       (.I0(data0[5]),
        .I1(data0[7]),
        .I2(data0[1]),
        .I3(data0[2]),
        .I4(count[0]),
        .I5(data0[10]),
        .O(data_clk_i_9_n_0));
  FDRE data_clk_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_clk),
        .Q(data_clk_prev),
        .R(1'b0));
  FDRE data_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_clk_i_1_n_0),
        .Q(data_clk),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \data_rd[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[12] ),
        .I1(data_clk),
        .I2(data_clk_prev),
        .I3(bit_cnt[2]),
        .I4(bit_cnt[1]),
        .I5(bit_cnt[0]),
        .O(\data_rd[7]_i_1_n_0 ));
  FDCE \data_rd_reg[0] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[0]),
        .Q(data_rd[0]));
  FDCE \data_rd_reg[1] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[1]),
        .Q(data_rd[1]));
  FDCE \data_rd_reg[2] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[2]),
        .Q(data_rd[2]));
  FDCE \data_rd_reg[3] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[3]),
        .Q(data_rd[3]));
  FDCE \data_rd_reg[4] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[4]),
        .Q(data_rd[4]));
  FDCE \data_rd_reg[5] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[5]),
        .Q(data_rd[5]));
  FDCE \data_rd_reg[6] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[6]),
        .Q(data_rd[6]));
  FDCE \data_rd_reg[7] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in10[7]),
        .Q(data_rd[7]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00C00000)) 
    data_ready_i_1
       (.I0(data_tx),
        .I1(\FSM_onehot_state_reg_n_0_[14] ),
        .I2(data_clk),
        .I3(data_clk_prev),
        .I4(reset_n),
        .I5(data_ready),
        .O(data_ready_i_1_n_0));
  FDRE data_ready_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_ready_i_1_n_0),
        .Q(data_ready),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    \data_rx[0]_i_1 
       (.I0(sda_in),
        .I1(\data_rx[3]_i_2_n_0 ),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[1]),
        .I4(in10[0]),
        .O(\data_rx[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \data_rx[1]_i_1 
       (.I0(sda_in),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[0]),
        .I3(\data_rx[3]_i_2_n_0 ),
        .I4(in10[1]),
        .O(\data_rx[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \data_rx[2]_i_1 
       (.I0(sda_in),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[1]),
        .I3(\data_rx[3]_i_2_n_0 ),
        .I4(in10[2]),
        .O(\data_rx[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \data_rx[3]_i_1 
       (.I0(sda_in),
        .I1(\data_rx[3]_i_2_n_0 ),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[1]),
        .I4(in10[3]),
        .O(\data_rx[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \data_rx[3]_i_2 
       (.I0(data_clk),
        .I1(data_clk_prev),
        .I2(busy_i_4_n_0),
        .I3(reset_n),
        .I4(bit_cnt[2]),
        .O(\data_rx[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    \data_rx[4]_i_1 
       (.I0(sda_in),
        .I1(\data_rx[7]_i_2_n_0 ),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[1]),
        .I4(in10[4]),
        .O(\data_rx[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \data_rx[5]_i_1 
       (.I0(sda_in),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[0]),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in10[5]),
        .O(\data_rx[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \data_rx[6]_i_1 
       (.I0(sda_in),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[1]),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in10[6]),
        .O(\data_rx[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \data_rx[7]_i_1 
       (.I0(sda_in),
        .I1(\data_rx[7]_i_2_n_0 ),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[1]),
        .I4(in10[7]),
        .O(\data_rx[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \data_rx[7]_i_2 
       (.I0(data_clk),
        .I1(data_clk_prev),
        .I2(busy_i_4_n_0),
        .I3(reset_n),
        .I4(bit_cnt[2]),
        .O(\data_rx[7]_i_2_n_0 ));
  FDRE \data_rx_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[0]_i_1_n_0 ),
        .Q(in10[0]),
        .R(1'b0));
  FDRE \data_rx_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[1]_i_1_n_0 ),
        .Q(in10[1]),
        .R(1'b0));
  FDRE \data_rx_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[2]_i_1_n_0 ),
        .Q(in10[2]),
        .R(1'b0));
  FDRE \data_rx_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[3]_i_1_n_0 ),
        .Q(in10[3]),
        .R(1'b0));
  FDRE \data_rx_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[4]_i_1_n_0 ),
        .Q(in10[4]),
        .R(1'b0));
  FDRE \data_rx_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[5]_i_1_n_0 ),
        .Q(in10[5]),
        .R(1'b0));
  FDRE \data_rx_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[6]_i_1_n_0 ),
        .Q(in10[6]),
        .R(1'b0));
  FDRE \data_rx_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[7]_i_1_n_0 ),
        .Q(in10[7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h2000)) 
    \samp[15]_i_1 
       (.I0(data_clk),
        .I1(data_clk_prev),
        .I2(reset_n),
        .I3(\FSM_onehot_state_reg_n_0_[14] ),
        .O(samp0));
  FDRE \samp_reg[0] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[0] ),
        .Q(samp[0]),
        .R(1'b0));
  FDRE \samp_reg[10] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[10] ),
        .Q(samp[10]),
        .R(1'b0));
  FDRE \samp_reg[11] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[11] ),
        .Q(samp[11]),
        .R(1'b0));
  FDRE \samp_reg[12] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[12] ),
        .Q(samp[12]),
        .R(1'b0));
  FDRE \samp_reg[13] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[13] ),
        .Q(samp[13]),
        .R(1'b0));
  FDRE \samp_reg[14] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[14] ),
        .Q(samp[14]),
        .R(1'b0));
  FDRE \samp_reg[15] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[15] ),
        .Q(samp[15]),
        .R(1'b0));
  FDRE \samp_reg[1] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[1] ),
        .Q(samp[1]),
        .R(1'b0));
  FDRE \samp_reg[2] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[2] ),
        .Q(samp[2]),
        .R(1'b0));
  FDRE \samp_reg[3] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[3] ),
        .Q(samp[3]),
        .R(1'b0));
  FDRE \samp_reg[4] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[4] ),
        .Q(samp[4]),
        .R(1'b0));
  FDRE \samp_reg[5] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[5] ),
        .Q(samp[5]),
        .R(1'b0));
  FDRE \samp_reg[6] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[6] ),
        .Q(samp[6]),
        .R(1'b0));
  FDRE \samp_reg[7] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[7] ),
        .Q(samp[7]),
        .R(1'b0));
  FDRE \samp_reg[8] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[8] ),
        .Q(samp[8]),
        .R(1'b0));
  FDRE \samp_reg[9] 
       (.C(clk),
        .CE(samp0),
        .D(\sample_reg_n_0_[9] ),
        .Q(samp[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \sample[15]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[10] ),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[2]),
        .I4(data_ready1),
        .I5(reset_n),
        .O(\sample[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \sample[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[8] ),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[2]),
        .I4(data_ready1),
        .I5(reset_n),
        .O(\sample[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[0] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[0]),
        .Q(\sample_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[10] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[2]),
        .Q(\sample_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[11] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[3]),
        .Q(\sample_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[12] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[4]),
        .Q(\sample_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[13] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[5]),
        .Q(\sample_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[14] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[6]),
        .Q(\sample_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[15] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[7]),
        .Q(\sample_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[1] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[1]),
        .Q(\sample_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[2] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[2]),
        .Q(\sample_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[3] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[3]),
        .Q(\sample_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[4] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[4]),
        .Q(\sample_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[5] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[5]),
        .Q(\sample_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[6] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[6]),
        .Q(\sample_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[7] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in10[7]),
        .Q(\sample_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[8] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[0]),
        .Q(\sample_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[9] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in10[1]),
        .Q(\sample_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF00FE00FA00FA00)) 
    scl_clk_i_1
       (.I0(data0[12]),
        .I1(data0[10]),
        .I2(scl_clk_i_2_n_0),
        .I3(scl_clk_i_3_n_0),
        .I4(data0[9]),
        .I5(data0[11]),
        .O(scl_clk_i_1_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    scl_clk_i_2
       (.I0(data0[8]),
        .I1(data0[11]),
        .I2(data0[6]),
        .I3(data0[7]),
        .I4(scl_clk_i_4_n_0),
        .O(scl_clk_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    scl_clk_i_3
       (.I0(scl_clk_i_5_n_0),
        .I1(scl_clk_i_6_n_0),
        .I2(scl_clk_i_7_n_0),
        .I3(count[0]),
        .O(scl_clk_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFF80)) 
    scl_clk_i_4
       (.I0(data0[1]),
        .I1(data0[2]),
        .I2(data0[3]),
        .I3(data0[5]),
        .I4(data0[4]),
        .O(scl_clk_i_4_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    scl_clk_i_5
       (.I0(count[1]),
        .I1(count[2]),
        .I2(count[4]),
        .I3(count[3]),
        .O(scl_clk_i_5_n_0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    scl_clk_i_6
       (.I0(count[6]),
        .I1(count[5]),
        .I2(count[8]),
        .I3(count[7]),
        .O(scl_clk_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    scl_clk_i_7
       (.I0(count[9]),
        .I1(count[10]),
        .I2(count[12]),
        .I3(count[11]),
        .O(scl_clk_i_7_n_0));
  FDRE scl_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(scl_clk_i_1_n_0),
        .Q(debug[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hCCCCCCCCFFF4CCCC)) 
    scl_ena_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[14] ),
        .I1(debug[0]),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(data_clk_prev),
        .I5(data_clk),
        .O(scl_ena_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    scl_ena_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(scl_ena_i_1_n_0),
        .Q(debug[0]));
  LUT6 #(
    .INIT(64'hFEF0FFFFFEF00000)) 
    sda_int_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_state_reg_n_0_[6] ),
        .I2(sda_int_i_2_n_0),
        .I3(sda_int_i_3_n_0),
        .I4(sda_int8_out),
        .I5(sda_int_reg_n_0),
        .O(sda_int_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0020)) 
    sda_int_i_2
       (.I0(busy_i_3_n_0),
        .I1(sda_int_i_5_n_0),
        .I2(\addr_rw_reg_n_0_[0] ),
        .I3(bit_cnt[2]),
        .I4(sda_int_i_6_n_0),
        .I5(sda_int_i_7_n_0),
        .O(sda_int_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0203)) 
    sda_int_i_3
       (.I0(\addr_rw_reg_n_0_[0] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .O(sda_int_i_3_n_0));
  LUT6 #(
    .INIT(64'hEEEEEEEAAAAAAAAA)) 
    sda_int_i_4
       (.I0(sda_int_i_8_n_0),
        .I1(busy_i_6_n_0),
        .I2(\addr_rw[0]_i_2_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[11] ),
        .I4(\FSM_onehot_state_reg_n_0_[9] ),
        .I5(data_ready1),
        .O(sda_int8_out));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sda_int_i_5
       (.I0(bit_cnt[1]),
        .I1(bit_cnt[0]),
        .O(sda_int_i_5_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    sda_int_i_6
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\FSM_onehot_state_reg_n_0_[11] ),
        .I2(\FSM_onehot_state_reg_n_0_[12] ),
        .O(sda_int_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF23332222)) 
    sda_int_i_7
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .I5(\FSM_onehot_state_reg_n_0_[7] ),
        .O(sda_int_i_7_n_0));
  LUT6 #(
    .INIT(64'hFF00FF00FF00FE00)) 
    sda_int_i_8
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(ack_error_i_3_n_0),
        .I3(data_ready1),
        .I4(busy_i_3_n_0),
        .I5(\FSM_onehot_state_reg_n_0_[4] ),
        .O(sda_int_i_8_n_0));
  FDPE #(
    .INIT(1'b1)) 
    sda_int_reg
       (.C(clk),
        .CE(1'b1),
        .D(sda_int_i_1_n_0),
        .PRE(busy_i_2_n_0),
        .Q(sda_int_reg_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
