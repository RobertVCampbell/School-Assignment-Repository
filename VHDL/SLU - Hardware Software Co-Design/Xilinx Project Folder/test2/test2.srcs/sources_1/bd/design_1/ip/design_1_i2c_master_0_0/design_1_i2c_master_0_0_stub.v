// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Dec  3 15:26:40 2020
// Host        : MDD-ECE-FTDG853 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/campbellrobert/Desktop/final/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_i2c_master_0_0/design_1_i2c_master_0_0_stub.v
// Design      : design_1_i2c_master_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "i2c_master,Vivado 2019.1" *)
module design_1_i2c_master_0_0(data_ready, samp, data_done, clk, reset_n, ena, busy, 
  data_rd, ack_error, sda, scl, debug)
/* synthesis syn_black_box black_box_pad_pin="data_ready,samp[15:0],data_done,clk,reset_n,ena,busy,data_rd[7:0],ack_error,sda,scl,debug[7:0]" */;
  output data_ready;
  output [15:0]samp;
  input data_done;
  input clk;
  input reset_n;
  input ena;
  output busy;
  output [7:0]data_rd;
  output ack_error;
  inout sda;
  inout scl;
  output [7:0]debug;
endmodule
