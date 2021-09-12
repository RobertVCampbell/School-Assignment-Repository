--------------------------------------------------------------------------------
-- Modified from open source file for use in HWSW Co-design final project
-- Originally used as a reference, added in completely as part of debugging
--
--------------------------------------------------------------------------------
--
--   FileName:         i2c_master.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 13.1 Build 162 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 11/01/2012 Scott Larson
--     Initial Public Release
--   Version 2.0 06/20/2014 Scott Larson
--     Added ability to interface with different slaves in the same transaction
--     Corrected ack_error bug where ack_error went 'Z' instead of '1' on error
--     Corrected timing of when ack_error signal clears
--   Version 2.1 10/21/2014 Scott Larson
--     Replaced gated clock with clock enable
--     Adjusted timing of SCL during start and stop conditions
--   Version 2.2 02/05/2015 Scott Larson
--     Corrected small SDA glitch introduced in version 2.1
-- 
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

ENTITY i2c_master IS
  GENERIC(
    input_clk : INTEGER := 100_000_000; --input clock speed from user logic in Hz
    bus_clk   : INTEGER := 20_000);   --speed the i2c bus (scl) will run at in Hz
  PORT(
    data_ready     : out     STD_LOGIC;               --External flag to notify when data is ready
    samp     : out std_logic_vector(15 downto 0); --output sample to the register
    data_done: in std_logic;
    clk       : IN     STD_LOGIC;                    --system clock
    reset_n   : IN     STD_LOGIC;                    --active low reset
    ena       : IN     STD_LOGIC;                   --latch in command
   -- addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
   
--    rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
--    data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
    busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
    data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
    ack_error : out STD_LOGIC;                    --flag if improper acknowledge from slave
    sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
    scl       : INOUT  STD_LOGIC;
    debug     : out std_logic_vector(7 downto 0));                   --serial clock output of i2c bus
END i2c_master;

ARCHITECTURE logic OF i2c_master IS
  CONSTANT divider  :  INTEGER := ((input_clk/bus_clk)/4) + 5 ; --number of clocks in 1/4 cycle of scl
  TYPE machine IS(ready, start1, command1, slv_ack1, wr, slv_ack2, start2, command2, slv_ack3, rd1, mstr_ack1, rd2, mstr_ack2, rd3, mstr_ack3, stop, hold); --needed states
  SIGNAL state         : machine;                        --state machine
  SIGNAL data_clk      : STD_LOGIC;                      --data clock for sda
  SIGNAL data_clk_prev : STD_LOGIC;                      --data clock during previous system clock
  SIGNAL scl_clk       : STD_LOGIC;                      --constantly running internal scl
  SIGNAL scl_ena       : STD_LOGIC := '0';               --enables internal scl to output
  SIGNAL sda_int       : STD_LOGIC := '1';               --internal sda
  SIGNAL sda_ena_n     : STD_LOGIC;                      --enables internal sda to output
  SIGNAL addr_rw       : STD_LOGIC_VECTOR(7 DOWNTO 0);   --latched in address and read/write
  SIGNAL data_tx       : STD_LOGIC_VECTOR(7 DOWNTO 0);   --latched in data to write to slave
  SIGNAL data_rx       : STD_LOGIC_VECTOR(7 DOWNTO 0);   --data received from slave
  SIGNAL bit_cnt       : INTEGER RANGE 0 TO 7 := 7;      --tracks bit number in transaction
  SIGNAL stretch       : STD_LOGIC := '0';               --identifies if slave is stretching scl
  signal addr      :    STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
  signal sample : std_logic_vector(15 downto 0) := (others=> '0');
  signal rw : std_logic := '0';
  --signal data_rd : std_logic_vector(7 downto 0) := "00000000";
  --signal data_ready, ack_error, busy : std_logic;
  
   signal sda_in, sda_out, sda_ctl : std_logic;
   signal scl_in, scl_out, scl_ctl : std_logic;
BEGIN

