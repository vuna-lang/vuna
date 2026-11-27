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

# 93 "Vuna/Compiler/Elab/Match.vuna"
let v_clauseHeadSpan = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.v_exprSpan mc1)
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (Frontend_dAst.v_patSpan dtb__12)
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripAsPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__14, dtb__15, dtb__16) -> (v_stripAsPat dtb__15)
  | _ -> mc0
))

# 84 "Vuna/Compiler/Elab/Match.vuna"
let rec v_reachableGo = (fun (mc0 : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Frontend_dAst.t_Pat B_dData_dList.t_List B_dData_dList.t_List) (mc4 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__17 with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (let qs = ((B_dData_dList.v_map v_stripAsPat) dtb__19) in (match (((((Elab_dCoverage.v_clauseCoverWith mc0) mc1) mc2) mc3) qs) with
  | Elab_dCoverage.C_CoverVerdict_CoverProved -> ((Base_dDiagnostics_dTc.v_tcErr0 ((v_clauseHeadSpan dtb__19) dtb__20)) Base_dDiagnostics_dTc.C_TcErr_ClauseUnreachable)
  | _ -> (((((v_reachableGo mc0) mc1) mc2) (B_dData_dList.C_List__x58__x58_ (qs, mc3))) dtb__18)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (true))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Match.vuna"
let v_matrixOf = (fun (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (B_dData_dList.v_map v_stripAsPat)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) clauses)))

# 75 "Vuna/Compiler/Elab/Match.vuna"
let v_checkReachableWith = (fun (reach : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let rows = (v_matrixOf clauses) in (if (Elab_dCoverage.v_uniformArity rows) then (((((v_reachableGo reach) table) (bi_natFromInt (Elab_dCoverage.v_coverageFuelFor rows))) B_dData_dList.C_List_Nil) clauses) else (Base_dDiag.C_Check_OkC (true)))))

# 72 "Vuna/Compiler/Elab/Match.vuna"
let v_checkReachable = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkReachableWith B_dData_dMaybe.C_Maybe_Nothing) table) clauses))

# 123 "Vuna/Compiler/Elab/Match.vuna"
let v_arityOf = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__23)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Elab/Match.vuna"
let rec v_paramNamesGo = (fun (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_paramNamesGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ (("mc" ^ (string_of_int (n - remaining))), acc)))))

# 127 "Vuna/Compiler/Elab/Match.vuna"
let v_paramNames = (fun (n : int) -> (((v_paramNamesGo (n - 0)) n) B_dData_dList.C_List_Nil))

# 137 "Vuna/Compiler/Elab/Match.vuna"
let rec v_wrapLambdas = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), ((v_wrapLambdas dtb__26) mc1), (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Elab/Match.vuna"
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

# 203 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatExpr = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__41, dtb__42) -> (Frontend_dAst.C_Expr_EStr (dtb__41, dtb__42))
  | Frontend_dAst.C_Pat_PInt (dtb__43, dtb__44) -> (Frontend_dAst.C_Expr_EInt (dtb__43, dtb__44))
  | _ -> (Frontend_dAst.C_Expr_EInt (0, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))
))

# 235 "Vuna/Compiler/Elab/Match.vuna"
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

# 255 "Vuna/Compiler/Elab/Match.vuna"
let v_innerOfHead = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__54, dtb__55, dtb__56) -> dtb__55
  | _ -> mc0
))

# 266 "Vuna/Compiler/Elab/Match.vuna"
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

# 290 "Vuna/Compiler/Elab/Match.vuna"
let rec v_familyOfCtor = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if ((B_dData_dList.v_memName mc1) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__63)))) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__63))) else ((v_familyOfCtor dtb__64) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Elab/Match.vuna"
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

# 309 "Vuna/Compiler/Elab/Match.vuna"
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

# 325 "Vuna/Compiler/Elab/Match.vuna"
let v_familyCoverVerdict = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match ((v_familyOfHead mc0) dtb__71) with
  | B_dData_dMaybe.C_Maybe_Nothing -> Elab_dCoverage.C_CoverVerdict_CoverUnknown
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (let names = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__73) in (match ((v_canonHeads dtb__73) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> Elab_dCoverage.C_CoverVerdict_CoverUnknown
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (if ((B_dData_dList.v_allMem names) dtb__74) then Elab_dCoverage.C_CoverVerdict_CoverProved else Elab_dCoverage.C_CoverVerdict_CoverMissing)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> Elab_dCoverage.C_CoverVerdict_CoverUnknown
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Elab/Match.vuna"
let rec v_anyNeedsReachHead = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if ((Elab_dCoverage.v_ctorNeedsReachOracle mc0) dtb__75) then true else ((v_anyNeedsReachHead mc0) dtb__76))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Match.vuna"
let rec v_isCatchAllHead = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__77, dtb__78, dtb__79) -> (v_isCatchAllHead dtb__78)
  | Frontend_dAst.C_Pat_PWild (dtb__80) -> true
  | Frontend_dAst.C_Pat_PVar (dtb__81, dtb__82) -> true
  | _ -> false
))

