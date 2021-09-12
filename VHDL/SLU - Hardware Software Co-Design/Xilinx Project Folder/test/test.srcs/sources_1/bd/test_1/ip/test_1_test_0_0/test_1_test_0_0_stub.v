// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun Oct 11 18:48:44 2020
// Host        : Garin-Book running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/work/test/test.srcs/sources_1/bd/test_1/ip/test_1_test_0_0/test_1_test_0_0_stub.v
// Design      : test_1_test_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "test,Vivado 2019.1" *)
module test_1_test_0_0(a, b)
/* synthesis syn_black_box black_box_pad_pin="a,b" */;
  input a;
  output b;
endmodule