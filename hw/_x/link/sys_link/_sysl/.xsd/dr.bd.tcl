

#---------------------------
# Constant blocks
#---------------------------

#---------------------------
# Platform Parameters for gen4x8_qdma_2
#---------------------------
set axi_ic_user [get_bd_cell /axi_ic_user]
    
set_property -dict [ list \
  CONFIG.NUM_SI 1 \
  CONFIG.NUM_MI 4 \
  CONFIG.NUM_CLKS 2 \
  ] $axi_ic_user
set axi_ic_user_extend [get_bd_cell /axi_ic_user_extend]
    
set_property -dict [ list \
  CONFIG.NUM_SI 1 \
  CONFIG.NUM_MI 1 \
  CONFIG.NUM_CLKS 1 \
  ] $axi_ic_user_extend
set axi_noc_kernel0 [get_bd_cell /axi_noc_kernel0]
    
set_property -dict [ list \
  CONFIG.NUM_SI 3 \
  CONFIG.NUM_MI 0 \
  ] $axi_noc_kernel0
set axi_sc_plram [get_bd_cell /axi_sc_plram]
    
set_property -dict [ list \
  CONFIG.NUM_SI 1 \
  CONFIG.NUM_MI 1 \
  CONFIG.NUM_CLKS 2 \
  ] $axi_sc_plram

#---------------------------
# Registering ai_engine_0
#---------------------------
set ai_engine_0 [get_bd_cells /ai_engine_0]
  
set_property -dict [ list  \
  CONFIG.NUM_MI_AXIS {1} \
  CONFIG.NUM_SI_AXIS {2} \
  CONFIG.NUM_MI_AXI {0} \
  CONFIG.NUM_CLKS {1}  ] $ai_engine_0

set_property -dict [ list  \
  CONFIG.TDATA_NUM_BYTES {4} \
  CONFIG.IS_REGISTERED {true} \
  HDL_ATTRIBUTE.ME_ANNOTATION {in_plio_1} ] [ get_bd_intf_pins $ai_engine_0/S00_AXIS]

set_property -dict [ list  \
  CONFIG.TDATA_NUM_BYTES {4} \
  CONFIG.IS_REGISTERED {true} \
  HDL_ATTRIBUTE.ME_ANNOTATION {in_plio_2} ] [ get_bd_intf_pins $ai_engine_0/S01_AXIS]

set_property -dict [ list  \
  CONFIG.TDATA_NUM_BYTES {4} \
  CONFIG.IS_REGISTERED {true} \
  HDL_ATTRIBUTE.ME_ANNOTATION {out_plio_1} ] [ get_bd_intf_pins $ai_engine_0/M00_AXIS]

set_property -dict [ list  \
  CONFIG.ASSOCIATED_BUSIF {} ] [ get_bd_pins $ai_engine_0/aclk0]


#---------------------------
# Instantiating setup_aie_0
#---------------------------
set setup_aie_0 [create_bd_cell -type ip -vlnv xilinx.com:hls:setup_aie:1.0 setup_aie_0]
  
set_property -dict [ list  \
  CONFIG.SLR_ASSIGNMENTS {SLR0}  ] $setup_aie_0


#---------------------------
# Instantiating setup_aie_1
#---------------------------
set setup_aie_1 [create_bd_cell -type ip -vlnv xilinx.com:hls:setup_aie:1.0 setup_aie_1]
  
set_property -dict [ list  \
  CONFIG.SLR_ASSIGNMENTS {SLR0}  ] $setup_aie_1


#---------------------------
# Instantiating sink_from_aie_0
#---------------------------
set sink_from_aie_0 [create_bd_cell -type ip -vlnv xilinx.com:hls:sink_from_aie:1.0 sink_from_aie_0]
  
set_property -dict [ list  \
  CONFIG.SLR_ASSIGNMENTS {SLR0}  ] $sink_from_aie_0


