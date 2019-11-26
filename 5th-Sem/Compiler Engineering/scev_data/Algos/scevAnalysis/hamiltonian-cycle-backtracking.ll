Printing analysis 'Scalar Evolution Analysis' for function '__cxx_global_var_init':
Classifying expressions for: @__cxx_global_var_init
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  -->  %0 U: full-set S: full-set
Determining loop execution counts for: @__cxx_global_var_init
Printing analysis 'Scalar Evolution Analysis' for function '_Z6isSafeiPA5_bPii':
Classifying expressions for: @_Z6isSafeiPA5_bPii
  %sub = sub nsw i32 %pos, 1
  -->  (-1 + %pos) U: full-set S: full-set
  %idxprom = sext i32 %sub to i64
  -->  (-1 + (sext i32 %pos to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)
  %arrayidx = getelementptr inbounds i32, i32* %path, i64 %idxprom
  -->  (-4 + (4 * (sext i32 %pos to i64))<nsw> + %path) U: full-set S: full-set
  %0 = load i32, i32* %arrayidx, align 4
  -->  %0 U: full-set S: full-set
  %idxprom1 = sext i32 %0 to i64
  -->  (sext i32 %0 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx2 = getelementptr inbounds [5 x i8], [5 x i8]* %graph, i64 %idxprom1
  -->  ((5 * (sext i32 %0 to i64))<nsw> + %graph)<nsw> U: full-set S: full-set
  %idxprom3 = sext i32 %v to i64
  -->  (sext i32 %v to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx4 = getelementptr inbounds [5 x i8], [5 x i8]* %arrayidx2, i64 0, i64 %idxprom3
  -->  ((sext i32 %v to i64) + (5 * (sext i32 %0 to i64))<nsw> + %graph) U: full-set S: full-set
  %1 = load i8, i8* %arrayidx4, align 1
  -->  %1 U: full-set S: full-set
  %tobool = trunc i8 %1 to i1
  -->  (trunc i8 %1 to i1) U: full-set S: full-set
  %conv = zext i1 %tobool to i32
  -->  (zext i1 (trunc i8 %1 to i1) to i32) U: [0,2) S: [0,2)
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,-2147483648) S: [0,-2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %idxprom6 = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,2147483648) S: [0,2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %arrayidx7 = getelementptr inbounds i32, i32* %path, i64 %idxprom6
  -->  {%path,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %2 = load i32, i32* %arrayidx7, align 4
  -->  %2 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><%for.cond> U: [1,-2147483647) S: [1,-2147483647)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %retval.0 = phi i1 [ false, %if.then ], [ false, %if.then9 ], [ true, %for.end ]
  -->  %retval.0 U: full-set S: full-set
Determining loop execution counts for: @_Z6isSafeiPA5_bPii
Loop %for.cond: <multiple exits> Unpredictable backedge-taken count.
  exit count for for.cond: (0 smax %pos)
  exit count for for.body: ***COULDNOTCOMPUTE***
Loop %for.cond: max backedge-taken count is 2147483647
Loop %for.cond: Unpredictable predicated backedge-taken count. 
Printing analysis 'Scalar Evolution Analysis' for function '_Z12hamCycleUtilPA5_bPii':
Classifying expressions for: @_Z12hamCycleUtilPA5_bPii
  %sub = sub nsw i32 %pos, 1
  -->  (-1 + %pos) U: full-set S: full-set
  %idxprom = sext i32 %sub to i64
  -->  (-1 + (sext i32 %pos to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)
  %arrayidx = getelementptr inbounds i32, i32* %path, i64 %idxprom
  -->  (-4 + (4 * (sext i32 %pos to i64))<nsw> + %path) U: full-set S: full-set
  %0 = load i32, i32* %arrayidx, align 4
  -->  %0 U: full-set S: full-set
  %idxprom1 = sext i32 %0 to i64
  -->  (sext i32 %0 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx2 = getelementptr inbounds [5 x i8], [5 x i8]* %graph, i64 %idxprom1
  -->  ((5 * (sext i32 %0 to i64))<nsw> + %graph)<nsw> U: full-set S: full-set
  %arrayidx3 = getelementptr inbounds i32, i32* %path, i64 0
  -->  %path U: full-set S: full-set
  %1 = load i32, i32* %arrayidx3, align 4
  -->  %1 U: full-set S: full-set
  %idxprom4 = sext i32 %1 to i64
  -->  (sext i32 %1 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx5 = getelementptr inbounds [5 x i8], [5 x i8]* %arrayidx2, i64 0, i64 %idxprom4
  -->  ((sext i32 %1 to i64) + (5 * (sext i32 %0 to i64))<nsw> + %graph) U: full-set S: full-set
  %2 = load i8, i8* %arrayidx5, align 1
  -->  %2 U: full-set S: full-set
  %tobool = trunc i8 %2 to i1
  -->  (trunc i8 %2 to i1) U: full-set S: full-set
  %conv = zext i1 %tobool to i32
  -->  (zext i1 (trunc i8 %2 to i1) to i32) U: [0,2) S: [0,2)
  %v.0 = phi i32 [ 1, %if.end ], [ %inc, %for.inc ]
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,6) S: [1,6)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %call = call zeroext i1 @_Z6isSafeiPA5_bPii(i32 %v.0, [5 x i8]* %graph, i32* %path, i32 %pos)
  -->  %call U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom10 = sext i32 %pos to i64
  -->  (sext i32 %pos to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: (sext i32 %pos to i64)		LoopDispositions: { %for.cond: Invariant }
  %arrayidx11 = getelementptr inbounds i32, i32* %path, i64 %idxprom10
  -->  ((4 * (sext i32 %pos to i64))<nsw> + %path)<nsw> U: full-set S: full-set		Exits: ((4 * (sext i32 %pos to i64))<nsw> + %path)<nsw>		LoopDispositions: { %for.cond: Invariant }
  %add = add nsw i32 %pos, 1
  -->  (1 + %pos) U: full-set S: full-set		Exits: (1 + %pos)		LoopDispositions: { %for.cond: Invariant }
  %call12 = call zeroext i1 @_Z12hamCycleUtilPA5_bPii([5 x i8]* %graph, i32* %path, i32 %add)
  -->  %call12 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %conv13 = zext i1 %call12 to i32
  -->  (zext i1 %call12 to i32) U: [0,2) S: [0,2)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom17 = sext i32 %pos to i64
  -->  (sext i32 %pos to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: (sext i32 %pos to i64)		LoopDispositions: { %for.cond: Invariant }
  %arrayidx18 = getelementptr inbounds i32, i32* %path, i64 %idxprom17
  -->  ((4 * (sext i32 %pos to i64))<nsw> + %path)<nsw> U: full-set S: full-set		Exits: ((4 * (sext i32 %pos to i64))<nsw> + %path)<nsw>		LoopDispositions: { %for.cond: Invariant }
  %inc = add nsw i32 %v.0, 1
  -->  {2,+,1}<nuw><nsw><%for.cond> U: [2,7) S: [2,7)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %retval.0 = phi i1 [ true, %if.then7 ], [ false, %if.else ], [ true, %if.then15 ], [ false, %for.end ]
  -->  %retval.0 U: full-set S: full-set
Determining loop execution counts for: @_Z12hamCycleUtilPA5_bPii
Loop %for.cond: <multiple exits> Unpredictable backedge-taken count.
  exit count for for.cond: 4
  exit count for if.then9: ***COULDNOTCOMPUTE***
Loop %for.cond: max backedge-taken count is 4
Loop %for.cond: Unpredictable predicated backedge-taken count. 
Printing analysis 'Scalar Evolution Analysis' for function '_Z8hamCyclePA5_b':
Classifying expressions for: @_Z8hamCyclePA5_b
  %call = call i8* @_Znam(i64 20) #8
  -->  %call U: full-set S: full-set
  %0 = bitcast i8* %call to i32*
  -->  %call U: full-set S: full-set
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,6) S: [0,6)		Exits: 5		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,6) S: [0,6)		Exits: 5		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom
  -->  {%call,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: (20 + %call)		LoopDispositions: { %for.cond: Computable }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,7) S: [1,7)		Exits: 6		LoopDispositions: { %for.cond: Computable }
  %arrayidx1 = getelementptr inbounds i32, i32* %0, i64 0
  -->  %call U: full-set S: full-set
  %call2 = call zeroext i1 @_Z12hamCycleUtilPA5_bPii([5 x i8]* %graph, i32* %0, i32 1)
  -->  %call2 U: full-set S: full-set
  %conv = zext i1 %call2 to i32
  -->  (zext i1 %call2 to i32) U: [0,2) S: [0,2)
  %call4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0))
  -->  %call4 U: full-set S: full-set
  %retval.0 = phi i1 [ false, %if.then ], [ true, %if.end ]
  -->  %retval.0 U: full-set S: full-set
Determining loop execution counts for: @_Z8hamCyclePA5_b
Loop %for.cond: backedge-taken count is 5
Loop %for.cond: max backedge-taken count is 5
Loop %for.cond: Predicated backedge-taken count is 5
 Predicates:

Loop %for.cond: Trip multiple is 6
Printing analysis 'Scalar Evolution Analysis' for function '_Z13printSolutionPi':
Classifying expressions for: @_Z13printSolutionPi
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.1, i64 0, i64 0))
  -->  %call U: full-set S: full-set
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,6) S: [0,6)		Exits: 5		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,6) S: [0,6)		Exits: 5		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds i32, i32* %path, i64 %idxprom
  -->  {%path,+,4}<nsw><%for.cond> U: full-set S: full-set		Exits: (20 + %path)		LoopDispositions: { %for.cond: Computable }
  %0 = load i32, i32* %arrayidx, align 4
  -->  %0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call1 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %0)
  -->  %call1 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  -->  %call2 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,7) S: [1,7)		Exits: 6		LoopDispositions: { %for.cond: Computable }
  %arrayidx3 = getelementptr inbounds i32, i32* %path, i64 0
  -->  %path U: full-set S: full-set
  %1 = load i32, i32* %arrayidx3, align 4
  -->  %1 U: full-set S: full-set
  %call4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %1)
  -->  %call4 U: full-set S: full-set
  %call5 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  -->  %call5 U: full-set S: full-set
  %call6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  -->  %call6 U: full-set S: full-set
