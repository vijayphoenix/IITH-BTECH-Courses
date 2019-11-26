Printing analysis 'Scalar Evolution Analysis' for function '__cxx_global_var_init':
Classifying expressions for: @__cxx_global_var_init
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  -->  %0 U: full-set S: full-set
Determining loop execution counts for: @__cxx_global_var_init
Printing analysis 'Scalar Evolution Analysis' for function '_Z16MatrixChainOrderPii':
Classifying expressions for: @_Z16MatrixChainOrderPii
  %0 = zext i32 %n to i64
  -->  (zext i32 %n to i64) U: [0,4294967296) S: [0,4294967296)
  %1 = zext i32 %n to i64
  -->  (zext i32 %n to i64) U: [0,4294967296) S: [0,4294967296)
  %2 = call i8* @llvm.stacksave()
  -->  %2 U: full-set S: full-set
  %3 = mul nuw i64 %0, %1
  -->  ((zext i32 %n to i64) * (zext i32 %n to i64)) U: [0,-8589934590) S: [0,-8589934590)
  %vla = alloca i32, i64 %3, align 16
  -->  %vla U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,-2147483648) S: [1,-2147483648)		Exits: (1 smax %n)		LoopDispositions: { %for.cond: Computable }
  %idxprom = sext i32 %i.0 to i64
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,2147483648) S: [1,2147483648)		Exits: (1 + (zext i32 (-1 + (1 smax %n))<nsw> to i64))<nuw><nsw>		LoopDispositions: { %for.cond: Computable }
  %4 = mul nsw i64 %idxprom, %1
  -->  {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond> U: [0,9223372030412324866) S: [0,9223372030412324866)		Exits: ((zext i32 %n to i64) * (1 + (zext i32 (-1 + (1 smax %n))<nsw> to i64))<nuw><nsw>)		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds i32, i32* %vla, i64 %4
  -->  {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: (((zext i32 %n to i64) * (4 + (4 * (zext i32 (-1 + (1 smax %n))<nsw> to i64))<nuw><nsw>)<nuw><nsw>) + %vla)		LoopDispositions: { %for.cond: Computable }
  %idxprom1 = sext i32 %i.0 to i64
  -->  {1,+,1}<nuw><nsw><%for.cond> U: [1,2147483648) S: [1,2147483648)		Exits: (1 + (zext i32 (-1 + (1 smax %n))<nsw> to i64))<nuw><nsw>		LoopDispositions: { %for.cond: Computable }
  %arrayidx2 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom1
  -->  {(4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 + (4 * (zext i32 %n to i64))<nuw><nsw>)<nuw><nsw>}<%for.cond> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: (4 + (4 * (zext i32 %n to i64))<nuw><nsw> + ((zext i32 (-1 + (1 smax %n))<nsw> to i64) * (4 + (4 * (zext i32 %n to i64))<nuw><nsw>)<nuw><nsw>) + %vla)		LoopDispositions: { %for.cond: Computable }
  %inc = add nsw i32 %i.0, 1
  -->  {2,+,1}<nuw><%for.cond> U: [2,-2147483647) S: [2,-2147483647)		Exits: (1 + (1 smax %n))		LoopDispositions: { %for.cond: Computable }
  %L.0 = phi i32 [ 2, %for.end ], [ %inc54, %for.inc53 ]
  -->  {2,+,1}<nuw><nsw><%for.cond3> U: [2,-2147483648) S: [2,-2147483648)		Exits: (2 smax %n)		LoopDispositions: { %for.cond3: Computable, %for.cond6: Invariant, %for.cond15: Invariant }
  %i.1 = phi i32 [ 1, %for.body5 ], [ %inc51, %for.inc50 ]
  -->  {1,+,1}<nuw><nsw><%for.cond6> U: [1,-2147483648) S: [1,-2147483648)		Exits: (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>)		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %sub = sub nsw i32 %n, %L.0
  -->  {(-2 + %n),+,-1}<nw><%for.cond3> U: full-set S: full-set		Exits: {(-2 + %n),+,-1}<nw><%for.cond3>		LoopDispositions: { %for.cond6: Invariant, %for.cond3: Computable, %for.cond15: Invariant }
  %add = add nsw i32 %sub, 1
  -->  {(-1 + %n),+,-1}<nw><%for.cond3> U: full-set S: full-set		Exits: {(-1 + %n),+,-1}<nw><%for.cond3>		LoopDispositions: { %for.cond6: Invariant, %for.cond3: Computable, %for.cond15: Invariant }
  %add9 = add nsw i32 %i.1, %L.0
  -->  {{3,+,1}<nuw><%for.cond3>,+,1}<nw><%for.cond6> U: [3,-1) S: [3,-1)		Exits: ({2,+,1}<nuw><nsw><%for.cond3> + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %sub10 = sub nsw i32 %add9, 1
  -->  {{2,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6> U: [2,-2) S: [2,-2)		Exits: ({1,+,1}<nw><%for.cond3> + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %idxprom11 = sext i32 %i.1 to i64
  -->  {1,+,1}<nuw><nsw><%for.cond6> U: [1,2147483648) S: [1,2147483648)		Exits: (1 + (zext i32 (-1 + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))<nsw> to i64))<nuw><nsw>		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %5 = mul nsw i64 %idxprom11, %1
  -->  {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond6> U: [0,9223372030412324866) S: [0,9223372030412324866)		Exits: ((zext i32 %n to i64) * (1 + (zext i32 (-1 + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))<nsw> to i64))<nuw><nsw>)		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %arrayidx12 = getelementptr inbounds i32, i32* %vla, i64 %5
  -->  {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: (((zext i32 %n to i64) * (4 + (4 * (zext i32 (-1 + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))<nsw> to i64))<nuw><nsw>)<nuw><nsw>) + %vla)		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %idxprom13 = sext i32 %sub10 to i64
  -->  (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)		Exits: (-1 + (sext i32 ({2,+,1}<nuw><nsw><%for.cond3> + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>)) to i64))<nsw>		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %arrayidx14 = getelementptr inbounds i32, i32* %arrayidx12, i64 %idxprom13
  -->  ((4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + {(-4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>) U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: (-4 + (4 * (sext i32 ({2,+,1}<nuw><nsw><%for.cond3> + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>)) to i64))<nsw> + ((zext i32 %n to i64) * (4 + (4 * (zext i32 (-1 + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))<nsw> to i64))<nuw><nsw>)<nuw><nsw>) + %vla)		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %k.0 = phi i32 [ %i.1, %for.body8 ], [ %inc48, %for.inc47 ]
  -->  {{1,+,1}<nuw><nsw><%for.cond6>,+,1}<nuw><nsw><%for.cond15> U: [1,-2147483648) S: [1,-2147483648)		Exits: (1 + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))<nuw>		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %sub16 = sub nsw i32 %sub10, 1
  -->  {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6> U: [1,-3) S: [1,-3)		Exits: {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %idxprom19 = sext i32 %i.1 to i64
  -->  {1,+,1}<nuw><nsw><%for.cond6> U: [1,2147483648) S: [1,2147483648)		Exits: {1,+,1}<nuw><nsw><%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %6 = mul nsw i64 %idxprom19, %1
  -->  {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond6> U: [0,9223372030412324866) S: [0,9223372030412324866)		Exits: {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx20 = getelementptr inbounds i32, i32* %vla, i64 %6
  -->  {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %idxprom21 = sext i32 %k.0 to i64
  -->  {{1,+,1}<nuw><nsw><%for.cond6>,+,1}<nuw><nsw><%for.cond15> U: [1,4294967295) S: [1,4294967295)		Exits: ((zext i32 ({0,+,-1}<nw><%for.cond6> + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>)) to i64) + {1,+,1}<nuw><nsw><%for.cond6>)		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %arrayidx22 = getelementptr inbounds i32, i32* %arrayidx20, i64 %idxprom21
  -->  {{(4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 + (4 * (zext i32 %n to i64))<nuw><nsw>)<nuw><nsw>}<%for.cond6>,+,4}<nsw><%for.cond15> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: ((4 * (zext i32 ({0,+,-1}<nw><%for.cond6> + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>)) to i64))<nuw><nsw> + {(4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 + (4 * (zext i32 %n to i64))<nuw><nsw>)<nuw><nsw>}<%for.cond6>)		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %7 = load i32, i32* %arrayidx22, align 4
  -->  %7 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %add23 = add nsw i32 %k.0, 1
  -->  {{2,+,1}<nuw><%for.cond6>,+,1}<nuw><%for.cond15> U: [2,0) S: [2,0)		Exits: (2 + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))<nuw>		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %idxprom24 = sext i32 %add23 to i64
  -->  (sext i32 {{2,+,1}<nuw><%for.cond6>,+,1}<nuw><%for.cond15> to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: (sext i32 (2 + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))<nuw> to i64)		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %8 = mul nsw i64 %idxprom24, %1
  -->  ((zext i32 %n to i64) * (sext i32 {{2,+,1}<nuw><%for.cond6>,+,1}<nuw><%for.cond15> to i64)) U: [-9223372034707292160,9223372030412324866) S: [-9223372034707292160,9223372030412324866)		Exits: ((zext i32 %n to i64) * (sext i32 (2 + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))<nuw> to i64))		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %arrayidx25 = getelementptr inbounds i32, i32* %vla, i64 %8
  -->  ((4 * (zext i32 %n to i64) * (sext i32 {{2,+,1}<nuw><%for.cond6>,+,1}<nuw><%for.cond15> to i64)) + %vla)<nsw> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: ((4 * (zext i32 %n to i64) * (sext i32 (2 + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))<nuw> to i64)) + %vla)<nsw>		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %idxprom26 = sext i32 %sub10 to i64
  -->  (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)		Exits: (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx27 = getelementptr inbounds i32, i32* %arrayidx25, i64 %idxprom26
  -->  (-4 + (4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + (4 * (zext i32 %n to i64) * (sext i32 {{2,+,1}<nuw><%for.cond6>,+,1}<nuw><%for.cond15> to i64)) + %vla) U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: (-4 + (4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + (4 * (zext i32 %n to i64) * (sext i32 (2 + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))<nuw> to i64)) + %vla)		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %9 = load i32, i32* %arrayidx27, align 4
  -->  %9 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %add28 = add nsw i32 %7, %9
  -->  (%9 + %7) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %sub29 = sub nsw i32 %i.1, 1
  -->  {0,+,1}<nuw><nsw><%for.cond6> U: [0,2147483647) S: [0,2147483647)		Exits: {0,+,1}<nuw><nsw><%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %idxprom30 = sext i32 %sub29 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond6> U: [0,2147483647) S: [0,2147483647)		Exits: {0,+,1}<nuw><nsw><%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx31 = getelementptr inbounds i32, i32* %p, i64 %idxprom30
  -->  {%p,+,4}<nsw><%for.cond6> U: full-set S: full-set		Exits: {%p,+,4}<nsw><%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %10 = load i32, i32* %arrayidx31, align 4
  -->  %10 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %idxprom32 = sext i32 %k.0 to i64
  -->  {{1,+,1}<nuw><nsw><%for.cond6>,+,1}<nuw><nsw><%for.cond15> U: [1,4294967295) S: [1,4294967295)		Exits: ((zext i32 ({0,+,-1}<nw><%for.cond6> + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>)) to i64) + {1,+,1}<nuw><nsw><%for.cond6>)		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %arrayidx33 = getelementptr inbounds i32, i32* %p, i64 %idxprom32
  -->  {{(4 + %p)<nsw>,+,4}<nsw><%for.cond6>,+,4}<nsw><%for.cond15> U: full-set S: full-set		Exits: ((4 * (zext i32 ({0,+,-1}<nw><%for.cond6> + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>)) to i64))<nuw><nsw> + {(4 + %p)<nsw>,+,4}<nsw><%for.cond6>)		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %11 = load i32, i32* %arrayidx33, align 4
  -->  %11 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %mul = mul nsw i32 %10, %11
  -->  (%11 * %10) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %idxprom34 = sext i32 %sub10 to i64
  -->  (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)		Exits: (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx35 = getelementptr inbounds i32, i32* %p, i64 %idxprom34
  -->  (-4 + (4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + %p) U: full-set S: full-set		Exits: (-4 + (4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + %p)		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %12 = load i32, i32* %arrayidx35, align 4
  -->  %12 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %mul36 = mul nsw i32 %mul, %12
  -->  (%12 * %11 * %10) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %add37 = add nsw i32 %add28, %mul36
  -->  ((%12 * %11 * %10) + %9 + %7) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %idxprom38 = sext i32 %i.1 to i64
  -->  {1,+,1}<nuw><nsw><%for.cond6> U: [1,2147483648) S: [1,2147483648)		Exits: {1,+,1}<nuw><nsw><%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %13 = mul nsw i64 %idxprom38, %1
  -->  {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond6> U: [0,9223372030412324866) S: [0,9223372030412324866)		Exits: {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx39 = getelementptr inbounds i32, i32* %vla, i64 %13
  -->  {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %idxprom40 = sext i32 %sub10 to i64
  -->  (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)		Exits: (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx41 = getelementptr inbounds i32, i32* %arrayidx39, i64 %idxprom40
  -->  ((4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + {(-4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>) U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: ((4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + {(-4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>)		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %14 = load i32, i32* %arrayidx41, align 4
  -->  %14 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond15: Variant, %for.cond6: Variant, %for.cond3: Variant }
  %idxprom43 = sext i32 %i.1 to i64
  -->  {1,+,1}<nuw><nsw><%for.cond6> U: [1,2147483648) S: [1,2147483648)		Exits: {1,+,1}<nuw><nsw><%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %15 = mul nsw i64 %idxprom43, %1
  -->  {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond6> U: [0,9223372030412324866) S: [0,9223372030412324866)		Exits: {(zext i32 %n to i64),+,(zext i32 %n to i64)}<%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx44 = getelementptr inbounds i32, i32* %vla, i64 %15
  -->  {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6> U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: {((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw>,+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %idxprom45 = sext i32 %sub10 to i64
  -->  (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)		Exits: (-1 + (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw>		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %arrayidx46 = getelementptr inbounds i32, i32* %arrayidx44, i64 %idxprom45
  -->  ((4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + {(-4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>) U: [0,-3) S: [-9223372036854775808,9223372036854775805)		Exits: ((4 * (sext i32 {{3,+,1}<nuw><%for.cond3>,+,1}<nuw><%for.cond6> to i64))<nsw> + {(-4 + (4 * (zext i32 %n to i64))<nuw><nsw> + %vla),+,(4 * (zext i32 %n to i64))<nuw><nsw>}<%for.cond6>)		LoopDispositions: { %for.cond15: Invariant, %for.cond6: Computable, %for.cond3: Variant }
  %inc48 = add nsw i32 %k.0, 1
  -->  {{2,+,1}<nuw><%for.cond6>,+,1}<nuw><%for.cond15> U: [2,0) S: [2,0)		Exits: (2 + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))<nuw>		LoopDispositions: { %for.cond15: Computable, %for.cond6: Variant, %for.cond3: Variant }
  %inc51 = add nsw i32 %i.1, 1
  -->  {2,+,1}<nuw><%for.cond6> U: [2,-2147483647) S: [2,-2147483647)		Exits: (1 + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))		LoopDispositions: { %for.cond6: Computable, %for.cond3: Variant, %for.cond15: Invariant }
  %inc54 = add nsw i32 %L.0, 1
  -->  {3,+,1}<nuw><%for.cond3> U: [3,-2147483647) S: [3,-2147483647)		Exits: (1 + (2 smax %n))		LoopDispositions: { %for.cond3: Computable, %for.cond6: Invariant, %for.cond15: Invariant }
  %16 = mul nsw i64 1, %1
  -->  (zext i32 %n to i64) U: [0,4294967296) S: [0,4294967296)
  %arrayidx56 = getelementptr inbounds i32, i32* %vla, i64 %16
  -->  ((4 * (zext i32 %n to i64))<nuw><nsw> + %vla)<nsw> U: [0,-3) S: [-9223372036854775808,9223372036854775805)
  %sub57 = sub nsw i32 %n, 1
  -->  (-1 + %n) U: full-set S: full-set
  %idxprom58 = sext i32 %sub57 to i64
  -->  (-1 + (sext i32 %n to i64))<nsw> U: [-2147483649,2147483647) S: [-2147483649,2147483647)
  %arrayidx59 = getelementptr inbounds i32, i32* %arrayidx56, i64 %idxprom58
  -->  (-4 + (4 * (zext i32 %n to i64))<nuw><nsw> + (4 * (sext i32 %n to i64))<nsw> + %vla) U: [0,-3) S: [-9223372036854775808,9223372036854775805)
  %17 = load i32, i32* %arrayidx59, align 4
  -->  %17 U: full-set S: full-set
Determining loop execution counts for: @_Z16MatrixChainOrderPii
Loop %for.cond15: backedge-taken count is ({0,+,-1}<nw><%for.cond6> + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))
Loop %for.cond15: max backedge-taken count is 2147483647
Loop %for.cond15: Predicated backedge-taken count is ({0,+,-1}<nw><%for.cond6> + ({0,+,1}<nuw><nsw><%for.cond6> smax {{1,+,1}<nuw><nsw><%for.cond3>,+,1}<nw><%for.cond6>))
 Predicates:

Loop %for.cond15: Trip multiple is 1
Loop %for.cond6: backedge-taken count is (-1 + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))<nsw>
Loop %for.cond6: max backedge-taken count is 2147483646
Loop %for.cond6: Predicated backedge-taken count is (-1 + (1 smax {(-1 + %n),+,-1}<nw><%for.cond3>))<nsw>
 Predicates:

Loop %for.cond6: Trip multiple is 1
Loop %for.cond3: backedge-taken count is (-2 + (2 smax %n))<nsw>
Loop %for.cond3: max backedge-taken count is 2147483645
Loop %for.cond3: Predicated backedge-taken count is (-2 + (2 smax %n))<nsw>
 Predicates:

Loop %for.cond3: Trip multiple is 1
Loop %for.cond: backedge-taken count is (-1 + (1 smax %n))<nsw>
Loop %for.cond: max backedge-taken count is 2147483646
Loop %for.cond: Predicated backedge-taken count is (-1 + (1 smax %n))<nsw>
 Predicates:

Loop %for.cond: Trip multiple is 1
Printing analysis 'Scalar Evolution Analysis' for function 'main':
Classifying expressions for: @main
  %arr = alloca [4 x i32], align 16
  -->  %arr U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %0 = bitcast [4 x i32]* %arr to i8*
  -->  %arr U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0))
  -->  %call U: full-set S: full-set
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %arr, i64 0, i64 0
  -->  %arr U: [0,-15) S: [-9223372036854775808,9223372036854775793)
  %call1 = call i32 @_Z16MatrixChainOrderPii(i32* %arraydecay, i32 4)
  -->  %call1 U: full-set S: full-set
  %call2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call, i32 %call1)
  -->  %call2 U: full-set S: full-set
  %call3 = call i32 @getchar()
  -->  %call3 U: full-set S: full-set
Determining loop execution counts for: @main
Printing analysis 'Scalar Evolution Analysis' for function '_GLOBAL__sub_I_matrix_chain_multiplication.cpp':
Classifying expressions for: @_GLOBAL__sub_I_matrix_chain_multiplication.cpp
Determining loop execution counts for: @_GLOBAL__sub_I_matrix_chain_multiplication.cpp
