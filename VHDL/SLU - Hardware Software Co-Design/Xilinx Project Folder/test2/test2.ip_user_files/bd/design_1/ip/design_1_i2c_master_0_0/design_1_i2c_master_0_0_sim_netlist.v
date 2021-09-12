// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Dec  2 15:34:36 2020
// Host        : Garin-Book running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/work/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_i2c_master_0_0/design_1_i2c_master_0_0_sim_netlist.v
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
    scl);
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

  wire ack_error;
  wire busy;
  wire clk;
  wire data_done;
  wire [7:0]data_rd;
  wire data_ready;
  wire ena;
  wire p_2_in;
  wire reset_n;
  wire [15:0]samp;
  wire scl;
  wire sda;

  design_1_i2c_master_0_0_i2c_master U0
       (.ack_error(ack_error),
        .busy(busy),
        .clk(clk),
        .data_done(data_done),
        .data_rd(data_rd),
        .data_ready(data_ready),
        .ena(ena),
        .p_2_in(p_2_in),
        .reset_n(reset_n),
        .samp(samp),
        .scl(scl),
        .sda(sda));
  LUT1 #(
    .INIT(2'h1)) 
    \U0/ 
       (.I0(scl),
        .O(p_2_in));
endmodule

(* ORIG_REF_NAME = "i2c_master" *) 
module design_1_i2c_master_0_0_i2c_master
   (data_ready,
    busy,
    ack_error,
    scl,
    samp,
    data_rd,
    sda,
    clk,
    p_2_in,
    reset_n,
    ena,
    data_done);
  output data_ready;
  output busy;
  output ack_error;
  output scl;
  output [15:0]samp;
  output [7:0]data_rd;
  inout sda;
  input clk;
  input p_2_in;
  input reset_n;
  input ena;
  input data_done;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[3]_i_1_n_0 ;
  wire \FSM_sequential_state[3]_i_2_n_0 ;
  wire \FSM_sequential_state[4]_i_2_n_0 ;
  wire ack_error;
  wire ack_error2_out;
  wire ack_error_i_1_n_0;
  wire ack_error_i_2_n_0;
  wire ack_error_i_4_n_0;
  wire ack_error_i_5_n_0;
  wire ack_error_i_6_n_0;
  wire \addr_rw[0]_i_1_n_0 ;
  wire \addr_rw[0]_i_2_n_0 ;
  wire \addr_rw_reg_n_0_[0] ;
  wire \bit_cnt[0]_i_1_n_0 ;
  wire \bit_cnt[1]_i_1_n_0 ;
  wire \bit_cnt[2]_i_1_n_0 ;
  wire \bit_cnt[2]_i_2_n_0 ;
  wire \bit_cnt_reg_n_0_[0] ;
  wire \bit_cnt_reg_n_0_[1] ;
  wire \bit_cnt_reg_n_0_[2] ;
  wire busy;
  wire busy4_out;
  wire busy_i_1_n_0;
  wire busy_i_2_n_0;
  wire busy_i_3_n_0;
  wire busy_i_5_n_0;
  wire clk;
  wire [12:0]count;
  wire \count[12]_i_2_n_0 ;
  wire \count[12]_i_4_n_0 ;
  wire \count[12]_i_5_n_0 ;
  wire \count[3]_i_3_n_0 ;
  wire [12:0]count_0;
  wire \count_reg[11]_i_2_n_0 ;
  wire \count_reg[11]_i_2_n_1 ;
  wire \count_reg[11]_i_2_n_2 ;
  wire \count_reg[11]_i_2_n_3 ;
  wire \count_reg[3]_i_2_n_0 ;
  wire \count_reg[3]_i_2_n_1 ;
  wire \count_reg[3]_i_2_n_2 ;
  wire \count_reg[3]_i_2_n_3 ;
  wire \count_reg[7]_i_2_n_0 ;
  wire \count_reg[7]_i_2_n_1 ;
  wire \count_reg[7]_i_2_n_2 ;
  wire \count_reg[7]_i_2_n_3 ;
  wire [12:0]data0;
  wire data_clk;
  wire data_clk_i_1_n_0;
  wire data_clk_i_2_n_0;
  wire data_clk_i_3_n_0;
  wire data_clk_i_4_n_0;
  wire data_clk_i_5_n_0;
  wire data_clk_i_6_n_0;
  wire data_clk_i_7_n_0;
  wire data_clk_i_8_n_0;
  wire data_clk_prev;
  wire data_clk_prev_i_1_n_0;
  wire data_done;
  wire [7:0]data_rd;
  wire \data_rd[7]_i_1_n_0 ;
  wire \data_rd[7]_i_2_n_0 ;
  wire data_ready;
  wire data_ready1;
  wire data_ready_i_1_n_0;
  wire data_ready_i_2_n_0;
  wire data_ready_i_3_n_0;
  wire \data_rx[0]_i_1_n_0 ;
  wire \data_rx[1]_i_1_n_0 ;
  wire \data_rx[2]_i_1_n_0 ;
  wire \data_rx[3]_i_1_n_0 ;
  wire \data_rx[4]_i_1_n_0 ;
  wire \data_rx[5]_i_1_n_0 ;
  wire \data_rx[6]_i_1_n_0 ;
  wire \data_rx[7]_i_1_n_0 ;
  wire \data_rx[7]_i_2_n_0 ;
  wire ena;
  wire [7:0]in14;
  wire p_2_in;
  wire reset_n;
  wire [15:0]samp;
  wire samp0;
  wire \samp[15]_i_2_n_0 ;
  wire \sample[15]_i_1_n_0 ;
  wire \sample[15]_i_2_n_0 ;
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
  wire scl_clk;
  wire scl_clk_i_1_n_0;
  wire scl_clk_i_2_n_0;
  wire scl_clk_i_3_n_0;
  wire scl_ena_i_1_n_0;
  wire scl_ena_i_2_n_0;
  wire scl_ena_reg_n_0;
  wire scl_reg0;
  wire sda;
  wire sda_INST_0_i_2_n_0;
  wire sda_INST_0_i_3_n_0;
  wire sda_INST_0_i_4_n_0;
  wire sda_ena_n;
  wire sda_int6_out;
  wire sda_int_i_1_n_0;
  wire sda_int_i_2_n_0;
  wire sda_int_i_3_n_0;
  wire sda_int_i_5_n_0;
  wire sda_int_i_6_n_0;
  wire sda_int_i_7_n_0;
  wire sda_int_i_8_n_0;
  wire sda_int_i_9_n_0;
  wire sda_int_reg_n_0;
  wire [4:0]state;
  wire stretch;
  wire stretch_i_1_n_0;
  wire stretch_i_2_n_0;
  wire stretch_i_3_n_0;
  wire stretch_i_4_n_0;
  wire stretch_i_5_n_0;
  wire stretch_i_6_n_0;
  wire [3:0]\NLW_count_reg[12]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_count_reg[12]_i_3_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h00004F4F0000FF00)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\data_rd[7]_i_2_n_0 ),
        .I1(sda_INST_0_i_3_n_0),
        .I2(state[0]),
        .I3(\FSM_sequential_state[0]_i_2_n_0 ),
        .I4(state[4]),
        .I5(state[3]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h02A2FEA4)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(state[2]),
        .I1(ena),
        .I2(state[1]),
        .I3(\data_rd[7]_i_2_n_0 ),
        .I4(state[0]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBFBEEEEAAAAAAAA)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[2]),
        .I3(\data_rd[7]_i_2_n_0 ),
        .I4(state[0]),
        .I5(\FSM_sequential_state[1]_i_3_n_0 ),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0A802A800A8A2A80)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(\FSM_sequential_state[1]_i_4_n_0 ),
        .I1(\data_rd[7]_i_2_n_0 ),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .I5(ena),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(state[4]),
        .I1(state[3]),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(state[3]),
        .I1(state[4]),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(\FSM_sequential_state[2]_i_2_n_0 ),
        .I1(state[4]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF5FFFA300F000)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\data_rd[7]_i_2_n_0 ),
        .I1(ena),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[3]),
        .I5(state[2]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[3]_i_1 
       (.I0(\FSM_sequential_state[3]_i_2_n_0 ),
        .I1(state[4]),
        .O(\FSM_sequential_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2C2CCCFCCCCCCCCC)) 
    \FSM_sequential_state[3]_i_2 
       (.I0(\data_rd[7]_i_2_n_0 ),
        .I1(state[3]),
        .I2(state[0]),
        .I3(ena),
        .I4(state[1]),
        .I5(state[2]),
        .O(\FSM_sequential_state[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[4]_i_1 
       (.I0(data_clk),
        .I1(data_clk_prev),
        .O(data_ready1));
  LUT6 #(
    .INIT(64'h7444444444444444)) 
    \FSM_sequential_state[4]_i_2 
       (.I0(data_done),
        .I1(state[4]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[3]),
        .I5(state[0]),
        .O(\FSM_sequential_state[4]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111" *) 
  FDCE \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111" *) 
  FDCE \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]));
  (* FSM_ENCODED_STATES = "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111" *) 
  FDCE \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]));
  (* FSM_ENCODED_STATES = "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111" *) 
  FDCE \FSM_sequential_state_reg[3] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_sequential_state[3]_i_1_n_0 ),
        .Q(state[3]));
  (* FSM_ENCODED_STATES = "mstr_ack3:01110,rd3:01101,mstr_ack2:01100,slv_ack1:00011,command1:00010,hold:10000,start1:00001,rd2:01011,ready:00000,mstr_ack1:01010,command2:00111,start2:00110,rd1:01001,slv_ack3:01000,slv_ack2:00101,wr:00100,stop:01111" *) 
  FDCE \FSM_sequential_state_reg[4] 
       (.C(clk),
        .CE(data_ready1),
        .CLR(busy_i_2_n_0),
        .D(\FSM_sequential_state[4]_i_2_n_0 ),
        .Q(state[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    ack_error_i_1
       (.I0(ack_error_i_2_n_0),
        .I1(ack_error2_out),
        .I2(ack_error),
        .O(ack_error_i_1_n_0));
  LUT5 #(
    .INIT(32'hE4E4E4D8)) 
    ack_error_i_2
       (.I0(state[2]),
        .I1(sda),
        .I2(scl_ena_reg_n_0),
        .I3(state[3]),
        .I4(state[1]),
        .O(ack_error_i_2_n_0));
  LUT6 #(
    .INIT(64'h0022000F00000000)) 
    ack_error_i_3
       (.I0(ack_error_i_4_n_0),
        .I1(state[3]),
        .I2(ack_error_i_5_n_0),
        .I3(state[4]),
        .I4(state[0]),
        .I5(ack_error_i_6_n_0),
        .O(ack_error2_out));
  LUT4 #(
    .INIT(16'h6071)) 
    ack_error_i_4
       (.I0(state[2]),
        .I1(state[1]),
        .I2(sda),
        .I3(scl_ena_reg_n_0),
        .O(ack_error_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFF7CFF7)) 
    ack_error_i_5
       (.I0(sda),
        .I1(state[3]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(scl_ena_reg_n_0),
        .O(ack_error_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ack_error_i_6
       (.I0(data_clk_prev),
        .I1(data_clk),
        .O(ack_error_i_6_n_0));
  FDCE ack_error_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(ack_error_i_1_n_0),
        .Q(ack_error));
  LUT6 #(
    .INIT(64'hFFFFF7FF00000000)) 
    \addr_rw[0]_i_1 
       (.I0(\addr_rw[0]_i_2_n_0 ),
        .I1(data_clk),
        .I2(data_clk_prev),
        .I3(reset_n),
        .I4(state[4]),
        .I5(\addr_rw_reg_n_0_[0] ),
        .O(\addr_rw[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \addr_rw[0]_i_2 
       (.I0(ena),
        .I1(state[0]),
        .I2(state[3]),
        .I3(state[2]),
        .I4(state[1]),
        .O(\addr_rw[0]_i_2_n_0 ));
  FDRE \addr_rw_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\addr_rw[0]_i_1_n_0 ),
        .Q(\addr_rw_reg_n_0_[0] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \bit_cnt[0]_i_1 
       (.I0(\bit_cnt[2]_i_2_n_0 ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .O(\bit_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \bit_cnt[1]_i_1 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\bit_cnt[2]_i_2_n_0 ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .O(\bit_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hEF10)) 
    \bit_cnt[2]_i_1 
       (.I0(\bit_cnt_reg_n_0_[1] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt[2]_i_2_n_0 ),
        .I3(\bit_cnt_reg_n_0_[2] ),
        .O(\bit_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0220220000020020)) 
    \bit_cnt[2]_i_2 
       (.I0(data_ready1),
        .I1(state[4]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[1]),
        .I5(state[0]),
        .O(\bit_cnt[2]_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[0]_i_1_n_0 ),
        .PRE(busy_i_2_n_0),
        .Q(\bit_cnt_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[1]_i_1_n_0 ),
        .PRE(busy_i_2_n_0),
        .Q(\bit_cnt_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[2]_i_1_n_0 ),
        .PRE(busy_i_2_n_0),
        .Q(\bit_cnt_reg_n_0_[2] ));
  LUT3 #(
    .INIT(8'hB8)) 
    busy_i_1
       (.I0(busy_i_3_n_0),
        .I1(busy4_out),
        .I2(busy),
        .O(busy_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    busy_i_2
       (.I0(reset_n),
        .O(busy_i_2_n_0));
  LUT6 #(
    .INIT(64'h00007733000000FC)) 
    busy_i_3
       (.I0(state[1]),
        .I1(state[2]),
        .I2(ena),
        .I3(state[3]),
        .I4(state[4]),
        .I5(state[0]),
        .O(busy_i_3_n_0));
  LUT6 #(
    .INIT(64'h99C8F9BB00000000)) 
    busy_i_4
       (.I0(state[0]),
        .I1(state[3]),
        .I2(ena),
        .I3(state[2]),
        .I4(state[1]),
        .I5(busy_i_5_n_0),
        .O(busy4_out));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    busy_i_5
       (.I0(data_clk_prev),
        .I1(data_clk),
        .I2(state[4]),
        .O(busy_i_5_n_0));
  FDPE busy_reg
       (.C(clk),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .PRE(busy_i_2_n_0),
        .Q(busy));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[0]),
        .O(count_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[10]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[10]),
        .O(count_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[11]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[11]),
        .O(count_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[12]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[12]),
        .O(count_0[12]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \count[12]_i_2 
       (.I0(\count[12]_i_4_n_0 ),
        .I1(count[4]),
        .I2(count[3]),
        .I3(count[6]),
        .I4(count[5]),
        .I5(\count[12]_i_5_n_0 ),
        .O(\count[12]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \count[12]_i_4 
       (.I0(count[8]),
        .I1(count[7]),
        .I2(count[9]),
        .I3(count[10]),
        .O(\count[12]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \count[12]_i_5 
       (.I0(count[0]),
        .I1(count[11]),
        .I2(count[12]),
        .I3(count[2]),
        .I4(count[1]),
        .O(\count[12]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[1]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[1]),
        .O(count_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[2]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[2]),
        .O(count_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[3]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[3]),
        .O(count_0[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \count[3]_i_3 
       (.I0(count[0]),
        .I1(stretch),
        .O(\count[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[4]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[4]),
        .O(count_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[5]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[5]),
        .O(count_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[6]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[6]),
        .O(count_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[7]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[7]),
        .O(count_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[8]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[8]),
        .O(count_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count[9]_i_1 
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[9]),
        .O(count_0[9]));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[0]),
        .Q(count[0]));
  FDCE \count_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[10]),
        .Q(count[10]));
  FDCE \count_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[11]),
        .Q(count[11]));
  CARRY4 \count_reg[11]_i_2 
       (.CI(\count_reg[7]_i_2_n_0 ),
        .CO({\count_reg[11]_i_2_n_0 ,\count_reg[11]_i_2_n_1 ,\count_reg[11]_i_2_n_2 ,\count_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[11:8]),
        .S(count[11:8]));
  FDCE \count_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[12]),
        .Q(count[12]));
  CARRY4 \count_reg[12]_i_3 
       (.CI(\count_reg[11]_i_2_n_0 ),
        .CO(\NLW_count_reg[12]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[12]_i_3_O_UNCONNECTED [3:1],data0[12]}),
        .S({1'b0,1'b0,1'b0,count[12]}));
  FDCE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[1]),
        .Q(count[1]));
  FDCE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[2]),
        .Q(count[2]));
  FDCE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[3]),
        .Q(count[3]));
  CARRY4 \count_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\count_reg[3]_i_2_n_0 ,\count_reg[3]_i_2_n_1 ,\count_reg[3]_i_2_n_2 ,\count_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,count[0]}),
        .O(data0[3:0]),
        .S({count[3:1],\count[3]_i_3_n_0 }));
  FDCE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[4]),
        .Q(count[4]));
  FDCE \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[5]),
        .Q(count[5]));
  FDCE \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[6]),
        .Q(count[6]));
  FDCE \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[7]),
        .Q(count[7]));
  CARRY4 \count_reg[7]_i_2 
       (.CI(\count_reg[3]_i_2_n_0 ),
        .CO({\count_reg[7]_i_2_n_0 ,\count_reg[7]_i_2_n_1 ,\count_reg[7]_i_2_n_2 ,\count_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[7:4]),
        .S(count[7:4]));
  FDCE \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[8]),
        .Q(count[8]));
  FDCE \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(count_0[9]),
        .Q(count[9]));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    data_clk_i_1
       (.I0(data_clk_i_2_n_0),
        .I1(data_clk_i_3_n_0),
        .I2(data_clk_i_4_n_0),
        .I3(data_clk_i_5_n_0),
        .I4(reset_n),
        .I5(data_clk),
        .O(data_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'h000C080800080808)) 
    data_clk_i_2
       (.I0(data0[11]),
        .I1(\count[12]_i_2_n_0 ),
        .I2(data0[12]),
        .I3(data0[9]),
        .I4(data0[10]),
        .I5(data0[8]),
        .O(data_clk_i_2_n_0));
  LUT6 #(
    .INIT(64'h8000800080000000)) 
    data_clk_i_3
       (.I0(data_clk_i_6_n_0),
        .I1(data0[7]),
        .I2(data0[6]),
        .I3(data0[5]),
        .I4(data0[1]),
        .I5(data_clk_i_7_n_0),
        .O(data_clk_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    data_clk_i_4
       (.I0(\count[12]_i_2_n_0 ),
        .I1(data0[12]),
        .O(data_clk_i_4_n_0));
  LUT6 #(
    .INIT(64'h0404040444440444)) 
    data_clk_i_5
       (.I0(data_clk_i_8_n_0),
        .I1(data_clk_i_4_n_0),
        .I2(data0[11]),
        .I3(data0[7]),
        .I4(stretch_i_5_n_0),
        .I5(data0[8]),
        .O(data_clk_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    data_clk_i_6
       (.I0(data0[10]),
        .I1(data0[9]),
        .O(data_clk_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    data_clk_i_7
       (.I0(data0[4]),
        .I1(data0[3]),
        .I2(data0[2]),
        .O(data_clk_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    data_clk_i_8
       (.I0(data0[9]),
        .I1(data0[10]),
        .O(data_clk_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    data_clk_prev_i_1
       (.I0(data_clk),
        .I1(reset_n),
        .I2(data_clk_prev),
        .O(data_clk_prev_i_1_n_0));
  FDRE data_clk_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_clk_prev_i_1_n_0),
        .Q(data_clk_prev),
        .R(1'b0));
  FDRE data_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_clk_i_1_n_0),
        .Q(data_clk),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \data_rd[7]_i_1 
       (.I0(\data_rd[7]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[2]),
        .I3(\samp[15]_i_2_n_0 ),
        .I4(state[4]),
        .I5(data_ready1),
        .O(\data_rd[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \data_rd[7]_i_2 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[1] ),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .O(\data_rd[7]_i_2_n_0 ));
  FDCE \data_rd_reg[0] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[0]),
        .Q(data_rd[0]));
  FDCE \data_rd_reg[1] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[1]),
        .Q(data_rd[1]));
  FDCE \data_rd_reg[2] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[2]),
        .Q(data_rd[2]));
  FDCE \data_rd_reg[3] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[3]),
        .Q(data_rd[3]));
  FDCE \data_rd_reg[4] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[4]),
        .Q(data_rd[4]));
  FDCE \data_rd_reg[5] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[5]),
        .Q(data_rd[5]));
  FDCE \data_rd_reg[6] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[6]),
        .Q(data_rd[6]));
  FDCE \data_rd_reg[7] 
       (.C(clk),
        .CE(\data_rd[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(in14[7]),
        .Q(data_rd[7]));
  LUT6 #(
    .INIT(64'h7CFFFFFF40000000)) 
    data_ready_i_1
       (.I0(state[4]),
        .I1(state[2]),
        .I2(state[3]),
        .I3(data_ready_i_2_n_0),
        .I4(data_ready_i_3_n_0),
        .I5(data_ready),
        .O(data_ready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    data_ready_i_2
       (.I0(state[4]),
        .I1(reset_n),
        .I2(data_clk_prev),
        .I3(data_clk),
        .O(data_ready_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h81)) 
    data_ready_i_3
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .O(data_ready_i_3_n_0));
  FDRE data_ready_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_ready_i_1_n_0),
        .Q(data_ready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFF0100FEFF0000)) 
    \data_rx[0]_i_1 
       (.I0(\bit_cnt_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[1] ),
        .I2(\bit_cnt_reg_n_0_[0] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[0]),
        .I5(sda),
        .O(\data_rx[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0200FDFF0000)) 
    \data_rx[1]_i_1 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[1] ),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[1]),
        .I5(sda),
        .O(\data_rx[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF1000EFFF0000)) 
    \data_rx[2]_i_1 
       (.I0(\bit_cnt_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[2]),
        .I5(sda),
        .O(\data_rx[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF4000BFFF0000)) 
    \data_rx[3]_i_1 
       (.I0(\bit_cnt_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[3]),
        .I5(sda),
        .O(\data_rx[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF1000EFFF0000)) 
    \data_rx[4]_i_1 
       (.I0(\bit_cnt_reg_n_0_[1] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[4]),
        .I5(sda),
        .O(\data_rx[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0800F7FF0000)) 
    \data_rx[5]_i_1 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[5]),
        .I5(sda),
        .O(\data_rx[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF4000BFFF0000)) 
    \data_rx[6]_i_1 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[6]),
        .I5(sda),
        .O(\data_rx[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF80007FFF0000)) 
    \data_rx[7]_i_1 
       (.I0(\bit_cnt_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\data_rx[7]_i_2_n_0 ),
        .I4(in14[7]),
        .I5(sda),
        .O(\data_rx[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \data_rx[7]_i_2 
       (.I0(reset_n),
        .I1(state[4]),
        .I2(data_clk_prev),
        .I3(data_clk),
        .I4(\samp[15]_i_2_n_0 ),
        .I5(sda_INST_0_i_3_n_0),
        .O(\data_rx[7]_i_2_n_0 ));
  FDRE \data_rx_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[0]_i_1_n_0 ),
        .Q(in14[0]),
        .R(1'b0));
  FDRE \data_rx_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[1]_i_1_n_0 ),
        .Q(in14[1]),
        .R(1'b0));
  FDRE \data_rx_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[2]_i_1_n_0 ),
        .Q(in14[2]),
        .R(1'b0));
  FDRE \data_rx_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[3]_i_1_n_0 ),
        .Q(in14[3]),
        .R(1'b0));
  FDRE \data_rx_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[4]_i_1_n_0 ),
        .Q(in14[4]),
        .R(1'b0));
  FDRE \data_rx_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[5]_i_1_n_0 ),
        .Q(in14[5]),
        .R(1'b0));
  FDRE \data_rx_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[6]_i_1_n_0 ),
        .Q(in14[6]),
        .R(1'b0));
  FDRE \data_rx_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\data_rx[7]_i_1_n_0 ),
        .Q(in14[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \samp[15]_i_1 
       (.I0(\samp[15]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[2]),
        .I3(data_ready1),
        .I4(reset_n),
        .I5(state[4]),
        .O(samp0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \samp[15]_i_2 
       (.I0(state[0]),
        .I1(state[3]),
        .O(\samp[15]_i_2_n_0 ));
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
  LUT5 #(
    .INIT(32'h80000000)) 
    \sample[15]_i_1 
       (.I0(\sample[15]_i_2_n_0 ),
        .I1(\data_rd[7]_i_2_n_0 ),
        .I2(state[1]),
        .I3(state[3]),
        .I4(state[0]),
        .O(\sample[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000700000)) 
    \sample[15]_i_2 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(data_clk),
        .I3(data_clk_prev),
        .I4(reset_n),
        .I5(state[4]),
        .O(\sample[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \sample[7]_i_1 
       (.I0(\sample[15]_i_2_n_0 ),
        .I1(\data_rd[7]_i_2_n_0 ),
        .I2(state[3]),
        .I3(state[0]),
        .I4(state[1]),
        .O(\sample[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[0] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[0]),
        .Q(\sample_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[10] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[2]),
        .Q(\sample_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[11] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[3]),
        .Q(\sample_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[12] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[4]),
        .Q(\sample_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[13] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[5]),
        .Q(\sample_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[14] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[6]),
        .Q(\sample_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[15] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[7]),
        .Q(\sample_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[1] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[1]),
        .Q(\sample_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[2] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[2]),
        .Q(\sample_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[3] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[3]),
        .Q(\sample_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[4] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[4]),
        .Q(\sample_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[5] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[5]),
        .Q(\sample_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[6] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[6]),
        .Q(\sample_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[7] 
       (.C(clk),
        .CE(\sample[7]_i_1_n_0 ),
        .D(in14[7]),
        .Q(\sample_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[8] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[0]),
        .Q(\sample_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sample_reg[9] 
       (.C(clk),
        .CE(\sample[15]_i_1_n_0 ),
        .D(in14[1]),
        .Q(\sample_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    scl_INST_0
       (.I0(1'b0),
        .I1(scl_reg0),
        .I2(1'b0),
        .I3(1'b0),
        .I4(1'b0),
        .I5(1'b0),
        .O(scl));
  LUT2 #(
    .INIT(4'h2)) 
    scl_INST_0_i_1
       (.I0(scl_ena_reg_n_0),
        .I1(scl_clk),
        .O(scl_reg0));
  LUT6 #(
    .INIT(64'hFFA8FFFFFFA80000)) 
    scl_clk_i_1
       (.I0(count_0[11]),
        .I1(data0[10]),
        .I2(data0[9]),
        .I3(scl_clk_i_2_n_0),
        .I4(reset_n),
        .I5(scl_clk),
        .O(scl_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'hC888888888888888)) 
    scl_clk_i_2
       (.I0(data0[12]),
        .I1(\count[12]_i_2_n_0 ),
        .I2(data0[8]),
        .I3(data0[11]),
        .I4(scl_clk_i_3_n_0),
        .I5(stretch_i_6_n_0),
        .O(scl_clk_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    scl_clk_i_3
       (.I0(data0[6]),
        .I1(data0[7]),
        .O(scl_clk_i_3_n_0));
  FDRE scl_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(scl_clk_i_1_n_0),
        .Q(scl_clk),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h7F02FF00FF00FF08)) 
    scl_ena_i_1
       (.I0(scl_ena_i_2_n_0),
        .I1(state[0]),
        .I2(state[3]),
        .I3(scl_ena_reg_n_0),
        .I4(state[2]),
        .I5(state[1]),
        .O(scl_ena_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00450000)) 
    scl_ena_i_2
       (.I0(state[4]),
        .I1(state[2]),
        .I2(scl_ena_reg_n_0),
        .I3(data_clk),
        .I4(data_clk_prev),
        .O(scl_ena_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    scl_ena_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(scl_ena_i_1_n_0),
        .Q(scl_ena_reg_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sda_INST_0
       (.I0(sda_ena_n),
        .I1(sda_INST_0_i_2_n_0),
        .O(sda));
  LUT6 #(
    .INIT(64'hAAABAAABFFFD0001)) 
    sda_INST_0_i_1
       (.I0(data_clk_prev),
        .I1(\samp[15]_i_2_n_0 ),
        .I2(sda_INST_0_i_3_n_0),
        .I3(state[4]),
        .I4(sda_int_reg_n_0),
        .I5(sda_INST_0_i_4_n_0),
        .O(sda_ena_n));
  LUT6 #(
    .INIT(64'h11111115BBBBBBB0)) 
    sda_INST_0_i_2
       (.I0(sda_INST_0_i_4_n_0),
        .I1(sda_int_reg_n_0),
        .I2(state[4]),
        .I3(sda_INST_0_i_3_n_0),
        .I4(\samp[15]_i_2_n_0 ),
        .I5(data_clk_prev),
        .O(sda_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h7)) 
    sda_INST_0_i_3
       (.I0(state[1]),
        .I1(state[2]),
        .O(sda_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    sda_INST_0_i_4
       (.I0(state[0]),
        .I1(state[4]),
        .I2(state[3]),
        .I3(state[2]),
        .I4(state[1]),
        .O(sda_INST_0_i_4_n_0));
  LUT5 #(
    .INIT(32'hABFFAB00)) 
    sda_int_i_1
       (.I0(sda_int_i_2_n_0),
        .I1(sda_int_i_3_n_0),
        .I2(state[4]),
        .I3(sda_int6_out),
        .I4(sda_int_reg_n_0),
        .O(sda_int_i_1_n_0));
  LUT6 #(
    .INIT(64'h5454501001010101)) 
    sda_int_i_2
       (.I0(state[4]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(\data_rd[7]_i_2_n_0 ),
        .I4(\addr_rw_reg_n_0_[0] ),
        .I5(state[2]),
        .O(sda_int_i_2_n_0));
  LUT6 #(
    .INIT(64'hFF55FF5533333303)) 
    sda_int_i_3
       (.I0(ena),
        .I1(sda_int_i_5_n_0),
        .I2(sda_int_i_6_n_0),
        .I3(state[0]),
        .I4(state[2]),
        .I5(state[3]),
        .O(sda_int_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000F40000)) 
    sda_int_i_4
       (.I0(state[3]),
        .I1(state[1]),
        .I2(sda_int_i_7_n_0),
        .I3(data_clk_prev),
        .I4(data_clk),
        .I5(state[4]),
        .O(sda_int6_out));
  LUT6 #(
    .INIT(64'hAAAEAEAEAAAAAAAA)) 
    sda_int_i_5
       (.I0(sda_int_i_8_n_0),
        .I1(state[0]),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .I3(\bit_cnt_reg_n_0_[1] ),
        .I4(\bit_cnt_reg_n_0_[0] ),
        .I5(sda_int_i_9_n_0),
        .O(sda_int_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hAAAB)) 
    sda_int_i_6
       (.I0(\addr_rw_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\bit_cnt_reg_n_0_[0] ),
        .O(sda_int_i_6_n_0));
  LUT6 #(
    .INIT(64'h00C0CFCF00AFAAF0)) 
    sda_int_i_7
       (.I0(ena),
        .I1(\data_rd[7]_i_2_n_0 ),
        .I2(state[3]),
        .I3(state[1]),
        .I4(state[2]),
        .I5(state[0]),
        .O(sda_int_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h00A3)) 
    sda_int_i_8
       (.I0(\addr_rw_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(state[0]),
        .I3(state[1]),
        .O(sda_int_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    sda_int_i_9
       (.I0(state[1]),
        .I1(state[2]),
        .O(sda_int_i_9_n_0));
  FDPE #(
    .INIT(1'b1)) 
    sda_int_reg
       (.C(clk),
        .CE(1'b1),
        .D(sda_int_i_1_n_0),
        .PRE(busy_i_2_n_0),
        .Q(sda_int_reg_n_0));
  LUT6 #(
    .INIT(64'hAABBABBBAA88A888)) 
    stretch_i_1
       (.I0(p_2_in),
        .I1(stretch_i_2_n_0),
        .I2(stretch_i_3_n_0),
        .I3(count_0[11]),
        .I4(stretch_i_4_n_0),
        .I5(stretch),
        .O(stretch_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00280000)) 
    stretch_i_2
       (.I0(data0[11]),
        .I1(data0[9]),
        .I2(data0[10]),
        .I3(data0[12]),
        .I4(\count[12]_i_2_n_0 ),
        .O(stretch_i_2_n_0));
  LUT5 #(
    .INIT(32'h04040004)) 
    stretch_i_3
       (.I0(data0[8]),
        .I1(data0[10]),
        .I2(data0[12]),
        .I3(data0[7]),
        .I4(stretch_i_5_n_0),
        .O(stretch_i_3_n_0));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    stretch_i_4
       (.I0(data0[10]),
        .I1(data0[12]),
        .I2(data0[8]),
        .I3(data0[7]),
        .I4(data0[6]),
        .I5(stretch_i_6_n_0),
        .O(stretch_i_4_n_0));
  LUT6 #(
    .INIT(64'h000000000111FFFF)) 
    stretch_i_5
       (.I0(data0[4]),
        .I1(data0[3]),
        .I2(data0[2]),
        .I3(data0[1]),
        .I4(data0[5]),
        .I5(data0[6]),
        .O(stretch_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    stretch_i_6
       (.I0(data0[2]),
        .I1(data0[3]),
        .I2(data0[4]),
        .I3(data0[5]),
        .O(stretch_i_6_n_0));
  FDCE #(
    .INIT(1'b0)) 
    stretch_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(stretch_i_1_n_0),
        .Q(stretch));
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