Determining loop execution counts for: @_Z13printSolutionPi
Loop %for.cond: backedge-taken count is 5
Loop %for.cond: max backedge-taken count is 5
Loop %for.cond: Predicated backedge-taken count is 5
 Predicates:

Loop %for.cond: Trip multiple is 6
Printing analysis 'Scalar Evolution Analysis' for function 'main':
Classifying expressions for: @main
  %graph1 = alloca [5 x [5 x i8]], align 16
  -->  %graph1 U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %graph2 = alloca [5 x [5 x i8]], align 16
  -->  %graph2 U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %0 = bitcast [5 x [5 x i8]]* %graph1 to i8*
  -->  %graph1 U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %arraydecay = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* %graph1, i64 0, i64 0
  -->  %graph1 U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %call = call zeroext i1 @_Z8hamCyclePA5_b([5 x i8]* %arraydecay)
  -->  %call U: full-set S: full-set
  %1 = bitcast [5 x [5 x i8]]* %graph2 to i8*
  -->  %graph2 U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %arraydecay1 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* %graph2, i64 0, i64 0
  -->  %graph2 U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %call2 = call zeroext i1 @_Z8hamCyclePA5_b([5 x i8]* %arraydecay1)
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @main
Printing analysis 'Scalar Evolution Analysis' for function '_GLOBAL__sub_I_hamiltonian_cycle_backtracking.cpp':
Classifying expressions for: @_GLOBAL__sub_I_hamiltonian_cycle_backtracking.cpp
Determining loop execution counts for: @_GLOBAL__sub_I_hamiltonian_cycle_backtracking.cpp
