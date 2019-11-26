Printing analysis 'Scalar Evolution Analysis' for function '_Z17transitiveClosurePA4_i':
Classifying expressions for: @_Z17transitiveClosurePA4_i
  %reach = alloca [4 x [4 x i32]], align 16
  -->  %reach U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %i.0 = phi i32 [ 0, %entry ], [ %inc11, %for.inc10 ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond: Computable, %for.cond1: Invariant }
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond1> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond>		LoopDispositions: { %for.cond1: Invariant, %for.cond: Computable }
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %graph, i64 %idxprom
  -->  {%graph,+,16}<nsw><%for.cond> U: full-set S: full-set		Exits: {%graph,+,16}<nsw><%for.cond>		LoopDispositions: { %for.cond1: Invariant, %for.cond: Computable }
  %idxprom4 = sext i32 %j.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond1> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  -->  {{%graph,+,16}<nsw><%for.cond>,+,4}<nsw><%for.cond1> U: full-set S: full-set		Exits: {(16 + %graph),+,16}<nw><%for.cond>		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %0 = load i32, i32* %arrayidx5, align 4
  -->  %0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond1: Variant, %for.cond: Variant }
  %idxprom6 = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond>		LoopDispositions: { %for.cond1: Invariant, %for.cond: Computable }
  %arrayidx7 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %reach, i64 0, i64 %idxprom6
  -->  {%reach,+,16}<nsw><%for.cond> U: [0,-15) S: [-9223372036854775808,9223372036854775793)		Exits: {%reach,+,16}<nsw><%for.cond>		LoopDispositions: { %for.cond1: Invariant, %for.cond: Computable }
  %idxprom8 = sext i32 %j.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond1> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  -->  {{%reach,+,16}<nsw><%for.cond>,+,4}<nsw><%for.cond1> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {(16 + %reach),+,16}<nw><%for.cond>		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %inc = add nsw i32 %j.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond1> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %inc11 = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond: Computable, %for.cond1: Invariant }
  %k.0 = phi i32 [ 0, %for.end12 ], [ %inc47, %for.inc46 ]
  -->  {0,+,1}<nuw><nsw><%for.cond13> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond13: Computable, %for.cond16: Invariant, %for.cond19: Invariant }
  %i.1 = phi i32 [ 0, %for.body15 ], [ %inc44, %for.inc43 ]
  -->  {0,+,1}<nuw><nsw><%for.cond16> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond16: Computable, %for.cond13: Variant, %for.cond19: Invariant }
  %j.1 = phi i32 [ 0, %for.body18 ], [ %inc41, %for.inc40 ]
  -->  {0,+,1}<nuw><nsw><%for.cond19> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %idxprom22 = sext i32 %i.1 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond16> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond16>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Computable, %for.cond13: Variant }
  %arrayidx23 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %reach, i64 0, i64 %idxprom22
  -->  {%reach,+,16}<nsw><%for.cond16> U: [0,-15) S: [-9223372036854775808,9223372036854775793)		Exits: {%reach,+,16}<nsw><%for.cond16>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Computable, %for.cond13: Variant }
  %idxprom24 = sext i32 %j.1 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond19> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx23, i64 0, i64 %idxprom24
  -->  {{%reach,+,16}<nsw><%for.cond16>,+,4}<nsw><%for.cond19> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {(16 + %reach),+,16}<nw><%for.cond16>		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %1 = load i32, i32* %arrayidx25, align 4
  -->  %1 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond19: Variant, %for.cond16: Variant, %for.cond13: Variant }
  %idxprom26 = sext i32 %i.1 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond16> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond16>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Computable, %for.cond13: Variant }
  %arrayidx27 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %reach, i64 0, i64 %idxprom26
  -->  {%reach,+,16}<nsw><%for.cond16> U: [0,-15) S: [-9223372036854775808,9223372036854775793)		Exits: {%reach,+,16}<nsw><%for.cond16>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Computable, %for.cond13: Variant }
  %idxprom28 = sext i32 %k.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond13> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond13>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Invariant, %for.cond13: Computable }
  %arrayidx29 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx27, i64 0, i64 %idxprom28
  -->  {{%reach,+,4}<nsw><%for.cond13>,+,16}<nsw><%for.cond16> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {{%reach,+,4}<nsw><%for.cond13>,+,16}<nsw><%for.cond16>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Computable, %for.cond13: Variant }
  %2 = load i32, i32* %arrayidx29, align 4
  -->  %2 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond19: Variant, %for.cond16: Variant, %for.cond13: Variant }
  %idxprom31 = sext i32 %k.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond13> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond13>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Invariant, %for.cond13: Computable }
  %arrayidx32 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %reach, i64 0, i64 %idxprom31
  -->  {%reach,+,16}<nsw><%for.cond13> U: [0,-15) S: [-9223372036854775808,9223372036854775793)		Exits: {%reach,+,16}<nsw><%for.cond13>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Invariant, %for.cond13: Computable }
  %idxprom33 = sext i32 %j.1 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond19> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %arrayidx34 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx32, i64 0, i64 %idxprom33
  -->  {{%reach,+,16}<nsw><%for.cond13>,+,4}<nsw><%for.cond19> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {(16 + %reach),+,16}<nw><%for.cond13>		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %3 = load i32, i32* %arrayidx34, align 4
  -->  %3 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond19: Variant, %for.cond16: Variant, %for.cond13: Variant }
  %4 = phi i1 [ false, %lor.rhs ], [ %tobool35, %land.rhs ]
  -->  %4 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond19: Variant, %for.cond16: Variant, %for.cond13: Variant }
  %5 = phi i1 [ true, %for.body21 ], [ %4, %land.end ]
  -->  %5 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond19: Variant, %for.cond16: Variant, %for.cond13: Variant }
  %conv = zext i1 %5 to i32
  -->  (zext i1 %5 to i32) U: [0,2) S: [0,2)		Exits: <<Unknown>>		LoopDispositions: { %for.cond19: Variant, %for.cond16: Variant, %for.cond13: Variant }
  %idxprom36 = sext i32 %i.1 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond16> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond16>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Computable, %for.cond13: Variant }
  %arrayidx37 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %reach, i64 0, i64 %idxprom36
  -->  {%reach,+,16}<nsw><%for.cond16> U: [0,-15) S: [-9223372036854775808,9223372036854775793)		Exits: {%reach,+,16}<nsw><%for.cond16>		LoopDispositions: { %for.cond19: Invariant, %for.cond16: Computable, %for.cond13: Variant }
  %idxprom38 = sext i32 %j.1 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond19> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %arrayidx39 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx37, i64 0, i64 %idxprom38
  -->  {{%reach,+,16}<nsw><%for.cond16>,+,4}<nsw><%for.cond19> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {(16 + %reach),+,16}<nw><%for.cond16>		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %inc41 = add nsw i32 %j.1, 1
  -->  {1,+,1}<nuw><nsw><%for.cond19> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond19: Computable, %for.cond16: Variant, %for.cond13: Variant }
  %inc44 = add nsw i32 %i.1, 1
  -->  {1,+,1}<nuw><nsw><%for.cond16> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond16: Computable, %for.cond13: Variant, %for.cond19: Invariant }
  %inc47 = add nsw i32 %k.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond13> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond13: Computable, %for.cond16: Invariant, %for.cond19: Invariant }
  %arraydecay = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %reach, i64 0, i64 0
  -->  %reach U: [0,-15) S: [-9223372036854775808,9223372036854775793)
