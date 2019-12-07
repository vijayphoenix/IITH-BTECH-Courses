; ModuleID = 'fibbonaci.cpp'
source_filename = "fibbonaci.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_Z3fibi(i32 %n) #0 {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i32, align 4
  %f1 = alloca i64, align 8
  %f2 = alloca i64, align 8
  %sum = alloca i64, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 0, i64* %f1, align 8
  store i64 1, i64* %f2, align 8
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %f1, align 8
  store i64 %1, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp sle i32 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %f1, align 8
  %5 = load i64, i64* %f2, align 8
  %add = add nsw i64 %4, %5
  store i64 %add, i64* %sum, align 8
  %6 = load i64, i64* %f2, align 8
  store i64 %6, i64* %f1, align 8
  %7 = load i64, i64* %sum, align 8
  store i64 %7, i64* %f2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i64, i64* %f2, align 8
  store i64 %9, i64* %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  %10 = load i64, i64* %retval, align 8
  ret i64 %10
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define dso_local i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i64 @_Z3fibi(i32 10)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 028b5499fffa536236cb5714e6d14b786883a4b4)"}
