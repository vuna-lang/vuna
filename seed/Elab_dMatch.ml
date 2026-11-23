open Vuna_runtime
# 28 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarPats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Frontend_dRast.C_Pat_PVar (dtb__2, dtb__3) -> (v_allVarPats dtb__1)
  | Frontend_dRast.C_Pat_PWild (dtb__4) -> (v_allVarPats dtb__1)
  | Frontend_dRast.C_Pat_PAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clauseArityTooMany = (fun (mc0 : int) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (if ((B_dData_dList.v_length dtb__10) > mc0) then true else ((v_clauseArityTooMany mc0) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Match.vuna"
let v_clauseHeadSpan = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.v_exprSpan mc1)
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (Frontend_dRast.v_patSpan dtb__12)
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripAsPat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PAs (dtb__14, dtb__15, dtb__16) -> (v_stripAsPat dtb__15)
  | _ -> mc0
))

# 73 "Vuna/Compiler/Elab/Match.vuna"
let rec v_reachableGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Frontend_dRast.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__17 with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (let qs = ((B_dData_dList.v_map v_stripAsPat) dtb__19) in (match ((((Elab_dCoverage.v_clauseCover mc0) mc1) mc2) qs) with
  | Elab_dCoverage.C_ClauseCover_CovCovered -> ((Base_dDiagnostics_dTc.v_tcErr0 ((v_clauseHeadSpan dtb__19) dtb__20)) Base_dDiagnostics_dTc.C_TcErr_ClauseUnreachable)
  | _ -> ((((v_reachableGo mc0) mc1) (B_dData_dList.C_List__x58__x58_ (qs, mc2))) dtb__18)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (true))
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Elab/Match.vuna"
let v_matrixOf = (fun (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (B_dData_dList.v_map v_stripAsPat)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) clauses)))

# 64 "Vuna/Compiler/Elab/Match.vuna"
let v_checkReachable = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let rows = (v_matrixOf clauses) in (if (Elab_dCoverage.v_uniformArity rows) then ((((v_reachableGo table) (bi_natFromInt (Elab_dCoverage.v_coverageFuelFor rows))) B_dData_dList.C_List_Nil) clauses) else (Base_dDiag.C_Check_OkC (true)))))

# 112 "Vuna/Compiler/Elab/Match.vuna"
let v_arityOf = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__23)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Elab/Match.vuna"
let rec v_paramNamesGo = (fun (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_paramNamesGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

# 116 "Vuna/Compiler/Elab/Match.vuna"
let v_paramNames = (fun (n : int) -> (((v_paramNamesGo (n - 0)) n) B_dData_dList.C_List_Nil))

# 126 "Vuna/Compiler/Elab/Match.vuna"
let rec v_wrapLambdas = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), ((v_wrapLambdas dtb__26) mc1), Base_dSource.v_spanEmpty))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatMatches = (fun (mc0 : Frontend_dRast.t_Pat) (mc1 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PStr (dtb__27, dtb__28) -> (match mc1 with
  | Frontend_dRast.C_Pat_PStr (dtb__29, dtb__30) -> (dtb__27 = dtb__29)
  | Frontend_dRast.C_Pat_PVar (dtb__31, dtb__32) -> true
  | Frontend_dRast.C_Pat_PWild (dtb__33) -> true
  | _ -> false
)
  | Frontend_dRast.C_Pat_PInt (dtb__34, dtb__35) -> (match mc1 with
  | Frontend_dRast.C_Pat_PInt (dtb__36, dtb__37) -> (dtb__34 = dtb__36)
  | Frontend_dRast.C_Pat_PVar (dtb__38, dtb__39) -> true
  | Frontend_dRast.C_Pat_PWild (dtb__40) -> true
  | _ -> false
)
  | _ -> false
))

# 191 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatExpr = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PStr (dtb__41, dtb__42) -> (Frontend_dRast.C_Expr_EStr (dtb__41, dtb__42))
  | Frontend_dRast.C_Pat_PInt (dtb__43, dtb__44) -> (Frontend_dRast.C_Expr_EInt (dtb__43, dtb__44))
  | _ -> (Frontend_dRast.C_Expr_EInt (0, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))
))

