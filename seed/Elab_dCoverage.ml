open Vuna_runtime
type t_CoverVerdict = C_CoverVerdict_CoverProved | C_CoverVerdict_CoverMissing | C_CoverVerdict_CoverUnknown
and t_CtorFamily = C_CtorFamily_CtorFamilyJudgeable of ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_CtorFamily_CtorFamilyIndexed of ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_CtorFamily_CtorFamilyUnknown
and t_Witness = C_Witness_WitnessProved | C_Witness_WitnessMissing of (Frontend_dAst.t_Pat B_dData_dList.t_List) | C_Witness_WitnessUnknown

# 42 "Vuna/Compiler/Elab/Coverage.vuna"
let v_emptyPatSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 58 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializationCover = (fun (mc0 : bool) -> (if mc0 then C_CoverVerdict_CoverProved else C_CoverVerdict_CoverMissing))

# 63 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_wilds = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), (v_wilds (n - 1))))))

# 67 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patHead = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__0, dtb__1, dtb__2) -> (v_patHead dtb__1)
  | _ -> mc0
))

# 71 "Vuna/Compiler/Elab/Coverage.vuna"
let v_headCtorName = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match (v_patHead dtb__3) with
  | Frontend_dAst.C_Pat_PCon (dtb__5, dtb__6, dtb__7) -> (B_dData_dMaybe.C_Maybe_Just (dtb__5))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Elab/Coverage.vuna"
let v_ctorHeadsOf = (fun (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (B_dData_dList.v_nubNames ((B_dData_dList.v_mapMaybe v_headCtorName) rows)))

# 83 "Vuna/Compiler/Elab/Coverage.vuna"
let v_isWildHead = (fun (p : Frontend_dAst.t_Pat) -> (match (v_patHead p) with
  | Frontend_dAst.C_Pat_PVar (dtb__8, dtb__9) -> true
  | Frontend_dAst.C_Pat_PWild (dtb__10) -> true
  | _ -> false
))

# 91 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_defaultRows = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__11 with
  | B_dData_dList.C_List_Nil -> (v_defaultRows dtb__12)
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if (v_isWildHead dtb__13) then (B_dData_dList.C_List__x58__x58_ (dtb__14, (v_defaultRows dtb__12))) else (v_defaultRows dtb__12))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_concatMapRow = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List) -> Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> ((B_dData_dList.v_append (mc0 dtb__15)) ((v_concatMapRow mc0) dtb__16))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Elab/Coverage.vuna"
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

# 99 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializeCtor = (fun (ar : int) (cname : string) (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> ((v_concatMapRow ((v_specializeRow ar) cname)) rows))

# 115 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasNilRow = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_hasNilRow dtb__26)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_lookupEntry = (fun (mc0 : string) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> (if (dtb__29 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__30)) else ((v_lookupEntry mc0) dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Elab/Coverage.vuna"
let v_ctorFamily = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (cname : string) -> (let nd_uscrut2 = ((B_dData_dList.v_filter (fun (e : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x47__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt)) ((v_lookupEntry cname) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (Obj.magic e))))) B_dData_dMaybe.C_Maybe_Nothing))) table) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__31)) then (C_CtorFamily_CtorFamilyJudgeable ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__31)))) else (C_CtorFamily_CtorFamilyIndexed ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__31)))))
  | _ -> C_CtorFamily_CtorFamilyUnknown
)
  | _ -> C_CtorFamily_CtorFamilyUnknown
)))

# 146 "Vuna/Compiler/Elab/Coverage.vuna"
let v_ctorNeedsReachOracle = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (cname : string) -> (match ((v_ctorFamily table) cname) with
  | C_CtorFamily_CtorFamilyJudgeable (dtb__33) -> false
  | _ -> true
))

