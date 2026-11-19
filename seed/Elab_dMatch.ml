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

# 74 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripAsPat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PAs (dtb__12, dtb__13, dtb__14) -> (v_stripAsPat dtb__13)
  | _ -> mc0
))

# 71 "Vuna/Compiler/Elab/Match.vuna"
let v_matrixOf = (fun (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map (B_dData_dList.v_map v_stripAsPat)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) clauses)))

# 78 "Vuna/Compiler/Elab/Match.vuna"
let v_arityOf = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = dtb__18 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Elab/Match.vuna"
let rec v_paramNamesGo = (fun (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else (((v_paramNamesGo (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

# 82 "Vuna/Compiler/Elab/Match.vuna"
let v_paramNames = (fun (n : int) -> (((v_paramNamesGo (n - 0)) n) B_dData_dList.C_List_Nil))

# 92 "Vuna/Compiler/Elab/Match.vuna"
let rec v_wrapLambdas = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), ((v_wrapLambdas dtb__20) mc1), Base_dSource.v_spanEmpty))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatMatches = (fun (mc0 : Frontend_dRast.t_Pat) (mc1 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PStr (dtb__21, dtb__22) -> (match mc1 with
  | Frontend_dRast.C_Pat_PStr (dtb__23, dtb__24) -> (dtb__21 = dtb__23)
  | Frontend_dRast.C_Pat_PVar (dtb__25, dtb__26) -> true
  | Frontend_dRast.C_Pat_PWild (dtb__27) -> true
  | _ -> false
)
  | Frontend_dRast.C_Pat_PInt (dtb__28, dtb__29) -> (match mc1 with
  | Frontend_dRast.C_Pat_PInt (dtb__30, dtb__31) -> (dtb__28 = dtb__30)
  | Frontend_dRast.C_Pat_PVar (dtb__32, dtb__33) -> true
  | Frontend_dRast.C_Pat_PWild (dtb__34) -> true
  | _ -> false
)
  | _ -> false
))

# 157 "Vuna/Compiler/Elab/Match.vuna"
let v_litPatExpr = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PStr (dtb__35, dtb__36) -> (Frontend_dRast.C_Expr_EStr (dtb__35, dtb__36))
  | Frontend_dRast.C_Pat_PInt (dtb__37, dtb__38) -> (Frontend_dRast.C_Expr_EInt (dtb__37, dtb__38))
  | _ -> (Frontend_dRast.C_Expr_EInt (0, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))
))

# 189 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasAsHead = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> (match dtb__41 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (match dtb__43 with
  | Frontend_dRast.C_Pat_PAs (dtb__45, dtb__46, dtb__47) -> true
  | _ -> (v_hasAsHead dtb__40)
)
  | _ -> (v_hasAsHead dtb__40)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__39)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Match.vuna"
let v_innerOfHead = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PAs (dtb__48, dtb__49, dtb__50) -> dtb__49
  | _ -> mc0
))

# 220 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPatSpan = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (match dtb__51 with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> (match dtb__53 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (Frontend_dRast.v_patSpan dtb__55)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
))