# 357 "Vuna/Compiler/Elab/Match.vuna"
let rec v_anyCatchAllHead = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (match dtb__83 with
  | { B_dData_dPair.f_Pair_first = dtb__85; B_dData_dPair.f_Pair_second = dtb__86 } -> (match dtb__85 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (if (v_isCatchAllHead dtb__87) then true else (v_anyCatchAllHead dtb__84))
  | B_dData_dList.C_List_Nil -> (v_anyCatchAllHead dtb__84)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasCtorHead = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (let nd_uscrut4 = dtb__89 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> (match dtb__91 with
  | B_dData_dList.C_List_Nil -> (v_hasCtorHead dtb__90)
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (match dtb__93 with
  | Frontend_dAst.C_Pat_PCon (dtb__95, dtb__96, dtb__97) -> true
  | _ -> (v_hasCtorHead dtb__90)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allCtorHeads = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (let nd_uscrut4 = dtb__98 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> (match dtb__100 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match dtb__102 with
  | Frontend_dAst.C_Pat_PCon (dtb__104, dtb__105, dtb__106) -> (v_allCtorHeads dtb__99)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Elab/Match.vuna"
let v_isWildPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PWild (dtb__107) -> true
  | _ -> false
))

# 394 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allWildPats = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (if (v_isWildPat dtb__108) then (v_allWildPats dtb__109) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPats = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> dtb__112
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Compiler/Elab/Match.vuna"
let rec v_irrefutablePat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PAs (dtb__114, dtb__115, dtb__116) -> (v_irrefutablePat dtb__115)
  | Frontend_dAst.C_Pat_PWild (dtb__117) -> true
  | Frontend_dAst.C_Pat_PVar (dtb__118, dtb__119) -> true
  | _ -> false
))

# 413 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allIrrefutablePats = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (if (v_irrefutablePat dtb__120) then (v_allIrrefutablePats dtb__121) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Elab/Match.vuna"
let[@tail_mod_cons] rec v_pruneRows = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (if (v_allIrrefutablePats (B_dData_dPair.v_firstOf dtb__122)) then (B_dData_dList.C_List__x58__x58_ (dtb__122, B_dData_dList.C_List_Nil)) else (B_dData_dList.C_List__x58__x58_ (dtb__122, (v_pruneRows dtb__123))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allEmptyPats = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (let nd_uscrut4 = dtb__124 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__126; B_dData_dPair.f_Pair_second = dtb__127 } -> (match dtb__126 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyPats dtb__125)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Match.vuna"
let v_bodyOfFirst = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EInt (0, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (match dtb__128 with
  | { B_dData_dPair.f_Pair_first = dtb__130; B_dData_dPair.f_Pair_second = dtb__131 } -> dtb__131
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Elab/Match.vuna"
let v_isVarPatD = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PWild (dtb__132) -> true
  | Frontend_dAst.C_Pat_PVar (dtb__133, dtb__134) -> true
  | _ -> false
))

# 438 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarHeads = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (let nd_uscrut4 = dtb__135 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__137; B_dData_dPair.f_Pair_second = dtb__138 } -> (match dtb__137 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (if (v_isVarPatD dtb__139) then (v_allVarHeads dtb__136) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripFirstCol = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (let nd_uscrut4 = dtb__141 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (match dtb__143 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__144 }, (v_stripFirstCol dtb__142)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__141, (v_stripFirstCol dtb__142)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Elab/Match.vuna"
let rec v_patNamesOf = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__147, dtb__148, dtb__149) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patNamesOf (B_dData_dPair.v_secondOf f)))) dtb__148)
  | Frontend_dAst.C_Pat_PStr (dtb__150, dtb__151) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__152, dtb__153) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__154, dtb__155, dtb__156) -> ((B_dData_dList.v_concatMap v_patNamesOf) dtb__155)
  | Frontend_dAst.C_Pat_PWild (dtb__157) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__158, dtb__159, dtb__160) -> (B_dData_dList.C_List__x58__x58_ (dtb__158, (v_patNamesOf dtb__159)))
  | Frontend_dAst.C_Pat_PVar (dtb__161, dtb__162) -> (B_dData_dList.C_List__x58__x58_ (dtb__161, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 533 "Vuna/Compiler/Elab/Match.vuna"
let rec v_bindNames = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> ((B_dData_dList.v_append (v_patNamesOf (dtb__163).Frontend_dAst.f_Binding_bindPat)) (v_bindNames dtb__164))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Elab/Match.vuna"
let rec v_renameExprF = (fun (fuel : int) (oldName : string) (newName : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then e else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__165, dtb__166) -> (if (dtb__165 = oldName) then (Frontend_dAst.C_Expr_EVar (newName, dtb__166)) else e)
  | Frontend_dAst.C_Expr_EInt (dtb__167, dtb__168) -> (Frontend_dAst.C_Expr_EInt (dtb__167, dtb__168))
  | Frontend_dAst.C_Expr_EStr (dtb__169, dtb__170) -> (Frontend_dAst.C_Expr_EStr (dtb__169, dtb__170))
  | Frontend_dAst.C_Expr_EFloat (dtb__171, dtb__172) -> (Frontend_dAst.C_Expr_EFloat (dtb__171, dtb__172))
  | Frontend_dAst.C_Expr_ELam (dtb__173, dtb__174, dtb__175) -> (Frontend_dAst.C_Expr_ELam (dtb__173, (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__173)) dtb__174), dtb__175))
  | Frontend_dAst.C_Expr_EApp (dtb__176, dtb__177, dtb__178) -> (Frontend_dAst.C_Expr_EApp (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__176), ((B_dData_dList.v_map (((v_renameExprF (fuel - 1)) oldName) newName)) dtb__177), dtb__178))
  | Frontend_dAst.C_Expr_EPi (dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184) -> (Frontend_dAst.C_Expr_EPi (dtb__179, dtb__180, dtb__181, ((((v_renameExprF (fuel - 1)) oldName) newName) dtb__182), (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) (B_dData_dList.C_List__x58__x58_ (dtb__179, B_dData_dList.C_List_Nil))) dtb__183), dtb__184))
  | Frontend_dAst.C_Expr_ELet (dtb__185, dtb__186, dtb__187, dtb__188) -> (Frontend_dAst.C_Expr_ELet (((B_dData_dList.v_map (((v_renameBindF (fuel - 1)) oldName) newName)) dtb__185), (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) (v_bindNames dtb__185)) dtb__186), dtb__187, dtb__188))
  | Frontend_dAst.C_Expr_ECase (dtb__189, dtb__190, dtb__191) -> (Frontend_dAst.C_Expr_ECase (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__189), ((B_dData_dList.v_map (((v_renameAltF (fuel - 1)) oldName) newName)) dtb__190), dtb__191))
  | Frontend_dAst.C_Expr_EIf (dtb__192, dtb__193, dtb__194, dtb__195) -> (Frontend_dAst.C_Expr_EIf (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__192), ((((v_renameExprF (fuel - 1)) oldName) newName) dtb__193), ((((v_renameExprF (fuel - 1)) oldName) newName) dtb__194), dtb__195))
  | Frontend_dAst.C_Expr_EField (dtb__196, dtb__197, dtb__198) -> (Frontend_dAst.C_Expr_EField (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__196), dtb__197, dtb__198))
  | Frontend_dAst.C_Expr_ERecord (dtb__199, dtb__200, dtb__201) -> (Frontend_dAst.C_Expr_ERecord (dtb__199, ((B_dData_dList.v_map (((v_renameFieldValueF (fuel - 1)) oldName) newName)) dtb__200), dtb__201))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__202, dtb__203, dtb__204) -> (Frontend_dAst.C_Expr_ERecUpdate (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__202), ((B_dData_dList.v_map (((v_renameFieldValueF (fuel - 1)) oldName) newName)) dtb__203), dtb__204))
  | Frontend_dAst.C_Expr_EDo (dtb__205, dtb__206) -> (Frontend_dAst.C_Expr_EDo (dtb__205, dtb__206))
  | Frontend_dAst.C_Expr_EInterp (dtb__207, dtb__208) -> (Frontend_dAst.C_Expr_EInterp (((((v_renameInterpPartsF (fuel - 1)) oldName) newName) dtb__207), dtb__208))
  | _ -> failwith "DT: impossible branch"
)))
# 491 "Vuna/Compiler/Elab/Match.vuna"
and v_renameInterpPartsF = (fun (mc0 : int) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (match dtb__209 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__211) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__211)), ((((v_renameInterpPartsF (mc0 - 1)) mc1) mc2) dtb__210)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__212) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (((((v_renameExprF (mc0 - 1)) mc1) mc2) dtb__212))), ((((v_renameInterpPartsF (mc0 - 1)) mc1) mc2) dtb__210)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 500 "Vuna/Compiler/Elab/Match.vuna"
and v_renameExprUnlessF = (fun (fuel : int) (oldName : string) (newName : string) (names : string B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if ((B_dData_dList.v_memName oldName) names) then body else ((((v_renameExprF (fuel - 1)) oldName) newName) body)))
# 504 "Vuna/Compiler/Elab/Match.vuna"
and v_renameBindF = (fun (fuel : int) (oldName : string) (newName : string) (b : Frontend_dAst.t_Binding) -> (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__214) -> (Frontend_dAst.C_BindingValue_BVal (((((v_renameExprF (fuel - 1)) oldName) newName) dtb__214)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb__215) -> (Frontend_dAst.C_BindingValue_BClauses (((B_dData_dList.v_map (((v_renameLocalClauseF (fuel - 1)) oldName) newName)) dtb__215)))
  | _ -> failwith "DT: impossible branch"
) in (let sig_ = (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb__213 with Frontend_dAst.f_BindingSig_sigType = ((((v_renameExprF (fuel - 1)) oldName) newName) (dtb__213).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { b with Frontend_dAst.f_Binding_bindValue = value; Frontend_dAst.f_Binding_bindSig = sig_ })))
# 517 "Vuna/Compiler/Elab/Match.vuna"
and v_renameFieldValueF = (fun (fuel : int) (oldName : string) (newName : string) (field : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf field); B_dData_dPair.f_Pair_second = ((((v_renameExprF (fuel - 1)) oldName) newName) (B_dData_dPair.v_secondOf field)) })
# 521 "Vuna/Compiler/Elab/Match.vuna"
and v_renameLocalClauseF = (fun (fuel : int) (oldName : string) (newName : string) (clause : Frontend_dAst.t_LocalClause) -> { clause with Frontend_dAst.f_LocalClause_lcBody = (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) ((B_dData_dList.v_concatMap v_patNamesOf) (clause).Frontend_dAst.f_LocalClause_lcPats)) (clause).Frontend_dAst.f_LocalClause_lcBody) })
# 546 "Vuna/Compiler/Elab/Match.vuna"
and v_renameAltF = (fun (fuel : int) (oldName : string) (newName : string) (alt : Frontend_dAst.t_Alt) -> { alt with Frontend_dAst.f_Alt_altBody = (((((v_renameExprUnlessF (fuel - 1)) oldName) newName) (v_patNamesOf (alt).Frontend_dAst.f_Alt_altPat)) (alt).Frontend_dAst.f_Alt_altBody) })