# 152 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyCtors = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (cname : string) -> (match ((v_ctorFamily table) cname) with
  | C_CtorFamily_CtorFamilyJudgeable (dtb__34) -> (B_dData_dMaybe.C_Maybe_Just (dtb__34))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 171 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasShortCtor = (fun (mc0 : string) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (match dtb__35 with
  | { B_dData_dPair.f_Pair_first = dtb__37; B_dData_dPair.f_Pair_second = dtb__38 } -> (if ((Frontend_dAst.v_ctorShortName dtb__37) = mc0) then true else ((v_hasShortCtor mc0) dtb__36))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_anyShortCtor = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (if ((v_hasShortCtor dtb__39) mc1) then true else ((v_anyShortCtor dtb__40) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyOfShortCtors = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (shorts : string B_dData_dList.t_List) -> (let nd_uscrut2 = ((B_dData_dList.v_filter (fun (e : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((v_anyShortCtor shorts) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (Obj.magic e)))))) table) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (match dtb__42 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__41)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__41)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 183 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_findShortCtor = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (if ((B_dData_dList.v_memName (Frontend_dAst.v_ctorShortName (B_dData_dPair.v_firstOf dtb__43))) mc1) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__43))) else ((v_findShortCtor dtb__44) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Elab/Coverage.vuna"
let v_sentinelCtorIn = (fun (ctors : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (h : string) -> (let nd_uscrut2 = (Frontend_dReserved.v_classify h) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> (match dtb__45 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((v_findShortCtor ctors) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil)))))
  | Frontend_dReserved.C_Reserved_RsListNil -> ((v_findShortCtor ctors) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (h))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (h))
)))

# 189 "Vuna/Compiler/Elab/Coverage.vuna"
let v_orderedCtors = (fun (ctors : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (heads : string B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_filter (fun (e : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf (Obj.magic e))) heads)))) ctors)) ((B_dData_dList.v_filter (fun (e : (string, int) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf (Obj.magic e))) heads))) ctors)))

# 195 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_takePats = (fun (n : int) (xs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (B_dData_dList.C_List__x58__x58_ (dtb__46, ((v_takePats (n - 1)) dtb__47)))
  | _ -> failwith "DT: impossible branch"
)))

# 204 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_dropPats = (fun (n : int) (xs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> ((v_dropPats (n - 1)) dtb__49)
  | _ -> failwith "DT: impossible branch"
)))

