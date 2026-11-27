open Vuna_runtime
# 29 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarPats = (fun (dtb_u_u1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2, dtb_u_u3) -> (match dtb_u_u2 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u4, dtb_u_u5) -> (v_allVarPats dtb_u_u3)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u6) -> (v_allVarPats dtb_u_u3)
  | Frontend_dAst.C_Pat_PAs (dtb_u_u7, dtb_u_u8, dtb_u_u9) -> false
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clauseArityTooMany = (fun (dtb_u_u10 : int) (dtb_u_u11 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u11 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u13) -> (match dtb_u_u12 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u14; B_dData_dPair.f_Pair_second = dtb_u_u15 } -> (if ((B_dData_dList.v_length dtb_u_u14) > dtb_u_u10) then true else ((v_clauseArityTooMany dtb_u_u10) dtb_u_u13))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Match.vuna"
let v_clauseHeadSpan = (fun (dtb_u_u16 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u17 : Frontend_dAst.t_Expr) -> (match dtb_u_u16 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.v_exprSpan dtb_u_u17)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u19) -> (Frontend_dAst.v_patSpan dtb_u_u18)
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripAsPat = (fun (dtb_u_u20 : Frontend_dAst.t_Pat) -> (match dtb_u_u20 with
  | Frontend_dAst.C_Pat_PAs (dtb_u_u21, dtb_u_u22, dtb_u_u23) -> (v_stripAsPat dtb_u_u22)
  | _ -> dtb_u_u20
))

# 74 "Vuna/Compiler/Elab/Match.vuna"
let rec v_reachableGo = (fun (dtb_u_u24 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u25 : int) (dtb_u_u26 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u27 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u27 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> (match dtb_u_u28 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u30; B_dData_dPair.f_Pair_second = dtb_u_u31 } -> (let dtb_u_u32 = ((B_dData_dList.v_map v_stripAsPat) dtb_u_u30) in (match ((((Elab_dCoverage.v_clauseCover dtb_u_u24) dtb_u_u25) dtb_u_u26) dtb_u_u32) with
  | Elab_dCoverage.C_ClauseCover_CovCovered -> ((Base_dDiagnostics_dTc.v_tcErr0 ((v_clauseHeadSpan dtb_u_u30) dtb_u_u31)) Base_dDiagnostics_dTc.C_TcErr_ClauseUnreachable)
  | _ -> ((((v_reachableGo dtb_u_u24) dtb_u_u25) (B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u26))) dtb_u_u29)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (true))
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Elab/Match.vuna"
let v_matrixOf = (fun (dtb_u_u33 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (B_dData_dList.v_map v_stripAsPat)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u33)))

# 65 "Vuna/Compiler/Elab/Match.vuna"
let v_checkReachable = (fun (dtb_u_u34 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u35 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u36 = (v_matrixOf dtb_u_u35) in (if (Elab_dCoverage.v_uniformArity dtb_u_u36) then ((((v_reachableGo dtb_u_u34) (bi_natFromInt (Elab_dCoverage.v_coverageFuelFor dtb_u_u36))) B_dData_dList.C_List_Nil) dtb_u_u35) else (Base_dDiag.C_Check_OkC (true)))))

# 113 "Vuna/Compiler/Elab/Match.vuna"
let v_arityOf = (fun (dtb_u_u37 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u37 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u38, dtb_u_u39) -> (match dtb_u_u38 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u40; B_dData_dPair.f_Pair_second = dtb_u_u41 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb_u_u40)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Elab/Match.vuna"
let rec v_paramNamesGo = (fun (dtb_u_u42 : int) (dtb_u_u43 : int) (dtb_u_u44 : string B_dData_dList.t_List) -> (if (dtb_u_u42 <= 0) then (B_dData_dList.v_reverse dtb_u_u44) else (((v_paramNamesGo (dtb_u_u42 - 1)) dtb_u_u43) (B_dData_dList.C_List__x58__x58_ (("mc" ^ (string_of_int (dtb_u_u43 - dtb_u_u42))), dtb_u_u44)))))

# 117 "Vuna/Compiler/Elab/Match.vuna"
let v_paramNames = (fun (dtb_u_u45 : int) -> (((v_paramNamesGo (dtb_u_u45 - 0)) dtb_u_u45) B_dData_dList.C_List_Nil))

# 127 "Vuna/Compiler/Elab/Match.vuna"
let rec v_wrapLambdas = (fun (dtb_u_u46 : string B_dData_dList.t_List) (dtb_u_u47 : Frontend_dAst.t_Expr) -> (match dtb_u_u46 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u48, dtb_u_u49) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u48; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), ((v_wrapLambdas dtb_u_u49) dtb_u_u47), (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty)))
  | B_dData_dList.C_List_Nil -> dtb_u_u47
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatMatches = (fun (dtb_u_u50 : Frontend_dAst.t_Pat) (dtb_u_u51 : Frontend_dAst.t_Pat) -> (match dtb_u_u50 with
  | Frontend_dAst.C_Pat_PStr (dtb_u_u52, dtb_u_u53) -> (match dtb_u_u51 with
  | Frontend_dAst.C_Pat_PStr (dtb_u_u54, dtb_u_u55) -> (dtb_u_u52 = dtb_u_u54)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u56, dtb_u_u57) -> true
  | Frontend_dAst.C_Pat_PWild (dtb_u_u58) -> true
  | _ -> false
)
  | Frontend_dAst.C_Pat_PInt (dtb_u_u59, dtb_u_u60) -> (match dtb_u_u51 with
  | Frontend_dAst.C_Pat_PInt (dtb_u_u61, dtb_u_u62) -> (dtb_u_u59 = dtb_u_u61)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u63, dtb_u_u64) -> true
  | Frontend_dAst.C_Pat_PWild (dtb_u_u65) -> true
  | _ -> false
)
  | _ -> false
))