# 223 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasAsHead = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (let nd_uscrut4 = dtb__45 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 } -> (match dtb__47 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (match dtb__49 with
  | Frontend_dRast.C_Pat_PAs (dtb__51, dtb__52, dtb__53) -> true
  | _ -> (v_hasAsHead dtb__46)
)
  | _ -> (v_hasAsHead dtb__46)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Match.vuna"
let v_innerOfHead = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PAs (dtb__54, dtb__55, dtb__56) -> dtb__55
  | _ -> mc0
))

# 254 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPatSpan = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__57 with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (match dtb__59 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (Frontend_dRast.v_patSpan dtb__61)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
))

# 276 "Vuna/Compiler/Elab/Match.vuna"
let rec v_familyOfCtor = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if ((B_dData_dList.v_memName mc1) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__63)))) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__63))) else ((v_familyOfCtor dtb__64) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Elab/Match.vuna"
let v_familyOfHead = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (h : string) -> (match ((v_familyOfCtor table) h) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__65)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Frontend_dReserved.v_isListNilSyntax h) then ((Elab_dCoverage.v_familyOfShortCtors table) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil))) else (if (Frontend_dReserved.v_isListConsSyntax h) then ((Elab_dCoverage.v_familyOfShortCtors table) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil))))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Elab/Match.vuna"
let rec v_canonHeads = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match ((Elab_dCoverage.v_sentinelCtorIn mc0) dtb__66) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (match ((v_canonHeads mc0) dtb__67) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Match.vuna"
let v_familyCovered = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match ((v_familyOfHead mc0) dtb__70) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (let names = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__72) in (match ((v_canonHeads dtb__72) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> ((B_dData_dList.v_allMem names) dtb__73)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasCtorHead = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (let nd_uscrut4 = dtb__74 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__76; B_dData_dPair.f_Pair_second = dtb__77 } -> (match dtb__76 with
  | B_dData_dList.C_List_Nil -> (v_hasCtorHead dtb__75)
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | Frontend_dRast.C_Pat_PCon (dtb__80, dtb__81, dtb__82) -> true
  | _ -> (v_hasCtorHead dtb__75)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allCtorHeads = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (let nd_uscrut4 = dtb__83 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__85; B_dData_dPair.f_Pair_second = dtb__86 } -> (match dtb__85 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (match dtb__87 with
  | Frontend_dRast.C_Pat_PCon (dtb__89, dtb__90, dtb__91) -> (v_allCtorHeads dtb__84)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Match.vuna"
let v_isWildPat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PWild (dtb__92) -> true
  | _ -> false
))

# 343 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allWildPats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (if (v_isWildPat dtb__93) then (v_allWildPats dtb__94) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPats = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match dtb__95 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Elab/Match.vuna"
let rec v_irrefutablePat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PAs (dtb__99, dtb__100, dtb__101) -> (v_irrefutablePat dtb__100)
  | Frontend_dRast.C_Pat_PWild (dtb__102) -> true
  | Frontend_dRast.C_Pat_PVar (dtb__103, dtb__104) -> true
  | _ -> false
))

# 362 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allIrrefutablePats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (if (v_irrefutablePat dtb__105) then (v_allIrrefutablePats dtb__106) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Elab/Match.vuna"
let rec v_pruneRows = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (if (v_allIrrefutablePats (B_dData_dPair.v_firstOf dtb__107)) then (B_dData_dList.C_List__x58__x58_ (dtb__107, B_dData_dList.C_List_Nil)) else (B_dData_dList.C_List__x58__x58_ (dtb__107, (v_pruneRows dtb__108))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allEmptyPats = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (let nd_uscrut4 = dtb__109 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (match dtb__111 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyPats dtb__110)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Elab/Match.vuna"
let v_bodyOfFirst = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EInt (0, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (match dtb__113 with
  | { B_dData_dPair.f_Pair_first = dtb__115; B_dData_dPair.f_Pair_second = dtb__116 } -> dtb__116
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Elab/Match.vuna"
let v_isVarPatD = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PWild (dtb__117) -> true
  | Frontend_dRast.C_Pat_PVar (dtb__118, dtb__119) -> true
  | _ -> false
))

# 387 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarHeads = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (let nd_uscrut4 = dtb__120 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> (match dtb__122 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (if (v_isVarPatD dtb__124) then (v_allVarHeads dtb__121) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripFirstCol = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (let nd_uscrut4 = dtb__126 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = dtb__129 } -> (match dtb__128 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__129 }, (v_stripFirstCol dtb__127)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__126, (v_stripFirstCol dtb__127)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Elab/Match.vuna"
let rec v_patNamesOf = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__132, dtb__133, dtb__134) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair) -> (v_patNamesOf (B_dData_dPair.v_secondOf f)))) dtb__133)
  | Frontend_dRast.C_Pat_PStr (dtb__135, dtb__136) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Pat_PInt (dtb__137, dtb__138) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Pat_PCon (dtb__139, dtb__140, dtb__141) -> ((B_dData_dList.v_concatMap v_patNamesOf) dtb__140)
  | Frontend_dRast.C_Pat_PWild (dtb__142) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Pat_PAs (dtb__143, dtb__144, dtb__145) -> (B_dData_dList.C_List__x58__x58_ (dtb__143, (v_patNamesOf dtb__144)))
  | Frontend_dRast.C_Pat_PVar (dtb__146, dtb__147) -> (B_dData_dList.C_List__x58__x58_ (dtb__146, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 492 "Vuna/Compiler/Elab/Match.vuna"
let rec v_bindNames = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> ((B_dData_dList.v_append (v_patNamesOf (B_dData_dPair.v_firstOf dtb__148))) (v_bindNames dtb__149))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Elab/Match.vuna"
let rec v_renameExpr = (fun (oldName : string) (newName : string) (e : Frontend_dRast.t_Expr) -> (match e with
  | Frontend_dRast.C_Expr_EVar (dtb__150, dtb__151) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__150) = oldName) then (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName newName), dtb__151)) else e)
  | Frontend_dRast.C_Expr_EInt (dtb__152, dtb__153) -> (Frontend_dRast.C_Expr_EInt (dtb__152, dtb__153))
  | Frontend_dRast.C_Expr_EStr (dtb__154, dtb__155) -> (Frontend_dRast.C_Expr_EStr (dtb__154, dtb__155))
  | Frontend_dRast.C_Expr_EFloat (dtb__156, dtb__157) -> (Frontend_dRast.C_Expr_EFloat (dtb__156, dtb__157))
  | Frontend_dRast.C_Expr_ELam (dtb__158, dtb__159, dtb__160) -> (Frontend_dRast.C_Expr_ELam (dtb__158, ((((v_renameExprUnless oldName) newName) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__158)) dtb__159), dtb__160))
  | Frontend_dRast.C_Expr_EApp (dtb__161, dtb__162, dtb__163) -> (Frontend_dRast.C_Expr_EApp ((((v_renameExpr oldName) newName) dtb__161), ((B_dData_dList.v_map ((v_renameExpr oldName) newName)) dtb__162), dtb__163))
  | Frontend_dRast.C_Expr_EPi (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (Frontend_dRast.C_Expr_EPi (dtb__164, dtb__165, dtb__166, (((v_renameExpr oldName) newName) dtb__167), ((((v_renameExprUnless oldName) newName) (B_dData_dList.C_List__x58__x58_ (dtb__164, B_dData_dList.C_List_Nil))) dtb__168), dtb__169))
  | Frontend_dRast.C_Expr_ELet (dtb__170, dtb__171, dtb__172, dtb__173) -> (Frontend_dRast.C_Expr_ELet (((B_dData_dList.v_map ((v_renameBind oldName) newName)) dtb__170), ((((v_renameExprUnless oldName) newName) (v_bindNames dtb__170)) dtb__171), dtb__172, dtb__173))
  | Frontend_dRast.C_Expr_ECase (dtb__174, dtb__175, dtb__176) -> (Frontend_dRast.C_Expr_ECase ((((v_renameExpr oldName) newName) dtb__174), ((B_dData_dList.v_map ((v_renameAlt oldName) newName)) dtb__175), dtb__176))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__177, dtb__178) -> (Frontend_dRast.C_Expr_ELocalFun (((B_dData_dList.v_map ((v_renameLocalClause oldName) newName)) dtb__177), dtb__178))
  | Frontend_dRast.C_Expr_EIf (dtb__179, dtb__180, dtb__181, dtb__182) -> (Frontend_dRast.C_Expr_EIf ((((v_renameExpr oldName) newName) dtb__179), (((v_renameExpr oldName) newName) dtb__180), (((v_renameExpr oldName) newName) dtb__181), dtb__182))
  | Frontend_dRast.C_Expr_EField (dtb__183, dtb__184, dtb__185) -> (Frontend_dRast.C_Expr_EField ((((v_renameExpr oldName) newName) dtb__183), dtb__184, dtb__185))
  | Frontend_dRast.C_Expr_ERecord (dtb__186, dtb__187, dtb__188) -> (Frontend_dRast.C_Expr_ERecord (dtb__186, ((B_dData_dList.v_map ((v_renameFieldValue oldName) newName)) dtb__187), dtb__188))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__189, dtb__190, dtb__191) -> (Frontend_dRast.C_Expr_ERecUpdate ((((v_renameExpr oldName) newName) dtb__189), ((B_dData_dList.v_map ((v_renameFieldValue oldName) newName)) dtb__190), dtb__191))
  | Frontend_dRast.C_Expr_EDo (dtb__192, dtb__193) -> (Frontend_dRast.C_Expr_EDo (dtb__192, dtb__193))
  | Frontend_dRast.C_Expr_EInfix (dtb__194, dtb__195, dtb__196, dtb__197) -> (Frontend_dRast.C_Expr_EInfix (dtb__194, (((v_renameExpr oldName) newName) dtb__195), (((v_renameExpr oldName) newName) dtb__196), dtb__197))
  | Frontend_dRast.C_Expr_EBacktick (dtb__198, dtb__199, dtb__200, dtb__201) -> (Frontend_dRast.C_Expr_EBacktick (dtb__198, (((v_renameExpr oldName) newName) dtb__199), (((v_renameExpr oldName) newName) dtb__200), dtb__201))
  | Frontend_dRast.C_Expr_ESectOp (dtb__202, dtb__203) -> (Frontend_dRast.C_Expr_ESectOp (dtb__202, dtb__203))
  | Frontend_dRast.C_Expr_ESectL (dtb__204, dtb__205, dtb__206) -> (Frontend_dRast.C_Expr_ESectL (dtb__204, (((v_renameExpr oldName) newName) dtb__205), dtb__206))
  | Frontend_dRast.C_Expr_ESectR (dtb__207, dtb__208, dtb__209) -> (Frontend_dRast.C_Expr_ESectR ((((v_renameExpr oldName) newName) dtb__207), dtb__208, dtb__209))
  | Frontend_dRast.C_Expr_EParen (dtb__210, dtb__211) -> (Frontend_dRast.C_Expr_EParen ((((v_renameExpr oldName) newName) dtb__210), dtb__211))
  | Frontend_dRast.C_Expr_EAnn (dtb__212, dtb__213, dtb__214) -> (Frontend_dRast.C_Expr_EAnn ((((v_renameExpr oldName) newName) dtb__212), (((v_renameExpr oldName) newName) dtb__213), dtb__214))
  | Frontend_dRast.C_Expr_EInterp (dtb__215, dtb__216, dtb__217) -> (Frontend_dRast.C_Expr_EInterp (dtb__215, (((v_renameInterpParts oldName) newName) dtb__216), dtb__217))
  | _ -> failwith "DT: impossible branch"
))
# 468 "Vuna/Compiler/Elab/Match.vuna"
and v_renameInterpParts = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | Frontend_dRast.C_InterpPart_IPHole (dtb__220) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPHole ((((v_renameExpr mc0) mc1) dtb__220))), (((v_renameInterpParts mc0) mc1) dtb__219)))
  | Frontend_dRast.C_InterpPart_IPText (dtb__221) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPText (dtb__221)), (((v_renameInterpParts mc0) mc1) dtb__219)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 475 "Vuna/Compiler/Elab/Match.vuna"
