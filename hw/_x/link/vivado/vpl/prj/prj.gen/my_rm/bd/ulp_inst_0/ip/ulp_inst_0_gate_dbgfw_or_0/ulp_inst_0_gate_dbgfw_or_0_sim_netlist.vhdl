-- Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
-- Date        : Sun Jun 30 17:52:52 2024
-- Host        : nags27 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_gate_dbgfw_or_0/ulp_inst_0_gate_dbgfw_or_0_sim_netlist.vhdl
-- Design      : ulp_inst_0_gate_dbgfw_or_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvc1902-vsvd1760-2MP-e-S
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ulp_inst_0_gate_dbgfw_or_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ulp_inst_0_gate_dbgfw_or_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ulp_inst_0_gate_dbgfw_or_0 : entity is "ulp_inst_0_gate_dbgfw_or_0,util_vector_logic_v2_0_2_util_vector_logic,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ulp_inst_0_gate_dbgfw_or_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ulp_inst_0_gate_dbgfw_or_0 : entity is "util_vector_logic_v2_0_2_util_vector_logic,Vivado 2022.2";
end ulp_inst_0_gate_dbgfw_or_0;

architecture STRUCTURE of ulp_inst_0_gate_dbgfw_or_0 is
begin
\Res[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Op1(0),
      I1 => Op2(0),
      O => Res(0)
    );
end STRUCTURE;