# 242 "Vuna/Compiler/Elab/Match.vuna"
let rec v_familyOfCtor = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if ((B_dData_dList.v_memName mc1) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__57)))) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__57))) else ((v_familyOfCtor dtb__58) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Match.vuna"
let v_familyOfHead = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (h : string) -> (match ((v_familyOfCtor table) h) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__59)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Frontend_dRast.v_isListNilSyntax h) then ((Elab_dCoverage.v_familyOfShortCtors table) (B_dData_dList.C_List__x58__x58_ ("Nil", B_dData_dList.C_List_Nil))) else (if (Frontend_dRast.v_isListConsSyntax h) then ((Elab_dCoverage.v_familyOfShortCtors table) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil))))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Elab/Match.vuna"
let rec v_canonHeads = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (match ((Elab_dCoverage.v_sentinelCtorIn mc0) dtb__60) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> (match ((v_canonHeads mc0) dtb__61) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Elab/Match.vuna"
let v_familyCovered = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match ((v_familyOfHead mc0) dtb__64) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> ((fun names -> (match ((v_canonHeads dtb__66) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> ((B_dData_dList.v_allMem names) dtb__67)
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__66))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Elab/Match.vuna"
let rec v_hasCtorHead = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = dtb__71 } -> (match dtb__70 with
  | B_dData_dList.C_List_Nil -> (v_hasCtorHead dtb__69)
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__72 with
  | Frontend_dRast.C_Pat_PCon (dtb__74, dtb__75, dtb__76) -> true
  | _ -> (v_hasCtorHead dtb__69)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__68)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allCtorHeads = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__79; B_dData_dPair.f_Pair_second = dtb__80 } -> (match dtb__79 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (match dtb__81 with
  | Frontend_dRast.C_Pat_PCon (dtb__83, dtb__84, dtb__85) -> (v_allCtorHeads dtb__78)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__77)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Elab/Match.vuna"
let v_isWildPat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PWild (dtb__86) -> true
  | _ -> false
))

# 309 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allWildPats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (if (v_isWildPat dtb__87) then (v_allWildPats dtb__88) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Elab/Match.vuna"
let v_firstPats = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Elab/Match.vuna"
let rec v_irrefutablePat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PAs (dtb__93, dtb__94, dtb__95) -> (v_irrefutablePat dtb__94)
  | Frontend_dRast.C_Pat_PWild (dtb__96) -> true
  | Frontend_dRast.C_Pat_PVar (dtb__97, dtb__98) -> true
  | _ -> false
))

