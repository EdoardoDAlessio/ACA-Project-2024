# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
namespace eval ::optrace {
  variable script "/home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.runs/impl_1/top_wrapper.tcl"
  variable category "vivado_impl"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    } elseif { [info exist ::env(HOST)] } {
      set host $::env(HOST)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
OPTRACE "impl_1" END { }
}


OPTRACE "impl_1" START { ROLLUP_1 }
# used by v++ flow only
set is_post_route_phys_opt_enabled 0

OPTRACE "Phase: Init Design" START { ROLLUP_AUTO }
start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
OPTRACE "Design Initialization: pre hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_pre.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_pre.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_pre.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_pre.tcl failed"
    }
    return -code error
  }
OPTRACE "Design Initialization: pre hook" END { }
  set_param project.ensureVersalHasCIPS 0
  set_param project.loadTopLevelOOCConstrs 1
  set_param project.enablePRFlowIPI 1
  set_param compiler.enablePerformanceTrace 1
  set_param project.enableUnifiedNOCFlow 0
  set_param project.gatelevelSubdesign 1
  set_param hd.Visual 0
  set_param bd.debug_profile.script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/.local/debug_profile_automation.tcl
  set_param chipscope.maxJobs 7
  set_param bd.enableAutoConnectionsInNoc 1
  set_param ips.enableSLRParameter 4
  set_param bd.ForceAppCoreUpgrade 1
  set_param place.ultrathreadsUsed 0
  set_param bd.enable_dpa 1
OPTRACE "create in-memory project" START { }
  create_project -in_memory -part xcvc1902-vsvd1760-2MP-e-S
  set_property board_part_repo_paths {/home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/.local/hw_platform/board} [current_project]
  set_property board_part xilinx.com:vck5000:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
OPTRACE "create in-memory project" END { }
OPTRACE "set parameters" START { }
  set_property webtalk.parent_dir /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.cache/wt [current_project]
  set_property tool_flow SDx [current_project]
  set_property parent.project_path /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.xpr [current_project]
  set_property ip_repo_paths {
  /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/int/xo/ip_repo/xilinx_com_hls_sink_from_aie_1_0
  /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/int/xo/ip_repo/xilinx_com_hls_setup_aie_1_0
  /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/.local/hw_platform/iprepo
  /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/.local/hw_platform/ipcache
  /home/xilinx/software/Vitis/2022.2/data/ip
} [current_project]
  update_ip_catalog
  set_property ip_output_repo /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/.ipcache [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
OPTRACE "set parameters" END { }
OPTRACE "add files" START { }
  add_files -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/.local/hw_platform/xilinx_vck5000_gen4x8_qdma_2_202220_1_bb_locked.dcp
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_dwc_setup_aie_1_s_0/ulp_inst_0_dwc_setup_aie_1_s_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_setup_aie_0_0/ulp_inst_0_setup_aie_0_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_ip_pipe_ext_tog_kernel_00_null_0/ulp_inst_0_ip_pipe_ext_tog_kernel_00_null_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_ip_pipe_dbg_hub_fw_00_0/ulp_inst_0_ip_pipe_dbg_hub_fw_00_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_gpio_null_user_0/ulp_inst_0_axi_gpio_null_user_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_ic_axi_noc_kernel0_S00_AXI_0/ulp_inst_0_axi_ic_axi_noc_kernel0_S00_AXI_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_setup_aie_1_0/ulp_inst_0_setup_aie_1_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_noc_kernel0_0/ulp_inst_0_axi_noc_kernel0_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_plram_ctrl_bram_0/ulp_inst_0_plram_ctrl_bram_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_sc_plram_0/ulp_inst_0_axi_sc_plram_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_ic_axi_noc_kernel0_S01_AXI_0/ulp_inst_0_axi_ic_axi_noc_kernel0_S01_AXI_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_noc_h2c_0/ulp_inst_0_axi_noc_h2c_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_ic_user_extend_0/ulp_inst_0_axi_ic_user_extend_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_sink_from_aie_0_0/ulp_inst_0_sink_from_aie_0_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_reset_sync_fixed_0/ulp_inst_0_reset_sync_fixed_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_pipereg_kernel0_0/ulp_inst_0_pipereg_kernel0_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_reset_sync_kernel0_0/ulp_inst_0_reset_sync_kernel0_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_pipereg_pcie0_0/ulp_inst_0_pipereg_pcie0_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_gate_dbgfw_or_0/ulp_inst_0_gate_dbgfw_or_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_pipereg_pl_axi0_0/ulp_inst_0_pipereg_pl_axi0_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_plram_ctrl_0/ulp_inst_0_plram_ctrl_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_dwc_setup_aie_0_s_0/ulp_inst_0_dwc_setup_aie_0_s_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_pipereg_kernel1_0/ulp_inst_0_pipereg_kernel1_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_noc_aie_prog_0/ulp_inst_0_axi_noc_aie_prog_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_ic_user_0/ulp_inst_0_axi_ic_user_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_dbg_hub_0/ulp_inst_0_axi_dbg_hub_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_ip_pipe_ext_tog_kernel_01_null_0/ulp_inst_0_ip_pipe_ext_tog_kernel_01_null_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_axi_dbg_fw_0/ulp_inst_0_axi_dbg_fw_0.xci
  read_ip -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ip/ulp_inst_0_reset_sync_kernel1_0/ulp_inst_0_reset_sync_kernel1_0.xci
  set_param project.isImplRun true
  add_files -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.srcs/my_rm/bd/ulp_inst_0/ulp_inst_0.bd
  set_param project.isImplRun false
  add_files -quiet /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.runs/my_rm_synth_1/ulp_inst_0.dcp
  set_property SCOPED_TO_CELLS top_i/ulp [get_files /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/prj/prj.runs/my_rm_synth_1/ulp_inst_0.dcp]
OPTRACE "read constraints: implementation" START { }
  read_xdc /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/.local/hw_platform/tcl_hooks/impl.xdc
  read_xdc /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/output/dont_partition.xdc
OPTRACE "read constraints: implementation" END { }
  read_xdc -mode out_of_context -cells top_i/ulp /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/output/ulp_inst_0_ooc_copy.xdc
  set_property processing_order LATE [get_files /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/output/ulp_inst_0_ooc_copy.xdc]
OPTRACE "add files" END { }
OPTRACE "link_design" START { }
  link_design -part xcvc1902-vsvd1760-2MP-e-S -reconfig_partitions top_i/ulp 
OPTRACE "link_design" END { }
OPTRACE "gray box cells" START { }
OPTRACE "gray box cells" END { }
OPTRACE "Design Initialization: post hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_post.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_post.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_post.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_init_post.tcl failed"
    }
    return -code error
  }
