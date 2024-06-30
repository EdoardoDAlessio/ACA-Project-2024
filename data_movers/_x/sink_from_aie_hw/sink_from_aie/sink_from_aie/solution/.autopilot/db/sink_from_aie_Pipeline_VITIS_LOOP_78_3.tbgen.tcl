set moduleName sink_from_aie_Pipeline_VITIS_LOOP_78_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 1
set StallSigGenFlag 1
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {sink_from_aie_Pipeline_VITIS_LOOP_78_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_stream int 32 regular {axi_s 0 volatile  { input_stream Data } }  }
	{ joint int 32 regular {array 65536 { 2 3 } 1 1 }  }
	{ h2 int 32 regular {array 256 { 2 3 } 1 1 }  }
	{ h1 int 32 regular {array 256 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_stream", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "joint", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "h2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "h1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_stream_TVALID sc_in sc_logic 1 invld 0 } 
	{ input_stream_TDATA sc_in sc_lv 32 signal 0 } 
	{ input_stream_TREADY sc_out sc_logic 1 inacc 0 } 
	{ joint_address0 sc_out sc_lv 16 signal 1 } 
	{ joint_ce0 sc_out sc_logic 1 signal 1 } 
	{ joint_we0 sc_out sc_logic 1 signal 1 } 
	{ joint_d0 sc_out sc_lv 32 signal 1 } 
	{ joint_q0 sc_in sc_lv 32 signal 1 } 
	{ h2_address0 sc_out sc_lv 8 signal 2 } 
	{ h2_ce0 sc_out sc_logic 1 signal 2 } 
	{ h2_we0 sc_out sc_logic 1 signal 2 } 
	{ h2_d0 sc_out sc_lv 32 signal 2 } 
	{ h2_q0 sc_in sc_lv 32 signal 2 } 
	{ h1_address0 sc_out sc_lv 8 signal 3 } 
	{ h1_ce0 sc_out sc_logic 1 signal 3 } 
	{ h1_we0 sc_out sc_logic 1 signal 3 } 
	{ h1_d0 sc_out sc_lv 32 signal 3 } 
	{ h1_q0 sc_in sc_lv 32 signal 3 } 
	{ ap_ext_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_str_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_int_blocking_n sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_stream", "role": "TVALID" }} , 
 	{ "name": "input_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_stream", "role": "TDATA" }} , 
 	{ "name": "input_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "input_stream", "role": "TREADY" }} , 
 	{ "name": "joint_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "joint", "role": "address0" }} , 
 	{ "name": "joint_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "joint", "role": "ce0" }} , 
 	{ "name": "joint_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "joint", "role": "we0" }} , 
 	{ "name": "joint_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "joint", "role": "d0" }} , 
 	{ "name": "joint_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "joint", "role": "q0" }} , 
 	{ "name": "h2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "h2", "role": "address0" }} , 
 	{ "name": "h2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h2", "role": "ce0" }} , 
 	{ "name": "h2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h2", "role": "we0" }} , 
 	{ "name": "h2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h2", "role": "d0" }} , 
 	{ "name": "h2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h2", "role": "q0" }} , 
 	{ "name": "h1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "h1", "role": "address0" }} , 
 	{ "name": "h1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h1", "role": "ce0" }} , 
 	{ "name": "h1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h1", "role": "we0" }} , 
 	{ "name": "h1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h1", "role": "d0" }} , 
 	{ "name": "h1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h1", "role": "q0" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "sink_from_aie_Pipeline_VITIS_LOOP_78_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_stream", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "joint", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "h2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "h1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_78_3", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sink_from_aie_Pipeline_VITIS_LOOP_78_3 {
		input_stream {Type I LastRead 3 FirstWrite -1}
		joint {Type IO LastRead 1 FirstWrite 3}
		h2 {Type IO LastRead 1 FirstWrite 3}
		h1 {Type IO LastRead 1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_stream { axis {  { input_stream_TVALID in_vld 0 1 }  { input_stream_TDATA in_data 0 32 }  { input_stream_TREADY in_acc 1 1 } } }
	joint { ap_memory {  { joint_address0 mem_address 1 16 }  { joint_ce0 mem_ce 1 1 }  { joint_we0 mem_we 1 1 }  { joint_d0 mem_din 1 32 }  { joint_q0 mem_dout 0 32 } } }
	h2 { ap_memory {  { h2_address0 mem_address 1 8 }  { h2_ce0 mem_ce 1 1 }  { h2_we0 mem_we 1 1 }  { h2_d0 mem_din 1 32 }  { h2_q0 mem_dout 0 32 } } }
	h1 { ap_memory {  { h1_address0 mem_address 1 8 }  { h1_ce0 mem_ce 1 1 }  { h1_we0 mem_we 1 1 }  { h1_d0 mem_din 1 32 }  { h1_q0 mem_dout 0 32 } } }
}
