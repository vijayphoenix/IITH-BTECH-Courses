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
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc17.i, %entry
  %indvars.iv34.i = phi i64 [ 0, %entry ], [ %indvars.iv.next35.i, %for.inc17.i ]
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i.1, %for.body3.i ]
  %0 = mul nuw nsw i64 %indvars.iv.i, %indvars.iv34.i
  %1 = trunc i64 %0 to i32
  %rem.i = and i32 %1, 1022
  %add.i = or i32 %rem.i, 1
  %conv.i = sitofp i32 %add.i to double
  %div.i = fmul double %conv.i, 5.000000e-01
  %conv4.i = fptrunc double %div.i to float
  %arrayidx6.i = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %indvars.iv34.i, i64 %indvars.iv.i
  store float %conv4.i, float* %arrayidx6.i, align 8, !tbaa !2
  %arrayidx16.i = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %indvars.iv34.i, i64 %indvars.iv.i
  store float %conv4.i, float* %arrayidx16.i, align 8, !tbaa !2
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1
  %2 = mul nuw nsw i64 %indvars.iv.next.i, %indvars.iv34.i
  %3 = trunc i64 %2 to i32
  %rem.i.1 = and i32 %3, 1023
  %add.i.1 = add nuw nsw i32 %rem.i.1, 1
  %conv.i.1 = sitofp i32 %add.i.1 to double
  %div.i.1 = fmul double %conv.i.1, 5.000000e-01
  %conv4.i.1 = fptrunc double %div.i.1 to float
  %arrayidx6.i.1 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %indvars.iv34.i, i64 %indvars.iv.next.i
  store float %conv4.i.1, float* %arrayidx6.i.1, align 4, !tbaa !2
  %arrayidx16.i.1 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %indvars.iv34.i, i64 %indvars.iv.next.i
  store float %conv4.i.1, float* %arrayidx16.i.1, align 4, !tbaa !2
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.i.1, 1536
  br i1 %exitcond.i.1, label %for.inc17.i, label %for.body3.i

for.inc17.i:                                      ; preds = %for.body3.i
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond36.i = icmp eq i64 %indvars.iv.next35.i, 1536
  br i1 %exitcond36.i, label %for.cond1.preheader, label %for.cond1.preheader.i

for.cond1.preheader:                              ; preds = %for.inc17.i, %for.inc28
  %indvar = phi i64 [ %indvar.next, %for.inc28 ], [ 0, %for.inc17.i ]
  br label %for.body3

for.body3:                                        ; preds = %for.inc25, %for.cond1.preheader
  %indvars.iv51 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next52, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %indvar, i64 %indvars.iv51
  store float 0.000000e+00, float* %arrayidx5, align 4, !tbaa !2
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next.2, %for.body8 ]
  %4 = phi float [ 0.000000e+00, %for.body3 ], [ %add.2, %for.body8 ]
  %arrayidx16 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %indvar, i64 %indvars.iv
  %5 = load float, float* %arrayidx16, align 4, !tbaa !2
  %arrayidx20 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv51
  %6 = load float, float* %arrayidx20, align 4, !tbaa !2
  %mul = fmul float %5, %6
  %add = fadd float %4, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.1 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %indvar, i64 %indvars.iv.next
  %7 = load float, float* %arrayidx16.1, align 4, !tbaa !2
  %arrayidx20.1 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv51
  %8 = load float, float* %arrayidx20.1, align 4, !tbaa !2
  %mul.1 = fmul float %7, %8
  %add.1 = fadd float %add, %mul.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx16.2 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %indvar, i64 %indvars.iv.next.1
  %9 = load float, float* %arrayidx16.2, align 4, !tbaa !2
  %arrayidx20.2 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %indvars.iv.next.1, i64 %indvars.iv51
  %10 = load float, float* %arrayidx20.2, align 4, !tbaa !2
  %mul.2 = fmul float %9, %10
  %add.2 = fadd float %add.1, %mul.2
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 1536
  br i1 %exitcond.2, label %for.inc25, label %for.body8

for.inc25:                                        ; preds = %for.body8
  store float %add.2, float* %arrayidx5, align 4, !tbaa !2
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next52, 1536
  br i1 %exitcond53, label %for.inc28, label %for.body3

for.inc28:                                        ; preds = %for.inc25
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond55 = icmp eq i64 %indvar.next, 1536
  br i1 %exitcond55, label %for.end30, label %for.cond1.preheader

for.end30:                                        ; preds = %for.inc28
  ret i32 0
}

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind }

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
