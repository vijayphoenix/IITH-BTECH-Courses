Printing analysis 'Scalar Evolution Analysis' for function '__cxx_global_var_init':
Classifying expressions for: @__cxx_global_var_init
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  -->  %0 U: full-set S: full-set
Determining loop execution counts for: @__cxx_global_var_init
Printing analysis 'Scalar Evolution Analysis' for function '_ZN5GraphC2Ei':
Classifying expressions for: @_ZN5GraphC2Ei
  %V2 = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %conv = sext i32 %V to i64
  -->  (sext i32 %V to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %1 = extractvalue { i64, i1 } %0, 1
  -->  %1 U: full-set S: full-set
  %2 = extractvalue { i64, i1 } %0, 0
  -->  (24 * (sext i32 %V to i64))<nsw> U: [0,-7) S: [-51539607552,51539607529)
  %4 = extractvalue { i64, i1 } %3, 1
  -->  %4 U: full-set S: full-set
  %5 = or i1 %1, %4
  -->  %5 U: full-set S: full-set
  %6 = extractvalue { i64, i1 } %3, 0
  -->  (8 + (24 * (sext i32 %V to i64))<nsw>)<nsw> U: [0,-7) S: [-51539607544,51539607537)
  %7 = select i1 %5, i64 -1, i64 %6
  -->  %7 U: full-set S: full-set
  %call = call i8* @_Znam(i64 %7) #12
  -->  %call U: full-set S: full-set
  %8 = bitcast i8* %call to i64*
  -->  %call U: full-set S: full-set
  %9 = getelementptr inbounds i8, i8* %call, i64 8
  -->  (8 + %call)<nsw> U: full-set S: full-set
  %10 = bitcast i8* %9 to %"class.std::__cxx11::list"*
  -->  (8 + %call)<nsw> U: full-set S: full-set
  %arrayctor.end = getelementptr inbounds %"class.std::__cxx11::list", %"class.std::__cxx11::list"* %10, i64 %conv
  -->  (8 + (24 * (sext i32 %V to i64))<nsw> + %call) U: full-set S: full-set
  %arrayctor.cur = phi %"class.std::__cxx11::list"* [ %10, %new.ctorloop ], [ %arrayctor.next, %arrayctor.loop ]
  -->  {(8 + %call)<nsw>,+,24}<nuw><%arrayctor.loop> U: full-set S: full-set		Exits: (8 + (24 * ((-8 + (8 * (sext i32 %V to i64)))<nsw> /u 8)) + %call)		LoopDispositions: { %arrayctor.loop: Computable }
  %arrayctor.next = getelementptr inbounds %"class.std::__cxx11::list", %"class.std::__cxx11::list"* %arrayctor.cur, i64 1
  -->  {(32 + %call),+,24}<nw><%arrayctor.loop> U: full-set S: full-set		Exits: (32 + (24 * ((-8 + (8 * (sext i32 %V to i64)))<nsw> /u 8)) + %call)		LoopDispositions: { %arrayctor.loop: Computable }
  %adj = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZN5GraphC2Ei
Loop %arrayctor.loop: backedge-taken count is ((-8 + (8 * (sext i32 %V to i64)))<nsw> /u 8)
Loop %arrayctor.loop: max backedge-taken count is 2305843009213693951
Loop %arrayctor.loop: Predicated backedge-taken count is ((-8 + (8 * (sext i32 %V to i64)))<nsw> /u 8)
 Predicates:

Loop %arrayctor.loop: Trip multiple is 1
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx114listIiSaIiEEC2Ev':
Classifying expressions for: @_ZNSt7__cxx114listIiSaIiEEC2Ev
  %0 = bitcast %"class.std::__cxx11::list"* %this to %"class.std::__cxx11::_List_base"*
  -->  %this U: full-set S: full-set
  %2 = extractvalue { i8*, i32 } %1, 0
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx114listIiSaIiEEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZN5Graph7addEdgeEii':
Classifying expressions for: @_ZN5Graph7addEdgeEii
  %w.addr = alloca i32, align 4
  -->  %w.addr U: [0,-3) S: [-9223372036854775808,9223372036854775805)
  %adj = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %0 = load %"class.std::__cxx11::list"*, %"class.std::__cxx11::list"** %adj, align 8
  -->  %0 U: full-set S: full-set
  %idxprom = sext i32 %v to i64
  -->  (sext i32 %v to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx = getelementptr inbounds %"class.std::__cxx11::list", %"class.std::__cxx11::list"* %0, i64 %idxprom
  -->  ((24 * (sext i32 %v to i64))<nsw> + %0)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZN5Graph7addEdgeEii
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx114listIiSaIiEE9push_backERKi':
Classifying expressions for: @_ZNSt7__cxx114listIiSaIiEE9push_backERKi
  %agg.tmp = alloca %"struct.std::_List_iterator", align 8
  -->  %agg.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %call = call %"struct.std::__detail::_List_node_base"* @_ZNSt7__cxx114listIiSaIiEE3endEv(%"class.std::__cxx11::list"* %this) #3
  -->  %call U: full-set S: full-set
  %coerce.dive = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %agg.tmp, i32 0, i32 0
  -->  %agg.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %coerce.dive2 = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %agg.tmp, i32 0, i32 0
  -->  %agg.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %0 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %coerce.dive2, align 8
  -->  %0 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx114listIiSaIiEE9push_backERKi
Printing analysis 'Scalar Evolution Analysis' for function '_ZN5Graph19topologicalSortUtilEiPbRSt5stackIiSt5dequeIiSaIiEEE':
Classifying expressions for: @_ZN5Graph19topologicalSortUtilEiPbRSt5stackIiSt5dequeIiSaIiEEE
  %v.addr = alloca i32, align 4
  -->  %v.addr U: [0,-3) S: [-9223372036854775808,9223372036854775805)
  %i = alloca %"struct.std::_List_iterator", align 8
  -->  %i U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %ref.tmp = alloca %"struct.std::_List_iterator", align 8
  -->  %ref.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %ref.tmp4 = alloca %"struct.std::_List_iterator", align 8
  -->  %ref.tmp4 U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %0 = load i32, i32* %v.addr, align 4
  -->  %0 U: full-set S: full-set
  %idxprom = sext i32 %0 to i64
  -->  (sext i32 %0 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx = getelementptr inbounds i8, i8* %visited, i64 %idxprom
  -->  ((sext i32 %0 to i64) + %visited)<nsw> U: full-set S: full-set
  %adj = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %1 = load %"class.std::__cxx11::list"*, %"class.std::__cxx11::list"** %adj, align 8
  -->  %1 U: full-set S: full-set
  %2 = load i32, i32* %v.addr, align 4
  -->  %2 U: full-set S: full-set
  %idxprom2 = sext i32 %2 to i64
  -->  (sext i32 %2 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %arrayidx3 = getelementptr inbounds %"class.std::__cxx11::list", %"class.std::__cxx11::list"* %1, i64 %idxprom2
  -->  ((24 * (sext i32 %2 to i64))<nsw> + %1)<nsw> U: full-set S: full-set
  %call = call %"struct.std::__detail::_List_node_base"* @_ZNSt7__cxx114listIiSaIiEE5beginEv(%"class.std::__cxx11::list"* %arrayidx3) #3
  -->  %call U: full-set S: full-set
  %coerce.dive = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %ref.tmp, i32 0, i32 0
  -->  %ref.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %3 = bitcast %"struct.std::_List_iterator"* %i to i8*
  -->  %i U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %4 = bitcast %"struct.std::_List_iterator"* %ref.tmp to i8*
  -->  %ref.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %adj5 = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set		Exits: (8 + %this)<nsw>		LoopDispositions: { %for.cond: Invariant }
  %5 = load %"class.std::__cxx11::list"*, %"class.std::__cxx11::list"** %adj5, align 8
  -->  %5 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %6 = load i32, i32* %v.addr, align 4
  -->  %6 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom6 = sext i32 %6 to i64
  -->  (sext i32 %6 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %arrayidx7 = getelementptr inbounds %"class.std::__cxx11::list", %"class.std::__cxx11::list"* %5, i64 %idxprom6
  -->  ((24 * (sext i32 %6 to i64))<nsw> + %5)<nsw> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call8 = call %"struct.std::__detail::_List_node_base"* @_ZNSt7__cxx114listIiSaIiEE3endEv(%"class.std::__cxx11::list"* %arrayidx7) #3
  -->  %call8 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %coerce.dive9 = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %ref.tmp4, i32 0, i32 0
  -->  %ref.tmp4 U: [0,-7) S: [-9223372036854775808,9223372036854775801)		Exits: %ref.tmp4		LoopDispositions: { %for.cond: Invariant }
  %call10 = call zeroext i1 @_ZNKSt14_List_iteratorIiEneERKS0_(%"struct.std::_List_iterator"* %i, %"struct.std::_List_iterator"* dereferenceable(8) %ref.tmp4) #3
  -->  %call10 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call11 = call dereferenceable(4) i32* @_ZNKSt14_List_iteratorIiEdeEv(%"struct.std::_List_iterator"* %i) #3
  -->  %call11 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %7 = load i32, i32* %call11, align 4
  -->  %7 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom12 = sext i32 %7 to i64
  -->  (sext i32 %7 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %arrayidx13 = getelementptr inbounds i8, i8* %visited, i64 %idxprom12
  -->  ((sext i32 %7 to i64) + %visited)<nsw> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %8 = load i8, i8* %arrayidx13, align 1
  -->  %8 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %tobool = trunc i8 %8 to i1
  -->  (trunc i8 %8 to i1) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call14 = call dereferenceable(4) i32* @_ZNKSt14_List_iteratorIiEdeEv(%"struct.std::_List_iterator"* %i) #3
  -->  %call14 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %9 = load i32, i32* %call14, align 4
  -->  %9 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %call15 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIiEppEv(%"struct.std::_List_iterator"* %i) #3
  -->  %call15 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
Determining loop execution counts for: @_ZN5Graph19topologicalSortUtilEiPbRSt5stackIiSt5dequeIiSaIiEEE
Loop %for.cond: Unpredictable backedge-taken count.
Loop %for.cond: Unpredictable max backedge-taken count. 
Loop %for.cond: Unpredictable predicated backedge-taken count. 
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt14_List_iteratorIiEC2Ev':
Classifying expressions for: @_ZNSt14_List_iteratorIiEC2Ev
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt14_List_iteratorIiEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx114listIiSaIiEE5beginEv':
Classifying expressions for: @_ZNSt7__cxx114listIiSaIiEE5beginEv
  %retval = alloca %"struct.std::_List_iterator", align 8
  -->  %retval U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %0 = bitcast %"class.std::__cxx11::list"* %this to %"class.std::__cxx11::_List_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %0, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %1 = bitcast %"struct.std::_List_node"* %_M_node to %"struct.std::__detail::_List_node_base"*
  -->  %this U: full-set S: full-set
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base", %"struct.std::__detail::_List_node_base"* %1, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %2 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %_M_next, align 8
  -->  %2 U: full-set S: full-set
  %coerce.dive = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %retval, i32 0, i32 0
  -->  %retval U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %3 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8
  -->  %3 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx114listIiSaIiEE5beginEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNKSt14_List_iteratorIiEneERKS0_':
Classifying expressions for: @_ZNKSt14_List_iteratorIiEneERKS0_
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %_M_node, align 8
  -->  %0 U: full-set S: full-set
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %__x, i32 0, i32 0
  -->  %__x U: full-set S: full-set
  %1 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %_M_node2, align 8
  -->  %1 U: full-set S: full-set
Determining loop execution counts for: @_ZNKSt14_List_iteratorIiEneERKS0_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx114listIiSaIiEE3endEv':
Classifying expressions for: @_ZNSt7__cxx114listIiSaIiEE3endEv
  %retval = alloca %"struct.std::_List_iterator", align 8
  -->  %retval U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %0 = bitcast %"class.std::__cxx11::list"* %this to %"class.std::__cxx11::_List_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %0, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %1 = bitcast %"struct.std::_List_node"* %_M_node to %"struct.std::__detail::_List_node_base"*
  -->  %this U: full-set S: full-set
  %coerce.dive = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %retval, i32 0, i32 0
  -->  %retval U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %2 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx114listIiSaIiEE3endEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNKSt14_List_iteratorIiEdeEv':
Classifying expressions for: @_ZNKSt14_List_iteratorIiEdeEv
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %_M_node, align 8
  -->  %0 U: full-set S: full-set
  %1 = bitcast %"struct.std::__detail::_List_node_base"* %0 to %"struct.std::_List_node.6"*
  -->  %0 U: full-set S: full-set
  %call = invoke i32* @_ZNSt10_List_nodeIiE9_M_valptrEv(%"struct.std::_List_node.6"* %1)
          to label %invoke.cont unwind label %terminate.lpad
  -->  %call U: full-set S: full-set
  %3 = extractvalue { i8*, i32 } %2, 0
  -->  %3 U: full-set S: full-set
Determining loop execution counts for: @_ZNKSt14_List_iteratorIiEdeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt14_List_iteratorIiEppEv':
Classifying expressions for: @_ZNSt14_List_iteratorIiEppEv
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %_M_node, align 8
  -->  %0 U: full-set S: full-set
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base", %"struct.std::__detail::_List_node_base"* %0, i32 0, i32 0
  -->  %0 U: full-set S: full-set
  %1 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %_M_next, align 8
  -->  %1 U: full-set S: full-set
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt14_List_iteratorIiEppEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5stackIiSt5dequeIiSaIiEEE4pushERKi':
Classifying expressions for: @_ZNSt5stackIiSt5dequeIiSaIiEEE4pushERKi
  %c = getelementptr inbounds %"class.std::stack", %"class.std::stack"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5stackIiSt5dequeIiSaIiEEE4pushERKi
Printing analysis 'Scalar Evolution Analysis' for function '_ZN5Graph15topologicalSortEv':
Classifying expressions for: @_ZN5Graph15topologicalSortEv
  %Stack = alloca %"class.std::stack", align 8
  -->  %Stack U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %V = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = load i32, i32* %V, align 8
  -->  %0 U: full-set S: full-set
  %conv = sext i32 %0 to i64
  -->  (sext i32 %0 to i64) U: [-2147483648,2147483648) S: [-2147483648,2147483648)
  %call = invoke i8* @_Znam(i64 %conv) #12
          to label %invoke.cont unwind label %lpad
  -->  %call U: full-set S: full-set
  %i.0 = phi i32 [ 0, %invoke.cont ], [ %inc, %for.inc ]
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,-2147483648) S: [0,-2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %V2 = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set		Exits: %this		LoopDispositions: { %for.cond: Invariant }
  %1 = load i32, i32* %V2, align 8
  -->  %1 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %idxprom = sext i32 %i.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond> U: [0,2147483648) S: [0,2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %arrayidx = getelementptr inbounds i8, i8* %call, i64 %idxprom
  -->  {%call,+,1}<nsw><%for.cond> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %inc = add nsw i32 %i.0, 1
  -->  {1,+,1}<nuw><%for.cond> U: [1,-2147483647) S: [1,-2147483647)		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %3 = extractvalue { i8*, i32 } %2, 0
  -->  %3 U: full-set S: full-set
  %4 = extractvalue { i8*, i32 } %2, 1
  -->  %4 U: full-set S: full-set
  %i3.0 = phi i32 [ 0, %for.end ], [ %inc14, %for.inc13 ]
  -->  {0,+,1}<nuw><nsw><%for.cond4> U: [0,-2147483648) S: [0,-2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Computable }
  %V5 = getelementptr inbounds %class.Graph, %class.Graph* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set		Exits: %this		LoopDispositions: { %for.cond4: Invariant }
  %5 = load i32, i32* %V5, align 8
  -->  %5 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Variant }
  %idxprom8 = sext i32 %i3.0 to i64
  -->  {0,+,1}<nuw><nsw><%for.cond4> U: [0,2147483648) S: [0,2147483648)		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Computable }
  %arrayidx9 = getelementptr inbounds i8, i8* %call, i64 %idxprom8
  -->  {%call,+,1}<nsw><%for.cond4> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Computable }
  %6 = load i8, i8* %arrayidx9, align 1
  -->  %6 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Variant }
  %tobool = trunc i8 %6 to i1
  -->  (trunc i8 %6 to i1) U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Variant }
  %conv10 = zext i1 %tobool to i32
  -->  (zext i1 (trunc i8 %6 to i1) to i32) U: [0,2) S: [0,2)		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Variant }
  %inc14 = add nsw i32 %i3.0, 1
  -->  {1,+,1}<nuw><%for.cond4> U: [1,-2147483647) S: [1,-2147483647)		Exits: <<Unknown>>		LoopDispositions: { %for.cond4: Computable }
  %call17 = invoke zeroext i1 @_ZNKSt5stackIiSt5dequeIiSaIiEEE5emptyEv(%"class.std::stack"* %Stack)
          to label %invoke.cont16 unwind label %lpad
  -->  %call17 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %while.cond: Variant }
  %conv18 = zext i1 %call17 to i32
  -->  (zext i1 %call17 to i32) U: [0,2) S: [0,2)		Exits: <<Unknown>>		LoopDispositions: { %while.cond: Variant }
  %call21 = invoke dereferenceable(4) i32* @_ZNSt5stackIiSt5dequeIiSaIiEEE3topEv(%"class.std::stack"* %Stack)
          to label %invoke.cont20 unwind label %lpad
  -->  %call21 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %while.cond: Variant }
  %7 = load i32, i32* %call21, align 4
  -->  %7 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %while.cond: Variant }
  %call23 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %7)
          to label %invoke.cont22 unwind label %lpad
  -->  %call23 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %while.cond: Variant }
  %call25 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call23, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
          to label %invoke.cont24 unwind label %lpad
  -->  %call25 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %while.cond: Variant }
