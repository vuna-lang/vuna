open Vuna_runtime
type t_ClauseCover = C_ClauseCover_CovUncovered | C_ClauseCover_CovCovered | C_ClauseCover_CovUnknown

# 34 "Vuna/Compiler/Elab/Coverage.vuna"
let v_emptyPatSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 38 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_wilds = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), (v_wilds (n - 1))))))

# 42 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patHead = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__0, dtb__1, dtb__2) -> (v_patHead dtb__1)
  | _ -> mc0
))

# 46 "Vuna/Compiler/Elab/Coverage.vuna"
let v_headCtorName = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match (v_patHead dtb__3) with
  | Frontend_dAst.C_Pat_PCon (dtb__5, dtb__6, dtb__7) -> (B_dData_dMaybe.C_Maybe_Just (dtb__5))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Coverage.vuna"
let v_ctorHeadsOf = (fun (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (B_dData_dList.v_nubNames ((B_dData_dList.v_mapMaybe v_headCtorName) rows)))

# 58 "Vuna/Compiler/Elab/Coverage.vuna"
let v_isWildHead = (fun (p : Frontend_dAst.t_Pat) -> (match (v_patHead p) with
  | Frontend_dAst.C_Pat_PVar (dtb__8, dtb__9) -> true
  | Frontend_dAst.C_Pat_PWild (dtb__10) -> true
  | _ -> false
))

# 66 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_defaultRows = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__11 with
  | B_dData_dList.C_List_Nil -> (v_defaultRows dtb__12)
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if (v_isWildHead dtb__13) then (B_dData_dList.C_List__x58__x58_ (dtb__14, (v_defaultRows dtb__12))) else (v_defaultRows dtb__12))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_concatMapRow = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List) -> Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> ((B_dData_dList.v_append (mc0 dtb__15)) ((v_concatMapRow mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializeRow = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match (v_patHead dtb__17) with
  | Frontend_dAst.C_Pat_PCon (dtb__19, dtb__20, dtb__21) -> (if (dtb__19 = mc1) then (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append dtb__20) dtb__18), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | Frontend_dAst.C_Pat_PVar (dtb__22, dtb__23) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append (v_wilds mc0)) dtb__18), B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Pat_PWild (dtb__24) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append (v_wilds mc0)) dtb__18), B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializeCtor = (fun (ar : int) (cname : string) (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> ((v_concatMapRow ((v_specializeRow ar) cname)) rows))

# 90 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasNilRow = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_hasNilRow dtb__26)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_lookupEntry = (fun (mc0 : string) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> (if (dtb__29 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__30)) else ((v_lookupEntry mc0) dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyCtors = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (cname : string) -> (let nd_uscrut2 = ((B_dData_dList.v_filter (fun (e : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x47__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt)) ((v_lookupEntry cname) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf e)))) B_dData_dMaybe.C_Maybe_Nothing))) table) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__31)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__31)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 122 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasShortCtor = (fun (mc0 : string) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match dtb__33 with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> (if ((Frontend_dAst.v_ctorShortName dtb__35) = mc0) then true else ((v_hasShortCtor mc0) dtb__34))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_anyShortCtor = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (if ((v_hasShortCtor dtb__37) mc1) then true else ((v_anyShortCtor dtb__38) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyOfShortCtors = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (shorts : string B_dData_dList.t_List) -> (let nd_uscrut2 = ((B_dData_dList.v_filter (fun (e : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((v_anyShortCtor shorts) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf e))))) table) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match dtb__40 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__39)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__39)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 134 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_findShortCtor = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (if ((B_dData_dList.v_memName (Frontend_dAst.v_ctorShortName (B_dData_dPair.v_firstOf dtb__41))) mc1) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__41))) else ((v_findShortCtor dtb__42) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Coverage.vuna"
let v_sentinelCtorIn = (fun (ctors : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (h : string) -> (let nd_uscrut2 = (Frontend_dReserved.v_classify h) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (match dtb__43 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((v_findShortCtor ctors) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil)))))
  | Frontend_dReserved.C_Reserved_RsListNil -> ((v_findShortCtor ctors) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (h))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (h))
)))

# 140 "Vuna/Compiler/Elab/Coverage.vuna"
let v_orderedCtors = (fun (ctors : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (heads : string B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_filter (fun (e : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf e)) heads)))) ctors)) ((B_dData_dList.v_filter (fun (e : (string, int) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf e)) heads))) ctors)))