# 193 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatExpr = (fun (dtb_u_u66 : Frontend_dAst.t_Pat) -> (match dtb_u_u66 with
  | Frontend_dAst.C_Pat_PStr (dtb_u_u67, dtb_u_u68) -> (Frontend_dAst.C_Expr_EStr (dtb_u_u67, dtb_u_u68))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u69, dtb_u_u70) -> (Frontend_dAst.C_Expr_EInt (dtb_u_u69, dtb_u_u70))
  | _ -> (Frontend_dAst.C_Expr_EInt (0, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))
))

# 225 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasAsHead = (fun (dtb_u_u71 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u71 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u72, dtb_u_u73) -> (let dtb_u_u74 = dtb_u_u72 in (match dtb_u_u74 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u75; B_dData_dPair.f_Pair_second = dtb_u_u76 } -> (match dtb_u_u75 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u78) -> (match dtb_u_u77 with
  | Frontend_dAst.C_Pat_PAs (dtb_u_u79, dtb_u_u80, dtb_u_u81) -> true
  | _ -> (v_hasAsHead dtb_u_u73)
)
  | _ -> (v_hasAsHead dtb_u_u73)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Match.vuna"
let v_innerOfHead = (fun (dtb_u_u82 : Frontend_dAst.t_Pat) -> (match dtb_u_u82 with
  | Frontend_dAst.C_Pat_PAs (dtb_u_u83, dtb_u_u84, dtb_u_u85) -> dtb_u_u84
  | _ -> dtb_u_u82
))

# 256 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPatSpan = (fun (dtb_u_u86 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u86 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u87, dtb_u_u88) -> (match dtb_u_u87 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u89; B_dData_dPair.f_Pair_second = dtb_u_u90 } -> (match dtb_u_u89 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (Frontend_dAst.v_patSpan dtb_u_u91)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
))

# 278 "Vuna/Compiler/Elab/Match.vuna"
let rec v_familyOfCtor = (fun (dtb_u_u93 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u94 : string) -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if ((B_dData_dList.v_memName dtb_u_u94) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u95)))) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u95))) else ((v_familyOfCtor dtb_u_u96) dtb_u_u94))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Elab/Match.vuna"
let v_familyOfHead = (fun (dtb_u_u97 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u98 : string) -> (match ((v_familyOfCtor dtb_u_u97) dtb_u_u98) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u99) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u99)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u100 = (Frontend_dReserved.v_classify dtb_u_u98) in (match dtb_u_u100 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u101) -> (match dtb_u_u101 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((Elab_dCoverage.v_familyOfShortCtors dtb_u_u97) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil)))))
  | Frontend_dReserved.C_Reserved_RsListNil -> ((Elab_dCoverage.v_familyOfShortCtors dtb_u_u97) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Elab/Match.vuna"
let rec v_canonHeads = (fun (dtb_u_u102 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u103 : string B_dData_dList.t_List) -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (match ((Elab_dCoverage.v_sentinelCtorIn dtb_u_u102) dtb_u_u104) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u106) -> (match ((v_canonHeads dtb_u_u102) dtb_u_u105) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u106, dtb_u_u107))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Elab/Match.vuna"
let v_familyCovered = (fun (dtb_u_u108 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u109 : string B_dData_dList.t_List) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (match ((v_familyOfHead dtb_u_u108) dtb_u_u110) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u112) -> (let dtb_u_u113 = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u112) in (match ((v_canonHeads dtb_u_u112) dtb_u_u109) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u114) -> ((B_dData_dList.v_allMem dtb_u_u113) dtb_u_u114)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasCtorHead = (fun (dtb_u_u115 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u116, dtb_u_u117) -> (let dtb_u_u118 = dtb_u_u116 in (match dtb_u_u118 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u119; B_dData_dPair.f_Pair_second = dtb_u_u120 } -> (match dtb_u_u119 with
  | B_dData_dList.C_List_Nil -> (v_hasCtorHead dtb_u_u117)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> (match dtb_u_u121 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u123, dtb_u_u124, dtb_u_u125) -> true
  | _ -> (v_hasCtorHead dtb_u_u117)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allCtorHeads = (fun (dtb_u_u126 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u126 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u127, dtb_u_u128) -> (let dtb_u_u129 = dtb_u_u127 in (match dtb_u_u129 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u130; B_dData_dPair.f_Pair_second = dtb_u_u131 } -> (match dtb_u_u130 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u132, dtb_u_u133) -> (match dtb_u_u132 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u134, dtb_u_u135, dtb_u_u136) -> (v_allCtorHeads dtb_u_u128)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Match.vuna"
let v_isWildPat = (fun (dtb_u_u137 : Frontend_dAst.t_Pat) -> (match dtb_u_u137 with
  | Frontend_dAst.C_Pat_PWild (dtb_u_u138) -> true
  | _ -> false
))

# 346 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allWildPats = (fun (dtb_u_u139 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u139 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u140, dtb_u_u141) -> (if (v_isWildPat dtb_u_u140) then (v_allWildPats dtb_u_u141) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPats = (fun (dtb_u_u142 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u142 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u143, dtb_u_u144) -> (match dtb_u_u143 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u145; B_dData_dPair.f_Pair_second = dtb_u_u146 } -> dtb_u_u145
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Elab/Match.vuna"
let rec v_irrefutablePat = (fun (dtb_u_u147 : Frontend_dAst.t_Pat) -> (match dtb_u_u147 with
  | Frontend_dAst.C_Pat_PAs (dtb_u_u148, dtb_u_u149, dtb_u_u150) -> (v_irrefutablePat dtb_u_u149)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u151) -> true
  | Frontend_dAst.C_Pat_PVar (dtb_u_u152, dtb_u_u153) -> true
  | _ -> false
))

# 365 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allIrrefutablePats = (fun (dtb_u_u154 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u154 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u155, dtb_u_u156) -> (if (v_irrefutablePat dtb_u_u155) then (v_allIrrefutablePats dtb_u_u156) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Match.vuna"
let[@tail_mod_cons] rec v_pruneRows = (fun (dtb_u_u157 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u157 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u158, dtb_u_u159) -> (if (v_allIrrefutablePats (B_dData_dPair.v_firstOf dtb_u_u158)) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u158, B_dData_dList.C_List_Nil)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u158, (v_pruneRows dtb_u_u159))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allEmptyPats = (fun (dtb_u_u160 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u160 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u162) -> (let dtb_u_u163 = dtb_u_u161 in (match dtb_u_u163 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u164; B_dData_dPair.f_Pair_second = dtb_u_u165 } -> (match dtb_u_u164 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyPats dtb_u_u162)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Match.vuna"
let v_bodyOfFirst = (fun (dtb_u_u166 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u166 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EInt (0, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u167, dtb_u_u168) -> (match dtb_u_u167 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u169; B_dData_dPair.f_Pair_second = dtb_u_u170 } -> dtb_u_u170
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Elab/Match.vuna"
let v_isVarPatD = (fun (dtb_u_u171 : Frontend_dAst.t_Pat) -> (match dtb_u_u171 with
  | Frontend_dAst.C_Pat_PWild (dtb_u_u172) -> true
  | Frontend_dAst.C_Pat_PVar (dtb_u_u173, dtb_u_u174) -> true
  | _ -> false
))

# 390 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarHeads = (fun (dtb_u_u175 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u175 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u176, dtb_u_u177) -> (let dtb_u_u178 = dtb_u_u176 in (match dtb_u_u178 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u180 } -> (match dtb_u_u179 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u182) -> (if (v_isVarPatD dtb_u_u181) then (v_allVarHeads dtb_u_u177) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripFirstCol = (fun (dtb_u_u183 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u183 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u184, dtb_u_u185) -> (let dtb_u_u186 = dtb_u_u184 in (match dtb_u_u186 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u187; B_dData_dPair.f_Pair_second = dtb_u_u188 } -> (match dtb_u_u187 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u189, dtb_u_u190) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u190; B_dData_dPair.f_Pair_second = dtb_u_u188 }, (v_stripFirstCol dtb_u_u185)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u184, (v_stripFirstCol dtb_u_u185)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Elab/Match.vuna"
let rec v_patNamesOf = (fun (dtb_u_u191 : Frontend_dAst.t_Pat) -> (match dtb_u_u191 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u192, dtb_u_u193, dtb_u_u194) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u195 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patNamesOf (B_dData_dPair.v_secondOf dtb_u_u195)))) dtb_u_u193)
  | Frontend_dAst.C_Pat_PStr (dtb_u_u196, dtb_u_u197) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb_u_u198, dtb_u_u199) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb_u_u200, dtb_u_u201, dtb_u_u202) -> ((B_dData_dList.v_concatMap v_patNamesOf) dtb_u_u201)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u203) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb_u_u204, dtb_u_u205, dtb_u_u206) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u204, (v_patNamesOf dtb_u_u205)))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u207, dtb_u_u208) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u207, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Elab/Match.vuna"
