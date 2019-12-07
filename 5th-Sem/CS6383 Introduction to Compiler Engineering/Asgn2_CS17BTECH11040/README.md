# Loop Reversal

## Instructions to run the pass

1) Create a new directory LoopReversal in lib/Transforms/ folder of the LLVM source tree.  
2) Copy the files in this directory and make corresponding changes in the CMake file.  
3) Run the following command  

```
opt -load $LLVM_BUILD/lib/LoopReversal.so -loop-reversal <test.ll> -S > <reversed.ll>  
```

4) To test the correctness of the pass, run the following  

```
diff <(lli <test.ll>) <(lli <reversed.ll>)  
```

## Assumptions and status of the submission  

* The loop reversal pass works for update statements like add, sub.
* The induction variable can be of type signed or unsigned int.
* The comparsion operator can be `>, >=, <=, <`
* The pass works for loops, and while loop.
* The pass also works with nested loops.

### References

* [LegacyPassManager](https://llvm.org/doxygen/classllvm_1_1legacy_1_1PassManager.html)
* [LoopInfo](https://llvm.org/doxygen/classllvm_1_1LoopInfo.html)
* [NoFolder](https://llvm.org/doxygen/classllvm_1_1NoFolder.html)
* [IRBuilder](https://llvm.org/doxygen/classllvm_1_1IRBuilder.html)
