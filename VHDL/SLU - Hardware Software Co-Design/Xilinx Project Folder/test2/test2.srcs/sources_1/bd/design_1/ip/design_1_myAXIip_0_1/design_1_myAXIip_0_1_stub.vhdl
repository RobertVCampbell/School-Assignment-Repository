-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Wed Dec  2 15:34:35 2020
-- Host        : Garin-Book running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/work/test2/test2.srcs/sources_1/bd/design_1/ip/design_1_myAXIip_0_1/design_1_myAXIip_0_1_stub.vhdl
-- Design      : design_1_myAXIip_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_myAXIip_0_1 is
  Port ( 
    Myen_sw : in STD_LOGIC;
    Myrst_sw : in STD_LOGIC;
    Mydata_ready : in STD_LOGIC;
    Myack_error : in STD_LOGIC;
    Mybusy : in STD_LOGIC;
    Myena : out STD_LOGIC;
    Myreset_n : out STD_LOGIC;
    Mydata_done : out STD_LOGIC;
    Mydata_rd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Mysamp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    MyinputNum : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );

end design_1_myAXIip_0_1;

architecture stub of design_1_myAXIip_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Myen_sw,Myrst_sw,Mydata_ready,Myack_error,Mybusy,Myena,Myreset_n,Mydata_done,Mydata_rd[7:0],Mysamp[15:0],MyinputNum[15:0],s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "myAXIip_v1_0,Vivado 2019.1";
begin
end;
