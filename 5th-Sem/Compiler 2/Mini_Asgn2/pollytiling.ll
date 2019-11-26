; ModuleID = 'matmul.c'
source_filename = "matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common dso_local local_unnamed_addr global [1536 x [1536 x float]] zeroinitializer, align 16
@B = common dso_local local_unnamed_addr global [1536 x [1536 x float]] zeroinitializer, align 16
@stdout = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@C = common dso_local local_unnamed_addr global [1536 x [1536 x float]] zeroinitializer, align 16

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @init_array() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc17, %entry
  %indvars.iv34 = phi i64 [ 0, %entry ], [ %indvars.iv.next35, %for.inc17 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.1, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv, %indvars.iv34
  %1 = trunc i64 %0 to i32
  %rem = and i32 %1, 1022
  %add = or i32 %rem, 1
  %conv = sitofp i32 %add to double
  %div = fmul double %conv, 5.000000e-01
  %conv4 = fptrunc double %div to float
  %arrayidx6 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %indvars.iv34, i64 %indvars.iv
  store float %conv4, float* %arrayidx6, align 8, !tbaa !2
  %arrayidx16 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %indvars.iv34, i64 %indvars.iv
  store float %conv4, float* %arrayidx16, align 8, !tbaa !2
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv34
  %3 = trunc i64 %2 to i32
  %rem.1 = and i32 %3, 1023
  %add.1 = add nuw nsw i32 %rem.1, 1
  %conv.1 = sitofp i32 %add.1 to double
  %div.1 = fmul double %conv.1, 5.000000e-01
  %conv4.1 = fptrunc double %div.1 to float
  %arrayidx6.1 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %indvars.iv34, i64 %indvars.iv.next
  store float %conv4.1, float* %arrayidx6.1, align 4, !tbaa !2
  %arrayidx16.1 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %indvars.iv34, i64 %indvars.iv.next
  store float %conv4.1, float* %arrayidx16.1, align 4, !tbaa !2
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1536
  br i1 %exitcond.1, label %for.inc17, label %for.body3

for.inc17:                                        ; preds = %for.body3
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1536
  br i1 %exitcond36, label %for.end19, label %for.cond1.preheader

for.end19:                                        ; preds = %for.inc17
  ret void
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_array() local_unnamed_addr #1 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next27, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !6
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %4, %for.inc ]
  %j.024 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %indvars.iv26, i64 %indvars.iv
  %2 = load float, float* %arrayidx5, align 4, !tbaa !2
  %conv = fpext float %2 to double
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double %conv)
  %rem.lhs.trunc = trunc i32 %j.024 to i16
  %rem23 = urem i16 %rem.lhs.trunc, 80
  %cmp6 = icmp eq i16 %rem23, 79
  br i1 %cmp6, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !6
  %fputc22 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3)
  br label %for.inc

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %inc = add nuw nsw i32 %j.024, 1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !6
  %exitcond = icmp eq i64 %indvars.iv.next, 1536
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.inc
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1536
  br i1 %exitcond28, label %for.end12, label %for.cond1.preheader

for.end12:                                        ; preds = %for.end
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
entry:
  %Packed_B918 = alloca [1048576 x float], align 64
  %Packed_A920 = alloca [49152 x float], align 64
  br label %polly.loop_header

polly.exiting:                                    ; preds = %polly.loop_exit147
  ret i32 0

polly.loop_header:                                ; preds = %polly.loop_exit58, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit58 ]
  %0 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_header56

polly.loop_exit58:                                ; preds = %polly.loop_exit64
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond982 = icmp eq i64 %polly.indvar_next, 48
  br i1 %exitcond982, label %polly.loop_header75, label %polly.loop_header

polly.loop_header56:                              ; preds = %polly.loop_exit64, %polly.loop_header
  %polly.indvar59 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next60, %polly.loop_exit64 ]
  %1 = shl nsw i64 %polly.indvar59, 5
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %1, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %2 = trunc <4 x i64> %broadcast.splat to <4 x i32>
  %3 = add <4 x i32> %2, <i32 0, i32 1, i32 2, i32 3>
  %4 = add nuw nsw <4 x i64> %broadcast.splat, <i64 4, i64 5, i64 6, i64 7>
  %5 = trunc <4 x i64> %4 to <4 x i32>
  %6 = extractelement <4 x i64> %4, i32 0
  %7 = add nuw nsw <4 x i64> %broadcast.splat, <i64 8, i64 9, i64 10, i64 11>
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = extractelement <4 x i64> %7, i32 0
  %10 = add nuw nsw <4 x i64> %broadcast.splat, <i64 12, i64 13, i64 14, i64 15>
  %11 = trunc <4 x i64> %10 to <4 x i32>
  %12 = extractelement <4 x i64> %10, i32 0
  %13 = add nuw nsw <4 x i64> %broadcast.splat, <i64 16, i64 17, i64 18, i64 19>
  %14 = trunc <4 x i64> %13 to <4 x i32>
  %15 = extractelement <4 x i64> %13, i32 0
  %16 = add nuw nsw <4 x i64> %broadcast.splat, <i64 20, i64 21, i64 22, i64 23>
  %17 = trunc <4 x i64> %16 to <4 x i32>
  %18 = extractelement <4 x i64> %16, i32 0
  %19 = add nuw nsw <4 x i64> %broadcast.splat, <i64 24, i64 25, i64 26, i64 27>
  %20 = trunc <4 x i64> %19 to <4 x i32>
  %21 = extractelement <4 x i64> %19, i32 0
  %22 = add nuw nsw <4 x i64> %broadcast.splat, <i64 28, i64 29, i64 30, i64 31>
  %23 = trunc <4 x i64> %22 to <4 x i32>
  %24 = extractelement <4 x i64> %22, i32 0
  br label %polly.loop_header62

polly.loop_exit64:                                ; preds = %polly.loop_header62
  %polly.indvar_next60 = add nuw nsw i64 %polly.indvar59, 1
  %exitcond981 = icmp eq i64 %polly.indvar_next60, 48
  br i1 %exitcond981, label %polly.loop_exit58, label %polly.loop_header56