# 227 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_coverageWitness = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (pending : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (qs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__50 = fuel in (if (dtnat__50 = 0) then C_Witness_WitnessUnknown else (let dtb__51 = (dtnat__50 - 1) in (match pending with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> ((((((v_coverageCtorTries table) dtb__51) dtb__52) rows) qs) false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match qs with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow rows) then C_Witness_WitnessProved else (C_Witness_WitnessMissing (B_dData_dList.C_List_Nil)))
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match (v_ctorHeadsOf rows) with
  | B_dData_dList.C_List_Nil -> (match (((((v_coverageWitness table) dtb__51) B_dData_dMaybe.C_Maybe_Nothing) (v_defaultRows rows)) dtb__54) with
  | C_Witness_WitnessMissing (dtb__55) -> (C_Witness_WitnessMissing ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), dtb__55))))
  | dtb__56 -> dtb__56
)
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match ((v_familyCtors table) dtb__57) with
  | B_dData_dMaybe.C_Maybe_Nothing -> C_Witness_WitnessUnknown
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (((((v_coverageWitness table) dtb__51) (B_dData_dMaybe.C_Maybe_Just (((v_orderedCtors dtb__59) (v_ctorHeadsOf rows))))) rows) dtb__54)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 258 "Vuna/Compiler/Elab/Coverage.vuna"
and v_coverageCtorTries = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc4 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc5 : bool) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (let ar = (B_dData_dPair.v_secondOf dtb__60) in (let deeper = (((((v_coverageWitness mc0) mc1) B_dData_dMaybe.C_Maybe_Nothing) (((v_specializeCtor ar) (B_dData_dPair.v_firstOf dtb__60)) mc3)) ((B_dData_dList.v_append (v_wilds ar)) mc4)) in (match deeper with
  | C_Witness_WitnessMissing (dtb__62) -> (C_Witness_WitnessMissing ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PCon ((B_dData_dPair.v_firstOf dtb__60), ((v_takePats ar) dtb__62), (Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), ((v_dropPats ar) dtb__62)))))
  | C_Witness_WitnessProved -> ((((((v_coverageCtorTries mc0) mc1) dtb__61) mc3) mc4) mc5)
  | C_Witness_WitnessUnknown -> ((((((v_coverageCtorTries mc0) mc1) dtb__61) mc3) mc4) true)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (if mc5 then C_Witness_WitnessUnknown else C_Witness_WitnessProved)
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_clauseCover = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (qs : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__63 = fuel in (if (dtnat__63 = 0) then C_CoverVerdict_CoverUnknown else (let dtb__64 = (dtnat__63 - 1) in (match qs with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow rows) then C_CoverVerdict_CoverProved else C_CoverVerdict_CoverMissing)
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match (v_patHead dtb__65) with
  | Frontend_dAst.C_Pat_PCon (dtb__67, dtb__68, dtb__69) -> ((((v_clauseCover table) dtb__64) (((v_specializeCtor (B_dData_dList.v_length dtb__68)) dtb__67) rows)) ((B_dData_dList.v_append dtb__68) dtb__66))
  | Frontend_dAst.C_Pat_PRecord (dtb__70, dtb__71, dtb__72) -> C_CoverVerdict_CoverUnknown
  | Frontend_dAst.C_Pat_PInt (dtb__73, dtb__74) -> ((((v_clauseCover table) dtb__64) (v_defaultRows rows)) dtb__66)
  | Frontend_dAst.C_Pat_PStr (dtb__75, dtb__76) -> ((((v_clauseCover table) dtb__64) (v_defaultRows rows)) dtb__66)
  | _ -> (match (v_ctorHeadsOf rows) with
  | B_dData_dList.C_List_Nil -> ((((v_clauseCover table) dtb__64) (v_defaultRows rows)) dtb__66)
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (match ((v_familyCtors table) dtb__77) with
  | B_dData_dMaybe.C_Maybe_Nothing -> C_CoverVerdict_CoverUnknown
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> ((((((v_clauseCoverCtorsGo table) dtb__64) ((v_orderedCtors dtb__79) (v_ctorHeadsOf rows))) rows) dtb__66) C_CoverVerdict_CoverProved)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))))
# 337 "Vuna/Compiler/Elab/Coverage.vuna"
and v_clauseCoverCtorsGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc4 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc5 : t_CoverVerdict) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (let ar = (B_dData_dPair.v_secondOf dtb__80) in (match ((((v_clauseCover mc0) mc1) (((v_specializeCtor ar) (B_dData_dPair.v_firstOf dtb__80)) mc3)) ((B_dData_dList.v_append (v_wilds ar)) mc4)) with
  | C_CoverVerdict_CoverMissing -> C_CoverVerdict_CoverMissing
  | C_CoverVerdict_CoverUnknown -> ((((((v_clauseCoverCtorsGo mc0) mc1) dtb__81) mc3) mc4) C_CoverVerdict_CoverUnknown)
  | C_CoverVerdict_CoverProved -> ((((((v_clauseCoverCtorsGo mc0) mc1) dtb__81) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc5
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_filterReachable = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (if ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf dtb__82)) mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__82, ((v_filterReachable mc0) dtb__83))) else ((v_filterReachable mc0) dtb__83))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Coverage.vuna"
let v_clauseCoverRootReach = (fun (ctors : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (reachable : string B_dData_dList.t_List) (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (rows : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (qsRest : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (v_ctorHeadsOf rows) with
  | B_dData_dList.C_List_Nil -> ((((v_clauseCover table) fuel) (v_defaultRows rows)) qsRest)
  | dtb__84 -> (match ((v_filterReachable reachable) ctors) with
  | B_dData_dList.C_List_Nil -> C_CoverVerdict_CoverUnknown
  | dtb__85 -> ((((((v_clauseCoverCtorsGo table) fuel) ((v_orderedCtors dtb__85) dtb__84)) rows) qsRest) C_CoverVerdict_CoverProved)
)
))

# 372 "Vuna/Compiler/Elab/Coverage.vuna"
let v_clauseCoverWith = (fun (mc0 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc4 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (match dtb__86 with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> (let dtnat__89 = mc2 in (if (dtnat__89 = 0) then C_CoverVerdict_CoverUnknown else (let dtb__90 = (dtnat__89 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> ((((v_clauseCover mc1) mc2) mc3) mc4)
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match (v_patHead dtb__91) with
  | Frontend_dAst.C_Pat_PVar (dtb__93, dtb__94) -> ((((((v_clauseCoverRootReach dtb__87) dtb__88) mc1) dtb__90) mc3) dtb__92)
  | Frontend_dAst.C_Pat_PWild (dtb__95) -> ((((((v_clauseCoverRootReach dtb__87) dtb__88) mc1) dtb__90) mc3) dtb__92)
  | _ -> ((((v_clauseCover mc1) mc2) mc3) mc4)
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_clauseCover mc1) mc2) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patNodes = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__96, dtb__97, dtb__98) -> (1 + (v_patNodesFields dtb__97))
  | Frontend_dAst.C_Pat_PAs (dtb__99, dtb__100, dtb__101) -> (1 + (v_patNodes dtb__100))
  | Frontend_dAst.C_Pat_PCon (dtb__102, dtb__103, dtb__104) -> (1 + (v_patNodesList dtb__103))
  | _ -> 1
))
# 393 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesList = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> ((v_patNodes dtb__105) + (v_patNodesList dtb__106))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 397 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesFields = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | { B_dData_dPair.f_Pair_first = dtb__109; B_dData_dPair.f_Pair_second = dtb__110 } -> ((v_patNodes dtb__110) + (v_patNodesFields dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_matrixNodes = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> ((v_patNodesList dtb__111) + (v_matrixNodes dtb__112))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelMax = 1000000

# 406 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelFor = (fun (clauses : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (let scaled = (256 + (4 * (v_matrixNodes clauses))) in (if (scaled > v_coverageFuelMax) then v_coverageFuelMax else scaled)))

# 420 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_allSameLen = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if ((B_dData_dList.v_length dtb__113) = mc0) then ((v_allSameLen mc0) dtb__114) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Coverage.vuna"
let v_uniformArity = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> ((v_allSameLen (B_dData_dList.v_length dtb__115)) dtb__116)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixArity = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (B_dData_dList.v_length dtb__117)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixWitness = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (if (v_uniformArity clauses) then (((((v_coverageWitness table) (bi_natFromInt (v_coverageFuelFor clauses))) B_dData_dMaybe.C_Maybe_Nothing) clauses) (v_wilds (v_matrixArity clauses))) else C_Witness_WitnessUnknown))

# 457 "Vuna/Compiler/Elab/Coverage.vuna"
let v_witnessNamesCtor = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (match (v_patHead dtb__119) with
  | Frontend_dAst.C_Pat_PCon (dtb__121, dtb__122, dtb__123) -> true
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_renderPatIn = (fun (fuel : int) (paren : bool) (p : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then "_" else (match (v_patHead p) with
  | Frontend_dAst.C_Pat_PCon (dtb__124, dtb__125, dtb__126) -> (if ((B_dData_dList.v_length dtb__125) = 0) then dtb__124 else (let body = (String.concat "" [dtb__124; " "; ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn (fuel - 1)) true)) dtb__125))]) in (if paren then (String.concat "" ["("; body; ")"]) else body)))
  | Frontend_dAst.C_Pat_PVar (dtb__127, dtb__128) -> "_"
  | Frontend_dAst.C_Pat_PWild (dtb__129) -> "_"
  | Frontend_dAst.C_Pat_PInt (dtb__130, dtb__131) -> (string_of_int dtb__130)
  | Frontend_dAst.C_Pat_PStr (dtb__132, dtb__133) -> (String.concat "" ["\""; dtb__132; "\""])
  | Frontend_dAst.C_Pat_PRecord (dtb__134, dtb__135, dtb__136) -> (String.concat "" ["{ "; dtb__134; " }"])
  | Frontend_dAst.C_Pat_PAs (dtb__137, dtb__138, dtb__139) -> (((v_renderPatIn (fuel - 1)) paren) dtb__138)
  | _ -> failwith "DT: impossible branch"
)))

# 466 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderPat = (fun (p : Frontend_dAst.t_Pat) -> (((v_renderPatIn 64) false) p))

# 489 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderWitness = (fun (ws : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn 64) true)) ws)))

# 440 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveDiag = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((d).Base_dDiag.f_Diagnostic_diagCode <> "TC_NotExhaustive") then d else (match ((v_matrixWitness table) clauses) with
  | C_Witness_WitnessMissing (dtb__140) -> (if (v_witnessNamesCtor dtb__140) then (let rx = (v_renderWitness dtb__140) in ((Base_dDiag.v_withFallbackSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive (rx))) (B_dData_dVec.C_Vec__x58__x58_ (rx, B_dData_dVec.C_Vec_Nil))))) else d)
  | _ -> d
)))

# 436 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveExhaustive = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (int) -> Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) mc3 -> (match mc3 with
  | Base_dDiag.C_Check_ErrC (dtb__141) -> (Base_dDiag.C_Check_ErrC (((((v_improveDiag mc0) (mc1 0)) mc2) dtb__141)))
  | Base_dDiag.C_Check_OkC (dtb__142) -> (Base_dDiag.C_Check_OkC (dtb__142))
  | _ -> failwith "DT: impossible branch"
))
