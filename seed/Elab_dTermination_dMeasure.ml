open Vuna_runtime
type t_Forwarder = { f_Forwarder_fwdCallee : string; f_Forwarder_fwdCbParam : int; f_Forwarder_fwdArgParams : int B_dData_dList.t_List }
and t_HofSpec = { f_HofSpec_hofLambdaArity : int; f_HofSpec_hofElemParam : int; f_HofSpec_hofListArg : int }
and t_HofCall = { f_HofCall_hofElemBinder : string; f_HofCall_hofListExpr : Frontend_dAst.t_Expr; f_HofCall_hofSideArgs : Frontend_dAst.t_Expr B_dData_dList.t_List; f_HofCall_hofBody : Frontend_dAst.t_Expr }

# 13 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_maxInt = (fun (dtb_u_u1 : int) (dtb_u_u2 : int) -> (if (dtb_u_u1 >= dtb_u_u2) then dtb_u_u1 else dtb_u_u2))

# 16 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_notEmpty = (fun dtb_u_u4 -> (match dtb_u_u4 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> true
))

# 20 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_allEqTo = (fun (dtb_u_u5 : int) (dtb_u_u6 : int B_dData_dList.t_List) -> (match dtb_u_u6 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u7, dtb_u_u8) -> (if (dtb_u_u5 = dtb_u_u7) then ((v_allEqTo dtb_u_u5) dtb_u_u8) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_allSame = (fun (dtb_u_u9 : int B_dData_dList.t_List) -> (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> ((v_allEqTo dtb_u_u10) dtb_u_u11)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_dedup = (fun (dtb_u_u12 : string B_dData_dList.t_List) -> (B_dData_dList.v_nubNames dtb_u_u12))

# 32 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_joinComma = (fun (dtb_u_u13 : string B_dData_dList.t_List) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u15 with
  | B_dData_dList.C_List_Nil -> dtb_u_u14
  | _ -> (String.concat "" [dtb_u_u14; ", "; (v_joinComma dtb_u_u15)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posHas = (fun (dtb_u_u16 : string) (dtb_u_u17 : int) (dtb_u_u18 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u18 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> (match dtb_u_u19 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u21; B_dData_dPair.f_Pair_second = dtb_u_u22 } -> (if (dtb_u_u16 = dtb_u_u21) then (if (dtb_u_u17 = dtb_u_u22) then true else (((v_posHas dtb_u_u16) dtb_u_u17) dtb_u_u20)) else (((v_posHas dtb_u_u16) dtb_u_u17) dtb_u_u20))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posTblOfGo = (fun (dtb_u_u23 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u24 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u25, dtb_u_u26) -> (match dtb_u_u25 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u27; B_dData_dPair.f_Pair_second = dtb_u_u28 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u27) dtb_u_u24) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u29) -> ((v_posTblOfGo dtb_u_u26) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u27) (B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29))) dtb_u_u24))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_posTblOfGo dtb_u_u26) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u27) (B_dData_dList.C_List__x58__x58_ (dtb_u_u28, B_dData_dList.C_List_Nil))) dtb_u_u24))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u24
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblOf = (fun (dtb_u_u30 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_posTblOfGo dtb_u_u30) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 61 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_memInt = (fun (dtb_u_u31 : int) (dtb_u_u32 : int B_dData_dList.t_List) -> (match dtb_u_u32 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u33, dtb_u_u34) -> (if (dtb_u_u31 = dtb_u_u33) then true else ((v_memInt dtb_u_u31) dtb_u_u34))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posHasTbl = (fun (dtb_u_u35 : string) (dtb_u_u36 : int) (dtb_u_u37 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u35) dtb_u_u37) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u38) -> ((v_memInt dtb_u_u36) dtb_u_u38)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posAdd = (fun (dtb_u_u39 : string) (dtb_u_u40 : int) (dtb_u_u41 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (((v_posHas dtb_u_u39) dtb_u_u40) dtb_u_u41) then dtb_u_u41 else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u39; B_dData_dPair.f_Pair_second = dtb_u_u40 }, dtb_u_u41))))

# 68 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posSubset = (fun (dtb_u_u42 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u43 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u42 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u44, dtb_u_u45) -> (match dtb_u_u44 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u46; B_dData_dPair.f_Pair_second = dtb_u_u47 } -> (if (((v_posHas dtb_u_u46) dtb_u_u47) dtb_u_u43) then ((v_posSubset dtb_u_u45) dtb_u_u43) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posSetEq = (fun (dtb_u_u48 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u49 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length dtb_u_u48) = (B_dData_dList.v_length dtb_u_u49)) then ((v_posSubset dtb_u_u48) dtb_u_u49) else false))

# 75 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_posFilter = (fun (dtb_u_u50 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u51 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u50 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u52, dtb_u_u53) -> (match dtb_u_u52 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u54; B_dData_dPair.f_Pair_second = dtb_u_u55 } -> (if (((v_posHas dtb_u_u54) dtb_u_u55) dtb_u_u51) then ((v_posFilter dtb_u_u53) dtb_u_u51) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u54; B_dData_dPair.f_Pair_second = dtb_u_u55 }, ((v_posFilter dtb_u_u53) dtb_u_u51))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posUnion = (fun (dtb_u_u56 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u57 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u56 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u58, dtb_u_u59) -> (match dtb_u_u58 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u60; B_dData_dPair.f_Pair_second = dtb_u_u61 } -> ((v_posUnion dtb_u_u59) (((v_posAdd dtb_u_u60) dtb_u_u61) dtb_u_u57))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u57
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_posFilterTbl = (fun (dtb_u_u62 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u63 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u62 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (match dtb_u_u64 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u66; B_dData_dPair.f_Pair_second = dtb_u_u67 } -> (if (((v_posHasTbl dtb_u_u66) dtb_u_u67) dtb_u_u63) then ((v_posFilterTbl dtb_u_u65) dtb_u_u63) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u66; B_dData_dPair.f_Pair_second = dtb_u_u67 }, ((v_posFilterTbl dtb_u_u65) dtb_u_u63))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posSubsetTbl = (fun (dtb_u_u68 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u69 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u68 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u70, dtb_u_u71) -> (match dtb_u_u70 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u72; B_dData_dPair.f_Pair_second = dtb_u_u73 } -> (if (((v_posHasTbl dtb_u_u72) dtb_u_u73) dtb_u_u69) then ((v_posSubsetTbl dtb_u_u71) dtb_u_u69) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posSetEqTbl = (fun (dtb_u_u74 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u75 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((B_dData_dList.v_length dtb_u_u74) = (B_dData_dList.v_length dtb_u_u75)) then ((v_posSubsetTbl dtb_u_u74) (v_posTblOf dtb_u_u75)) else false) then ((v_posSubsetTbl dtb_u_u75) (v_posTblOf dtb_u_u74)) else false))

# 99 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posUnionTbl = (fun (dtb_u_u76 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u77 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_append dtb_u_u77) ((v_posFilterTbl dtb_u_u76) (v_posTblOf dtb_u_u77))))

# 102 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_funDeclsOf = (fun (dtb_u_u78 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u78 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u79, dtb_u_u80) -> (match dtb_u_u79 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u81, dtb_u_u82, dtb_u_u83, dtb_u_u84) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u81; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u82; B_dData_dPair.f_Pair_second = dtb_u_u83 } }, (v_funDeclsOf dtb_u_u80)))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u85, dtb_u_u86, dtb_u_u87, dtb_u_u88) -> ((B_dData_dList.v_append (v_funDeclsOf dtb_u_u87)) (v_funDeclsOf dtb_u_u80))
  | _ -> (v_funDeclsOf dtb_u_u80)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lookupGroup = (fun (dtb_u_u89 : string) (dtb_u_u90 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u90 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (match dtb_u_u91 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u93; B_dData_dPair.f_Pair_second = dtb_u_u94 } -> (if (dtb_u_u93 = dtb_u_u89) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u94)) else ((v_lookupGroup dtb_u_u89) dtb_u_u92))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_replaceGroup = (fun (dtb_u_u95 : string) (dtb_u_u96 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u97 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u97 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (match dtb_u_u98 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u100; B_dData_dPair.f_Pair_second = dtb_u_u101 } -> (if (dtb_u_u100 = dtb_u_u95) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u100; B_dData_dPair.f_Pair_second = dtb_u_u96 }, dtb_u_u99)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u100; B_dData_dPair.f_Pair_second = dtb_u_u101 }, (((v_replaceGroup dtb_u_u95) dtb_u_u96) dtb_u_u99))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_groupDefsGo = (fun (dtb_u_u102 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u103 : string B_dData_dList.t_List) (dtb_u_u104 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u104 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (match dtb_u_u105 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u107; B_dData_dPair.f_Pair_second = dtb_u_u108 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u107) dtb_u_u102) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u109) -> (((v_groupDefsGo (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u107) (B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109))) dtb_u_u102)) dtb_u_u103) dtb_u_u106)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_groupDefsGo (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u107) (B_dData_dList.C_List__x58__x58_ (dtb_u_u108, B_dData_dList.C_List_Nil))) dtb_u_u102)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u107, dtb_u_u103))) dtb_u_u106)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u102; B_dData_dPair.f_Pair_second = dtb_u_u103 }
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupDefs = (fun (dtb_u_u110 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u111 = (((v_groupDefsGo (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) (v_funDeclsOf dtb_u_u110)) in (let dtb_u_u112 = (B_dData_dPair.v_firstOf dtb_u_u111) in (let dtb_u_u113 = (B_dData_dPair.v_secondOf dtb_u_u111) in ((B_dData_dList.v_map (fun (dtb_u_u114 : string) -> (let dtb_u_u115 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u114) dtb_u_u112) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u116) -> (B_dData_dList.v_reverse dtb_u_u116)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in { B_dData_dPair.f_Pair_first = dtb_u_u114; B_dData_dPair.f_Pair_second = dtb_u_u115 }))) (B_dData_dList.v_reverse dtb_u_u113))))))

# 145 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_defNames = (fun (dtb_u_u117 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u117))