polly.loop_header62:                              ; preds = %polly.loop_header62, %polly.loop_header56
  %polly.indvar65 = phi i64 [ 0, %polly.loop_header56 ], [ %polly.indvar_next66, %polly.loop_header62 ]
  %25 = add nuw nsw i64 %polly.indvar65, %0
  %26 = trunc i64 %25 to i32
  %broadcast.splatinsert983 = insertelement <4 x i32> undef, i32 %26, i32 0
  %broadcast.splat984 = shufflevector <4 x i32> %broadcast.splatinsert983, <4 x i32> undef, <4 x i32> zeroinitializer
  %27 = mul <4 x i32> %broadcast.splat984, %3
  %28 = and <4 x i32> %27, <i32 1023, i32 1023, i32 1023, i32 1023>
  %29 = add nuw nsw <4 x i32> %28, <i32 1, i32 1, i32 1, i32 1>
  %30 = sitofp <4 x i32> %29 to <4 x double>
  %31 = fmul <4 x double> %30, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %32 = fptrunc <4 x double> %31 to <4 x float>
  %33 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %1
  %34 = bitcast float* %33 to <4 x float>*
  store <4 x float> %32, <4 x float>* %34, align 16, !alias.scope !8, !noalias !10
  %35 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %1
  %36 = bitcast float* %35 to <4 x float>*
  store <4 x float> %32, <4 x float>* %36, align 16, !alias.scope !11, !noalias !15
  %37 = mul <4 x i32> %broadcast.splat984, %5
  %38 = and <4 x i32> %37, <i32 1023, i32 1023, i32 1023, i32 1023>
  %39 = add nuw nsw <4 x i32> %38, <i32 1, i32 1, i32 1, i32 1>
  %40 = sitofp <4 x i32> %39 to <4 x double>
  %41 = fmul <4 x double> %40, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %42 = fptrunc <4 x double> %41 to <4 x float>
  %43 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %6
  %44 = bitcast float* %43 to <4 x float>*
  store <4 x float> %42, <4 x float>* %44, align 4, !alias.scope !8, !noalias !10
  %45 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %6
  %46 = bitcast float* %45 to <4 x float>*
  store <4 x float> %42, <4 x float>* %46, align 4, !alias.scope !11, !noalias !15
  %47 = mul <4 x i32> %broadcast.splat984, %8
  %48 = and <4 x i32> %47, <i32 1023, i32 1023, i32 1023, i32 1023>
  %49 = add nuw nsw <4 x i32> %48, <i32 1, i32 1, i32 1, i32 1>
  %50 = sitofp <4 x i32> %49 to <4 x double>
  %51 = fmul <4 x double> %50, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %52 = fptrunc <4 x double> %51 to <4 x float>
  %53 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %9
  %54 = bitcast float* %53 to <4 x float>*
  store <4 x float> %52, <4 x float>* %54, align 4, !alias.scope !8, !noalias !10
  %55 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %9
  %56 = bitcast float* %55 to <4 x float>*
  store <4 x float> %52, <4 x float>* %56, align 4, !alias.scope !11, !noalias !15
  %57 = mul <4 x i32> %broadcast.splat984, %11
  %58 = and <4 x i32> %57, <i32 1023, i32 1023, i32 1023, i32 1023>
  %59 = add nuw nsw <4 x i32> %58, <i32 1, i32 1, i32 1, i32 1>
  %60 = sitofp <4 x i32> %59 to <4 x double>
  %61 = fmul <4 x double> %60, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %62 = fptrunc <4 x double> %61 to <4 x float>
  %63 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %12
  %64 = bitcast float* %63 to <4 x float>*
  store <4 x float> %62, <4 x float>* %64, align 4, !alias.scope !8, !noalias !10
  %65 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %12
  %66 = bitcast float* %65 to <4 x float>*
  store <4 x float> %62, <4 x float>* %66, align 4, !alias.scope !11, !noalias !15
  %67 = mul <4 x i32> %broadcast.splat984, %14
  %68 = and <4 x i32> %67, <i32 1023, i32 1023, i32 1023, i32 1023>
  %69 = add nuw nsw <4 x i32> %68, <i32 1, i32 1, i32 1, i32 1>
  %70 = sitofp <4 x i32> %69 to <4 x double>
  %71 = fmul <4 x double> %70, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %72 = fptrunc <4 x double> %71 to <4 x float>
  %73 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %15
  %74 = bitcast float* %73 to <4 x float>*
  store <4 x float> %72, <4 x float>* %74, align 4, !alias.scope !8, !noalias !10
  %75 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %15
  %76 = bitcast float* %75 to <4 x float>*
  store <4 x float> %72, <4 x float>* %76, align 4, !alias.scope !11, !noalias !15
  %77 = mul <4 x i32> %broadcast.splat984, %17
  %78 = and <4 x i32> %77, <i32 1023, i32 1023, i32 1023, i32 1023>
  %79 = add nuw nsw <4 x i32> %78, <i32 1, i32 1, i32 1, i32 1>
  %80 = sitofp <4 x i32> %79 to <4 x double>
  %81 = fmul <4 x double> %80, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %82 = fptrunc <4 x double> %81 to <4 x float>
  %83 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %18
  %84 = bitcast float* %83 to <4 x float>*
  store <4 x float> %82, <4 x float>* %84, align 4, !alias.scope !8, !noalias !10
  %85 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %18
  %86 = bitcast float* %85 to <4 x float>*
  store <4 x float> %82, <4 x float>* %86, align 4, !alias.scope !11, !noalias !15
  %87 = mul <4 x i32> %broadcast.splat984, %20
  %88 = and <4 x i32> %87, <i32 1023, i32 1023, i32 1023, i32 1023>
  %89 = add nuw nsw <4 x i32> %88, <i32 1, i32 1, i32 1, i32 1>
  %90 = sitofp <4 x i32> %89 to <4 x double>
  %91 = fmul <4 x double> %90, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %92 = fptrunc <4 x double> %91 to <4 x float>
  %93 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %21
  %94 = bitcast float* %93 to <4 x float>*
  store <4 x float> %92, <4 x float>* %94, align 4, !alias.scope !8, !noalias !10
  %95 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %21
  %96 = bitcast float* %95 to <4 x float>*
  store <4 x float> %92, <4 x float>* %96, align 4, !alias.scope !11, !noalias !15
  %97 = mul <4 x i32> %broadcast.splat984, %23
  %98 = and <4 x i32> %97, <i32 1023, i32 1023, i32 1023, i32 1023>
  %99 = add nuw nsw <4 x i32> %98, <i32 1, i32 1, i32 1, i32 1>
  %100 = sitofp <4 x i32> %99 to <4 x double>
  %101 = fmul <4 x double> %100, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %102 = fptrunc <4 x double> %101 to <4 x float>
  %103 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %25, i64 %24
  %104 = bitcast float* %103 to <4 x float>*
  store <4 x float> %102, <4 x float>* %104, align 4, !alias.scope !8, !noalias !10
  %105 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %25, i64 %24
  %106 = bitcast float* %105 to <4 x float>*
  store <4 x float> %102, <4 x float>* %106, align 4, !alias.scope !11, !noalias !15
  %polly.indvar_next66 = add nuw nsw i64 %polly.indvar65, 1
  %exitcond980 = icmp eq i64 %polly.indvar_next66, 32
  br i1 %exitcond980, label %polly.loop_exit64, label %polly.loop_header62