and v_renameExprUnless = (fun (oldName : string) (newName : string) (names : string B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) -> (if ((B_dData_dList.v_memName oldName) names) then body else (((v_renameExpr oldName) newName) body)))
# 479 "Vuna/Compiler/Elab/Match.vuna"
and v_renameBind = (fun (oldName : string) (newName : string) (bnd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf bnd); B_dData_dPair.f_Pair_second = (((v_renameExpr oldName) newName) (B_dData_dPair.v_secondOf bnd)) })
# 482 "Vuna/Compiler/Elab/Match.vuna"
and v_renameFieldValue = (fun (oldName : string) (newName : string) (field : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf field); B_dData_dPair.f_Pair_second = (((v_renameExpr oldName) newName) (B_dData_dPair.v_secondOf field)) })
# 487 "Vuna/Compiler/Elab/Match.vuna"
and v_renameLocalClause = (fun (oldName : string) (newName : string) (clause : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf clause); B_dData_dPair.f_Pair_second = ((((v_renameExprUnless oldName) newName) ((B_dData_dList.v_concatMap v_patNamesOf) (B_dData_dPair.v_firstOf clause))) (B_dData_dPair.v_secondOf clause)) })
# 505 "Vuna/Compiler/Elab/Match.vuna"
and v_renameAlt = (fun (oldName : string) (newName : string) (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (let p = (B_dData_dPair.v_firstOf alt) in { B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = ((((v_renameExprUnless oldName) newName) (v_patNamesOf p)) (B_dData_dPair.v_secondOf alt)) }))

# 171 "Vuna/Compiler/Elab/Match.vuna"
let v_literalBranchBody = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat) (mc2 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Pat_PVar (dtb__222, dtb__223) -> (((v_renameExpr dtb__222) mc0) mc2)
  | _ -> mc2
))