# 328 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allIrrefutablePats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (if (v_irrefutablePat dtb__99) then (v_allIrrefutablePats dtb__100) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Elab/Match.vuna"
let rec v_pruneRows = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (if (v_allIrrefutablePats (B_dData_dPair.v_firstOf dtb__101)) then (B_dData_dList.C_List__x58__x58_ (dtb__101, B_dData_dList.C_List_Nil)) else (B_dData_dList.C_List__x58__x58_ (dtb__101, (v_pruneRows dtb__102))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allEmptyPats = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> (match dtb__105 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyPats dtb__104)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__103)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Elab/Match.vuna"
let v_bodyOfFirst = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EInt (0, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | { B_dData_dPair.f_Pair_first = dtb__109; B_dData_dPair.f_Pair_second = dtb__110 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Elab/Match.vuna"
let v_isVarPatD = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PWild (dtb__111) -> true
  | Frontend_dRast.C_Pat_PVar (dtb__112, dtb__113) -> true
  | _ -> false
))

# 353 "Vuna/Compiler/Elab/Match.vuna"
let rec v_allVarHeads = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__116; B_dData_dPair.f_Pair_second = dtb__117 } -> (match dtb__116 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (if (v_isVarPatD dtb__118) then (v_allVarHeads dtb__115) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__114)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Elab/Match.vuna"
let rec v_stripFirstCol = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> (match dtb__122 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__123 }, (v_stripFirstCol dtb__121)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__120, (v_stripFirstCol dtb__121)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__120)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Elab/Match.vuna"
let rec v_patNamesOf = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__126, dtb__127, dtb__128) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair) -> (v_patNamesOf (B_dData_dPair.v_secondOf f)))) dtb__127)
  | Frontend_dRast.C_Pat_PStr (dtb__129, dtb__130) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Pat_PInt (dtb__131, dtb__132) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Pat_PCon (dtb__133, dtb__134, dtb__135) -> ((B_dData_dList.v_concatMap v_patNamesOf) dtb__134)
  | Frontend_dRast.C_Pat_PWild (dtb__136) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Pat_PAs (dtb__137, dtb__138, dtb__139) -> (B_dData_dList.C_List__x58__x58_ (dtb__137, (v_patNamesOf dtb__138)))
  | Frontend_dRast.C_Pat_PVar (dtb__140, dtb__141) -> (B_dData_dList.C_List__x58__x58_ (dtb__140, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Elab/Match.vuna"
let rec v_bindNames = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> ((B_dData_dList.v_append (v_patNamesOf (B_dData_dPair.v_firstOf dtb__142))) (v_bindNames dtb__143))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Match.vuna"
let rec v_renameExpr = (fun (oldName : string) (newName : string) (e : Frontend_dRast.t_Expr) -> (match e with
  | Frontend_dRast.C_Expr_EVar (dtb__144, dtb__145) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__144) = oldName) then (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName newName), dtb__145)) else e)
  | Frontend_dRast.C_Expr_EInt (dtb__146, dtb__147) -> (Frontend_dRast.C_Expr_EInt (dtb__146, dtb__147))
  | Frontend_dRast.C_Expr_EStr (dtb__148, dtb__149) -> (Frontend_dRast.C_Expr_EStr (dtb__148, dtb__149))
  | Frontend_dRast.C_Expr_EFloat (dtb__150, dtb__151) -> (Frontend_dRast.C_Expr_EFloat (dtb__150, dtb__151))
  | Frontend_dRast.C_Expr_ELam (dtb__152, dtb__153, dtb__154) -> (Frontend_dRast.C_Expr_ELam (dtb__152, ((((v_renameExprUnless oldName) newName) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__152)) dtb__153), dtb__154))
  | Frontend_dRast.C_Expr_EApp (dtb__155, dtb__156, dtb__157) -> (Frontend_dRast.C_Expr_EApp ((((v_renameExpr oldName) newName) dtb__155), ((B_dData_dList.v_map ((v_renameExpr oldName) newName)) dtb__156), dtb__157))
  | Frontend_dRast.C_Expr_EPi (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (Frontend_dRast.C_Expr_EPi (dtb__158, dtb__159, dtb__160, (((v_renameExpr oldName) newName) dtb__161), ((((v_renameExprUnless oldName) newName) (B_dData_dList.C_List__x58__x58_ (dtb__158, B_dData_dList.C_List_Nil))) dtb__162), dtb__163))
  | Frontend_dRast.C_Expr_ELet (dtb__164, dtb__165, dtb__166, dtb__167) -> (Frontend_dRast.C_Expr_ELet (((B_dData_dList.v_map ((v_renameBind oldName) newName)) dtb__164), ((((v_renameExprUnless oldName) newName) (v_bindNames dtb__164)) dtb__165), dtb__166, dtb__167))
  | Frontend_dRast.C_Expr_ECase (dtb__168, dtb__169, dtb__170) -> (Frontend_dRast.C_Expr_ECase ((((v_renameExpr oldName) newName) dtb__168), ((B_dData_dList.v_map ((v_renameAlt oldName) newName)) dtb__169), dtb__170))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__171, dtb__172) -> (Frontend_dRast.C_Expr_ELocalFun (((B_dData_dList.v_map ((v_renameLocalClause oldName) newName)) dtb__171), dtb__172))
  | Frontend_dRast.C_Expr_EIf (dtb__173, dtb__174, dtb__175, dtb__176) -> (Frontend_dRast.C_Expr_EIf ((((v_renameExpr oldName) newName) dtb__173), (((v_renameExpr oldName) newName) dtb__174), (((v_renameExpr oldName) newName) dtb__175), dtb__176))
  | Frontend_dRast.C_Expr_EField (dtb__177, dtb__178, dtb__179) -> (Frontend_dRast.C_Expr_EField ((((v_renameExpr oldName) newName) dtb__177), dtb__178, dtb__179))
  | Frontend_dRast.C_Expr_ERecord (dtb__180, dtb__181, dtb__182) -> (Frontend_dRast.C_Expr_ERecord (dtb__180, ((B_dData_dList.v_map ((v_renameFieldValue oldName) newName)) dtb__181), dtb__182))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__183, dtb__184, dtb__185) -> (Frontend_dRast.C_Expr_ERecUpdate ((((v_renameExpr oldName) newName) dtb__183), ((B_dData_dList.v_map ((v_renameFieldValue oldName) newName)) dtb__184), dtb__185))
  | Frontend_dRast.C_Expr_EDo (dtb__186, dtb__187) -> (Frontend_dRast.C_Expr_EDo (dtb__186, dtb__187))
  | Frontend_dRast.C_Expr_EInfix (dtb__188, dtb__189, dtb__190, dtb__191) -> (Frontend_dRast.C_Expr_EInfix (dtb__188, (((v_renameExpr oldName) newName) dtb__189), (((v_renameExpr oldName) newName) dtb__190), dtb__191))
  | Frontend_dRast.C_Expr_EBacktick (dtb__192, dtb__193, dtb__194, dtb__195) -> (Frontend_dRast.C_Expr_EBacktick (dtb__192, (((v_renameExpr oldName) newName) dtb__193), (((v_renameExpr oldName) newName) dtb__194), dtb__195))
  | Frontend_dRast.C_Expr_ESectOp (dtb__196, dtb__197) -> (Frontend_dRast.C_Expr_ESectOp (dtb__196, dtb__197))
  | Frontend_dRast.C_Expr_ESectL (dtb__198, dtb__199, dtb__200) -> (Frontend_dRast.C_Expr_ESectL (dtb__198, (((v_renameExpr oldName) newName) dtb__199), dtb__200))
  | Frontend_dRast.C_Expr_ESectR (dtb__201, dtb__202, dtb__203) -> (Frontend_dRast.C_Expr_ESectR ((((v_renameExpr oldName) newName) dtb__201), dtb__202, dtb__203))
  | Frontend_dRast.C_Expr_EParen (dtb__204, dtb__205) -> (Frontend_dRast.C_Expr_EParen ((((v_renameExpr oldName) newName) dtb__204), dtb__205))
  | Frontend_dRast.C_Expr_EAnn (dtb__206, dtb__207, dtb__208) -> (Frontend_dRast.C_Expr_EAnn ((((v_renameExpr oldName) newName) dtb__206), (((v_renameExpr oldName) newName) dtb__207), dtb__208))
  | Frontend_dRast.C_Expr_EInterp (dtb__209, dtb__210, dtb__211) -> (Frontend_dRast.C_Expr_EInterp (dtb__209, (((v_renameInterpParts oldName) newName) dtb__210), dtb__211))
  | _ -> failwith "DT: impossible branch"
))
# 434 "Vuna/Compiler/Elab/Match.vuna"
and v_renameInterpParts = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | Frontend_dRast.C_InterpPart_IPHole (dtb__214) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPHole ((((v_renameExpr mc0) mc1) dtb__214))), (((v_renameInterpParts mc0) mc1) dtb__213)))
  | Frontend_dRast.C_InterpPart_IPText (dtb__215) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPText (dtb__215)), (((v_renameInterpParts mc0) mc1) dtb__213)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 441 "Vuna/Compiler/Elab/Match.vuna"
