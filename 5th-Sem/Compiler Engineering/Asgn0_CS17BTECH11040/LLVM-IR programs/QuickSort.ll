; ModuleID = 'QuickSort.cpp'
source_filename = "QuickSort.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z4SWAPPiS_(i32* %a, i32* %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %temp = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  %0 = load i32*, i32** %a.addr, align 8
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %temp, align 4
  %2 = load i32*, i32** %b.addr, align 8
  %3 = load i32, i32* %2, align 4
  %4 = load i32*, i32** %a.addr, align 8
  store i32 %3, i32* %4, align 4
  %5 = load i32, i32* %temp, align 4
  %6 = load i32*, i32** %b.addr, align 8
  store i32 %5, i32* %6, align 4
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z9quicksortPiii(i32* %a, i32 %l, i32 %r) #1 {
entry:
  %a.addr = alloca i32*, align 8
  %l.addr = alloca i32, align 4
  %r.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %l, i32* %l.addr, align 4
  store i32 %r, i32* %r.addr, align 4
  %0 = load i32, i32* %l.addr, align 4
  %1 = load i32, i32* %r.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end30

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %l.addr, align 4
  store i32 %2, i32* %i, align 4
  %3 = load i32, i32* %r.addr, align 4
  store i32 %3, i32* %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %j, align 4
  %cmp1 = icmp slt i32 %4, %5
  br i1 %cmp1, label %while.body, label %while.end25

while.body:                                       ; preds = %while.cond
  br label %while.cond2

while.cond2:                                      ; preds = %while.body7, %while.body
  %6 = load i32*, i32** %a.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom
  %8 = load i32, i32* %arrayidx, align 4
  %9 = load i32*, i32** %a.addr, align 8
  %10 = load i32, i32* %l.addr, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %idxprom3
  %11 = load i32, i32* %arrayidx4, align 4
  %cmp5 = icmp sle i32 %8, %11
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond2
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %j, align 4
  %cmp6 = icmp sle i32 %12, %13
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond2
  %14 = phi i1 [ false, %while.cond2 ], [ %cmp6, %land.rhs ]
  br i1 %14, label %while.body7, label %while.end

while.body7:                                      ; preds = %land.end
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond2

while.end:                                        ; preds = %land.end
  br label %while.cond8

while.cond8:                                      ; preds = %while.body17, %while.end
  %16 = load i32*, i32** %a.addr, align 8
  %17 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %17 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %16, i64 %idxprom9
  %18 = load i32, i32* %arrayidx10, align 4
  %19 = load i32*, i32** %a.addr, align 8
  %20 = load i32, i32* %l.addr, align 4
  %idxprom11 = sext i32 %20 to i64
  %arrayidx12 = getelementptr inbounds i32, i32* %19, i64 %idxprom11
  %21 = load i32, i32* %arrayidx12, align 4
  %cmp13 = icmp sge i32 %18, %21
  br i1 %cmp13, label %land.rhs14, label %land.end16

land.rhs14:                                       ; preds = %while.cond8
  %22 = load i32, i32* %j, align 4
  %23 = load i32, i32* %i, align 4
  %cmp15 = icmp sge i32 %22, %23
  br label %land.end16

land.end16:                                       ; preds = %land.rhs14, %while.cond8
  %24 = phi i1 [ false, %while.cond8 ], [ %cmp15, %land.rhs14 ]
  br i1 %24, label %while.body17, label %while.end18

while.body17:                                     ; preds = %land.end16
  %25 = load i32, i32* %j, align 4
  %dec = add nsw i32 %25, -1
  store i32 %dec, i32* %j, align 4
  br label %while.cond8

while.end18:                                      ; preds = %land.end16
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %j, align 4
  %cmp19 = icmp slt i32 %26, %27
  br i1 %cmp19, label %if.then20, label %if.end

if.then20:                                        ; preds = %while.end18
  %28 = load i32*, i32** %a.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %29 to i64
  %arrayidx22 = getelementptr inbounds i32, i32* %28, i64 %idxprom21
  %30 = load i32*, i32** %a.addr, align 8
  %31 = load i32, i32* %j, align 4
  %idxprom23 = sext i32 %31 to i64
  %arrayidx24 = getelementptr inbounds i32, i32* %30, i64 %idxprom23
  call void @_Z4SWAPPiS_(i32* %arrayidx22, i32* %arrayidx24)
  br label %if.end

if.end:                                           ; preds = %if.then20, %while.end18
  br label %while.cond

while.end25:                                      ; preds = %while.cond
  %32 = load i32*, i32** %a.addr, align 8
  %33 = load i32, i32* %l.addr, align 4
  %idxprom26 = sext i32 %33 to i64
  %arrayidx27 = getelementptr inbounds i32, i32* %32, i64 %idxprom26
  %34 = load i32*, i32** %a.addr, align 8
  %35 = load i32, i32* %j, align 4
  %idxprom28 = sext i32 %35 to i64
  %arrayidx29 = getelementptr inbounds i32, i32* %34, i64 %idxprom28
  call void @_Z4SWAPPiS_(i32* %arrayidx27, i32* %arrayidx29)
  %36 = load i32*, i32** %a.addr, align 8
  %37 = load i32, i32* %l.addr, align 4
  %38 = load i32, i32* %j, align 4
  %sub = sub nsw i32 %38, 1
  call void @_Z9quicksortPiii(i32* %36, i32 %37, i32 %sub)
  %39 = load i32*, i32** %a.addr, align 8
  %40 = load i32, i32* %j, align 4
  %add = add nsw i32 %40, 1
  %41 = load i32, i32* %r.addr, align 4
  call void @_Z9quicksortPiii(i32* %39, i32 %add, i32 %41)
  br label %if.end30

if.end30:                                         ; preds = %while.end25, %entry
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 028b5499fffa536236cb5714e6d14b786883a4b4)"}