# 161 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterLitBranch = (fun (mc0 : Frontend_dRast.t_Pat) (mc1 : string) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | { B_dData_dPair.f_Pair_first = dtb__226; B_dData_dPair.f_Pair_second = dtb__227 } -> (match dtb__226 with
  | B_dData_dList.C_List_Nil -> ((((v_filterLitBranch mc0) mc1) dtb__225) mc3)
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (if ((v_litPatMatches mc0) dtb__228) then ((((v_filterLitBranch mc0) mc1) dtb__225) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__229; B_dData_dPair.f_Pair_second = (((v_literalBranchBody mc1) dtb__228) dtb__227) }, mc3))) else ((((v_filterLitBranch mc0) mc1) dtb__225) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Elab/Match.vuna"
let v_litBranchClauses = (fun (lit : Frontend_dRast.t_Pat) (pos : string) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_filterLitBranch lit) pos) clauses) B_dData_dList.C_List_Nil))

# 247 "Vuna/Compiler/Elab/Match.vuna"
let v_renameAsHead = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat) (mc2 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Pat_PVar (dtb__230, dtb__231) -> (((v_renameExpr dtb__230) mc0) mc2)
  | Frontend_dRast.C_Pat_PAs (dtb__232, dtb__233, dtb__234) -> (((v_renameExpr dtb__232) mc0) mc2)
  | _ -> mc2
))