# 146 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_takePats = (fun (n : int) (xs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (B_dData_dList.C_List__x58__x58_ (dtb__44, ((v_takePats (n - 1)) dtb__45)))
  | _ -> failwith "DT: impossible branch"
)))

# 155 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_dropPats = (fun (n : int) (xs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> ((v_dropPats (n - 1)) dtb__47)
  | _ -> failwith "DT: impossible branch"
)))

# 170 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_coverageWitness = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (pending : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (qs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__48 = fuel in (if (dtnat__48 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb__49 = (dtnat__48 - 1) in (match pending with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (match dtb__50 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (let ar = (B_dData_dPair.v_secondOf dtb__51) in (let specialized = (((v_specializeCtor ar) (B_dData_dPair.v_firstOf dtb__51)) rows) in (let deeper = (((((v_coverageWitness table) dtb__49) B_dData_dMaybe.C_Maybe_Nothing) specialized) ((B_dData_dList.v_append (v_wilds ar)) qs)) in (match deeper with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_coverageWitness table) dtb__49) (B_dData_dMaybe.C_Maybe_Just (dtb__52))) rows) qs)
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PCon ((B_dData_dPair.v_firstOf dtb__51), ((v_takePats ar) dtb__53), (Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), ((v_dropPats ar) dtb__53)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match qs with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow rows) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)))
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (let heads = (v_ctorHeadsOf rows) in (match heads with
  | B_dData_dList.C_List_Nil -> (match (((((v_coverageWitness table) dtb__49) B_dData_dMaybe.C_Maybe_Nothing) (v_defaultRows rows)) dtb__55) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), dtb__56))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match ((v_familyCtors table) dtb__57) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (((((v_coverageWitness table) dtb__49) (B_dData_dMaybe.C_Maybe_Just (((v_orderedCtors dtb__59) heads)))) rows) dtb__55)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 231 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_clauseCover = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (qs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__60 = fuel in (if (dtnat__60 = 0) then C_ClauseCover_CovUnknown else (let dtb__61 = (dtnat__60 - 1) in (match qs with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow rows) then C_ClauseCover_CovCovered else C_ClauseCover_CovUncovered)
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match (v_patHead dtb__62) with
  | Frontend_dAst.C_Pat_PCon (dtb__64, dtb__65, dtb__66) -> ((((v_clauseCover table) dtb__61) (((v_specializeCtor (B_dData_dList.v_length dtb__65)) dtb__64) rows)) ((B_dData_dList.v_append dtb__65) dtb__63))
  | Frontend_dAst.C_Pat_PRecord (dtb__67, dtb__68, dtb__69) -> C_ClauseCover_CovUnknown
  | Frontend_dAst.C_Pat_PInt (dtb__70, dtb__71) -> ((((v_clauseCover table) dtb__61) (v_defaultRows rows)) dtb__63)
  | Frontend_dAst.C_Pat_PStr (dtb__72, dtb__73) -> ((((v_clauseCover table) dtb__61) (v_defaultRows rows)) dtb__63)
  | _ -> (match (v_ctorHeadsOf rows) with
  | B_dData_dList.C_List_Nil -> ((((v_clauseCover table) dtb__61) (v_defaultRows rows)) dtb__63)
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match ((v_familyCtors table) dtb__74) with
  | B_dData_dMaybe.C_Maybe_Nothing -> C_ClauseCover_CovUnknown
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> ((((((v_clauseCoverCtorsGo table) dtb__61) ((v_orderedCtors dtb__76) (v_ctorHeadsOf rows))) rows) dtb__63) C_ClauseCover_CovCovered)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))))
# 271 "Vuna/Compiler/Elab/Coverage.vuna"
and v_clauseCoverCtorsGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc4 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc5 : t_ClauseCover) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (let ar = (B_dData_dPair.v_secondOf dtb__77) in (match ((((v_clauseCover mc0) mc1) (((v_specializeCtor ar) (B_dData_dPair.v_firstOf dtb__77)) mc3)) ((B_dData_dList.v_append (v_wilds ar)) mc4)) with
  | C_ClauseCover_CovUncovered -> C_ClauseCover_CovUncovered
  | C_ClauseCover_CovUnknown -> ((((((v_clauseCoverCtorsGo mc0) mc1) dtb__78) mc3) mc4) C_ClauseCover_CovUnknown)
  | C_ClauseCover_CovCovered -> ((((((v_clauseCoverCtorsGo mc0) mc1) dtb__78) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patNodes = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__79, dtb__80, dtb__81) -> (1 + (v_patNodesFields dtb__80))
  | Frontend_dAst.C_Pat_PAs (dtb__82, dtb__83, dtb__84) -> (1 + (v_patNodes dtb__83))
  | Frontend_dAst.C_Pat_PCon (dtb__85, dtb__86, dtb__87) -> (1 + (v_patNodesList dtb__86))
  | _ -> 1
))
# 288 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesList = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> ((v_patNodes dtb__88) + (v_patNodesList dtb__89))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 292 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesFields = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> ((v_patNodes dtb__93) + (v_patNodesFields dtb__91))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_matrixNodes = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> ((v_patNodesList dtb__94) + (v_matrixNodes dtb__95))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelMax = 1000000

# 301 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelFor = (fun (clauses : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (let scaled = (256 + (4 * (v_matrixNodes clauses))) in (if (scaled > v_coverageFuelMax) then v_coverageFuelMax else scaled)))

# 315 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_allSameLen = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (if ((B_dData_dList.v_length dtb__96) = mc0) then ((v_allSameLen mc0) dtb__97) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Elab/Coverage.vuna"
let v_uniformArity = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> ((v_allSameLen (B_dData_dList.v_length dtb__98)) dtb__99)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixArity = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (B_dData_dList.v_length dtb__100)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixWitness = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (if (v_uniformArity clauses) then (((((v_coverageWitness table) (bi_natFromInt (v_coverageFuelFor clauses))) B_dData_dMaybe.C_Maybe_Nothing) clauses) (v_wilds (v_matrixArity clauses))) else B_dData_dMaybe.C_Maybe_Nothing))

# 352 "Vuna/Compiler/Elab/Coverage.vuna"
let v_witnessNamesCtor = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match (v_patHead dtb__102) with
  | Frontend_dAst.C_Pat_PCon (dtb__104, dtb__105, dtb__106) -> true
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_renderPatIn = (fun (fuel : int) (paren : bool) (p : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then "_" else (match (v_patHead p) with
  | Frontend_dAst.C_Pat_PCon (dtb__107, dtb__108, dtb__109) -> (if ((B_dData_dList.v_length dtb__108) = 0) then dtb__107 else (let body = (String.concat "" [dtb__107; " "; ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn (fuel - 1)) true)) dtb__108))]) in (if paren then (String.concat "" ["("; body; ")"]) else body)))
  | Frontend_dAst.C_Pat_PVar (dtb__110, dtb__111) -> "_"
  | Frontend_dAst.C_Pat_PWild (dtb__112) -> "_"
  | Frontend_dAst.C_Pat_PInt (dtb__113, dtb__114) -> (string_of_int dtb__113)
  | Frontend_dAst.C_Pat_PStr (dtb__115, dtb__116) -> (String.concat "" ["\""; dtb__115; "\""])
  | Frontend_dAst.C_Pat_PRecord (dtb__117, dtb__118, dtb__119) -> (String.concat "" ["{ "; dtb__117; " }"])
  | Frontend_dAst.C_Pat_PAs (dtb__120, dtb__121, dtb__122) -> (((v_renderPatIn (fuel - 1)) paren) dtb__121)
  | _ -> failwith "DT: impossible branch"
)))

# 361 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderPat = (fun (p : Frontend_dAst.t_Pat) -> (((v_renderPatIn 64) false) p))

# 384 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderWitness = (fun (ws : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn 64) true)) ws)))

# 335 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveDiag = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((d).Base_dDiag.f_Diagnostic_diagCode <> "TC_NotExhaustive") then d else (match ((v_matrixWitness table) clauses) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (if (v_witnessNamesCtor dtb__123) then (let rx = (v_renderWitness dtb__123) in ((Base_dDiag.v_withFallbackSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive (rx))) (B_dData_dVec.C_Vec__x58__x58_ (rx, B_dData_dVec.C_Vec_Nil))))) else d)
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
)))

# 331 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveExhaustive = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (int) -> Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) mc3 -> (match mc3 with
  | Base_dDiag.C_Check_ErrC (dtb__124) -> (Base_dDiag.C_Check_ErrC (((((v_improveDiag mc0) (mc1 0)) mc2) dtb__124)))
  | Base_dDiag.C_Check_OkC (dtb__125) -> (Base_dDiag.C_Check_OkC (dtb__125))
  | _ -> failwith "DT: impossible branch"
))
