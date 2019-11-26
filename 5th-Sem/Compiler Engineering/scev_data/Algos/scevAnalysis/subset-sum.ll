Printing analysis 'Scalar Evolution Analysis' for function '_Z11printSubsetPii':
Classifying expressions for: @_Z11printSubsetPii
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,-2147483648) S: [0,-2147483648)		Exits: (0 smax %size)		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,2147483648) S: [0,2147483648)		Exits: (zext i32 (0 smax %size) to i64)		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds i32, i32* %A, i64 %idxprom
  -->  {%A,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: ((4 * (zext i32 (0 smax %size) to i64))<nuw><nsw> + %A)		LoopDispositions: { %for.cond: Computable }
  %0 = load i32, i32* %arrayidx, align 4
  -->  %0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 5, i32 %0)
  -->  %call U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><%for.cond> U: [1,-2147483647) S: [1,-2147483647)		Exits: (1 + (0 smax %size))<nuw>		LoopDispositions: { %for.cond: Computable }
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  -->  %call1 U: full-set S: full-set
Determining loop execution counts for: @_Z11printSubsetPii
Loop %for.cond: backedge-taken count is (0 smax %size)
Loop %for.cond: max backedge-taken count is 2147483647
Loop %for.cond: Predicated backedge-taken count is (0 smax %size)
 Predicates:

Loop %for.cond: Trip multiple is 1
Printing analysis 'Scalar Evolution Analysis' for function '_Z10comparatorPKvS0_':
Classifying expressions for: @_Z10comparatorPKvS0_
  %0 = bitcast i8* %pLhs to i32*
  -->  %pLhs U: full-set S: full-set
  %1 = bitcast i8* %pRhs to i32*
  -->  %pRhs U: full-set S: full-set
  %2 = load i32, i32* %0, align 4
  -->  %2 U: full-set S: full-set
  %3 = load i32, i32* %1, align 4
  -->  %3 U: full-set S: full-set
  %conv = zext i1 %cmp to i32
  -->  (zext i1 %cmp to i32) U: [0,2) S: [0,2)
