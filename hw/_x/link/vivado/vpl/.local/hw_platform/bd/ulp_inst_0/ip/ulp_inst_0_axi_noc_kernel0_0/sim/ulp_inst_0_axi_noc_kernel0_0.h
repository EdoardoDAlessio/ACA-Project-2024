#ifndef IP_ULP_INST_0_AXI_NOC_KERNEL0_0_H_
#define IP_ULP_INST_0_AXI_NOC_KERNEL0_0_H_

// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
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


#ifndef XTLM
#include "xtlm.h"
#endif
#ifndef SYSTEMC_INCLUDED
#include <systemc>
#endif

#if defined(_MSC_VER)
#define DllExport __declspec(dllexport)
#elif defined(__GNUC__)
#define DllExport __attribute__ ((visibility("default")))
#else
#define DllExport
#endif

#include "ulp_inst_0_axi_noc_kernel0_0_sc.h"




#ifdef XILINX_SIMULATOR
class DllExport ulp_inst_0_axi_noc_kernel0_0 : public ulp_inst_0_axi_noc_kernel0_0_sc
{
public:

  ulp_inst_0_axi_noc_kernel0_0(const sc_core::sc_module_name& nm);
  virtual ~ulp_inst_0_axi_noc_kernel0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< sc_dt::sc_bv<1> > M00_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M01_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M02_INI_internoc;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


};
#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
class DllExport ulp_inst_0_axi_noc_kernel0_0 : public ulp_inst_0_axi_noc_kernel0_0_sc
{
public:

  ulp_inst_0_axi_noc_kernel0_0(const sc_core::sc_module_name& nm);
  virtual ~ulp_inst_0_axi_noc_kernel0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< sc_dt::sc_bv<1> > M00_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M01_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M02_INI_internoc;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


};
#endif // XM_SYSTEMC




#ifdef RIVIERA
class DllExport ulp_inst_0_axi_noc_kernel0_0 : public ulp_inst_0_axi_noc_kernel0_0_sc
{
public:

  ulp_inst_0_axi_noc_kernel0_0(const sc_core::sc_module_name& nm);
  virtual ~ulp_inst_0_axi_noc_kernel0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< sc_dt::sc_bv<1> > M00_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M01_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M02_INI_internoc;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


};
#endif // RIVIERA




#ifdef VCSSYSTEMC
class DllExport ulp_inst_0_axi_noc_kernel0_0 : public ulp_inst_0_axi_noc_kernel0_0_sc
{
public:

  ulp_inst_0_axi_noc_kernel0_0(const sc_core::sc_module_name& nm);
  virtual ~ulp_inst_0_axi_noc_kernel0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< sc_dt::sc_bv<1> > M00_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M01_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M02_INI_internoc;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


  // Transactor stubs

  // Socket stubs

};
#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
class DllExport ulp_inst_0_axi_noc_kernel0_0 : public ulp_inst_0_axi_noc_kernel0_0_sc
{
public:

  ulp_inst_0_axi_noc_kernel0_0(const sc_core::sc_module_name& nm);
  virtual ~ulp_inst_0_axi_noc_kernel0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< sc_dt::sc_bv<1> > M00_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M01_INI_internoc;
  sc_core::sc_out< sc_dt::sc_bv<1> > M02_INI_internoc;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


  // Transactor stubs

  // Socket stubs

};
#endif // MTI_SYSTEMC
#endif // IP_ULP_INST_0_AXI_NOC_KERNEL0_0_H_