debug(7 downto 2) <= "000000";
debug(0) <= scl_ena;
debug(1) <= scl_clk;

  --generate the timing for the bus clock (scl_clk) and the data clock (data_clk)
  PROCESS(clk, reset_n)
    VARIABLE count  :  INTEGER RANGE 0 TO divider*4;  --timing for clock generation
  BEGIN
--    IF(reset_n = '0') THEN                --reset asserted
      stretch <= '0';
--      count := 0;
--    ELSIF(clk'EVENT AND clk = '1') THEN
    IF(clk'EVENT AND clk = '1') THEN
      data_clk_prev <= data_clk;          --store previous value of data clock
      IF(count = divider*4-1) THEN        --end of timing cycle
        count := 0;                       --reset timer
      ELSE           --clock stretching from slave not detected
        count := count + 1;               --continue clock generation timing
      END IF;
      CASE count IS
        WHEN 0 TO divider-1 =>            --first 1/4 cycle of clocking
          scl_clk <= '0';
          data_clk <= '0';
        WHEN divider TO divider*2-1 =>    --second 1/4 cycle of clocking
          scl_clk <= '0';
          data_clk <= '1';
        WHEN divider*2 TO divider*3-1 =>  --third 1/4 cycle of clocking
          scl_clk <= '1';                 --release scl
--          IF(scl_in = '0') THEN              --detect if slave is stretching clock
--            stretch <= '1';
--          ELSE
--            stretch <= '0';
--          END IF;
          data_clk <= '1';
        WHEN OTHERS =>                    --last 1/4 cycle of clocking
          scl_clk <= '1';
          data_clk <= '0';
      END CASE;
    END IF;
  END PROCESS;

  --state machine and writing to sda during scl low (data_clk rising edge)
  PROCESS(clk, reset_n)
  BEGIN
    IF(reset_n = '0') THEN                 --reset asserted
      state <= ready;                      --return to initial state
      busy <= '1';                         --indicate not available
      scl_ena <= '0';                      --sets scl high impedance
      sda_int <= '1';                      --sets sda high impedance
      ack_error <= '0';                    --clear acknowledge error flag
      bit_cnt <= 7;                        --restarts data bit counter
      data_rd <= "00000000";               --clear data read port
      
      
    ELSIF(clk'EVENT AND clk = '1') THEN
      IF(data_clk = '1' AND data_clk_prev = '0') THEN  --data clock rising edge
        CASE state IS
          WHEN ready =>                      --idle state
            data_ready <= '0';
--            IF(ena = '1') THEN               --transaction requested
              busy <= '1';                   --flag busy
              addr_rw <= addr & rw;          --collect requested slave address and command
              data_tx <= "00000111";            --Read from sensor 1 0x07
              state <= start1;                --go to start bit
--            ELSE                             --remain idle
  --            busy <= '0';                   --unflag busy
   --           state <= ready;                --remain idle
   --         END IF;
            
          WHEN start1 =>                      --start bit of transaction
            busy <= '1';                     --resume busy if continuous mode
            sda_int <= addr_rw(bit_cnt);     --set first address bit to bus
            state <= command1;                --go to command
            
          WHEN command1 =>                    --address and command byte of transaction
            IF(bit_cnt = 0) THEN             --command transmit finished
              sda_int <= '1';                --release sda for slave acknowledge
              bit_cnt <= 7;                  --reset bit counter for "byte" states
              state <= slv_ack1;             --go to slave acknowledge (command)
            ELSE                             --next clock cycle of command state
              bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
              sda_int <= addr_rw(bit_cnt-1); --write address/command bit to bus
              state <= command1;              --continue with command
            END IF;
            
          WHEN slv_ack1 =>                   --slave acknowledge bit (command)
            sda_int <= data_tx(bit_cnt);   --write first bit of data
            state <= wr;                   --go to write byte
            
          WHEN wr =>                         --write byte of transaction
            busy <= '1';                     --resume busy if continuous mode
            IF(bit_cnt = 0) THEN             --write byte transmit finished
              sda_int <= '1';                --release sda for slave acknowledge
              bit_cnt <= 7;                  --reset bit counter for "byte" states
--              state <= slv_ack2;             --go to slave acknowledge (write)
              state <= start2;                   --continue writing
               addr_rw <= addr & '1';          --collect requested slave address and command
           ELSE                             --next clock cycle of write state
              bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
              sda_int <= data_tx(bit_cnt-1); --write next bit to bus
              state <= wr;                   --continue writing
            END IF;
          
          WHEN slv_ack2 =>                   --slave acknowledge bit (write)
--            IF(ena = '1') THEN               --continue transaction
              busy <= '0';                   --continue is accepted
              state <= start2;              --go to repeated start
--            ELSE                             --complete transaction
--              state <= stop;                 --go to stop bit
--            END IF;
		
		  WHEN start2 =>                      --start bit of transaction
            busy <= '1';                     --resume busy if continuous mode
            sda_int <= addr_rw(bit_cnt);     --set first address bit to bus
            state <= command2;                --go to command
          WHEN command2 =>                    --address and command byte of transaction
            IF(bit_cnt = 0) THEN             --command transmit finished
              sda_int <= '1';                --release sda for slave acknowledge
              bit_cnt <= 7;                  --reset bit counter for "byte" states
              state <= slv_ack3;             --go to slave acknowledge (command)
            ELSE                             --next clock cycle of command state
              bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
              sda_int <= addr_rw(bit_cnt-1); --write address/command bit to bus
              state <= command2;              --continue with command
            END IF;
          WHEN slv_ack3 =>                   --slave acknowledge bit (command)
            sda_int <= '1';                --release sda from incoming data
            state <= rd1;                   --go to read byte

		
		
		  WHEN rd1 =>                         --read byte of transaction
            busy <= '1';                     --resume busy if continuous mode
            IF(bit_cnt = 0) THEN             --read byte receive finished
              sda_int <= '0';              --acknowledge the byte has been received
              bit_cnt <= 7;                  --reset bit counter for "byte" states
              sample(7 downto 0) <= data_rx;            --output received data
                
--                data_rd <= data_rx;

              state <= mstr_ack1;             --go to master acknowledge
            ELSE                             --next clock cycle of read state
              bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
              state <= rd1;                   --continue reading
            END IF;
          WHEN mstr_ack1 =>                   --master acknowledge bit after a read
--            IF(ena = '1') THEN               --continue transaction
              busy <= '0';                   --continue is accepted and data received is available on bus
			  sda_int <= '1';              --release sda from incoming data
              state <= rd2;                 --go to read byte
--            ELSE                             --complete transaction
--              state <= stop;                 --go to stop bit
--            END IF;
			
		  WHEN rd2 =>                         --read byte of transaction
            busy <= '1';                     --resume busy if continuous mode
            IF(bit_cnt = 0) THEN             --read byte receive finished
              sda_int <= '0';              --acknowledge the byte has been received
              bit_cnt <= 7;                  --reset bit counter for "byte" states
              sample(15 downto 8) <= data_rx;            --output received data

--              data_rd <= data_rx;

              state <= mstr_ack2;             --go to master acknowledge
            ELSE                             --next clock cycle of read state
              bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
              state <= rd2;                   --continue reading
            END IF;
          WHEN mstr_ack2 =>                   --master acknowledge bit after a read
--            IF(ena = '1') THEN               --continue transaction
              busy <= '0';                   --continue is accepted and data received is available on bus
			  sda_int <= '1';              --release sda from incoming data
              state <= rd3;                 --go to read byte
--            ELSE                             --complete transaction
--              state <= stop;                 --go to stop bit
--            END IF;
			
			WHEN rd3 =>                         --read byte of transaction
            busy <= '1';                     --resume busy if continuous mode
            IF(bit_cnt = 0) THEN             --read byte receive finished
              sda_int <= '1';              --send a no-acknowledge (before stop or repeated start)
              bit_cnt <= 7;                  --reset bit counter for "byte" states
              data_rd <= data_rx;            --output received data
              state <= mstr_ack3;             --go to master acknowledge
            ELSE                             --next clock cycle of read state
              bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
              state <= rd3;                   --continue reading
            END IF;
          WHEN mstr_ack3 =>                   --master acknowledge bit after a read
            state <= stop;                 --go to stop bit
		
          WHEN stop =>                       --stop bit of transaction
            busy <= '0';                     --unflag busy
            state <= hold;                  --go to idle state
			data_ready <= '1';				--Set the data_ready flag
			samp <= sample;
			
			
		  WHEN hold =>
--            if(data_done = '0') then
--                state <= hold;
                
--            else
                state <= ready;
--            end if;
        when others=>
            state <= ready;
        END CASE;   
		
      ELSIF(data_clk = '0' AND data_clk_prev = '1') THEN  --data clock falling edge
        CASE state IS
          WHEN start1 =>                  
            IF(scl_ena = '0') THEN                  --starting new transaction
              scl_ena <= '1';                       --enable scl output
              ack_error <= '0';                     --reset acknowledge error output
            END IF;
		  WHEN start2 =>                  
            IF(scl_ena = '0') THEN                  --starting new transaction
              scl_ena <= '1';                       --enable scl output
              ack_error <= '0';                     --reset acknowledge error output
            END IF;
          WHEN slv_ack1 =>                          --receiving slave acknowledge (command)
            IF(sda_in /= '0' ) THEN  --no-acknowledge or previous no-acknowledge
              ack_error <= '1';                     --set error output if no-acknowledge
            END IF;
          WHEN rd1 =>                                --receiving slave data
            data_rx(bit_cnt) <= sda_in;                --receive current slave data bit
		  WHEN rd2 =>                                --receiving slave data
            data_rx(bit_cnt) <= sda_in;                --receive current slave data bit
		  WHEN rd3 =>                                --receiving slave data
            data_rx(bit_cnt) <= sda_in;                --receive current slave data bit
          WHEN slv_ack2 =>                          --receiving slave acknowledge (write)
            IF(sda_in /= '0') THEN  --no-acknowledge or previous no-acknowledge
              ack_error <= '1';                     --set error output if no-acknowledge
            END IF;
          WHEN slv_ack3 =>                          --receiving slave acknowledge (write)
            IF(sda_in /= '0') THEN  --no-acknowledge or previous no-acknowledge
              ack_error <= '1';                     --set error output if no-acknowledge
            END IF;
          WHEN stop =>
            scl_ena <= '0';                         --disable scl
          WHEN OTHERS =>
            NULL;
        END CASE;
      END IF;
    END IF;
  END PROCESS;  

  --set sda output
  WITH state SELECT
    sda_ena_n <= data_clk_prev WHEN start1,     --generate start condition
                 NOT data_clk_prev WHEN stop,  --generate stop condition
                 sda_int WHEN OTHERS;          --set to internal sda signal    
      
  --set scl and sda outputs
--  scl <= '0' WHEN (scl_ena = '1' AND scl_clk = '0') ELSE 'Z';
--  sda <= '0' WHEN sda_ena_n = '0' ELSE 'Z';
--    scl_out <= '0' when scl_clk = '0' else 'Z';
    scl_out <= scl_clk;
--    scl_ctl <= scl_clk or not scl_ena; -- if ctl is high this is a high-z input
    scl_ctl <= scl_clk or not scl_ena; -- if ctl is high this is a high-z input
  
--  sda <= '0' WHEN sda_ena_n = '0' ELSE 'Z';
    sda_out <= '0';
    sda_ctl <= sda_ena_n;
  
IOBUF_scl : IOBUF
generic map(
DRIVE => 12,
IOSTANDARD => "LVCMOS33",
SLEW => "SLOW")
port map(O => scl_in, --Bufferoutput
IO => scl, --Bufferinoutport(connectdirectlytotop-levelport)
I => scl_out, --Bufferinput
T => scl_ctl --3-stateenableinput,high=input,low=output
);

IOBUF_sda : IOBUF
generic map(
DRIVE => 12,
IOSTANDARD => "LVCMOS33",
SLEW => "SLOW")
port map(O => sda_in, --Bufferoutput
IO => sda, --Bufferinoutport(connectdirectlytotop-levelport)
I => sda_out, --Bufferinput
T => sda_ctl --3-stateenableinput,high=input,low=output
);

  
END logic;