Determining loop execution counts for: @_Z17transitiveClosurePA4_i
Loop %for.cond19: backedge-taken count is 4
Loop %for.cond19: max backedge-taken count is 4
Loop %for.cond19: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond19: Trip multiple is 5
Loop %for.cond16: backedge-taken count is 4
Loop %for.cond16: max backedge-taken count is 4
Loop %for.cond16: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond16: Trip multiple is 5
Loop %for.cond13: backedge-taken count is 4
Loop %for.cond13: max backedge-taken count is 4
Loop %for.cond13: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond13: Trip multiple is 5
Loop %for.cond1: backedge-taken count is 4
Loop %for.cond1: max backedge-taken count is 4
Loop %for.cond1: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond1: Trip multiple is 5
Loop %for.cond: backedge-taken count is 4
Loop %for.cond: max backedge-taken count is 4
Loop %for.cond: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond: Trip multiple is 5
Printing analysis 'Scalar Evolution Analysis' for function '_Z13printSolutionPA4_i':
Classifying expressions for: @_Z13printSolutionPA4_i
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i64 0, i64 0))
  -->  %call U: full-set S: full-set
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond: Computable, %for.cond1: Invariant }
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond1> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,5) S: [0,5)		Exits: {0,+,1}<nuw><nsw><%for.cond>		LoopDispositions: { %for.cond1: Invariant, %for.cond: Computable }
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %reach, i64 %idxprom
  -->  {%reach,+,16}<nsw><%for.cond> U: full-set S: full-set		Exits: {%reach,+,16}<nsw><%for.cond>		LoopDispositions: { %for.cond1: Invariant, %for.cond: Computable }
  %idxprom4 = sext i32 %j.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond1> U: [0,5) S: [0,5)		Exits: 4		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  -->  {{%reach,+,16}<nsw><%for.cond>,+,4}<nsw><%for.cond1> U: full-set S: full-set		Exits: {(16 + %reach),+,16}<nw><%for.cond>		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %0 = load i32, i32* %arrayidx5, align 4
  -->  %0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond1: Variant, %for.cond: Variant }
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %0)
  -->  %call6 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond1: Variant, %for.cond: Variant }
  %inc = add nsw i32 %j.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond1> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond1: Computable, %for.cond: Variant }
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  -->  %call7 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant, %for.cond1: Invariant }
  %inc9 = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,6) S: [1,6)		Exits: 5		LoopDispositions: { %for.cond: Computable, %for.cond1: Invariant }
Determining loop execution counts for: @_Z13printSolutionPA4_i
Loop %for.cond1: backedge-taken count is 4
Loop %for.cond1: max backedge-taken count is 4
Loop %for.cond1: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond1: Trip multiple is 5
Loop %for.cond: backedge-taken count is 4
Loop %for.cond: max backedge-taken count is 4
Loop %for.cond: Predicated backedge-taken count is 4
 Predicates:

Loop %for.cond: Trip multiple is 5
Printing analysis 'Scalar Evolution Analysis' for function 'main':
Classifying expressions for: @main
  %graph = alloca [4 x [4 x i32]], align 16
  -->  %graph U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %0 = bitcast [4 x [4 x i32]]* %graph to i8*
  -->  %graph U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %arraydecay = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %graph, i64 0, i64 0
  -->  %graph U: [0,-15) S: [-9223372036854775808,9223372036854775793)
Determining loop execution counts for: @main