# 239 "Vuna/Compiler/Elab/Match.vuna"
let v_asInnerClause = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__235; B_dData_dPair.f_Pair_second = dtb__236 } -> (match dtb__235 with
  | B_dData_dList.C_List_Nil -> mc1
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_innerOfHead dtb__237), B_dData_dList.C_List_Nil))) dtb__238); B_dData_dPair.f_Pair_second = (((v_renameAsHead mc0) dtb__237) dtb__236) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepVarColumn = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (let nd_uscrut5 = dtb__239 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__241; B_dData_dPair.f_Pair_second = dtb__242 } -> (match dtb__241 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__239, ((v_prepVarColumn mc0) dtb__240)))
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> (match dtb__243 with
  | Frontend_dRast.C_Pat_PVar (dtb__245, dtb__246) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__245) mc0) dtb__242) }, ((v_prepVarColumn mc0) dtb__240)))
  | Frontend_dRast.C_Pat_PWild (dtb__247) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = dtb__242 }, ((v_prepVarColumn mc0) dtb__240)))
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = dtb__242 }, ((v_prepVarColumn mc0) dtb__240)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorSubPatCount = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> (let nd_uscrut5 = dtb__248 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__250; B_dData_dPair.f_Pair_second = dtb__251 } -> (match dtb__250 with
  | B_dData_dList.C_List_Nil -> ((v_ctorSubPatCount dtb__249) mc1)
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match dtb__252 with
  | Frontend_dRast.C_Pat_PCon (dtb__254, dtb__255, dtb__256) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__254) = mc1) then (B_dData_dList.v_length dtb__255) else ((v_ctorSubPatCount dtb__249) mc1))
  | _ -> ((v_ctorSubPatCount dtb__249) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Elab/Match.vuna"
let rec v_subNamesForGoGo = (fun (pos : string) (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else ((((v_subNamesForGoGo pos) (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

# 556 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesForGo = (fun (pos : string) (i : int) (n : int) (acc : string B_dData_dList.t_List) -> ((((v_subNamesForGoGo pos) (n - i)) n) acc))

# 553 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesFor = (fun (pos : string) (n : int) -> ((((v_subNamesForGo pos) 0) n) B_dData_dList.C_List_Nil))

# 576 "Vuna/Compiler/Elab/Match.vuna"
let rec v_addNameDistinct = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (if (dtb__257 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258)) else (B_dData_dList.C_List__x58__x58_ (dtb__257, ((v_addNameDistinct mc0) dtb__258))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeads = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (let nd_uscrut4 = dtb__259 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__261; B_dData_dPair.f_Pair_second = dtb__262 } -> (match dtb__261 with
  | B_dData_dList.C_List_Nil -> (v_ctorHeads dtb__260)
  | B_dData_dList.C_List__x58__x58_ (dtb__263, dtb__264) -> (match dtb__263 with
  | Frontend_dRast.C_Pat_PCon (dtb__265, dtb__266, dtb__267) -> ((v_addNameDistinct (Frontend_dRast_dName.v_rnameKey dtb__265)) (v_ctorHeads dtb__260))
  | _ -> (v_ctorHeads dtb__260)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clausesForCtor = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc2 : string) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__268, dtb__269) -> (let nd_uscrut7 = dtb__268 in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__270; B_dData_dPair.f_Pair_second = dtb__271 } -> (match dtb__270 with
  | B_dData_dList.C_List_Nil -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__269)
  | B_dData_dList.C_List__x58__x58_ (dtb__272, dtb__273) -> (match dtb__272 with
  | Frontend_dRast.C_Pat_PCon (dtb__274, dtb__275, dtb__276) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__274) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__275) dtb__273); B_dData_dPair.f_Pair_second = dtb__271 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__269))) else ((((v_clausesForCtor mc0) mc1) mc2) dtb__269))
  | Frontend_dRast.C_Pat_PVar (dtb__277, dtb__278) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__273); B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__277) mc2) dtb__271) }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__269)))
  | Frontend_dRast.C_Pat_PWild (dtb__279) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__273); B_dData_dPair.f_Pair_second = dtb__271 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__269)))
  | _ -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__269)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterFallback = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> (let nd_uscrut4 = dtb__280 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> (match dtb__282 with
  | B_dData_dList.C_List_Nil -> (v_filterFallback dtb__281)
  | B_dData_dList.C_List__x58__x58_ (dtb__284, dtb__285) -> (if (v_isVarPatD dtb__284) then (B_dData_dList.C_List__x58__x58_ (dtb__280, (v_filterFallback dtb__281))) else (v_filterFallback dtb__281))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepFallbacks = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__286, dtb__287) -> (let nd_uscrut5 = dtb__286 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__288; B_dData_dPair.f_Pair_second = dtb__289 } -> (match dtb__288 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__286, ((v_prepFallbacks mc0) dtb__287)))
  | B_dData_dList.C_List__x58__x58_ (dtb__290, dtb__291) -> (match dtb__290 with
  | Frontend_dRast.C_Pat_PVar (dtb__292, dtb__293) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__291; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__292) mc0) dtb__289) }, ((v_prepFallbacks mc0) dtb__287)))
  | Frontend_dRast.C_Pat_PWild (dtb__294) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__291; B_dData_dPair.f_Pair_second = dtb__289 }, ((v_prepFallbacks mc0) dtb__287)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__286, ((v_prepFallbacks mc0) dtb__287)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Match.vuna"
