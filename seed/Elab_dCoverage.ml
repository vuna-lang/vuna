open Vuna_runtime
type t_ClauseCover = C_ClauseCover_CovUncovered | C_ClauseCover_CovCovered | C_ClauseCover_CovUnknown

# 34 "Vuna/Compiler/Elab/Coverage.vuna"
let v_emptyPatSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 38 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_wilds = (fun (dtb_u_u1 : int) -> (if (dtb_u_u1 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), (v_wilds (dtb_u_u1 - 1))))))

# 42 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patHead = (fun (dtb_u_u2 : Frontend_dAst.t_Pat) -> (match dtb_u_u2 with
  | Frontend_dAst.C_Pat_PAs (dtb_u_u3, dtb_u_u4, dtb_u_u5) -> (v_patHead dtb_u_u4)
  | _ -> dtb_u_u2
))

# 46 "Vuna/Compiler/Elab/Coverage.vuna"
let v_headCtorName = (fun (dtb_u_u6 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u6 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u7, dtb_u_u8) -> (match (v_patHead dtb_u_u7) with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u9, dtb_u_u10, dtb_u_u11) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u9))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Coverage.vuna"
let v_ctorHeadsOf = (fun (dtb_u_u12 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (B_dData_dList.v_nubNames ((B_dData_dList.v_mapMaybe v_headCtorName) dtb_u_u12)))

# 58 "Vuna/Compiler/Elab/Coverage.vuna"
let v_isWildHead = (fun (dtb_u_u13 : Frontend_dAst.t_Pat) -> (match (v_patHead dtb_u_u13) with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u14, dtb_u_u15) -> true
  | Frontend_dAst.C_Pat_PWild (dtb_u_u16) -> true
  | _ -> false
))

