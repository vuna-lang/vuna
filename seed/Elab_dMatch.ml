open Vuna_runtime
# 29 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarPats = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Frontend_dAst.C_Pat_PVar (dtb__2, dtb__3) -> (v_allVarPats dtb__1)
  | Frontend_dAst.C_Pat_PWild (dtb__4) -> (v_allVarPats dtb__1)
  | Frontend_dAst.C_Pat_PAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clauseArityTooMany = (fun (mc0 : int) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (if ((B_dData_dList.v_length dtb__10) > mc0) then true else ((v_clauseArityTooMany mc0) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Match.vuna"
let v_clauseHeadSpan = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.v_exprSpan mc1)
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (Frontend_dAst.v_patSpan dtb__12)
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripAsPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__14, dtb__15, dtb__16) -> (v_stripAsPat dtb__15)
  | _ -> mc0
))

# 74 "Vuna/Compiler/Elab/Match.vuna"
let rec v_reachableGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc3 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
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

# 106 "Vuna/Compiler/Elab/Match.vuna"
let v_matrixOf = (fun (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (B_dData_dList.v_map v_stripAsPat)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) clauses)))

# 65 "Vuna/Compiler/Elab/Match.vuna"
let v_checkReachable = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let rows = (v_matrixOf clauses) in (if (Elab_dCoverage.v_uniformArity rows) then ((((v_reachableGo table) (bi_natFromInt (Elab_dCoverage.v_coverageFuelFor rows))) B_dData_dList.C_List_Nil) clauses) else (Base_dDiag.C_Check_OkC (true)))))

# 113 "Vuna/Compiler/Elab/Match.vuna"
let v_arityOf = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__23)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Elab/Match.vuna"
let rec v_paramNamesGo = (fun (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_paramNamesGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

# 117 "Vuna/Compiler/Elab/Match.vuna"
let v_paramNames = (fun (n : int) -> (((v_paramNamesGo (n - 0)) n) B_dData_dList.C_List_Nil))

# 127 "Vuna/Compiler/Elab/Match.vuna"
let rec v_wrapLambdas = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), ((v_wrapLambdas dtb__26) mc1), (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatMatches = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__27, dtb__28) -> (match mc1 with
  | Frontend_dAst.C_Pat_PStr (dtb__29, dtb__30) -> (dtb__27 = dtb__29)
  | Frontend_dAst.C_Pat_PVar (dtb__31, dtb__32) -> true
  | Frontend_dAst.C_Pat_PWild (dtb__33) -> true
  | _ -> false
)
  | Frontend_dAst.C_Pat_PInt (dtb__34, dtb__35) -> (match mc1 with
  | Frontend_dAst.C_Pat_PInt (dtb__36, dtb__37) -> (dtb__34 = dtb__36)
  | Frontend_dAst.C_Pat_PVar (dtb__38, dtb__39) -> true
  | Frontend_dAst.C_Pat_PWild (dtb__40) -> true
  | _ -> false
)
  | _ -> false
))

# 193 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatExpr = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__41, dtb__42) -> (Frontend_dAst.C_Expr_EStr (dtb__41, dtb__42))
  | Frontend_dAst.C_Pat_PInt (dtb__43, dtb__44) -> (Frontend_dAst.C_Expr_EInt (dtb__43, dtb__44))
  | _ -> (Frontend_dAst.C_Expr_EInt (0, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))
))

# 225 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasAsHead = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (let nd_uscrut4 = dtb__45 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 } -> (match dtb__47 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (match dtb__49 with
  | Frontend_dAst.C_Pat_PAs (dtb__51, dtb__52, dtb__53) -> true
  | _ -> (v_hasAsHead dtb__46)
)
  | _ -> (v_hasAsHead dtb__46)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Match.vuna"
let v_innerOfHead = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__54, dtb__55, dtb__56) -> dtb__55
  | _ -> mc0
))

# 256 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPatSpan = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__57 with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (match dtb__59 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (Frontend_dAst.v_patSpan dtb__61)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
))