and v_renameExprUnless = (fun (oldName : string) (newName : string) (names : string B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) -> (if ((B_dData_dList.v_memName oldName) names) then body else (((v_renameExpr oldName) newName) body)))
# 445 "Vuna/Compiler/Elab/Match.vuna"
and v_renameBind = (fun (oldName : string) (newName : string) (bnd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf bnd); B_dData_dPair.f_Pair_second = (((v_renameExpr oldName) newName) (B_dData_dPair.v_secondOf bnd)) })
# 448 "Vuna/Compiler/Elab/Match.vuna"
and v_renameFieldValue = (fun (oldName : string) (newName : string) (field : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf field); B_dData_dPair.f_Pair_second = (((v_renameExpr oldName) newName) (B_dData_dPair.v_secondOf field)) })
# 453 "Vuna/Compiler/Elab/Match.vuna"
and v_renameLocalClause = (fun (oldName : string) (newName : string) (clause : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf clause); B_dData_dPair.f_Pair_second = ((((v_renameExprUnless oldName) newName) ((B_dData_dList.v_concatMap v_patNamesOf) (B_dData_dPair.v_firstOf clause))) (B_dData_dPair.v_secondOf clause)) })
# 472 "Vuna/Compiler/Elab/Match.vuna"
and v_renameAlt = (fun (oldName : string) (newName : string) (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((fun p -> { B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = ((((v_renameExprUnless oldName) newName) (v_patNamesOf p)) (B_dData_dPair.v_secondOf alt)) }) (B_dData_dPair.v_firstOf alt)))

# 137 "Vuna/Compiler/Elab/Match.vuna"
let v_literalBranchBody = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat) (mc2 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Pat_PVar (dtb__216, dtb__217) -> (((v_renameExpr dtb__216) mc0) mc2)
  | _ -> mc2
))