# 66 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_defaultRows = (fun (dtb_u_u17 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u17 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u19) -> (match dtb_u_u18 with
  | B_dData_dList.C_List_Nil -> (v_defaultRows dtb_u_u19)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (if (v_isWildHead dtb_u_u20) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u21, (v_defaultRows dtb_u_u19))) else (v_defaultRows dtb_u_u19))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_concatMapRow = (fun (dtb_u_u22 : (Frontend_dAst.t_Pat B_dData_dList.t_List) -> Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u23 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> ((B_dData_dList.v_append (dtb_u_u22 dtb_u_u24)) ((v_concatMapRow dtb_u_u22) dtb_u_u25))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializeRow = (fun (dtb_u_u26 : int) (dtb_u_u27 : string) (dtb_u_u28 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (match (v_patHead dtb_u_u29) with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u31, dtb_u_u32, dtb_u_u33) -> (if (dtb_u_u31 = dtb_u_u27) then (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append dtb_u_u32) dtb_u_u30), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u34, dtb_u_u35) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append (v_wilds dtb_u_u26)) dtb_u_u30), B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u36) -> (B_dData_dList.C_List__x58__x58_ (((B_dData_dList.v_append (v_wilds dtb_u_u26)) dtb_u_u30), B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/Coverage.vuna"
let v_specializeCtor = (fun (dtb_u_u37 : int) (dtb_u_u38 : string) (dtb_u_u39 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> ((v_concatMapRow ((v_specializeRow dtb_u_u37) dtb_u_u38)) dtb_u_u39))

# 90 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasNilRow = (fun (dtb_u_u40 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u40 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u41, dtb_u_u42) -> (match dtb_u_u41 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_hasNilRow dtb_u_u42)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_lookupEntry = (fun (dtb_u_u43 : string) (dtb_u_u44 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u44 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u45, dtb_u_u46) -> (match dtb_u_u45 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u47; B_dData_dPair.f_Pair_second = dtb_u_u48 } -> (if (dtb_u_u47 = dtb_u_u43) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u48)) else ((v_lookupEntry dtb_u_u43) dtb_u_u46))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyCtors = (fun (dtb_u_u49 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u50 : string) -> (let dtb_u_u51 = ((B_dData_dList.v_filter (fun (dtb_u_u54 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x47__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt)) ((v_lookupEntry dtb_u_u50) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u54)))) B_dData_dMaybe.C_Maybe_Nothing))) dtb_u_u49) in (match dtb_u_u51 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u52, dtb_u_u53) -> (match dtb_u_u53 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u52)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u52)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 122 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_hasShortCtor = (fun (dtb_u_u55 : string) (dtb_u_u56 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u56 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u57, dtb_u_u58) -> (match dtb_u_u57 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u59; B_dData_dPair.f_Pair_second = dtb_u_u60 } -> (if ((Frontend_dAst.v_ctorShortName dtb_u_u59) = dtb_u_u55) then true else ((v_hasShortCtor dtb_u_u55) dtb_u_u58))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_anyShortCtor = (fun (dtb_u_u61 : string B_dData_dList.t_List) (dtb_u_u62 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u61 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u63, dtb_u_u64) -> (if ((v_hasShortCtor dtb_u_u63) dtb_u_u62) then true else ((v_anyShortCtor dtb_u_u64) dtb_u_u62))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Coverage.vuna"
let v_familyOfShortCtors = (fun (dtb_u_u65 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u66 : string B_dData_dList.t_List) -> (let dtb_u_u67 = ((B_dData_dList.v_filter (fun (dtb_u_u70 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((v_anyShortCtor dtb_u_u66) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u70))))) dtb_u_u65) in (match dtb_u_u67 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u68, dtb_u_u69) -> (match dtb_u_u69 with
  | B_dData_dList.C_List_Nil -> (if (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u68)) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u68)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 134 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_findShortCtor = (fun (dtb_u_u71 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u72 : string B_dData_dList.t_List) -> (match dtb_u_u71 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u73, dtb_u_u74) -> (if ((B_dData_dList.v_memName (Frontend_dAst.v_ctorShortName (B_dData_dPair.v_firstOf dtb_u_u73))) dtb_u_u72) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb_u_u73))) else ((v_findShortCtor dtb_u_u74) dtb_u_u72))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Coverage.vuna"
let v_sentinelCtorIn = (fun (dtb_u_u75 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u76 : string) -> (let dtb_u_u77 = (Frontend_dReserved.v_classify dtb_u_u76) in (match dtb_u_u77 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u78) -> (match dtb_u_u78 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((v_findShortCtor dtb_u_u75) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil)))))
  | Frontend_dReserved.C_Reserved_RsListNil -> ((v_findShortCtor dtb_u_u75) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u76))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u76))
)))

# 140 "Vuna/Compiler/Elab/Coverage.vuna"
let v_orderedCtors = (fun (dtb_u_u79 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u80 : string B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_filter (fun (dtb_u_u81 : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf dtb_u_u81)) dtb_u_u80)))) dtb_u_u79)) ((B_dData_dList.v_filter (fun (dtb_u_u82 : (string, int) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf dtb_u_u82)) dtb_u_u80))) dtb_u_u79)))

# 146 "Vuna/Compiler/Elab/Coverage.vuna"
let[@tail_mod_cons] rec v_takePats = (fun (dtb_u_u83 : int) (dtb_u_u84 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (dtb_u_u83 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u84 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u85, dtb_u_u86) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u85, ((v_takePats (dtb_u_u83 - 1)) dtb_u_u86)))
  | _ -> failwith "DT: impossible branch"
)))

# 155 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_dropPats = (fun (dtb_u_u87 : int) (dtb_u_u88 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (dtb_u_u87 <= 0) then dtb_u_u88 else (match dtb_u_u88 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u89, dtb_u_u90) -> ((v_dropPats (dtb_u_u87 - 1)) dtb_u_u90)
  | _ -> failwith "DT: impossible branch"
)))