# 278 "Vuna/Compiler/Elab/Match.vuna"
let rec v_familyOfCtor = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if ((B_dData_dList.v_memName mc1) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__63)))) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__63))) else ((v_familyOfCtor dtb__64) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Elab/Match.vuna"
let v_familyOfHead = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (h : string) -> (match ((v_familyOfCtor table) h) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__65)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut3 = (Frontend_dReserved.v_classify h) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match dtb__66 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((Elab_dCoverage.v_familyOfShortCtors table) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil)))))
  | Frontend_dReserved.C_Reserved_RsListNil -> ((Elab_dCoverage.v_familyOfShortCtors table) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Elab/Match.vuna"
let rec v_canonHeads = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match ((Elab_dCoverage.v_sentinelCtorIn mc0) dtb__67) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (match ((v_canonHeads mc0) dtb__68) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Elab/Match.vuna"
let v_familyCovered = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match ((v_familyOfHead mc0) dtb__71) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (let names = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__73) in (match ((v_canonHeads dtb__73) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> ((B_dData_dList.v_allMem names) dtb__74)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasCtorHead = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (let nd_uscrut4 = dtb__75 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> (match dtb__77 with
  | B_dData_dList.C_List_Nil -> (v_hasCtorHead dtb__76)
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__79 with
  | Frontend_dAst.C_Pat_PCon (dtb__81, dtb__82, dtb__83) -> true
  | _ -> (v_hasCtorHead dtb__76)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allCtorHeads = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (let nd_uscrut4 = dtb__84 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = dtb__87 } -> (match dtb__86 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (match dtb__88 with
  | Frontend_dAst.C_Pat_PCon (dtb__90, dtb__91, dtb__92) -> (v_allCtorHeads dtb__85)
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
let v_isWildPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PWild (dtb__93) -> true
  | _ -> false
))

# 346 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allWildPats = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (if (v_isWildPat dtb__94) then (v_allWildPats dtb__95) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPats = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> dtb__98
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Elab/Match.vuna"
let rec v_irrefutablePat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__100, dtb__101, dtb__102) -> (v_irrefutablePat dtb__101)
  | Frontend_dAst.C_Pat_PWild (dtb__103) -> true
  | Frontend_dAst.C_Pat_PVar (dtb__104, dtb__105) -> true
  | _ -> false
))

# 365 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allIrrefutablePats = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (if (v_irrefutablePat dtb__106) then (v_allIrrefutablePats dtb__107) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Match.vuna"
let rec v_pruneRows = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (if (v_allIrrefutablePats (B_dData_dPair.v_firstOf dtb__108)) then (B_dData_dList.C_List__x58__x58_ (dtb__108, B_dData_dList.C_List_Nil)) else (B_dData_dList.C_List__x58__x58_ (dtb__108, (v_pruneRows dtb__109))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allEmptyPats = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (let nd_uscrut4 = dtb__110 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (match dtb__112 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyPats dtb__111)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Match.vuna"
let v_bodyOfFirst = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EInt (0, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (match dtb__114 with
  | { B_dData_dPair.f_Pair_first = dtb__116; B_dData_dPair.f_Pair_second = dtb__117 } -> dtb__117
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Elab/Match.vuna"
let v_isVarPatD = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PWild (dtb__118) -> true
  | Frontend_dAst.C_Pat_PVar (dtb__119, dtb__120) -> true
  | _ -> false
))

# 390 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarHeads = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (let nd_uscrut4 = dtb__121 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__123; B_dData_dPair.f_Pair_second = dtb__124 } -> (match dtb__123 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (if (v_isVarPatD dtb__125) then (v_allVarHeads dtb__122) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripFirstCol = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (let nd_uscrut4 = dtb__127 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 } -> (match dtb__129 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__130 }, (v_stripFirstCol dtb__128)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__127, (v_stripFirstCol dtb__128)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Elab/Match.vuna"
let rec v_patNamesOf = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__133, dtb__134, dtb__135) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patNamesOf (B_dData_dPair.v_secondOf f)))) dtb__134)
  | Frontend_dAst.C_Pat_PStr (dtb__136, dtb__137) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__138, dtb__139) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__140, dtb__141, dtb__142) -> ((B_dData_dList.v_concatMap v_patNamesOf) dtb__141)
  | Frontend_dAst.C_Pat_PWild (dtb__143) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__144, dtb__145, dtb__146) -> (B_dData_dList.C_List__x58__x58_ (dtb__144, (v_patNamesOf dtb__145)))
  | Frontend_dAst.C_Pat_PVar (dtb__147, dtb__148) -> (B_dData_dList.C_List__x58__x58_ (dtb__147, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Elab/Match.vuna"
let rec v_bindNames = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> ((B_dData_dList.v_append (v_patNamesOf (dtb__149).Frontend_dAst.f_Binding_bindPat)) (v_bindNames dtb__150))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Match.vuna"
let rec v_renameExprF = (fun (fuel : int) (oldName : string) (newName : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then e else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__151, dtb__152) -> (if (dtb__151 = oldName) then (Frontend_dAst.C_Expr_EVar (newName, dtb__152)) else e)
  | Frontend_dAst.C_Expr_EInt (dtb__153, dtb__154) -> (Frontend_dAst.C_Expr_EInt (dtb__153, dtb__154))
  | Frontend_dAst.C_Expr_EStr (dtb__155, dtb__156) -> (Frontend_dAst.C_Expr_EStr (dtb__155, dtb__156))
  | Frontend_dAst.C_Expr_EFloat (dtb__157, dtb__158) -> (Frontend_dAst.C_Expr_EFloat (dtb__157, dtb__158))
  | Frontend_dAst.C_Expr_ELam (dtb__159, dtb__160, dtb__161) -> (Frontend_dAst.C_Expr_ELam (dtb__159, (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__159)) dtb__160), dtb__161))
  | Frontend_dAst.C_Expr_EApp (dtb__162, dtb__163, dtb__164) -> (Frontend_dAst.C_Expr_EApp (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__162), ((B_dData_dList.v_map (((v_renameExprF (fuel - 1)) oldName) newName)) dtb__163), dtb__164))
  | Frontend_dAst.C_Expr_EPi (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> (Frontend_dAst.C_Expr_EPi (dtb__165, dtb__166, dtb__167, ((((v_renameExprF (fuel - 1)) oldName) newName) dtb__168), (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) (B_dData_dList.C_List__x58__x58_ (dtb__165, B_dData_dList.C_List_Nil))) dtb__169), dtb__170))
  | Frontend_dAst.C_Expr_ELet (dtb__171, dtb__172, dtb__173, dtb__174) -> (Frontend_dAst.C_Expr_ELet (((B_dData_dList.v_map (((v_renameBindF (fuel - 1)) oldName) newName)) dtb__171), (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) (v_bindNames dtb__171)) dtb__172), dtb__173, dtb__174))
  | Frontend_dAst.C_Expr_ECase (dtb__175, dtb__176, dtb__177) -> (Frontend_dAst.C_Expr_ECase (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__175), ((B_dData_dList.v_map (((v_renameAltF (fuel - 1)) oldName) newName)) dtb__176), dtb__177))
  | Frontend_dAst.C_Expr_EIf (dtb__178, dtb__179, dtb__180, dtb__181) -> (Frontend_dAst.C_Expr_EIf (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__178), ((((v_renameExprF (fuel - 1)) oldName) newName) dtb__179), ((((v_renameExprF (fuel - 1)) oldName) newName) dtb__180), dtb__181))
  | Frontend_dAst.C_Expr_EField (dtb__182, dtb__183, dtb__184) -> (Frontend_dAst.C_Expr_EField (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__182), dtb__183, dtb__184))
  | Frontend_dAst.C_Expr_ERecord (dtb__185, dtb__186, dtb__187) -> (Frontend_dAst.C_Expr_ERecord (dtb__185, ((B_dData_dList.v_map (((v_renameFieldValueF (fuel - 1)) oldName) newName)) dtb__186), dtb__187))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__188, dtb__189, dtb__190) -> (Frontend_dAst.C_Expr_ERecUpdate (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__188), ((B_dData_dList.v_map (((v_renameFieldValueF (fuel - 1)) oldName) newName)) dtb__189), dtb__190))
  | Frontend_dAst.C_Expr_EDo (dtb__191, dtb__192) -> (Frontend_dAst.C_Expr_EDo (dtb__191, dtb__192))
  | Frontend_dAst.C_Expr_EInterp (dtb__193, dtb__194) -> (Frontend_dAst.C_Expr_EInterp (((((v_renameInterpPartsF (fuel - 1)) oldName) newName) dtb__193), dtb__194))
  | _ -> failwith "DT: impossible branch"
)))
# 443 "Vuna/Compiler/Elab/Match.vuna"
and v_renameInterpPartsF = (fun (mc0 : int) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (match dtb__195 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__197) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__197)), ((((v_renameInterpPartsF (mc0 - 1)) mc1) mc2) dtb__196)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__198) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (((((v_renameExprF (mc0 - 1)) mc1) mc2) dtb__198))), ((((v_renameInterpPartsF (mc0 - 1)) mc1) mc2) dtb__196)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 452 "Vuna/Compiler/Elab/Match.vuna"
and v_renameExprUnlessF = (fun (fuel : int) (oldName : string) (newName : string) (names : string B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if ((B_dData_dList.v_memName oldName) names) then body else ((((v_renameExprF (fuel - 1)) oldName) newName) body)))
# 456 "Vuna/Compiler/Elab/Match.vuna"
and v_renameBindF = (fun (fuel : int) (oldName : string) (newName : string) (b : Frontend_dAst.t_Binding) -> (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__200) -> (Frontend_dAst.C_BindingValue_BVal (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__200)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb__201) -> (Frontend_dAst.C_BindingValue_BClauses (((B_dData_dList.v_map (((v_renameLocalClauseF (fuel - 1)) oldName) newName)) dtb__201)))
  | _ -> failwith "DT: impossible branch"
) in (let sig_ = (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb__199 with Frontend_dAst.f_BindingSig_sigType = ((((v_renameExprF (fuel - 1)) oldName) newName) (dtb__199).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { b with Frontend_dAst.f_Binding_bindValue = value; Frontend_dAst.f_Binding_bindSig = sig_ })))
# 469 "Vuna/Compiler/Elab/Match.vuna"
and v_renameFieldValueF = (fun (fuel : int) (oldName : string) (newName : string) (field : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf field); B_dData_dPair.f_Pair_second = ((((v_renameExprF (fuel - 1)) oldName) newName) (B_dData_dPair.v_secondOf field)) })
# 473 "Vuna/Compiler/Elab/Match.vuna"
and v_renameLocalClauseF = (fun (fuel : int) (oldName : string) (newName : string) (clause : Frontend_dAst.t_LocalClause) -> { clause with Frontend_dAst.f_LocalClause_lcBody = (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) ((B_dData_dList.v_concatMap v_patNamesOf) (clause).Frontend_dAst.f_LocalClause_lcPats)) (clause).Frontend_dAst.f_LocalClause_lcBody) })
# 498 "Vuna/Compiler/Elab/Match.vuna"
and v_renameAltF = (fun (fuel : int) (oldName : string) (newName : string) (alt : Frontend_dAst.t_Alt) -> { alt with Frontend_dAst.f_Alt_altBody = (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) (v_patNamesOf (alt).Frontend_dAst.f_Alt_altPat)) (alt).Frontend_dAst.f_Alt_altBody) })

