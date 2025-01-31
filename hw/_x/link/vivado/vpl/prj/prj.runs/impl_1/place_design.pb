
�
�You are lowering the severity from an ERROR. This can potentially lead to board damage or other functionality issues on hardware. If this is not desired, please run %s to undo this change.2490*	planAhead2E
1'reset_property SEVERITY [get_drc_checks HDPR-5]'2default:defaultZ12-4430h px� 
O
*Debug cores have already been implemented
153*	chipscopeZ16-240h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xcvc19022default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xcvc19022default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
d
DRC finished with %s
79*	vivadotcl2*
0 Errors, 186 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.042default:default2
6046.3282default:default2
0.0002default:default2
242012default:default2
1092002default:defaultZ17-722h px� 
s
%s*common2Z
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 145896fe8
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.81 ; elapsed = 00:00:00.92 . Memory (MB): peak = 6046.328 ; gain = 0.000 ; free physical = 24196 ; free virtual = 1091952default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.032default:default2
00:00:00.032default:default2
6046.3282default:default2
0.0002default:default2
241922default:default2
1091912default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2�
dtop_i/blp/blp_logic/ulp_clocking/clkwiz_aclk_kernel_00/inst/clock_primitive_inst/MMCME5_inst/CLKOUT0dtop_i/blp/blp_logic/ulp_clocking/clkwiz_aclk_kernel_00/inst/clock_primitive_inst/MMCME5_inst/CLKOUT02default:default2
 [See 2default:default2�
s/home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/output/_user_impl_clk.xdcs/home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/output/_user_impl_clk.xdc2default:default2
:2default:default2
332default:default2
]2default:default8Z38-3h px� 
�
�The %s instance '%s' has %s bus pins that are not tied constant, so automatic derivation of the generated clock on pin '%s' will proceed as if a worst case divide of %s were specified on those bus pins.275*timing2
CPM_MAIN2default:default2�
5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST	5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST2default:default20
IFCPMXPIPELINK0XPIPEBUFGTDIV2default:default2D
CPMDPLLPCIE0USERCLKINTCPMDPLLPCIE0USERCLKINT2default:default2
12default:default8Z38-492h px� 
�
�The %s instance '%s' has %s bus pins that are not tied constant, so automatic derivation of the generated clock on pin '%s' will proceed as if a worst case divide of %s were specified on those bus pins.275*timing2
CPM_MAIN2default:default2�
5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST	5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST2default:default20
IFCPMXPIPELINK0XPIPEBUFGTDIV2default:default2R
IFCPMXPIPELINK0XPIPEGTPIPECLKIFCPMXPIPELINK0XPIPEGTPIPECLK2default:default2
12default:default8Z38-492h px� 
�
�The %s instance '%s' has %s bus pins that are not tied constant, so automatic derivation of the generated clock on pin '%s' will proceed as if a worst case divide of %s were specified on those bus pins.275*timing2
CPM_MAIN2default:default2�
5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST	5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST2default:default20
IFCPMXPIPELINK0XPIPEBUFGTDIV2default:default26
PCIE0USERCLKINTPCIE0USERCLKINT2default:default2
12default:default8Z38-492h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2�
6top_i/blp/cips/inst/cpm_0/inst/DPLL_PCIE0_inst/CLKOUT16top_i/blp/cips/inst/cpm_0/inst/DPLL_PCIE0_inst/CLKOUT12default:default2
 [See 2default:default2.
ip_cpm4.xdcip_cpm4.xdc2default:default2
:2default:default2
992default:default2
]2default:default8Z38-3h px� 
�
%s*common2g
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 1541f9ceb
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:05:25 ; elapsed = 00:05:43 . Memory (MB): peak = 6432.535 ; gain = 386.207 ; free physical = 25234 ; free virtual = 1103712default:defaulth px� 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
h
%s*common2O
;Phase 1.3 Build Placer Netlist Model | Checksum: 22abdeb3e
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:51 ; elapsed = 00:08:21 . Memory (MB): peak = 6736.805 ; gain = 690.477 ; free physical = 26253 ; free virtual = 1114522default:defaulth px� 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
e
%s*common2L
8Phase 1.4 Constrain Clocks/Macros | Checksum: 22abdeb3e
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:53 ; elapsed = 00:08:23 . Memory (MB): peak = 6736.805 ; gain = 690.477 ; free physical = 26265 ; free virtual = 1114552default:defaulth px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X19Y3322default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X1Y3  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place22
URAM_DELAY_LOCF_TL_TILE_X9Y2842default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X0Y2  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X19Y2842default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X1Y2  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X36Y2842default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X2Y2  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X59Y2842default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X3Y2  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X82Y2842default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X4Y2  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place24
 URAM_DELAY_ROCF_TL_TILE_X104Y2842default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X5Y2  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place2,
