.PHONY: all  i0_my_kernel_1.rule clean

ifeq ($(XILINX_VITIS_AIETOOLS),)
XILINX_VITIS_AIETOOLS:=${XILINX_VITIS}/aietools
endif
ifeq ($(CARDANO_AIE_ARCH_MODEL_DIR),)
CARDANO_AIE_ARCH_MODEL_DIR := ${XILINX_VITIS_AIETOOLS}/data/versal_prod/lib
endif
XCHESSCC := xchesscc

INCLUDE_PATH := -I ../../.. -I ${XILINX_VITIS_AIETOOLS}/include -I /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/aie/src -I /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/common -I ${CARDANO_AIE_ARCH_MODEL_DIR}/runtime_cxx/libcxx-lite/include -I ${CARDANO_AIE_ARCH_MODEL_DIR}/runtime_cxx/libs/libcxx-9.0.0/include-lite -I ${CARDANO_AIE_ARCH_MODEL_DIR}/runtime/include

all:  i0_my_kernel_1.rule

i0_my_kernel_1.rule:
	${XCHESSCC} +f +s -p me -P ${CARDANO_AIE_ARCH_MODEL_DIR} +Wllvm,-O2,-fno-jump-tables,-fno-discard-value-names,-mllvm,-chess-collapse-struct-types-during-linking=0,-Xclang,-chess-only-info-critical-passes,-g -D__AIENGINE__ -D__AIEARCH__=10 -DAIE_OPTION_SCALAR_FLOAT_ON_VECTOR ${INCLUDE_PATH} /home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/aie/src/my_kernel_1.cpp -o i0_my_kernel_1.ll;

clean:
	rm -rf  i0_my_kernel_1.ll