Determining loop execution counts for: @_ZN5Graph15topologicalSortEv
Loop %while.cond: <multiple exits> Unpredictable backedge-taken count.
  exit count for while.cond: ***COULDNOTCOMPUTE***
  exit count for invoke.cont16: ***COULDNOTCOMPUTE***
  exit count for while.body: ***COULDNOTCOMPUTE***
  exit count for invoke.cont20: ***COULDNOTCOMPUTE***
  exit count for invoke.cont22: ***COULDNOTCOMPUTE***
  exit count for invoke.cont24: ***COULDNOTCOMPUTE***
Loop %while.cond: Unpredictable max backedge-taken count. 
Loop %while.cond: Unpredictable predicated backedge-taken count. 
Loop %for.cond4: <multiple exits> Unpredictable backedge-taken count.
  exit count for for.cond4: ***COULDNOTCOMPUTE***
  exit count for if.then: ***COULDNOTCOMPUTE***
Loop %for.cond4: max backedge-taken count is 2147483647
Loop %for.cond4: Unpredictable predicated backedge-taken count. 
Loop %for.cond: Unpredictable backedge-taken count.
Loop %for.cond: max backedge-taken count is 2147483647
Loop %for.cond: Unpredictable predicated backedge-taken count. 
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5stackIiSt5dequeIiSaIiEEEC2IS2_vEEv':
Classifying expressions for: @_ZNSt5stackIiSt5dequeIiSaIiEEEC2IS2_vEEv
  %c = getelementptr inbounds %"class.std::stack", %"class.std::stack"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5stackIiSt5dequeIiSaIiEEEC2IS2_vEEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNKSt5stackIiSt5dequeIiSaIiEEE5emptyEv':
Classifying expressions for: @_ZNKSt5stackIiSt5dequeIiSaIiEEE5emptyEv
  %c = getelementptr inbounds %"class.std::stack", %"class.std::stack"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %call = call zeroext i1 @_ZNKSt5dequeIiSaIiEE5emptyEv(%"class.std::deque"* %c) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNKSt5stackIiSt5dequeIiSaIiEEE5emptyEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5stackIiSt5dequeIiSaIiEEE3topEv':
Classifying expressions for: @_ZNSt5stackIiSt5dequeIiSaIiEEE3topEv
  %c = getelementptr inbounds %"class.std::stack", %"class.std::stack"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %call = call dereferenceable(4) i32* @_ZNSt5dequeIiSaIiEE4backEv(%"class.std::deque"* %c) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5stackIiSt5dequeIiSaIiEEE3topEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5stackIiSt5dequeIiSaIiEEE3popEv':
Classifying expressions for: @_ZNSt5stackIiSt5dequeIiSaIiEEE3popEv
  %c = getelementptr inbounds %"class.std::stack", %"class.std::stack"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5stackIiSt5dequeIiSaIiEEE3popEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5stackIiSt5dequeIiSaIiEEED2Ev':
Classifying expressions for: @_ZNSt5stackIiSt5dequeIiSaIiEEED2Ev
  %c = getelementptr inbounds %"class.std::stack", %"class.std::stack"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5stackIiSt5dequeIiSaIiEEED2Ev