CLK_GT_AAA_TILE_X112Y2392default:default2)
pblock_dynamic_region2default:default2�
�GCLK_DELAY_X6Y96  GCLK_DELAY_X6Y97  GCLK_DELAY_X6Y98  GCLK_DELAY_X6Y99  GCLK_DELAY_X6Y100  GCLK_DELAY_X6Y101  GCLK_DELAY_X6Y102  GCLK_DELAY_X6Y103  GCLK_DELAY_X6Y104  GCLK_DELAY_X6Y105  GCLK_DELAY_X6Y106  GCLK_DELAY_X6Y107  GCLK_DELAY_X6Y108  GCLK_DELAY_X6Y109  GCLK_DELAY_X6Y110  GCLK_DELAY_X6Y111  GCLK_DELAY_X6Y112  GCLK_DELAY_X6Y113  GCLK_DELAY_X6Y114  GCLK_DELAY_X6Y115  GCLK_DELAY_X6Y116  GCLK_DELAY_X6Y117  GCLK_DELAY_X6Y118  GCLK_DELAY_X6Y119  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place22
URAM_DELAY_LOCF_TL_TILE_X9Y1882default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X0Y1  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X19Y1882default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X1Y1  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X36Y1882default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X2Y1  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X59Y1882default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X3Y1  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X82Y1882default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X4Y1  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place24
 URAM_DELAY_ROCF_TL_TILE_X104Y1882default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X5Y1  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place2,
CLK_GT_BBA_TILE_X112Y1432default:default2)
pblock_dynamic_region2default:default2�
�GCLK_DELAY_X6Y48  GCLK_DELAY_X6Y49  GCLK_DELAY_X6Y50  GCLK_DELAY_X6Y51  GCLK_DELAY_X6Y52  GCLK_DELAY_X6Y53  GCLK_DELAY_X6Y54  GCLK_DELAY_X6Y55  GCLK_DELAY_X6Y56  GCLK_DELAY_X6Y57  GCLK_DELAY_X6Y58  GCLK_DELAY_X6Y59  GCLK_DELAY_X6Y60  GCLK_DELAY_X6Y61  GCLK_DELAY_X6Y62  GCLK_DELAY_X6Y63  GCLK_DELAY_X6Y64  GCLK_DELAY_X6Y65  GCLK_DELAY_X6Y66  GCLK_DELAY_X6Y67  GCLK_DELAY_X6Y68  GCLK_DELAY_X6Y69  GCLK_DELAY_X6Y70  GCLK_DELAY_X6Y71  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place22
URAM_DELAY_ROCF_TL_TILE_X19Y922default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X1Y0  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place22
URAM_DELAY_ROCF_TL_TILE_X36Y922default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X2Y0  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place22
URAM_DELAY_ROCF_TL_TILE_X59Y922default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X3Y0  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place22
URAM_DELAY_ROCF_TL_TILE_X82Y922default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X4Y0  2default:defaultZ30-3039h px� 
�
�All sites of Tile %s are not fully ranged in pblock " %s ". It is recommended to add the following sites to the pblock to define the complete programmable unit for this resource type- %s 6552*place23
URAM_DELAY_ROCF_TL_TILE_X104Y922default:default2)
pblock_dynamic_region2default:default2'
URAM_CAS_DLY_X5Y0  2default:defaultZ30-3039h px� 
a
%s*common2H
4Phase 1 Placer Initialization | Checksum: 22abdeb3e
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:08:14 ; elapsed = 00:08:46 . Memory (MB): peak = 6751.965 ; gain = 705.637 ; free physical = 26175 ; free virtual = 1113732default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px� 