polly.loop_header75:                              ; preds = %polly.loop_exit58, %polly.loop_exit83
  %polly.indvar78 = phi i64 [ %polly.indvar_next79, %polly.loop_exit83 ], [ 0, %polly.loop_exit58 ]
  %107 = shl nuw nsw i64 %polly.indvar78, 5
  %108 = or i64 %107, 1
  %109 = or i64 %107, 2
  %110 = or i64 %107, 3
  %111 = or i64 %107, 4
  %112 = or i64 %107, 5
  %113 = or i64 %107, 6
  %114 = or i64 %107, 7
  %115 = or i64 %107, 8
  %116 = or i64 %107, 9
  %117 = or i64 %107, 10
  %118 = or i64 %107, 11
  %119 = or i64 %107, 12
  %120 = or i64 %107, 13
  %121 = or i64 %107, 14
  %122 = or i64 %107, 15
  %123 = or i64 %107, 16
  %124 = or i64 %107, 17
  %125 = or i64 %107, 18
  %126 = or i64 %107, 19
  %127 = or i64 %107, 20
  %128 = or i64 %107, 21
  %129 = or i64 %107, 22
  %130 = or i64 %107, 23
  %131 = or i64 %107, 24
  %132 = or i64 %107, 25
  %133 = or i64 %107, 26
  %134 = or i64 %107, 27
  %135 = or i64 %107, 28
  %136 = or i64 %107, 29
  %137 = or i64 %107, 30
  %138 = or i64 %107, 31
  br label %polly.loop_header81

polly.loop_exit83:                                ; preds = %polly.loop_header81
  %polly.indvar_next79 = add nuw nsw i64 %polly.indvar78, 1
  %exitcond978 = icmp eq i64 %polly.indvar_next79, 48
  br i1 %exitcond978, label %polly.loop_header100, label %polly.loop_header75

polly.loop_header81:                              ; preds = %polly.loop_header81, %polly.loop_header75
  %polly.indvar84 = phi i64 [ 0, %polly.loop_header75 ], [ %polly.indvar_next85, %polly.loop_header81 ]
  %139 = shl nuw nsw i64 %polly.indvar84, 5
  %scevgep974 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %107, i64 %139
  %scevgep974975 = bitcast float* %scevgep974 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975, i8 0, i64 128, i1 false)
  %scevgep974.1 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %108, i64 %139
  %scevgep974975.1 = bitcast float* %scevgep974.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.1, i8 0, i64 128, i1 false)
  %scevgep974.2 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %109, i64 %139
  %scevgep974975.2 = bitcast float* %scevgep974.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.2, i8 0, i64 128, i1 false)
  %scevgep974.3 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %110, i64 %139
  %scevgep974975.3 = bitcast float* %scevgep974.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.3, i8 0, i64 128, i1 false)
  %scevgep974.4 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %111, i64 %139
  %scevgep974975.4 = bitcast float* %scevgep974.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.4, i8 0, i64 128, i1 false)
  %scevgep974.5 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %112, i64 %139
  %scevgep974975.5 = bitcast float* %scevgep974.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.5, i8 0, i64 128, i1 false)
  %scevgep974.6 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %113, i64 %139
  %scevgep974975.6 = bitcast float* %scevgep974.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.6, i8 0, i64 128, i1 false)
  %scevgep974.7 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %114, i64 %139
  %scevgep974975.7 = bitcast float* %scevgep974.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.7, i8 0, i64 128, i1 false)
  %scevgep974.8 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %115, i64 %139
  %scevgep974975.8 = bitcast float* %scevgep974.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.8, i8 0, i64 128, i1 false)
  %scevgep974.9 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %116, i64 %139
  %scevgep974975.9 = bitcast float* %scevgep974.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.9, i8 0, i64 128, i1 false)
  %scevgep974.10 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %117, i64 %139
  %scevgep974975.10 = bitcast float* %scevgep974.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.10, i8 0, i64 128, i1 false)
  %scevgep974.11 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %118, i64 %139
  %scevgep974975.11 = bitcast float* %scevgep974.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.11, i8 0, i64 128, i1 false)
  %scevgep974.12 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %119, i64 %139
  %scevgep974975.12 = bitcast float* %scevgep974.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.12, i8 0, i64 128, i1 false)
  %scevgep974.13 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %120, i64 %139
  %scevgep974975.13 = bitcast float* %scevgep974.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.13, i8 0, i64 128, i1 false)
  %scevgep974.14 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %121, i64 %139
  %scevgep974975.14 = bitcast float* %scevgep974.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.14, i8 0, i64 128, i1 false)
  %scevgep974.15 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %122, i64 %139
  %scevgep974975.15 = bitcast float* %scevgep974.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.15, i8 0, i64 128, i1 false)
  %scevgep974.16 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %123, i64 %139
  %scevgep974975.16 = bitcast float* %scevgep974.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.16, i8 0, i64 128, i1 false)
  %scevgep974.17 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %124, i64 %139
  %scevgep974975.17 = bitcast float* %scevgep974.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.17, i8 0, i64 128, i1 false)
  %scevgep974.18 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %125, i64 %139
  %scevgep974975.18 = bitcast float* %scevgep974.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.18, i8 0, i64 128, i1 false)
  %scevgep974.19 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %126, i64 %139
  %scevgep974975.19 = bitcast float* %scevgep974.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.19, i8 0, i64 128, i1 false)
  %scevgep974.20 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %127, i64 %139
  %scevgep974975.20 = bitcast float* %scevgep974.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.20, i8 0, i64 128, i1 false)
  %scevgep974.21 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %128, i64 %139
  %scevgep974975.21 = bitcast float* %scevgep974.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.21, i8 0, i64 128, i1 false)
  %scevgep974.22 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %129, i64 %139
  %scevgep974975.22 = bitcast float* %scevgep974.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.22, i8 0, i64 128, i1 false)
  %scevgep974.23 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %130, i64 %139
  %scevgep974975.23 = bitcast float* %scevgep974.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.23, i8 0, i64 128, i1 false)
  %scevgep974.24 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %131, i64 %139
  %scevgep974975.24 = bitcast float* %scevgep974.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.24, i8 0, i64 128, i1 false)
  %scevgep974.25 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %132, i64 %139
  %scevgep974975.25 = bitcast float* %scevgep974.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.25, i8 0, i64 128, i1 false)
  %scevgep974.26 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %133, i64 %139
  %scevgep974975.26 = bitcast float* %scevgep974.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.26, i8 0, i64 128, i1 false)
  %scevgep974.27 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %134, i64 %139
  %scevgep974975.27 = bitcast float* %scevgep974.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.27, i8 0, i64 128, i1 false)
  %scevgep974.28 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %135, i64 %139
  %scevgep974975.28 = bitcast float* %scevgep974.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.28, i8 0, i64 128, i1 false)
  %scevgep974.29 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %136, i64 %139
  %scevgep974975.29 = bitcast float* %scevgep974.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.29, i8 0, i64 128, i1 false)
  %scevgep974.30 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %137, i64 %139
  %scevgep974975.30 = bitcast float* %scevgep974.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.30, i8 0, i64 128, i1 false)
  %scevgep974.31 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %138, i64 %139
  %scevgep974975.31 = bitcast float* %scevgep974.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep974975.31, i8 0, i64 128, i1 false)
  %polly.indvar_next85 = add nuw nsw i64 %polly.indvar84, 1
  %exitcond977 = icmp eq i64 %polly.indvar_next85, 48
  br i1 %exitcond977, label %polly.loop_exit83, label %polly.loop_header81

