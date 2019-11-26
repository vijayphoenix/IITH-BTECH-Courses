# Finding the Footprint of a Variable

How to run
----------

1.  Compile the .cpp file using the following command

```clang -S -g -emit-llvm -Xclang -disable-O0-optnone <filepath>```

2.  Build your project after placing the Footprint directory in the Transforms folder and make the corresponding changes in the CmakeList.

3.  Run the pass using the following command

```opt -load $LLVM_BUILD/lib/Footprint.so -ftprint -var-name=i <filepath>```

Status of the Pass
------------------

The pass runs successfully on any file compiled with the above command. The user should not specify any other optimisation flag.

I have not calculated the no. of Reads and Writes of a variable. 

Apart from the above mentioned task, all parts are completed.

References
----------

-   <https://llvm.org/docs/SourceLevelDebugging.html>

-   <https://llvm.org/docs/AliasAnalysis.html>

-   <http://llvm.org/docs/ProgrammersManual.html#the-isa-cast-and-dyn-cast-templates>

-   <http://llvm.org/docs/ProgrammersManual.html#iterating-over-the-instruction-in-a-function>