OPTRACE "Design Initialization: post hook" END { }
OPTRACE "init_design_reports" START { REPORT }
OPTRACE "init_design_reports" END { }
OPTRACE "init_design_write_hwdef" START { }
OPTRACE "init_design_write_hwdef" END { }
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

OPTRACE "Phase: Init Design" END { }
OPTRACE "Phase: Opt Design" START { ROLLUP_AUTO }
start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
OPTRACE "Opt Design: pre hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_pre.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_pre.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_pre.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_pre.tcl failed"
    }
    return -code error
  }
OPTRACE "Opt Design: pre hook" END { }
OPTRACE "read constraints: opt_design" START { }
OPTRACE "read constraints: opt_design" END { }
OPTRACE "opt_design" START { }
  opt_design 
OPTRACE "opt_design" END { }
OPTRACE "read constraints: opt_design_post" START { }
OPTRACE "read constraints: opt_design_post" END { }
OPTRACE "Opt Design: post hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_post.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_post.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_post.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_opt_post.tcl failed"
    }
    return -code error
  }
OPTRACE "Opt Design: post hook" END { }
OPTRACE "opt_design reports" START { REPORT }
OPTRACE "opt_design reports" END { }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

OPTRACE "Phase: Opt Design" END { }
OPTRACE "Phase: Place Design" START { ROLLUP_AUTO }
start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
OPTRACE "Place Design: pre hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_pre.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_pre.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_pre.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_pre.tcl failed"
    }
    return -code error
  }
OPTRACE "Place Design: pre hook" END { }
OPTRACE "read constraints: place_design" START { }
OPTRACE "read constraints: place_design" END { }
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
OPTRACE "implement_debug_core" START { }
    implement_debug_core 
OPTRACE "implement_debug_core" END { }
  } 
OPTRACE "place_design" START { }
  place_design 
OPTRACE "place_design" END { }
OPTRACE "read constraints: place_design_post" START { }
OPTRACE "read constraints: place_design_post" END { }
OPTRACE "Place Design: post hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_post.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_post.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_post.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_place_post.tcl failed"
    }
    return -code error
  }
OPTRACE "Place Design: post hook" END { }
OPTRACE "place_design reports" START { REPORT }
OPTRACE "place_design reports" END { }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

OPTRACE "Phase: Place Design" END { }
OPTRACE "Phase: Physical Opt Design" START { ROLLUP_AUTO }
start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
OPTRACE "read constraints: phys_opt_design" START { }
OPTRACE "read constraints: phys_opt_design" END { }
OPTRACE "phys_opt_design" START { }
  phys_opt_design 
OPTRACE "phys_opt_design" END { }
OPTRACE "read constraints: phys_opt_design_post" START { }
OPTRACE "read constraints: phys_opt_design_post" END { }
OPTRACE "phys_opt_design report" START { REPORT }
OPTRACE "phys_opt_design report" END { }
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