# 418 "Vuna/Compiler/Elab/Match.vuna"
let v_renameExpr = (fun (oldName : string) (newName : string) (e : Frontend_dAst.t_Expr) -> ((((v_renameExprF ((Frontend_dAstQuery.v_exprBudget 32) e)) oldName) newName) e))

# 173 "Vuna/Compiler/Elab/Match.vuna"
let v_literalBranchBody = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat) (mc2 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Pat_PVar (dtb__202, dtb__203) -> (((v_renameExpr dtb__202) mc0) mc2)
  | _ -> mc2
))

# 163 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterLitBranch = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : string) (mc2 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (match dtb__206 with
  | B_dData_dList.C_List_Nil -> ((((v_filterLitBranch mc0) mc1) dtb__205) mc3)
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (if ((v_litPatMatches mc0) dtb__208) then ((((v_filterLitBranch mc0) mc1) dtb__205) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = (((v_literalBranchBody mc1) dtb__208) dtb__207) }, mc3))) else ((((v_filterLitBranch mc0) mc1) dtb__205) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Elab/Match.vuna"
let v_litBranchClauses = (fun (lit : Frontend_dAst.t_Pat) (pos : string) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_filterLitBranch lit) pos) clauses) B_dData_dList.C_List_Nil))

# 249 "Vuna/Compiler/Elab/Match.vuna"
let v_renameAsHead = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat) (mc2 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Pat_PVar (dtb__210, dtb__211) -> (((v_renameExpr dtb__210) mc0) mc2)
  | Frontend_dAst.C_Pat_PAs (dtb__212, dtb__213, dtb__214) -> (((v_renameExpr dtb__212) mc0) mc2)
  | _ -> mc2
))

