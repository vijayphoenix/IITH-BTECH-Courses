Printing analysis 'Scalar Evolution Analysis' for function '_Z6isSafeiPA4_bPii':
Classifying expressions for: @_Z6isSafeiPA4_bPii
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %v to i64
  -->  (sext i32 %v to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: (sext i32 %v to i64)		LoopDispositions: { %for.cond: Invariant }
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %graph, i64 %idxprom
  -->  ((4 * (sext i32 %v to i64))<nsw> + %graph)<nsw> U: full-set S: full-set		Exits: ((4 * (sext i32 %v to i64))<nsw> + %graph)<nsw>		LoopDispositions: { %for.cond: Invariant }
  %idxprom1 = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %arrayidx2 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx, i64 0, i64 %idxprom1
  -->  {((4 * (sext i32 %v to i64))<nsw> + %graph)<nsw>,+,1}<nw><%for.cond> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %0 = load i8, i8* %arrayidx2, align 1
  -->  %0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %tobool = trunc i8 %0 to i1
  -->  (trunc i8 %0 to i1) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom3 = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %arrayidx4 = getelementptr inbounds i32, i32* %color, i64 %idxprom3
  -->  {%color,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %1 = load i32, i32* %arrayidx4, align 4
  -->  %1 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,6) S: [1,6)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %retval.0 = phi i1 [ false, %if.then ], [ true, %for.end ]
  -->  %retval.0 U: full-set S: full-set
Determining loop execution counts for: @_Z6isSafeiPA4_bPii
Loop %for.cond: <multiple exits> Unpredictable backedge-taken count.
  exit count for for.cond: 4
  exit count for land.lhs.true: ***COULDNOTCOMPUTE***
Loop %for.cond: max backedge-taken count is 4
Loop %for.cond: Unpredictable predicated backedge-taken count. 
Printing analysis 'Scalar Evolution Analysis' for function '_Z17graphColoringUtilPA4_biPii':
Classifying expressions for: @_Z17graphColoringUtilPA4_biPii
  %c.0 = phi i32 [ 1, %if.end ], [ %inc, %for.inc ]
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,-2147483648) S: [1,-2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %call = call zeroext i1 @_Z6isSafeiPA4_bPii(i32 %v, [4 x i8]* %graph, i32* %color, i32 %c.0)
  -->  %call U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom = sext i32 %v to i64
  -->  (sext i32 %v to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: (sext i32 %v to i64)		LoopDispositions: { %for.cond: Invariant }
  %arrayidx = getelementptr inbounds i32, i32* %color, i64 %idxprom
  -->  ((4 * (sext i32 %v to i64))<nsw> + %color)<nsw> U: full-set S: full-set		Exits: ((4 * (sext i32 %v to i64))<nsw> + %color)<nsw>		LoopDispositions: { %for.cond: Invariant }
  %add = add nsw i32 %v, 1
  -->  (1 + %v) U: full-set S: full-set		Exits: (1 + %v)		LoopDispositions: { %for.cond: Invariant }
  %call3 = call zeroext i1 @_Z17graphColoringUtilPA4_biPii([4 x i8]* %graph, i32 %m, i32* %color, i32 %add)
  -->  %call3 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %conv = zext i1 %call3 to i32
  -->  (zext i1 %call3 to i32) U: [0,2) S: [0,2)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom7 = sext i32 %v to i64
  -->  (sext i32 %v to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: (sext i32 %v to i64)		LoopDispositions: { %for.cond: Invariant }
  %arrayidx8 = getelementptr inbounds i32, i32* %color, i64 %idxprom7
  -->  ((4 * (sext i32 %v to i64))<nsw> + %color)<nsw> U: full-set S: full-set		Exits: ((4 * (sext i32 %v to i64))<nsw> + %color)<nsw>		LoopDispositions: { %for.cond: Invariant }
  %inc = add nsw i32 %c.0, 1
  -->  {2,+,1}<nuw><%for.cond> U: [2,-2147483646) S: [2,-2147483646)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %retval.0 = phi i1 [ true, %if.then ], [ true, %if.then5 ], [ false, %for.end ]
  -->  %retval.0 U: full-set S: full-set
Determining loop execution counts for: @_Z17graphColoringUtilPA4_biPii
Loop %for.cond: <multiple exits> Unpredictable backedge-taken count.
  exit count for for.cond: (0 smax %m)
  exit count for if.then2: ***COULDNOTCOMPUTE***
Loop %for.cond: max backedge-taken count is 2147483647
Loop %for.cond: Unpredictable predicated backedge-taken count. 
Printing analysis 'Scalar Evolution Analysis' for function '_Z13graphColoringPA4_bi':
Classifying expressions for: @_Z13graphColoringPA4_bi
  %color = alloca [4 x i32], align 16
  -->  %color U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %color, i64 0, i64 %idxprom
  -->  {%color,+,4}<nsw><%for.cond> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: (16 + %color)		LoopDispositions: { %for.cond: Computable }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond: Computable }
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %color, i64 0, i64 0
  -->  %color U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %call = call zeroext i1 @_Z17graphColoringUtilPA4_biPii([4 x i8]* %graph, i32 %m, i32* %arraydecay, i32 0)
  -->  %call U: full-set S: full-set
  %conv = zext i1 %call to i32
  -->  (zext i1 %call to i32) U: [0,2) S: [0,2)
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0))
  -->  %call2 U: full-set S: full-set
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %color, i64 0, i64 0
  -->  %color U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %retval.0 = phi i1 [ false, %if.then ], [ true, %if.end ]
  -->  %retval.0 U: full-set S: full-set
Determining loop execution counts for: @_Z13graphColoringPA4_bi
Loop %for.cond: backedge-taken count is 4
Loop %for.cond: max backedge-taken count is 4
Loop %for.cond: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond: Trip multiple is 5
Printing analysis 'Scalar Evolution Analysis' for function '_Z13printSolutionPi':
Classifying expressions for: @_Z13printSolutionPi
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.1, i64 0, i64 0))
  -->  %call U: full-set S: full-set
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds i32, i32* %color, i64 %idxprom
  -->  {%color,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: (16 + %color)		LoopDispositions: { %for.cond: Computable }
  %0 = load i32, i32* %arrayidx, align 4
  -->  %0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %0)
  -->  %call1 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond: Computable }
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_Z13printSolutionPi
Loop %for.cond: backedge-taken count is 4
Loop %for.cond: max backedge-taken count is 4
Loop %for.cond: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond: Trip multiple is 5
Printing analysis 'Scalar Evolution Analysis' for function 'main':
Classifying expressions for: @main
  %graph = alloca [4 x [4 x i8]], align 16
  -->  %graph U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %0 = bitcast [4 x [4 x i8]]* %graph to i8*
  -->  %graph U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %arraydecay = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %graph, i64 0, i64 0
  -->  %graph U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %call = call zeroext i1 @_Z13graphColoringPA4_bi([4 x i8]* %arraydecay, i32 3)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @main