Determining loop execution counts for: @_Z10comparatorPKvS0_
Printing analysis 'Scalar Evolution Analysis' for function '_Z10subset_sumPiS_iiiii':
Classifying expressions for: @_Z10subset_sumPiS_iiiii
  %0 = load i32, i32* @_ZL11total_nodes, align 4
  -->  %0 U: full-set S: full-set
  %inc = add nsw i32 %0, 1
  -->  (1 + %0) U: full-set S: full-set
  %add = add nsw i32 %ite, 1
  -->  (1 + %ite) U: full-set S: full-set
  %idxprom = sext i32 %ite to i64
  -->  (sext i32 %ite to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 %idxprom
  -->  ((4 * (sext i32 %ite to i64))<nsw> + %s)<nsw> U: full-set S: full-set
  %1 = load i32, i32* %arrayidx, align 4
  -->  %1 U: full-set S: full-set
  %sub = sub nsw i32 %sum, %1
  -->  ((-1 * %1) + %sum) U: full-set S: full-set
  %add2 = add nsw i32 %ite, 1
  -->  (1 + %ite) U: full-set S: full-set
  %idxprom3 = sext i32 %add2 to i64
  -->  (sext i32 (1 + %ite) to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx4 = getelementptr inbounds i32, i32* %s, i64 %idxprom3
  -->  ((4 * (sext i32 (1 + %ite) to i64))<nsw> + %s)<nsw> U: full-set S: full-set
  %2 = load i32, i32* %arrayidx4, align 4
  -->  %2 U: full-set S: full-set
  %add5 = add nsw i32 %sub, %2
  -->  ((-1 * %1) + %sum + %2) U: full-set S: full-set
  %sub8 = sub nsw i32 %t_size, 1
  -->  (-1 + %t_size) U: full-set S: full-set
  %idxprom9 = sext i32 %ite to i64
  -->  (sext i32 %ite to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx10 = getelementptr inbounds i32, i32* %s, i64 %idxprom9
  -->  ((4 * (sext i32 %ite to i64))<nsw> + %s)<nsw> U: full-set S: full-set
  %3 = load i32, i32* %arrayidx10, align 4
  -->  %3 U: full-set S: full-set
  %sub11 = sub nsw i32 %sum, %3
  -->  ((-1 * %3) + %sum) U: full-set S: full-set
  %add12 = add nsw i32 %ite, 1
  -->  (1 + %ite) U: full-set S: full-set
  %idxprom15 = sext i32 %ite to i64
  -->  (sext i32 %ite to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx16 = getelementptr inbounds i32, i32* %s, i64 %idxprom15
  -->  ((4 * (sext i32 %ite to i64))<nsw> + %s)<nsw> U: full-set S: full-set
  %4 = load i32, i32* %arrayidx16, align 4
  -->  %4 U: full-set S: full-set
  %add17 = add nsw i32 %sum, %4
  -->  (%sum + %4) U: full-set S: full-set
  %i.0 = phi i32 [ %ite, %if.then19 ], [ %inc36, %for.inc ]
  -->  {%ite,+,1}<nsw><%for.cond> U: full-set S: full-set		Exits: (%s_size smax %ite)		LoopDispositions: { %for.cond: Computable }
  %idxprom21 = sext i32 %i.0 to i64
  -->  {(sext i32 %ite to i64),+,1}<nsw><%for.cond> U: [-2147483648,6442450943) S: [-2147483648,6442450943)		Exits: ((zext i32 ((-1 * %ite) + (%s_size smax %ite)) to i64) + (sext i32 %ite to i64))		LoopDispositions: { %for.cond: Computable }
  %arrayidx22 = getelementptr inbounds i32, i32* %s, i64 %idxprom21
  -->  {((4 * (sext i32 %ite to i64))<nsw> + %s)<nsw>,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: ((4 * (zext i32 ((-1 * %ite) + (%s_size smax %ite)) to i64))<nuw><nsw> + (4 * (sext i32 %ite to i64))<nsw> + %s)		LoopDispositions: { %for.cond: Computable }
  %5 = load i32, i32* %arrayidx22, align 4
  -->  %5 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom23 = sext i32 %t_size to i64
  -->  (sext i32 %t_size to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: (sext i32 %t_size to i64)		LoopDispositions: { %for.cond: Invariant }
  %arrayidx24 = getelementptr inbounds i32, i32* %t, i64 %idxprom23
  -->  ((4 * (sext i32 %t_size to i64))<nsw> + %t)<nsw> U: full-set S: full-set		Exits: ((4 * (sext i32 %t_size to i64))<nsw> + %t)<nsw>		LoopDispositions: { %for.cond: Invariant }
  %idxprom25 = sext i32 %i.0 to i64
  -->  {(sext i32 %ite to i64),+,1}<nsw><%for.cond> U: [-2147483648,6442450943) S: [-2147483648,6442450943)		Exits: ((zext i32 ((-1 * %ite) + (%s_size smax %ite)) to i64) + (sext i32 %ite to i64))		LoopDispositions: { %for.cond: Computable }
  %arrayidx26 = getelementptr inbounds i32, i32* %s, i64 %idxprom25
  -->  {((4 * (sext i32 %ite to i64))<nsw> + %s)<nsw>,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: ((4 * (zext i32 ((-1 * %ite) + (%s_size smax %ite)) to i64))<nuw><nsw> + (4 * (sext i32 %ite to i64))<nsw> + %s)		LoopDispositions: { %for.cond: Computable }
  %6 = load i32, i32* %arrayidx26, align 4
  -->  %6 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %add27 = add nsw i32 %sum, %6
  -->  (%sum + %6) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %add30 = add nsw i32 %t_size, 1
  -->  (1 + %t_size) U: full-set S: full-set		Exits: (1 + %t_size)		LoopDispositions: { %for.cond: Invariant }
  %idxprom31 = sext i32 %i.0 to i64
  -->  {(sext i32 %ite to i64),+,1}<nsw><%for.cond> U: [-2147483648,6442450943) S: [-2147483648,6442450943)		Exits: ((zext i32 ((-1 * %ite) + (%s_size smax %ite)) to i64) + (sext i32 %ite to i64))		LoopDispositions: { %for.cond: Computable }
  %arrayidx32 = getelementptr inbounds i32, i32* %s, i64 %idxprom31
  -->  {((4 * (sext i32 %ite to i64))<nsw> + %s)<nsw>,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: ((4 * (zext i32 ((-1 * %ite) + (%s_size smax %ite)) to i64))<nuw><nsw> + (4 * (sext i32 %ite to i64))<nsw> + %s)		LoopDispositions: { %for.cond: Computable }
  %7 = load i32, i32* %arrayidx32, align 4
  -->  %7 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %add33 = add nsw i32 %sum, %7
  -->  (%sum + %7) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %add34 = add nsw i32 %i.0, 1
  -->  {(1 + %ite),+,1}<nw><%for.cond> U: full-set S: full-set		Exits: (1 + (%s_size smax %ite))		LoopDispositions: { %for.cond: Computable }
  %inc36 = add nsw i32 %i.0, 1
  -->  {(1 + %ite),+,1}<nw><%for.cond> U: full-set S: full-set		Exits: (1 + (%s_size smax %ite))		LoopDispositions: { %for.cond: Computable }
Determining loop execution counts for: @_Z10subset_sumPiS_iiiii
Loop %for.cond: backedge-taken count is ((-1 * %ite) + (%s_size smax %ite))
Loop %for.cond: max backedge-taken count is -1
Loop %for.cond: Predicated backedge-taken count is ((-1 * %ite) + (%s_size smax %ite))
 Predicates:

Loop %for.cond: Trip multiple is 1
Printing analysis 'Scalar Evolution Analysis' for function '_Z15generateSubsetsPiii':
Classifying expressions for: @_Z15generateSubsetsPiii
  %conv = sext i32 %size to i64
  -->  (sext i32 %size to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %mul = mul i64 %conv, 4
  -->  (4 * (sext i32 %size to i64))<nsw> U: [0,-3) S: [-8589934592,8589934589)
  %call = call noalias i8* @malloc(i64 %mul) #6
  -->  %call U: full-set S: full-set
  %0 = bitcast i8* %call to i32*
  -->  %call U: full-set S: full-set
  %1 = bitcast i32* %s to i8*
  -->  %s U: full-set S: full-set
  %conv1 = sext i32 %size to i64
  -->  (sext i32 %size to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %total.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  -->  %total.0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,-2147483648) S: [0,-2147483648)		Exits: (0 smax %size)		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,2147483648) S: [0,2147483648)		Exits: (zext i32 (0 smax %size) to i64)		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 %idxprom
  -->  {%s,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: ((4 * (zext i32 (0 smax %size) to i64))<nuw><nsw> + %s)		LoopDispositions: { %for.cond: Computable }
  %2 = load i32, i32* %arrayidx, align 4
  -->  %2 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %add = add nsw i32 %total.0, %2
  -->  (%2 + %total.0) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><%for.cond> U: [1,-2147483647) S: [1,-2147483647)		Exits: (1 + (0 smax %size))<nuw>		LoopDispositions: { %for.cond: Computable }
  %arrayidx2 = getelementptr inbounds i32, i32* %s, i64 0
  -->  %s U: full-set S: full-set
  %3 = load i32, i32* %arrayidx2, align 4
  -->  %3 U: full-set S: full-set
  %4 = bitcast i32* %0 to i8*
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_Z15generateSubsetsPiii
Loop %for.cond: backedge-taken count is (0 smax %size)
Loop %for.cond: max backedge-taken count is 2147483647
Loop %for.cond: Predicated backedge-taken count is (0 smax %size)
 Predicates:

Loop %for.cond: Trip multiple is 1
Printing analysis 'Scalar Evolution Analysis' for function 'main':
Classifying expressions for: @main
  %weights = alloca [8 x i32], align 16
  -->  %weights U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %0 = bitcast [8 x i32]* %weights to i8*
  -->  %weights U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %arraydecay = getelementptr inbounds [8 x i32], [8 x i32]* %weights, i64 0, i64 0
  -->  %weights U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %1 = load i32, i32* @_ZL11total_nodes, align 4
  -->  %1 U: full-set S: full-set
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i32 %1)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @main