#---------------------------
# Instantiating axi_ic_axi_noc_kernel0_S00_AXI
#---------------------------
set axi_ic_axi_noc_kernel0_S00_AXI [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_ic_axi_noc_kernel0_S00_AXI]
  
set_property -dict [ list  \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1}  ] $axi_ic_axi_noc_kernel0_S00_AXI

#---------------------------
# Instantiating axi_ic_axi_noc_kernel0_S01_AXI
#---------------------------
set axi_ic_axi_noc_kernel0_S01_AXI [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_ic_axi_noc_kernel0_S01_AXI]
  
set_property -dict [ list  \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1}  ] $axi_ic_axi_noc_kernel0_S01_AXI

#---------------------------
# Instantiating dwc_setup_aie_0_s
#---------------------------
set dwc_setup_aie_0_s [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 dwc_setup_aie_0_s]
  
set_property -dict [ list  \
  CONFIG.M_TDATA_NUM_BYTES {4} \
  CONFIG.S_TDATA_NUM_BYTES {16}  ] $dwc_setup_aie_0_s

#---------------------------
# Instantiating dwc_setup_aie_1_s
#---------------------------
set dwc_setup_aie_1_s [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 dwc_setup_aie_1_s]
  
set_property -dict [ list  \
  CONFIG.M_TDATA_NUM_BYTES {4} \
  CONFIG.S_TDATA_NUM_BYTES {16}  ] $dwc_setup_aie_1_s

#---------------------------
# Instantiating kernel_interrupt_xlconcat_0_In0_1_interrupt_concat
#---------------------------
set kernel_interrupt_xlconcat_0_In0_1_interrupt_concat [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 kernel_interrupt_xlconcat_0_In0_1_interrupt_concat]
  
set_property -dict [ list  \
  CONFIG.NUM_PORTS {32}  ] $kernel_interrupt_xlconcat_0_In0_1_interrupt_concat

#---------------------------
# Instantiating irq_const_tieoff
#---------------------------
set irq_const_tieoff [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_const_tieoff]
  
set_property -dict [ list  \
  CONFIG.CONST_WIDTH {1} \
  CONFIG.CONST_VAL {0}  ] $irq_const_tieoff

#---------------------------
# Enable NoC automation
#---------------------------

set v_enable_auto_connections_in_noc_state [get_param bd.enableAutoConnectionsInNoc]
set_param bd.enableAutoConnectionsInNoc 1


#---------------------------
# Connectivity Phase 1
#---------------------------
connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_axi_noc_kernel0_S00_AXI/M00_AXI] \
  [get_bd_intf_pins -auto_enable /axi_noc_kernel0/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_axi_noc_kernel0_S01_AXI/M00_AXI] \
  [get_bd_intf_pins -auto_enable /axi_noc_kernel0/S01_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_user/M01_AXI] \
  [get_bd_intf_pins -auto_enable /setup_aie_0/s_axi_control] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /setup_aie_0/m_axi_gmem0] \
  [get_bd_intf_pins -auto_enable /axi_ic_axi_noc_kernel0_S00_AXI/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_user/M02_AXI] \
  [get_bd_intf_pins -auto_enable /setup_aie_1/s_axi_control] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /setup_aie_1/m_axi_gmem0] \
  [get_bd_intf_pins -auto_enable /axi_ic_axi_noc_kernel0_S01_AXI/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_user/M03_AXI] \
  [get_bd_intf_pins -auto_enable /sink_from_aie_0/s_axi_control] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /sink_from_aie_0/m_axi_gmem1] \
  [get_bd_intf_pins -auto_enable /axi_noc_kernel0/S02_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /ai_engine_0/M00_AXIS] \
  [get_bd_intf_pins -auto_enable /sink_from_aie_0/input_stream] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /setup_aie_0/s] \
  [get_bd_intf_pins -auto_enable /dwc_setup_aie_0_s/S_AXIS] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /dwc_setup_aie_0_s/M_AXIS] \
  [get_bd_intf_pins -auto_enable /ai_engine_0/S00_AXIS] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /setup_aie_1/s] \
  [get_bd_intf_pins -auto_enable /dwc_setup_aie_1_s/S_AXIS] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /dwc_setup_aie_1_s/M_AXIS] \
  [get_bd_intf_pins -auto_enable /ai_engine_0/S01_AXIS] \