polly.loop_header100:                             ; preds = %polly.loop_exit83, %polly.loop_exit108
  %polly.indvar103 = phi i64 [ %polly.indvar_next104, %polly.loop_exit108 ], [ 0, %polly.loop_exit83 ]
  %140 = shl nuw nsw i64 %polly.indvar103, 5
  %141 = or i64 %140, 1
  %142 = or i64 %140, 2
  %143 = or i64 %140, 3
  %144 = or i64 %140, 4
  %145 = or i64 %140, 5
  %146 = or i64 %140, 6
  %147 = or i64 %140, 7
  %148 = or i64 %140, 8
  %149 = or i64 %140, 9
  %150 = or i64 %140, 10
  %151 = or i64 %140, 11
  %152 = or i64 %140, 12
  %153 = or i64 %140, 13
  %154 = or i64 %140, 14
  %155 = or i64 %140, 15
  %156 = or i64 %140, 16
  %157 = or i64 %140, 17
  %158 = or i64 %140, 18
  %159 = or i64 %140, 19
  %160 = or i64 %140, 20
  %161 = or i64 %140, 21
  %162 = or i64 %140, 22
  %163 = or i64 %140, 23
  %164 = or i64 %140, 24
  %165 = or i64 %140, 25
  %166 = or i64 %140, 26
  %167 = or i64 %140, 27
  %168 = or i64 %140, 28
  %169 = or i64 %140, 29
  %170 = or i64 %140, 30
  %171 = or i64 %140, 31
  br label %polly.loop_header106

polly.loop_exit108:                               ; preds = %polly.loop_header106
  %polly.indvar_next104 = add nuw nsw i64 %polly.indvar103, 1
  %exitcond972 = icmp eq i64 %polly.indvar_next104, 48
  br i1 %exitcond972, label %polly.loop_header125, label %polly.loop_header100

polly.loop_header106:                             ; preds = %polly.loop_header106, %polly.loop_header100
  %polly.indvar109 = phi i64 [ 0, %polly.loop_header100 ], [ %polly.indvar_next110, %polly.loop_header106 ]
  %172 = shl nuw nsw i64 %polly.indvar109, 5
  %scevgep968 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %140, i64 %172
  %scevgep968969 = bitcast float* %scevgep968 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969, i8 0, i64 128, i1 false)
  %scevgep968.1 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %141, i64 %172
  %scevgep968969.1 = bitcast float* %scevgep968.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.1, i8 0, i64 128, i1 false)
  %scevgep968.2 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %142, i64 %172
  %scevgep968969.2 = bitcast float* %scevgep968.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.2, i8 0, i64 128, i1 false)
  %scevgep968.3 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %143, i64 %172
  %scevgep968969.3 = bitcast float* %scevgep968.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.3, i8 0, i64 128, i1 false)
  %scevgep968.4 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %144, i64 %172
  %scevgep968969.4 = bitcast float* %scevgep968.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.4, i8 0, i64 128, i1 false)
  %scevgep968.5 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %145, i64 %172
  %scevgep968969.5 = bitcast float* %scevgep968.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.5, i8 0, i64 128, i1 false)
  %scevgep968.6 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %146, i64 %172
  %scevgep968969.6 = bitcast float* %scevgep968.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.6, i8 0, i64 128, i1 false)
  %scevgep968.7 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %147, i64 %172
  %scevgep968969.7 = bitcast float* %scevgep968.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.7, i8 0, i64 128, i1 false)
  %scevgep968.8 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %148, i64 %172
  %scevgep968969.8 = bitcast float* %scevgep968.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.8, i8 0, i64 128, i1 false)
  %scevgep968.9 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %149, i64 %172
  %scevgep968969.9 = bitcast float* %scevgep968.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.9, i8 0, i64 128, i1 false)
  %scevgep968.10 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %150, i64 %172
  %scevgep968969.10 = bitcast float* %scevgep968.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.10, i8 0, i64 128, i1 false)
  %scevgep968.11 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %151, i64 %172
  %scevgep968969.11 = bitcast float* %scevgep968.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.11, i8 0, i64 128, i1 false)
  %scevgep968.12 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %152, i64 %172
  %scevgep968969.12 = bitcast float* %scevgep968.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.12, i8 0, i64 128, i1 false)
  %scevgep968.13 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %153, i64 %172
  %scevgep968969.13 = bitcast float* %scevgep968.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.13, i8 0, i64 128, i1 false)
  %scevgep968.14 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %154, i64 %172
  %scevgep968969.14 = bitcast float* %scevgep968.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.14, i8 0, i64 128, i1 false)
  %scevgep968.15 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %155, i64 %172
  %scevgep968969.15 = bitcast float* %scevgep968.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.15, i8 0, i64 128, i1 false)
  %scevgep968.16 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %156, i64 %172
  %scevgep968969.16 = bitcast float* %scevgep968.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.16, i8 0, i64 128, i1 false)
  %scevgep968.17 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %157, i64 %172
  %scevgep968969.17 = bitcast float* %scevgep968.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.17, i8 0, i64 128, i1 false)
  %scevgep968.18 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %158, i64 %172
  %scevgep968969.18 = bitcast float* %scevgep968.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.18, i8 0, i64 128, i1 false)
  %scevgep968.19 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %159, i64 %172
  %scevgep968969.19 = bitcast float* %scevgep968.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.19, i8 0, i64 128, i1 false)
  %scevgep968.20 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %160, i64 %172
  %scevgep968969.20 = bitcast float* %scevgep968.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.20, i8 0, i64 128, i1 false)
  %scevgep968.21 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %161, i64 %172
  %scevgep968969.21 = bitcast float* %scevgep968.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.21, i8 0, i64 128, i1 false)
  %scevgep968.22 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %162, i64 %172
  %scevgep968969.22 = bitcast float* %scevgep968.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.22, i8 0, i64 128, i1 false)
  %scevgep968.23 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %163, i64 %172
  %scevgep968969.23 = bitcast float* %scevgep968.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.23, i8 0, i64 128, i1 false)
  %scevgep968.24 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %164, i64 %172
  %scevgep968969.24 = bitcast float* %scevgep968.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.24, i8 0, i64 128, i1 false)
  %scevgep968.25 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %165, i64 %172
  %scevgep968969.25 = bitcast float* %scevgep968.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.25, i8 0, i64 128, i1 false)
  %scevgep968.26 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %166, i64 %172
  %scevgep968969.26 = bitcast float* %scevgep968.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.26, i8 0, i64 128, i1 false)
  %scevgep968.27 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %167, i64 %172
  %scevgep968969.27 = bitcast float* %scevgep968.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.27, i8 0, i64 128, i1 false)
  %scevgep968.28 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %168, i64 %172
  %scevgep968969.28 = bitcast float* %scevgep968.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.28, i8 0, i64 128, i1 false)
  %scevgep968.29 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %169, i64 %172
  %scevgep968969.29 = bitcast float* %scevgep968.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.29, i8 0, i64 128, i1 false)
  %scevgep968.30 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %170, i64 %172
  %scevgep968969.30 = bitcast float* %scevgep968.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.30, i8 0, i64 128, i1 false)
  %scevgep968.31 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %171, i64 %172
  %scevgep968969.31 = bitcast float* %scevgep968.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(128) %scevgep968969.31, i8 0, i64 128, i1 false)
  %polly.indvar_next110 = add nuw nsw i64 %polly.indvar109, 1
  %exitcond971 = icmp eq i64 %polly.indvar_next110, 48
  br i1 %exitcond971, label %polly.loop_exit108, label %polly.loop_header106

