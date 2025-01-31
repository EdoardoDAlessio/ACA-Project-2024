// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:ai_pl:1.0
// IP Revision: 6

(* X_CORE_INFO = "ai_pl_v1_0_6_ai_pl,Vivado 2022.2.2" *)
(* CHECK_LICENSE_TYPE = "bd_9d54_pl_ai_ch_1_0,ai_pl_v1_0_6_ai_pl,{}" *)
(* CORE_GENERATION_INFO = "bd_9d54_pl_ai_ch_1_0,ai_pl_v1_0_6_ai_pl,{x_ipProduct=Vivado 2022.2.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=ai_pl,x_ipVersion=1.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_CORE_NAME=ai_pl_ch_0,C_M_AXIS_TDATA_WIDTH=64,C_PL_INTF_MODE=0,C_S_AXIS_TDATA_WIDTH=32,C_BLI_BYPASS=0,C_M_MODE128=0,C_S_MODE128=0,C_AIE_MODE=0,C_M_AXIS_FIFO_TYPE=0,C_S_AXIS_FIFO_TYPE=0,C_S_AUTO_PIPELINE=0,C_M_AUTO_PIPELINE=0}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_9d54_pl_ai_ch_1_0 (
  to_aie,
  s_axis_tdata,
  s_axis_tlast,
  s_axis_tvalid,
  s_axis_tready,
  s_axis_aclk
);

output wire [0 : 0] to_aie;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *)
input wire [31 : 0] s_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
input wire s_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
input wire s_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 299996999, PHASE 0.0, CLK_DOMAIN cd_aclk_kernel_00, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
output wire s_axis_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_CLK, ASSOCIATED_BUSIF S_AXIS, FREQ_HZ 299996999, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN cd_aclk_kernel_00, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_CLK CLK" *)
input wire s_axis_aclk;

  ai_pl_v1_0_6_ai_pl #(
    .C_CORE_NAME("ai_pl_ch_0"),  // Name of the core instance
    .C_M_AXIS_TDATA_WIDTH(64),  // Width of s_axis address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
    .C_PL_INTF_MODE(0),
    .C_S_AXIS_TDATA_WIDTH(32),  // AXI4Stream sink: Data Width
    .C_BLI_BYPASS(0),
    .C_M_MODE128(0),
    .C_S_MODE128(0),
    .C_AIE_MODE(0),
    .C_M_AXIS_FIFO_TYPE(0),
    .C_S_AXIS_FIFO_TYPE(0),
    .C_S_AUTO_PIPELINE(0),
    .C_M_AUTO_PIPELINE(0)
  ) inst (
    .m_axis_tdata(),
    .m_axis_tkeep(),
    .m_axis_tlast(),
    .m_axis_tvalid(),
    .m_axis_tready(1'B0),
    .m_axis_aclk(1'B0),
    .from_aie(1'B0),
    .to_aie(to_aie),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tkeep(4'HF),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .s_axis_aclk(s_axis_aclk),
    .m_mefromcore_0(67'B0),
    .m_mefromcore_1(67'B0),
    .s_mefromcore_0(1'B0),
    .s_mefromcore_1(1'B0),
    .m_metocore_0(),
    .m_metocore_1(),
    .s_metocore_0(),
    .s_metocore_1()
  );
endmodule