# 158 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_pvarParamsOf = (fun (dtb_u_u118 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u118 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u119, dtb_u_u120) -> (match dtb_u_u119 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u121, dtb_u_u122) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u121, (v_pvarParamsOf dtb_u_u120)))
  | _ -> B_dData_dList.C_List_Nil
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_paramPositionOf = (fun (dtb_u_u123 : string) (dtb_u_u124 : string B_dData_dList.t_List) -> (match dtb_u_u124 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u125, dtb_u_u126) -> (if (dtb_u_u123 = dtb_u_u125) then (B_dData_dMaybe.C_Maybe_Just (0)) else (match ((v_paramPositionOf dtb_u_u123) dtb_u_u126) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u127) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u127 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_argParamIndices = (fun (dtb_u_u128 : string B_dData_dList.t_List) (dtb_u_u129 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u129 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u130, dtb_u_u131) -> (match dtb_u_u130 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u132, dtb_u_u133) -> (match ((v_paramPositionOf dtb_u_u132) dtb_u_u128) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u134) -> (match ((v_argParamIndices dtb_u_u128) dtb_u_u131) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u135) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u134, dtb_u_u135))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwarderOfClause = (fun (dtb_u_u136 : string) (dtb_u_u137 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u137 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u138; B_dData_dPair.f_Pair_second = dtb_u_u139 } -> (let dtb_u_u140 = (v_pvarParamsOf dtb_u_u138) in (if ((B_dData_dList.v_length dtb_u_u140) = (B_dData_dList.v_length dtb_u_u138)) then (let dtb_u_u141 = dtb_u_u139 in (match dtb_u_u141 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u142, dtb_u_u143, dtb_u_u144) -> (match dtb_u_u142 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u145, dtb_u_u146) -> (match ((v_paramPositionOf dtb_u_u145) dtb_u_u140) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u147) -> (match ((v_argParamIndices dtb_u_u140) dtb_u_u143) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u148) -> (B_dData_dMaybe.C_Maybe_Just ({ f_Forwarder_fwdCallee = dtb_u_u136; f_Forwarder_fwdCbParam = dtb_u_u147; f_Forwarder_fwdArgParams = dtb_u_u148 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sameIntLists = (fun (dtb_u_u149 : int B_dData_dList.t_List) (dtb_u_u150 : int B_dData_dList.t_List) -> (match dtb_u_u149 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u151, dtb_u_u152) -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u153, dtb_u_u154) -> (if (dtb_u_u151 = dtb_u_u153) then ((v_sameIntLists dtb_u_u152) dtb_u_u154) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u150 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_sameForwarder = (fun (dtb_u_u155 : t_Forwarder) (dtb_u_u156 : t_Forwarder) -> (if ((dtb_u_u155).f_Forwarder_fwdCbParam = (dtb_u_u156).f_Forwarder_fwdCbParam) then ((v_sameIntLists (dtb_u_u155).f_Forwarder_fwdArgParams) (dtb_u_u156).f_Forwarder_fwdArgParams) else false))

# 213 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_matchForwarders = (fun (dtb_u_u157 : t_Forwarder) (dtb_u_u158 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u158 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u159, dtb_u_u160) -> (match ((v_forwarderOfClause (dtb_u_u157).f_Forwarder_fwdCallee) dtb_u_u159) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u161) -> (if ((v_sameForwarder dtb_u_u157) dtb_u_u161) then ((v_matchForwarders dtb_u_u157) dtb_u_u160) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwarderOfGroup = (fun (dtb_u_u162 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u162 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u163; B_dData_dPair.f_Pair_second = dtb_u_u164 } -> (match dtb_u_u164 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u165, dtb_u_u166) -> (match ((v_forwarderOfClause dtb_u_u163) dtb_u_u165) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u167) -> (if ((v_matchForwarders dtb_u_u167) dtb_u_u166) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u167)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_forwardersOfDefs = (fun (dtb_u_u168 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u168 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u169, dtb_u_u170) -> (match (v_forwarderOfGroup dtb_u_u169) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u171) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u171, (v_forwardersOfDefs dtb_u_u170)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_forwardersOfDefs dtb_u_u170)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_forwardersOf = (fun (dtb_u_u172 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_forwardersOfDefs (v_groupDefs dtb_u_u172)))

# 237 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lookupForwarder = (fun (dtb_u_u173 : string) (dtb_u_u174 : t_Forwarder B_dData_dList.t_List) -> (match dtb_u_u174 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u175, dtb_u_u176) -> (if ((dtb_u_u175).f_Forwarder_fwdCallee = dtb_u_u173) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u175)) else ((v_lookupForwarder dtb_u_u173) dtb_u_u176))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sumF = (fun (dtb_u_u177 : int B_dData_dList.t_List) -> (match dtb_u_u177 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u178, dtb_u_u179) -> (dtb_u_u178 + (v_sumF dtb_u_u179))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_declFuel = (fun (dtb_u_u180 : Frontend_dAst.t_Decl) -> (match dtb_u_u180 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u181, dtb_u_u182, dtb_u_u183, dtb_u_u184) -> (64 + (v_sumF ((B_dData_dList.v_map v_declFuel) dtb_u_u183)))
  | Frontend_dAst.C_Decl_DFun (dtb_u_u185, dtb_u_u186, dtb_u_u187, dtb_u_u188) -> ((Frontend_dAstQuery.v_exprBudget 64) dtb_u_u187)
  | _ -> 0
))

# 374 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_clausesOfDef = (fun (dtb_u_u189 : string) (dtb_u_u190 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u190 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u191, dtb_u_u192) -> (match dtb_u_u191 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u193; B_dData_dPair.f_Pair_second = dtb_u_u194 } -> (if (dtb_u_u193 = dtb_u_u189) then dtb_u_u194 else ((v_clausesOfDef dtb_u_u189) dtb_u_u192))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_clausesOfDefTbl = (fun (dtb_u_u195 : string) (dtb_u_u196 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u195) dtb_u_u196) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u197) -> dtb_u_u197
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_defArity = (fun (dtb_u_u198 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u198 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u199, dtb_u_u200) -> ((v_maxInt (B_dData_dList.v_length (B_dData_dPair.v_firstOf dtb_u_u199))) (v_defArity dtb_u_u200))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_maxArityOf = (fun (dtb_u_u201 : string B_dData_dList.t_List) (dtb_u_u202 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u201 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u203, dtb_u_u204) -> ((v_maxInt (v_defArity ((v_clausesOfDefTbl dtb_u_u203) dtb_u_u202))) ((v_maxArityOf dtb_u_u204) dtb_u_u202))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_ctorNameOf = (fun (dtb_u_u205 : Frontend_dAst.t_Ctor) -> (match dtb_u_u205 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u206; Frontend_dAst.f_Ctor_ctorType = dtb_u_u207; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u208; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u209 } -> dtb_u_u206
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_ctorNamesOf = (fun (dtb_u_u210 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u210 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u211, dtb_u_u212) -> (match dtb_u_u211 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u213, dtb_u_u214, dtb_u_u215, dtb_u_u216, dtb_u_u217, dtb_u_u218, dtb_u_u219, dtb_u_u220, dtb_u_u221) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_ctorNameOf) dtb_u_u216)) (v_ctorNamesOf dtb_u_u212))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u222, dtb_u_u223, dtb_u_u224, dtb_u_u225, dtb_u_u226, dtb_u_u227, dtb_u_u228, dtb_u_u229) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u222, (v_ctorNamesOf dtb_u_u212)))
  | _ -> (v_ctorNamesOf dtb_u_u212)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_patSizeStrict = (fun (dtb_u_u230 : Frontend_dAst.t_Pat) (dtb_u_u231 : int) (dtb_u_u232 : int B_dData_dList.t_List) (dtb_u_u233 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u230 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u234, dtb_u_u235, dtb_u_u236) -> (((((v_fieldsSizeStrict dtb_u_u235) dtb_u_u231) dtb_u_u232) 0) dtb_u_u233)
  | Frontend_dAst.C_Pat_PCon (dtb_u_u237, dtb_u_u238, dtb_u_u239) -> (((((v_patsSizeStrict dtb_u_u238) dtb_u_u231) dtb_u_u232) 0) dtb_u_u233)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u240) -> dtb_u_u233
  | Frontend_dAst.C_Pat_PVar (dtb_u_u241, dtb_u_u242) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u241; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u231; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length dtb_u_u232); B_dData_dPair.f_Pair_second = dtb_u_u232 } } }, dtb_u_u233))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u243, dtb_u_u244, dtb_u_u245) -> ((((v_patSizeStrict dtb_u_u244) dtb_u_u231) dtb_u_u232) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u243; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u231; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_length dtb_u_u232); B_dData_dPair.f_Pair_second = dtb_u_u232 } } }, dtb_u_u233)))
  | _ -> dtb_u_u233
))
# 415 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_patsSizeStrict = (fun (dtb_u_u246 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u247 : int) (dtb_u_u248 : int B_dData_dList.t_List) (dtb_u_u249 : int) (dtb_u_u250 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u246 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u251, dtb_u_u252) -> (((((v_patsSizeStrict dtb_u_u252) dtb_u_u247) dtb_u_u248) (dtb_u_u249 + 1)) ((((v_patSizeStrict dtb_u_u251) dtb_u_u247) ((B_dData_dList.v_append dtb_u_u248) (B_dData_dList.C_List__x58__x58_ (dtb_u_u249, B_dData_dList.C_List_Nil)))) dtb_u_u250))
  | B_dData_dList.C_List_Nil -> dtb_u_u250
  | _ -> failwith "DT: impossible branch"
))
# 420 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fieldsSizeStrict = (fun (dtb_u_u253 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u254 : int) (dtb_u_u255 : int B_dData_dList.t_List) (dtb_u_u256 : int) (dtb_u_u257 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u253 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u258, dtb_u_u259) -> (match dtb_u_u258 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u260; B_dData_dPair.f_Pair_second = dtb_u_u261 } -> (((((v_fieldsSizeStrict dtb_u_u259) dtb_u_u254) dtb_u_u255) (dtb_u_u256 + 1)) ((((v_patSizeStrict dtb_u_u261) dtb_u_u254) ((B_dData_dList.v_append dtb_u_u255) (B_dData_dList.C_List__x58__x58_ (dtb_u_u256, B_dData_dList.C_List_Nil)))) dtb_u_u257))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u257
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_strSizeEntriesGo = (fun (dtb_u_u262 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u263 : int) -> (match dtb_u_u262 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u264, dtb_u_u265) -> ((B_dData_dList.v_append ((((v_patSizeStrict dtb_u_u264) dtb_u_u263) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) ((v_strSizeEntriesGo dtb_u_u265) (dtb_u_u263 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_strSizeEntries = (fun (dtb_u_u266 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((v_strSizeEntriesGo dtb_u_u266) 0))

# 479 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sizeOfVarStrict = (fun (dtb_u_u267 : string) (dtb_u_u268 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u268 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u269, dtb_u_u270) -> (match dtb_u_u269 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u271; B_dData_dPair.f_Pair_second = dtb_u_u272 } -> (if (dtb_u_u271 = dtb_u_u267) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u272)) else ((v_sizeOfVarStrict dtb_u_u267) dtb_u_u270))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_cmpOpOf = (fun (dtb_u_u273 : string) -> (if (dtb_u_u273 = "bi_le_int") then "le" else (if (dtb_u_u273 = "bi_ge_int") then "ge" else (if (dtb_u_u273 = "bi_lt_int") then "lt" else (if (dtb_u_u273 = "bi_gt_int") then "gt" else dtb_u_u273)))))

# 512 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_opBaseName = (fun (dtb_u_u274 : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u274))))

# 521 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lastTwoGo = (fun (dtb_u_u275 : Frontend_dAst.t_Expr) (dtb_u_u276 : Frontend_dAst.t_Expr) (dtb_u_u277 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u277 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u278, dtb_u_u279) -> (((v_lastTwoGo dtb_u_u276) dtb_u_u278) dtb_u_u279)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u275; B_dData_dPair.f_Pair_second = dtb_u_u276 }
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_lastTwo = (fun (dtb_u_u280 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u280 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u281, dtb_u_u282) -> (match dtb_u_u282 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u283, dtb_u_u284) -> (B_dData_dMaybe.C_Maybe_Just ((((v_lastTwoGo dtb_u_u281) dtb_u_u283) dtb_u_u284)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 558 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isNatCoerceName = (fun (dtb_u_u285 : string) -> (let dtb_u_u286 = (v_opBaseName dtb_u_u285) in (if (if (dtb_u_u286 = "natToInt") then true else (dtb_u_u286 = "natFromInt")) then true else (dtb_u_u286 = "toInt"))))

# 552 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_varOfExpr = (fun (dtb_u_u287 : Frontend_dAst.t_Expr) -> (match dtb_u_u287 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u288, dtb_u_u289, dtb_u_u290) -> (match dtb_u_u288 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u291, dtb_u_u292) -> (match dtb_u_u289 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u293, dtb_u_u294) -> (match dtb_u_u294 with
  | B_dData_dList.C_List_Nil -> (if (v_isNatCoerceName dtb_u_u291) then (v_varOfExpr dtb_u_u293) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u295, dtb_u_u296) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u295))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 525 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLE = (fun (dtb_u_u297 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let dtb_u_u298 = (v_lastTwo dtb_u_u297) in (match dtb_u_u298 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u299) -> (match dtb_u_u299 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u300; B_dData_dPair.f_Pair_second = dtb_u_u301 } -> (match dtb_u_u301 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u302, dtb_u_u303) -> (if (dtb_u_u302 = 0) then (v_varOfExpr dtb_u_u300) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 534 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardGE = (fun (dtb_u_u304 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let dtb_u_u305 = (v_lastTwo dtb_u_u304) in (match dtb_u_u305 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u306) -> (match dtb_u_u306 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u307; B_dData_dPair.f_Pair_second = dtb_u_u308 } -> (match dtb_u_u307 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u309, dtb_u_u310) -> (if (dtb_u_u309 = 0) then (v_varOfExpr dtb_u_u308) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 543 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardLT = (fun (dtb_u_u311 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let dtb_u_u312 = (v_lastTwo dtb_u_u311) in (match dtb_u_u312 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u313) -> (match dtb_u_u313 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u314; B_dData_dPair.f_Pair_second = dtb_u_u315 } -> (match dtb_u_u315 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u316, dtb_u_u317) -> (if (dtb_u_u316 = 1) then (v_varOfExpr dtb_u_u314) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 486 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardPosVar = (fun (dtb_u_u318 : Frontend_dAst.t_Expr) -> (let dtb_u_u319 = dtb_u_u318 in (match dtb_u_u319 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u320, dtb_u_u321, dtb_u_u322) -> (match dtb_u_u320 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u323, dtb_u_u324) -> (if ((v_cmpOpOf (v_opBaseName dtb_u_u323)) = "le") then (v_guardLE dtb_u_u321) else (if ((v_cmpOpOf (v_opBaseName dtb_u_u323)) = "ge") then (v_guardGE dtb_u_u321) else (if ((v_cmpOpOf (v_opBaseName dtb_u_u323)) = "lt") then (v_guardLT dtb_u_u321) else (if ((v_cmpOpOf (v_opBaseName dtb_u_u323)) = "<=") then (v_guardLE dtb_u_u321) else (if ((v_cmpOpOf (v_opBaseName dtb_u_u323)) = ">=") then (v_guardGE dtb_u_u321) else (if ((v_cmpOpOf (v_opBaseName dtb_u_u323)) = "<") then (v_guardLT dtb_u_u321) else B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 566 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_localClauseBinds = (fun (dtb_u_u325 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u325 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u326, dtb_u_u327) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((dtb_u_u326).Frontend_dAst.f_LocalClause_lcRef)); B_dData_dPair.f_Pair_second = (dtb_u_u326).Frontend_dAst.f_LocalClause_lcBody }, (v_localClauseBinds dtb_u_u327)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardUnion = (fun (dtb_u_u328 : string B_dData_dList.t_List) (dtb_u_u329 : string B_dData_dList.t_List) -> (v_dedup ((B_dData_dList.v_append dtb_u_u328) dtb_u_u329)))

# 575 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_guardInter = (fun (dtb_u_u330 : string B_dData_dList.t_List) (dtb_u_u331 : string B_dData_dList.t_List) -> (match dtb_u_u330 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u332, dtb_u_u333) -> (if ((B_dData_dList.v_memName dtb_u_u332) dtb_u_u331) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u332, ((v_guardInter dtb_u_u333) dtb_u_u331))) else ((v_guardInter dtb_u_u333) dtb_u_u331))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardThenPosAtom = (fun (dtb_u_u334 : string) (dtb_u_u335 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let dtb_u_u336 = (v_lastTwo dtb_u_u335) in (match dtb_u_u336 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u337) -> (match dtb_u_u337 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u338; B_dData_dPair.f_Pair_second = dtb_u_u339 } -> (match dtb_u_u339 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u340, dtb_u_u341) -> (if (if (dtb_u_u334 = "gt") then true else (dtb_u_u334 = ">")) then (if (dtb_u_u340 >= 0) then (v_varOfExpr dtb_u_u338) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (dtb_u_u334 = "ge") then true else (dtb_u_u334 = ">=")) then (if (dtb_u_u340 >= 1) then (v_varOfExpr dtb_u_u338) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb_u_u338 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u342, dtb_u_u343) -> (if (if (dtb_u_u334 = "lt") then true else (dtb_u_u334 = "<")) then (if (dtb_u_u342 >= 0) then (v_varOfExpr dtb_u_u339) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (dtb_u_u334 = "le") then true else (dtb_u_u334 = "<=")) then (if (dtb_u_u342 >= 1) then (v_varOfExpr dtb_u_u339) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 606 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_guardElsePosAtom = (fun (dtb_u_u344 : string) (dtb_u_u345 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (let dtb_u_u346 = (v_lastTwo dtb_u_u345) in (match dtb_u_u346 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u347) -> (match dtb_u_u347 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u348; B_dData_dPair.f_Pair_second = dtb_u_u349 } -> (match dtb_u_u349 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u350, dtb_u_u351) -> (if (if (dtb_u_u344 = "le") then true else (dtb_u_u344 = "<=")) then (if (dtb_u_u350 >= 0) then (v_varOfExpr dtb_u_u348) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (dtb_u_u344 = "lt") then true else (dtb_u_u344 = "<")) then (if (dtb_u_u350 >= 1) then (v_varOfExpr dtb_u_u348) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> (match dtb_u_u348 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u352, dtb_u_u353) -> (if (if (dtb_u_u344 = "ge") then true else (dtb_u_u344 = ">=")) then (if (dtb_u_u352 >= 0) then (v_varOfExpr dtb_u_u349) else B_dData_dMaybe.C_Maybe_Nothing) else (if (if (dtb_u_u344 = "gt") then true else (dtb_u_u344 = ">")) then (if (dtb_u_u352 >= 1) then (v_varOfExpr dtb_u_u349) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 676 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isTrueLit = (fun (dtb_u_u354 : Frontend_dAst.t_Expr) -> (match dtb_u_u354 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u355, dtb_u_u356) -> (dtb_u_u355 <> 0)
  | _ -> false
))

# 656 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardElsePosVars = (fun (dtb_u_u357 : Frontend_dAst.t_Expr) -> (match dtb_u_u357 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u358, dtb_u_u359, dtb_u_u360) -> (match dtb_u_u358 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u361, dtb_u_u362) -> (let dtb_u_u363 = (v_cmpOpOf (v_opBaseName dtb_u_u361)) in (if (dtb_u_u363 = "&&") then (let dtb_u_u364 = dtb_u_u359 in (match dtb_u_u364 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u365, dtb_u_u366) -> (match dtb_u_u366 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u367, dtb_u_u368) -> (match dtb_u_u368 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardElsePosVars dtb_u_u365)) (v_guardElsePosVars dtb_u_u367))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (dtb_u_u363 = "||") then (let dtb_u_u369 = dtb_u_u359 in (match dtb_u_u369 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u370, dtb_u_u371) -> (match dtb_u_u371 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u372, dtb_u_u373) -> (match dtb_u_u373 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardElsePosVars dtb_u_u370)) (v_guardElsePosVars dtb_u_u372))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardElsePosAtom dtb_u_u363) dtb_u_u359) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u374) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u374, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | Frontend_dAst.C_Expr_EIf (dtb_u_u375, dtb_u_u376, dtb_u_u377, dtb_u_u378) -> (if (v_isTrueLit dtb_u_u376) then ((v_guardUnion (v_guardElsePosVars dtb_u_u375)) (v_guardElsePosVars dtb_u_u377)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 680 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isFalseLit = (fun (dtb_u_u379 : Frontend_dAst.t_Expr) -> (match dtb_u_u379 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u380, dtb_u_u381) -> (dtb_u_u380 = 0)
  | _ -> false
))

# 633 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_guardThenPosVars = (fun (dtb_u_u382 : Frontend_dAst.t_Expr) -> (match dtb_u_u382 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u383, dtb_u_u384, dtb_u_u385) -> (match dtb_u_u383 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u386, dtb_u_u387) -> (let dtb_u_u388 = (v_cmpOpOf (v_opBaseName dtb_u_u386)) in (if (dtb_u_u388 = "&&") then (let dtb_u_u389 = dtb_u_u384 in (match dtb_u_u389 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u390, dtb_u_u391) -> (match dtb_u_u391 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u392, dtb_u_u393) -> (match dtb_u_u393 with
  | B_dData_dList.C_List_Nil -> ((v_guardUnion (v_guardThenPosVars dtb_u_u390)) (v_guardThenPosVars dtb_u_u392))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (if (dtb_u_u388 = "||") then (let dtb_u_u394 = dtb_u_u384 in (match dtb_u_u394 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u395, dtb_u_u396) -> (match dtb_u_u396 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u397, dtb_u_u398) -> (match dtb_u_u398 with
  | B_dData_dList.C_List_Nil -> ((v_guardInter (v_guardThenPosVars dtb_u_u395)) (v_guardThenPosVars dtb_u_u397))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else (match ((v_guardThenPosAtom dtb_u_u388) dtb_u_u384) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u399) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u399, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> B_dData_dList.C_List_Nil
)
  | Frontend_dAst.C_Expr_EIf (dtb_u_u400, dtb_u_u401, dtb_u_u402, dtb_u_u403) -> (if (v_isFalseLit dtb_u_u402) then ((v_guardUnion (v_guardThenPosVars dtb_u_u400)) (v_guardThenPosVars dtb_u_u401)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 707 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkPos = (fun (dtb_u_u404 : string) (dtb_u_u405 : int) (dtb_u_u406 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u404; B_dData_dPair.f_Pair_second = dtb_u_u405 }, (B_dData_dPair.v_firstOf dtb_u_u406))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u406) })

# 710 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posMarkNeg = (fun (dtb_u_u407 : string) (dtb_u_u408 : int) (dtb_u_u409 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u409); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u407; B_dData_dPair.f_Pair_second = dtb_u_u408 }, (B_dData_dPair.v_secondOf dtb_u_u409))) })

# 723 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_dedupInts = (fun (dtb_u_u410 : int B_dData_dList.t_List) -> (match dtb_u_u410 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u411, dtb_u_u412) -> (if ((v_memInt dtb_u_u411) dtb_u_u412) then (v_dedupInts dtb_u_u412) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u411, (v_dedupInts dtb_u_u412))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 720 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posEntryPairs = (fun (dtb_u_u413 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u413 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u414; B_dData_dPair.f_Pair_second = dtb_u_u415 } -> ((B_dData_dList.v_map (fun (dtb_u_u416 : int) -> { B_dData_dPair.f_Pair_first = dtb_u_u414; B_dData_dPair.f_Pair_second = dtb_u_u416 })) (v_dedupInts dtb_u_u415))
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posTblPairs = (fun (dtb_u_u417 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> ((B_dData_dList.v_concatMap v_posEntryPairs) (B_dContainer_dHashMap.v_toList dtb_u_u417)))

# 714 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posNormalize = (fun (dtb_u_u418 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_posTblPairs (v_posTblOf dtb_u_u418)))

# 932 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_pathInPats = (fun (dtb_u_u419 : string) (dtb_u_u420 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u421 : int B_dData_dList.t_List) (dtb_u_u422 : int) -> (match dtb_u_u420 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u423, dtb_u_u424) -> (match (((v_pathInPat dtb_u_u419) dtb_u_u423) ((B_dData_dList.v_append dtb_u_u421) (B_dData_dList.C_List__x58__x58_ (dtb_u_u422, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u425) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u425))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInPats dtb_u_u419) dtb_u_u424) dtb_u_u421) (dtb_u_u422 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 939 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInFields = (fun (dtb_u_u426 : string) (dtb_u_u427 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u428 : int B_dData_dList.t_List) (dtb_u_u429 : int) -> (match dtb_u_u427 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u430, dtb_u_u431) -> (match dtb_u_u430 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u432; B_dData_dPair.f_Pair_second = dtb_u_u433 } -> (match (((v_pathInPat dtb_u_u426) dtb_u_u433) ((B_dData_dList.v_append dtb_u_u428) (B_dData_dList.C_List__x58__x58_ (dtb_u_u429, B_dData_dList.C_List_Nil)))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u434) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u434))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pathInFields dtb_u_u426) dtb_u_u431) dtb_u_u428) (dtb_u_u429 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 946 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_pathInPat = (fun (dtb_u_u435 : string) (dtb_u_u436 : Frontend_dAst.t_Pat) (dtb_u_u437 : int B_dData_dList.t_List) -> (match dtb_u_u436 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u438, dtb_u_u439, dtb_u_u440) -> ((((v_pathInFields dtb_u_u435) dtb_u_u439) dtb_u_u437) 0)
  | Frontend_dAst.C_Pat_PCon (dtb_u_u441, dtb_u_u442, dtb_u_u443) -> ((((v_pathInPats dtb_u_u435) dtb_u_u442) dtb_u_u437) 0)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u444) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dAst.C_Pat_PVar (dtb_u_u445, dtb_u_u446) -> (if (dtb_u_u445 = dtb_u_u435) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u437)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 953 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projectionOfDef = (fun (dtb_u_u447 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let dtb_u_u448 = (B_dData_dPair.v_secondOf dtb_u_u447) in (match dtb_u_u448 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u449, dtb_u_u450) -> (match dtb_u_u450 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u451 = (B_dData_dPair.v_firstOf dtb_u_u449) in (match dtb_u_u451 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u452, dtb_u_u453) -> (match dtb_u_u453 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dPair.v_secondOf dtb_u_u449) with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u454, dtb_u_u455) -> (match (((v_pathInPat dtb_u_u454) dtb_u_u452) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u456) -> (if (v_notEmpty dtb_u_u456) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u447); B_dData_dPair.f_Pair_second = dtb_u_u456 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ECase (dtb_u_u457, dtb_u_u458, dtb_u_u459) -> (let dtb_u_u460 = { B_dData_dPair.f_Pair_first = dtb_u_u452; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u457; B_dData_dPair.f_Pair_second = dtb_u_u458 } } in (match dtb_u_u460 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u461; B_dData_dPair.f_Pair_second = dtb_u_u462 } -> (match dtb_u_u461 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u463, dtb_u_u464) -> (match dtb_u_u462 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u465; B_dData_dPair.f_Pair_second = dtb_u_u466 } -> (match dtb_u_u465 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u467, dtb_u_u468) -> (match dtb_u_u466 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u469, dtb_u_u470) -> (match dtb_u_u470 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u463 = dtb_u_u467) then (match (dtb_u_u469).Frontend_dAst.f_Alt_altBody with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u471, dtb_u_u472) -> (match (((v_pathInPat dtb_u_u471) (dtb_u_u469).Frontend_dAst.f_Alt_altPat) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u473) -> (if (v_notEmpty dtb_u_u473) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u447); B_dData_dPair.f_Pair_second = dtb_u_u473 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 984 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_projectionsOf = (fun (dtb_u_u474 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u474 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u475, dtb_u_u476) -> (match (v_projectionOfDef dtb_u_u475) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u477) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u477, (v_projectionsOf dtb_u_u476)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_projectionsOf dtb_u_u476)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldProjPrefix = "$field."

# 999 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldEntryName = (fun (dtb_u_u478 : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u478))

# 1002 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldEntryIndex = (fun (dtb_u_u479 : (string, int) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf dtb_u_u479))

# 1005 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldNameOfField = (fun (dtb_u_u480 : Frontend_dAst.t_Field) -> (dtb_u_u480).Frontend_dAst.f_Field_fieldName)

# 1008 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_numberedFieldNames = (fun (dtb_u_u481 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u482 : int) -> (match dtb_u_u481 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u483, dtb_u_u484) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldNameOfField dtb_u_u483); B_dData_dPair.f_Pair_second = dtb_u_u482 }, ((v_numberedFieldNames dtb_u_u484) (dtb_u_u482 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_reprAlias = (fun (dtb_u_u485 : Frontend_dAst.t_ReprTier) -> (match dtb_u_u485 with
  | Frontend_dAst.C_ReprTier_ReprAlias -> true
  | _ -> false
))

# 1012 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_recordFieldEntries = (fun (dtb_u_u486 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u486 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u487, dtb_u_u488) -> (let dtb_u_u489 = (v_recordFieldEntries dtb_u_u488) in (match dtb_u_u487 with
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u490, dtb_u_u491, dtb_u_u492, dtb_u_u493, dtb_u_u494, dtb_u_u495, dtb_u_u496, dtb_u_u497) -> (if (v_reprAlias dtb_u_u495) then { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u489); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map v_fieldNameOfField) dtb_u_u492)) (B_dData_dPair.v_secondOf dtb_u_u489)) } else { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((v_numberedFieldNames dtb_u_u492) 0)) (B_dData_dPair.v_firstOf dtb_u_u489)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u489) })
  | _ -> dtb_u_u489
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldIndexOfEntries = (fun (dtb_u_u498 : string) (dtb_u_u499 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u500 = (v_dedupInts ((B_dData_dList.v_map v_fieldEntryIndex) ((B_dData_dList.v_filter (fun (dtb_u_u503 : (string, int) B_dData_dPair.t_Pair) -> ((v_fieldEntryName dtb_u_u503) = dtb_u_u498))) dtb_u_u499))) in (match dtb_u_u500 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u501, dtb_u_u502) -> (match dtb_u_u502 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u501))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1043 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_fieldProjectionsGo = (fun (dtb_u_u504 : string B_dData_dList.t_List) (dtb_u_u505 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u506 : string B_dData_dList.t_List) -> (match dtb_u_u504 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u507, dtb_u_u508) -> (if ((B_dData_dList.v_memName dtb_u_u507) dtb_u_u506) then (((v_fieldProjectionsGo dtb_u_u508) dtb_u_u505) dtb_u_u506) else (match ((v_fieldIndexOfEntries dtb_u_u507) dtb_u_u505) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u509) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_fieldProjPrefix ^ dtb_u_u507); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u509, B_dData_dList.C_List_Nil)) }, (((v_fieldProjectionsGo dtb_u_u508) dtb_u_u505) dtb_u_u506)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_fieldProjectionsGo dtb_u_u508) dtb_u_u505) dtb_u_u506)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1035 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldProjectionsOf = (fun (dtb_u_u510 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u511 = (v_recordFieldEntries dtb_u_u510) in (let dtb_u_u512 = (B_dData_dPair.v_firstOf dtb_u_u511) in (let dtb_u_u513 = (B_dData_dPair.v_secondOf dtb_u_u511) in (((v_fieldProjectionsGo (v_dedup ((B_dData_dList.v_map v_fieldEntryName) dtb_u_u512))) dtb_u_u512) dtb_u_u513)))))

# 1063 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fieldProjPath = (fun (dtb_u_u514 : string) (dtb_u_u515 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u515 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u516, dtb_u_u517) -> (match dtb_u_u516 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u518; B_dData_dPair.f_Pair_second = dtb_u_u519 } -> (if (dtb_u_u514 = dtb_u_u518) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u519)) else ((v_fieldProjPath dtb_u_u514) dtb_u_u517))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1054 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fieldIndexOf = (fun (dtb_u_u520 : string) (dtb_u_u521 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_fieldProjPath (v_fieldProjPrefix ^ dtb_u_u520)) dtb_u_u521) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u522) -> (let dtb_u_u523 = dtb_u_u522 in (match dtb_u_u523 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u524, dtb_u_u525) -> (match dtb_u_u525 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u524))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sizeOfExpr = (fun (dtb_u_u526 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u527 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u528 : Frontend_dAst.t_Expr) -> (match dtb_u_u528 with
  | Frontend_dAst.C_Expr_EField (dtb_u_u529, dtb_u_u530, dtb_u_u531) -> (let dtb_u_u532 = (((v_sizeOfExpr dtb_u_u526) dtb_u_u527) dtb_u_u529) in (match dtb_u_u532 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u533) -> (match dtb_u_u533 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u534; B_dData_dPair.f_Pair_second = dtb_u_u535 } -> (match dtb_u_u535 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u536; B_dData_dPair.f_Pair_second = dtb_u_u537 } -> (match ((v_fieldIndexOf dtb_u_u530) dtb_u_u526) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u538) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u534; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u536 + 1); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u537) (B_dData_dList.C_List__x58__x58_ (dtb_u_u538, B_dData_dList.C_List_Nil))) } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u539, dtb_u_u540) -> ((v_sizeOfVarStrict dtb_u_u539) dtb_u_u527)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 445 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendSizesStrict = (fun (dtb_u_u541 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u542 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u543 : Frontend_dAst.t_Expr) (dtb_u_u544 : Frontend_dAst.t_Pat) -> (match (((v_sizeOfExpr dtb_u_u541) dtb_u_u542) dtb_u_u543) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u545) -> (let dtb_u_u546 = dtb_u_u545 in (match dtb_u_u546 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u547; B_dData_dPair.f_Pair_second = dtb_u_u548 } -> (match dtb_u_u548 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u549; B_dData_dPair.f_Pair_second = dtb_u_u550 } -> (match dtb_u_u544 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u551, dtb_u_u552) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u551; B_dData_dPair.f_Pair_second = dtb_u_u545 }, dtb_u_u542))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u553, dtb_u_u554, dtb_u_u555) -> ((((v_extendSizesStrict dtb_u_u541) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u553; B_dData_dPair.f_Pair_second = dtb_u_u545 }, dtb_u_u542))) dtb_u_u543) dtb_u_u554)
  | Frontend_dAst.C_Pat_PCon (dtb_u_u556, dtb_u_u557, dtb_u_u558) -> ((B_dData_dList.v_append dtb_u_u542) (((((v_patsSizeStrict dtb_u_u557) dtb_u_u547) dtb_u_u550) 0) B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u559, dtb_u_u560, dtb_u_u561) -> ((B_dData_dList.v_append dtb_u_u542) (((((v_fieldsSizeStrict dtb_u_u560) dtb_u_u547) dtb_u_u550) 0) B_dData_dList.C_List_Nil))
  | _ -> dtb_u_u542
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u542
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendLocalClauses = (fun (dtb_u_u562 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u563 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u564 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u564 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u565, dtb_u_u566) -> (((v_extendLocalClauses dtb_u_u562) ((((v_extendSizesStrict dtb_u_u562) dtb_u_u563) (dtb_u_u565).Frontend_dAst.f_LocalClause_lcBody) (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))))) dtb_u_u566)
  | B_dData_dList.C_List_Nil -> dtb_u_u563
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendBindingSizes = (fun (dtb_u_u567 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u568 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u569 : Frontend_dAst.t_Binding) -> (match (dtb_u_u569).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u570) -> ((((v_extendSizesStrict dtb_u_u567) dtb_u_u568) dtb_u_u570) (dtb_u_u569).Frontend_dAst.f_Binding_bindPat)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u571) -> (((v_extendLocalClauses dtb_u_u567) dtb_u_u568) dtb_u_u571)
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_extendByBinds = (fun (dtb_u_u572 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u573 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u574 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u573 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u575, dtb_u_u576) -> (((v_extendByBinds dtb_u_u572) dtb_u_u576) (((v_extendBindingSizes dtb_u_u572) dtb_u_u574) dtb_u_u575))
  | B_dData_dList.C_List_Nil -> dtb_u_u574
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendSizesVarOnly = (fun (dtb_u_u577 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u578 : Frontend_dAst.t_Expr) (dtb_u_u579 : Frontend_dAst.t_Pat) -> (match dtb_u_u578 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u580, dtb_u_u581) -> ((((v_extendSizesStrict B_dData_dList.C_List_Nil) dtb_u_u577) dtb_u_u578) dtb_u_u579)
  | _ -> dtb_u_u577
))

# 1067 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_projHas = (fun (dtb_u_u582 : string) (dtb_u_u583 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u583 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u584, dtb_u_u585) -> (match dtb_u_u584 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u586; B_dData_dPair.f_Pair_second = dtb_u_u587 } -> (if (dtb_u_u582 = dtb_u_u586) then true else ((v_projHas dtb_u_u582) dtb_u_u585))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1076 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_sameCtorGo = (fun (dtb_u_u588 : int) (dtb_u_u589 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u590 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u591 : int) -> (match dtb_u_u589 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u592, dtb_u_u593) -> (match dtb_u_u592 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u594, dtb_u_u595) -> (match ((v_sizeOfVarStrict dtb_u_u594) dtb_u_u590) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u596) -> (let dtb_u_u597 = dtb_u_u596 in (match dtb_u_u597 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u598; B_dData_dPair.f_Pair_second = dtb_u_u599 } -> (match dtb_u_u599 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u600; B_dData_dPair.f_Pair_second = dtb_u_u601 } -> (((((((v_sameCtorField dtb_u_u598) dtb_u_u600) dtb_u_u601) dtb_u_u588) dtb_u_u593) dtb_u_u590) dtb_u_u591)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (dtb_u_u591 > 0)
  | _ -> failwith "DT: impossible branch"
))
# 1088 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_sameCtorField = (fun (dtb_u_u602 : int) (dtb_u_u603 : int) (dtb_u_u604 : int B_dData_dList.t_List) (dtb_u_u605 : int) (dtb_u_u606 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u607 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u608 : int) -> (if (dtb_u_u602 = dtb_u_u605) then (if (dtb_u_u603 = 1) then (match dtb_u_u604 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u609, dtb_u_u610) -> (match dtb_u_u610 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u609 = dtb_u_u608) then ((((v_sameCtorGo dtb_u_u605) dtb_u_u606) dtb_u_u607) (dtb_u_u608 + 1)) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false) else false))

