--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: fulladder_synthesis.vhd
-- /___/   /\     Timestamp: THU 19 MAR 9:29:12 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm fulladder -w -dir netgen/synthesis -ofmt vhdl -sim fulladder.ngc fulladder_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: fulladder.ngc
-- Output file	: D:\abDATA\PLD\calculator\netgen\synthesis\fulladder_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: fulladder
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

entity fulladder is
  port (
    Cout : out STD_LOGIC; 
    A : in STD_LOGIC := 'X'; 
    B : in STD_LOGIC := 'X'; 
    C : in STD_LOGIC := 'X'; 
    S : out STD_LOGIC 
  );
end fulladder;

architecture Structure of fulladder is
  signal A_IBUF_1 : STD_LOGIC; 
  signal B_IBUF_3 : STD_LOGIC; 
  signal C_IBUF_5 : STD_LOGIC; 
  signal Cout_OBUF_7 : STD_LOGIC; 
  signal S_OBUF_9 : STD_LOGIC; 
begin
  Cout1 : LUT3
    generic map(
      INIT => X"E8"
    )
    port map (
      I0 => B_IBUF_3,
      I1 => C_IBUF_5,
      I2 => A_IBUF_1,
      O => Cout_OBUF_7
    );
  ha1_Mxor_S_Result1 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => A_IBUF_1,
      I1 => B_IBUF_3,
      I2 => C_IBUF_5,
      O => S_OBUF_9
    );
  A_IBUF : IBUF
    port map (
      I => A,
      O => A_IBUF_1
    );
  B_IBUF : IBUF
    port map (
      I => B,
      O => B_IBUF_3
    );
  C_IBUF : IBUF
    port map (
      I => C,
      O => C_IBUF_5
    );
  Cout_OBUF : OBUF
    port map (
      I => Cout_OBUF_7,
      O => Cout
    );
  S_OBUF : OBUF
    port map (
      I => S_OBUF_9,
      O => S
    );

end Structure;

