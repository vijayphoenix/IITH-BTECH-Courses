; ModuleID = 'MergeSort.cpp'
source_filename = "MergeSort.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z9mergesortPiii(i32* %a, i32 %l, i32 %r) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %l.addr = alloca i32, align 4
  %r.addr = alloca i32, align 4
  %mid = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %l, i32* %l.addr, align 4
  store i32 %r, i32* %r.addr, align 4
  %0 = load i32, i32* %l.addr, align 4
  %1 = load i32, i32* %r.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end41

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %l.addr, align 4
  %3 = load i32, i32* %r.addr, align 4
  %4 = load i32, i32* %l.addr, align 4
  %sub = sub nsw i32 %3, %4
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %2, %div
  store i32 %add, i32* %mid, align 4
  %5 = load i32*, i32** %a.addr, align 8
  %6 = load i32, i32* %l.addr, align 4
  %7 = load i32, i32* %mid, align 4
  call void @_Z9mergesortPiii(i32* %5, i32 %6, i32 %7)
  %8 = load i32*, i32** %a.addr, align 8
  %9 = load i32, i32* %mid, align 4
  %add1 = add nsw i32 %9, 1
  %10 = load i32, i32* %r.addr, align 4
  call void @_Z9mergesortPiii(i32* %8, i32 %add1, i32 %10)
  %11 = load i32, i32* %r.addr, align 4
  %12 = load i32, i32* %l.addr, align 4
  %sub2 = sub nsw i32 %11, %12
  %add3 = add nsw i32 %sub2, 1
  %13 = zext i32 %add3 to i64
  %14 = call i8* @llvm.stacksave()
  store i8* %14, i8** %saved_stack, align 8
  %vla = alloca i32, i64 %13, align 16
  store i64 %13, i64* %__vla_expr0, align 8
  %15 = load i32, i32* %l.addr, align 4
  store i32 %15, i32* %i, align 4
  %16 = load i32, i32* %mid, align 4
  %add4 = add nsw i32 %16, 1
  store i32 %add4, i32* %j, align 4
  store i32 0, i32* %k, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end32, %if.then
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %mid, align 4
  %cmp5 = icmp sle i32 %17, %18
  br i1 %cmp5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %19 = load i32, i32* %j, align 4
  %20 = load i32, i32* %r.addr, align 4
  %cmp6 = icmp sle i32 %19, %20
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %21 = phi i1 [ true, %while.cond ], [ %cmp6, %lor.rhs ]
  br i1 %21, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %22 = load i32, i32* %j, align 4
  %23 = load i32, i32* %r.addr, align 4
  %cmp7 = icmp sle i32 %22, %23
  br i1 %cmp7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %mid, align 4
  %cmp8 = icmp sgt i32 %24, %25
  br i1 %cmp8, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %26 = load i32*, i32** %a.addr, align 8
  %27 = load i32, i32* %j, align 4
  %idxprom = sext i32 %27 to i64
  %arrayidx = getelementptr inbounds i32, i32* %26, i64 %idxprom
  %28 = load i32, i32* %arrayidx, align 4
  %29 = load i32*, i32** %a.addr, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %30 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %29, i64 %idxprom9
  %31 = load i32, i32* %arrayidx10, align 4
  %cmp11 = icmp slt i32 %28, %31
  br i1 %cmp11, label %if.then12, label %if.else

if.then12:                                        ; preds = %lor.lhs.false, %land.lhs.true
  %32 = load i32*, i32** %a.addr, align 8
  %33 = load i32, i32* %j, align 4
  %idxprom13 = sext i32 %33 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %32, i64 %idxprom13
  %34 = load i32, i32* %arrayidx14, align 4
  %35 = load i32, i32* %k, align 4
  %idxprom15 = sext i32 %35 to i64
  %arrayidx16 = getelementptr inbounds i32, i32* %vla, i64 %idxprom15
  store i32 %34, i32* %arrayidx16, align 4
  %36 = load i32, i32* %j, align 4
  %inc = add nsw i32 %36, 1
  store i32 %inc, i32* %j, align 4
  br label %if.end32

if.else:                                          ; preds = %lor.lhs.false, %while.body
  %37 = load i32, i32* %i, align 4
  %38 = load i32, i32* %mid, align 4
  %cmp17 = icmp sle i32 %37, %38
  br i1 %cmp17, label %land.lhs.true18, label %if.end

land.lhs.true18:                                  ; preds = %if.else
  %39 = load i32, i32* %j, align 4
  %40 = load i32, i32* %r.addr, align 4
  %cmp19 = icmp sgt i32 %39, %40
  br i1 %cmp19, label %if.then26, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %land.lhs.true18
  %41 = load i32*, i32** %a.addr, align 8
  %42 = load i32, i32* %j, align 4
  %idxprom21 = sext i32 %42 to i64
  %arrayidx22 = getelementptr inbounds i32, i32* %41, i64 %idxprom21
  %43 = load i32, i32* %arrayidx22, align 4
  %44 = load i32*, i32** %a.addr, align 8
  %45 = load i32, i32* %i, align 4
  %idxprom23 = sext i32 %45 to i64
  %arrayidx24 = getelementptr inbounds i32, i32* %44, i64 %idxprom23
  %46 = load i32, i32* %arrayidx24, align 4
  %cmp25 = icmp sge i32 %43, %46
  br i1 %cmp25, label %if.then26, label %if.end

if.then26:                                        ; preds = %lor.lhs.false20, %land.lhs.true18
  %47 = load i32*, i32** %a.addr, align 8
  %48 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %48 to i64
  %arrayidx28 = getelementptr inbounds i32, i32* %47, i64 %idxprom27
  %49 = load i32, i32* %arrayidx28, align 4
  %50 = load i32, i32* %k, align 4
  %idxprom29 = sext i32 %50 to i64
  %arrayidx30 = getelementptr inbounds i32, i32* %vla, i64 %idxprom29
  store i32 %49, i32* %arrayidx30, align 4
  %51 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %51, 1
  store i32 %inc31, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then26, %lor.lhs.false20, %if.else
  br label %if.end32

if.end32:                                         ; preds = %if.end, %if.then12
  %52 = load i32, i32* %k, align 4
  %inc33 = add nsw i32 %52, 1
  store i32 %inc33, i32* %k, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %53 = load i32, i32* %l.addr, align 4
  store i32 %53, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %54 = load i32, i32* %i, align 4
  %55 = load i32, i32* %r.addr, align 4
  %cmp34 = icmp sle i32 %54, %55
  br i1 %cmp34, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %56 = load i32, i32* %i, align 4
  %57 = load i32, i32* %l.addr, align 4
  %sub35 = sub nsw i32 %56, %57
  %idxprom36 = sext i32 %sub35 to i64
  %arrayidx37 = getelementptr inbounds i32, i32* %vla, i64 %idxprom36
  %58 = load i32, i32* %arrayidx37, align 4
  %59 = load i32*, i32** %a.addr, align 8
  %60 = load i32, i32* %i, align 4
  %idxprom38 = sext i32 %60 to i64
  %arrayidx39 = getelementptr inbounds i32, i32* %59, i64 %idxprom38
  store i32 %58, i32* %arrayidx39, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %61 = load i32, i32* %i, align 4
  %inc40 = add nsw i32 %61, 1
  store i32 %inc40, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %62 = load i8*, i8** %saved_stack, align 8
  call void @llvm.stackrestore(i8* %62)
  br label %if.end41

if.end41:                                         ; preds = %for.end, %entry
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 028b5499fffa536236cb5714e6d14b786883a4b4)"}