# 1073 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_sameCtorApp = (fun (dtb_u_u611 : int) (dtb_u_u612 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u613 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_sameCtorGo dtb_u_u611) dtb_u_u612) dtb_u_u613) 0))

# 1103 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_findWrapField = (fun (dtb_u_u614 : int) (dtb_u_u615 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u616 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u617 : int) -> (match dtb_u_u615 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u618, dtb_u_u619) -> (match dtb_u_u618 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u620, dtb_u_u621) -> (match ((v_sizeOfVarStrict dtb_u_u620) dtb_u_u616) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u622) -> (let dtb_u_u623 = dtb_u_u622 in (match dtb_u_u623 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u624; B_dData_dPair.f_Pair_second = dtb_u_u625 } -> (match dtb_u_u625 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u626; B_dData_dPair.f_Pair_second = dtb_u_u627 } -> (if (dtb_u_u624 = dtb_u_u614) then ((((((v_wrapCheck dtb_u_u614) dtb_u_u619) dtb_u_u616) dtb_u_u617) dtb_u_u626) dtb_u_u627) else ((((v_findWrapField dtb_u_u614) dtb_u_u619) dtb_u_u616) (dtb_u_u617 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_findWrapField dtb_u_u614) dtb_u_u619) dtb_u_u616) (dtb_u_u617 + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_findWrapField dtb_u_u614) dtb_u_u619) dtb_u_u616) (dtb_u_u617 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 1121 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_wrapCheck = (fun (dtb_u_u628 : int) (dtb_u_u629 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u630 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u631 : int) (dtb_u_u632 : int) (dtb_u_u633 : int B_dData_dList.t_List) -> (if (dtb_u_u632 > 0) then (match dtb_u_u633 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u634, dtb_u_u635) -> (if (dtb_u_u634 = dtb_u_u631) then (if (v_notEmpty dtb_u_u635) then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u631 + 2))) else ((((v_findWrapField dtb_u_u628) dtb_u_u629) dtb_u_u630) (dtb_u_u631 + 1))) else ((((v_findWrapField dtb_u_u628) dtb_u_u629) dtb_u_u630) (dtb_u_u631 + 1)))
  | B_dData_dList.C_List_Nil -> ((((v_findWrapField dtb_u_u628) dtb_u_u629) dtb_u_u630) (dtb_u_u631 + 1))
  | _ -> failwith "DT: impossible branch"
) else ((((v_findWrapField dtb_u_u628) dtb_u_u629) dtb_u_u630) (dtb_u_u631 + 1))))

