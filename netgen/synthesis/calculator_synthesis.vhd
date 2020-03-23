--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: calculator_synthesis.vhd
-- /___/   /\     Timestamp: MON 23 MAR 11:40:26 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm calculator -w -dir netgen/synthesis -ofmt vhdl -sim calculator.ngc calculator_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: calculator.ngc
-- Output file	: D:\abDATA\PLD\calculator\netgen\synthesis\calculator_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: calculator
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity calculator is
  port (
    result : out STD_LOGIC_VECTOR ( 4 downto 0 ); 
    n1 : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    n2 : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    ope : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end calculator;

architecture Structure of calculator is
  signal n1_0_IBUF_6 : STD_LOGIC; 
  signal n1_1_IBUF_7 : STD_LOGIC; 
  signal n1_2_IBUF_8 : STD_LOGIC; 
  signal n1_3_IBUF_9 : STD_LOGIC; 
  signal n2_0_IBUF_14 : STD_LOGIC; 
  signal n2_1_IBUF_15 : STD_LOGIC; 
  signal n2_2_IBUF_16 : STD_LOGIC; 
  signal n2_3_IBUF_17 : STD_LOGIC; 
  signal result_0_OBUF_23 : STD_LOGIC; 
  signal result_1_OBUF_24 : STD_LOGIC; 
  signal result_2_OBUF_25 : STD_LOGIC; 
  signal result_3_OBUF_26 : STD_LOGIC; 
  signal result_4_OBUF_27 : STD_LOGIC; 
  signal Inst_fulladder_4_Inst_fulladder_3_t_r : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal Inst_fulladder_4_t_result : STD_LOGIC_VECTOR ( 3 downto 3 ); 
begin
  Inst_fulladder_4_Inst_fulladder_3_Inst_fulladder_2_fulladder_1_ha0_Mxor_S_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => n2_0_IBUF_14,
      I1 => n1_0_IBUF_6,
      O => result_0_OBUF_23
    );
  Inst_fulladder_4_Inst_fulladder_3_Inst_fulladder_2_fulladder_2_ha1_Mxor_S_Result1 : LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      I0 => n2_1_IBUF_15,
      I1 => n1_1_IBUF_7,
      I2 => n1_0_IBUF_6,
      I3 => n2_0_IBUF_14,
      O => result_1_OBUF_24
    );
  Inst_fulladder_4_Inst_fulladder_3_Inst_fulladder_ha1_Mxor_S_Result1 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => Inst_fulladder_4_Inst_fulladder_3_t_r(2),
      I1 => n1_2_IBUF_8,
      I2 => n2_2_IBUF_16,
      O => result_2_OBUF_25
    );
  Inst_fulladder_4_Inst_fulladder_3_Inst_fulladder_Cout1 : LUT3
    generic map(
      INIT => X"E8"
    )
    port map (
      I0 => n1_2_IBUF_8,
      I1 => n2_2_IBUF_16,
      I2 => Inst_fulladder_4_Inst_fulladder_3_t_r(2),
      O => Inst_fulladder_4_t_result(3)
    );
  Inst_fulladder_4_Inst_fulladder_Cout1 : LUT3
    generic map(
      INIT => X"E8"
    )
    port map (
      I0 => n1_3_IBUF_9,
      I1 => n2_3_IBUF_17,
      I2 => Inst_fulladder_4_t_result(3),
      O => result_4_OBUF_27
    );
  Inst_fulladder_4_Inst_fulladder_ha1_Mxor_S_Result1 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => Inst_fulladder_4_t_result(3),
      I1 => n1_3_IBUF_9,
      I2 => n2_3_IBUF_17,
      O => result_3_OBUF_26
    );
  Inst_fulladder_4_Inst_fulladder_3_Inst_fulladder_2_fulladder_2_Cout1 : LUT4
    generic map(
      INIT => X"EA80"
    )
    port map (
      I0 => n1_1_IBUF_7,
      I1 => n1_0_IBUF_6,
      I2 => n2_0_IBUF_14,
      I3 => n2_1_IBUF_15,
      O => Inst_fulladder_4_Inst_fulladder_3_t_r(2)
    );
  n1_3_IBUF : IBUF
    port map (
      I => n1(3),
      O => n1_3_IBUF_9
    );
  n1_2_IBUF : IBUF
    port map (
      I => n1(2),
      O => n1_2_IBUF_8
    );
  n1_1_IBUF : IBUF
    port map (
      I => n1(1),
      O => n1_1_IBUF_7
    );
  n1_0_IBUF : IBUF
    port map (
      I => n1(0),
      O => n1_0_IBUF_6
    );
  n2_3_IBUF : IBUF
    port map (
      I => n2(3),
      O => n2_3_IBUF_17
    );
  n2_2_IBUF : IBUF
    port map (
      I => n2(2),
      O => n2_2_IBUF_16
    );
  n2_1_IBUF : IBUF
    port map (
      I => n2(1),
      O => n2_1_IBUF_15
    );
  n2_0_IBUF : IBUF
    port map (
      I => n2(0),
      O => n2_0_IBUF_14
    );
  result_4_OBUF : OBUF
    port map (
      I => result_4_OBUF_27,
      O => result(4)
    );
  result_3_OBUF : OBUF
    port map (
      I => result_3_OBUF_26,
      O => result(3)
    );
  result_2_OBUF : OBUF
    port map (
      I => result_2_OBUF_25,
      O => result(2)
    );
  result_1_OBUF : OBUF
    port map (
      I => result_1_OBUF_24,
      O => result(1)
    );
  result_0_OBUF : OBUF
    port map (
      I => result_0_OBUF_23,
      O => result(0)
    );

end Structure;