# 466 "Vuna/Compiler/Elab/Match.vuna"
let v_renameExpr = (fun (oldName : string) (newName : string) (e : Frontend_dAst.t_Expr) -> ((((v_renameExprF ((Frontend_dAstQuery.v_exprBudget 32) e)) oldName) newName) e))

# 183 "Vuna/Compiler/Elab/Match.vuna"
let v_literalBranchBody = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat) (mc2 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Pat_PVar (dtb__216, dtb__217) -> (((v_renameExpr dtb__216) mc0) mc2)
  | _ -> mc2
))

# 173 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterLitBranch = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : string) (mc2 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> (match dtb__220 with
  | B_dData_dList.C_List_Nil -> ((((v_filterLitBranch mc0) mc1) dtb__219) mc3)
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (if ((v_litPatMatches mc0) dtb__222) then ((((v_filterLitBranch mc0) mc1) dtb__219) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = (((v_literalBranchBody mc1) dtb__222) dtb__221) }, mc3))) else ((((v_filterLitBranch mc0) mc1) dtb__219) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Elab/Match.vuna"
let v_litBranchClauses = (fun (lit : Frontend_dAst.t_Pat) (pos : string) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_filterLitBranch lit) pos) clauses) B_dData_dList.C_List_Nil))

# 259 "Vuna/Compiler/Elab/Match.vuna"
let v_renameAsHead = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat) (mc2 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Pat_PVar (dtb__224, dtb__225) -> (((v_renameExpr dtb__224) mc0) mc2)
  | Frontend_dAst.C_Pat_PAs (dtb__226, dtb__227, dtb__228) -> (((v_renameExpr dtb__226) mc0) mc2)
  | _ -> mc2
))