# 127 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterLitBranch = (fun (mc0 : Frontend_dRast.t_Pat) (mc1 : string) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
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

# 124 "Vuna/Compiler/Elab/Match.vuna"
let v_litBranchClauses = (fun (lit : Frontend_dRast.t_Pat) (pos : string) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_filterLitBranch lit) pos) clauses) B_dData_dList.C_List_Nil))

# 213 "Vuna/Compiler/Elab/Match.vuna"
let v_renameAsHead = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat) (mc2 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Pat_PVar (dtb__224, dtb__225) -> (((v_renameExpr dtb__224) mc0) mc2)
  | Frontend_dRast.C_Pat_PAs (dtb__226, dtb__227, dtb__228) -> (((v_renameExpr dtb__226) mc0) mc2)
  | _ -> mc2
))

# 205 "Vuna/Compiler/Elab/Match.vuna"
let v_asInnerClause = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__229; B_dData_dPair.f_Pair_second = dtb__230 } -> (match dtb__229 with
  | B_dData_dList.C_List_Nil -> mc1
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_innerOfHead dtb__231), B_dData_dList.C_List_Nil))) dtb__232); B_dData_dPair.f_Pair_second = (((v_renameAsHead mc0) dtb__231) dtb__230) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepVarColumn = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__235; B_dData_dPair.f_Pair_second = dtb__236 } -> (match dtb__235 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__233, ((v_prepVarColumn mc0) dtb__234)))
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> (match dtb__237 with
  | Frontend_dRast.C_Pat_PVar (dtb__239, dtb__240) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__239) mc0) dtb__236) }, ((v_prepVarColumn mc0) dtb__234)))
  | Frontend_dRast.C_Pat_PWild (dtb__241) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__236 }, ((v_prepVarColumn mc0) dtb__234)))
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__236 }, ((v_prepVarColumn mc0) dtb__234)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__233)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorSubPatCount = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = dtb__245 } -> (match dtb__244 with
  | B_dData_dList.C_List_Nil -> ((v_ctorSubPatCount dtb__243) mc1)
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | Frontend_dRast.C_Pat_PCon (dtb__248, dtb__249, dtb__250) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__248) = mc1) then (B_dData_dList.v_length dtb__249) else ((v_ctorSubPatCount dtb__243) mc1))
  | _ -> ((v_ctorSubPatCount dtb__243) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__242)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Elab/Match.vuna"
let rec v_subNamesForGoGo = (fun (pos : string) (remaining : int) (n : int) (acc : string B_dData_dList.t_List) -> (if (remaining <= 0) then (B_dData_dList.v_reverse acc) else ((((v_subNamesForGoGo pos) (remaining - 1)) n) (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

# 523 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesForGo = (fun (pos : string) (i : int) (n : int) (acc : string B_dData_dList.t_List) -> ((((v_subNamesForGoGo pos) (n - i)) n) acc))

# 520 "Vuna/Compiler/Elab/Match.vuna"
let v_subNamesFor = (fun (pos : string) (n : int) -> ((((v_subNamesForGo pos) 0) n) B_dData_dList.C_List_Nil))

# 543 "Vuna/Compiler/Elab/Match.vuna"
let rec v_addNameDistinct = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (if (dtb__251 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252)) else (B_dData_dList.C_List__x58__x58_ (dtb__251, ((v_addNameDistinct mc0) dtb__252))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 533 "Vuna/Compiler/Elab/Match.vuna"
let rec v_ctorHeads = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__255; B_dData_dPair.f_Pair_second = dtb__256 } -> (match dtb__255 with
  | B_dData_dList.C_List_Nil -> (v_ctorHeads dtb__254)
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match dtb__257 with
  | Frontend_dRast.C_Pat_PCon (dtb__259, dtb__260, dtb__261) -> ((v_addNameDistinct (Frontend_dRast_dName.v_rnameKey dtb__259)) (v_ctorHeads dtb__254))
  | _ -> (v_ctorHeads dtb__254)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__253)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Elab/Match.vuna"
let rec v_clausesForCtor = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc2 : string) (mc3 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (match dtb__264 with
  | B_dData_dList.C_List_Nil -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__263)
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (match dtb__266 with
  | Frontend_dRast.C_Pat_PCon (dtb__268, dtb__269, dtb__270) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__268) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__269) dtb__267); B_dData_dPair.f_Pair_second = dtb__265 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__263))) else ((((v_clausesForCtor mc0) mc1) mc2) dtb__263))
  | Frontend_dRast.C_Pat_PVar (dtb__271, dtb__272) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__267); B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__271) mc2) dtb__265) }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__263)))
  | Frontend_dRast.C_Pat_PWild (dtb__273) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) dtb__267); B_dData_dPair.f_Pair_second = dtb__265 }, ((((v_clausesForCtor mc0) mc1) mc2) dtb__263)))
  | _ -> ((((v_clausesForCtor mc0) mc1) mc2) dtb__263)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__262)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 569 "Vuna/Compiler/Elab/Match.vuna"