# 1134 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posVarIn = (fun (dtb_u_u636 : string) (dtb_u_u637 : int) (dtb_u_u638 : string) (dtb_u_u639 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u640 : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dtb_u_u636) dtb_u_u640) then true else (((v_posHasTbl dtb_u_u638) dtb_u_u637) dtb_u_u639)))

# 1145 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isSubOpName = (fun (dtb_u_u641 : string) -> (if (if (if (dtb_u_u641 = "-") then true else (dtb_u_u641 = "Base.Trait.Num.sub")) then true else (dtb_u_u641 = "Base.Trait.Num.-")) then true else ((v_opBaseName dtb_u_u641) = "natSub")))

# 1150 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isAddOpName = (fun (dtb_u_u642 : string) -> (if (if (dtb_u_u642 = "+") then true else (dtb_u_u642 = "Base.Trait.Num.add")) then true else (dtb_u_u642 = "Base.Trait.Num.+")))

# 1163 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_natLitOf = (fun (dtb_u_u643 : Frontend_dAst.t_Expr) -> (match dtb_u_u643 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u644, dtb_u_u645, dtb_u_u646) -> (match dtb_u_u644 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u647, dtb_u_u648) -> (match dtb_u_u645 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u649, dtb_u_u650) -> (match dtb_u_u650 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u651 = (v_opBaseName dtb_u_u647) in (if (if (dtb_u_u651 = "S") then true else (dtb_u_u651 = "Succ")) then (match (v_natLitOf dtb_u_u649) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u652) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u652 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u653, dtb_u_u654) -> (let dtb_u_u655 = (v_opBaseName dtb_u_u653) in (if (if (dtb_u_u655 = "Z") then true else (dtb_u_u655 = "Zero")) then (B_dData_dMaybe.C_Maybe_Just (0)) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u656, dtb_u_u657) -> (if (dtb_u_u656 >= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u656)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1180 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinusBase = (fun (dtb_u_u658 : int) (dtb_u_u659 : Frontend_dAst.t_Expr) (dtb_u_u660 : int) (dtb_u_u661 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u662 : string) (dtb_u_u663 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u664 : string B_dData_dList.t_List) -> (match dtb_u_u659 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u665, dtb_u_u666) -> (match ((v_sizeOfVarStrict dtb_u_u665) dtb_u_u661) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u667) -> (let dtb_u_u668 = dtb_u_u667 in (match dtb_u_u668 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u669; B_dData_dPair.f_Pair_second = dtb_u_u670 } -> (match dtb_u_u670 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u671; B_dData_dPair.f_Pair_second = dtb_u_u672 } -> (if (dtb_u_u669 = dtb_u_u658) then (if (dtb_u_u671 = 0) then (if (((((v_posVarIn dtb_u_u665) dtb_u_u658) dtb_u_u662) dtb_u_u663) dtb_u_u664) then (B_dData_dMaybe.C_Maybe_Just (4)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1153 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithMinus = (fun (dtb_u_u673 : int) (dtb_u_u674 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u675 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u676 : string) (dtb_u_u677 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u678 : string B_dData_dList.t_List) -> (let dtb_u_u679 = (v_lastTwo dtb_u_u674) in (match dtb_u_u679 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u680) -> (match dtb_u_u680 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u681; B_dData_dPair.f_Pair_second = dtb_u_u682 } -> (match (v_natLitOf dtb_u_u682) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u683) -> (if (dtb_u_u683 > 0) then (((((((v_arithMinusBase dtb_u_u673) dtb_u_u681) dtb_u_u683) dtb_u_u675) dtb_u_u676) dtb_u_u677) dtb_u_u678) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1137 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_arithRel = (fun (dtb_u_u684 : int) (dtb_u_u685 : Frontend_dAst.t_Expr) (dtb_u_u686 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u687 : string) (dtb_u_u688 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u689 : string B_dData_dList.t_List) -> (match dtb_u_u685 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u690, dtb_u_u691, dtb_u_u692) -> (match dtb_u_u690 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u693, dtb_u_u694) -> (if (v_isSubOpName dtb_u_u693) then ((((((v_arithMinus dtb_u_u684) dtb_u_u691) dtb_u_u686) dtb_u_u687) dtb_u_u688) dtb_u_u689) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1211 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_lastOf = (fun dtb_u_u696 -> (match dtb_u_u696 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u697, dtb_u_u698) -> (match dtb_u_u698 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u697))
  | _ -> (v_lastOf dtb_u_u698)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1197 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_projRel = (fun (dtb_u_u699 : int) (dtb_u_u700 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u701 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_lastOf dtb_u_u700) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u702) -> (match dtb_u_u702 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u703, dtb_u_u704) -> (match ((v_sizeOfVarStrict dtb_u_u703) dtb_u_u701) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u705) -> (let dtb_u_u706 = dtb_u_u705 in (match dtb_u_u706 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u707; B_dData_dPair.f_Pair_second = dtb_u_u708 } -> (match dtb_u_u708 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u709; B_dData_dPair.f_Pair_second = dtb_u_u710 } -> (if (dtb_u_u707 = dtb_u_u699) then (B_dData_dMaybe.C_Maybe_Just (1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1281 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_markInvalid = (fun (dtb_u_u711 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u711) })

# 1284 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_addEdgeMode = (fun (dtb_u_u712 : string) (dtb_u_u713 : string) (dtb_u_u714 : int) (dtb_u_u715 : Base_dSource.t_Span) (dtb_u_u716 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u716); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u712; B_dData_dPair.f_Pair_second = dtb_u_u713 }; B_dData_dPair.f_Pair_second = dtb_u_u714 }; B_dData_dPair.f_Pair_second = dtb_u_u715 }, (B_dData_dPair.v_secondOf dtb_u_u716))) })

# 1287 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_groupHead = (fun (dtb_u_u717 : string B_dData_dList.t_List) (dtb_u_u718 : Frontend_dAst.t_Expr) -> (match dtb_u_u718 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u719, dtb_u_u720) -> (if ((B_dData_dList.v_memName dtb_u_u719) dtb_u_u717) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u719)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1291 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthExpr = (fun (dtb_u_u721 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u722 : int) -> (match dtb_u_u721 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u723, dtb_u_u724) -> (if (dtb_u_u722 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u723)) else ((v_nthExpr dtb_u_u724) (dtb_u_u722 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_argsAt = (fun (dtb_u_u725 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u726 : int B_dData_dList.t_List) -> (match dtb_u_u726 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u727, dtb_u_u728) -> (match ((v_nthExpr dtb_u_u725) dtb_u_u727) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u729) -> (match ((v_argsAt dtb_u_u725) dtb_u_u728) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u730) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u729, dtb_u_u730))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_fwFieldsF = (fun (dtb_u_u731 : int) (dtb_u_u732 : t_Forwarder B_dData_dList.t_List) (dtb_u_u733 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u733 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u734, dtb_u_u735) -> (match dtb_u_u734 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u736; B_dData_dPair.f_Pair_second = dtb_u_u737 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u736; B_dData_dPair.f_Pair_second = (((v_fwExprF (dtb_u_u731 - 1)) dtb_u_u732) dtb_u_u737) }, (((v_fwFieldsF (dtb_u_u731 - 1)) dtb_u_u732) dtb_u_u735)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 263 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwBindsF = (fun (dtb_u_u738 : int) (dtb_u_u739 : t_Forwarder B_dData_dList.t_List) (dtb_u_u740 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u740 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u741, dtb_u_u742) -> (B_dData_dList.C_List__x58__x58_ ((((v_fwBindingF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u741), (((v_fwBindsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u742)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 267 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwBindingF = (fun (dtb_u_u743 : int) (dtb_u_u744 : t_Forwarder B_dData_dList.t_List) (dtb_u_u745 : Frontend_dAst.t_Binding) -> (let dtb_u_u746 = (match (dtb_u_u745).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u749) -> (Frontend_dAst.C_BindingValue_BVal ((((v_fwExprF (dtb_u_u743 - 1)) dtb_u_u744) dtb_u_u749)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u750) -> (Frontend_dAst.C_BindingValue_BClauses ((((v_fwClausesF (dtb_u_u743 - 1)) dtb_u_u744) dtb_u_u750)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u747 = (match (dtb_u_u745).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u748) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb_u_u748 with Frontend_dAst.f_BindingSig_sigType = (((v_fwExprF (dtb_u_u743 - 1)) dtb_u_u744) (dtb_u_u748).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { dtb_u_u745 with Frontend_dAst.f_Binding_bindValue = dtb_u_u746; Frontend_dAst.f_Binding_bindSig = dtb_u_u747 })))
# 280 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwAltsF = (fun (dtb_u_u751 : int) (dtb_u_u752 : t_Forwarder B_dData_dList.t_List) (dtb_u_u753 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match dtb_u_u753 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u754, dtb_u_u755) -> (B_dData_dList.C_List__x58__x58_ ({ dtb_u_u754 with Frontend_dAst.f_Alt_altBody = (((v_fwExprF (dtb_u_u751 - 1)) dtb_u_u752) (dtb_u_u754).Frontend_dAst.f_Alt_altBody) }, (((v_fwAltsF (dtb_u_u751 - 1)) dtb_u_u752) dtb_u_u755)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 285 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwClausesF = (fun (dtb_u_u756 : int) (dtb_u_u757 : t_Forwarder B_dData_dList.t_List) (dtb_u_u758 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u758 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u759, dtb_u_u760) -> (B_dData_dList.C_List__x58__x58_ ({ dtb_u_u759 with Frontend_dAst.f_LocalClause_lcBody = (((v_fwExprF (dtb_u_u756 - 1)) dtb_u_u757) (dtb_u_u759).Frontend_dAst.f_LocalClause_lcBody) }, (((v_fwClausesF (dtb_u_u756 - 1)) dtb_u_u757) dtb_u_u760)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 290 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwStmtsF = (fun (dtb_u_u761 : int) (dtb_u_u762 : t_Forwarder B_dData_dList.t_List) (dtb_u_u763 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match dtb_u_u763 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u764, dtb_u_u765) -> (match dtb_u_u764 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u766, dtb_u_u767, dtb_u_u768) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb_u_u766, (((v_fwExprF (dtb_u_u761 - 1)) dtb_u_u762) dtb_u_u767), dtb_u_u768)), (((v_fwStmtsF (dtb_u_u761 - 1)) dtb_u_u762) dtb_u_u765)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u769, dtb_u_u770) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr ((((v_fwExprF (dtb_u_u761 - 1)) dtb_u_u762) dtb_u_u769), dtb_u_u770)), (((v_fwStmtsF (dtb_u_u761 - 1)) dtb_u_u762) dtb_u_u765)))
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u771, dtb_u_u772) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet ((((v_fwBindsF (dtb_u_u761 - 1)) dtb_u_u762) dtb_u_u771), dtb_u_u772)), (((v_fwStmtsF (dtb_u_u761 - 1)) dtb_u_u762) dtb_u_u765)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 298 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwPartsF = (fun (dtb_u_u773 : int) (dtb_u_u774 : t_Forwarder B_dData_dList.t_List) (dtb_u_u775 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match dtb_u_u775 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u776, dtb_u_u777) -> (match dtb_u_u776 with
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u778) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb_u_u778)), (((v_fwPartsF (dtb_u_u773 - 1)) dtb_u_u774) dtb_u_u777)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u779) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole ((((v_fwExprF (dtb_u_u773 - 1)) dtb_u_u774) dtb_u_u779))), (((v_fwPartsF (dtb_u_u773 - 1)) dtb_u_u774) dtb_u_u777)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 305 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwArgsF = (fun (dtb_u_u780 : int) (dtb_u_u781 : t_Forwarder B_dData_dList.t_List) (dtb_u_u782 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u782 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u783, dtb_u_u784) -> (B_dData_dList.C_List__x58__x58_ ((((v_fwExprF (dtb_u_u780 - 1)) dtb_u_u781) dtb_u_u783), (((v_fwArgsF (dtb_u_u780 - 1)) dtb_u_u781) dtb_u_u784)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 312 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_fwExprF = (fun (dtb_u_u785 : int) (dtb_u_u786 : t_Forwarder B_dData_dList.t_List) (dtb_u_u787 : Frontend_dAst.t_Expr) -> (if (dtb_u_u785 <= 0) then dtb_u_u787 else (match dtb_u_u787 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u788, dtb_u_u789, dtb_u_u790) -> (let dtb_u_u791 = (((v_fwArgsF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u789) in (match dtb_u_u788 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u792, dtb_u_u793) -> (match ((v_lookupForwarder dtb_u_u792) dtb_u_u786) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u794) -> (let dtb_u_u795 = ((v_nthExpr dtb_u_u791) (dtb_u_u794).f_Forwarder_fwdCbParam) in (match dtb_u_u795 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u796) -> (match dtb_u_u796 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u797, dtb_u_u798) -> (match ((v_argsAt dtb_u_u791) (dtb_u_u794).f_Forwarder_fwdArgParams) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u799) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u797, dtb_u_u798)), dtb_u_u799, dtb_u_u790))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u792, dtb_u_u793)), dtb_u_u791, dtb_u_u790))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u792, dtb_u_u793)), dtb_u_u791, dtb_u_u790))
)
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u792, dtb_u_u793)), dtb_u_u791, dtb_u_u790))
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EApp ((((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u788), dtb_u_u791, dtb_u_u790))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Frontend_dAst.C_Expr_EApp ((((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u788), dtb_u_u791, dtb_u_u790))
))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u800, dtb_u_u801, dtb_u_u802) -> (Frontend_dAst.C_Expr_ELam (dtb_u_u800, (((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u801), dtb_u_u802))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u803, dtb_u_u804, dtb_u_u805, dtb_u_u806) -> (Frontend_dAst.C_Expr_ELet ((((v_fwBindsF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u803), (((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u804), dtb_u_u805, dtb_u_u806))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u807, dtb_u_u808, dtb_u_u809) -> (Frontend_dAst.C_Expr_ECase ((((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u807), (((v_fwAltsF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u808), dtb_u_u809))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u810, dtb_u_u811, dtb_u_u812, dtb_u_u813) -> (Frontend_dAst.C_Expr_EIf ((((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u810), (((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u811), (((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u812), dtb_u_u813))
  | Frontend_dAst.C_Expr_EField (dtb_u_u814, dtb_u_u815, dtb_u_u816) -> (Frontend_dAst.C_Expr_EField ((((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u814), dtb_u_u815, dtb_u_u816))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u817, dtb_u_u818, dtb_u_u819) -> (Frontend_dAst.C_Expr_ERecord (dtb_u_u817, (((v_fwFieldsF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u818), dtb_u_u819))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u820, dtb_u_u821, dtb_u_u822) -> (Frontend_dAst.C_Expr_ERecUpdate ((((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u820), (((v_fwFieldsF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u821), dtb_u_u822))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u823, dtb_u_u824) -> (Frontend_dAst.C_Expr_EDo ((((v_fwStmtsF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u823), dtb_u_u824))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u825, dtb_u_u826, dtb_u_u827, dtb_u_u828, dtb_u_u829, dtb_u_u830) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u825, dtb_u_u826, dtb_u_u827, (((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u828), (((v_fwExprF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u829), dtb_u_u830))
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u831, dtb_u_u832) -> (Frontend_dAst.C_Expr_EInterp ((((v_fwPartsF (dtb_u_u785 - 1)) dtb_u_u786) dtb_u_u831), dtb_u_u832))
  | _ -> dtb_u_u787
)))

# 255 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwFields = (fun (dtb_u_u833 : t_Forwarder B_dData_dList.t_List) (dtb_u_u834 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_fwFieldsF ((Frontend_dAstQuery.v_exprBudget 32) (Frontend_dAst.C_Expr_ERecord ("", dtb_u_u834, Frontend_dAst.v_noNodeRef)))) dtb_u_u833) dtb_u_u834))

# 309 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwExpr = (fun (dtb_u_u835 : t_Forwarder B_dData_dList.t_List) (dtb_u_u836 : Frontend_dAst.t_Expr) -> (((v_fwExprF ((Frontend_dAstQuery.v_exprBudget 64) dtb_u_u836)) dtb_u_u835) dtb_u_u836))

# 251 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_fwArgs = (fun (dtb_u_u837 : t_Forwarder B_dData_dList.t_List) (dtb_u_u838 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u839, dtb_u_u840) -> (B_dData_dList.C_List__x58__x58_ (((v_fwExpr dtb_u_u837) dtb_u_u839), ((v_fwArgs dtb_u_u837) dtb_u_u840)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_fwDeclF = (fun (dtb_u_u841 : int) (dtb_u_u842 : t_Forwarder B_dData_dList.t_List) (dtb_u_u843 : Frontend_dAst.t_Decl) -> (if (dtb_u_u841 <= 0) then dtb_u_u843 else (match dtb_u_u843 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u844, dtb_u_u845, dtb_u_u846, dtb_u_u847) -> (Frontend_dAst.C_Decl_DFun (dtb_u_u844, dtb_u_u845, (((v_fwExprF (dtb_u_u841 - 1)) dtb_u_u842) dtb_u_u846), dtb_u_u847))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u848, dtb_u_u849, dtb_u_u850, dtb_u_u851) -> (Frontend_dAst.C_Decl_DInstance (dtb_u_u848, dtb_u_u849, ((B_dData_dList.v_map ((v_fwDeclF (dtb_u_u841 - 1)) dtb_u_u842)) dtb_u_u850), dtb_u_u851))
  | _ -> dtb_u_u843
)))

# 354 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwDecl = (fun (dtb_u_u852 : t_Forwarder B_dData_dList.t_List) (dtb_u_u853 : Frontend_dAst.t_Decl) -> (((v_fwDeclF (v_declFuel dtb_u_u853)) dtb_u_u852) dtb_u_u853))

# 368 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_expandForwarders = (fun (dtb_u_u854 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match (v_forwardersOf dtb_u_u854) with
  | B_dData_dList.C_List_Nil -> dtb_u_u854
  | dtb_u_u855 -> ((B_dData_dList.v_map (v_fwDecl dtb_u_u855)) dtb_u_u854)
))

# 685 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argPositive = (fun (dtb_u_u856 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u857 : int) (dtb_u_u858 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u859 : string) (dtb_u_u860 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u861 : string B_dData_dList.t_List) -> (match ((v_nthExpr dtb_u_u856) dtb_u_u857) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u862) -> (match dtb_u_u862 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u863, dtb_u_u864) -> (dtb_u_u863 > 0)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u865, dtb_u_u866) -> (if ((B_dData_dList.v_memName dtb_u_u865) dtb_u_u861) then true else (match ((v_sizeOfVarStrict dtb_u_u865) dtb_u_u858) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u867) -> (let dtb_u_u868 = dtb_u_u867 in (match dtb_u_u868 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u869; B_dData_dPair.f_Pair_second = dtb_u_u870 } -> (match dtb_u_u870 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u871; B_dData_dPair.f_Pair_second = dtb_u_u872 } -> (if (dtb_u_u871 = 0) then (((v_posHasTbl dtb_u_u859) dtb_u_u869) dtb_u_u860) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkCalleeGo = (fun (dtb_u_u873 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u874 : string) (dtb_u_u875 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u876 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u877 : string B_dData_dList.t_List) (dtb_u_u878 : string) (dtb_u_u879 : int) (dtb_u_u880 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u881 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u879 <= 0) then dtb_u_u881 else (let dtb_u_u882 = ((B_dData_dList.v_length dtb_u_u880) - dtb_u_u879) in (let dtb_u_u883 = (if ((((((v_argPositive dtb_u_u880) dtb_u_u882) dtb_u_u875) dtb_u_u874) dtb_u_u876) dtb_u_u877) then (((v_posMarkPos dtb_u_u878) dtb_u_u882) dtb_u_u881) else (((v_posMarkNeg dtb_u_u878) dtb_u_u882) dtb_u_u881)) in (((((((((v_posWalkCalleeGo dtb_u_u873) dtb_u_u874) dtb_u_u875) dtb_u_u876) dtb_u_u877) dtb_u_u878) (dtb_u_u879 - 1)) dtb_u_u880) dtb_u_u883)))))

# 869 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posWalkCallee = (fun (dtb_u_u884 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u885 : string) (dtb_u_u886 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u887 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u888 : string B_dData_dList.t_List) (dtb_u_u889 : string) (dtb_u_u890 : int) (dtb_u_u891 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u892 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((((((((v_posWalkCalleeGo dtb_u_u884) dtb_u_u885) dtb_u_u886) dtb_u_u887) dtb_u_u888) dtb_u_u889) ((B_dData_dList.v_length dtb_u_u891) - dtb_u_u890)) dtb_u_u891) dtb_u_u892))

# 727 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posWalkArgsF = (fun (dtb_u_u893 : int) (dtb_u_u894 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u895 : string) (dtb_u_u896 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u897 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u898 : string B_dData_dList.t_List) (dtb_u_u899 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u900 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u899 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u901, dtb_u_u902) -> (if (dtb_u_u893 <= 0) then dtb_u_u900 else ((((((((v_posWalkArgsF (dtb_u_u893 - 1)) dtb_u_u894) dtb_u_u895) dtb_u_u896) dtb_u_u897) dtb_u_u898) dtb_u_u902) ((((((((v_posWalkF (dtb_u_u893 - 1)) dtb_u_u894) dtb_u_u895) dtb_u_u896) dtb_u_u897) dtb_u_u898) dtb_u_u901) dtb_u_u900)))
  | B_dData_dList.C_List_Nil -> dtb_u_u900
  | _ -> failwith "DT: impossible branch"
))
# 743 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkFieldsF = (fun (dtb_u_u903 : int) (dtb_u_u904 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u905 : string) (dtb_u_u906 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u907 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u908 : string B_dData_dList.t_List) (dtb_u_u909 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u910 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u909 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u911, dtb_u_u912) -> (match dtb_u_u911 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u913; B_dData_dPair.f_Pair_second = dtb_u_u914 } -> (if (dtb_u_u903 <= 0) then dtb_u_u910 else ((((((((v_posWalkFieldsF (dtb_u_u903 - 1)) dtb_u_u904) dtb_u_u905) dtb_u_u906) dtb_u_u907) dtb_u_u908) dtb_u_u912) ((((((((v_posWalkF (dtb_u_u903 - 1)) dtb_u_u904) dtb_u_u905) dtb_u_u906) dtb_u_u907) dtb_u_u908) dtb_u_u914) dtb_u_u910)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u910
  | _ -> failwith "DT: impossible branch"
))
# 759 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkAltsF = (fun (dtb_u_u915 : int) (dtb_u_u916 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u917 : string) (dtb_u_u918 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u919 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u920 : string B_dData_dList.t_List) (dtb_u_u921 : Frontend_dAst.t_Expr) (dtb_u_u922 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u923 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u922 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u924, dtb_u_u925) -> (if (dtb_u_u915 <= 0) then dtb_u_u923 else (((((((((v_posWalkAltsF (dtb_u_u915 - 1)) dtb_u_u916) dtb_u_u917) dtb_u_u918) dtb_u_u919) dtb_u_u920) dtb_u_u921) dtb_u_u925) ((((((((v_posWalkF (dtb_u_u915 - 1)) dtb_u_u916) dtb_u_u917) (((v_extendSizesVarOnly dtb_u_u918) dtb_u_u921) (dtb_u_u924).Frontend_dAst.f_Alt_altPat)) dtb_u_u919) dtb_u_u920) (dtb_u_u924).Frontend_dAst.f_Alt_altBody) dtb_u_u923)))
  | B_dData_dList.C_List_Nil -> dtb_u_u923
  | _ -> failwith "DT: impossible branch"
))
# 782 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkClausesF = (fun (dtb_u_u926 : int) (dtb_u_u927 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u928 : string) (dtb_u_u929 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u930 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u931 : string B_dData_dList.t_List) (dtb_u_u932 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (dtb_u_u933 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u932 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u934, dtb_u_u935) -> (if (dtb_u_u926 <= 0) then dtb_u_u933 else ((((((((v_posWalkClausesF (dtb_u_u926 - 1)) dtb_u_u927) dtb_u_u928) dtb_u_u929) dtb_u_u930) dtb_u_u931) dtb_u_u935) ((((((((v_posWalkF (dtb_u_u926 - 1)) dtb_u_u927) dtb_u_u928) dtb_u_u929) dtb_u_u930) dtb_u_u931) (dtb_u_u934).Frontend_dAst.f_LocalClause_lcBody) dtb_u_u933)))
  | B_dData_dList.C_List_Nil -> dtb_u_u933
  | _ -> failwith "DT: impossible branch"
))
# 798 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkBindsF = (fun (dtb_u_u936 : int) (dtb_u_u937 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u938 : string) (dtb_u_u939 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u940 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u941 : string B_dData_dList.t_List) (dtb_u_u942 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u943 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u942 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u944, dtb_u_u945) -> (if (dtb_u_u936 <= 0) then dtb_u_u943 else ((((((((v_posWalkBindsF (dtb_u_u936 - 1)) dtb_u_u937) dtb_u_u938) dtb_u_u939) dtb_u_u940) dtb_u_u941) dtb_u_u945) ((((((((v_posWalkBindingF (dtb_u_u936 - 1)) dtb_u_u937) dtb_u_u938) dtb_u_u939) dtb_u_u940) dtb_u_u941) dtb_u_u944) dtb_u_u943)))
  | B_dData_dList.C_List_Nil -> dtb_u_u943
  | _ -> failwith "DT: impossible branch"
))
# 814 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkBindingF = (fun (dtb_u_u946 : int) (dtb_u_u947 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u948 : string) (dtb_u_u949 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u950 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u951 : string B_dData_dList.t_List) (dtb_u_u952 : Frontend_dAst.t_Binding) (dtb_u_u953 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u946 <= 0) then dtb_u_u953 else (let dtb_u_u954 = (match (dtb_u_u952).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u956) -> ((((((((v_posWalkF (dtb_u_u946 - 1)) dtb_u_u947) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u956) dtb_u_u953)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u957) -> ((((((((v_posWalkClausesF (dtb_u_u946 - 1)) dtb_u_u947) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u957) dtb_u_u953)
  | _ -> failwith "DT: impossible branch"
) in (match (dtb_u_u952).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u955) -> ((((((((v_posWalkF (dtb_u_u946 - 1)) dtb_u_u947) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) (dtb_u_u955).Frontend_dAst.f_BindingSig_sigType) dtb_u_u954)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u954
  | _ -> failwith "DT: impossible branch"
))))
# 828 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkStmtsF = (fun (dtb_u_u958 : int) (dtb_u_u959 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u960 : string) (dtb_u_u961 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u962 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u963 : string B_dData_dList.t_List) (dtb_u_u964 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u965 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u964 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u966, dtb_u_u967) -> (if (dtb_u_u958 <= 0) then dtb_u_u965 else (match dtb_u_u966 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u968, dtb_u_u969, dtb_u_u970) -> ((((((((v_posWalkStmtsF (dtb_u_u958 - 1)) dtb_u_u959) dtb_u_u960) dtb_u_u961) dtb_u_u962) dtb_u_u963) dtb_u_u967) ((((((((v_posWalkF (dtb_u_u958 - 1)) dtb_u_u959) dtb_u_u960) dtb_u_u961) dtb_u_u962) dtb_u_u963) dtb_u_u969) dtb_u_u965))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u971, dtb_u_u972) -> ((((((((v_posWalkStmtsF (dtb_u_u958 - 1)) dtb_u_u959) dtb_u_u960) dtb_u_u961) dtb_u_u962) dtb_u_u963) dtb_u_u967) ((((((((v_posWalkF (dtb_u_u958 - 1)) dtb_u_u959) dtb_u_u960) dtb_u_u961) dtb_u_u962) dtb_u_u963) dtb_u_u971) dtb_u_u965))
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u973, dtb_u_u974) -> ((((((((v_posWalkStmtsF (dtb_u_u958 - 1)) dtb_u_u959) dtb_u_u960) dtb_u_u961) dtb_u_u962) dtb_u_u963) dtb_u_u967) ((((((((v_posWalkBindsF (dtb_u_u958 - 1)) dtb_u_u959) dtb_u_u960) dtb_u_u961) dtb_u_u962) dtb_u_u963) dtb_u_u973) dtb_u_u965))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> dtb_u_u965
  | _ -> failwith "DT: impossible branch"
))
# 843 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_posWalkF = (fun (dtb_u_u975 : int) (dtb_u_u976 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u977 : string) (dtb_u_u978 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u979 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u980 : string B_dData_dList.t_List) (dtb_u_u981 : Frontend_dAst.t_Expr) (dtb_u_u982 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u975 <= 0) then dtb_u_u982 else (match dtb_u_u981 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u983, dtb_u_u984, dtb_u_u985) -> (match dtb_u_u983 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u986, dtb_u_u987) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u986) dtb_u_u976) then ((((((((v_posWalkArgsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u984) (((((((((v_posWalkCallee dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u986) 0) dtb_u_u984) dtb_u_u982)) else ((((((((v_posWalkArgsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u984) ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u983) dtb_u_u982)))
  | _ -> ((((((((v_posWalkArgsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u984) ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u983) dtb_u_u982))
)
  | Frontend_dAst.C_Expr_EIf (dtb_u_u988, dtb_u_u989, dtb_u_u990, dtb_u_u991) -> (let dtb_u_u992 = ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u988) dtb_u_u982) in (let dtb_u_u993 = ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) ((B_dData_dList.v_append (v_guardThenPosVars dtb_u_u988)) dtb_u_u980)) dtb_u_u989) dtb_u_u992) in ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) ((B_dData_dList.v_append (v_guardElsePosVars dtb_u_u988)) dtb_u_u980)) dtb_u_u990) dtb_u_u993)))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u994, dtb_u_u995, dtb_u_u996) -> (((((((((v_posWalkAltsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u994) dtb_u_u995) ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u994) dtb_u_u982))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u997, dtb_u_u998, dtb_u_u999) -> ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u998) dtb_u_u982)
  | Frontend_dAst.C_Expr_ELet (dtb_u_u1000, dtb_u_u1001, dtb_u_u1002, dtb_u_u1003) -> ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1001) ((((((((v_posWalkBindsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1000) dtb_u_u982))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u1004, dtb_u_u1005, dtb_u_u1006, dtb_u_u1007, dtb_u_u1008, dtb_u_u1009) -> ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1008) ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1007) dtb_u_u982))
  | Frontend_dAst.C_Expr_EField (dtb_u_u1010, dtb_u_u1011, dtb_u_u1012) -> ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1010) dtb_u_u982)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u1013, dtb_u_u1014, dtb_u_u1015) -> ((((((((v_posWalkFieldsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1014) dtb_u_u982)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u1016, dtb_u_u1017, dtb_u_u1018) -> ((((((((v_posWalkFieldsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1017) ((((((((v_posWalkF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1016) dtb_u_u982))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u1019, dtb_u_u1020) -> ((((((((v_posWalkStmtsF (dtb_u_u975 - 1)) dtb_u_u976) dtb_u_u977) dtb_u_u978) dtb_u_u979) dtb_u_u980) dtb_u_u1019) dtb_u_u982)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1021, dtb_u_u1022) -> dtb_u_u982
  | _ -> dtb_u_u982
)))

# 839 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posWalk = (fun (dtb_u_u1023 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1024 : string) (dtb_u_u1025 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1026 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1027 : string B_dData_dList.t_List) (dtb_u_u1028 : Frontend_dAst.t_Expr) (dtb_u_u1029 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((((((v_posWalkF ((Frontend_dAstQuery.v_exprBudget 32) dtb_u_u1028)) dtb_u_u1023) dtb_u_u1024) dtb_u_u1025) dtb_u_u1026) dtb_u_u1027) dtb_u_u1028) dtb_u_u1029))

# 883 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanClauses = (fun (dtb_u_u1030 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1031 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1032 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1033 : string) (dtb_u_u1034 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1035 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1034 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1036, dtb_u_u1037) -> (let dtb_u_u1038 = (v_strSizeEntries (B_dData_dPair.v_firstOf dtb_u_u1036)) in (let dtb_u_u1039 = (((((((v_posWalk dtb_u_u1030) dtb_u_u1033) dtb_u_u1038) dtb_u_u1032) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf dtb_u_u1036)) dtb_u_u1035) in ((((((v_posScanClauses dtb_u_u1030) dtb_u_u1031) dtb_u_u1032) dtb_u_u1033) dtb_u_u1037) dtb_u_u1039)))
  | B_dData_dList.C_List_Nil -> dtb_u_u1035
  | _ -> failwith "DT: impossible branch"
))

# 891 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanDefs = (fun (dtb_u_u1040 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1041 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1042 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1043 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1044 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1043 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1045, dtb_u_u1046) -> (((((v_posScanDefs dtb_u_u1040) dtb_u_u1041) dtb_u_u1042) dtb_u_u1046) ((((((v_posScanClauses dtb_u_u1040) dtb_u_u1041) dtb_u_u1042) (B_dData_dPair.v_firstOf dtb_u_u1045)) (B_dData_dPair.v_secondOf dtb_u_u1045)) dtb_u_u1044))
  | B_dData_dList.C_List_Nil -> dtb_u_u1044
  | _ -> failwith "DT: impossible branch"
))

# 908 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_posScanNamesGo = (fun (dtb_u_u1047 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1048 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1049 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1050 : string B_dData_dList.t_List) (dtb_u_u1051 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1050 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1052, dtb_u_u1053) -> (((((v_posScanNamesGo dtb_u_u1047) dtb_u_u1048) dtb_u_u1049) dtb_u_u1053) ((((((v_posScanClauses dtb_u_u1047) B_dData_dList.C_List_Nil) dtb_u_u1049) dtb_u_u1052) ((v_clausesOfDefTbl dtb_u_u1052) dtb_u_u1048)) dtb_u_u1051))
  | B_dData_dList.C_List_Nil -> dtb_u_u1051
  | _ -> failwith "DT: impossible branch"
))

# 902 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_posScanNames = (fun (dtb_u_u1054 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1055 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1056 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1057 : string B_dData_dList.t_List) (dtb_u_u1058 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let dtb_u_u1059 = (((((v_posScanNamesGo dtb_u_u1054) dtb_u_u1055) dtb_u_u1056) dtb_u_u1057) dtb_u_u1058) in { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf dtb_u_u1059)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf dtb_u_u1059)) }))

# 919 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_computePosFacts = (fun (dtb_u_u1060 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1061 : int) (dtb_u_u1062 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u1061 <= 0) then dtb_u_u1062 else (((v_computePosFactsStep dtb_u_u1060) dtb_u_u1061) dtb_u_u1062)))
# 922 "Vuna/Compiler/Elab/Termination/Measure.vuna"
and v_computePosFactsStep = (fun (dtb_u_u1063 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1064 : int) (dtb_u_u1065 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u1066 = (B_dContainer_dHashMap.v_ofNames (v_defNames dtb_u_u1063)) in (let dtb_u_u1067 = (((((v_posScanDefs dtb_u_u1066) dtb_u_u1063) (v_posTblOf dtb_u_u1065)) dtb_u_u1063) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let dtb_u_u1068 = { B_dData_dPair.f_Pair_first = (v_posNormalize (B_dData_dPair.v_firstOf dtb_u_u1067)); B_dData_dPair.f_Pair_second = (v_posNormalize (B_dData_dPair.v_secondOf dtb_u_u1067)) } in (let dtb_u_u1069 = ((v_posFilterTbl (B_dData_dPair.v_firstOf dtb_u_u1068)) (v_posTblOf (B_dData_dPair.v_secondOf dtb_u_u1068))) in (let dtb_u_u1070 = ((v_posUnionTbl dtb_u_u1065) dtb_u_u1069) in (if ((v_posSetEqTbl dtb_u_u1065) dtb_u_u1070) then dtb_u_u1070 else (((v_computePosFacts dtb_u_u1063) (dtb_u_u1064 - 1)) dtb_u_u1070))))))))

# 1311 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_unaryHofSpec = { f_HofSpec_hofLambdaArity = 1; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 1 }

# 1314 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldLHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 1; f_HofSpec_hofListArg = 2 }

# 1317 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_foldRHofSpec = { f_HofSpec_hofLambdaArity = 2; f_HofSpec_hofElemParam = 0; f_HofSpec_hofListArg = 2 }

# 1326 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSpecIn = (fun (dtb_u_u1071 : string) (dtb_u_u1072 : string) -> (if (dtb_u_u1071 = "Base.Data.List") then (if (if (if (if (dtb_u_u1072 = "map") then true else (dtb_u_u1072 = "filter")) then true else (dtb_u_u1072 = "concatMap")) then true else (dtb_u_u1072 = "mapMaybe")) then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else (if (dtb_u_u1072 = "foldl") then (B_dData_dMaybe.C_Maybe_Just (v_foldLHofSpec)) else (if (dtb_u_u1072 = "foldr") then (B_dData_dMaybe.C_Maybe_Just (v_foldRHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing))) else (if (if (dtb_u_u1071 = "Base.Data.Result") then true else (dtb_u_u1071 = "Vuna.Compiler.Base.Common")) then (if (dtb_u_u1072 = "traverse") then (B_dData_dMaybe.C_Maybe_Just (v_unaryHofSpec)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)))

# 1320 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSpecOf = (fun (dtb_u_u1073 : string) -> (match (Frontend_dName.v_splitGlobalKey dtb_u_u1073) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1074) -> ((v_hofSpecIn (B_dData_dPair.v_firstOf dtb_u_u1074)) (B_dData_dPair.v_secondOf dtb_u_u1074))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1338 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_nthName = (fun (dtb_u_u1075 : string B_dData_dList.t_List) (dtb_u_u1076 : int) -> (match dtb_u_u1075 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1077, dtb_u_u1078) -> (if (dtb_u_u1076 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1077)) else ((v_nthName dtb_u_u1078) (dtb_u_u1076 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1343 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_peelLam = (fun (dtb_u_u1079 : int) (dtb_u_u1080 : Frontend_dAst.t_Expr) -> (if (dtb_u_u1079 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1080 })) else (match dtb_u_u1080 with
  | Frontend_dAst.C_Expr_ELam (dtb_u_u1081, dtb_u_u1082, dtb_u_u1083) -> (if ((B_dData_dList.v_length dtb_u_u1081) > dtb_u_u1079) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u1084 = ((v_peelLam (dtb_u_u1079 - (B_dData_dList.v_length dtb_u_u1081))) dtb_u_u1082) in (match dtb_u_u1084 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1085) -> (match dtb_u_u1085 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1086; B_dData_dPair.f_Pair_second = dtb_u_u1087 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u1081)) dtb_u_u1086); B_dData_dPair.f_Pair_second = dtb_u_u1087 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1360 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofLambdaCall = (fun (dtb_u_u1088 : t_HofSpec) (dtb_u_u1089 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u1089 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1090, dtb_u_u1091) -> (let dtb_u_u1092 = ((v_peelLam (dtb_u_u1088).f_HofSpec_hofLambdaArity) dtb_u_u1090) in (match dtb_u_u1092 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1093) -> (match dtb_u_u1093 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1094; B_dData_dPair.f_Pair_second = dtb_u_u1095 } -> (if ((B_dData_dList.v_length dtb_u_u1091) = (dtb_u_u1088).f_HofSpec_hofListArg) then (match ((v_nthExpr dtb_u_u1091) ((dtb_u_u1088).f_HofSpec_hofListArg - 1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1096) -> (match ((v_nthName dtb_u_u1094) (dtb_u_u1088).f_HofSpec_hofElemParam) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1097) -> (B_dData_dMaybe.C_Maybe_Just ({ f_HofCall_hofElemBinder = dtb_u_u1097; f_HofCall_hofListExpr = dtb_u_u1096; f_HofCall_hofSideArgs = dtb_u_u1091; f_HofCall_hofBody = dtb_u_u1095 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1376 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_extendElemSizes = (fun (dtb_u_u1098 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1099 : Frontend_dAst.t_Expr) (dtb_u_u1100 : string) -> (match dtb_u_u1099 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1101, dtb_u_u1102) -> (match ((v_sizeOfVarStrict dtb_u_u1101) dtb_u_u1098) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1103) -> (let dtb_u_u1104 = dtb_u_u1103 in (match dtb_u_u1104 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1105; B_dData_dPair.f_Pair_second = dtb_u_u1106 } -> (match dtb_u_u1106 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1107; B_dData_dPair.f_Pair_second = dtb_u_u1108 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1100; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1105; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u1107 + 1); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u1108) (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) } } }, dtb_u_u1098))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u1098
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u1098
))

# 1388 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_edgeStrictGo = (fun (dtb_u_u1109 : string) (dtb_u_u1110 : string) (dtb_u_u1111 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1112 : bool) (dtb_u_u1113 : bool) -> (match dtb_u_u1111 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1114, dtb_u_u1115) -> (match dtb_u_u1114 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1116; B_dData_dPair.f_Pair_second = dtb_u_u1117 } -> (match dtb_u_u1116 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1118; B_dData_dPair.f_Pair_second = dtb_u_u1119 } -> (match dtb_u_u1118 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1120; B_dData_dPair.f_Pair_second = dtb_u_u1121 } -> (if (dtb_u_u1120 = dtb_u_u1109) then (if (dtb_u_u1121 = dtb_u_u1110) then (((((v_edgeStrictGo dtb_u_u1109) dtb_u_u1110) dtb_u_u1115) true) (if (dtb_u_u1119 > 0) then dtb_u_u1113 else false)) else (((((v_edgeStrictGo dtb_u_u1109) dtb_u_u1110) dtb_u_u1115) dtb_u_u1112) dtb_u_u1113)) else (((((v_edgeStrictGo dtb_u_u1109) dtb_u_u1110) dtb_u_u1115) dtb_u_u1112) dtb_u_u1113))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if dtb_u_u1112 then dtb_u_u1113 else false)
  | _ -> failwith "DT: impossible branch"
))

# 1385 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeStrict = (fun (dtb_u_u1122 : string) (dtb_u_u1123 : string) (dtb_u_u1124 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_edgeStrictGo dtb_u_u1122) dtb_u_u1123) dtb_u_u1124) false) true))

# 1402 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_edgeTargetsGo = (fun (dtb_u_u1125 : string) (dtb_u_u1126 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1126 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1127, dtb_u_u1128) -> (match dtb_u_u1127 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1129; B_dData_dPair.f_Pair_second = dtb_u_u1130 } -> (match dtb_u_u1129 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1131; B_dData_dPair.f_Pair_second = dtb_u_u1132 } -> (match dtb_u_u1131 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1133; B_dData_dPair.f_Pair_second = dtb_u_u1134 } -> (if (dtb_u_u1133 = dtb_u_u1125) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u1134, ((v_edgeTargetsGo dtb_u_u1125) dtb_u_u1128))) else ((v_edgeTargetsGo dtb_u_u1125) dtb_u_u1128))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1399 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_edgeTargets = (fun (dtb_u_u1135 : string) (dtb_u_u1136 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedup ((v_edgeTargetsGo dtb_u_u1135) dtb_u_u1136)))

# 1411 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_weakAdjGo = (fun (dtb_u_u1137 : string B_dData_dList.t_List) (dtb_u_u1138 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1139 : string) (dtb_u_u1140 : string B_dData_dList.t_List) -> (match dtb_u_u1140 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1141, dtb_u_u1142) -> (if (((v_edgeStrict dtb_u_u1139) dtb_u_u1141) dtb_u_u1138) then ((((v_weakAdjGo dtb_u_u1137) dtb_u_u1138) dtb_u_u1139) dtb_u_u1142) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u1141, ((((v_weakAdjGo dtb_u_u1137) dtb_u_u1138) dtb_u_u1139) dtb_u_u1142))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1408 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakAdj = (fun (dtb_u_u1143 : string B_dData_dList.t_List) (dtb_u_u1144 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1145 : string) -> ((((v_weakAdjGo dtb_u_u1143) dtb_u_u1144) dtb_u_u1145) ((v_edgeTargets dtb_u_u1145) dtb_u_u1144)))

# 1419 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_weakReachFuel = (fun (dtb_u_u1146 : int) (dtb_u_u1147 : string B_dData_dList.t_List) (dtb_u_u1148 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1149 : string) (dtb_u_u1150 : string B_dData_dList.t_List) (dtb_u_u1151 : string B_dData_dList.t_List) -> (if (dtb_u_u1146 <= 0) then true else (match dtb_u_u1150 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1152, dtb_u_u1153) -> (if (dtb_u_u1152 = dtb_u_u1149) then true else (if ((B_dData_dList.v_memName dtb_u_u1152) dtb_u_u1151) then ((((((v_weakReachFuel (dtb_u_u1146 - 1)) dtb_u_u1147) dtb_u_u1148) dtb_u_u1149) dtb_u_u1153) dtb_u_u1151) else ((((((v_weakReachFuel (dtb_u_u1146 - 1)) dtb_u_u1147) dtb_u_u1148) dtb_u_u1149) ((B_dData_dList.v_append dtb_u_u1153) (((v_weakAdj dtb_u_u1147) dtb_u_u1148) dtb_u_u1152))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1152, dtb_u_u1151)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1416 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_weakReach = (fun (dtb_u_u1154 : string B_dData_dList.t_List) (dtb_u_u1155 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1156 : string) (dtb_u_u1157 : string B_dData_dList.t_List) (dtb_u_u1158 : string B_dData_dList.t_List) -> ((((((v_weakReachFuel 100000) dtb_u_u1154) dtb_u_u1155) dtb_u_u1156) dtb_u_u1157) dtb_u_u1158))

# 1432 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let rec v_hasWeakCycleGo = (fun (dtb_u_u1159 : string B_dData_dList.t_List) (dtb_u_u1160 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1161 : string B_dData_dList.t_List) -> (match dtb_u_u1161 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1162, dtb_u_u1163) -> (if (((((v_weakReach dtb_u_u1159) dtb_u_u1160) dtb_u_u1162) (((v_weakAdj dtb_u_u1159) dtb_u_u1160) dtb_u_u1162)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1162, B_dData_dList.C_List_Nil))) then true else (((v_hasWeakCycleGo dtb_u_u1159) dtb_u_u1160) dtb_u_u1163))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1429 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hasWeakCycle = (fun (dtb_u_u1164 : string B_dData_dList.t_List) (dtb_u_u1165 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_hasWeakCycleGo dtb_u_u1164) dtb_u_u1165) dtb_u_u1164))

# 1439 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relEqual = 0

# 1218 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOfArg = (fun (dtb_u_u1166 : int) (dtb_u_u1167 : Frontend_dAst.t_Expr) (dtb_u_u1168 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1169 : string B_dData_dList.t_List) (dtb_u_u1170 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1171 : string) (dtb_u_u1172 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1173 : string B_dData_dList.t_List) -> (match dtb_u_u1167 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1174, dtb_u_u1175, dtb_u_u1176) -> (match dtb_u_u1174 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1177, dtb_u_u1178) -> (if ((B_dData_dList.v_memName dtb_u_u1177) dtb_u_u1169) then (match ((((v_findWrapField dtb_u_u1166) dtb_u_u1175) dtb_u_u1168) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1179) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1179))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_sameCtorApp dtb_u_u1166) dtb_u_u1175) dtb_u_u1168) then (B_dData_dMaybe.C_Maybe_Just (v_relEqual)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_projHas dtb_u_u1177) dtb_u_u1170) then (((v_projRel dtb_u_u1166) dtb_u_u1175) dtb_u_u1168) else ((((((v_arithRel dtb_u_u1166) dtb_u_u1167) dtb_u_u1168) dtb_u_u1171) dtb_u_u1172) dtb_u_u1173)))
  | _ -> ((((((v_arithRel dtb_u_u1166) dtb_u_u1167) dtb_u_u1168) dtb_u_u1171) dtb_u_u1172) dtb_u_u1173)
)
  | Frontend_dAst.C_Expr_EField (dtb_u_u1180, dtb_u_u1181, dtb_u_u1182) -> (let dtb_u_u1183 = (((v_sizeOfExpr dtb_u_u1170) dtb_u_u1168) (Frontend_dAst.C_Expr_EField (dtb_u_u1180, dtb_u_u1181, dtb_u_u1182))) in (match dtb_u_u1183 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1184) -> (match dtb_u_u1184 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1185; B_dData_dPair.f_Pair_second = dtb_u_u1186 } -> (match dtb_u_u1186 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1187; B_dData_dPair.f_Pair_second = dtb_u_u1188 } -> (if (dtb_u_u1185 = dtb_u_u1166) then (if (dtb_u_u1187 > 0) then (B_dData_dMaybe.C_Maybe_Just (1)) else (B_dData_dMaybe.C_Maybe_Just (0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1189, dtb_u_u1190) -> (match ((v_sizeOfVarStrict dtb_u_u1189) dtb_u_u1168) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1191) -> (let dtb_u_u1192 = dtb_u_u1191 in (match dtb_u_u1192 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1193; B_dData_dPair.f_Pair_second = dtb_u_u1194 } -> (match dtb_u_u1194 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1195; B_dData_dPair.f_Pair_second = dtb_u_u1196 } -> (if (dtb_u_u1193 = dtb_u_u1166) then (if (dtb_u_u1195 > 0) then (B_dData_dMaybe.C_Maybe_Just (1)) else (B_dData_dMaybe.C_Maybe_Just (0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1240 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRel = (fun (dtb_u_u1197 : int) (dtb_u_u1198 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1199 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1200 : string B_dData_dList.t_List) (dtb_u_u1201 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1202 : string) (dtb_u_u1203 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1204 : string B_dData_dList.t_List) -> (match ((v_nthExpr dtb_u_u1198) dtb_u_u1197) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1205) -> ((((((((v_relOfArg dtb_u_u1197) dtb_u_u1205) dtb_u_u1199) dtb_u_u1200) dtb_u_u1201) dtb_u_u1202) dtb_u_u1203) dtb_u_u1204)
  | _ -> failwith "DT: impossible branch"
))

# 1442 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictSub = 1

# 1445 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relStrictMinus = 4

# 1448 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relUnknownSize = (-1)

# 1451 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relMissingGuard = (-2)

# 1454 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relNoRelation = (-3)

# 1457 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relOtherPosition = (-4)

# 1269 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hintArith = (fun (dtb_u_u1206 : int) (dtb_u_u1207 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1208 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1209 : int) -> (match dtb_u_u1207 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1210, dtb_u_u1211) -> (match dtb_u_u1210 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1212, dtb_u_u1213) -> (match dtb_u_u1211 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1214, dtb_u_u1215) -> (match dtb_u_u1214 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u1216, dtb_u_u1217) -> (match dtb_u_u1215 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u1216 <= 0) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict dtb_u_u1212) dtb_u_u1208) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1218) -> (let dtb_u_u1219 = dtb_u_u1218 in (match dtb_u_u1219 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1220; B_dData_dPair.f_Pair_second = dtb_u_u1221 } -> (match dtb_u_u1221 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1222; B_dData_dPair.f_Pair_second = dtb_u_u1223 } -> (if (dtb_u_u1220 = dtb_u_u1206) then (if (dtb_u_u1222 = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1209)) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (v_relUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
))

# 1460 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relAscending = (-5)

# 1248 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_argRelHint = (fun (dtb_u_u1224 : int) (dtb_u_u1225 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1226 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1227 : string B_dData_dList.t_List) -> (match ((v_nthExpr dtb_u_u1225) dtb_u_u1224) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1228) -> (let dtb_u_u1229 = dtb_u_u1228 in (match dtb_u_u1229 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1230, dtb_u_u1231, dtb_u_u1232) -> (match dtb_u_u1230 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1233, dtb_u_u1234) -> (if (v_isSubOpName dtb_u_u1233) then ((((v_hintArith dtb_u_u1224) dtb_u_u1231) dtb_u_u1226) v_relMissingGuard) else (if (v_isAddOpName dtb_u_u1233) then ((((v_hintArith dtb_u_u1224) dtb_u_u1231) dtb_u_u1226) v_relAscending) else (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1235, dtb_u_u1236) -> (if ((B_dData_dList.v_memName dtb_u_u1235) dtb_u_u1227) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (match ((v_sizeOfVarStrict dtb_u_u1235) dtb_u_u1226) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1237) -> (let dtb_u_u1238 = dtb_u_u1237 in (match dtb_u_u1238 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1239; B_dData_dPair.f_Pair_second = dtb_u_u1240 } -> (match dtb_u_u1240 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1241; B_dData_dPair.f_Pair_second = dtb_u_u1242 } -> (if (dtb_u_u1239 = dtb_u_u1224) then (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation)) else (B_dData_dMaybe.C_Maybe_Just (v_relOtherPosition)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (v_relUnknownSize))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (v_relNoRelation))
))
  | _ -> failwith "DT: impossible branch"
))

# 1464 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_relText = (fun (dtb_u_u1243 : int) -> (if (dtb_u_u1243 = v_relStrictSub) then "strict subterm" else (if (dtb_u_u1243 = v_relStrictMinus) then "decreases by a constant, with the non-negativity guard proven" else (if (dtb_u_u1243 = v_relMissingGuard) then "decreases by a constant, but the non-negativity guard is missing" else (if (dtb_u_u1243 = v_relUnknownSize) then "no known size (not a subterm of a parameter)" else (if (dtb_u_u1243 = v_relOtherPosition) then "decreases a different parameter" else (if (dtb_u_u1243 = v_relEqual) then "unchanged" else (if (dtb_u_u1243 = v_relAscending) then "increases instead of decreasing (ascending counters are not supported)" else "no size relation"))))))))

# 1483 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_isDescent = (fun (dtb_u_u1244 : int) -> (dtb_u_u1244 > 0))

# 1486 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let[@tail_mod_cons] rec v_filterModes = (fun (dtb_u_u1245 : int B_dData_dList.t_List) -> (match dtb_u_u1245 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1246, dtb_u_u1247) -> (if (v_isDescent dtb_u_u1246) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u1246, (v_filterModes dtb_u_u1247))) else (v_filterModes dtb_u_u1247))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwdCallee = (fun (dtb_u_u1248 : t_Forwarder) -> (match dtb_u_u1248 with
  | { f_Forwarder_fwdCallee = dtb_u_u1249; f_Forwarder_fwdCbParam = dtb_u_u1250; f_Forwarder_fwdArgParams = dtb_u_u1251 } -> dtb_u_u1249
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwdCbParam = (fun (dtb_u_u1252 : t_Forwarder) -> (match dtb_u_u1252 with
  | { f_Forwarder_fwdCallee = dtb_u_u1253; f_Forwarder_fwdCbParam = dtb_u_u1254; f_Forwarder_fwdArgParams = dtb_u_u1255 } -> dtb_u_u1254
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_fwdArgParams = (fun (dtb_u_u1256 : t_Forwarder) -> (match dtb_u_u1256 with
  | { f_Forwarder_fwdCallee = dtb_u_u1257; f_Forwarder_fwdCbParam = dtb_u_u1258; f_Forwarder_fwdArgParams = dtb_u_u1259 } -> dtb_u_u1259
  | _ -> failwith "DT: impossible branch"
))

# 1300 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofLambdaArity = (fun (dtb_u_u1260 : t_HofSpec) -> (match dtb_u_u1260 with
  | { f_HofSpec_hofLambdaArity = dtb_u_u1261; f_HofSpec_hofElemParam = dtb_u_u1262; f_HofSpec_hofListArg = dtb_u_u1263 } -> dtb_u_u1261
  | _ -> failwith "DT: impossible branch"
))

# 1301 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofElemParam = (fun (dtb_u_u1264 : t_HofSpec) -> (match dtb_u_u1264 with
  | { f_HofSpec_hofLambdaArity = dtb_u_u1265; f_HofSpec_hofElemParam = dtb_u_u1266; f_HofSpec_hofListArg = dtb_u_u1267 } -> dtb_u_u1266
  | _ -> failwith "DT: impossible branch"
))

# 1302 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofListArg = (fun (dtb_u_u1268 : t_HofSpec) -> (match dtb_u_u1268 with
  | { f_HofSpec_hofLambdaArity = dtb_u_u1269; f_HofSpec_hofElemParam = dtb_u_u1270; f_HofSpec_hofListArg = dtb_u_u1271 } -> dtb_u_u1271
  | _ -> failwith "DT: impossible branch"
))

# 1305 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofElemBinder = (fun (dtb_u_u1272 : t_HofCall) -> (match dtb_u_u1272 with
  | { f_HofCall_hofElemBinder = dtb_u_u1273; f_HofCall_hofListExpr = dtb_u_u1274; f_HofCall_hofSideArgs = dtb_u_u1275; f_HofCall_hofBody = dtb_u_u1276 } -> dtb_u_u1273
  | _ -> failwith "DT: impossible branch"
))