Printing analysis 'Scalar Evolution Analysis' for function 'main':
Classifying expressions for: @main
  %g = alloca %class.Graph, align 8
  -->  %g U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.1, i64 0, i64 0))
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @main
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEED2Ev':
Classifying expressions for: @_ZNSt5dequeIiSaIiEED2Ev
  %agg.tmp = alloca %"struct.std::_Deque_iterator", align 8
  -->  %agg.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %agg.tmp2 = alloca %"struct.std::_Deque_iterator", align 8
  -->  %agg.tmp2 U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %call = call dereferenceable(1) %"class.std::allocator.0"* @_ZNSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"class.std::_Deque_base"* %0) #3
  -->  %call U: full-set S: full-set
  %1 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %3 = extractvalue { i8*, i32 } %2, 0
  -->  %3 U: full-set S: full-set
  %4 = extractvalue { i8*, i32 } %2, 1
  -->  %4 U: full-set S: full-set
  %5 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEED2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE15_M_destroy_dataESt15_Deque_iteratorIiRiPiES5_RKS0_':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE15_M_destroy_dataESt15_Deque_iteratorIiRiPiES5_RKS0_
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE15_M_destroy_dataESt15_Deque_iteratorIiRiPiES5_RKS0_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE5beginEv':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE5beginEv
  %0 = bitcast %"struct.std::_Deque_iterator"* %agg.result to i8*
  -->  %agg.result U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %1 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %1, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE5beginEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE3endEv':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE3endEv
  %0 = bitcast %"struct.std::_Deque_iterator"* %agg.result to i8*
  -->  %agg.result U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %1 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %1, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE3endEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEED2Ev':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEED2Ev
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = load i32**, i32*** %_M_map, align 8
  -->  %0 U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start, i32 0, i32 3
  -->  (40 + %this) U: full-set S: full-set
  %1 = load i32**, i32*** %_M_node, align 8
  -->  %1 U: full-set S: full-set
  %_M_impl3 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl3, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node4 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %2 = load i32**, i32*** %_M_node4, align 8
  -->  %2 U: full-set S: full-set
  %add.ptr = getelementptr inbounds i32*, i32** %2, i64 1
  -->  (8 + %2)<nsw> U: full-set S: full-set
  %_M_impl5 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map6 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl5, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %3 = load i32**, i32*** %_M_map6, align 8
  -->  %3 U: full-set S: full-set
  %_M_impl7 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl7, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %4 = load i64, i64* %_M_map_size, align 8
  -->  %4 U: full-set S: full-set
  %_M_impl8 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEED2Ev
Printing analysis 'Scalar Evolution Analysis' for function '__clang_call_terminate':
Classifying expressions for: @__clang_call_terminate
  %2 = call i8* @__cxa_begin_catch(i8* %0) #3
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @__clang_call_terminate
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15_Deque_iteratorIiRiPiEC2ERKS2_':
Classifying expressions for: @_ZNSt15_Deque_iteratorIiRiPiEC2ERKS2_
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_cur2 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %__x, i32 0, i32 0
  -->  %__x U: full-set S: full-set
  %0 = load i32*, i32** %_M_cur2, align 8
  -->  %0 U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %_M_first3 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %__x, i32 0, i32 1
  -->  (8 + %__x)<nsw> U: full-set S: full-set
  %1 = load i32*, i32** %_M_first3, align 8
  -->  %1 U: full-set S: full-set
  %_M_last = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_last4 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %__x, i32 0, i32 2
  -->  (16 + %__x)<nsw> U: full-set S: full-set
  %2 = load i32*, i32** %_M_last4, align 8
  -->  %2 U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 3
  -->  (24 + %this)<nsw> U: full-set S: full-set
  %_M_node5 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %__x, i32 0, i32 3
  -->  (24 + %__x)<nsw> U: full-set S: full-set
  %3 = load i32**, i32*** %_M_node5, align 8
  -->  %3 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15_Deque_iteratorIiRiPiEC2ERKS2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_
  %__n.0 = phi i32** [ %__nstart, %entry ], [ %incdec.ptr, %for.inc ]
  -->  {%__nstart,+,8}<nuw><%for.cond> U: full-set S: full-set		Exits: ((8 * ((7 + (-1 * %__nstart) + (%__nstart umax %__nfinish)) /u 8))<nuw> + %__nstart)		LoopDispositions: { %for.cond: Computable }
  %0 = load i32*, i32** %__n.0, align 8
  -->  %0 U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %incdec.ptr = getelementptr inbounds i32*, i32** %__n.0, i32 1
  -->  {(8 + %__nstart)<nsw>,+,8}<nw><%for.cond> U: full-set S: full-set		Exits: (8 + (8 * ((7 + (-1 * %__nstart) + (%__nstart umax %__nfinish)) /u 8))<nuw> + %__nstart)		LoopDispositions: { %for.cond: Computable }
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_
Loop %for.cond: backedge-taken count is ((7 + (-1 * %__nstart) + (%__nstart umax %__nfinish)) /u 8)
Loop %for.cond: max backedge-taken count is 2305843009213693951
Loop %for.cond: Predicated backedge-taken count is ((7 + (-1 * %__nstart) + (%__nstart umax %__nfinish)) /u 8)
 Predicates:

Loop %for.cond: Trip multiple is 1
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE17_M_deallocate_mapEPPim':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE17_M_deallocate_mapEPPim
  %__map_alloc = alloca %"class.std::allocator.3", align 1
  -->  %__map_alloc U: full-set S: full-set
  %1 = extractvalue { i8*, i32 } %0, 0
  -->  %1 U: full-set S: full-set
  %2 = extractvalue { i8*, i32 } %0, 1
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE17_M_deallocate_mapEPPim
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE11_Deque_implD2Ev':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE11_Deque_implD2Ev
  %0 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %this to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE11_Deque_implD2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE18_M_deallocate_nodeEPi':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE18_M_deallocate_nodeEPi
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
  %call = invoke i64 @_ZSt16__deque_buf_sizem(i64 4)
          to label %invoke.cont unwind label %terminate.lpad
  -->  %call U: full-set S: full-set
  %2 = extractvalue { i8*, i32 } %1, 0
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE18_M_deallocate_nodeEPi
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim':
Classifying expressions for: @_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim
  %0 = bitcast %"class.std::allocator.0"* %__a to %"class.__gnu_cxx::new_allocator.1"*
  -->  %__a U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt16__deque_buf_sizem':
Classifying expressions for: @_ZSt16__deque_buf_sizem
  %div = udiv i64 512, %__size
  -->  (512 /u %__size) U: [0,513) S: [0,513)
  %cond = phi i64 [ %div, %cond.true ], [ 1, %cond.false ]
  -->  %cond U: [0,513) S: [0,513)
Determining loop execution counts for: @_ZSt16__deque_buf_sizem
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim
  %1 = bitcast i32* %__p to i8*
  -->  %__p U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim
Printing analysis 'Scalar Evolution Analysis' for function '_ZNKSt11_Deque_baseIiSaIiEE20_M_get_map_allocatorEv':
Classifying expressions for: @_ZNKSt11_Deque_baseIiSaIiEE20_M_get_map_allocatorEv
  %0 = bitcast %"class.std::allocator.3"* %agg.result to i8*
  -->  %agg.result U: full-set S: full-set
  %call = call dereferenceable(1) %"class.std::allocator.0"* @_ZNKSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"class.std::_Deque_base"* %this) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNKSt11_Deque_baseIiSaIiEE20_M_get_map_allocatorEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaIPiEE10deallocateERS1_PS0_m':
Classifying expressions for: @_ZNSt16allocator_traitsISaIPiEE10deallocateERS1_PS0_m
  %0 = bitcast %"class.std::allocator.3"* %__a to %"class.__gnu_cxx::new_allocator.4"*
  -->  %__a U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaIPiEE10deallocateERS1_PS0_m
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSaIPiED2Ev':
Classifying expressions for: @_ZNSaIPiED2Ev
  %0 = bitcast %"class.std::allocator.3"* %this to %"class.__gnu_cxx::new_allocator.4"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSaIPiED2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNKSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv':
Classifying expressions for: @_ZNKSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNKSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSaIPiEC2IiEERKSaIT_E':
Classifying expressions for: @_ZNSaIPiEC2IiEERKSaIT_E
  %1 = bitcast %"class.std::allocator.3"* %this to %"class.__gnu_cxx::new_allocator.4"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSaIPiEC2IiEERKSaIT_E
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIPiEC2Ev':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIPiEC2Ev
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIPiEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIPiE10deallocateEPS1_m':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIPiE10deallocateEPS1_m
  %1 = bitcast i32** %__p to i8*
  -->  %__p U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIPiE10deallocateEPS1_m
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIPiED2Ev':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIPiED2Ev
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIPiED2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSaIiED2Ev':
Classifying expressions for: @_ZNSaIiED2Ev
  %0 = bitcast %"class.std::allocator.0"* %this to %"class.__gnu_cxx::new_allocator.1"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSaIiED2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIiED2Ev':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIiED2Ev
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIiED2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx1110_List_baseIiSaIiEEC2Ev':
Classifying expressions for: @_ZNSt7__cxx1110_List_baseIiSaIiEEC2Ev
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx1110_List_baseIiSaIiEEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx1110_List_baseIiSaIiEE10_List_implC2Ev':
Classifying expressions for: @_ZNSt7__cxx1110_List_baseIiSaIiEE10_List_implC2Ev
  %0 = bitcast %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %this to %"class.std::allocator"*
  -->  %this U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %1 = bitcast %"struct.std::_List_node"* %_M_node to i8*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx1110_List_baseIiSaIiEE10_List_implC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx1110_List_baseIiSaIiEE7_M_initEv':
Classifying expressions for: @_ZNSt7__cxx1110_List_baseIiSaIiEE7_M_initEv
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast %"struct.std::_List_node"* %_M_node to %"struct.std::__detail::_List_node_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node3 = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl2, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %1 = bitcast %"struct.std::_List_node"* %_M_node3 to %"struct.std::__detail::_List_node_base"*
  -->  %this U: full-set S: full-set
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base", %"struct.std::__detail::_List_node_base"* %1, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_impl4 = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node5 = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl4, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %2 = bitcast %"struct.std::_List_node"* %_M_node5 to %"struct.std::__detail::_List_node_base"*
  -->  %this U: full-set S: full-set
  %_M_impl6 = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node7 = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl6, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %3 = bitcast %"struct.std::_List_node"* %_M_node7 to %"struct.std::__detail::_List_node_base"*
  -->  %this U: full-set S: full-set
  %_M_prev = getelementptr inbounds %"struct.std::__detail::_List_node_base", %"struct.std::__detail::_List_node_base"* %3, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %5 = extractvalue { i8*, i32 } %4, 0
  -->  %5 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx1110_List_baseIiSaIiEE7_M_initEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSaISt10_List_nodeIiEEC2Ev':
Classifying expressions for: @_ZNSaISt10_List_nodeIiEEC2Ev
  %0 = bitcast %"class.std::allocator"* %this to %"class.__gnu_cxx::new_allocator"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSaISt10_List_nodeIiEEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEEC2Ev':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEEC2Ev
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_set_sizeEm':
Classifying expressions for: @_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_set_sizeEm
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %call = call i64* @_ZNSt10_List_nodeImE9_M_valptrEv(%"struct.std::_List_node"* %_M_node)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_set_sizeEm
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt10_List_nodeImE9_M_valptrEv':
Classifying expressions for: @_ZNSt10_List_nodeImE9_M_valptrEv
  %_M_storage = getelementptr inbounds %"struct.std::_List_node", %"struct.std::_List_node"* %this, i32 0, i32 1
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %call = call i64* @_ZN9__gnu_cxx16__aligned_membufImE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf"* %_M_storage) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt10_List_nodeImE9_M_valptrEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx16__aligned_membufImE6_M_ptrEv':
Classifying expressions for: @_ZN9__gnu_cxx16__aligned_membufImE6_M_ptrEv
  %call = call i8* @_ZN9__gnu_cxx16__aligned_membufImE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this) #3
  -->  %call U: full-set S: full-set
  %0 = bitcast i8* %call to i64*
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx16__aligned_membufImE6_M_ptrEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx16__aligned_membufImE7_M_addrEv':
Classifying expressions for: @_ZN9__gnu_cxx16__aligned_membufImE7_M_addrEv
  %_M_storage = getelementptr inbounds %"struct.__gnu_cxx::__aligned_membuf", %"struct.__gnu_cxx::__aligned_membuf"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast [8 x i8]* %_M_storage to i8*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx16__aligned_membufImE7_M_addrEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx114listIiSaIiEE9_M_insertIJRKiEEEvSt14_List_iteratorIiEDpOT_':