let rec v_filterFallback = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__274, dtb__275) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = dtb__277 } -> (match dtb__276 with
  | B_dData_dList.C_List_Nil -> (v_filterFallback dtb__275)
  | B_dData_dList.C_List__x58__x58_ (dtb__278, dtb__279) -> (if (v_isVarPatD dtb__278) then (B_dData_dList.C_List__x58__x58_ (dtb__274, (v_filterFallback dtb__275))) else (v_filterFallback dtb__275))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__274)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Elab/Match.vuna"
let rec v_prepFallbacks = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> (match dtb__282 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__280, ((v_prepFallbacks mc0) dtb__281)))
  | B_dData_dList.C_List__x58__x58_ (dtb__284, dtb__285) -> (match dtb__284 with
  | Frontend_dRast.C_Pat_PVar (dtb__286, dtb__287) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__285; B_dData_dPair.f_Pair_second = (((v_renameExpr dtb__286) mc0) dtb__283) }, ((v_prepFallbacks mc0) dtb__281)))
  | Frontend_dRast.C_Pat_PWild (dtb__288) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__285; B_dData_dPair.f_Pair_second = dtb__283 }, ((v_prepFallbacks mc0) dtb__281)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__280, ((v_prepFallbacks mc0) dtb__281)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__280)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Elab/Match.vuna"