Phase %s%s
101*constraints2
2.1.1 2default:default2.
Partition Driven Placement2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
2.1.1.1 2default:default23
PBP: Partition Driven Placement2default:defaultZ18-101h px� 
q
%s*common2X
DPhase 2.1.1.1 PBP: Partition Driven Placement | Checksum: 187a96b7f
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:09:09 ; elapsed = 00:09:53 . Memory (MB): peak = 6807.992 ; gain = 761.664 ; free physical = 26080 ; free virtual = 1113562default:defaulth px� 
�

Phase %s%s
101*constraints2
2.1.1.2 2default:default2/
PBP: Clock Region Placement2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.052default:default2
7085.7662default:default2
0.0002default:default2
258362default:default2
1111812default:defaultZ17-722h px� 
m
%s*common2T
@Phase 2.1.1.2 PBP: Clock Region Placement | Checksum: 191c8333c
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:11:37 ; elapsed = 00:12:29 . Memory (MB): peak = 7085.766 ; gain = 1039.438 ; free physical = 25812 ; free virtual = 1112072default:defaulth px� 
�

Phase %s%s
101*constraints2
2.1.1.3 2default:default2-
PBP: Discrete Incremental2default:defaultZ18-101h px� 
k
%s*common2R
>Phase 2.1.1.3 PBP: Discrete Incremental | Checksum: 18c114535
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:11:40 ; elapsed = 00:12:31 . Memory (MB): peak = 7085.766 ; gain = 1039.438 ; free physical = 25810 ; free virtual = 1112072default:defaulth px� 
~