# 170 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_coverageWitness = (fun (dtb_u_u91 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u92 : int) (dtb_u_u93 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u94 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u95 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__48 = dtb_u_u92 in (if (dtnat__48 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u96 = (dtnat__48 - 1) in (match dtb_u_u93 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u97) -> (match dtb_u_u97 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (let dtb_u_u100 = (B_dData_dPair.v_secondOf dtb_u_u98) in (let dtb_u_u101 = (((v_specializeCtor dtb_u_u100) (B_dData_dPair.v_firstOf dtb_u_u98)) dtb_u_u94) in (let dtb_u_u102 = (((((v_coverageWitness dtb_u_u91) dtb_u_u96) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u101) ((B_dData_dList.v_append (v_wilds dtb_u_u100)) dtb_u_u95)) in (match dtb_u_u102 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_coverageWitness dtb_u_u91) dtb_u_u96) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u99))) dtb_u_u94) dtb_u_u95)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u103) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PCon ((B_dData_dPair.v_firstOf dtb_u_u98), ((v_takePats dtb_u_u100) dtb_u_u103), (Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), ((v_dropPats dtb_u_u100) dtb_u_u103)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u95 with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow dtb_u_u94) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (let dtb_u_u106 = (v_ctorHeadsOf dtb_u_u94) in (match dtb_u_u106 with
  | B_dData_dList.C_List_Nil -> (match (((((v_coverageWitness dtb_u_u91) dtb_u_u96) B_dData_dMaybe.C_Maybe_Nothing) (v_defaultRows dtb_u_u94)) dtb_u_u105) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef v_emptyPatSpan))), dtb_u_u107))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109) -> (match ((v_familyCtors dtb_u_u91) dtb_u_u108) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u110) -> (((((v_coverageWitness dtb_u_u91) dtb_u_u96) (B_dData_dMaybe.C_Maybe_Just (((v_orderedCtors dtb_u_u110) dtb_u_u106)))) dtb_u_u94) dtb_u_u105)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 231 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_clauseCover = (fun (dtb_u_u111 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u112 : int) (dtb_u_u113 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u114 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__60 = dtb_u_u112 in (if (dtnat__60 = 0) then C_ClauseCover_CovUnknown else (let dtb_u_u115 = (dtnat__60 - 1) in (match dtb_u_u114 with
  | B_dData_dList.C_List_Nil -> (if (v_hasNilRow dtb_u_u113) then C_ClauseCover_CovCovered else C_ClauseCover_CovUncovered)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u116, dtb_u_u117) -> (match (v_patHead dtb_u_u116) with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u118, dtb_u_u119, dtb_u_u120) -> ((((v_clauseCover dtb_u_u111) dtb_u_u115) (((v_specializeCtor (B_dData_dList.v_length dtb_u_u119)) dtb_u_u118) dtb_u_u113)) ((B_dData_dList.v_append dtb_u_u119) dtb_u_u117))
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u121, dtb_u_u122, dtb_u_u123) -> C_ClauseCover_CovUnknown
  | Frontend_dAst.C_Pat_PInt (dtb_u_u124, dtb_u_u125) -> ((((v_clauseCover dtb_u_u111) dtb_u_u115) (v_defaultRows dtb_u_u113)) dtb_u_u117)
  | Frontend_dAst.C_Pat_PStr (dtb_u_u126, dtb_u_u127) -> ((((v_clauseCover dtb_u_u111) dtb_u_u115) (v_defaultRows dtb_u_u113)) dtb_u_u117)
  | _ -> (match (v_ctorHeadsOf dtb_u_u113) with
  | B_dData_dList.C_List_Nil -> ((((v_clauseCover dtb_u_u111) dtb_u_u115) (v_defaultRows dtb_u_u113)) dtb_u_u117)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u128, dtb_u_u129) -> (match ((v_familyCtors dtb_u_u111) dtb_u_u128) with
  | B_dData_dMaybe.C_Maybe_Nothing -> C_ClauseCover_CovUnknown
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u130) -> ((((((v_clauseCoverCtorsGo dtb_u_u111) dtb_u_u115) ((v_orderedCtors dtb_u_u130) (v_ctorHeadsOf dtb_u_u113))) dtb_u_u113) dtb_u_u117) C_ClauseCover_CovCovered)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))))
# 271 "Vuna/Compiler/Elab/Coverage.vuna"
and v_clauseCoverCtorsGo = (fun (dtb_u_u131 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u132 : int) (dtb_u_u133 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u134 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u135 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u136 : t_ClauseCover) -> (match dtb_u_u133 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u137, dtb_u_u138) -> (let dtb_u_u139 = (B_dData_dPair.v_secondOf dtb_u_u137) in (match ((((v_clauseCover dtb_u_u131) dtb_u_u132) (((v_specializeCtor dtb_u_u139) (B_dData_dPair.v_firstOf dtb_u_u137)) dtb_u_u134)) ((B_dData_dList.v_append (v_wilds dtb_u_u139)) dtb_u_u135)) with
  | C_ClauseCover_CovUncovered -> C_ClauseCover_CovUncovered
  | C_ClauseCover_CovUnknown -> ((((((v_clauseCoverCtorsGo dtb_u_u131) dtb_u_u132) dtb_u_u138) dtb_u_u134) dtb_u_u135) C_ClauseCover_CovUnknown)
  | C_ClauseCover_CovCovered -> ((((((v_clauseCoverCtorsGo dtb_u_u131) dtb_u_u132) dtb_u_u138) dtb_u_u134) dtb_u_u135) dtb_u_u136)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> dtb_u_u136
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_patNodes = (fun (dtb_u_u140 : Frontend_dAst.t_Pat) -> (match dtb_u_u140 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u141, dtb_u_u142, dtb_u_u143) -> (1 + (v_patNodesFields dtb_u_u142))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u144, dtb_u_u145, dtb_u_u146) -> (1 + (v_patNodes dtb_u_u145))
  | Frontend_dAst.C_Pat_PCon (dtb_u_u147, dtb_u_u148, dtb_u_u149) -> (1 + (v_patNodesList dtb_u_u148))
  | _ -> 1
))
# 288 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesList = (fun (dtb_u_u150 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u151, dtb_u_u152) -> ((v_patNodes dtb_u_u151) + (v_patNodesList dtb_u_u152))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 292 "Vuna/Compiler/Elab/Coverage.vuna"
and v_patNodesFields = (fun (dtb_u_u153 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u153 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (match dtb_u_u154 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u156; B_dData_dPair.f_Pair_second = dtb_u_u157 } -> ((v_patNodes dtb_u_u157) + (v_patNodesFields dtb_u_u155))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_matrixNodes = (fun (dtb_u_u158 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u158 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u159, dtb_u_u160) -> ((v_patNodesList dtb_u_u159) + (v_matrixNodes dtb_u_u160))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelMax = 1000000

# 301 "Vuna/Compiler/Elab/Coverage.vuna"
let v_coverageFuelFor = (fun (dtb_u_u161 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (let dtb_u_u162 = (256 + (4 * (v_matrixNodes dtb_u_u161))) in (if (dtb_u_u162 > v_coverageFuelMax) then v_coverageFuelMax else dtb_u_u162)))

# 315 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_allSameLen = (fun (dtb_u_u163 : int) (dtb_u_u164 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u164 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u165, dtb_u_u166) -> (if ((B_dData_dList.v_length dtb_u_u165) = dtb_u_u163) then ((v_allSameLen dtb_u_u163) dtb_u_u166) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Elab/Coverage.vuna"
let v_uniformArity = (fun (dtb_u_u167 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u167 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u168, dtb_u_u169) -> ((v_allSameLen (B_dData_dList.v_length dtb_u_u168)) dtb_u_u169)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixArity = (fun (dtb_u_u170 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u170 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u171, dtb_u_u172) -> (B_dData_dList.v_length dtb_u_u171)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Elab/Coverage.vuna"
let v_matrixWitness = (fun (dtb_u_u173 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u174 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) -> (if (v_uniformArity dtb_u_u174) then (((((v_coverageWitness dtb_u_u173) (bi_natFromInt (v_coverageFuelFor dtb_u_u174))) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u174) (v_wilds (v_matrixArity dtb_u_u174))) else B_dData_dMaybe.C_Maybe_Nothing))

# 352 "Vuna/Compiler/Elab/Coverage.vuna"
let v_witnessNamesCtor = (fun (dtb_u_u175 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u175 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u176, dtb_u_u177) -> (match (v_patHead dtb_u_u176) with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u178, dtb_u_u179, dtb_u_u180) -> true
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_renderPatIn = (fun (dtb_u_u181 : int) (dtb_u_u182 : bool) (dtb_u_u183 : Frontend_dAst.t_Pat) -> (if (dtb_u_u181 <= 0) then "_" else (match (v_patHead dtb_u_u183) with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u184, dtb_u_u185, dtb_u_u186) -> (if ((B_dData_dList.v_length dtb_u_u185) = 0) then dtb_u_u184 else (let dtb_u_u187 = (String.concat "" [dtb_u_u184; " "; ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn (dtb_u_u181 - 1)) true)) dtb_u_u185))]) in (if dtb_u_u182 then (String.concat "" ["("; dtb_u_u187; ")"]) else dtb_u_u187)))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u188, dtb_u_u189) -> "_"
  | Frontend_dAst.C_Pat_PWild (dtb_u_u190) -> "_"
  | Frontend_dAst.C_Pat_PInt (dtb_u_u191, dtb_u_u192) -> (string_of_int dtb_u_u191)
  | Frontend_dAst.C_Pat_PStr (dtb_u_u193, dtb_u_u194) -> (String.concat "" ["\""; dtb_u_u193; "\""])
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u195, dtb_u_u196, dtb_u_u197) -> (String.concat "" ["{ "; dtb_u_u195; " }"])
  | Frontend_dAst.C_Pat_PAs (dtb_u_u198, dtb_u_u199, dtb_u_u200) -> (((v_renderPatIn (dtb_u_u181 - 1)) dtb_u_u182) dtb_u_u199)
  | _ -> failwith "DT: impossible branch"
)))

# 361 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderPat = (fun (dtb_u_u201 : Frontend_dAst.t_Pat) -> (((v_renderPatIn 64) false) dtb_u_u201))

# 384 "Vuna/Compiler/Elab/Coverage.vuna"
let v_renderWitness = (fun (dtb_u_u202 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dString.v_join " ") ((B_dData_dList.v_map ((v_renderPatIn 64) true)) dtb_u_u202)))

