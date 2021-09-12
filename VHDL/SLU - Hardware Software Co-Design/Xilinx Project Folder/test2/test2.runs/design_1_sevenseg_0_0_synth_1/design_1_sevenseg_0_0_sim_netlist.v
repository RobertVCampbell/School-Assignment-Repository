// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Dec  2 11:24:52 2020
// Host        : Garin-Book running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_sevenseg_0_0_sim_netlist.v
// Design      : design_1_sevenseg_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_sevenseg_0_0,sevenseg,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "sevenseg,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    reset_n,
    inputNum,
    A,
    dp,
    LED);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_n;
  input [0:15]inputNum;
  output [3:0]A;
  output dp;
  output [6:0]LED;

  wire [3:0]\^A ;
  wire [6:0]LED;
  wire clk;
  wire dp;
  wire [0:15]inputNum;
  wire reset_n;

  assign A[3] = \^A [3];
  assign A[2] = dp;
  assign A[1:0] = \^A [1:0];
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sevenseg U0
       (.A({\^A [3],dp,\^A [1:0]}),
        .LED(LED),
        .clk(clk),
        .inputNum(inputNum),
        .reset_n(reset_n));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sevenseg
   (A,
    LED,
    clk,
    reset_n,
    inputNum);
  output [3:0]A;
  output [6:0]LED;
  input clk;
  input reset_n;
  input [0:15]inputNum;

  wire [3:0]A;
  wire [6:0]LED;
  wire [1:0]LEDnum;
  wire clk;
  wire \clk10[0]_i_2_n_0 ;
  wire \clk10[0]_i_3_n_0 ;
  wire \clk10_reg[0]_i_1_n_0 ;
  wire \clk10_reg[0]_i_1_n_1 ;
  wire \clk10_reg[0]_i_1_n_2 ;
  wire \clk10_reg[0]_i_1_n_3 ;
  wire \clk10_reg[0]_i_1_n_4 ;
  wire \clk10_reg[0]_i_1_n_5 ;
  wire \clk10_reg[0]_i_1_n_6 ;
  wire \clk10_reg[0]_i_1_n_7 ;
  wire \clk10_reg[12]_i_1_n_0 ;
  wire \clk10_reg[12]_i_1_n_1 ;
  wire \clk10_reg[12]_i_1_n_2 ;
  wire \clk10_reg[12]_i_1_n_3 ;
  wire \clk10_reg[12]_i_1_n_4 ;
  wire \clk10_reg[12]_i_1_n_5 ;
  wire \clk10_reg[12]_i_1_n_6 ;
  wire \clk10_reg[12]_i_1_n_7 ;
  wire \clk10_reg[16]_i_1_n_1 ;
  wire \clk10_reg[16]_i_1_n_2 ;
  wire \clk10_reg[16]_i_1_n_3 ;
  wire \clk10_reg[16]_i_1_n_4 ;
  wire \clk10_reg[16]_i_1_n_5 ;
  wire \clk10_reg[16]_i_1_n_6 ;
  wire \clk10_reg[16]_i_1_n_7 ;
  wire \clk10_reg[4]_i_1_n_0 ;
  wire \clk10_reg[4]_i_1_n_1 ;
  wire \clk10_reg[4]_i_1_n_2 ;
  wire \clk10_reg[4]_i_1_n_3 ;
  wire \clk10_reg[4]_i_1_n_4 ;
  wire \clk10_reg[4]_i_1_n_5 ;
  wire \clk10_reg[4]_i_1_n_6 ;
  wire \clk10_reg[4]_i_1_n_7 ;
  wire \clk10_reg[8]_i_1_n_0 ;
  wire \clk10_reg[8]_i_1_n_1 ;
  wire \clk10_reg[8]_i_1_n_2 ;
  wire \clk10_reg[8]_i_1_n_3 ;
  wire \clk10_reg[8]_i_1_n_4 ;
  wire \clk10_reg[8]_i_1_n_5 ;
  wire \clk10_reg[8]_i_1_n_6 ;
  wire \clk10_reg[8]_i_1_n_7 ;
  wire \clk10_reg_n_0_[0] ;
  wire \clk10_reg_n_0_[10] ;
  wire \clk10_reg_n_0_[11] ;
  wire \clk10_reg_n_0_[12] ;
  wire \clk10_reg_n_0_[13] ;
  wire \clk10_reg_n_0_[14] ;
  wire \clk10_reg_n_0_[15] ;
  wire \clk10_reg_n_0_[16] ;
  wire \clk10_reg_n_0_[17] ;
  wire \clk10_reg_n_0_[1] ;
  wire \clk10_reg_n_0_[2] ;
  wire \clk10_reg_n_0_[3] ;
  wire \clk10_reg_n_0_[4] ;
  wire \clk10_reg_n_0_[5] ;
  wire \clk10_reg_n_0_[6] ;
  wire \clk10_reg_n_0_[7] ;
  wire \clk10_reg_n_0_[8] ;
  wire \clk10_reg_n_0_[9] ;
  wire [3:0]decoder__29;
  wire [0:15]inputNum;
  wire reset_n;
  wire [3:3]\NLW_clk10_reg[16]_i_1_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \A[0]_INST_0 
       (.I0(LEDnum[0]),
        .I1(LEDnum[1]),
        .O(A[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \A[1]_INST_0 
       (.I0(LEDnum[0]),
        .I1(LEDnum[1]),
        .O(A[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \A[3]_INST_0 
       (.I0(LEDnum[0]),
        .I1(LEDnum[1]),
        .O(A[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h4025)) 
    \LED[0]_INST_0 
       (.I0(decoder__29[3]),
        .I1(decoder__29[0]),
        .I2(decoder__29[2]),
        .I3(decoder__29[1]),
        .O(LED[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h5390)) 
    \LED[1]_INST_0 
       (.I0(decoder__29[3]),
        .I1(decoder__29[2]),
        .I2(decoder__29[0]),
        .I3(decoder__29[1]),
        .O(LED[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h5710)) 
    \LED[2]_INST_0 
       (.I0(decoder__29[3]),
        .I1(decoder__29[1]),
        .I2(decoder__29[2]),
        .I3(decoder__29[0]),
        .O(LED[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hC014)) 
    \LED[3]_INST_0 
       (.I0(decoder__29[3]),
        .I1(decoder__29[2]),
        .I2(decoder__29[0]),
        .I3(decoder__29[1]),
        .O(LED[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hA210)) 
    \LED[4]_INST_0 
       (.I0(decoder__29[3]),
        .I1(decoder__29[0]),
        .I2(decoder__29[1]),
        .I3(decoder__29[2]),
        .O(LED[4]));
  LUT4 #(
    .INIT(16'hAC48)) 
    \LED[5]_INST_0 
       (.I0(decoder__29[3]),
        .I1(decoder__29[2]),
        .I2(decoder__29[0]),
        .I3(decoder__29[1]),
        .O(LED[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2094)) 
    \LED[6]_INST_0 
       (.I0(decoder__29[3]),
        .I1(decoder__29[2]),
        .I2(decoder__29[0]),
        .I3(decoder__29[1]),
        .O(LED[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \LED[6]_INST_0_i_1 
       (.I0(inputNum[8]),
        .I1(inputNum[12]),
        .I2(inputNum[0]),
        .I3(LEDnum[1]),
        .I4(LEDnum[0]),
        .I5(inputNum[4]),
        .O(decoder__29[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \LED[6]_INST_0_i_2 
       (.I0(inputNum[9]),
        .I1(inputNum[13]),
        .I2(inputNum[1]),
        .I3(LEDnum[1]),
        .I4(LEDnum[0]),
        .I5(inputNum[5]),
        .O(decoder__29[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \LED[6]_INST_0_i_3 
       (.I0(inputNum[11]),
        .I1(inputNum[15]),
        .I2(inputNum[3]),
        .I3(LEDnum[1]),
        .I4(LEDnum[0]),
        .I5(inputNum[7]),
        .O(decoder__29[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \LED[6]_INST_0_i_4 
       (.I0(inputNum[10]),
        .I1(inputNum[14]),
        .I2(inputNum[2]),
        .I3(LEDnum[1]),
        .I4(LEDnum[0]),
        .I5(inputNum[6]),
        .O(decoder__29[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \clk10[0]_i_2 
       (.I0(reset_n),
        .O(\clk10[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \clk10[0]_i_3 
       (.I0(\clk10_reg_n_0_[0] ),
        .O(\clk10[0]_i_3_n_0 ));
  FDCE \clk10_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[0]_i_1_n_7 ),
        .Q(\clk10_reg_n_0_[0] ));
  CARRY4 \clk10_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\clk10_reg[0]_i_1_n_0 ,\clk10_reg[0]_i_1_n_1 ,\clk10_reg[0]_i_1_n_2 ,\clk10_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clk10_reg[0]_i_1_n_4 ,\clk10_reg[0]_i_1_n_5 ,\clk10_reg[0]_i_1_n_6 ,\clk10_reg[0]_i_1_n_7 }),
        .S({\clk10_reg_n_0_[3] ,\clk10_reg_n_0_[2] ,\clk10_reg_n_0_[1] ,\clk10[0]_i_3_n_0 }));
  FDCE \clk10_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[8]_i_1_n_5 ),
        .Q(\clk10_reg_n_0_[10] ));
  FDCE \clk10_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[8]_i_1_n_4 ),
        .Q(\clk10_reg_n_0_[11] ));
  FDCE \clk10_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[12]_i_1_n_7 ),
        .Q(\clk10_reg_n_0_[12] ));
  CARRY4 \clk10_reg[12]_i_1 
       (.CI(\clk10_reg[8]_i_1_n_0 ),
        .CO({\clk10_reg[12]_i_1_n_0 ,\clk10_reg[12]_i_1_n_1 ,\clk10_reg[12]_i_1_n_2 ,\clk10_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk10_reg[12]_i_1_n_4 ,\clk10_reg[12]_i_1_n_5 ,\clk10_reg[12]_i_1_n_6 ,\clk10_reg[12]_i_1_n_7 }),
        .S({\clk10_reg_n_0_[15] ,\clk10_reg_n_0_[14] ,\clk10_reg_n_0_[13] ,\clk10_reg_n_0_[12] }));
  FDCE \clk10_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[12]_i_1_n_6 ),
        .Q(\clk10_reg_n_0_[13] ));
  FDCE \clk10_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[12]_i_1_n_5 ),
        .Q(\clk10_reg_n_0_[14] ));
  FDCE \clk10_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[12]_i_1_n_4 ),
        .Q(\clk10_reg_n_0_[15] ));
  FDCE \clk10_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[16]_i_1_n_7 ),
        .Q(\clk10_reg_n_0_[16] ));
  CARRY4 \clk10_reg[16]_i_1 
       (.CI(\clk10_reg[12]_i_1_n_0 ),
        .CO({\NLW_clk10_reg[16]_i_1_CO_UNCONNECTED [3],\clk10_reg[16]_i_1_n_1 ,\clk10_reg[16]_i_1_n_2 ,\clk10_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk10_reg[16]_i_1_n_4 ,\clk10_reg[16]_i_1_n_5 ,\clk10_reg[16]_i_1_n_6 ,\clk10_reg[16]_i_1_n_7 }),
        .S({LEDnum,\clk10_reg_n_0_[17] ,\clk10_reg_n_0_[16] }));
  FDCE \clk10_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[16]_i_1_n_6 ),
        .Q(\clk10_reg_n_0_[17] ));
  FDCE \clk10_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[16]_i_1_n_5 ),
        .Q(LEDnum[0]));
  FDCE \clk10_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[16]_i_1_n_4 ),
        .Q(LEDnum[1]));
  FDCE \clk10_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[0]_i_1_n_6 ),
        .Q(\clk10_reg_n_0_[1] ));
  FDCE \clk10_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[0]_i_1_n_5 ),
        .Q(\clk10_reg_n_0_[2] ));
  FDCE \clk10_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[0]_i_1_n_4 ),
        .Q(\clk10_reg_n_0_[3] ));
  FDCE \clk10_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[4]_i_1_n_7 ),
        .Q(\clk10_reg_n_0_[4] ));
  CARRY4 \clk10_reg[4]_i_1 
       (.CI(\clk10_reg[0]_i_1_n_0 ),
        .CO({\clk10_reg[4]_i_1_n_0 ,\clk10_reg[4]_i_1_n_1 ,\clk10_reg[4]_i_1_n_2 ,\clk10_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk10_reg[4]_i_1_n_4 ,\clk10_reg[4]_i_1_n_5 ,\clk10_reg[4]_i_1_n_6 ,\clk10_reg[4]_i_1_n_7 }),
        .S({\clk10_reg_n_0_[7] ,\clk10_reg_n_0_[6] ,\clk10_reg_n_0_[5] ,\clk10_reg_n_0_[4] }));
  FDCE \clk10_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[4]_i_1_n_6 ),
        .Q(\clk10_reg_n_0_[5] ));
  FDCE \clk10_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[4]_i_1_n_5 ),
        .Q(\clk10_reg_n_0_[6] ));
  FDCE \clk10_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[4]_i_1_n_4 ),
        .Q(\clk10_reg_n_0_[7] ));
  FDCE \clk10_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[8]_i_1_n_7 ),
        .Q(\clk10_reg_n_0_[8] ));
  CARRY4 \clk10_reg[8]_i_1 
       (.CI(\clk10_reg[4]_i_1_n_0 ),
        .CO({\clk10_reg[8]_i_1_n_0 ,\clk10_reg[8]_i_1_n_1 ,\clk10_reg[8]_i_1_n_2 ,\clk10_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk10_reg[8]_i_1_n_4 ,\clk10_reg[8]_i_1_n_5 ,\clk10_reg[8]_i_1_n_6 ,\clk10_reg[8]_i_1_n_7 }),
        .S({\clk10_reg_n_0_[11] ,\clk10_reg_n_0_[10] ,\clk10_reg_n_0_[9] ,\clk10_reg_n_0_[8] }));
  FDCE \clk10_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\clk10[0]_i_2_n_0 ),
        .D(\clk10_reg[8]_i_1_n_6 ),
        .Q(\clk10_reg_n_0_[9] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    dp_INST_0
       (.I0(LEDnum[1]),
        .I1(LEDnum[0]),
        .O(A[2]));
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