# 241 "Vuna/Compiler/Elab/Match.vuna"
let v_asInnerClause = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> (match dtb__215 with
  | B_dData_dList.C_List_Nil -> mc1
  | B_dData_dList.C_List__x58__x58_ (dtb__217, dtb__218) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_innerOfHead dtb__217), B_dData_dList.C_List_Nil))) dtb__218); B_dData_dPair.f_Pair_second = (((v_renameAsHead mc0) dtb__217) dtb__216) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepVarColumn = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (let nd_uscrut5 = dtb__219 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__221; B_dData_dPair.f_Pair_second = dtb__222 } -> (match dtb__221 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__219, ((v_prepVarColumn mc0) dtb__220)))
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (match dtb__223 with
  | Frontend_dAst.C_Pat_PVar (dtb__225, dtb__226) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__225) mc0) dtb__222) }, ((v_prepVarColumn mc0) dtb__220)))
  | Frontend_dAst.C_Pat_PWild (dtb__227) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = dtb__222 }, ((v_prepVarColumn mc0) dtb__220)))
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = dtb__222 }, ((v_prepVarColumn mc0) dtb__220)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeadSpan = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (let nd_uscrut6 = dtb__228 in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (match dtb__230 with
  | B_dData_dList.C_List_Nil -> (((v_ctorHeadSpan dtb__229) mc1) mc2)
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__232 with
  | Frontend_dAst.C_Pat_PCon (dtb__234, dtb__235, dtb__236) -> (if (dtb__234 = mc1) then (Frontend_dAst.v_nodeRefSpan dtb__236) else (((v_ctorHeadSpan dtb__229) mc1) mc2))
  | _ -> (((v_ctorHeadSpan dtb__229) mc1) mc2)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorSubPatCount = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> (let nd_uscrut5 = dtb__237 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__239; B_dData_dPair.f_Pair_second = dtb__240 } -> (match dtb__239 with
  | B_dData_dList.C_List_Nil -> ((v_ctorSubPatCount dtb__238) mc1)
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (match dtb__241 with
  | Frontend_dAst.C_Pat_PCon (dtb__243, dtb__244, dtb__245) -> (if (dtb__243 = mc1) then (B_dData_dList.v_length dtb__244) else ((v_ctorSubPatCount dtb__238) mc1))
  | _ -> ((v_ctorSubPatCount dtb__238) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Elab/Match.vuna"
let rec v_subNamesForGoGo = (fun (pos : string) (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else ((((v_subNamesForGoGo pos) (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

# 561 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesForGo = (fun (pos : string) (i : int) (n : int) (acc : string B_dData_dList.t_List) -> ((((v_subNamesForGoGo pos) (n - i)) n) acc))

# 558 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesFor = (fun (pos : string) (n : int) -> ((((v_subNamesForGo pos) 0) n) B_dData_dList.C_List_Nil))

# 581 "Vuna/Compiler/Elab/Match.vuna"
let rec v_addNameDistinct = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (if (dtb__246 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247)) else (B_dData_dList.C_List__x58__x58_ (dtb__246, ((v_addNameDistinct mc0) dtb__247))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 571 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeads = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> (let nd_uscrut4 = dtb__248 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__250; B_dData_dPair.f_Pair_second = dtb__251 } -> (match dtb__250 with
  | B_dData_dList.C_List_Nil -> (v_ctorHeads dtb__249)
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match dtb__252 with
  | Frontend_dAst.C_Pat_PCon (dtb__254, dtb__255, dtb__256) -> ((v_addNameDistinct dtb__254) (v_ctorHeads dtb__249))
  | _ -> (v_ctorHeads dtb__249)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 589 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clausesForCtor = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc2 : string) (mc3 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (let nd_uscrut7 = dtb__257 in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__259; B_dData_dPair.f_Pair_second = dtb__260 } -> (match dtb__259 with
  | B_dData_dList.C_List_Nil -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__258)
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (match dtb__261 with
  | Frontend_dAst.C_Pat_PCon (dtb__263, dtb__264, dtb__265) -> (if (dtb__263 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__264) dtb__262); B_dData_dPair.f_Pair_second = dtb__260 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__258))) else ((((v_clausesForCtor mc0) mc1) mc2) dtb__258))
  | Frontend_dAst.C_Pat_PVar (dtb__266, dtb__267) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__262); B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__266) mc2) dtb__260) }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__258)))
  | Frontend_dAst.C_Pat_PWild (dtb__268) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__262); B_dData_dPair.f_Pair_second = dtb__260 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__258)))
  | _ -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__258)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 606 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterFallback = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__269, dtb__270) -> (let nd_uscrut4 = dtb__269 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> (match dtb__271 with
  | B_dData_dList.C_List_Nil -> (v_filterFallback dtb__270)
  | B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__274) -> (if (v_isVarPatD dtb__273) then (B_dData_dList.C_List__x58__x58_ (dtb__269, (v_filterFallback dtb__270))) else (v_filterFallback dtb__270))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 625 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepFallbacks = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (let nd_uscrut5 = dtb__275 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__277; B_dData_dPair.f_Pair_second = dtb__278 } -> (match dtb__277 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__275, ((v_prepFallbacks mc0) dtb__276)))
  | B_dData_dList.C_List__x58__x58_ (dtb__279, dtb__280) -> (match dtb__279 with
  | Frontend_dAst.C_Pat_PVar (dtb__281, dtb__282) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__281) mc0) dtb__278) }, ((v_prepFallbacks mc0) dtb__276)))
  | Frontend_dAst.C_Pat_PWild (dtb__283) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__278 }, ((v_prepFallbacks mc0) dtb__276)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__275, ((v_prepFallbacks mc0) dtb__276)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Elab/Match.vuna"