# 251 "Vuna/Compiler/Elab/Match.vuna"
let v_asInnerClause = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__229; B_dData_dPair.f_Pair_second = dtb__230 } -> (match dtb__229 with
  | B_dData_dList.C_List_Nil -> mc1
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_innerOfHead dtb__231), B_dData_dList.C_List_Nil))) dtb__232); B_dData_dPair.f_Pair_second = (((v_renameAsHead mc0) dtb__231) dtb__230) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepVarColumn = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> (let nd_uscrut5 = dtb__233 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__235; B_dData_dPair.f_Pair_second = dtb__236 } -> (match dtb__235 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__233, ((v_prepVarColumn mc0) dtb__234)))
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> (match dtb__237 with
  | Frontend_dAst.C_Pat_PVar (dtb__239, dtb__240) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__239) mc0) dtb__236) }, ((v_prepVarColumn mc0) dtb__234)))
  | Frontend_dAst.C_Pat_PWild (dtb__241) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__236 }, ((v_prepVarColumn mc0) dtb__234)))
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__236 }, ((v_prepVarColumn mc0) dtb__234)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeadSpan = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> (let nd_uscrut6 = dtb__242 in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = dtb__245 } -> (match dtb__244 with
  | B_dData_dList.C_List_Nil -> (((v_ctorHeadSpan dtb__243) mc1) mc2)
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | Frontend_dAst.C_Pat_PCon (dtb__248, dtb__249, dtb__250) -> (if (dtb__248 = mc1) then (Frontend_dAst.v_nodeRefSpan dtb__250) else (((v_ctorHeadSpan dtb__243) mc1) mc2))
  | _ -> (((v_ctorHeadSpan dtb__243) mc1) mc2)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorSubPatCount = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (let nd_uscrut5 = dtb__251 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__253; B_dData_dPair.f_Pair_second = dtb__254 } -> (match dtb__253 with
  | B_dData_dList.C_List_Nil -> ((v_ctorSubPatCount dtb__252) mc1)
  | B_dData_dList.C_List__x58__x58_ (dtb__255, dtb__256) -> (match dtb__255 with
  | Frontend_dAst.C_Pat_PCon (dtb__257, dtb__258, dtb__259) -> (if (dtb__257 = mc1) then (B_dData_dList.v_length dtb__258) else ((v_ctorSubPatCount dtb__252) mc1))
  | _ -> ((v_ctorSubPatCount dtb__252) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Compiler/Elab/Match.vuna"
let rec v_subNamesForGoGo = (fun (pos : string) (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else ((((v_subNamesForGoGo pos) (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["_sc_"; pos; "_"; (string_of_int (n - remaining))]), acc)))))

# 609 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesForGo = (fun (pos : string) (i : int) (n : int) (acc : string B_dData_dList.t_List) -> ((((v_subNamesForGoGo pos) (n - i)) n) acc))

# 606 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesFor = (fun (pos : string) (n : int) -> ((((v_subNamesForGo pos) 0) n) B_dData_dList.C_List_Nil))

# 629 "Vuna/Compiler/Elab/Match.vuna"
let[@tail_mod_cons] rec v_addNameDistinct = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (if (dtb__260 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261)) else (B_dData_dList.C_List__x58__x58_ (dtb__260, ((v_addNameDistinct mc0) dtb__261))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Match.vuna"
let rec v_column0Heads = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match dtb__262 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (match dtb__264 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (match (v_stripAsPat dtb__266) with
  | Frontend_dAst.C_Pat_PCon (dtb__268, dtb__269, dtb__270) -> ((v_addNameDistinct dtb__268) (v_column0Heads dtb__263))
  | _ -> (v_column0Heads dtb__263)
)
  | B_dData_dList.C_List_Nil -> (v_column0Heads dtb__263)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Elab/Match.vuna"
let v_needsReachOracle = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((v_anyNeedsReachHead table) (v_column0Heads clauses)) then (v_anyCatchAllHead clauses) else false))

# 619 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeads = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__272) -> (let nd_uscrut4 = dtb__271 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__273; B_dData_dPair.f_Pair_second = dtb__274 } -> (match dtb__273 with
  | B_dData_dList.C_List_Nil -> (v_ctorHeads dtb__272)
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (match dtb__275 with
  | Frontend_dAst.C_Pat_PCon (dtb__277, dtb__278, dtb__279) -> ((v_addNameDistinct dtb__277) (v_ctorHeads dtb__272))
  | _ -> (v_ctorHeads dtb__272)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clausesForCtor = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc2 : string) (mc3 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> (let nd_uscrut7 = dtb__280 in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> (match dtb__282 with
  | B_dData_dList.C_List_Nil -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__281)
  | B_dData_dList.C_List__x58__x58_ (dtb__284, dtb__285) -> (match dtb__284 with
  | Frontend_dAst.C_Pat_PCon (dtb__286, dtb__287, dtb__288) -> (if (dtb__286 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__287) dtb__285); B_dData_dPair.f_Pair_second = dtb__283 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__281))) else ((((v_clausesForCtor mc0) mc1) mc2) dtb__281))
  | Frontend_dAst.C_Pat_PVar (dtb__289, dtb__290) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__285); B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__289) mc2) dtb__283) }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__281)))
  | Frontend_dAst.C_Pat_PWild (dtb__291) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__285); B_dData_dPair.f_Pair_second = dtb__283 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__281)))
  | _ -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__281)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 654 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterFallback = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__292, dtb__293) -> (let nd_uscrut4 = dtb__292 in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__294; B_dData_dPair.f_Pair_second = dtb__295 } -> (match dtb__294 with
  | B_dData_dList.C_List_Nil -> (v_filterFallback dtb__293)
  | B_dData_dList.C_List__x58__x58_ (dtb__296, dtb__297) -> (if (v_isVarPatD dtb__296) then (B_dData_dList.C_List__x58__x58_ (dtb__292, (v_filterFallback dtb__293))) else (v_filterFallback dtb__293))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 673 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepFallbacks = (fun (mc0 : string) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (let nd_uscrut5 = dtb__298 in (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> (match dtb__300 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__298, ((v_prepFallbacks mc0) dtb__299)))
  | B_dData_dList.C_List__x58__x58_ (dtb__302, dtb__303) -> (match dtb__302 with
  | Frontend_dAst.C_Pat_PVar (dtb__304, dtb__305) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__303; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__304) mc0) dtb__301) }, ((v_prepFallbacks mc0) dtb__299)))
  | Frontend_dAst.C_Pat_PWild (dtb__306) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__303; B_dData_dPair.f_Pair_second = dtb__301 }, ((v_prepFallbacks mc0) dtb__299)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__298, ((v_prepFallbacks mc0) dtb__299)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Elab/Match.vuna"
