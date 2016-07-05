; ModuleID = 'gcd.g.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"gcd(%d, %d)\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str2 = private unnamed_addr constant [66 x i8] c"/home/troy/research/llvm-dsa/ResearchTests/benchmarks/gcd/gcd.cpp\00"

; Function Attrs: uwtable
define i32 @_Z3gcdjj(i32 %n1, i32 %n2) #0 {
entry:
  %retval = alloca i32, align 4
  %n1.addr = alloca i32, align 4
  %n2.addr = alloca i32, align 4
  store i32 %n1, i32* %n1.addr, align 4
  call void (...) @_Z12printBBEntryiPc(i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str2, i32 0, i32 0)), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %n1.addr, metadata !19, metadata !20), !dbg !18
  store i32 %n2, i32* %n2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n2.addr, metadata !21, metadata !20), !dbg !22
  %0 = load i32, i32* %n1.addr, align 4, !dbg !23
  %1 = load i32, i32* %n2.addr, align 4, !dbg !24
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %1), !dbg !25
  %2 = load i32, i32* %n2.addr, align 4, !dbg !26
  %cmp = icmp eq i32 %2, 0, !dbg !28
  br i1 %cmp, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  call void (...) @_Z12printBBEntryiPc(i32 7, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str2, i32 0, i32 0)), !dbg !30
  %3 = load i32, i32* %n1.addr, align 4, !dbg !30
  store i32 %3, i32* %retval, !dbg !31
  br label %return, !dbg !31

if.else:                                          ; preds = %entry
  call void (...) @_Z12printBBEntryiPc(i32 9, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str2, i32 0, i32 0)), !dbg !32
  %4 = load i32, i32* %n2.addr, align 4, !dbg !32
  %5 = load i32, i32* %n1.addr, align 4, !dbg !33
  %6 = load i32, i32* %n2.addr, align 4, !dbg !34
  %rem = urem i32 %5, %6, !dbg !35
  %call1 = call i32 @_Z3gcdjj(i32 %4, i32 %rem), !dbg !36
  store i32 %call1, i32* %retval, !dbg !37
  br label %return, !dbg !37

return:                                           ; preds = %if.else, %if.then
  call void (...) @_Z12printBBEntryiPc(i32 11, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str2, i32 0, i32 0)), !dbg !38
  %7 = load i32, i32* %retval, !dbg !38
  ret i32 %7, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void (...) @_Z12printBBEntryiPc(i32 13, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str2, i32 0, i32 0)), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !40, metadata !20), !dbg !39
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !41, metadata !20), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %a, metadata !43, metadata !20), !dbg !44
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !45
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !45
  %call = call i32 @atoi(i8* %1) #4, !dbg !46
  store i32 %call, i32* %a, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %b, metadata !47, metadata !20), !dbg !48
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !49
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !49
  %call2 = call i32 @atoi(i8* %3) #4, !dbg !50
  store i32 %call2, i32* %b, align 4, !dbg !48
  %4 = load i32, i32* %a, align 4, !dbg !51
  %5 = load i32, i32* %b, align 4, !dbg !52
  %call3 = call i32 @_Z3gcdjj(i32 %4, i32 %5), !dbg !53
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0), i32 %call3), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare void @_Z12printBBEntryiPc(...)

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = !MDCompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.7.0 (trunk) (https://github.com/C0deZLee/llvm-dsa.git b7dc7a26581aad11533265c60683982d0519e96d)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !2, subprograms: !3, globals: !2, imports: !2)
!1 = !MDFile(filename: "/home/troy/research/llvm-dsa/ResearchTests/benchmarks/gcd/gcd.cpp", directory: "/home/troy/research/llvm-dsa/ResearchTests/tmp")
!2 = !{}
!3 = !{!4, !8}
!4 = !MDSubprogram(name: "gcd", linkageName: "_Z3gcdjj", scope: !1, file: !1, line: 4, type: !5, isLocal: false, isDefinition: true, scopeLine: 4, flags: DIFlagPrototyped, isOptimized: false, function: i32 (i32, i32)* @_Z3gcdjj, variables: !2)
!5 = !MDSubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !MDBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!8 = !MDSubprogram(name: "main", scope: !1, file: !1, line: 13, type: !9, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, function: i32 (i32, i8**)* @main, variables: !2)
!9 = !MDSubroutineType(types: !10)
!10 = !{!11, !11, !12}
!11 = !MDBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !MDDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !MDBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.7.0 (trunk) (https://github.com/C0deZLee/llvm-dsa.git b7dc7a26581aad11533265c60683982d0519e96d)"}
!18 = !MDLocation(line: 4, column: 32, scope: !4)
!19 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "n1", arg: 1, scope: !4, file: !1, line: 4, type: !7)
!20 = !MDExpression()
!21 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "n2", arg: 2, scope: !4, file: !1, line: 4, type: !7)
!22 = !MDLocation(line: 4, column: 49, scope: !4)
!23 = !MDLocation(line: 5, column: 26, scope: !4)
!24 = !MDLocation(line: 5, column: 30, scope: !4)
!25 = !MDLocation(line: 5, column: 2, scope: !4)
!26 = !MDLocation(line: 6, column: 6, scope: !27)
!27 = distinct !MDLexicalBlock(scope: !4, file: !1, line: 6, column: 6)
!28 = !MDLocation(line: 6, column: 9, scope: !27)
!29 = !MDLocation(line: 6, column: 6, scope: !4)
!30 = !MDLocation(line: 7, column: 10, scope: !27)
!31 = !MDLocation(line: 7, column: 3, scope: !27)
!32 = !MDLocation(line: 9, column: 14, scope: !27)
!33 = !MDLocation(line: 9, column: 18, scope: !27)
!34 = !MDLocation(line: 9, column: 23, scope: !27)
!35 = !MDLocation(line: 9, column: 21, scope: !27)
!36 = !MDLocation(line: 9, column: 10, scope: !27)
!37 = !MDLocation(line: 9, column: 3, scope: !27)
!38 = !MDLocation(line: 11, column: 1, scope: !4)
!39 = !MDLocation(line: 13, column: 14, scope: !8)
!40 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "argc", arg: 1, scope: !8, file: !1, line: 13, type: !11)
!41 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "argv", arg: 2, scope: !8, file: !1, line: 13, type: !12)
!42 = !MDLocation(line: 13, column: 26, scope: !8)
!43 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "a", scope: !8, file: !1, line: 14, type: !11)
!44 = !MDLocation(line: 14, column: 6, scope: !8)
!45 = !MDLocation(line: 14, column: 15, scope: !8)
!46 = !MDLocation(line: 14, column: 10, scope: !8)
!47 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "b", scope: !8, file: !1, line: 14, type: !11)
!48 = !MDLocation(line: 14, column: 25, scope: !8)
!49 = !MDLocation(line: 14, column: 34, scope: !8)
!50 = !MDLocation(line: 14, column: 29, scope: !8)
!51 = !MDLocation(line: 15, column: 24, scope: !8)
!52 = !MDLocation(line: 15, column: 27, scope: !8)
!53 = !MDLocation(line: 15, column: 20, scope: !8)
!54 = !MDLocation(line: 15, column: 5, scope: !8)
!55 = !MDLocation(line: 16, column: 5, scope: !8)