Classifying expressions for: @_ZNSt7__cxx114listIiSaIiEE9_M_insertIJRKiEEEvSt14_List_iteratorIiEDpOT_
  %__position = alloca %"struct.std::_List_iterator", align 8
  -->  %__position U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %coerce.dive = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %__position, i32 0, i32 0
  -->  %__position U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %call = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %__args) #3
  -->  %call U: full-set S: full-set
  %call2 = call %"struct.std::_List_node.6"* @_ZNSt7__cxx114listIiSaIiEE14_M_create_nodeIJRKiEEEPSt10_List_nodeIiEDpOT_(%"class.std::__cxx11::list"* %this, i32* dereferenceable(4) %call)
  -->  %call2 U: full-set S: full-set
  %0 = bitcast %"struct.std::_List_node.6"* %call2 to %"struct.std::__detail::_List_node_base"*
  -->  %call2 U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %__position, i32 0, i32 0
  -->  %__position U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %1 = load %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"** %_M_node, align 8
  -->  %1 U: full-set S: full-set
  %2 = bitcast %"class.std::__cxx11::list"* %this to %"class.std::__cxx11::_List_base"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx114listIiSaIiEE9_M_insertIJRKiEEEvSt14_List_iteratorIiEDpOT_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx114listIiSaIiEE14_M_create_nodeIJRKiEEEPSt10_List_nodeIiEDpOT_':
Classifying expressions for: @_ZNSt7__cxx114listIiSaIiEE14_M_create_nodeIJRKiEEEPSt10_List_nodeIiEDpOT_
  %__guard = alloca %"struct.std::__allocated_ptr", align 8
  -->  %__guard U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %0 = bitcast %"class.std::__cxx11::list"* %this to %"class.std::__cxx11::_List_base"*
  -->  %this U: full-set S: full-set
  %call = call %"struct.std::_List_node.6"* @_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_get_nodeEv(%"class.std::__cxx11::_List_base"* %0)
  -->  %call U: full-set S: full-set
  %1 = bitcast %"class.std::__cxx11::list"* %this to %"class.std::__cxx11::_List_base"*
  -->  %this U: full-set S: full-set
  %call2 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt7__cxx1110_List_baseIiSaIiEE21_M_get_Node_allocatorEv(%"class.std::__cxx11::_List_base"* %1) #3
  -->  %call2 U: full-set S: full-set
  %call3 = invoke i32* @_ZNSt10_List_nodeIiE9_M_valptrEv(%"struct.std::_List_node.6"* %call)
          to label %invoke.cont unwind label %lpad
  -->  %call3 U: full-set S: full-set
  %call4 = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %__args) #3
  -->  %call4 U: full-set S: full-set
  %call6 = call dereferenceable(16) %"struct.std::__allocated_ptr"* @_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEEaSEDn(%"struct.std::__allocated_ptr"* %__guard, i8* null) #3
  -->  %call6 U: full-set S: full-set
  %3 = extractvalue { i8*, i32 } %2, 0
  -->  %3 U: full-set S: full-set
  %4 = extractvalue { i8*, i32 } %2, 1
  -->  %4 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx114listIiSaIiEE14_M_create_nodeIJRKiEEEPSt10_List_nodeIiEDpOT_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE':
Classifying expressions for: @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE
Determining loop execution counts for: @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_inc_sizeEm':
Classifying expressions for: @_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_inc_sizeEm
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl", %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %call = call i64* @_ZNSt10_List_nodeImE9_M_valptrEv(%"struct.std::_List_node"* %_M_node)
  -->  %call U: full-set S: full-set
  %0 = load i64, i64* %call, align 8
  -->  %0 U: full-set S: full-set
  %add = add i64 %0, %__n
  -->  (%__n + %0) U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_inc_sizeEm
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_get_nodeEv':
Classifying expressions for: @_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_get_nodeEv
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl to %"class.std::allocator"*
  -->  %this U: full-set S: full-set
  %call = call %"struct.std::_List_node.6"* @_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE8allocateERS2_m(%"class.std::allocator"* dereferenceable(1) %0, i64 1)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx1110_List_baseIiSaIiEE11_M_get_nodeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt7__cxx1110_List_baseIiSaIiEE21_M_get_Node_allocatorEv':
Classifying expressions for: @_ZNSt7__cxx1110_List_baseIiSaIiEE21_M_get_Node_allocatorEv
  %_M_impl = getelementptr inbounds %"class.std::__cxx11::_List_base", %"class.std::__cxx11::_List_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast %"struct.std::__cxx11::_List_base<int, std::allocator<int> >::_List_impl"* %_M_impl to %"class.std::allocator"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt7__cxx1110_List_baseIiSaIiEE21_M_get_Node_allocatorEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEEC2ERS2_PS1_':
Classifying expressions for: @_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEEC2ERS2_PS1_
  %_M_alloc = getelementptr inbounds %"struct.std::__allocated_ptr", %"struct.std::__allocated_ptr"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %call = call %"class.std::allocator"* @_ZSt11__addressofISaISt10_List_nodeIiEEEPT_RS3_(%"class.std::allocator"* dereferenceable(1) %__a) #3
  -->  %call U: full-set S: full-set
  %_M_ptr = getelementptr inbounds %"struct.std::__allocated_ptr", %"struct.std::__allocated_ptr"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEEC2ERS2_PS1_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE9constructIiJRKiEEEvRS2_PT_DpOT0_':
Classifying expressions for: @_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE9constructIiJRKiEEEvRS2_PT_DpOT0_
  %0 = bitcast %"class.std::allocator"* %__a to %"class.__gnu_cxx::new_allocator"*
  -->  %__a U: full-set S: full-set
  %call = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %__args) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE9constructIiJRKiEEEvRS2_PT_DpOT0_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt10_List_nodeIiE9_M_valptrEv':
Classifying expressions for: @_ZNSt10_List_nodeIiE9_M_valptrEv
  %_M_storage = getelementptr inbounds %"struct.std::_List_node.6", %"struct.std::_List_node.6"* %this, i32 0, i32 1
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %call = call i32* @_ZN9__gnu_cxx16__aligned_membufIiE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf.7"* %_M_storage) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt10_List_nodeIiE9_M_valptrEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEEaSEDn':
Classifying expressions for: @_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEEaSEDn
  %_M_ptr = getelementptr inbounds %"struct.std::__allocated_ptr", %"struct.std::__allocated_ptr"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEEaSEDn
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEED2Ev':
Classifying expressions for: @_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEED2Ev
  %_M_ptr = getelementptr inbounds %"struct.std::__allocated_ptr", %"struct.std::__allocated_ptr"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %0 = load %"struct.std::_List_node.6"*, %"struct.std::_List_node.6"** %_M_ptr, align 8
  -->  %0 U: full-set S: full-set
  %_M_alloc = getelementptr inbounds %"struct.std::__allocated_ptr", %"struct.std::__allocated_ptr"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %1 = load %"class.std::allocator"*, %"class.std::allocator"** %_M_alloc, align 8
  -->  %1 U: full-set S: full-set
  %_M_ptr2 = getelementptr inbounds %"struct.std::__allocated_ptr", %"struct.std::__allocated_ptr"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %2 = load %"struct.std::_List_node.6"*, %"struct.std::_List_node.6"** %_M_ptr2, align 8
  -->  %2 U: full-set S: full-set
  %4 = extractvalue { i8*, i32 } %3, 0
  -->  %4 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15__allocated_ptrISaISt10_List_nodeIiEEED2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE8allocateERS2_m':
Classifying expressions for: @_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE8allocateERS2_m
  %0 = bitcast %"class.std::allocator"* %__a to %"class.__gnu_cxx::new_allocator"*
  -->  %__a U: full-set S: full-set
  %call = call %"struct.std::_List_node.6"* @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %0, i64 %__n, i8* null)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE8allocateERS2_m
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8allocateEmPKv':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8allocateEmPKv
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %this) #3
  -->  %call U: full-set S: full-set
  %mul = mul i64 %__n, 24
  -->  (24 * %__n) U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %call2 = call i8* @_Znwm(i64 %mul)
  -->  %call2 U: full-set S: full-set
  %1 = bitcast i8* %call2 to %"struct.std::_List_node.6"*
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8allocateEmPKv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNK9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8max_sizeEv':
Classifying expressions for: @_ZNK9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8max_sizeEv
Determining loop execution counts for: @_ZNK9__gnu_cxx13new_allocatorISt10_List_nodeIiEE8max_sizeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt11__addressofISaISt10_List_nodeIiEEEPT_RS3_':
Classifying expressions for: @_ZSt11__addressofISaISt10_List_nodeIiEEEPT_RS3_
Determining loop execution counts for: @_ZSt11__addressofISaISt10_List_nodeIiEEEPT_RS3_
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE9constructIiJRKiEEEvPT_DpOT0_':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE9constructIiJRKiEEEvPT_DpOT0_
  %0 = bitcast i32* %__p to i8*
  -->  %__p U: full-set S: full-set
  %1 = bitcast i8* %0 to i32*
  -->  %__p U: full-set S: full-set
  %call = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %__args) #3
  -->  %call U: full-set S: full-set
  %2 = load i32, i32* %call, align 4
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE9constructIiJRKiEEEvPT_DpOT0_
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx16__aligned_membufIiE6_M_ptrEv':
Classifying expressions for: @_ZN9__gnu_cxx16__aligned_membufIiE6_M_ptrEv
  %call = call i8* @_ZN9__gnu_cxx16__aligned_membufIiE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf.7"* %this) #3
  -->  %call U: full-set S: full-set
  %0 = bitcast i8* %call to i32*
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx16__aligned_membufIiE6_M_ptrEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx16__aligned_membufIiE7_M_addrEv':
Classifying expressions for: @_ZN9__gnu_cxx16__aligned_membufIiE7_M_addrEv
  %_M_storage = getelementptr inbounds %"struct.__gnu_cxx::__aligned_membuf.7", %"struct.__gnu_cxx::__aligned_membuf.7"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast [4 x i8]* %_M_storage to i8*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx16__aligned_membufIiE7_M_addrEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE10deallocateERS2_PS1_m':