polly.loop_header125:                             ; preds = %polly.loop_exit108, %polly.loop_exit147
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_exit147 ], [ 512, %polly.loop_exit108 ]
  %polly.indvar128 = phi i64 [ %polly.indvar_next129, %polly.loop_exit147 ], [ 0, %polly.loop_exit108 ]
  %173 = shl nsw i64 %polly.indvar128, 9
  %174 = mul nsw i64 %polly.indvar128, -512
  br label %polly.loop_header131

polly.loop_exit147:                               ; preds = %polly.loop_exit169
  %polly.indvar_next129 = add nuw nsw i64 %polly.indvar128, 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 512
  %exitcond966 = icmp eq i64 %polly.indvar_next129, 3
  br i1 %exitcond966, label %polly.exiting, label %polly.loop_header125

polly.loop_header131:                             ; preds = %polly.loop_exit139, %polly.loop_header125
  %polly.indvar134 = phi i64 [ 0, %polly.loop_header125 ], [ %polly.indvar_next135, %polly.loop_exit139 ]
  %pexp.p_div_q = lshr i64 %polly.indvar134, 3
  %polly.access.mul.Packed_B = shl i64 %pexp.p_div_q, 9
  %175 = add i64 %polly.access.mul.Packed_B, %174
  %pexp.pdiv_r = and i64 %polly.indvar134, 7
  br label %polly.loop_header137

polly.loop_exit139:                               ; preds = %polly.loop_header137
  %polly.indvar_next135 = add nuw nsw i64 %polly.indvar134, 1
  %exitcond957 = icmp eq i64 %polly.indvar_next135, 1536
  br i1 %exitcond957, label %polly.loop_header145, label %polly.loop_header131

polly.loop_header137:                             ; preds = %polly.loop_header137, %polly.loop_header131
  %polly.indvar140 = phi i64 [ %173, %polly.loop_header131 ], [ %polly.indvar_next141.1, %polly.loop_header137 ]
  %polly.access.mul.B = mul nuw nsw i64 %polly.indvar140, 1536
  %polly.access.add.B = add nuw nsw i64 %polly.access.mul.B, %polly.indvar134
  %polly.access.B = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 0, i64 %polly.access.add.B
  %176 = bitcast float* %polly.access.B to i32*
  %polly.access.B.load917 = load i32, i32* %176, align 4, !alias.scope !11, !noalias !15
  %polly.access.add.Packed_B = add i64 %175, %polly.indvar140
  %polly.access.mul.Packed_B143 = shl nsw i64 %polly.access.add.Packed_B, 3
  %polly.access.add.Packed_B144 = or i64 %polly.access.mul.Packed_B143, %pexp.pdiv_r
  %polly.access.Packed_B = getelementptr [1048576 x float], [1048576 x float]* %Packed_B918, i64 0, i64 %polly.access.add.Packed_B144
  %177 = bitcast float* %polly.access.Packed_B to i32*
  store i32 %polly.access.B.load917, i32* %177, align 4, !alias.scope !13, !noalias !16
  %polly.indvar_next141 = or i64 %polly.indvar140, 1
  %polly.access.mul.B.1 = mul nuw nsw i64 %polly.indvar_next141, 1536
  %polly.access.add.B.1 = add nuw nsw i64 %polly.access.mul.B.1, %polly.indvar134
  %polly.access.B.1 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 0, i64 %polly.access.add.B.1
  %178 = bitcast float* %polly.access.B.1 to i32*
  %polly.access.B.load917.1 = load i32, i32* %178, align 4, !alias.scope !11, !noalias !15
  %polly.access.add.Packed_B.1 = add i64 %175, %polly.indvar_next141
  %polly.access.mul.Packed_B143.1 = shl nsw i64 %polly.access.add.Packed_B.1, 3
  %polly.access.add.Packed_B144.1 = or i64 %polly.access.mul.Packed_B143.1, %pexp.pdiv_r
  %polly.access.Packed_B.1 = getelementptr [1048576 x float], [1048576 x float]* %Packed_B918, i64 0, i64 %polly.access.add.Packed_B144.1
  %179 = bitcast float* %polly.access.Packed_B.1 to i32*
  store i32 %polly.access.B.load917.1, i32* %179, align 4, !alias.scope !13, !noalias !16
  %polly.indvar_next141.1 = add nuw nsw i64 %polly.indvar140, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next141.1, %indvars.iv
  br i1 %exitcond.1, label %polly.loop_exit139, label %polly.loop_header137

polly.loop_header145:                             ; preds = %polly.loop_exit139, %polly.loop_exit169
  %indvars.iv959 = phi i64 [ %indvars.iv.next960, %polly.loop_exit169 ], [ 96, %polly.loop_exit139 ]
  %polly.indvar148 = phi i64 [ %polly.indvar_next149, %polly.loop_exit169 ], [ 0, %polly.loop_exit139 ]
  %180 = mul nuw nsw i64 %polly.indvar148, 96
  %181 = mul nsw i64 %polly.indvar148, -24
  br label %polly.loop_header151

polly.loop_exit169:                               ; preds = %polly.loop_exit175
  %polly.indvar_next149 = add nuw nsw i64 %polly.indvar148, 1
  %indvars.iv.next960 = add nuw nsw i64 %indvars.iv959, 96
  %exitcond965 = icmp eq i64 %polly.indvar_next149, 16
  br i1 %exitcond965, label %polly.loop_exit147, label %polly.loop_header145