let rec v_litAltExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((((((v_litAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 149 "Vuna/Compiler/Elab/Match.vuna"
and v_litAltExprGo = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let nd_uscrut6 = clauses in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (match dtb__307 with
  | { B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = dtb__310 } -> (match dtb__309 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (match dtb__311 with
  | Frontend_dAst.C_Pat_PVar (dtb__313, dtb__314) -> (((((v_buildColumnExpr table) ((v_prepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Frontend_dAst.C_Pat_PWild (dtb__315) -> (((((v_buildColumnExpr table) (v_stripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Base_dCommon.v_bind ((((((v_litAltExprGo table) dtb__308) pos) restParams) fb) (fuel - 1))) (fun (restExpr : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) (((v_litBranchClauses dtb__311) pos) clauses)) restParams) fb) (fuel - 1))) (fun (bodyExpr : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("==", (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (pos, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))), (B_dData_dList.C_List__x58__x58_ ((v_litPatExpr dtb__311), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb__311)))), bodyExpr, restExpr, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb__311))))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
))))
# 209 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (((((v_buildColumnExprPruned table) (v_pruneRows clauses0)) params) fb) fuel)))
# 216 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExprPruned = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (if (v_allEmptyPats clauses) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (if (v_allWildPats (v_firstPats clauses)) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (match params with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__316, dtb__317) -> (if (v_hasAsHead clauses) then ((((((v_asColumn table) clauses) dtb__316) dtb__317) fb) fuel) else (if (v_allVarHeads clauses) then (((((v_buildColumnExpr table) ((v_prepVarColumn dtb__316) clauses)) dtb__317) fb) (fuel - 1)) else (if (v_allCtorHeads clauses) then ((((((v_ctorColumn table) clauses) dtb__316) dtb__317) fb) fuel) else (if (v_hasCtorHead clauses) then ((((((v_ctorColumn table) clauses) dtb__316) dtb__317) fb) fuel) else ((((((v_litAltExpr table) clauses) dtb__316) dtb__317) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 242 "Vuna/Compiler/Elab/Match.vuna"
and v_asColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else ((Base_dCommon.v_bind (((((v_buildColumnExpr table) ((B_dData_dList.v_map (v_asInnerClause pos)) clauses)) (B_dData_dList.C_List__x58__x58_ (pos, restParams))) fb) (fuel - 1))) (fun (e : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC (e))))))
# 275 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((Base_dCommon.v_bind ((((((v_ctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (let caseSp = (v_firstPatSpan clauses) in (match ((v_familyCoverVerdict table) (v_ctorHeads clauses)) with
  | Elab_dCoverage.C_CoverVerdict_CoverProved -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (pos, (Frontend_dAst.v_detachedNodeRef caseSp))), alts, (Frontend_dAst.v_detachedNodeRef caseSp)))))
  | _ -> ((Base_dCommon.v_bind ((((((v_fallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun (fbAlts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (pos, (Frontend_dAst.v_detachedNodeRef caseSp))), ((B_dData_dList.v_append alts) fbAlts), (Frontend_dAst.v_detachedNodeRef caseSp)))))))
))))))
# 557 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (((((((v_ctorAltListGo table) clauses) (v_ctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 564 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltListGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string) (mc4 : string B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) (mc6 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (let subpatCount = ((v_ctorSubPatCount mc1) dtb__318) in (let freshSubs = ((v_subNamesFor mc3) subpatCount) in (let subParams = ((B_dData_dList.v_append freshSubs) mc4) in (let branchPats = ((B_dData_dList.v_map (fun (n : string) -> (Frontend_dAst.C_Pat_PVar (n, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))))) freshSubs) in (let headSp = (((v_ctorHeadSpan mc1) dtb__318) mc5) in (let expanded = ((((v_clausesForCtor dtb__318) branchPats) mc3) mc1) in ((Base_dCommon.v_bind (((((v_buildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun (bodyExpr : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((((v_ctorAltListGo mc0) mc1) dtb__319) mc3) mc4) mc5) (mc6 - 1))) (fun (tail : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb__318, branchPats, (Frontend_dAst.v_detachedNodeRef headSp))); Frontend_dAst.f_Alt_altBody = bodyExpr; Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) }, tail)))))))))))))))
  | B_dData_dList.C_List_Nil -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 664 "Vuna/Compiler/Elab/Match.vuna"