Classifying expressions for: @_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE10deallocateERS2_PS1_m
  %0 = bitcast %"class.std::allocator"* %__a to %"class.__gnu_cxx::new_allocator"*
  -->  %__a U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaISt10_List_nodeIiEEE10deallocateERS2_PS1_m
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE10deallocateEPS2_m':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE10deallocateEPS2_m
  %1 = bitcast %"struct.std::_List_node.6"* %__p to i8*
  -->  %__p U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIiEE10deallocateEPS2_m
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt14_List_iteratorIiEC2EPNSt8__detail15_List_node_baseE':
Classifying expressions for: @_ZNSt14_List_iteratorIiEC2EPNSt8__detail15_List_node_baseE
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator", %"struct.std::_List_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt14_List_iteratorIiEC2EPNSt8__detail15_List_node_baseE
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE9push_backERKi':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE9push_backERKi
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %0, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %1 = load i32*, i32** %_M_cur, align 8
  -->  %1 U: full-set S: full-set
  %2 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %2, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish3 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_last = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish3, i32 0, i32 2
  -->  (64 + %this) U: full-set S: full-set
  %3 = load i32*, i32** %_M_last, align 8
  -->  %3 U: full-set S: full-set
  %add.ptr = getelementptr inbounds i32, i32* %3, i64 -1
  -->  (-4 + %3)<nsw> U: full-set S: full-set
  %4 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl4 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %4, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %5 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl4 to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
  %6 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl5 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %6, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish6 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl5, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur7 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish6, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %7 = load i32*, i32** %_M_cur7, align 8
  -->  %7 U: full-set S: full-set
  %8 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl8 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %8, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish9 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl8, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur10 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish9, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %9 = load i32*, i32** %_M_cur10, align 8
  -->  %9 U: full-set S: full-set
  %incdec.ptr = getelementptr inbounds i32, i32* %9, i32 1
  -->  (4 + %9)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE9push_backERKi
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_':
Classifying expressions for: @_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_
  %0 = bitcast %"class.std::allocator.0"* %__a to %"class.__gnu_cxx::new_allocator.1"*
  -->  %__a U: full-set S: full-set
  %call = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %__args) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %call = call i32* @_ZNSt11_Deque_baseIiSaIiEE16_M_allocate_nodeEv(%"class.std::_Deque_base"* %0)
  -->  %call U: full-set S: full-set
  %1 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %1, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %2 = load i32**, i32*** %_M_node, align 8
  -->  %2 U: full-set S: full-set
  %add.ptr = getelementptr inbounds i32*, i32** %2, i64 1
  -->  (8 + %2)<nsw> U: full-set S: full-set
  %3 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %3, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %4 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2 to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
  %5 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl3 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %5, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish4 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl3, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish4, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %6 = load i32*, i32** %_M_cur, align 8
  -->  %6 U: full-set S: full-set
  %call5 = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %__args) #3
  -->  %call5 U: full-set S: full-set
  %7 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl6 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %7, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish7 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl6, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %8 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl8 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %8, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish9 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl8, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node10 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish9, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %9 = load i32**, i32*** %_M_node10, align 8
  -->  %9 U: full-set S: full-set
  %add.ptr11 = getelementptr inbounds i32*, i32** %9, i64 1
  -->  (8 + %9)<nsw> U: full-set S: full-set
  %10 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl12 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %10, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish13 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl12, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish13, i32 0, i32 1
  -->  (56 + %this) U: full-set S: full-set
  %11 = load i32*, i32** %_M_first, align 8
  -->  %11 U: full-set S: full-set
  %12 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl14 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %12, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish15 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl14, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur16 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish15, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %14 = extractvalue { i8*, i32 } %13, 0
  -->  %14 U: full-set S: full-set
  %15 = extractvalue { i8*, i32 } %13, 1
  -->  %15 U: full-set S: full-set
  %16 = call i8* @__cxa_begin_catch(i8* %14) #3
  -->  %16 U: full-set S: full-set
  %17 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %18 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl17 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %18, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish18 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl17, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node19 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish18, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %19 = load i32**, i32*** %_M_node19, align 8
  -->  %19 U: full-set S: full-set
  %add.ptr20 = getelementptr inbounds i32*, i32** %19, i64 1
  -->  (8 + %19)<nsw> U: full-set S: full-set
  %20 = load i32*, i32** %add.ptr20, align 8
  -->  %20 U: full-set S: full-set
  %22 = extractvalue { i8*, i32 } %21, 0
  -->  %22 U: full-set S: full-set
  %23 = extractvalue { i8*, i32 } %21, 1
  -->  %23 U: full-set S: full-set
  %25 = extractvalue { i8*, i32 } %24, 0
  -->  %25 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_
  %0 = bitcast i32* %__p to i8*
  -->  %__p U: full-set S: full-set
  %1 = bitcast i8* %0 to i32*
  -->  %__p U: full-set S: full-set
  %call = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %__args) #3
  -->  %call U: full-set S: full-set
  %2 = load i32, i32* %call, align 4
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE22_M_reserve_map_at_backEm':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE22_M_reserve_map_at_backEm
  %add = add i64 %__nodes_to_add, 1
  -->  (1 + %__nodes_to_add) U: full-set S: full-set
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %0, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %1 = load i64, i64* %_M_map_size, align 8
  -->  %1 U: full-set S: full-set
  %2 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %2, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %3 = load i32**, i32*** %_M_node, align 8
  -->  %3 U: full-set S: full-set
  %4 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl3 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %4, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl3, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %5 = load i32**, i32*** %_M_map, align 8
  -->  %5 U: full-set S: full-set
  %sub.ptr.lhs.cast = ptrtoint i32** %3 to i64
  -->  %sub.ptr.lhs.cast U: full-set S: full-set
  %sub.ptr.rhs.cast = ptrtoint i32** %5 to i64
  -->  %sub.ptr.rhs.cast U: full-set S: full-set
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  -->  ((-1 * %sub.ptr.rhs.cast) + %sub.ptr.lhs.cast) U: full-set S: full-set
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  -->  %sub.ptr.div U: full-set S: [-1152921504606846976,1152921504606846976)
  %sub = sub i64 %1, %sub.ptr.div
  -->  ((-1 * %sub.ptr.div)<nsw> + %1) U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE22_M_reserve_map_at_backEm
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE16_M_allocate_nodeEv':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE16_M_allocate_nodeEv
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
  %call = call i64 @_ZSt16__deque_buf_sizem(i64 4)
  -->  %call U: full-set S: full-set
  %call2 = call i32* @_ZNSt16allocator_traitsISaIiEE8allocateERS0_m(%"class.std::allocator.0"* dereferenceable(1) %0, i64 %call)
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE16_M_allocate_nodeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15_Deque_iteratorIiRiPiE11_M_set_nodeEPS1_':
Classifying expressions for: @_ZNSt15_Deque_iteratorIiRiPiE11_M_set_nodeEPS1_
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 3
  -->  (24 + %this)<nsw> U: full-set S: full-set
  %0 = load i32*, i32** %__new_node, align 8
  -->  %0 U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %_M_first2 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %1 = load i32*, i32** %_M_first2, align 8
  -->  %1 U: full-set S: full-set
  %call = call i64 @_ZNSt15_Deque_iteratorIiRiPiE14_S_buffer_sizeEv() #3
  -->  %call U: full-set S: full-set
  %add.ptr = getelementptr inbounds i32, i32* %1, i64 %call
  -->  ((4 * %call)<nsw> + %1)<nsw> U: full-set S: full-set
  %_M_last = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15_Deque_iteratorIiRiPiE11_M_set_nodeEPS1_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE17_M_reallocate_mapEmb':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE17_M_reallocate_mapEmb
  %__nodes_to_add.addr = alloca i64, align 8
  -->  %__nodes_to_add.addr U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %frombool = zext i1 %__add_at_front to i8
  -->  (zext i1 %__add_at_front to i8) U: [0,2) S: [0,2)
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %0, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %1 = load i32**, i32*** %_M_node, align 8
  -->  %1 U: full-set S: full-set
  %2 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %2, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_node3 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start, i32 0, i32 3
  -->  (40 + %this) U: full-set S: full-set
  %3 = load i32**, i32*** %_M_node3, align 8
  -->  %3 U: full-set S: full-set
  %sub.ptr.lhs.cast = ptrtoint i32** %1 to i64
  -->  %sub.ptr.lhs.cast U: full-set S: full-set
  %sub.ptr.rhs.cast = ptrtoint i32** %3 to i64
  -->  %sub.ptr.rhs.cast U: full-set S: full-set
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  -->  ((-1 * %sub.ptr.rhs.cast) + %sub.ptr.lhs.cast) U: full-set S: full-set
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  -->  %sub.ptr.div U: full-set S: [-1152921504606846976,1152921504606846976)
  %add = add nsw i64 %sub.ptr.div, 1
  -->  (1 + %sub.ptr.div)<nsw> U: full-set S: [-1152921504606846975,1152921504606846977)
  %4 = load i64, i64* %__nodes_to_add.addr, align 8
  -->  %4 U: full-set S: full-set
  %add4 = add i64 %add, %4
  -->  (1 + %sub.ptr.div + %4) U: full-set S: full-set
  %5 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl5 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %5, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl5, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %6 = load i64, i64* %_M_map_size, align 8
  -->  %6 U: full-set S: full-set
  %mul = mul i64 2, %add4
  -->  (2 * (1 + %sub.ptr.div + %4)) U: [0,-1) S: [-9223372036854775808,9223372036854775807)
  %7 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl6 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %7, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl6, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %8 = load i32**, i32*** %_M_map, align 8
  -->  %8 U: full-set S: full-set
  %9 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl7 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %9, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size8 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl7, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %10 = load i64, i64* %_M_map_size8, align 8
  -->  %10 U: full-set S: full-set
  %sub = sub i64 %10, %add4
  -->  (-1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %10) U: full-set S: full-set
  %div = udiv i64 %sub, 2
  -->  ((-1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %10) /u 2) U: [0,-9223372036854775808) S: [0,-9223372036854775808)
  %add.ptr = getelementptr inbounds i32*, i32** %8, i64 %div
  -->  ((8 * ((-1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %10) /u 2))<nuw><nsw> + %8)<nsw> U: full-set S: full-set
  %tobool = trunc i8 %frombool to i1
  -->  %__add_at_front U: full-set S: full-set
  %11 = load i64, i64* %__nodes_to_add.addr, align 8
  -->  %11 U: full-set S: full-set
  %cond = phi i64 [ %11, %cond.true ], [ 0, %cond.false ]
  -->  %cond U: full-set S: full-set
  %add.ptr9 = getelementptr inbounds i32*, i32** %add.ptr, i64 %cond
  -->  ((8 * ((-1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %10) /u 2))<nuw><nsw> + (8 * %cond)<nsw> + %8) U: full-set S: full-set
  %12 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl10 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %12, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start11 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl10, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_node12 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start11, i32 0, i32 3
  -->  (40 + %this) U: full-set S: full-set
  %13 = load i32**, i32*** %_M_node12, align 8
  -->  %13 U: full-set S: full-set
  %14 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl15 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %14, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start16 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl15, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_node17 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start16, i32 0, i32 3
  -->  (40 + %this) U: full-set S: full-set
  %15 = load i32**, i32*** %_M_node17, align 8
  -->  %15 U: full-set S: full-set
  %16 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl18 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %16, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish19 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl18, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node20 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish19, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %17 = load i32**, i32*** %_M_node20, align 8
  -->  %17 U: full-set S: full-set
  %add.ptr21 = getelementptr inbounds i32*, i32** %17, i64 1
  -->  (8 + %17)<nsw> U: full-set S: full-set
  %call = call i32** @_ZSt4copyIPPiS1_ET0_T_S3_S2_(i32** %15, i32** %add.ptr21, i32** %add.ptr9)
  -->  %call U: full-set S: full-set
  %18 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl22 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %18, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start23 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl22, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_node24 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start23, i32 0, i32 3
  -->  (40 + %this) U: full-set S: full-set
  %19 = load i32**, i32*** %_M_node24, align 8
  -->  %19 U: full-set S: full-set
  %20 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl25 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %20, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish26 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl25, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node27 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish26, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %21 = load i32**, i32*** %_M_node27, align 8
  -->  %21 U: full-set S: full-set
  %add.ptr28 = getelementptr inbounds i32*, i32** %21, i64 1
  -->  (8 + %21)<nsw> U: full-set S: full-set
  %add.ptr29 = getelementptr inbounds i32*, i32** %add.ptr9, i64 %add
  -->  (8 + (8 * ((-1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %10) /u 2))<nuw><nsw> + (8 * %sub.ptr.div)<nsw> + (8 * %cond)<nsw> + %8) U: full-set S: full-set
  %call30 = call i32** @_ZSt13copy_backwardIPPiS1_ET0_T_S3_S2_(i32** %19, i32** %add.ptr28, i32** %add.ptr29)
  -->  %call30 U: full-set S: full-set
  %22 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl32 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %22, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size33 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl32, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %23 = load i64, i64* %_M_map_size33, align 8
  -->  %23 U: full-set S: full-set
  %24 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl34 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %24, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size35 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl34, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %call36 = call dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %_M_map_size35, i64* dereferenceable(8) %__nodes_to_add.addr)
  -->  %call36 U: full-set S: full-set
  %25 = load i64, i64* %call36, align 8
  -->  %25 U: full-set S: full-set
  %add37 = add i64 %23, %25
  -->  (%23 + %25) U: full-set S: full-set
  %add38 = add i64 %add37, 2
  -->  (2 + %23 + %25) U: full-set S: full-set
  %26 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %call39 = call i32** @_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm(%"class.std::_Deque_base"* %26, i64 %add38)
  -->  %call39 U: full-set S: full-set
  %sub40 = sub i64 %add38, %add4
  -->  (1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %23 + %25) U: full-set S: full-set
  %div41 = udiv i64 %sub40, 2
  -->  ((1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %23 + %25) /u 2) U: [0,-9223372036854775808) S: [0,-9223372036854775808)
  %add.ptr42 = getelementptr inbounds i32*, i32** %call39, i64 %div41
  -->  ((8 * ((1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %23 + %25) /u 2))<nuw><nsw> + %call39)<nsw> U: full-set S: full-set
  %tobool43 = trunc i8 %frombool to i1
  -->  %__add_at_front U: full-set S: full-set
  %27 = load i64, i64* %__nodes_to_add.addr, align 8
  -->  %27 U: full-set S: full-set
  %cond47 = phi i64 [ %27, %cond.true44 ], [ 0, %cond.false45 ]
  -->  %cond47 U: full-set S: full-set
  %add.ptr48 = getelementptr inbounds i32*, i32** %add.ptr42, i64 %cond47
  -->  ((8 * ((1 + (-1 * %sub.ptr.div)<nsw> + (-1 * %4) + %23 + %25) /u 2))<nuw><nsw> + (8 * %cond47)<nsw> + %call39) U: full-set S: full-set
  %28 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl49 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %28, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start50 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl49, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_node51 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start50, i32 0, i32 3
  -->  (40 + %this) U: full-set S: full-set
  %29 = load i32**, i32*** %_M_node51, align 8
  -->  %29 U: full-set S: full-set
  %30 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl52 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %30, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish53 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl52, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node54 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish53, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %31 = load i32**, i32*** %_M_node54, align 8
  -->  %31 U: full-set S: full-set
  %add.ptr55 = getelementptr inbounds i32*, i32** %31, i64 1
  -->  (8 + %31)<nsw> U: full-set S: full-set
  %call56 = call i32** @_ZSt4copyIPPiS1_ET0_T_S3_S2_(i32** %29, i32** %add.ptr55, i32** %add.ptr48)
  -->  %call56 U: full-set S: full-set
  %32 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %33 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl57 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %33, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map58 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl57, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %34 = load i32**, i32*** %_M_map58, align 8
  -->  %34 U: full-set S: full-set
  %35 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl59 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %35, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size60 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl59, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %36 = load i64, i64* %_M_map_size60, align 8
  -->  %36 U: full-set S: full-set
  %37 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl61 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %37, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map62 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl61, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %38 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl63 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %38, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size64 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl63, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %__new_nstart.0 = phi i32** [ %add.ptr9, %if.end ], [ %add.ptr48, %cond.end46 ]
  -->  %__new_nstart.0 U: full-set S: full-set
  %39 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl66 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %39, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start67 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl66, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %40 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl68 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %40, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish69 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl68, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %add.ptr70 = getelementptr inbounds i32*, i32** %__new_nstart.0, i64 %add
  -->  (8 + (8 * %sub.ptr.div)<nsw> + %__new_nstart.0) U: full-set S: full-set
  %add.ptr71 = getelementptr inbounds i32*, i32** %add.ptr70, i64 -1
  -->  ((8 * %sub.ptr.div)<nsw> + %__new_nstart.0) U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE17_M_reallocate_mapEmb
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt4copyIPPiS1_ET0_T_S3_S2_':
Classifying expressions for: @_ZSt4copyIPPiS1_ET0_T_S3_S2_
  %call = call i32** @_ZSt12__miter_baseIPPiET_S2_(i32** %__first)
  -->  %call U: full-set S: full-set
  %call1 = call i32** @_ZSt12__miter_baseIPPiET_S2_(i32** %__last)
  -->  %call1 U: full-set S: full-set
  %call2 = call i32** @_ZSt14__copy_move_a2ILb0EPPiS1_ET1_T0_S3_S2_(i32** %call, i32** %call1, i32** %__result)
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_ZSt4copyIPPiS1_ET0_T_S3_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt13copy_backwardIPPiS1_ET0_T_S3_S2_':
Classifying expressions for: @_ZSt13copy_backwardIPPiS1_ET0_T_S3_S2_
  %call = call i32** @_ZSt12__miter_baseIPPiET_S2_(i32** %__first)
  -->  %call U: full-set S: full-set
  %call1 = call i32** @_ZSt12__miter_baseIPPiET_S2_(i32** %__last)
  -->  %call1 U: full-set S: full-set
  %call2 = call i32** @_ZSt23__copy_move_backward_a2ILb0EPPiS1_ET1_T0_S3_S2_(i32** %call, i32** %call1, i32** %__result)
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_ZSt13copy_backwardIPPiS1_ET0_T_S3_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt3maxImERKT_S2_S2_':
Classifying expressions for: @_ZSt3maxImERKT_S2_S2_
  %0 = load i64, i64* %__a, align 8
  -->  %0 U: full-set S: full-set
  %1 = load i64, i64* %__b, align 8
  -->  %1 U: full-set S: full-set
  %retval.0 = phi i64* [ %__b, %if.then ], [ %__a, %if.end ]
  -->  %retval.0 U: full-set S: full-set