let rec v_litAltExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((((((v_litAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 103 "Vuna/Compiler/Elab/Match.vuna"
and v_litAltExprGo = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> (match dtb__289 with
  | { B_dData_dPair.f_Pair_first = dtb__291; B_dData_dPair.f_Pair_second = dtb__292 } -> (match dtb__291 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (match dtb__293 with
  | Frontend_dRast.C_Pat_PVar (dtb__295, dtb__296) -> (((((v_buildColumnExpr table) ((v_prepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Frontend_dRast.C_Pat_PWild (dtb__297) -> (((((v_buildColumnExpr table) (v_stripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Base_dCommon.v_bind ((((((v_litAltExprGo table) dtb__290) pos) restParams) fb) (fuel - 1))) (fun (restExpr : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) (((v_litBranchClauses dtb__293) pos) clauses)) restParams) fb) (fuel - 1))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EIf ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "=="), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName pos), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), (B_dData_dList.C_List__x58__x58_ ((v_litPatExpr dtb__293), B_dData_dList.C_List_Nil)))), (Frontend_dRast.v_patSpan dtb__293))), bodyExpr, restExpr, (Frontend_dRast.v_patSpan dtb__293)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
)) clauses)))
# 163 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (((((v_buildColumnExprPruned table) (v_pruneRows clauses0)) params) fb) fuel)))
# 170 "Vuna/Compiler/Elab/Match.vuna"
and v_buildColumnExprPruned = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (params : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else (if (v_allEmptyPats clauses) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (if (v_allWildPats (v_firstPats clauses)) then (Base_dDiag.C_Check_OkC ((v_bodyOfFirst clauses))) else (match params with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dTc.v_tcErr0 fb) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (if (v_hasAsHead clauses) then ((((((v_asColumn table) clauses) dtb__298) dtb__299) fb) fuel) else (if (v_allVarHeads clauses) then (((((v_buildColumnExpr table) ((v_prepVarColumn dtb__298) clauses)) dtb__299) fb) (fuel - 1)) else (if (v_allCtorHeads clauses) then ((((((v_ctorColumn table) clauses) dtb__298) dtb__299) fb) fuel) else (if (v_hasCtorHead clauses) then ((((((v_ctorColumn table) clauses) dtb__298) dtb__299) fb) fuel) else ((((((v_litAltExpr table) clauses) dtb__298) dtb__299) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 196 "Vuna/Compiler/Elab/Match.vuna"
and v_asColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fb : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_PatternFuel) B_dData_dVec.C_Vec_Nil))) else ((Base_dCommon.v_bind (((((v_buildColumnExpr table) ((B_dData_dList.v_map (v_asInnerClause pos)) clauses)) (B_dData_dList.C_List__x58__x58_ (pos, restParams))) fb) (fuel - 1))) (fun (e : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC (e))))))
# 229 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorColumn = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((Base_dCommon.v_bind ((((((v_ctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun caseSp -> (if ((v_familyCovered table) (v_ctorHeads clauses)) then (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName pos), caseSp)), alts, caseSp)))) else ((Base_dCommon.v_bind ((((((v_fallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun (fbAlts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName pos), caseSp)), ((B_dData_dList.v_append alts) fbAlts), caseSp)))))))) (v_firstPatSpan clauses))))))
# 483 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (((((((v_ctorAltListGo table) clauses) (v_ctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 490 "Vuna/Compiler/Elab/Match.vuna"
and v_ctorAltListGo = (fun (mc0 : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string) (mc4 : string B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) (mc6 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__300, dtb__301) -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((Base_dCommon.v_bind (((((v_buildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((((((v_ctorAltListGo mc0) mc1) dtb__301) mc3) mc4) mc5) (mc6 - 1))) (fun (tail : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__300), branchPats, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = bodyExpr }, tail))))))))) ((((v_clausesForCtor dtb__300) branchPats) mc3) mc1))) ((B_dData_dList.v_map (fun (n : string) -> (Frontend_dRast.C_Pat_PVar (n, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })))) freshSubs))) ((B_dData_dList.v_append freshSubs) mc4))) ((v_subNamesFor mc3) subpatCount))) ((v_ctorSubPatCount mc1) dtb__300)))
  | B_dData_dList.C_List_Nil -> (if (mc6 <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 579 "Vuna/Compiler/Elab/Match.vuna"
and v_fallbackAltList = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (pos : string) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (restParams : string B_dData_dList.t_List) (fbSp : Base_dSource.t_Span) (fuel : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "pattern matrix") else (match ((v_prepFallbacks pos) (v_filterFallback clauses)) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | dtb__302 -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) dtb__302) restParams) fbSp) (fuel - 1))) (fun (bodyExpr : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PWild ({ Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = bodyExpr }, B_dData_dList.C_List_Nil))))))
)))

# 45 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_FunctionNoClauses) B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__303) -> (if ((v_clauseArityTooMany dtb__303) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else ((fun names -> ((Base_dCommon.v_bind (((((v_buildColumnExpr table) clauses) names) (v_firstPatSpan clauses)) 200)) (fun (body : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC (((v_wrapLambdas names) body)))))) (v_paramNames dtb__303)))
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Elab/Match.vuna"
let v_multiToCaseExpr = (fun (table : (string, (bool, (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match (v_arityOf clauses) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns)
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (if ((v_clauseArityTooMany dtb__304) clauses) then ((Base_dDiagnostics_dTc.v_tcErr0 (v_firstPatSpan clauses)) Base_dDiagnostics_dTc.C_TcErr_ClauseTooManyPatterns) else (((((v_buildColumnExpr table) clauses) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))) (v_firstPatSpan clauses)) 200))
  | _ -> failwith "DT: impossible branch"
))
