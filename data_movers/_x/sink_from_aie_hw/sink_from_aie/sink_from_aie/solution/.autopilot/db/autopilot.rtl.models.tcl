set SynModuleInfo {
  {SRCNAME sink_from_aie_Pipeline_VITIS_LOOP_72_2 MODELNAME sink_from_aie_Pipeline_VITIS_LOOP_72_2 RTLNAME sink_from_aie_sink_from_aie_Pipeline_VITIS_LOOP_72_2
    SUBMODULES {
      {MODELNAME sink_from_aie_flow_control_loop_pipe_sequential_init RTLNAME sink_from_aie_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME sink_from_aie_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME sink_from_aie_Pipeline_VITIS_LOOP_78_3 MODELNAME sink_from_aie_Pipeline_VITIS_LOOP_78_3 RTLNAME sink_from_aie_sink_from_aie_Pipeline_VITIS_LOOP_78_3}
  {SRCNAME sink_from_aie_Pipeline_VITIS_LOOP_106_4 MODELNAME sink_from_aie_Pipeline_VITIS_LOOP_106_4 RTLNAME sink_from_aie_sink_from_aie_Pipeline_VITIS_LOOP_106_4}
  {SRCNAME sink_from_aie_Pipeline_VITIS_LOOP_110_5 MODELNAME sink_from_aie_Pipeline_VITIS_LOOP_110_5 RTLNAME sink_from_aie_sink_from_aie_Pipeline_VITIS_LOOP_110_5}
  {SRCNAME sink_from_aie_Pipeline_VITIS_LOOP_117_6_VITIS_LOOP_118_7 MODELNAME sink_from_aie_Pipeline_VITIS_LOOP_117_6_VITIS_LOOP_118_7 RTLNAME sink_from_aie_sink_from_aie_Pipeline_VITIS_LOOP_117_6_VITIS_LOOP_118_7}
  {SRCNAME sink_from_aie MODELNAME sink_from_aie RTLNAME sink_from_aie IS_TOP 1
    SUBMODULES {
      {MODELNAME sink_from_aie_joint_RAM_AUTO_1R1W RTLNAME sink_from_aie_joint_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sink_from_aie_h1_RAM_AUTO_1R1W RTLNAME sink_from_aie_h1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sink_from_aie_gmem1_m_axi RTLNAME sink_from_aie_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME sink_from_aie_control_s_axi RTLNAME sink_from_aie_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME sink_from_aie_regslice_both RTLNAME sink_from_aie_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME sink_from_aie_regslice_both_U}
    }
  }
}