connect_bd_net  \
  [get_bd_pins -auto_enable /blp_s_aclk_kernel_00] \
  [get_bd_pins -auto_enable /dwc_setup_aie_0_s/aclk] \
  [get_bd_pins -auto_enable /dwc_setup_aie_1_s/aclk] \
  [get_bd_pins -auto_enable /setup_aie_0/ap_clk] \
  [get_bd_pins -auto_enable /setup_aie_1/ap_clk] \
  [get_bd_pins -auto_enable /sink_from_aie_0/ap_clk] \
  [get_bd_pins -auto_enable /axi_ic_user/aclk1] \
  [get_bd_pins -auto_enable /axi_noc_kernel0/aclk0] \
  [get_bd_pins -auto_enable /ai_engine_0/aclk0] \
  [get_bd_pins -auto_enable /axi_ic_axi_noc_kernel0_S00_AXI/aclk] \
  [get_bd_pins -auto_enable /axi_ic_axi_noc_kernel0_S01_AXI/aclk] \

connect_bd_net  \
  [get_bd_pins -auto_enable /reset_controllers/reset_sync_kernel0/interconnect_aresetn] \
  [get_bd_pins -auto_enable /axi_ic_axi_noc_kernel0_S00_AXI/aresetn] \
  [get_bd_pins -auto_enable /axi_ic_axi_noc_kernel0_S01_AXI/aresetn] \
  [get_bd_pins -auto_enable /dwc_setup_aie_0_s/aresetn] \
  [get_bd_pins -auto_enable /dwc_setup_aie_1_s/aresetn] \

connect_bd_net  \
  [get_bd_pins -auto_enable /reset_controllers/reset_sync_kernel0/peripheral_aresetn] \
  [get_bd_pins -auto_enable /setup_aie_0/ap_rst_n] \
  [get_bd_pins -auto_enable /setup_aie_1/ap_rst_n] \
  [get_bd_pins -auto_enable /sink_from_aie_0/ap_rst_n] \

connect_bd_net  \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/dout] \
  [get_bd_pins -auto_enable /kernel_interrupt/xlconcat_0/In0] \

connect_bd_net  \
  [get_bd_pins -auto_enable /setup_aie_0/interrupt] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In1] \

connect_bd_net  \
  [get_bd_pins -auto_enable /setup_aie_1/interrupt] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In0] \

connect_bd_net  \
  [get_bd_pins -auto_enable /sink_from_aie_0/interrupt] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In2] \

connect_bd_net  \
  [get_bd_pins -auto_enable /irq_const_tieoff/dout] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In3] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In4] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In5] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In6] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In7] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In8] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In9] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In10] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In11] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In12] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In13] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In14] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In15] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In16] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In17] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In18] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In19] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In20] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In21] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In22] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In23] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In24] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In25] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In26] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In27] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In28] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In29] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In30] \
  [get_bd_pins -auto_enable /kernel_interrupt_xlconcat_0_In0_1_interrupt_concat/In31] \


#---------------------------
# Platform Interface Parameters for gen4x8_qdma_2
#---------------------------
set_property -dict [ list  \
  CONFIG.CONNECTIONS [dict create M00_INI [concat read_bw \{918\} write_bw \{861\} read_avg_burst \{4\} write_avg_burst \{4\}]] ] [ get_bd_intf_pins axi_noc_kernel0/S00_AXI]

set_property -dict [ list  \
  CONFIG.CONNECTIONS [dict create M01_INI [concat read_bw \{918\} write_bw \{861\} read_avg_burst \{4\} write_avg_burst \{4\}]] ] [ get_bd_intf_pins axi_noc_kernel0/S01_AXI]