let rec v_litAltExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((((((v_litAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 139 "Vuna/Compiler/Elab/Match.vuna"
and v_litAltExprGo = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let nd_uscrut6 = clauses in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__284, dtb__285) -> (match dtb__284 with
  | { B_dData_dPair.f_Pair_first = dtb__286; B_dData_dPair.f_Pair_second = dtb__287 } -> (match dtb__286 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__288, dtb__289) -> (match dtb__288 with
  | Frontend_dAst.C_Pat_PVar (dtb__290, dtb__291) -> (((((v_buildColumnExpr table) ((v_prepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Frontend_dAst.C_Pat_PWild (dtb__292) -> (((((v_buildColumnExpr table) (v_stripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Base_dCommon.v_bind ((((((v_litAltExprGo table) dtb__285) pos) restParams) fb) (fuel - 1))) (fun (restExpr : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) (((v_litBranchClauses dtb__288) pos) clauses)) restParams) fb) (fuel - 1))) (fun (bodyExpr : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("==", (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (pos, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))), (B_dData_dList.C_List__x58__x58_ ((v_litPatExpr dtb__288), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb__288)))), bodyExpr, restExpr, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb__288))))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
))))
# 199 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (((((v_buildColumnExprPruned table) (v_pruneRows clauses0)) params) fb) fuel)))
# 206 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExprPruned = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (if (v_allEmptyPats clauses) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (if (v_allWildPats (v_firstPats clauses)) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (match params with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (if (v_hasAsHead clauses) then ((((((v_asColumn table) clauses) dtb__293) dtb__294) fb) fuel) else (if (v_allVarHeads clauses) then (((((v_buildColumnExpr table) ((v_prepVarColumn dtb__293) clauses)) dtb__294) fb) (fuel - 1)) else (if (v_allCtorHeads clauses) then ((((((v_ctorColumn table) clauses) dtb__293) dtb__294) fb) fuel) else (if (v_hasCtorHead clauses) then ((((((v_ctorColumn table) clauses) dtb__293) dtb__294) fb) fuel) else ((((((v_litAltExpr table) clauses) dtb__293) dtb__294) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 232 "Vuna/Compiler/Elab/Match.vuna"
and v_asColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else ((Base_dCommon.v_bind (((((v_buildColumnExpr table) ((B_dData_dList.v_map (v_asInnerClause pos)) clauses)) (B_dData_dList.C_List__x58__x58_ (pos, restParams))) fb) (fuel - 1))) (fun (e : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC (e))))))
# 265 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((Base_dCommon.v_bind ((((((v_ctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (let caseSp = (v_firstPatSpan clauses) in (if ((v_familyCovered table) (v_ctorHeads clauses)) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (pos, (Frontend_dAst.v_detachedNodeRef caseSp))), alts, (Frontend_dAst.v_detachedNodeRef caseSp))))) else ((Base_dCommon.v_bind ((((((v_fallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun (fbAlts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (pos, (Frontend_dAst.v_detachedNodeRef caseSp))), ((B_dData_dList.v_append alts) fbAlts), (Frontend_dAst.v_detachedNodeRef caseSp)))))))))))))
# 509 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (((((((v_ctorAltListGo table) clauses) (v_ctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 516 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltListGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string) (mc4 : string B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) (mc6 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__295, dtb__296) -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let subpatCount = ((v_ctorSubPatCount mc1) dtb__295) in (let freshSubs = ((v_subNamesFor mc3) subpatCount) in (let subParams = ((B_dData_dList.v_append freshSubs) mc4) in (let branchPats = ((B_dData_dList.v_map (fun (n : string) -> (Frontend_dAst.C_Pat_PVar (n, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))))) freshSubs) in (let headSp = (((v_ctorHeadSpan mc1) dtb__295) mc5) in (let expanded = ((((v_clausesForCtor dtb__295) branchPats) mc3) mc1) in ((Base_dCommon.v_bind (((((v_buildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun (bodyExpr : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((((v_ctorAltListGo mc0) mc1) dtb__296) mc3) mc4) mc5) (mc6 - 1))) (fun (tail : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb__295, branchPats, (Frontend_dAst.v_detachedNodeRef headSp))); Frontend_dAst.f_Alt_altBody = bodyExpr; Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) }, tail)))))))))))))))
  | B_dData_dList.C_List_Nil -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 616 "Vuna/Compiler/Elab/Match.vuna"
and v_fallbackAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (match ((v_prepFallbacks pos) (v_filterFallback clauses)) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | dtb__297 -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) dtb__297) restParams) fbSp) (fuel - 1))) (fun (bodyExpr : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))); Frontend_dAst.f_Alt_altBody = bodyExpr; Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) }, B_dData_dList.C_List_Nil))))))
)))

# 45 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses) B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (if ((v_clauseArityTooMany dtb__298) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else ((Base_dCommon.v_bind ((v_checkReachable table) clauses)) (fun (_u : bool) -> (let names = (v_paramNames dtb__298) in ((Base_dCommon.v_bind (((((v_buildColumnExpr table) clauses) names) (v_firstPatSpan clauses)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf clauses)))) (fun (body : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC (((v_wrapLambdas names) body)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToCaseExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (if ((v_clauseArityTooMany dtb__299) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else (((((v_buildColumnExpr table) clauses) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))) (v_firstPatSpan clauses)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf clauses))))
  | _ -> failwith "DT: impossible branch"
))