Phase %s%s
101*constraints2
2.1.1.4 2default:default2+
PBP: Compute Congestion2default:defaultZ18-101h px� 
i
%s*common2P
<Phase 2.1.1.4 PBP: Compute Congestion | Checksum: 18c114535
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:12:17 ; elapsed = 00:13:06 . Memory (MB): peak = 7117.781 ; gain = 1071.453 ; free physical = 25729 ; free virtual = 1111712default:defaulth px� 
{

Phase %s%s
101*constraints2
2.1.1.5 2default:default2(
PBP: Macro Placement2default:defaultZ18-101h px� 
f
%s*common2M
9Phase 2.1.1.5 PBP: Macro Placement | Checksum: 1f6a47ffd
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:12:22 ; elapsed = 00:13:11 . Memory (MB): peak = 7117.781 ; gain = 1071.453 ; free physical = 28664 ; free virtual = 1141102default:defaulth px� 
x

Phase %s%s
101*constraints2
2.1.1.6 2default:default2%
PBP: UpdateTiming2default:defaultZ18-101h px� 
c
%s*common2J
6Phase 2.1.1.6 PBP: UpdateTiming | Checksum: 1edb7e0ed
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:13:06 ; elapsed = 00:13:55 . Memory (MB): peak = 7117.781 ; gain = 1071.453 ; free physical = 28108 ; free virtual = 1137652default:defaulth px� 
�

Phase %s%s
101*constraints2
2.1.1.7 2default:default2-
PBP: Add part constraints2default:defaultZ18-101h px� 
k
%s*common2R
>Phase 2.1.1.7 PBP: Add part constraints | Checksum: 1edb7e0ed
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:13:06 ; elapsed = 00:13:55 . Memory (MB): peak = 7117.781 ; gain = 1071.453 ; free physical = 28108 ; free virtual = 1137652default:defaulth px� 
j
%s*common2Q
=Phase 2.1.1 Partition Driven Placement | Checksum: 1edb7e0ed
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:13:07 ; elapsed = 00:13:56 . Memory (MB): peak = 7117.781 ; gain = 1071.453 ; free physical = 28118 ; free virtual = 1137752default:defaulth px� 
X
4Generating placement and routing for NoC components
313*ipconfigZ75-653h px� 
a
NoC TrafficSpec | Checksum: %s
351*ipconfig2
f03c920b2default:defaultZ75-696h px� 
a
NoC Constraints | Checksum: %s
348*ipconfig2
f0fc58462default:defaultZ75-693h px� 
j
(NoC Incremental Solution | Checksum: %s
349*ipconfig2
ecb5006f2default:defaultZ75-694h px� 
7
Running NOC Placement83*ipconfigZ75-92h px� 
=
Detailed placement phase
113*ipconfigZ75-122h px� 
8
Running NOC Routing
124*ipconfigZ75-133h px� 
G
#NoC Compiler Finished Successfully
396*ipconfigZ75-794h px� 
^
NoC Solution | Checksum: %s
350*ipconfig2
e665f34e2default:defaultZ75-695h px� 
[
%s*common2B
.Phase 2.1 Floorplanning | Checksum: 1fcde334d
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:13:26 ; elapsed = 00:14:20 . Memory (MB): peak = 7417.125 ; gain = 1370.797 ; free physical = 28040 ; free virtual = 1137012default:defaulth px� 
�

Phase %s%s
101*constraints2
2.2 2default:default25
!Update Timing before SLR Path Opt2default:defaultZ18-101h px� 
o
%s*common2V
BPhase 2.2 Update Timing before SLR Path Opt | Checksum: 14bad5209
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:13:28 ; elapsed = 00:14:22 . Memory (MB): peak = 7449.141 ; gain = 1402.812 ; free physical = 28008 ; free virtual = 1136702default:defaulth px� 
�

Phase %s%s
101*constraints2
2.3 2default:default24
 Post-Processing in Floorplanning2default:defaultZ18-101h px� 
n
%s*common2U
APhase 2.3 Post-Processing in Floorplanning | Checksum: 14bad5209
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:13:29 ; elapsed = 00:14:23 . Memory (MB): peak = 7449.141 ; gain = 1402.812 ; free physical = 28002 ; free virtual = 1136652default:defaulth px� 
x

Phase %s%s
101*constraints2
2.4 2default:default2)
Global Placement Core2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
2.4.1 2default:default2:
&UpdateTiming Before Physical Synthesis2default:defaultZ18-101h px� 
v
%s*common2]
IPhase 2.4.1 UpdateTiming Before Physical Synthesis | Checksum: 20d0e34ca
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:21:15 ; elapsed = 00:24:00 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 24523 ; free virtual = 1109482default:defaulth px� 
�

Phase %s%s
101*constraints2
2.4.2 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px� 
�
FFound %s LUTNM shape to break, %s LUT instances to create LUTNM shape
553*physynth2
02default:default2
5632default:defaultZ32-1035h px� 
�
YBreak lutnm for timing: one critical %s, two critical %s, total %s, new lutff created %s
561*physynth2
02default:default2
02default:default2
02default:default2
02default:defaultZ32-1044h px� 
�
^End %s Pass. Optimized %s %s. Breaked %s %s, combined %s existing %s and moved %s existing %s
576*physynth2
12default:default2
2512default:default2 
nets or LUTs2default:default2
02default:default2
LUT2default:default2
2512default:default2
LUTs2default:default2
02default:default2
LUT2default:defaultZ32-1138h px� 
�
KPass %s. Identified %s candidate driver %s for equivalent driver rewiring.
548*physynth2
12default:default2
132default:default2
sets2default:defaultZ32-1030h px� 
�
#Optimized %s %s.  Re-placed %s %s.
335*physynth2
112default:default2
nets2default:default2
552default:default2
	instances2default:defaultZ32-661h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
112default:default2!
nets or cells2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
552default:default2
cells2default:defaultZ32-775h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.332default:default2
00:00:00.682default:default2
7457.1452default:default2
0.0002default:default2
245002default:default2
1109272default:defaultZ17-722h px� 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px� 
�
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
i
DNo candidate cells found for Shift Register to Pipeline optimization564*physynthZ32-1123h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
h
DNo candidate cells for SRL register optimization found in the design349*physynthZ32-677h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
i
ENo candidate cells for BRAM register optimization found in the design297*physynthZ32-526h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
j
FNo candidate cells for URAM register optimization found in the design
437*physynthZ32-846h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
o
KNo candidate nets found for dynamic/static region interface net replication521*physynthZ32-949h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.032default:default2
00:00:00.042default:default2
7457.1452default:default2
0.0002default:default2
244892default:default2
1109182default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.042default:default2
7457.1452default:default2
0.0002default:default2
244862default:default2
1109152default:defaultZ17-722h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  LUT Combining                                    |            0  |            251  |                   251  |           0  |           1  |  00:00:03  |
|  Retime                                           |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Equivalent Driver Rewiring                       |            0  |              0  |                    11  |           0  |           1  |  00:00:07  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:06  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |            0  |            251  |                   262  |           0  |          10  |  00:00:16  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
l
%s*common2S
?Phase 2.4.2 Physical Synthesis In Placer | Checksum: 1f719a3be
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:22:11 ; elapsed = 00:25:02 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 24427 ; free virtual = 1108632default:defaulth px� 
c
%s*common2J
6Phase 2.4 Global Placement Core | Checksum: 106426c48
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:25:49 ; elapsed = 00:28:53 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 31543 ; free virtual = 1180362default:defaulth px� 
\
%s*common2C
/Phase 2 Global Placement | Checksum: 1734280fa
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:25:50 ; elapsed = 00:28:54 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 31557 ; free virtual = 1180502default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
h
%s*common2O
;Phase 3.1 Commit Multi Column Macros | Checksum: 162d6bf34
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:27:10 ; elapsed = 00:30:16 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 30423 ; free virtual = 1169322default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
j
%s*common2Q
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 16bd1826a
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:27:40 ; elapsed = 00:30:49 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 30133 ; free virtual = 1166602default:defaulth px� 
q

Phase %s%s
101*constraints2
3.3 2default:default2"
Small Shape DP2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
3.3.1 2default:default2*
Small Shape Clustering2default:defaultZ18-101h px� 
f
%s*common2M
9Phase 3.3.1 Small Shape Clustering | Checksum: 18c77d089
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:28:55 ; elapsed = 00:32:05 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 29838 ; free virtual = 1164332default:defaulth px� 
�

Phase %s%s
101*constraints2
3.3.2 2default:default20
Flow Legalize Slice Clusters2default:defaultZ18-101h px� 
l
%s*common2S
?Phase 3.3.2 Flow Legalize Slice Clusters | Checksum: 1eba2db9c
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:28:56 ; elapsed = 00:32:06 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 29795 ; free virtual = 1163932default:defaulth px� 
t

Phase %s%s
101*constraints2
3.3.3 2default:default2#
Slice Area Swap2default:defaultZ18-101h px� 
~

Phase %s%s
101*constraints2
3.3.3.1 2default:default2+
Slice Area Swap Initial2default:defaultZ18-101h px� 
i
%s*common2P
<Phase 3.3.3.1 Slice Area Swap Initial | Checksum: 1ad9d2ad6
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:29:02 ; elapsed = 00:32:13 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 29759 ; free virtual = 1163212default:defaulth px� 
_
%s*common2F
2Phase 3.3.3 Slice Area Swap | Checksum: 1ad9d2ad6
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:29:03 ; elapsed = 00:32:13 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 29731 ; free virtual = 1162922default:defaulth px� 
\
%s*common2C
/Phase 3.3 Small Shape DP | Checksum: 1e30237a2
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:30:12 ; elapsed = 00:33:28 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 31311 ; free virtual = 1178522default:defaulth px� 
r

Phase %s%s
101*constraints2
3.4 2default:default2#
Place Remaining2default:defaultZ18-101h px� 
]
%s*common2D
0Phase 3.4 Place Remaining | Checksum: 1e30237a2
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:30:24 ; elapsed = 00:33:40 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 31198 ; free virtual = 1177492default:defaulth px� 
{

Phase %s%s
101*constraints2
3.5 2default:default2,
Optimize BEL assignments2default:defaultZ18-101h px� 
f
%s*common2M
9Phase 3.5 Optimize BEL assignments | Checksum: 1153134ac
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:32:24 ; elapsed = 00:35:44 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 25357 ; free virtual = 1119252default:defaulth px� 
�

Phase %s%s
101*constraints2
3.6 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
l
%s*common2S
?Phase 3.6 Pipeline Register Optimization | Checksum: 1153134ac
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:32:26 ; elapsed = 00:35:46 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 25292 ; free virtual = 1118602default:defaulth px� 
t

Phase %s%s
101*constraints2
3.7 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
_
%s*common2F
2Phase 3.7 Fast Optimization | Checksum: 1556640ba
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:33:57 ; elapsed = 00:37:22 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 23699 ; free virtual = 1102842default:defaulth px� 
\
%s*common2C
/Phase 3 Detail Placement | Checksum: 1556640ba
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:33:58 ; elapsed = 00:37:23 . Memory (MB): peak = 7457.145 ; gain = 1410.816 ; free physical = 23645 ; free virtual = 1102312default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2�
dtop_i/blp/blp_logic/ulp_clocking/clkwiz_aclk_kernel_00/inst/clock_primitive_inst/MMCME5_inst/CLKOUT0dtop_i/blp/blp_logic/ulp_clocking/clkwiz_aclk_kernel_00/inst/clock_primitive_inst/MMCME5_inst/CLKOUT02default:default2
 [See 2default:default2�
s/home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/output/_user_impl_clk.xdcs/home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/hw/_x/link/vivado/vpl/output/_user_impl_clk.xdc2default:default2
:2default:default2
332default:default2
]2default:default8Z38-3h px� 
�
�The %s instance '%s' has %s bus pins that are not tied constant, so automatic derivation of the generated clock on pin '%s' will proceed as if a worst case divide of %s were specified on those bus pins.275*timing2
CPM_MAIN2default:default2�
5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST	5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST2default:default20
IFCPMXPIPELINK0XPIPEBUFGTDIV2default:default2D
CPMDPLLPCIE0USERCLKINTCPMDPLLPCIE0USERCLKINT2default:default2
12default:default8Z38-492h px� 
�
�The %s instance '%s' has %s bus pins that are not tied constant, so automatic derivation of the generated clock on pin '%s' will proceed as if a worst case divide of %s were specified on those bus pins.275*timing2
CPM_MAIN2default:default2�
5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST	5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST2default:default20
IFCPMXPIPELINK0XPIPEBUFGTDIV2default:default2R
IFCPMXPIPELINK0XPIPEGTPIPECLKIFCPMXPIPELINK0XPIPEGTPIPECLK2default:default2
12default:default8Z38-492h px� 
�
�The %s instance '%s' has %s bus pins that are not tied constant, so automatic derivation of the generated clock on pin '%s' will proceed as if a worst case divide of %s were specified on those bus pins.275*timing2
CPM_MAIN2default:default2�
5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST	5top_i/blp/cips/inst/cpm_0/inst/CPM_INST/CPM_MAIN_INST2default:default20
IFCPMXPIPELINK0XPIPEBUFGTDIV2default:default26
PCIE0USERCLKINTPCIE0USERCLKINT2default:default2
12default:default8Z38-492h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2�
6top_i/blp/cips/inst/cpm_0/inst/DPLL_PCIE0_inst/CLKOUT16top_i/blp/cips/inst/cpm_0/inst/DPLL_PCIE0_inst/CLKOUT12default:default2
 [See 2default:default2.
ip_cpm4.xdcip_cpm4.xdc2default:default2
:2default:default2
992default:default2
]2default:default8Z38-3h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.062default:default2
7545.1252default:default2
0.0002default:default2
148952default:default2
1015342default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
4.1.1.1 2default:default26
"Post Placement Timing Optimization2default:defaultZ18-101h px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
0.2342default:defaultZ30-746h px� 
t
%s*common2[
GPhase 4.1.1.1 Post Placement Timing Optimization | Checksum: 22152261a
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:37:46 ; elapsed = 00:41:25 . Memory (MB): peak = 7545.125 ; gain = 1498.797 ; free physical = 18328 ; free virtual = 1049892default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:37:46 ; elapsed = 00:41:25 . Memory (MB): peak = 7545.125 ; gain = 1498.797 ; free physical = 18328 ; free virtual = 1049892default:defaulth px� 
f
%s*common2M
9Phase 4.1 Post Commit Optimization | Checksum: 22152261a
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:37:47 ; elapsed = 00:41:26 . Memory (MB): peak = 7545.125 ; gain = 1498.797 ; free physical = 18328 ; free virtual = 1050042default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.052default:default2
00:00:00.062default:default2
7673.1252default:default2
0.0002default:default2
161452default:default2
1028312default:defaultZ17-722h px� 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
d
%s*common2K
7Phase 4.2 Post Placement Cleanup | Checksum: 2a62b0e45
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:49 ; elapsed = 00:43:34 . Memory (MB): peak = 7673.125 ; gain = 1626.797 ; free physical = 15938 ; free virtual = 1026252default:defaulth px� 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 


Phase %s%s
101*constraints2
4.3.1 2default:default2.
Print Estimated Congestion2default:defaultZ18-101h px� 
�
'Post-Placement Estimated Congestion %s
38*	placeflow2�
�
 ________________________________________________________________________
|           | Global Congestion | Long Congestion   | Short Congestion  |
| Direction | Region Size       | Region Size       | Region Size       |
|___________|___________________|___________________|___________________|
|      North|              16x16|              16x16|              16x16|
|___________|___________________|___________________|___________________|
|      South|                8x8|              16x16|              16x16|
|___________|___________________|___________________|___________________|
|       East|                8x8|              16x16|                8x8|
|___________|___________________|___________________|___________________|
|       West|              16x16|                8x8|                8x8|
|___________|___________________|___________________|___________________|
2default:defaultZ30-612h px� 
j
%s*common2Q
=Phase 4.3.1 Print Estimated Congestion | Checksum: 2a62b0e45
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:53 ; elapsed = 00:43:38 . Memory (MB): peak = 7673.125 ; gain = 1626.797 ; free physical = 15987 ; free virtual = 1026752default:defaulth px� 
^
%s*common2E
1Phase 4.3 Placer Reporting | Checksum: 2a62b0e45
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:56 ; elapsed = 00:43:41 . Memory (MB): peak = 7673.125 ; gain = 1626.797 ; free physical = 15907 ; free virtual = 1025962default:defaulth px� 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.032default:default2
7673.1252default:default2
0.0002default:default2
158982default:default2
1025862default:defaultZ17-722h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:57 ; elapsed = 00:43:42 . Memory (MB): peak = 7673.125 ; gain = 1626.797 ; free physical = 15898 ; free virtual = 1025862default:defaulth px� 
t
%s*common2[
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 23e052db5
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:40:00 ; elapsed = 00:43:46 . Memory (MB): peak = 7673.125 ; gain = 1626.797 ; free physical = 15863 ; free virtual = 1025522default:defaulth px� 
V
%s*common2=
)Ending Placer Task | Checksum: 18c17412e
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:40:04 ; elapsed = 00:43:49 . Memory (MB): peak = 7673.125 ; gain = 1626.797 ; free physical = 15717 ; free virtual = 1024072default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1372default:default2
852default:default2
12default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:45:422default:default2
00:49:482default:default2
7673.1252default:default2
1850.7812default:default2
160282default:default2
1027182default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2(
report_utilization: 2default:default2
00:00:242default:default2
00:00:262default:default2
7673.1252default:default2
0.0002default:default2
156672default:default2
1023662default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2(
report_utilization: 2default:default2
00:00:222default:default2
00:00:242default:default2
7673.1252default:default2
0.0002default:default2
155282default:default2
1022332default:defaultZ17-722h px� 


End Record