OPTRACE "Phase: Physical Opt Design" END { }
OPTRACE "Phase: Route Design" START { ROLLUP_AUTO }
start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
OPTRACE "read constraints: route_design" START { }
OPTRACE "read constraints: route_design" END { }
OPTRACE "route_design" START { }
  route_design 
OPTRACE "route_design" END { }
OPTRACE "read constraints: route_design_post" START { }
OPTRACE "read constraints: route_design_post" END { }
OPTRACE "Route Design: post hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_route_post.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_route_post.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_route_post.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_route_post.tcl failed"
    }
    return -code error
  }
OPTRACE "Route Design: post hook" END { }
OPTRACE "Route Design: write_checkpoint" START { CHECKPOINT }
  write_checkpoint -force top_wrapper_routed.dcp
OPTRACE "Route Design: write_checkpoint" END { }
OPTRACE "route_design reports" START { REPORT }
  create_report "impl_report_timing_summary_route_design_summary" "report_timing_summary -max_paths 10 -file xilinx_vck5000_gen4x8_qdma_2_202220_1_bb_locked_timing_summary_routed.rpt -pb xilinx_vck5000_gen4x8_qdma_2_202220_1_bb_locked_timing_summary_routed.pb -rpx xilinx_vck5000_gen4x8_qdma_2_202220_1_bb_locked_timing_summary_routed.rpx -warn_on_violation "
OPTRACE "route_design reports" END { }
OPTRACE "route_design misc" START { }
  set_property HD.PLATFORM_WRAPPER 1 [get_cells top_i/ulp]
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
OPTRACE "route_design write_checkpoint" START { CHECKPOINT }
OPTRACE "route_design write_checkpoint" END { }
  write_checkpoint -force top_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

OPTRACE "route_design misc" END { }
OPTRACE "Phase: Route Design" END { }
OPTRACE "Phase: Write Device Image" START { ROLLUP_AUTO }
OPTRACE "write_device_image setup" START { }
start_step write_device_image
set ACTIVE_STEP write_device_image
set rc [catch {
  create_msg_db write_device_image.pb
OPTRACE "Write Device Image: pre hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_pre.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_pre.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_pre.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_pre.tcl failed"
    }
    return -code error
  }
OPTRACE "Write Device Image: pre hook" END { }
OPTRACE "read constraints: write_bitstream" START { }
OPTRACE "read constraints: write_bitstream" END { }
OPTRACE "read constraints: write_bitstream" START { }
OPTRACE "read constraints: write_bitstream" END { }
  set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
OPTRACE "write_device_image setup" END { }
OPTRACE "write_device_image" START { }
  write_device_image -force -no_partial_pdifile top_wrapper.pdi 
  write_device_image -force -cell top_i/ulp -file top_i_ulp_my_rm_partial 
OPTRACE "write_device_image" END { }
OPTRACE "write_device_image misc" START { }
OPTRACE "read constraints: write_bitstream_post" START { }
OPTRACE "read constraints: write_bitstream_post" END { }
OPTRACE "read constraints: write_device_image_post" START { }
OPTRACE "read constraints: write_device_image_post" END { }
OPTRACE "Write Device Image: post hook" START { }
  set src_rc [catch { 
    puts "source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_post.tcl"
    source /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_post.tcl
  } _RESULT] 
  if {$src_rc} { 
    set tool_flow [get_property -quiet TOOL_FLOW [current_project -quiet]]
    if { $tool_flow eq {SDx} } { 
      send_gid_msg -id 2 -ssname VPL_TCL -severity ERROR $_RESULT
      send_gid_msg -id 3 -ssname VPL_TCL -severity ERROR "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_post.tcl failed"
    } else {
      send_msg_id runtcl-1 status "$_RESULT"
      send_msg_id runtcl-2 status "sourcing script /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/scripts/impl_1/_full_write_device_image_post.tcl failed"
    }
    return -code error
  }
OPTRACE "Write Device Image: post hook" END { }
  catch {write_debug_probes -no_partial_ltxfile -quiet -force top_wrapper}
  catch {file copy -force top_wrapper.ltx debug_nets.ltx}
  catch {write_debug_probes -quiet -force -cell top_i/ulp -file top_i_ulp_my_rm_partial.ltx}
  close_msg_db -file write_device_image.pb
} RESULT]
if {$rc} {
OPTRACE "write_device_image write_checkpoint" START { CHECKPOINT }
OPTRACE "write_device_image write_checkpoint" END { }
  step_failed write_device_image
  return -code error $RESULT
} else {
  end_step write_device_image
  unset ACTIVE_STEP 
}

OPTRACE "write_device_image misc" END { }
OPTRACE "Phase: Write Device Image" END { }
OPTRACE "impl_1" END { }