polly.loop_header151:                             ; preds = %polly.loop_exit159, %polly.loop_header145
  %polly.indvar154 = phi i64 [ %180, %polly.loop_header145 ], [ %polly.indvar_next155, %polly.loop_exit159 ]
  %polly.access.mul.A = mul nuw nsw i64 %polly.indvar154, 1536
  %pexp.p_div_q163 = lshr i64 %polly.indvar154, 2
  %182 = add nsw i64 %pexp.p_div_q163, %181
  %polly.access.mul.Packed_A = shl i64 %182, 9
  %183 = add i64 %polly.access.mul.Packed_A, %174
  %pexp.pdiv_r165 = and i64 %polly.indvar154, 3
  br label %polly.loop_header157

polly.loop_exit159:                               ; preds = %polly.loop_header157
  %polly.indvar_next155 = add nuw nsw i64 %polly.indvar154, 1
  %exitcond961 = icmp eq i64 %polly.indvar_next155, %indvars.iv959
  br i1 %exitcond961, label %polly.loop_header167, label %polly.loop_header151

polly.loop_header157:                             ; preds = %polly.loop_header157, %polly.loop_header151
  %polly.indvar160 = phi i64 [ %173, %polly.loop_header151 ], [ %polly.indvar_next161.1, %polly.loop_header157 ]
  %polly.access.add.A = add nuw nsw i64 %polly.indvar160, %polly.access.mul.A
  %polly.access.A = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 0, i64 %polly.access.add.A
  %184 = bitcast float* %polly.access.A to i32*
  %polly.access.A.load919 = load i32, i32* %184, align 8, !alias.scope !8, !noalias !10
  %polly.access.add.Packed_A = add i64 %183, %polly.indvar160
  %polly.access.mul.Packed_A164 = shl nsw i64 %polly.access.add.Packed_A, 2
  %polly.access.add.Packed_A166 = or i64 %polly.access.mul.Packed_A164, %pexp.pdiv_r165
  %polly.access.Packed_A = getelementptr [49152 x float], [49152 x float]* %Packed_A920, i64 0, i64 %polly.access.add.Packed_A166
  %185 = bitcast float* %polly.access.Packed_A to i32*
  store i32 %polly.access.A.load919, i32* %185, align 4, !alias.scope !14, !noalias !17
  %polly.indvar_next161 = or i64 %polly.indvar160, 1
  %polly.access.add.A.1 = add nuw nsw i64 %polly.indvar_next161, %polly.access.mul.A
  %polly.access.A.1 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 0, i64 %polly.access.add.A.1
  %186 = bitcast float* %polly.access.A.1 to i32*
  %polly.access.A.load919.1 = load i32, i32* %186, align 4, !alias.scope !8, !noalias !10
  %polly.access.add.Packed_A.1 = add i64 %183, %polly.indvar_next161
  %polly.access.mul.Packed_A164.1 = shl nsw i64 %polly.access.add.Packed_A.1, 2
  %polly.access.add.Packed_A166.1 = or i64 %polly.access.mul.Packed_A164.1, %pexp.pdiv_r165
  %polly.access.Packed_A.1 = getelementptr [49152 x float], [49152 x float]* %Packed_A920, i64 0, i64 %polly.access.add.Packed_A166.1
  %187 = bitcast float* %polly.access.Packed_A.1 to i32*
  store i32 %polly.access.A.load919.1, i32* %187, align 4, !alias.scope !14, !noalias !17
  %polly.indvar_next161.1 = add nuw nsw i64 %polly.indvar160, 2
  %exitcond958.1 = icmp eq i64 %polly.indvar_next161.1, %indvars.iv
  br i1 %exitcond958.1, label %polly.loop_exit159, label %polly.loop_header157

polly.loop_header167:                             ; preds = %polly.loop_exit159, %polly.loop_exit175
  %polly.indvar170 = phi i64 [ %polly.indvar_next171, %polly.loop_exit175 ], [ 0, %polly.loop_exit159 ]
  %188 = shl nsw i64 %polly.indvar170, 3
  %polly.access.mul.Packed_B195 = shl i64 %polly.indvar170, 9
  %189 = or i64 %188, 4
  br label %polly.loop_header173

polly.loop_exit175:                               ; preds = %polly.loop_exit181
  %polly.indvar_next171 = add nuw nsw i64 %polly.indvar170, 1
  %exitcond964 = icmp eq i64 %polly.indvar_next171, 192
  br i1 %exitcond964, label %polly.loop_exit169, label %polly.loop_header167