# 1306 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofListExpr = (fun (dtb_u_u1277 : t_HofCall) -> (match dtb_u_u1277 with
  | { f_HofCall_hofElemBinder = dtb_u_u1278; f_HofCall_hofListExpr = dtb_u_u1279; f_HofCall_hofSideArgs = dtb_u_u1280; f_HofCall_hofBody = dtb_u_u1281 } -> dtb_u_u1279
  | _ -> failwith "DT: impossible branch"
))

# 1307 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofSideArgs = (fun (dtb_u_u1282 : t_HofCall) -> (match dtb_u_u1282 with
  | { f_HofCall_hofElemBinder = dtb_u_u1283; f_HofCall_hofListExpr = dtb_u_u1284; f_HofCall_hofSideArgs = dtb_u_u1285; f_HofCall_hofBody = dtb_u_u1286 } -> dtb_u_u1285
  | _ -> failwith "DT: impossible branch"
))

# 1308 "Vuna/Compiler/Elab/Termination/Measure.vuna"
let v_hofBody = (fun (dtb_u_u1287 : t_HofCall) -> (match dtb_u_u1287 with
  | { f_HofCall_hofElemBinder = dtb_u_u1288; f_HofCall_hofListExpr = dtb_u_u1289; f_HofCall_hofSideArgs = dtb_u_u1290; f_HofCall_hofBody = dtb_u_u1291 } -> dtb_u_u1291
  | _ -> failwith "DT: impossible branch"
))
