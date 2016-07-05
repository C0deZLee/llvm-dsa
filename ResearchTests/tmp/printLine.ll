; ModuleID = 'printLine.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::basic_string" = type { %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%"class.std::allocator" = type { i8 }

$__clang_call_terminate = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZSt4cerr = external global %"class.std::basic_ostream"
@.str = private unnamed_addr constant [28 x i8] c"\09\09Enter BasicBlock in file \00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c" at line # \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_printLine.cpp, i8* null }]

define internal void @__cxx_global_var_init() section ".text.startup" {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !424
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1, !dbg !424
  ret void, !dbg !424
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: uwtable
define void @_Z12printBBEntryiPc(i32 %ln, i8* %filename) #2 {
entry:
  %ln.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 8
  %ref.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp1 = alloca %"class.std::allocator", align 1
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store i32 %ln, i32* %ln.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ln.addr, metadata !425, metadata !426), !dbg !427
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !428, metadata !426), !dbg !429
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0)), !dbg !430
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !431
  call void @_ZNSaIcEC1Ev(%"class.std::allocator"* %ref.tmp1) #1, !dbg !432
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %ref.tmp, i8* %0, %"class.std::allocator"* dereferenceable(1) %ref.tmp1)
          to label %invoke.cont unwind label %lpad, !dbg !432

invoke.cont:                                      ; preds = %entry
  %call4 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKSbIS4_S5_T1_E(%"class.std::basic_ostream"* dereferenceable(272) %call, %"class.std::basic_string"* dereferenceable(8) %ref.tmp)
          to label %invoke.cont3 unwind label %lpad2, !dbg !433

invoke.cont3:                                     ; preds = %invoke.cont
  %call6 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str1, i32 0, i32 0))
          to label %invoke.cont5 unwind label %lpad2, !dbg !435

invoke.cont5:                                     ; preds = %invoke.cont3
  %1 = load i32, i32* %ln.addr, align 4, !dbg !437
  %call8 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call6, i32 %1)
          to label %invoke.cont7 unwind label %lpad2, !dbg !439

invoke.cont7:                                     ; preds = %invoke.cont5
  %call10 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call8, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont9 unwind label %lpad2, !dbg !440

invoke.cont9:                                     ; preds = %invoke.cont7
  invoke void @_ZNSsD1Ev(%"class.std::basic_string"* %ref.tmp)
          to label %invoke.cont11 unwind label %lpad, !dbg !442

invoke.cont11:                                    ; preds = %invoke.cont9
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp1) #1, !dbg !444
  ret void, !dbg !446

lpad:                                             ; preds = %invoke.cont9, %entry
  %2 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !446
  %3 = extractvalue { i8*, i32 } %2, 0, !dbg !446
  store i8* %3, i8** %exn.slot, !dbg !446
  %4 = extractvalue { i8*, i32 } %2, 1, !dbg !446
  store i32 %4, i32* %ehselector.slot, !dbg !446
  br label %ehcleanup, !dbg !446

lpad2:                                            ; preds = %invoke.cont7, %invoke.cont5, %invoke.cont3, %invoke.cont
  %5 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !446
  %6 = extractvalue { i8*, i32 } %5, 0, !dbg !446
  store i8* %6, i8** %exn.slot, !dbg !446
  %7 = extractvalue { i8*, i32 } %5, 1, !dbg !446
  store i32 %7, i32* %ehselector.slot, !dbg !446
  invoke void @_ZNSsD1Ev(%"class.std::basic_string"* %ref.tmp)
          to label %invoke.cont12 unwind label %terminate.lpad, !dbg !447

invoke.cont12:                                    ; preds = %lpad2
  br label %ehcleanup, !dbg !448

ehcleanup:                                        ; preds = %invoke.cont12, %lpad
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp1) #1, !dbg !450
  br label %eh.resume, !dbg !450

eh.resume:                                        ; preds = %ehcleanup
  %exn = load i8*, i8** %exn.slot, !dbg !452
  %sel = load i32, i32* %ehselector.slot, !dbg !452
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !452
  %lpad.val13 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !452
  resume { i8*, i32 } %lpad.val13, !dbg !452