Determining loop execution counts for: @_ZSt3maxImERKT_S2_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm
  %__map_alloc = alloca %"class.std::allocator.3", align 1
  -->  %__map_alloc U: full-set S: full-set
  %call = invoke i32** @_ZNSt16allocator_traitsISaIPiEE8allocateERS1_m(%"class.std::allocator.3"* dereferenceable(1) %__map_alloc, i64 %__n)
          to label %invoke.cont unwind label %lpad
  -->  %call U: full-set S: full-set
  %1 = extractvalue { i8*, i32 } %0, 0
  -->  %1 U: full-set S: full-set
  %2 = extractvalue { i8*, i32 } %0, 1
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt14__copy_move_a2ILb0EPPiS1_ET1_T0_S3_S2_':
Classifying expressions for: @_ZSt14__copy_move_a2ILb0EPPiS1_ET1_T0_S3_S2_
  %call = call i32** @_ZSt12__niter_baseIPPiET_S2_(i32** %__first)
  -->  %call U: full-set S: full-set
  %call1 = call i32** @_ZSt12__niter_baseIPPiET_S2_(i32** %__last)
  -->  %call1 U: full-set S: full-set
  %call2 = call i32** @_ZSt12__niter_baseIPPiET_S2_(i32** %__result)
  -->  %call2 U: full-set S: full-set
  %call3 = call i32** @_ZSt13__copy_move_aILb0EPPiS1_ET1_T0_S3_S2_(i32** %call, i32** %call1, i32** %call2)
  -->  %call3 U: full-set S: full-set
Determining loop execution counts for: @_ZSt14__copy_move_a2ILb0EPPiS1_ET1_T0_S3_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt12__miter_baseIPPiET_S2_':
Classifying expressions for: @_ZSt12__miter_baseIPPiET_S2_
Determining loop execution counts for: @_ZSt12__miter_baseIPPiET_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt13__copy_move_aILb0EPPiS1_ET1_T0_S3_S2_':
Classifying expressions for: @_ZSt13__copy_move_aILb0EPPiS1_ET1_T0_S3_S2_
  %call = call i32** @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIPiEEPT_PKS4_S7_S5_(i32** %__first, i32** %__last, i32** %__result)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZSt13__copy_move_aILb0EPPiS1_ET1_T0_S3_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt12__niter_baseIPPiET_S2_':
Classifying expressions for: @_ZSt12__niter_baseIPPiET_S2_
Determining loop execution counts for: @_ZSt12__niter_baseIPPiET_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIPiEEPT_PKS4_S7_S5_':
Classifying expressions for: @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIPiEEPT_PKS4_S7_S5_
  %sub.ptr.lhs.cast = ptrtoint i32** %__last to i64
  -->  %sub.ptr.lhs.cast U: full-set S: full-set
  %sub.ptr.rhs.cast = ptrtoint i32** %__first to i64
  -->  %sub.ptr.rhs.cast U: full-set S: full-set
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  -->  ((-1 * %sub.ptr.rhs.cast) + %sub.ptr.lhs.cast) U: full-set S: full-set
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  -->  %sub.ptr.div U: full-set S: [-1152921504606846976,1152921504606846976)
  %0 = bitcast i32** %__result to i8*
  -->  %__result U: full-set S: full-set
  %1 = bitcast i32** %__first to i8*
  -->  %__first U: full-set S: full-set
  %mul = mul i64 8, %sub.ptr.div
  -->  (8 * %sub.ptr.div)<nsw> U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %add.ptr = getelementptr inbounds i32*, i32** %__result, i64 %sub.ptr.div
  -->  ((8 * %sub.ptr.div)<nsw> + %__result)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIPiEEPT_PKS4_S7_S5_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt23__copy_move_backward_a2ILb0EPPiS1_ET1_T0_S3_S2_':