let rec v_litAltExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((((((v_litAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 137 "Vuna/Compiler/Elab/Match.vuna"
and v_litAltExprGo = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let nd_uscrut6 = clauses in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__295, dtb__296) -> (match dtb__295 with
  | { B_dData_dPair.f_Pair_first = dtb__297; B_dData_dPair.f_Pair_second = dtb__298 } -> (match dtb__297 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__299, dtb__300) -> (match dtb__299 with
  | Frontend_dRast.C_Pat_PVar (dtb__301, dtb__302) -> (((((v_buildColumnExpr table) ((v_prepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Frontend_dRast.C_Pat_PWild (dtb__303) -> (((((v_buildColumnExpr table) (v_stripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Base_dCommon.v_bind ((((((v_litAltExprGo table) dtb__296) pos) restParams) fb) (fuel - 1))) (fun (restExpr : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) (((v_litBranchClauses dtb__299) pos) clauses)) restParams) fb) (fuel - 1))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EIf ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "=="), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName pos), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ ((v_litPatExpr dtb__299), B_dData_dList.C_List_Nil)))), (Frontend_dRast.v_patSpan dtb__299))), bodyExpr, restExpr, (Frontend_dRast.v_patSpan dtb__299)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
))))
# 197 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (((((v_buildColumnExprPruned table) (v_pruneRows clauses0)) params) fb) fuel)))
# 204 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExprPruned = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (if (v_allEmptyPats clauses) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (if (v_allWildPats (v_firstPats clauses)) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (match params with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__304, dtb__305) -> (if (v_hasAsHead clauses) then ((((((v_asColumn table) clauses) dtb__304) dtb__305) fb) fuel) else (if (v_allVarHeads clauses) then (((((v_buildColumnExpr table) ((v_prepVarColumn dtb__304) clauses)) dtb__305) fb) (fuel - 1)) else (if (v_allCtorHeads clauses) then ((((((v_ctorColumn table) clauses) dtb__304) dtb__305) fb) fuel) else (if (v_hasCtorHead clauses) then ((((((v_ctorColumn table) clauses) dtb__304) dtb__305) fb) fuel) else ((((((v_litAltExpr table) clauses) dtb__304) dtb__305) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 230 "Vuna/Compiler/Elab/Match.vuna"
and v_asColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else ((Base_dCommon.v_bind (((((v_buildColumnExpr table) ((B_dData_dList.v_map (v_asInnerClause pos)) clauses)) (B_dData_dList.C_List__x58__x58_ (pos, restParams))) fb) (fuel - 1))) (fun (e : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC (e))))))
# 263 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((Base_dCommon.v_bind ((((((v_ctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let caseSp = (v_firstPatSpan clauses) in (if ((v_familyCovered table) (v_ctorHeads clauses)) then (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName pos), caseSp)), alts, caseSp)))) else ((Base_dCommon.v_bind ((((((v_fallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun (fbAlts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName pos), caseSp)), ((B_dData_dList.v_append alts) fbAlts), caseSp))))))))))))
# 516 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (((((((v_ctorAltListGo table) clauses) (v_ctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 523 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltListGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string) (mc4 : string B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) (mc6 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__306, dtb__307) -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let subpatCount = ((v_ctorSubPatCount mc1) dtb__306) in (let freshSubs = ((v_subNamesFor mc3) subpatCount) in (let subParams = ((B_dData_dList.v_append freshSubs) mc4) in (let branchPats = ((B_dData_dList.v_map (fun (n : string) -> (Frontend_dRast.C_Pat_PVar (n, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))) freshSubs) in (let expanded = ((((v_clausesForCtor dtb__306) branchPats) mc3) mc1) in ((Base_dCommon.v_bind (((((v_buildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((((((v_ctorAltListGo mc0) mc1) dtb__307) mc3) mc4) mc5) (mc6 - 1))) (fun (tail : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__306), branchPats, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = bodyExpr }, tail))))))))))))))
  | B_dData_dList.C_List_Nil -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 611 "Vuna/Compiler/Elab/Match.vuna"
and v_fallbackAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (match ((v_prepFallbacks pos) (v_filterFallback clauses)) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | dtb__308 -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) dtb__308) restParams) fbSp) (fuel - 1))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PWild ({ Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = bodyExpr }, B_dData_dList.C_List_Nil))))))
)))

# 44 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses) B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__309) -> (if ((v_clauseArityTooMany dtb__309) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else ((Base_dCommon.v_bind ((v_checkReachable table) clauses)) (fun (_u : bool) -> (let names = (v_paramNames dtb__309) in ((Base_dCommon.v_bind (((((v_buildColumnExpr table) clauses) names) (v_firstPatSpan clauses)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf clauses)))) (fun (body : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC (((v_wrapLambdas names) body)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToCaseExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dMaybe.C_Maybe_Just (dtb__310) -> (if ((v_clauseArityTooMany dtb__310) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else (((((v_buildColumnExpr table) clauses) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))) (v_firstPatSpan clauses)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf clauses))))
  | _ -> failwith "DT: impossible branch"
))