let rec v_bindNames = (fun (dtb_u_u209 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u209 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u210, dtb_u_u211) -> ((B_dData_dList.v_append (v_patNamesOf (dtb_u_u210).Frontend_dAst.f_Binding_bindPat)) (v_bindNames dtb_u_u211))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Match.vuna"
let rec v_renameExprF = (fun (dtb_u_u212 : int) (dtb_u_u213 : string) (dtb_u_u214 : string) (dtb_u_u215 : Frontend_dAst.t_Expr) -> (if (dtb_u_u212 <= 0) then dtb_u_u215 else (match dtb_u_u215 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u216, dtb_u_u217) -> (if (dtb_u_u216 = dtb_u_u213) then (Frontend_dAst.C_Expr_EVar (dtb_u_u214, dtb_u_u217)) else dtb_u_u215)
  | Frontend_dAst.C_Expr_EInt (dtb_u_u218, dtb_u_u219) -> (Frontend_dAst.C_Expr_EInt (dtb_u_u218, dtb_u_u219))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u220, dtb_u_u221) -> (Frontend_dAst.C_Expr_EStr (dtb_u_u220, dtb_u_u221))
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u222, dtb_u_u223) -> (Frontend_dAst.C_Expr_EFloat (dtb_u_u222, dtb_u_u223))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u224, dtb_u_u225, dtb_u_u226) -> (Frontend_dAst.C_Expr_ELam (dtb_u_u224, (((((v_renameExprUnlessF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u224)) dtb_u_u225), dtb_u_u226))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u227, dtb_u_u228, dtb_u_u229) -> (Frontend_dAst.C_Expr_EApp (((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u227), ((B_dData_dList.v_map (((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214)) dtb_u_u228), dtb_u_u229))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u230, dtb_u_u231, dtb_u_u232, dtb_u_u233, dtb_u_u234, dtb_u_u235) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u230, dtb_u_u231, dtb_u_u232, ((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u233), (((((v_renameExprUnlessF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) (B_dData_dList.C_List__x58__x58_ (dtb_u_u230, B_dData_dList.C_List_Nil))) dtb_u_u234), dtb_u_u235))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u236, dtb_u_u237, dtb_u_u238, dtb_u_u239) -> (Frontend_dAst.C_Expr_ELet (((B_dData_dList.v_map (((v_renameBindF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214)) dtb_u_u236), (((((v_renameExprUnlessF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) (v_bindNames dtb_u_u236)) dtb_u_u237), dtb_u_u238, dtb_u_u239))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u240, dtb_u_u241, dtb_u_u242) -> (Frontend_dAst.C_Expr_ECase (((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u240), ((B_dData_dList.v_map (((v_renameAltF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214)) dtb_u_u241), dtb_u_u242))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u243, dtb_u_u244, dtb_u_u245, dtb_u_u246) -> (Frontend_dAst.C_Expr_EIf (((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u243), ((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u244), ((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u245), dtb_u_u246))
  | Frontend_dAst.C_Expr_EField (dtb_u_u247, dtb_u_u248, dtb_u_u249) -> (Frontend_dAst.C_Expr_EField (((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u247), dtb_u_u248, dtb_u_u249))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u250, dtb_u_u251, dtb_u_u252) -> (Frontend_dAst.C_Expr_ERecord (dtb_u_u250, ((B_dData_dList.v_map (((v_renameFieldValueF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214)) dtb_u_u251), dtb_u_u252))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u253, dtb_u_u254, dtb_u_u255) -> (Frontend_dAst.C_Expr_ERecUpdate (((((v_renameExprF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u253), ((B_dData_dList.v_map (((v_renameFieldValueF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214)) dtb_u_u254), dtb_u_u255))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u256, dtb_u_u257) -> (Frontend_dAst.C_Expr_EDo (dtb_u_u256, dtb_u_u257))
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u258, dtb_u_u259) -> (Frontend_dAst.C_Expr_EInterp (((((v_renameInterpPartsF (dtb_u_u212 - 1)) dtb_u_u213) dtb_u_u214) dtb_u_u258), dtb_u_u259))
  | _ -> failwith "DT: impossible branch"
)))
# 443 "Vuna/Compiler/Elab/Match.vuna"
and v_renameInterpPartsF = (fun (dtb_u_u260 : int) (dtb_u_u261 : string) (dtb_u_u262 : string) (dtb_u_u263 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match dtb_u_u263 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u264, dtb_u_u265) -> (match dtb_u_u264 with
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u266) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb_u_u266)), ((((v_renameInterpPartsF (dtb_u_u260 - 1)) dtb_u_u261) dtb_u_u262) dtb_u_u265)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u267) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (((((v_renameExprF (dtb_u_u260 - 1)) dtb_u_u261) dtb_u_u262) dtb_u_u267))), ((((v_renameInterpPartsF (dtb_u_u260 - 1)) dtb_u_u261) dtb_u_u262) dtb_u_u265)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 452 "Vuna/Compiler/Elab/Match.vuna"
and v_renameExprUnlessF = (fun (dtb_u_u268 : int) (dtb_u_u269 : string) (dtb_u_u270 : string) (dtb_u_u271 : string B_dData_dList.t_List) (dtb_u_u272 : Frontend_dAst.t_Expr) -> (if ((B_dData_dList.v_memName dtb_u_u269) dtb_u_u271) then dtb_u_u272 else ((((v_renameExprF (dtb_u_u268 - 1)) dtb_u_u269) dtb_u_u270) dtb_u_u272)))
# 456 "Vuna/Compiler/Elab/Match.vuna"
and v_renameBindF = (fun (dtb_u_u273 : int) (dtb_u_u274 : string) (dtb_u_u275 : string) (dtb_u_u276 : Frontend_dAst.t_Binding) -> (let dtb_u_u277 = (match (dtb_u_u276).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u280) -> (Frontend_dAst.C_BindingValue_BVal (((((v_renameExprF (dtb_u_u273 - 1)) dtb_u_u274) dtb_u_u275) dtb_u_u280)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u281) -> (Frontend_dAst.C_BindingValue_BClauses (((B_dData_dList.v_map (((v_renameLocalClauseF (dtb_u_u273 - 1)) dtb_u_u274) dtb_u_u275)) dtb_u_u281)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u278 = (match (dtb_u_u276).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u279) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb_u_u279 with Frontend_dAst.f_BindingSig_sigType = ((((v_renameExprF (dtb_u_u273 - 1)) dtb_u_u274) dtb_u_u275) (dtb_u_u279).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { dtb_u_u276 with Frontend_dAst.f_Binding_bindValue = dtb_u_u277; Frontend_dAst.f_Binding_bindSig = dtb_u_u278 })))
# 469 "Vuna/Compiler/Elab/Match.vuna"
and v_renameFieldValueF = (fun (dtb_u_u282 : int) (dtb_u_u283 : string) (dtb_u_u284 : string) (dtb_u_u285 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u285); B_dData_dPair.f_Pair_second = ((((v_renameExprF (dtb_u_u282 - 1)) dtb_u_u283) dtb_u_u284) (B_dData_dPair.v_secondOf dtb_u_u285)) })
# 473 "Vuna/Compiler/Elab/Match.vuna"
and v_renameLocalClauseF = (fun (dtb_u_u286 : int) (dtb_u_u287 : string) (dtb_u_u288 : string) (dtb_u_u289 : Frontend_dAst.t_LocalClause) -> { dtb_u_u289 with Frontend_dAst.f_LocalClause_lcBody = (((((v_renameExprUnlessF (dtb_u_u286 - 1)) dtb_u_u287) dtb_u_u288) ((B_dData_dList.v_concatMap v_patNamesOf) (dtb_u_u289).Frontend_dAst.f_LocalClause_lcPats)) (dtb_u_u289).Frontend_dAst.f_LocalClause_lcBody) })
# 498 "Vuna/Compiler/Elab/Match.vuna"
and v_renameAltF = (fun (dtb_u_u290 : int) (dtb_u_u291 : string) (dtb_u_u292 : string) (dtb_u_u293 : Frontend_dAst.t_Alt) -> { dtb_u_u293 with Frontend_dAst.f_Alt_altBody = (((((v_renameExprUnlessF (dtb_u_u290 - 1)) dtb_u_u291) dtb_u_u292) (v_patNamesOf (dtb_u_u293).Frontend_dAst.f_Alt_altPat)) (dtb_u_u293).Frontend_dAst.f_Alt_altBody) })

# 418 "Vuna/Compiler/Elab/Match.vuna"
let v_renameExpr = (fun (dtb_u_u294 : string) (dtb_u_u295 : string) (dtb_u_u296 : Frontend_dAst.t_Expr) -> ((((v_renameExprF ((Frontend_dAstQuery.v_exprBudget 32) dtb_u_u296)) dtb_u_u294) dtb_u_u295) dtb_u_u296))

# 173 "Vuna/Compiler/Elab/Match.vuna"
let v_literalBranchBody = (fun (dtb_u_u297 : string) (dtb_u_u298 : Frontend_dAst.t_Pat) (dtb_u_u299 : Frontend_dAst.t_Expr) -> (match dtb_u_u298 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u300, dtb_u_u301) -> (((v_renameExpr dtb_u_u300) dtb_u_u297) dtb_u_u299)
  | _ -> dtb_u_u299
))

# 163 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterLitBranch = (fun (dtb_u_u302 : Frontend_dAst.t_Pat) (dtb_u_u303 : string) (dtb_u_u304 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u305 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u304 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u306, dtb_u_u307) -> (match dtb_u_u306 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u308; B_dData_dPair.f_Pair_second = dtb_u_u309 } -> (match dtb_u_u308 with
  | B_dData_dList.C_List_Nil -> ((((v_filterLitBranch dtb_u_u302) dtb_u_u303) dtb_u_u307) dtb_u_u305)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u310, dtb_u_u311) -> (if ((v_litPatMatches dtb_u_u302) dtb_u_u310) then ((((v_filterLitBranch dtb_u_u302) dtb_u_u303) dtb_u_u307) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u311; B_dData_dPair.f_Pair_second = (((v_literalBranchBody dtb_u_u303) dtb_u_u310) dtb_u_u309) }, dtb_u_u305))) else ((((v_filterLitBranch dtb_u_u302) dtb_u_u303) dtb_u_u307) dtb_u_u305))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u305)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Elab/Match.vuna"
let v_litBranchClauses = (fun (dtb_u_u312 : Frontend_dAst.t_Pat) (dtb_u_u313 : string) (dtb_u_u314 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_filterLitBranch dtb_u_u312) dtb_u_u313) dtb_u_u314) B_dData_dList.C_List_Nil))

# 249 "Vuna/Compiler/Elab/Match.vuna"
let v_renameAsHead = (fun (dtb_u_u315 : string) (dtb_u_u316 : Frontend_dAst.t_Pat) (dtb_u_u317 : Frontend_dAst.t_Expr) -> (match dtb_u_u316 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u318, dtb_u_u319) -> (((v_renameExpr dtb_u_u318) dtb_u_u315) dtb_u_u317)
  | Frontend_dAst.C_Pat_PAs (dtb_u_u320, dtb_u_u321, dtb_u_u322) -> (((v_renameExpr dtb_u_u320) dtb_u_u315) dtb_u_u317)
  | _ -> dtb_u_u317
))

# 241 "Vuna/Compiler/Elab/Match.vuna"
let v_asInnerClause = (fun (dtb_u_u323 : string) (dtb_u_u324 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u324 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u325; B_dData_dPair.f_Pair_second = dtb_u_u326 } -> (match dtb_u_u325 with
  | B_dData_dList.C_List_Nil -> dtb_u_u324
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u327, dtb_u_u328) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_innerOfHead dtb_u_u327), B_dData_dList.C_List_Nil))) dtb_u_u328); B_dData_dPair.f_Pair_second = (((v_renameAsHead dtb_u_u323) dtb_u_u327) dtb_u_u326) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepVarColumn = (fun (dtb_u_u329 : string) (dtb_u_u330 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u330 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u331, dtb_u_u332) -> (let dtb_u_u333 = dtb_u_u331 in (match dtb_u_u333 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u334; B_dData_dPair.f_Pair_second = dtb_u_u335 } -> (match dtb_u_u334 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u331, ((v_prepVarColumn dtb_u_u329) dtb_u_u332)))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u336, dtb_u_u337) -> (match dtb_u_u336 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u338, dtb_u_u339) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u337; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb_u_u338) dtb_u_u329) dtb_u_u335) }, ((v_prepVarColumn dtb_u_u329) dtb_u_u332)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u340) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u337; B_dData_dPair.f_Pair_second = dtb_u_u335 }, ((v_prepVarColumn dtb_u_u329) dtb_u_u332)))
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u337; B_dData_dPair.f_Pair_second = dtb_u_u335 }, ((v_prepVarColumn dtb_u_u329) dtb_u_u332)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeadSpan = (fun (dtb_u_u341 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u342 : string) (dtb_u_u343 : Base_dSource.t_Span) -> (match dtb_u_u341 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u344, dtb_u_u345) -> (let dtb_u_u346 = dtb_u_u344 in (match dtb_u_u346 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u347; B_dData_dPair.f_Pair_second = dtb_u_u348 } -> (match dtb_u_u347 with
  | B_dData_dList.C_List_Nil -> (((v_ctorHeadSpan dtb_u_u345) dtb_u_u342) dtb_u_u343)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u349, dtb_u_u350) -> (match dtb_u_u349 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u351, dtb_u_u352, dtb_u_u353) -> (if (dtb_u_u351 = dtb_u_u342) then (Frontend_dAst.v_nodeRefSpan dtb_u_u353) else (((v_ctorHeadSpan dtb_u_u345) dtb_u_u342) dtb_u_u343))
  | _ -> (((v_ctorHeadSpan dtb_u_u345) dtb_u_u342) dtb_u_u343)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> dtb_u_u343
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorSubPatCount = (fun (dtb_u_u354 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u355 : string) -> (match dtb_u_u354 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u356, dtb_u_u357) -> (let dtb_u_u358 = dtb_u_u356 in (match dtb_u_u358 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u359; B_dData_dPair.f_Pair_second = dtb_u_u360 } -> (match dtb_u_u359 with
  | B_dData_dList.C_List_Nil -> ((v_ctorSubPatCount dtb_u_u357) dtb_u_u355)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u361, dtb_u_u362) -> (match dtb_u_u361 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u363, dtb_u_u364, dtb_u_u365) -> (if (dtb_u_u363 = dtb_u_u355) then (B_dData_dList.v_length dtb_u_u364) else ((v_ctorSubPatCount dtb_u_u357) dtb_u_u355))
  | _ -> ((v_ctorSubPatCount dtb_u_u357) dtb_u_u355)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Elab/Match.vuna"
let rec v_subNamesForGoGo = (fun (dtb_u_u366 : string) (dtb_u_u367 : int) (dtb_u_u368 : int) (dtb_u_u369 : string B_dData_dList.t_List) -> (if (dtb_u_u367 <= 0) then (B_dData_dList.v_reverse dtb_u_u369) else ((((v_subNamesForGoGo dtb_u_u366) (dtb_u_u367 - 1)) dtb_u_u368) (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["_sc_"; dtb_u_u366; "_"; (string_of_int (dtb_u_u368 - dtb_u_u367))]), dtb_u_u369)))))

# 561 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesForGo = (fun (dtb_u_u370 : string) (dtb_u_u371 : int) (dtb_u_u372 : int) (dtb_u_u373 : string B_dData_dList.t_List) -> ((((v_subNamesForGoGo dtb_u_u370) (dtb_u_u372 - dtb_u_u371)) dtb_u_u372) dtb_u_u373))

# 558 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesFor = (fun (dtb_u_u374 : string) (dtb_u_u375 : int) -> ((((v_subNamesForGo dtb_u_u374) 0) dtb_u_u375) B_dData_dList.C_List_Nil))

# 581 "Vuna/Compiler/Elab/Match.vuna"
let[@tail_mod_cons] rec v_addNameDistinct = (fun (dtb_u_u376 : string) (dtb_u_u377 : string B_dData_dList.t_List) -> (match dtb_u_u377 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u378, dtb_u_u379) -> (if (dtb_u_u378 = dtb_u_u376) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u378, dtb_u_u379)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u378, ((v_addNameDistinct dtb_u_u376) dtb_u_u379))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u376, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 571 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeads = (fun (dtb_u_u380 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u380 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u381, dtb_u_u382) -> (let dtb_u_u383 = dtb_u_u381 in (match dtb_u_u383 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u384; B_dData_dPair.f_Pair_second = dtb_u_u385 } -> (match dtb_u_u384 with
  | B_dData_dList.C_List_Nil -> (v_ctorHeads dtb_u_u382)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u386, dtb_u_u387) -> (match dtb_u_u386 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u388, dtb_u_u389, dtb_u_u390) -> ((v_addNameDistinct dtb_u_u388) (v_ctorHeads dtb_u_u382))
  | _ -> (v_ctorHeads dtb_u_u382)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 589 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clausesForCtor = (fun (dtb_u_u391 : string) (dtb_u_u392 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u393 : string) (dtb_u_u394 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u394 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u395, dtb_u_u396) -> (let dtb_u_u397 = dtb_u_u395 in (match dtb_u_u397 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u398; B_dData_dPair.f_Pair_second = dtb_u_u399 } -> (match dtb_u_u398 with
  | B_dData_dList.C_List_Nil -> ((((v_clausesForCtor dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u396)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u400, dtb_u_u401) -> (match dtb_u_u400 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u402, dtb_u_u403, dtb_u_u404) -> (if (dtb_u_u402 = dtb_u_u391) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u403) dtb_u_u401); B_dData_dPair.f_Pair_second = dtb_u_u399 }, ((((v_clausesForCtor dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u396))) else ((((v_clausesForCtor dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u396))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u405, dtb_u_u406) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u392) dtb_u_u401); B_dData_dPair.f_Pair_second = (((v_renameExpr dtb_u_u405) dtb_u_u393) dtb_u_u399) }, ((((v_clausesForCtor dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u396)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u407) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u392) dtb_u_u401); B_dData_dPair.f_Pair_second = dtb_u_u399 }, ((((v_clausesForCtor dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u396)))
  | _ -> ((((v_clausesForCtor dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u396)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 606 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterFallback = (fun (dtb_u_u408 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u408 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u409, dtb_u_u410) -> (let dtb_u_u411 = dtb_u_u409 in (match dtb_u_u411 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u412; B_dData_dPair.f_Pair_second = dtb_u_u413 } -> (match dtb_u_u412 with
  | B_dData_dList.C_List_Nil -> (v_filterFallback dtb_u_u410)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u414, dtb_u_u415) -> (if (v_isVarPatD dtb_u_u414) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u409, (v_filterFallback dtb_u_u410))) else (v_filterFallback dtb_u_u410))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 625 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepFallbacks = (fun (dtb_u_u416 : string) (dtb_u_u417 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u417 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u418, dtb_u_u419) -> (let dtb_u_u420 = dtb_u_u418 in (match dtb_u_u420 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u421; B_dData_dPair.f_Pair_second = dtb_u_u422 } -> (match dtb_u_u421 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u418, ((v_prepFallbacks dtb_u_u416) dtb_u_u419)))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u423, dtb_u_u424) -> (match dtb_u_u423 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u425, dtb_u_u426) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u424; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb_u_u425) dtb_u_u416) dtb_u_u422) }, ((v_prepFallbacks dtb_u_u416) dtb_u_u419)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u427) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u424; B_dData_dPair.f_Pair_second = dtb_u_u422 }, ((v_prepFallbacks dtb_u_u416) dtb_u_u419)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u418, ((v_prepFallbacks dtb_u_u416) dtb_u_u419)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Elab/Match.vuna"
let rec v_litAltExpr = (fun (dtb_u_u428 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u429 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u430 : string) (dtb_u_u431 : string B_dData_dList.t_List) (dtb_u_u432 : Base_dSource.t_Span) (dtb_u_u433 : int) -> (if (dtb_u_u433 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((((((v_litAltExprGo dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u433)))
# 139 "Vuna/Compiler/Elab/Match.vuna"
and v_litAltExprGo = (fun (dtb_u_u434 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u435 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u436 : string) (dtb_u_u437 : string B_dData_dList.t_List) (dtb_u_u438 : Base_dSource.t_Span) (dtb_u_u439 : int) -> (if (dtb_u_u439 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let dtb_u_u440 = dtb_u_u435 in (match dtb_u_u440 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u441, dtb_u_u442) -> (match dtb_u_u441 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u443; B_dData_dPair.f_Pair_second = dtb_u_u444 } -> (match dtb_u_u443 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u438) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u445, dtb_u_u446) -> (match dtb_u_u445 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u447, dtb_u_u448) -> (((((v_buildColumnExpr dtb_u_u434) ((v_prepVarColumn dtb_u_u436) dtb_u_u435)) dtb_u_u437) dtb_u_u438) (dtb_u_u439 - 1))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u449) -> (((((v_buildColumnExpr dtb_u_u434) (v_stripFirstCol dtb_u_u435)) dtb_u_u437) dtb_u_u438) (dtb_u_u439 - 1))
  | _ -> ((Base_dCommon.v_bind ((((((v_litAltExprGo dtb_u_u434) dtb_u_u442) dtb_u_u436) dtb_u_u437) dtb_u_u438) (dtb_u_u439 - 1))) (fun (dtb_u_u450 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_buildColumnExpr dtb_u_u434) (((v_litBranchClauses dtb_u_u445) dtb_u_u436) dtb_u_u435)) dtb_u_u437) dtb_u_u438) (dtb_u_u439 - 1))) (fun (dtb_u_u451 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("==", (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb_u_u436, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))), (B_dData_dList.C_List__x58__x58_ ((v_litPatExpr dtb_u_u445), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb_u_u445)))), dtb_u_u451, dtb_u_u450, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb_u_u445))))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u438) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
))))
# 199 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExpr = (fun (dtb_u_u452 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u453 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u454 : string B_dData_dList.t_List) (dtb_u_u455 : Base_dSource.t_Span) (dtb_u_u456 : int) -> (if (dtb_u_u456 <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (((((v_buildColumnExprPruned dtb_u_u452) (v_pruneRows dtb_u_u453)) dtb_u_u454) dtb_u_u455) dtb_u_u456)))
# 206 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExprPruned = (fun (dtb_u_u457 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u458 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u459 : string B_dData_dList.t_List) (dtb_u_u460 : Base_dSource.t_Span) (dtb_u_u461 : int) -> (if (dtb_u_u461 <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (if (v_allEmptyPats dtb_u_u458) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst dtb_u_u458))) else (if (v_allWildPats (v_firstPats dtb_u_u458)) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst dtb_u_u458))) else (match dtb_u_u459 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u460) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u462, dtb_u_u463) -> (if (v_hasAsHead dtb_u_u458) then ((((((v_asColumn dtb_u_u457) dtb_u_u458) dtb_u_u462) dtb_u_u463) dtb_u_u460) dtb_u_u461) else (if (v_allVarHeads dtb_u_u458) then (((((v_buildColumnExpr dtb_u_u457) ((v_prepVarColumn dtb_u_u462) dtb_u_u458)) dtb_u_u463) dtb_u_u460) (dtb_u_u461 - 1)) else (if (v_allCtorHeads dtb_u_u458) then ((((((v_ctorColumn dtb_u_u457) dtb_u_u458) dtb_u_u462) dtb_u_u463) dtb_u_u460) dtb_u_u461) else (if (v_hasCtorHead dtb_u_u458) then ((((((v_ctorColumn dtb_u_u457) dtb_u_u458) dtb_u_u462) dtb_u_u463) dtb_u_u460) dtb_u_u461) else ((((((v_litAltExpr dtb_u_u457) dtb_u_u458) dtb_u_u462) dtb_u_u463) dtb_u_u460) (dtb_u_u461 - 1))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 232 "Vuna/Compiler/Elab/Match.vuna"
and v_asColumn = (fun (dtb_u_u464 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u465 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u466 : string) (dtb_u_u467 : string B_dData_dList.t_List) (dtb_u_u468 : Base_dSource.t_Span) (dtb_u_u469 : int) -> (if (dtb_u_u469 <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else ((Base_dCommon.v_bind (((((v_buildColumnExpr dtb_u_u464) ((B_dData_dList.v_map (v_asInnerClause dtb_u_u466)) dtb_u_u465)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u466, dtb_u_u467))) dtb_u_u468) (dtb_u_u469 - 1))) (fun (dtb_u_u470 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC (dtb_u_u470))))))
# 265 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorColumn = (fun (dtb_u_u471 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u472 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u473 : string) (dtb_u_u474 : string B_dData_dList.t_List) (dtb_u_u475 : Base_dSource.t_Span) (dtb_u_u476 : int) -> (if (dtb_u_u476 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((Base_dCommon.v_bind ((((((v_ctorAltList dtb_u_u471) dtb_u_u472) dtb_u_u473) dtb_u_u474) dtb_u_u475) (dtb_u_u476 - 1))) (fun (dtb_u_u477 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (let dtb_u_u478 = (v_firstPatSpan dtb_u_u472) in (if ((v_familyCovered dtb_u_u471) (v_ctorHeads dtb_u_u472)) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (dtb_u_u473, (Frontend_dAst.v_detachedNodeRef dtb_u_u478))), dtb_u_u477, (Frontend_dAst.v_detachedNodeRef dtb_u_u478))))) else ((Base_dCommon.v_bind ((((((v_fallbackAltList dtb_u_u471) dtb_u_u473) dtb_u_u472) dtb_u_u474) dtb_u_u475) (dtb_u_u476 - 1))) (fun (dtb_u_u479 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (dtb_u_u473, (Frontend_dAst.v_detachedNodeRef dtb_u_u478))), ((B_dData_dList.v_append dtb_u_u477) dtb_u_u479), (Frontend_dAst.v_detachedNodeRef dtb_u_u478)))))))))))))
# 509 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltList = (fun (dtb_u_u480 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u481 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u482 : string) (dtb_u_u483 : string B_dData_dList.t_List) (dtb_u_u484 : Base_dSource.t_Span) (dtb_u_u485 : int) -> (if (dtb_u_u485 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (((((((v_ctorAltListGo dtb_u_u480) dtb_u_u481) (v_ctorHeads dtb_u_u481)) dtb_u_u482) dtb_u_u483) dtb_u_u484) dtb_u_u485)))
# 516 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltListGo = (fun (dtb_u_u486 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u487 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u488 : string B_dData_dList.t_List) (dtb_u_u489 : string) (dtb_u_u490 : string B_dData_dList.t_List) (dtb_u_u491 : Base_dSource.t_Span) (dtb_u_u492 : int) -> (match dtb_u_u488 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u493, dtb_u_u494) -> (if (dtb_u_u492 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let dtb_u_u495 = ((v_ctorSubPatCount dtb_u_u487) dtb_u_u493) in (let dtb_u_u496 = ((v_subNamesFor dtb_u_u489) dtb_u_u495) in (let dtb_u_u497 = ((B_dData_dList.v_append dtb_u_u496) dtb_u_u490) in (let dtb_u_u498 = ((B_dData_dList.v_map (fun (dtb_u_u503 : string) -> (Frontend_dAst.C_Pat_PVar (dtb_u_u503, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))))) dtb_u_u496) in (let dtb_u_u499 = (((v_ctorHeadSpan dtb_u_u487) dtb_u_u493) dtb_u_u491) in (let dtb_u_u500 = ((((v_clausesForCtor dtb_u_u493) dtb_u_u498) dtb_u_u489) dtb_u_u487) in ((Base_dCommon.v_bind (((((v_buildColumnExpr dtb_u_u486) dtb_u_u500) dtb_u_u497) dtb_u_u491) (dtb_u_u492 - 1))) (fun (dtb_u_u501 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((((v_ctorAltListGo dtb_u_u486) dtb_u_u487) dtb_u_u494) dtb_u_u489) dtb_u_u490) dtb_u_u491) (dtb_u_u492 - 1))) (fun (dtb_u_u502 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb_u_u493, dtb_u_u498, (Frontend_dAst.v_detachedNodeRef dtb_u_u499))); Frontend_dAst.f_Alt_altBody = dtb_u_u501; Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) }, dtb_u_u502)))))))))))))))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u492 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 616 "Vuna/Compiler/Elab/Match.vuna"
and v_fallbackAltList = (fun (dtb_u_u504 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u505 : string) (dtb_u_u506 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u507 : string B_dData_dList.t_List) (dtb_u_u508 : Base_dSource.t_Span) (dtb_u_u509 : int) -> (if (dtb_u_u509 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (match ((v_prepFallbacks dtb_u_u505) (v_filterFallback dtb_u_u506)) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | dtb_u_u510 -> ((Base_dCommon.v_bind (((((v_buildColumnExpr dtb_u_u504) dtb_u_u510) dtb_u_u507) dtb_u_u508) (dtb_u_u509 - 1))) (fun (dtb_u_u511 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))); Frontend_dAst.f_Alt_altBody = dtb_u_u511; Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) }, B_dData_dList.C_List_Nil))))))
)))