Classifying expressions for: @_ZSt23__copy_move_backward_a2ILb0EPPiS1_ET1_T0_S3_S2_
  %call = call i32** @_ZSt12__niter_baseIPPiET_S2_(i32** %__first)
  -->  %call U: full-set S: full-set
  %call1 = call i32** @_ZSt12__niter_baseIPPiET_S2_(i32** %__last)
  -->  %call1 U: full-set S: full-set
  %call2 = call i32** @_ZSt12__niter_baseIPPiET_S2_(i32** %__result)
  -->  %call2 U: full-set S: full-set
  %call3 = call i32** @_ZSt22__copy_move_backward_aILb0EPPiS1_ET1_T0_S3_S2_(i32** %call, i32** %call1, i32** %call2)
  -->  %call3 U: full-set S: full-set
Determining loop execution counts for: @_ZSt23__copy_move_backward_a2ILb0EPPiS1_ET1_T0_S3_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZSt22__copy_move_backward_aILb0EPPiS1_ET1_T0_S3_S2_':
Classifying expressions for: @_ZSt22__copy_move_backward_aILb0EPPiS1_ET1_T0_S3_S2_
  %call = call i32** @_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIPiEEPT_PKS4_S7_S5_(i32** %__first, i32** %__last, i32** %__result)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZSt22__copy_move_backward_aILb0EPPiS1_ET1_T0_S3_S2_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIPiEEPT_PKS4_S7_S5_':
Classifying expressions for: @_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIPiEEPT_PKS4_S7_S5_
  %sub.ptr.lhs.cast = ptrtoint i32** %__last to i64
  -->  %sub.ptr.lhs.cast U: full-set S: full-set
  %sub.ptr.rhs.cast = ptrtoint i32** %__first to i64
  -->  %sub.ptr.rhs.cast U: full-set S: full-set
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  -->  ((-1 * %sub.ptr.rhs.cast) + %sub.ptr.lhs.cast) U: full-set S: full-set
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  -->  %sub.ptr.div U: full-set S: [-1152921504606846976,1152921504606846976)
  %idx.neg = sub i64 0, %sub.ptr.div
  -->  (-1 * %sub.ptr.div)<nsw> U: full-set S: [-1152921504606846975,1152921504606846977)
  %add.ptr = getelementptr inbounds i32*, i32** %__result, i64 %idx.neg
  -->  ((-8 * %sub.ptr.div) + %__result)<nsw> U: full-set S: full-set
  %0 = bitcast i32** %add.ptr to i8*
  -->  ((-8 * %sub.ptr.div) + %__result)<nsw> U: full-set S: full-set
  %1 = bitcast i32** %__first to i8*
  -->  %__first U: full-set S: full-set
  %mul = mul i64 8, %sub.ptr.div
  -->  (8 * %sub.ptr.div)<nsw> U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %idx.neg1 = sub i64 0, %sub.ptr.div
  -->  (-1 * %sub.ptr.div)<nsw> U: full-set S: [-1152921504606846975,1152921504606846977)
  %add.ptr2 = getelementptr inbounds i32*, i32** %__result, i64 %idx.neg1
  -->  ((-8 * %sub.ptr.div) + %__result)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIPiEEPT_PKS4_S7_S5_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaIPiEE8allocateERS1_m':
Classifying expressions for: @_ZNSt16allocator_traitsISaIPiEE8allocateERS1_m
  %0 = bitcast %"class.std::allocator.3"* %__a to %"class.__gnu_cxx::new_allocator.4"*
  -->  %__a U: full-set S: full-set
  %call = call i32** @_ZN9__gnu_cxx13new_allocatorIPiE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.4"* %0, i64 %__n, i8* null)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaIPiEE8allocateERS1_m
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIPiE8allocateEmPKv':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIPiE8allocateEmPKv
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorIPiE8max_sizeEv(%"class.__gnu_cxx::new_allocator.4"* %this) #3
  -->  %call U: full-set S: full-set
  %mul = mul i64 %__n, 8
  -->  (8 * %__n) U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %call2 = call i8* @_Znwm(i64 %mul)
  -->  %call2 U: full-set S: full-set
  %1 = bitcast i8* %call2 to i32**
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIPiE8allocateEmPKv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNK9__gnu_cxx13new_allocatorIPiE8max_sizeEv':
Classifying expressions for: @_ZNK9__gnu_cxx13new_allocatorIPiE8max_sizeEv
Determining loop execution counts for: @_ZNK9__gnu_cxx13new_allocatorIPiE8max_sizeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaIiEE8allocateERS0_m':
Classifying expressions for: @_ZNSt16allocator_traitsISaIiEE8allocateERS0_m
  %0 = bitcast %"class.std::allocator.0"* %__a to %"class.__gnu_cxx::new_allocator.1"*
  -->  %__a U: full-set S: full-set
  %call = call i32* @_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.1"* %0, i64 %__n, i8* null)
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaIiEE8allocateERS0_m
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv(%"class.__gnu_cxx::new_allocator.1"* %this) #3
  -->  %call U: full-set S: full-set
  %mul = mul i64 %__n, 4
  -->  (4 * %__n) U: [0,-3) S: [-9223372036854775808,9223372036854775805)
  %call2 = call i8* @_Znwm(i64 %mul)
  -->  %call2 U: full-set S: full-set
  %1 = bitcast i8* %call2 to i32*
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv':
Classifying expressions for: @_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv
Determining loop execution counts for: @_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15_Deque_iteratorIiRiPiE14_S_buffer_sizeEv':
Classifying expressions for: @_ZNSt15_Deque_iteratorIiRiPiE14_S_buffer_sizeEv
  %call = invoke i64 @_ZSt16__deque_buf_sizem(i64 4)
          to label %invoke.cont unwind label %terminate.lpad
  -->  %call U: full-set S: full-set
  %1 = extractvalue { i8*, i32 } %0, 0
  -->  %1 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15_Deque_iteratorIiRiPiE14_S_buffer_sizeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEEC2Ev':
Classifying expressions for: @_ZNSt5dequeIiSaIiEEC2Ev
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEEC2Ev':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEEC2Ev
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %1 = extractvalue { i8*, i32 } %0, 0
  -->  %1 U: full-set S: full-set
  %2 = extractvalue { i8*, i32 } %0, 1
  -->  %2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE11_Deque_implC2Ev':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE11_Deque_implC2Ev
  %0 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %this to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
  %_M_map = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %_M_start = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %this, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %this, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE11_Deque_implC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm
  %ref.tmp = alloca i64, align 8
  -->  %ref.tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %ref.tmp2 = alloca i64, align 8
  -->  %ref.tmp2 U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %call = call i64 @_ZSt16__deque_buf_sizem(i64 4)
  -->  %call U: full-set S: full-set
  %div = udiv i64 %__num_elements, %call
  -->  (%__num_elements /u %call) U: full-set S: full-set
  %add = add i64 %div, 1
  -->  (1 + (%__num_elements /u %call)) U: full-set S: full-set
  %add3 = add i64 %add, 2
  -->  (3 + (%__num_elements /u %call)) U: full-set S: full-set
  %call4 = call dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %ref.tmp, i64* dereferenceable(8) %ref.tmp2)
  -->  %call4 U: full-set S: full-set
  %0 = load i64, i64* %call4, align 8
  -->  %0 U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %_M_impl5 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size6 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl5, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %1 = load i64, i64* %_M_map_size6, align 8
  -->  %1 U: full-set S: full-set
  %call7 = call i32** @_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm(%"class.std::_Deque_base"* %this, i64 %1)
  -->  %call7 U: full-set S: full-set
  %_M_impl8 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl8, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_impl9 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map10 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl9, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %2 = load i32**, i32*** %_M_map10, align 8
  -->  %2 U: full-set S: full-set
  %_M_impl11 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size12 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl11, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %3 = load i64, i64* %_M_map_size12, align 8
  -->  %3 U: full-set S: full-set
  %sub = sub i64 %3, %add
  -->  (-1 + (-1 * (%__num_elements /u %call)) + %3) U: full-set S: full-set
  %div13 = udiv i64 %sub, 2
  -->  ((-1 + (-1 * (%__num_elements /u %call)) + %3) /u 2) U: [0,-9223372036854775808) S: [0,-9223372036854775808)
  %add.ptr = getelementptr inbounds i32*, i32** %2, i64 %div13
  -->  ((8 * ((-1 + (-1 * (%__num_elements /u %call)) + %3) /u 2))<nuw><nsw> + %2)<nsw> U: full-set S: full-set
  %add.ptr14 = getelementptr inbounds i32*, i32** %add.ptr, i64 %add
  -->  (8 + (8 * ((-1 + (-1 * (%__num_elements /u %call)) + %3) /u 2))<nuw><nsw> + (8 * (%__num_elements /u %call)) + %2) U: full-set S: full-set
  %5 = extractvalue { i8*, i32 } %4, 0
  -->  %5 U: full-set S: full-set
  %6 = extractvalue { i8*, i32 } %4, 1
  -->  %6 U: full-set S: full-set
  %7 = call i8* @__cxa_begin_catch(i8* %5) #3
  -->  %7 U: full-set S: full-set
  %_M_impl15 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map16 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl15, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %8 = load i32**, i32*** %_M_map16, align 8
  -->  %8 U: full-set S: full-set
  %_M_impl17 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size18 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl17, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %9 = load i64, i64* %_M_map_size18, align 8
  -->  %9 U: full-set S: full-set
  %_M_impl19 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map20 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl19, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_impl21 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_map_size22 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl21, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %11 = extractvalue { i8*, i32 } %10, 0
  -->  %11 U: full-set S: full-set
  %12 = extractvalue { i8*, i32 } %10, 1
  -->  %12 U: full-set S: full-set
  %_M_impl25 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl25, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_impl26 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl26, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %add.ptr27 = getelementptr inbounds i32*, i32** %add.ptr14, i64 -1
  -->  ((8 * ((-1 + (-1 * (%__num_elements /u %call)) + %3) /u 2))<nuw><nsw> + (8 * (%__num_elements /u %call)) + %2) U: full-set S: full-set
  %_M_impl28 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start29 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl28, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start29, i32 0, i32 1
  -->  (24 + %this) U: full-set S: full-set
  %13 = load i32*, i32** %_M_first, align 8
  -->  %13 U: full-set S: full-set
  %_M_impl30 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start31 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl30, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_start31, i32 0, i32 0
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_impl32 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish33 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl32, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_first34 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish33, i32 0, i32 1
  -->  (56 + %this) U: full-set S: full-set
  %14 = load i32*, i32** %_M_first34, align 8
  -->  %14 U: full-set S: full-set
  %call35 = call i64 @_ZSt16__deque_buf_sizem(i64 4)
  -->  %call35 U: full-set S: full-set
  %rem = urem i64 %__num_elements, %call35
  -->  ((-1 * (%__num_elements /u %call35) * %call35) + %__num_elements) U: full-set S: full-set
  %add.ptr36 = getelementptr inbounds i32, i32* %14, i64 %rem
  -->  ((4 * %__num_elements) + (-4 * (%__num_elements /u %call35) * %call35) + %14) U: full-set S: full-set
  %_M_impl37 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish38 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl37, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur39 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish38, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %16 = extractvalue { i8*, i32 } %15, 0
  -->  %16 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSaIiEC2Ev':