set_property -dict [ list  \
  CONFIG.CONNECTIONS [dict create M02_INI [concat read_bw \{918\} write_bw \{861\} read_avg_burst \{4\} write_avg_burst \{4\}]] ] [ get_bd_intf_pins axi_noc_kernel0/S02_AXI]

set_property -dict [ list  \
  CONFIG.ASSOCIATED_BUSIF {S00_AXI:S01_AXI} ] [ get_bd_pins axi_noc_kernel0/aclk0]


#---------------------------
# Disable NoC automation
#---------------------------

set_param bd.enableAutoConnectionsInNoc $v_enable_auto_connections_in_noc_state


#---------------------------
# Connectivity Phase 2
#---------------------------

#---------------------------
# Import AI Engine archive
#---------------------------

bd::util_cmd set_aie_archive ${aie_archive}

#---------------------------
# Create Stream Map file
#---------------------------
set stream_subsystems [get_bd_cells * -hierarchical -quiet -filter {VLNV =~ "*:*:sdx_stream_subsystem:*"}]
if {[string length $stream_subsystems] > 0} {    
  set xmlFile $vpl_output_dir/qdma_stream_map.xml
  set fp [open ${xmlFile} w]
  puts $fp "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
  puts $fp "<xd:streamMap xmlns:xd=\"http://www.xilinx.com/xd\">"
  foreach streamSS [get_bd_cells * -hierarchical -quiet -filter {VLNV =~ "*:*:sdx_stream_subsystem:*"}] {
    set ssInstance [string trimleft $streamSS /]
    set ssRegion [get_property CONFIG.SLR_ASSIGNMENTS $streamSS]
    foreach ssIntf [get_bd_intf_pins $streamSS/* -quiet -filter {NAME=~"S??_AXIS"}] {
      set pinName [get_property NAME $ssIntf]
      set routeId [sdx_stream_subsystem::get_routeid $ssIntf]
      set flowId [sdx_stream_subsystem::get_flowid $ssIntf]
      puts $fp "  <xd:streamRoute xd:instanceRef=\"$ssInstance\" xd:portRef=\"$pinName\" xd:route=\"$routeId\" xd:flow=\"$flowId\" xd:region=\"$ssRegion\">"
      foreach connection [find_bd_objs -relation connected_to $ssIntf -thru_hier] {
        set connectedRegion [get_property CONFIG.SLR_ASSIGNMENTS [bd::utils::get_parent $connection]]
        set connectedPort [bd::utils::get_short_name $connection]
        set connectedInst [string trimleft [bd::utils::get_parent $connection] /]
        puts $fp "    <xd:connection xd:instanceRef=\"$connectedInst\" xd:portRef=\"$connectedPort\" xd:region=\"$connectedRegion\"/>"
      }
      puts $fp "  </xd:streamRoute>"
    }
    foreach ssIntf [get_bd_intf_pins $streamSS/* -quiet -filter {NAME=~"M??_AXIS"}] {
      set pinName [get_property NAME $ssIntf]
      set routeId [sdx_stream_subsystem::get_routeid $ssIntf]
      set flowId [sdx_stream_subsystem::get_flowid $ssIntf]
      puts $fp "  <xd:streamRoute xd:instanceRef=\"$ssInstance\" xd:portRef=\"$pinName\" xd:route=\"$routeId\" xd:flow=\"$flowId\" xd:region=\"$ssRegion\">"
      foreach connection [find_bd_objs -relation connected_to $ssIntf -thru_hier] {
        set connectedRegion [get_property CONFIG.SLR_ASSIGNMENTS [bd::utils::get_parent $connection]]
        set connectedPort [bd::utils::get_short_name $connection]
        set connectedInst [string trimleft [bd::utils::get_parent $connection] /]
        puts $fp "    <xd:connection xd:instanceRef=\"$connectedInst\" xd:portRef=\"$connectedPort\" xd:region=\"$connectedRegion\"/>"
      }
      puts $fp "  </xd:streamRoute>"
    }
  }
  puts $fp "</xd:streamMap>"
  close $fp
}