# 45 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToExpr = (fun (dtb_u_u512 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u513 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_arityOf dtb_u_u513) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses) B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u514) -> (if ((v_clauseArityTooMany dtb_u_u514) dtb_u_u513) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan dtb_u_u513)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else ((Base_dCommon.v_bind ((v_checkReachable dtb_u_u512) dtb_u_u513)) (fun (dtb_u_u515 : bool) -> (let dtb_u_u516 = (v_paramNames dtb_u_u514) in ((Base_dCommon.v_bind (((((v_buildColumnExpr dtb_u_u512) dtb_u_u513) dtb_u_u516) (v_firstPatSpan dtb_u_u513)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf dtb_u_u513)))) (fun (dtb_u_u517 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC (((v_wrapLambdas dtb_u_u516) dtb_u_u517)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToCaseExpr = (fun (dtb_u_u518 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u519 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u520 : string) -> (match (v_arityOf dtb_u_u519) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan dtb_u_u519)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u521) -> (if ((v_clauseArityTooMany dtb_u_u521) dtb_u_u519) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan dtb_u_u519)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else (((((v_buildColumnExpr dtb_u_u518) dtb_u_u519) (B_dData_dList.C_List__x58__x58_ (dtb_u_u520, B_dData_dList.C_List_Nil))) (v_firstPatSpan dtb_u_u519)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf dtb_u_u519))))
  | _ -> failwith "DT: impossible branch"
))