terminate.lpad:                                   ; preds = %lpad2
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null, !dbg !454
  %9 = extractvalue { i8*, i32 } %8, 0, !dbg !454
  call void @__clang_call_terminate(i8* %9) #6, !dbg !454
  unreachable, !dbg !454
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKSbIS4_S5_T1_E(%"class.std::basic_ostream"* dereferenceable(272), %"class.std::basic_string"* dereferenceable(8)) #0

; Function Attrs: nounwind
declare void @_ZNSaIcEC1Ev(%"class.std::allocator"*) #4

declare void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"*, i8*, %"class.std::allocator"* dereferenceable(1)) #0

declare i32 @__gxx_personality_v0(...)

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #0

declare void @_ZNSsD1Ev(%"class.std::basic_string"*) #0

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #5 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #1
  call void @_ZSt9terminatev() #6
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: nounwind
declare void @_ZNSaIcED1Ev(%"class.std::allocator"*) #4

define internal void @_GLOBAL__sub_I_printLine.cpp() section ".text.startup" {
entry:
  call void @__cxx_global_var_init(), !dbg !456
  ret void
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline noreturn nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!421, !422}
!llvm.ident = !{!423}

!0 = !MDCompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.7.0 (trunk) (https://github.com/C0deZLee/llvm-dsa.git b7dc7a26581aad11533265c60683982d0519e96d)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !47, globals: !58, imports: !60)
!1 = !MDFile(filename: "/home/troy/research/llvm-dsa/ResearchTests/instrumentation/BBInfo/printLine.cpp", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!2 = !{}
!3 = !{!4, !10, !19, !21, !28, !29, !31, !35}
!4 = !MDCompositeType(tag: DW_TAG_structure_type, file: !5, line: 82, size: 64, align: 32, elements: !6, identifier: "_ZTS11__mbstate_t")
!5 = !MDFile(filename: "/usr/include/wchar.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!6 = !{!7, !9}
!7 = !MDDerivedType(tag: DW_TAG_member, name: "__count", scope: !"_ZTS11__mbstate_t", file: !5, line: 84, baseType: !8, size: 32, align: 32)
!8 = !MDBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!9 = !MDDerivedType(tag: DW_TAG_member, name: "__value", scope: !"_ZTS11__mbstate_t", file: !5, line: 93, baseType: !"_ZTSN11__mbstate_tUt_E", size: 32, align: 32, offset: 32)
!10 = !MDCompositeType(tag: DW_TAG_union_type, scope: !"_ZTS11__mbstate_t", file: !5, line: 85, size: 32, align: 32, elements: !11, identifier: "_ZTSN11__mbstate_tUt_E")
!11 = !{!12, !14}
!12 = !MDDerivedType(tag: DW_TAG_member, name: "__wch", scope: !"_ZTSN11__mbstate_tUt_E", file: !5, line: 88, baseType: !13, size: 32, align: 32)
!13 = !MDBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!14 = !MDDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !"_ZTSN11__mbstate_tUt_E", file: !5, line: 92, baseType: !15, size: 32, align: 8)
!15 = !MDCompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, align: 8, elements: !17)
!16 = !MDBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !MDSubrange(count: 4)
!19 = !MDCompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !20, line: 245, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!20 = !MDFile(filename: "/usr/include/libio.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!21 = !MDCompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1, size: 192, align: 64, elements: !22, identifier: "_ZTS13__va_list_tag")
!22 = !{!23, !24, !25, !27}
!23 = !MDDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !"_ZTS13__va_list_tag", file: !1, baseType: !13, size: 32, align: 32)
!24 = !MDDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !"_ZTS13__va_list_tag", file: !1, baseType: !13, size: 32, align: 32, offset: 32)
!25 = !MDDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !"_ZTS13__va_list_tag", file: !1, baseType: !26, size: 64, align: 64, offset: 64)
!26 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!27 = !MDDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !"_ZTS13__va_list_tag", file: !1, baseType: !26, size: 64, align: 64, offset: 128)
!28 = !MDCompositeType(tag: DW_TAG_structure_type, name: "tm", file: !5, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!29 = !MDCompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !30, line: 53, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!30 = !MDFile(filename: "/usr/include/locale.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!31 = !MDCompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !33, file: !32, line: 205, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!32 = !MDFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/ios_base.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!33 = !MDNamespace(name: "std", scope: null, file: !34, line: 184)
!34 = !MDFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/c++config.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!35 = !MDCompositeType(tag: DW_TAG_class_type, name: "Init", scope: !"_ZTSSt8ios_base", file: !32, line: 539, size: 8, align: 8, elements: !36, identifier: "_ZTSNSt8ios_base4InitE")
!36 = !{!37, !40, !42, !46}
!37 = !MDDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !"_ZTSNSt8ios_base4InitE", file: !32, line: 547, baseType: !38, flags: DIFlagStaticMember)
!38 = !MDDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !39, line: 32, baseType: !8)
!39 = !MDFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/atomic_word.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!40 = !MDDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !"_ZTSNSt8ios_base4InitE", file: !32, line: 548, baseType: !41, flags: DIFlagStaticMember)
!41 = !MDBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!42 = !MDSubprogram(name: "Init", scope: !"_ZTSNSt8ios_base4InitE", file: !32, line: 543, type: !43, isLocal: false, isDefinition: false, scopeLine: 543, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!43 = !MDSubroutineType(types: !44)
!44 = !{null, !45}
!45 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSNSt8ios_base4InitE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!46 = !MDSubprogram(name: "~Init", scope: !"_ZTSNSt8ios_base4InitE", file: !32, line: 544, type: !43, isLocal: false, isDefinition: false, scopeLine: 544, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!47 = !{!48, !52, !56}
!48 = !MDSubprogram(name: "__cxx_global_var_init", scope: !49, file: !49, line: 74, type: !50, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @__cxx_global_var_init, variables: !2)
!49 = !MDFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/iostream", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!50 = !MDSubroutineType(types: !51)
!51 = !{null}
!52 = !MDSubprogram(name: "printBBEntry", linkageName: "_Z12printBBEntryiPc", scope: !1, file: !1, line: 9, type: !53, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, function: void (i32, i8*)* @_Z12printBBEntryiPc, variables: !2)
!53 = !MDSubroutineType(types: !54)
!54 = !{null, !8, !55}
!55 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!56 = !MDSubprogram(linkageName: "_GLOBAL__sub_I_printLine.cpp", scope: !1, file: !1, type: !57, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, function: void ()* @_GLOBAL__sub_I_printLine.cpp, variables: !2)
!57 = !MDSubroutineType(types: !2)
!58 = !{!59}
!59 = !MDGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !33, file: !49, line: 74, type: !"_ZTSNSt8ios_base4InitE", isLocal: true, isDefinition: true, variable: %"class.std::ios_base::Init"* @_ZStL8__ioinit)
!60 = !{!61, !64, !67, !71, !78, !86, !90, !97, !101, !105, !107, !109, !113, !124, !128, !134, !140, !142, !146, !150, !154, !158, !164, !166, !170, !174, !178, !180, !185, !189, !193, !195, !197, !201, !208, !212, !216, !220, !222, !228, !230, !237, !242, !246, !251, !255, !259, !263, !265, !267, !271, !275, !279, !281, !285, !289, !291, !293, !297, !304, !309, !314, !315, !316, !317, !321, !322, !326, !331, !336, !338, !340, !342, !344, !346, !348, !350, !352, !354, !356, !358, !360, !362, !364, !371, !373, !374, !376, !378, !380, !382, !386, !388, !390, !392, !394, !396, !398, !400, !402, !406, !410, !412, !416, !420}
!61 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !62, line: 64)
!62 = !MDDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !5, line: 106, baseType: !63)
!63 = !MDDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !5, line: 94, baseType: !"_ZTS11__mbstate_t")
!64 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !65, line: 139)
!65 = !MDDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !66, line: 132, baseType: !13)
!66 = !MDFile(filename: "/home/troy/research/llvm-dsa/Debug+Asserts/bin/../lib/clang/3.7.0/include/stddef.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!67 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !68, line: 141)
!68 = !MDSubprogram(name: "btowc", scope: !5, file: !5, line: 353, type: !69, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !MDSubroutineType(types: !70)
!70 = !{!65, !8}
!71 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !72, line: 142)
!72 = !MDSubprogram(name: "fgetwc", scope: !5, file: !5, line: 745, type: !73, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !MDSubroutineType(types: !74)
!74 = !{!65, !75}
!75 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64, align: 64)
!76 = !MDDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !77, line: 64, baseType: !"_ZTS8_IO_FILE")
!77 = !MDFile(filename: "/usr/include/stdio.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!78 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !79, line: 143)
!79 = !MDSubprogram(name: "fgetws", scope: !5, file: !5, line: 774, type: !80, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !MDSubroutineType(types: !81)
!81 = !{!82, !84, !8, !85}
!82 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64, align: 64)
!83 = !MDBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!84 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !82)
!85 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !75)
!86 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !87, line: 144)
!87 = !MDSubprogram(name: "fputwc", scope: !5, file: !5, line: 759, type: !88, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !MDSubroutineType(types: !89)
!89 = !{!65, !83, !75}
!90 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !91, line: 145)
!91 = !MDSubprogram(name: "fputws", scope: !5, file: !5, line: 781, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !MDSubroutineType(types: !93)
!93 = !{!8, !94, !85}
!94 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !95)
!95 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64, align: 64)
!96 = !MDDerivedType(tag: DW_TAG_const_type, baseType: !83)
!97 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !98, line: 146)
!98 = !MDSubprogram(name: "fwide", scope: !5, file: !5, line: 587, type: !99, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !MDSubroutineType(types: !100)
!100 = !{!8, !75, !8}
!101 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !102, line: 147)
!102 = !MDSubprogram(name: "fwprintf", scope: !5, file: !5, line: 594, type: !103, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !MDSubroutineType(types: !104)
!104 = !{!8, !85, !94, null}
!105 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !106, line: 148)
!106 = !MDSubprogram(name: "fwscanf", scope: !5, file: !5, line: 635, type: !103, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !108, line: 149)
!108 = !MDSubprogram(name: "getwc", scope: !5, file: !5, line: 746, type: !73, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !110, line: 150)
!110 = !MDSubprogram(name: "getwchar", scope: !5, file: !5, line: 752, type: !111, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !MDSubroutineType(types: !112)
!112 = !{!65}
!113 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !114, line: 151)
!114 = !MDSubprogram(name: "mbrlen", scope: !5, file: !5, line: 376, type: !115, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !MDSubroutineType(types: !116)
!116 = !{!117, !119, !117, !122}
!117 = !MDDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !66, line: 62, baseType: !118)
!118 = !MDBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!119 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !120)
!120 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64, align: 64)
!121 = !MDDerivedType(tag: DW_TAG_const_type, baseType: !16)
!122 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !123)
!123 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64, align: 64)
!124 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !125, line: 152)
!125 = !MDSubprogram(name: "mbrtowc", scope: !5, file: !5, line: 365, type: !126, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !MDSubroutineType(types: !127)
!127 = !{!117, !84, !119, !117, !122}
!128 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !129, line: 153)
!129 = !MDSubprogram(name: "mbsinit", scope: !5, file: !5, line: 361, type: !130, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !MDSubroutineType(types: !131)
!131 = !{!8, !132}
!132 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64, align: 64)
!133 = !MDDerivedType(tag: DW_TAG_const_type, baseType: !62)
!134 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !135, line: 154)
!135 = !MDSubprogram(name: "mbsrtowcs", scope: !5, file: !5, line: 408, type: !136, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !MDSubroutineType(types: !137)
!137 = !{!117, !84, !138, !117, !122}
!138 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !139)
!139 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64, align: 64)
!140 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !141, line: 155)
!141 = !MDSubprogram(name: "putwc", scope: !5, file: !5, line: 760, type: !88, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !143, line: 156)
!143 = !MDSubprogram(name: "putwchar", scope: !5, file: !5, line: 766, type: !144, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !MDSubroutineType(types: !145)
!145 = !{!65, !83}
!146 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !147, line: 158)
!147 = !MDSubprogram(name: "swprintf", scope: !5, file: !5, line: 604, type: !148, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !MDSubroutineType(types: !149)
!149 = !{!8, !84, !117, !94, null}
!150 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !151, line: 160)
!151 = !MDSubprogram(name: "swscanf", scope: !5, file: !5, line: 645, type: !152, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!152 = !MDSubroutineType(types: !153)
!153 = !{!8, !94, !94, null}
!154 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !155, line: 161)
!155 = !MDSubprogram(name: "ungetwc", scope: !5, file: !5, line: 789, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !MDSubroutineType(types: !157)
!157 = !{!65, !65, !75}
!158 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !159, line: 162)
!159 = !MDSubprogram(name: "vfwprintf", scope: !5, file: !5, line: 612, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !MDSubroutineType(types: !161)
!161 = !{!8, !85, !94, !162}
!162 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64, align: 64)
!163 = !MDDerivedType(tag: DW_TAG_typedef, name: "__va_list_tag", file: !1, baseType: !"_ZTS13__va_list_tag")
!164 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !165, line: 164)
!165 = !MDSubprogram(name: "vfwscanf", scope: !5, file: !5, line: 689, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !167, line: 167)
!167 = !MDSubprogram(name: "vswprintf", scope: !5, file: !5, line: 625, type: !168, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !MDSubroutineType(types: !169)
!169 = !{!8, !84, !117, !94, !162}
!170 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !171, line: 170)
!171 = !MDSubprogram(name: "vswscanf", scope: !5, file: !5, line: 701, type: !172, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !MDSubroutineType(types: !173)
!173 = !{!8, !94, !94, !162}
!174 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !175, line: 172)
!175 = !MDSubprogram(name: "vwprintf", scope: !5, file: !5, line: 620, type: !176, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !MDSubroutineType(types: !177)
!177 = !{!8, !94, !162}
!178 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !179, line: 174)
!179 = !MDSubprogram(name: "vwscanf", scope: !5, file: !5, line: 697, type: !176, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !181, line: 176)
!181 = !MDSubprogram(name: "wcrtomb", scope: !5, file: !5, line: 370, type: !182, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !MDSubroutineType(types: !183)
!183 = !{!117, !184, !83, !122}
!184 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !55)
!185 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !186, line: 177)
!186 = !MDSubprogram(name: "wcscat", scope: !5, file: !5, line: 155, type: !187, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !MDSubroutineType(types: !188)
!188 = !{!82, !84, !94}
!189 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !190, line: 178)
!190 = !MDSubprogram(name: "wcscmp", scope: !5, file: !5, line: 163, type: !191, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !MDSubroutineType(types: !192)
!192 = !{!8, !95, !95}
!193 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !194, line: 179)
!194 = !MDSubprogram(name: "wcscoll", scope: !5, file: !5, line: 192, type: !191, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !196, line: 180)
!196 = !MDSubprogram(name: "wcscpy", scope: !5, file: !5, line: 147, type: !187, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !198, line: 181)
!198 = !MDSubprogram(name: "wcscspn", scope: !5, file: !5, line: 252, type: !199, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !MDSubroutineType(types: !200)
!200 = !{!117, !95, !95}
!201 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !202, line: 182)
!202 = !MDSubprogram(name: "wcsftime", scope: !5, file: !5, line: 855, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !MDSubroutineType(types: !204)
!204 = !{!117, !84, !117, !94, !205}
!205 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !206)
!206 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64, align: 64)
!207 = !MDDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTS2tm")
!208 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !209, line: 183)
!209 = !MDSubprogram(name: "wcslen", scope: !5, file: !5, line: 287, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !MDSubroutineType(types: !211)
!211 = !{!117, !95}
!212 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !213, line: 184)
!213 = !MDSubprogram(name: "wcsncat", scope: !5, file: !5, line: 158, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !MDSubroutineType(types: !215)
!215 = !{!82, !84, !94, !117}
!216 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !217, line: 185)
!217 = !MDSubprogram(name: "wcsncmp", scope: !5, file: !5, line: 166, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !MDSubroutineType(types: !219)
!219 = !{!8, !95, !95, !117}
!220 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !221, line: 186)
!221 = !MDSubprogram(name: "wcsncpy", scope: !5, file: !5, line: 150, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !223, line: 187)
!223 = !MDSubprogram(name: "wcsrtombs", scope: !5, file: !5, line: 414, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !MDSubroutineType(types: !225)
!225 = !{!117, !184, !226, !117, !122}
!226 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !227)
!227 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64, align: 64)
!228 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !229, line: 188)
!229 = !MDSubprogram(name: "wcsspn", scope: !5, file: !5, line: 256, type: !199, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !231, line: 189)
!231 = !MDSubprogram(name: "wcstod", scope: !5, file: !5, line: 450, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !MDSubroutineType(types: !233)
!233 = !{!234, !94, !235}
!234 = !MDBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!235 = !MDDerivedType(tag: DW_TAG_restrict_type, baseType: !236)
!236 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64, align: 64)
!237 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !238, line: 191)
!238 = !MDSubprogram(name: "wcstof", scope: !5, file: !5, line: 457, type: !239, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !MDSubroutineType(types: !240)
!240 = !{!241, !94, !235}
!241 = !MDBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!242 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !243, line: 193)
!243 = !MDSubprogram(name: "wcstok", scope: !5, file: !5, line: 282, type: !244, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !MDSubroutineType(types: !245)
!245 = !{!82, !84, !94, !235}
!246 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !247, line: 194)
!247 = !MDSubprogram(name: "wcstol", scope: !5, file: !5, line: 468, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !MDSubroutineType(types: !249)
!249 = !{!250, !94, !235, !8}
!250 = !MDBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!251 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !252, line: 195)
!252 = !MDSubprogram(name: "wcstoul", scope: !5, file: !5, line: 473, type: !253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !MDSubroutineType(types: !254)
!254 = !{!118, !94, !235, !8}
!255 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !256, line: 196)
!256 = !MDSubprogram(name: "wcsxfrm", scope: !5, file: !5, line: 196, type: !257, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !MDSubroutineType(types: !258)
!258 = !{!117, !84, !94, !117}
!259 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !260, line: 197)
!260 = !MDSubprogram(name: "wctob", scope: !5, file: !5, line: 357, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !MDSubroutineType(types: !262)
!262 = !{!8, !65}
!263 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !264, line: 198)
!264 = !MDSubprogram(name: "wmemcmp", scope: !5, file: !5, line: 325, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !266, line: 199)
!266 = !MDSubprogram(name: "wmemcpy", scope: !5, file: !5, line: 329, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !268, line: 200)
!268 = !MDSubprogram(name: "wmemmove", scope: !5, file: !5, line: 334, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !MDSubroutineType(types: !270)
!270 = !{!82, !82, !95, !117}
!271 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !272, line: 201)
!272 = !MDSubprogram(name: "wmemset", scope: !5, file: !5, line: 338, type: !273, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !MDSubroutineType(types: !274)
!274 = !{!82, !82, !83, !117}
!275 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !276, line: 202)
!276 = !MDSubprogram(name: "wprintf", scope: !5, file: !5, line: 601, type: !277, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !MDSubroutineType(types: !278)
!278 = !{!8, !94, null}
!279 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !280, line: 203)
!280 = !MDSubprogram(name: "wscanf", scope: !5, file: !5, line: 642, type: !277, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !282, line: 204)
!282 = !MDSubprogram(name: "wcschr", scope: !5, file: !5, line: 227, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !MDSubroutineType(types: !284)
!284 = !{!82, !95, !83}
!285 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !286, line: 205)
!286 = !MDSubprogram(name: "wcspbrk", scope: !5, file: !5, line: 266, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !MDSubroutineType(types: !288)
!288 = !{!82, !95, !95}
!289 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !290, line: 206)
!290 = !MDSubprogram(name: "wcsrchr", scope: !5, file: !5, line: 237, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !292, line: 207)
!292 = !MDSubprogram(name: "wcsstr", scope: !5, file: !5, line: 277, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !294, line: 208)
!294 = !MDSubprogram(name: "wmemchr", scope: !5, file: !5, line: 320, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !MDSubroutineType(types: !296)
!296 = !{!82, !95, !83, !117}
!297 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !298, entity: !300, line: 248)
!298 = !MDNamespace(name: "__gnu_cxx", scope: null, file: !299, line: 241)
!299 = !MDFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cwchar", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!300 = !MDSubprogram(name: "wcstold", scope: !5, file: !5, line: 459, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !MDSubroutineType(types: !302)
!302 = !{!303, !94, !235}
!303 = !MDBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!304 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !298, entity: !305, line: 257)
!305 = !MDSubprogram(name: "wcstoll", scope: !5, file: !5, line: 483, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !MDSubroutineType(types: !307)
!307 = !{!308, !94, !235, !8}
!308 = !MDBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!309 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !298, entity: !310, line: 258)
!310 = !MDSubprogram(name: "wcstoull", scope: !5, file: !5, line: 490, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!311 = !MDSubroutineType(types: !312)
!312 = !{!313, !94, !235, !8}
!313 = !MDBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!314 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !300, line: 264)
!315 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !305, line: 265)
!316 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !310, line: 266)
!317 = !MDImportedEntity(tag: DW_TAG_imported_module, scope: !318, entity: !320, line: 56)
!318 = !MDNamespace(name: "__gnu_debug", scope: null, file: !319, line: 54)
!319 = !MDFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!320 = !MDNamespace(name: "__debug", scope: !33, file: !319, line: 48)
!321 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !"_ZTS5lconv", line: 53)
!322 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !323, line: 54)
!323 = !MDSubprogram(name: "setlocale", scope: !30, file: !30, line: 124, type: !324, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !MDSubroutineType(types: !325)
!325 = !{!55, !8, !120}
!326 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !327, line: 55)
!327 = !MDSubprogram(name: "localeconv", scope: !30, file: !30, line: 127, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !MDSubroutineType(types: !329)
!329 = !{!330}
!330 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS5lconv", size: 64, align: 64)
!331 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !332, line: 64)
!332 = !MDSubprogram(name: "isalnum", scope: !333, file: !333, line: 110, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !MDFile(filename: "/usr/include/ctype.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!334 = !MDSubroutineType(types: !335)
!335 = !{!8, !8}
!336 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !337, line: 65)
!337 = !MDSubprogram(name: "isalpha", scope: !333, file: !333, line: 111, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !339, line: 66)
!339 = !MDSubprogram(name: "iscntrl", scope: !333, file: !333, line: 112, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !341, line: 67)
!341 = !MDSubprogram(name: "isdigit", scope: !333, file: !333, line: 113, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !343, line: 68)
!343 = !MDSubprogram(name: "isgraph", scope: !333, file: !333, line: 115, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !345, line: 69)
!345 = !MDSubprogram(name: "islower", scope: !333, file: !333, line: 114, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !347, line: 70)
!347 = !MDSubprogram(name: "isprint", scope: !333, file: !333, line: 116, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !349, line: 71)
!349 = !MDSubprogram(name: "ispunct", scope: !333, file: !333, line: 117, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !351, line: 72)
!351 = !MDSubprogram(name: "isspace", scope: !333, file: !333, line: 118, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !353, line: 73)
!353 = !MDSubprogram(name: "isupper", scope: !333, file: !333, line: 119, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !355, line: 74)
!355 = !MDSubprogram(name: "isxdigit", scope: !333, file: !333, line: 120, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !357, line: 75)
!357 = !MDSubprogram(name: "tolower", scope: !333, file: !333, line: 124, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!358 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !359, line: 76)
!359 = !MDSubprogram(name: "toupper", scope: !333, file: !333, line: 127, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !298, entity: !361, line: 44)
!361 = !MDDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !33, file: !34, line: 186, baseType: !118)
!362 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !298, entity: !363, line: 45)
!363 = !MDDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !33, file: !34, line: 187, baseType: !250)
!364 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !365, line: 82)
!365 = !MDDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !366, line: 186, baseType: !367)
!366 = !MDFile(filename: "/usr/include/wctype.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!367 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 64, align: 64)
!368 = !MDDerivedType(tag: DW_TAG_const_type, baseType: !369)
!369 = !MDDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !370, line: 40, baseType: !8)
!370 = !MDFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!371 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !372, line: 83)
!372 = !MDDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !366, line: 52, baseType: !118)
!373 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !65, line: 84)
!374 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !375, line: 86)
!375 = !MDSubprogram(name: "iswalnum", scope: !366, file: !366, line: 111, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !377, line: 87)
!377 = !MDSubprogram(name: "iswalpha", scope: !366, file: !366, line: 117, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !379, line: 89)
!379 = !MDSubprogram(name: "iswblank", scope: !366, file: !366, line: 162, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !381, line: 91)
!381 = !MDSubprogram(name: "iswcntrl", scope: !366, file: !366, line: 120, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!382 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !383, line: 92)
!383 = !MDSubprogram(name: "iswctype", scope: !366, file: !366, line: 175, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !MDSubroutineType(types: !385)
!385 = !{!8, !65, !372}
!386 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !387, line: 93)
!387 = !MDSubprogram(name: "iswdigit", scope: !366, file: !366, line: 124, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !389, line: 94)
!389 = !MDSubprogram(name: "iswgraph", scope: !366, file: !366, line: 128, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !391, line: 95)
!391 = !MDSubprogram(name: "iswlower", scope: !366, file: !366, line: 133, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !393, line: 96)
!393 = !MDSubprogram(name: "iswprint", scope: !366, file: !366, line: 136, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !395, line: 97)
!395 = !MDSubprogram(name: "iswpunct", scope: !366, file: !366, line: 141, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !397, line: 98)
!397 = !MDSubprogram(name: "iswspace", scope: !366, file: !366, line: 146, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!398 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !399, line: 99)
!399 = !MDSubprogram(name: "iswupper", scope: !366, file: !366, line: 151, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !401, line: 100)
!401 = !MDSubprogram(name: "iswxdigit", scope: !366, file: !366, line: 156, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !403, line: 101)
!403 = !MDSubprogram(name: "towctrans", scope: !366, file: !366, line: 221, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !MDSubroutineType(types: !405)
!405 = !{!65, !65, !365}
!406 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !407, line: 102)
!407 = !MDSubprogram(name: "towlower", scope: !366, file: !366, line: 194, type: !408, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !MDSubroutineType(types: !409)
!409 = !{!65, !65}
!410 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !411, line: 103)
!411 = !MDSubprogram(name: "towupper", scope: !366, file: !366, line: 197, type: !408, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!412 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !413, line: 104)
!413 = !MDSubprogram(name: "wctrans", scope: !366, file: !366, line: 218, type: !414, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!414 = !MDSubroutineType(types: !415)
!415 = !{!365, !120}
!416 = !MDImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !417, line: 105)
!417 = !MDSubprogram(name: "wctype", scope: !366, file: !366, line: 171, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !MDSubroutineType(types: !419)
!419 = !{!372, !120}
!420 = !MDImportedEntity(tag: DW_TAG_imported_module, scope: !0, entity: !33, line: 6)
!421 = !{i32 2, !"Dwarf Version", i32 4}
!422 = !{i32 2, !"Debug Info Version", i32 3}
!423 = !{!"clang version 3.7.0 (trunk) (https://github.com/C0deZLee/llvm-dsa.git b7dc7a26581aad11533265c60683982d0519e96d)"}
!424 = !MDLocation(line: 74, column: 25, scope: !48)
!425 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "ln", arg: 1, scope: !52, file: !1, line: 9, type: !8)
!426 = !MDExpression()
!427 = !MDLocation(line: 9, column: 23, scope: !52)
!428 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "filename", arg: 2, scope: !52, file: !1, line: 9, type: !55)
!429 = !MDLocation(line: 9, column: 33, scope: !52)
!430 = !MDLocation(line: 10, column: 7, scope: !52)
!431 = !MDLocation(line: 10, column: 53, scope: !52)
!432 = !MDLocation(line: 10, column: 45, scope: !52)
!433 = !MDLocation(line: 10, column: 42, scope: !434)
!434 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!435 = !MDLocation(line: 10, column: 62, scope: !436)
!436 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 2)
!437 = !MDLocation(line: 10, column: 82, scope: !438)
!438 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 3)
!439 = !MDLocation(line: 10, column: 79, scope: !52)
!440 = !MDLocation(line: 10, column: 85, scope: !441)
!441 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 4)
!442 = !MDLocation(line: 10, column: 2, scope: !443)
!443 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 5)
!444 = !MDLocation(line: 10, column: 2, scope: !445)
!445 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 6)
!446 = !MDLocation(line: 11, column: 1, scope: !52)
!447 = !MDLocation(line: 10, column: 2, scope: !52)
!448 = !MDLocation(line: 10, column: 2, scope: !449)
!449 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 7)
!450 = !MDLocation(line: 10, column: 2, scope: !451)
!451 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 9)
!452 = !MDLocation(line: 10, column: 2, scope: !453)
!453 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 10)
!454 = !MDLocation(line: 10, column: 2, scope: !455)
!455 = !MDLexicalBlockFile(scope: !52, file: !1, discriminator: 8)
!456 = !MDLocation(line: 0, scope: !56)