# 335 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveDiag = (fun (dtb_u_u203 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u204 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u205 : Base_dSource.t_Span) (dtb_u_u206 : Base_dDiag.t_Diagnostic) -> (if ((dtb_u_u206).Base_dDiag.f_Diagnostic_diagCode <> "TC_NotExhaustive") then dtb_u_u206 else (match ((v_matrixWitness dtb_u_u203) dtb_u_u204) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u207) -> (if (v_witnessNamesCtor dtb_u_u207) then (let dtb_u_u208 = (v_renderWitness dtb_u_u207) in ((Base_dDiag.v_withFallbackSpan dtb_u_u205) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive (dtb_u_u208))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u208, B_dData_dVec.C_Vec_Nil))))) else dtb_u_u206)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u206
  | _ -> failwith "DT: impossible branch"
)))

# 331 "Vuna/Compiler/Elab/Coverage.vuna"
let v_improveExhaustive = (fun (dtb_u_u210 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u211 : (int) -> Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u212 : Base_dSource.t_Span) dtb_u_u213 -> (match dtb_u_u213 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u214) -> (Base_dDiag.C_Check_ErrC (((((v_improveDiag dtb_u_u210) (dtb_u_u211 0)) dtb_u_u212) dtb_u_u214)))
  | Base_dDiag.C_Check_OkC (dtb_u_u215) -> (Base_dDiag.C_Check_OkC (dtb_u_u215))
  | _ -> failwith "DT: impossible branch"
))