and v_fallbackAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (match ((v_prepFallbacks pos) (v_filterFallback clauses)) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | dtb__320 -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) dtb__320) restParams) fbSp) (fuel - 1))) (fun (bodyExpr : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))); Frontend_dAst.f_Alt_altBody = bodyExpr; Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) }, B_dData_dList.C_List_Nil))))))
)))

# 52 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToExprWith = (fun (reach : ((string, int) B_dData_dPair.t_Pair B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses) B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__321) -> (if ((v_clauseArityTooMany dtb__321) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else ((Base_dCommon.v_bind (((v_checkReachableWith reach) table) clauses)) (fun (_u : bool) -> (let names = (v_paramNames dtb__321) in ((Base_dCommon.v_bind (((((v_buildColumnExpr table) clauses) names) (v_firstPatSpan clauses)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf clauses)))) (fun (body : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC (((v_wrapLambdas names) body)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_multiToExprWith B_dData_dMaybe.C_Maybe_Nothing) table) clauses))

# 100 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToCaseExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dMaybe.C_Maybe_Just (dtb__322) -> (if ((v_clauseArityTooMany dtb__322) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else (((((v_buildColumnExpr table) clauses) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))) (v_firstPatSpan clauses)) (Elab_dCoverage.v_coverageFuelFor (v_matrixOf clauses))))
  | _ -> failwith "DT: impossible branch"
))