polly.loop_header173:                             ; preds = %polly.loop_exit181, %polly.loop_header167
  %polly.indvar176 = phi i64 [ 0, %polly.loop_header167 ], [ %polly.indvar_next177, %polly.loop_exit181 ]
  %190 = shl nsw i64 %polly.indvar176, 2
  %191 = add nuw nsw i64 %190, %180
  %polly.access.mul.C185 = mul nuw nsw i64 %191, 1536
  %polly.access.add.C186 = add nuw nsw i64 %polly.access.mul.C185, %188
  %polly.access.C187 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C186
  %polly.access.mul.Packed_A189 = shl i64 %polly.indvar176, 9
  %polly.access.add.C275 = add nuw nsw i64 %polly.access.mul.C185, %189
  %polly.access.C276 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C275
  %192 = or i64 %191, 1
  %polly.access.mul.C366 = mul nuw nsw i64 %192, 1536
  %polly.access.add.C367 = add nuw nsw i64 %polly.access.mul.C366, %188
  %polly.access.C368 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C367
  %polly.access.add.C459 = add nuw nsw i64 %polly.access.mul.C366, %189
  %polly.access.C460 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C459
  %193 = or i64 %191, 2
  %polly.access.mul.C550 = mul nuw nsw i64 %193, 1536
  %polly.access.add.C551 = add nuw nsw i64 %polly.access.mul.C550, %188
  %polly.access.C552 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C551
  %polly.access.add.C643 = add nuw nsw i64 %polly.access.mul.C550, %189
  %polly.access.C644 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C643
  %194 = or i64 %191, 3
  %polly.access.mul.C734 = mul nuw nsw i64 %194, 1536
  %polly.access.add.C735 = add nuw nsw i64 %polly.access.mul.C734, %188
  %polly.access.C736 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C735
  %polly.access.add.C827 = add nuw nsw i64 %polly.access.mul.C734, %189
  %polly.access.C828 = getelementptr [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 0, i64 %polly.access.add.C827
  %195 = bitcast float* %polly.access.C187 to <4 x float>*
  %196 = load <4 x float>, <4 x float>* %195, align 16, !alias.scope !18, !noalias !23
  %197 = bitcast float* %polly.access.C276 to <4 x float>*
  %198 = load <4 x float>, <4 x float>* %197, align 16, !alias.scope !24, !noalias !29
  %199 = bitcast float* %polly.access.C368 to <4 x float>*
  %200 = load <4 x float>, <4 x float>* %199, align 16, !alias.scope !30, !noalias !35
  %201 = bitcast float* %polly.access.C460 to <4 x float>*
  %202 = load <4 x float>, <4 x float>* %201, align 16, !alias.scope !36, !noalias !41
  %203 = bitcast float* %polly.access.C552 to <4 x float>*
  %204 = load <4 x float>, <4 x float>* %203, align 16, !alias.scope !42, !noalias !47
  %205 = bitcast float* %polly.access.C644 to <4 x float>*
  %206 = load <4 x float>, <4 x float>* %205, align 16, !alias.scope !48, !noalias !53
  %207 = bitcast float* %polly.access.C736 to <4 x float>*
  %208 = load <4 x float>, <4 x float>* %207, align 16, !alias.scope !54, !noalias !59
  %209 = bitcast float* %polly.access.C828 to <4 x float>*
  %210 = load <4 x float>, <4 x float>* %209, align 16, !alias.scope !60, !noalias !65
  br label %polly.loop_header179

polly.loop_exit181:                               ; preds = %polly.loop_header179
  %211 = bitcast float* %polly.access.C187 to <4 x float>*
  store <4 x float> %232, <4 x float>* %211, align 16, !alias.scope !18, !noalias !23
  %212 = bitcast float* %polly.access.C276 to <4 x float>*
  store <4 x float> %236, <4 x float>* %212, align 16, !alias.scope !24, !noalias !29
  %213 = bitcast float* %polly.access.C368 to <4 x float>*
  store <4 x float> %240, <4 x float>* %213, align 16, !alias.scope !30, !noalias !35
  %214 = bitcast float* %polly.access.C460 to <4 x float>*
  store <4 x float> %242, <4 x float>* %214, align 16, !alias.scope !36, !noalias !41
  %215 = bitcast float* %polly.access.C552 to <4 x float>*
  store <4 x float> %246, <4 x float>* %215, align 16, !alias.scope !42, !noalias !47
  %216 = bitcast float* %polly.access.C644 to <4 x float>*
  store <4 x float> %248, <4 x float>* %216, align 16, !alias.scope !48, !noalias !53
  %217 = bitcast float* %polly.access.C736 to <4 x float>*
  store <4 x float> %252, <4 x float>* %217, align 16, !alias.scope !54, !noalias !59
  %218 = bitcast float* %polly.access.C828 to <4 x float>*
  store <4 x float> %254, <4 x float>* %218, align 16, !alias.scope !60, !noalias !65
  %polly.indvar_next177 = add nuw nsw i64 %polly.indvar176, 1
  %exitcond963 = icmp eq i64 %polly.indvar_next177, 24
  br i1 %exitcond963, label %polly.loop_exit175, label %polly.loop_header173

polly.loop_header179:                             ; preds = %polly.loop_header179, %polly.loop_header173
  %polly.indvar182 = phi i64 [ 0, %polly.loop_header173 ], [ %polly.indvar_next183, %polly.loop_header179 ]
  %219 = phi <4 x float> [ %196, %polly.loop_header173 ], [ %232, %polly.loop_header179 ]
  %220 = phi <4 x float> [ %198, %polly.loop_header173 ], [ %236, %polly.loop_header179 ]
  %221 = phi <4 x float> [ %200, %polly.loop_header173 ], [ %240, %polly.loop_header179 ]
  %222 = phi <4 x float> [ %202, %polly.loop_header173 ], [ %242, %polly.loop_header179 ]
  %223 = phi <4 x float> [ %204, %polly.loop_header173 ], [ %246, %polly.loop_header179 ]
  %224 = phi <4 x float> [ %206, %polly.loop_header173 ], [ %248, %polly.loop_header179 ]
  %225 = phi <4 x float> [ %208, %polly.loop_header173 ], [ %252, %polly.loop_header179 ]
  %226 = phi <4 x float> [ %210, %polly.loop_header173 ], [ %254, %polly.loop_header179 ]
  %polly.access.add.Packed_A190 = add nuw nsw i64 %polly.indvar182, %polly.access.mul.Packed_A189
  %polly.access.mul.Packed_A191 = shl nsw i64 %polly.access.add.Packed_A190, 2
  %polly.access.Packed_A193 = getelementptr [49152 x float], [49152 x float]* %Packed_A920, i64 0, i64 %polly.access.mul.Packed_A191
  %_p_scalar_ = load float, float* %polly.access.Packed_A193, align 16, !alias.scope !14, !noalias !17
  %polly.access.add.Packed_B196 = add nuw nsw i64 %polly.indvar182, %polly.access.mul.Packed_B195
  %polly.access.mul.Packed_B197 = shl nsw i64 %polly.access.add.Packed_B196, 3
  %polly.access.Packed_B199 = getelementptr [1048576 x float], [1048576 x float]* %Packed_B918, i64 0, i64 %polly.access.mul.Packed_B197
  %227 = bitcast float* %polly.access.Packed_B199 to <4 x float>*
  %228 = load <4 x float>, <4 x float>* %227, align 32, !alias.scope !13, !noalias !16
  %229 = insertelement <4 x float> undef, float %_p_scalar_, i32 0
  %230 = shufflevector <4 x float> %229, <4 x float> undef, <4 x i32> zeroinitializer
  %231 = fmul <4 x float> %230, %228
  %232 = fadd <4 x float> %219, %231
  %polly.access.add.Packed_B288 = or i64 %polly.access.mul.Packed_B197, 4
  %polly.access.Packed_B289 = getelementptr [1048576 x float], [1048576 x float]* %Packed_B918, i64 0, i64 %polly.access.add.Packed_B288
  %233 = bitcast float* %polly.access.Packed_B289 to <4 x float>*
  %234 = load <4 x float>, <4 x float>* %233, align 16, !alias.scope !13, !noalias !16
  %235 = fmul <4 x float> %230, %234
  %236 = fadd <4 x float> %220, %235
  %polly.access.add.Packed_A373 = or i64 %polly.access.mul.Packed_A191, 1
  %polly.access.Packed_A374 = getelementptr [49152 x float], [49152 x float]* %Packed_A920, i64 0, i64 %polly.access.add.Packed_A373
  %_p_scalar_375 = load float, float* %polly.access.Packed_A374, align 4, !alias.scope !14, !noalias !17
  %237 = insertelement <4 x float> undef, float %_p_scalar_375, i32 0
  %238 = shufflevector <4 x float> %237, <4 x float> undef, <4 x i32> zeroinitializer
  %239 = fmul <4 x float> %228, %238
  %240 = fadd <4 x float> %221, %239
  %241 = fmul <4 x float> %234, %238
  %242 = fadd <4 x float> %241, %222
  %polly.access.add.Packed_A557 = or i64 %polly.access.mul.Packed_A191, 2
  %polly.access.Packed_A558 = getelementptr [49152 x float], [49152 x float]* %Packed_A920, i64 0, i64 %polly.access.add.Packed_A557
  %_p_scalar_559 = load float, float* %polly.access.Packed_A558, align 8, !alias.scope !14, !noalias !17
  %243 = insertelement <4 x float> undef, float %_p_scalar_559, i32 0
  %244 = shufflevector <4 x float> %243, <4 x float> undef, <4 x i32> zeroinitializer
  %245 = fmul <4 x float> %228, %244
  %246 = fadd <4 x float> %223, %245
  %247 = fmul <4 x float> %234, %244
  %248 = fadd <4 x float> %247, %224
  %polly.access.add.Packed_A741 = or i64 %polly.access.mul.Packed_A191, 3
  %polly.access.Packed_A742 = getelementptr [49152 x float], [49152 x float]* %Packed_A920, i64 0, i64 %polly.access.add.Packed_A741
  %_p_scalar_743 = load float, float* %polly.access.Packed_A742, align 4, !alias.scope !14, !noalias !17
  %249 = insertelement <4 x float> undef, float %_p_scalar_743, i32 0
  %250 = shufflevector <4 x float> %249, <4 x float> undef, <4 x i32> zeroinitializer
  %251 = fmul <4 x float> %228, %250
  %252 = fadd <4 x float> %225, %251
  %253 = fmul <4 x float> %234, %250
  %254 = fadd <4 x float> %253, %226
  %polly.indvar_next183 = add nuw nsw i64 %polly.indvar182, 1
  %exitcond962 = icmp eq i64 %polly.indvar_next183, 512
  br i1 %exitcond962, label %polly.loop_exit181, label %polly.loop_header179, !llvm.loop !66
}

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind }
attributes #5 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (http://llvm.org/git/clang.git 65acf43270ea2894dffa0d0b292b92402f80c8cb) (http://llvm.org/git/llvm.git 2c4ca6832fa6b306ee6a7010bfb80a3f2596f824)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = distinct !{!8, !9, !"polly.alias.scope.MemRef0"}
!9 = distinct !{!9, !"polly.alias.scope.domain"}
!10 = !{!11, !12, !13, !14}
!11 = distinct !{!11, !9, !"polly.alias.scope.MemRef1"}
!12 = distinct !{!12, !9, !"polly.alias.scope.MemRef2"}
!13 = distinct !{!13, !9, !"polly.alias.scope.Packed_B"}
!14 = distinct !{!14, !9, !"polly.alias.scope.Packed_A"}
!15 = !{!8, !12, !13, !14}
!16 = !{!8, !11, !12, !14}
!17 = !{!8, !11, !12, !13}
!18 = !{!19, !12, !"second level alias metadata", !20, !21, !22}
!19 = distinct !{!19, !12, !"second level alias metadata"}
!20 = distinct !{!20, !12, !"second level alias metadata"}
!21 = distinct !{!21, !12, !"second level alias metadata"}
!22 = distinct !{!22, !12, !"second level alias metadata"}
!23 = !{!8, !11, !13, !14}
!24 = !{!25, !12, !"second level alias metadata", !26, !27, !28}
!25 = distinct !{!25, !12, !"second level alias metadata"}
!26 = distinct !{!26, !12, !"second level alias metadata"}
!27 = distinct !{!27, !12, !"second level alias metadata"}
!28 = distinct !{!28, !12, !"second level alias metadata"}
!29 = !{!8, !11, !13, !14, !19, !20, !21, !22}
!30 = !{!31, !12, !"second level alias metadata", !32, !33, !34}
!31 = distinct !{!31, !12, !"second level alias metadata"}
!32 = distinct !{!32, !12, !"second level alias metadata"}
!33 = distinct !{!33, !12, !"second level alias metadata"}
!34 = distinct !{!34, !12, !"second level alias metadata"}
!35 = !{!8, !11, !13, !14, !19, !20, !21, !22, !25, !26, !27, !28}
!36 = !{!37, !12, !"second level alias metadata", !38, !39, !40}
!37 = distinct !{!37, !12, !"second level alias metadata"}
!38 = distinct !{!38, !12, !"second level alias metadata"}
!39 = distinct !{!39, !12, !"second level alias metadata"}
!40 = distinct !{!40, !12, !"second level alias metadata"}
!41 = !{!8, !11, !13, !14, !19, !20, !21, !22, !25, !26, !27, !28, !31, !32, !33, !34}
!42 = !{!43, !12, !"second level alias metadata", !44, !45, !46}
!43 = distinct !{!43, !12, !"second level alias metadata"}
!44 = distinct !{!44, !12, !"second level alias metadata"}
!45 = distinct !{!45, !12, !"second level alias metadata"}
!46 = distinct !{!46, !12, !"second level alias metadata"}
!47 = !{!8, !11, !13, !14, !19, !20, !21, !22, !25, !26, !27, !28, !31, !32, !33, !34, !37, !38, !39, !40}
!48 = !{!49, !12, !"second level alias metadata", !50, !51, !52}
!49 = distinct !{!49, !12, !"second level alias metadata"}
!50 = distinct !{!50, !12, !"second level alias metadata"}
!51 = distinct !{!51, !12, !"second level alias metadata"}
!52 = distinct !{!52, !12, !"second level alias metadata"}
!53 = !{!8, !11, !13, !14, !19, !20, !21, !22, !25, !26, !27, !28, !31, !32, !33, !34, !37, !38, !39, !40, !43, !44, !45, !46}
!54 = !{!55, !12, !"second level alias metadata", !56, !57, !58}
!55 = distinct !{!55, !12, !"second level alias metadata"}
!56 = distinct !{!56, !12, !"second level alias metadata"}
!57 = distinct !{!57, !12, !"second level alias metadata"}
!58 = distinct !{!58, !12, !"second level alias metadata"}
!59 = !{!8, !11, !13, !14, !19, !20, !21, !22, !25, !26, !27, !28, !31, !32, !33, !34, !37, !38, !39, !40, !43, !44, !45, !46, !49, !50, !51, !52}
!60 = !{!61, !12, !"second level alias metadata", !62, !63, !64}
!61 = distinct !{!61, !12, !"second level alias metadata"}
!62 = distinct !{!62, !12, !"second level alias metadata"}
!63 = distinct !{!63, !12, !"second level alias metadata"}
!64 = distinct !{!64, !12, !"second level alias metadata"}
!65 = !{!8, !11, !13, !14, !19, !20, !21, !22, !25, !26, !27, !28, !31, !32, !33, !34, !37, !38, !39, !40, !43, !44, !45, !46, !49, !50, !51, !52, !55, !56, !57, !58}
!66 = distinct !{!66, !67}
!67 = !{!"llvm.loop.vectorize.enable", i1 false}
