-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_i2c_master_0_0 is
  Port ( 
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

end design_1_i2c_master_0_0;

architecture stub of design_1_i2c_master_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "i2c_master,Vivado 2019.1";
begin
end;