Classifying expressions for: @_ZNSaIiEC2Ev
  %0 = bitcast %"class.std::allocator.0"* %this to %"class.__gnu_cxx::new_allocator.1"*
  -->  %this U: full-set S: full-set
Determining loop execution counts for: @_ZNSaIiEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15_Deque_iteratorIiRiPiEC2Ev':
Classifying expressions for: @_ZNSt15_Deque_iteratorIiRiPiEC2Ev
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %_M_last = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 3
  -->  (24 + %this)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15_Deque_iteratorIiRiPiEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIiEC2Ev':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIiEC2Ev
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIiEC2Ev
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt11_Deque_baseIiSaIiEE15_M_create_nodesEPPiS3_':
Classifying expressions for: @_ZNSt11_Deque_baseIiSaIiEE15_M_create_nodesEPPiS3_
  %__cur.0 = phi i32** [ %__nstart, %entry ], [ %incdec.ptr, %for.inc ]
  -->  {%__nstart,+,8}<nuw><%for.cond> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %call = invoke i32* @_ZNSt11_Deque_baseIiSaIiEE16_M_allocate_nodeEv(%"class.std::_Deque_base"* %this)
          to label %invoke.cont unwind label %lpad
  -->  %call U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Variant }
  %incdec.ptr = getelementptr inbounds i32*, i32** %__cur.0, i32 1
  -->  {(8 + %__nstart)<nsw>,+,8}<nw><%for.cond> U: full-set S: full-set		Exits: <<Unknown>>		LoopDispositions: { %for.cond: Computable }
  %1 = extractvalue { i8*, i32 } %0, 0
  -->  %1 U: full-set S: full-set
  %2 = extractvalue { i8*, i32 } %0, 1
  -->  %2 U: full-set S: full-set
  %3 = call i8* @__cxa_begin_catch(i8* %1) #3
  -->  %3 U: full-set S: full-set
  %5 = extractvalue { i8*, i32 } %4, 0
  -->  %5 U: full-set S: full-set
  %6 = extractvalue { i8*, i32 } %4, 1
  -->  %6 U: full-set S: full-set
  %8 = extractvalue { i8*, i32 } %7, 0
  -->  %8 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt11_Deque_baseIiSaIiEE15_M_create_nodesEPPiS3_
Loop %for.cond: <multiple exits> Unpredictable backedge-taken count.
  exit count for for.cond: ***COULDNOTCOMPUTE***
  exit count for for.body: ***COULDNOTCOMPUTE***
Loop %for.cond: Unpredictable max backedge-taken count. 
Loop %for.cond: Unpredictable predicated backedge-taken count. 
Printing analysis 'Scalar Evolution Analysis' for function '_ZNKSt5dequeIiSaIiEE5emptyEv':
Classifying expressions for: @_ZNKSt5dequeIiSaIiEE5emptyEv
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %0, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %1 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %1, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_start = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %call = call zeroext i1 @_ZSteqIiRiPiEbRKSt15_Deque_iteratorIT_T0_T1_ES8_(%"struct.std::_Deque_iterator"* dereferenceable(32) %_M_finish, %"struct.std::_Deque_iterator"* dereferenceable(32) %_M_start) #3
  -->  %call U: full-set S: full-set
Determining loop execution counts for: @_ZNKSt5dequeIiSaIiEE5emptyEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZSteqIiRiPiEbRKSt15_Deque_iteratorIT_T0_T1_ES8_':
Classifying expressions for: @_ZSteqIiRiPiEbRKSt15_Deque_iteratorIT_T0_T1_ES8_
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %__x, i32 0, i32 0
  -->  %__x U: full-set S: full-set
  %0 = load i32*, i32** %_M_cur, align 8
  -->  %0 U: full-set S: full-set
  %_M_cur1 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %__y, i32 0, i32 0
  -->  %__y U: full-set S: full-set
  %1 = load i32*, i32** %_M_cur1, align 8
  -->  %1 U: full-set S: full-set
Determining loop execution counts for: @_ZSteqIiRiPiEbRKSt15_Deque_iteratorIT_T0_T1_ES8_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE4backEv':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE4backEv
  %__tmp = alloca %"struct.std::_Deque_iterator", align 8
  -->  %__tmp U: [0,-7) S: [-9223372036854775808,9223372036854775801)
  %call = call dereferenceable(32) %"struct.std::_Deque_iterator"* @_ZNSt15_Deque_iteratorIiRiPiEmmEv(%"struct.std::_Deque_iterator"* %__tmp) #3
  -->  %call U: full-set S: full-set
  %call2 = call dereferenceable(4) i32* @_ZNKSt15_Deque_iteratorIiRiPiEdeEv(%"struct.std::_Deque_iterator"* %__tmp) #3
  -->  %call2 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE4backEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt15_Deque_iteratorIiRiPiEmmEv':
Classifying expressions for: @_ZNSt15_Deque_iteratorIiRiPiEmmEv
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = load i32*, i32** %_M_cur, align 8
  -->  %0 U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 1
  -->  (8 + %this)<nsw> U: full-set S: full-set
  %1 = load i32*, i32** %_M_first, align 8
  -->  %1 U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 3
  -->  (24 + %this)<nsw> U: full-set S: full-set
  %2 = load i32**, i32*** %_M_node, align 8
  -->  %2 U: full-set S: full-set
  %add.ptr = getelementptr inbounds i32*, i32** %2, i64 -1
  -->  (-8 + %2)<nsw> U: full-set S: full-set
  %_M_last = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 2
  -->  (16 + %this)<nsw> U: full-set S: full-set
  %3 = load i32*, i32** %_M_last, align 8
  -->  %3 U: full-set S: full-set
  %_M_cur2 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_cur3 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %4 = load i32*, i32** %_M_cur3, align 8
  -->  %4 U: full-set S: full-set
  %incdec.ptr = getelementptr inbounds i32, i32* %4, i32 -1
  -->  (-4 + %4)<nsw> U: full-set S: full-set
Determining loop execution counts for: @_ZNSt15_Deque_iteratorIiRiPiEmmEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNKSt15_Deque_iteratorIiRiPiEdeEv':
Classifying expressions for: @_ZNKSt15_Deque_iteratorIiRiPiEdeEv
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %this, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %0 = load i32*, i32** %_M_cur, align 8
  -->  %0 U: full-set S: full-set
Determining loop execution counts for: @_ZNKSt15_Deque_iteratorIiRiPiEdeEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE8pop_backEv':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE8pop_backEv
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %0, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %1 = load i32*, i32** %_M_cur, align 8
  -->  %1 U: full-set S: full-set
  %2 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %2, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish3 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish3, i32 0, i32 1
  -->  (56 + %this) U: full-set S: full-set
  %3 = load i32*, i32** %_M_first, align 8
  -->  %3 U: full-set S: full-set
  %4 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl4 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %4, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish5 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl4, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur6 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish5, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %5 = load i32*, i32** %_M_cur6, align 8
  -->  %5 U: full-set S: full-set
  %incdec.ptr = getelementptr inbounds i32, i32* %5, i32 -1
  -->  (-4 + %5)<nsw> U: full-set S: full-set
  %6 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl7 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %6, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %7 = bitcast %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl7 to %"class.std::allocator.0"*
  -->  %this U: full-set S: full-set
  %8 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl8 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %8, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish9 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl8, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur10 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish9, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %9 = load i32*, i32** %_M_cur10, align 8
  -->  %9 U: full-set S: full-set
  %11 = extractvalue { i8*, i32 } %10, 0
  -->  %11 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE8pop_backEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt16allocator_traitsISaIiEE7destroyIiEEvRS0_PT_':
Classifying expressions for: @_ZNSt16allocator_traitsISaIiEE7destroyIiEEvRS0_PT_
  %0 = bitcast %"class.std::allocator.0"* %__a to %"class.__gnu_cxx::new_allocator.1"*
  -->  %__a U: full-set S: full-set
Determining loop execution counts for: @_ZNSt16allocator_traitsISaIiEE7destroyIiEEvRS0_PT_
Printing analysis 'Scalar Evolution Analysis' for function '_ZNSt5dequeIiSaIiEE15_M_pop_back_auxEv':
Classifying expressions for: @_ZNSt5dequeIiSaIiEE15_M_pop_back_auxEv
  %0 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %1 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %1, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_first = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish, i32 0, i32 1
  -->  (56 + %this) U: full-set S: full-set
  %2 = load i32*, i32** %_M_first, align 8
  -->  %2 U: full-set S: full-set
  %3 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl2 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %3, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish3 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl2, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %4 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl4 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %4, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish5 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl4, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_node = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish5, i32 0, i32 3
  -->  (72 + %this) U: full-set S: full-set
  %5 = load i32**, i32*** %_M_node, align 8
  -->  %5 U: full-set S: full-set
  %add.ptr = getelementptr inbounds i32*, i32** %5, i64 -1
  -->  (-8 + %5)<nsw> U: full-set S: full-set
  %6 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl6 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %6, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish7 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl6, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_last = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish7, i32 0, i32 2
  -->  (64 + %this) U: full-set S: full-set
  %7 = load i32*, i32** %_M_last, align 8
  -->  %7 U: full-set S: full-set
  %add.ptr8 = getelementptr inbounds i32, i32* %7, i64 -1
  -->  (-4 + %7)<nsw> U: full-set S: full-set
  %8 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl9 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %8, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish10 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl9, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish10, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %9 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %call = call dereferenceable(1) %"class.std::allocator.0"* @_ZNSt11_Deque_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"class.std::_Deque_base"* %9) #3
  -->  %call U: full-set S: full-set
  %10 = bitcast %"class.std::deque"* %this to %"class.std::_Deque_base"*
  -->  %this U: full-set S: full-set
  %_M_impl11 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %10, i32 0, i32 0
  -->  %this U: full-set S: full-set
  %_M_finish12 = getelementptr inbounds %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl", %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl"* %_M_impl11, i32 0, i32 3
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %_M_cur13 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish12, i32 0, i32 0
  -->  (48 + %this)<nsw> U: full-set S: full-set
  %11 = load i32*, i32** %_M_cur13, align 8
  -->  %11 U: full-set S: full-set
Determining loop execution counts for: @_ZNSt5dequeIiSaIiEE15_M_pop_back_auxEv
Printing analysis 'Scalar Evolution Analysis' for function '_ZN9__gnu_cxx13new_allocatorIiE7destroyIiEEvPT_':
Classifying expressions for: @_ZN9__gnu_cxx13new_allocatorIiE7destroyIiEEvPT_
Determining loop execution counts for: @_ZN9__gnu_cxx13new_allocatorIiE7destroyIiEEvPT_
Printing analysis 'Scalar Evolution Analysis' for function '_GLOBAL__sub_I_topological_sorting.cpp':
Classifying expressions for: @_GLOBAL__sub_I_topological_sorting.cpp
Determining loop execution counts for: @_GLOBAL__sub_I_topological_sorting.cpp
