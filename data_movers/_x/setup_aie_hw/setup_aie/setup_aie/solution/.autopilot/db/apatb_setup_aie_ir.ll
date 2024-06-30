; ModuleID = '/home/users/edoardo.dalessio/code/av_omega/VersalAutomationTemplate/data_movers/_x/setup_aie_hw/setup_aie/setup_aie/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<1024>" = type { %"struct.ap_int_base<1024, false>" }
%"struct.ap_int_base<1024, false>" = type { %"struct.ssdm_int<1024, false>" }
%"struct.ssdm_int<1024, false>" = type { i1024 }
%"class.hls::stream<ap_int<128>, 0>" = type { %"struct.ap_int<128>" }
%"struct.ap_int<128>" = type { %"struct.ap_int_base<128, true>" }
%"struct.ap_int_base<128, true>" = type { %"struct.ssdm_int<128, true>" }
%"struct.ssdm_int<128, true>" = type { i128 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_setup_aie_ir(i32 %size, %"struct.ap_uint<1024>"* noalias nocapture nonnull readonly %input, %"class.hls::stream<ap_int<128>, 0>"* noalias nocapture nonnull dereferenceable(16) %s) local_unnamed_addr #1 {
entry:
  %malloccall = call i8* @malloc(i64 12800)
  %input_copy = bitcast i8* %malloccall to [100 x i1024]*
  %s_copy = alloca %"class.hls::stream<ap_int<128>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<ap_int<128>, 0>"* %s_copy, i32 0) ]
  %0 = bitcast %"struct.ap_uint<1024>"* %input to [100 x %"struct.ap_uint<1024>"]*
  call fastcc void @copy_in([100 x %"struct.ap_uint<1024>"]* nonnull %0, [100 x i1024]* %input_copy, %"class.hls::stream<ap_int<128>, 0>"* nonnull %s, %"class.hls::stream<ap_int<128>, 0>"* nonnull align 512 %s_copy)
  %1 = getelementptr [100 x i1024], [100 x i1024]* %input_copy, i32 0, i32 0
  call void @apatb_setup_aie_hw(i32 %size, i1024* %1, %"class.hls::stream<ap_int<128>, 0>"* %s_copy)
  call void @copy_back([100 x %"struct.ap_uint<1024>"]* %0, [100 x i1024]* %input_copy, %"class.hls::stream<ap_int<128>, 0>"* %s, %"class.hls::stream<ap_int<128>, 0>"* %s_copy)
  call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([100 x %"struct.ap_uint<1024>"]* noalias readonly "unpacked"="0", [100 x i1024]* noalias nocapture "unpacked"="1.0.0.0", %"class.hls::stream<ap_int<128>, 0>"* noalias "unpacked"="2", %"class.hls::stream<ap_int<128>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "unpacked"="3") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<1024>"([100 x i1024]* %1, [100 x %"struct.ap_uint<1024>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<128>, 0>"(%"class.hls::stream<ap_int<128>, 0>"* align 512 %3, %"class.hls::stream<ap_int<128>, 0>"* %2)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<128>, 0>"(%"class.hls::stream<ap_int<128>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_int<128>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ap_int<128>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ap_int<128>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<128>, 0>"(%"class.hls::stream<ap_int<128>, 0>"* nonnull align 512 %0, %"class.hls::stream<ap_int<128>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<128>, 0>"(%"class.hls::stream<ap_int<128>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_int<128>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ap_int<128>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ap_int<128>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ap_int<128>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ap_int<128>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ap_int<128>, 0>", %"class.hls::stream<ap_int<128>, 0>"* %2
  %8 = bitcast %"class.hls::stream<ap_int<128>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ap_int<128>, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([100 x %"struct.ap_uint<1024>"]* noalias "unpacked"="0", [100 x i1024]* noalias nocapture readonly "unpacked"="1.0.0.0", %"class.hls::stream<ap_int<128>, 0>"* noalias "unpacked"="2", %"class.hls::stream<ap_int<128>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "unpacked"="3") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<1024>.5"([100 x %"struct.ap_uint<1024>"]* %0, [100 x i1024]* %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<128>, 0>"(%"class.hls::stream<ap_int<128>, 0>"* %2, %"class.hls::stream<ap_int<128>, 0>"* align 512 %3)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<1024>.5"([100 x %"struct.ap_uint<1024>"]* noalias "unpacked"="0", [100 x i1024]* noalias nocapture readonly "unpacked"="1.0.0.0") unnamed_addr #6 {
entry:
  %2 = icmp eq [100 x %"struct.ap_uint<1024>"]* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [100 x i1024], [100 x i1024]* %1, i64 0, i64 %for.loop.idx1
  %dst.addr.0.0.06 = getelementptr [100 x %"struct.ap_uint<1024>"], [100 x %"struct.ap_uint<1024>"]* %0, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %3 = load i1024, i1024* %src.addr.0.0.05, align 128
  store i1024 %3, i1024* %dst.addr.0.0.06, align 128
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 100
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<1024>"([100 x i1024]* noalias nocapture "unpacked"="0.0.0.0", [100 x %"struct.ap_uint<1024>"]* noalias readonly "unpacked"="1") unnamed_addr #6 {
entry:
  %2 = icmp eq [100 x %"struct.ap_uint<1024>"]* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [100 x %"struct.ap_uint<1024>"], [100 x %"struct.ap_uint<1024>"]* %1, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [100 x i1024], [100 x i1024]* %0, i64 0, i64 %for.loop.idx1
  %3 = load i1024, i1024* %src.addr.0.0.05, align 128
  store i1024 %3, i1024* %dst.addr.0.0.06, align 128
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 100
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

declare void @apatb_setup_aie_hw(i32, i1024*, %"class.hls::stream<ap_int<128>, 0>"*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back([100 x %"struct.ap_uint<1024>"]* noalias "unpacked"="0", [100 x i1024]* noalias nocapture readonly "unpacked"="1.0.0.0", %"class.hls::stream<ap_int<128>, 0>"* noalias "unpacked"="2", %"class.hls::stream<ap_int<128>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "unpacked"="3") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<128>, 0>"(%"class.hls::stream<ap_int<128>, 0>"* %2, %"class.hls::stream<ap_int<128>, 0>"* align 512 %3)
  ret void
}

define void @setup_aie_hw_stub_wrapper(i32, i1024*, %"class.hls::stream<ap_int<128>, 0>"*) #7 {
entry:
  %malloccall = tail call i8* @malloc(i64 12800)
  %3 = bitcast i8* %malloccall to [100 x %"struct.ap_uint<1024>"]*
  %4 = bitcast i1024* %1 to [100 x i1024]*
  call void @copy_out([100 x %"struct.ap_uint<1024>"]* %3, [100 x i1024]* %4, %"class.hls::stream<ap_int<128>, 0>"* null, %"class.hls::stream<ap_int<128>, 0>"* %2)
  %5 = bitcast [100 x %"struct.ap_uint<1024>"]* %3 to %"struct.ap_uint<1024>"*
  call void @setup_aie_hw_stub(i32 %0, %"struct.ap_uint<1024>"* %5, %"class.hls::stream<ap_int<128>, 0>"* %2)
  call void @copy_in([100 x %"struct.ap_uint<1024>"]* %3, [100 x i1024]* %4, %"class.hls::stream<ap_int<128>, 0>"* null, %"class.hls::stream<ap_int<128>, 0>"* %2)
  ret void
}

declare void @setup_aie_hw_stub(i32, %"struct.ap_uint<1024>"*, %"class.hls::stream<ap_int<128>, 0>"*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="128" "xlx.source"="user" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
