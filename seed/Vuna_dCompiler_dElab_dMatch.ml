open Vuna_runtime
# 27 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__2, dtb__3) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__4) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dcoverageError = (fun table sp clauses -> (match ((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dmissingTopCtor table) clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__8) -> ((fun rx -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotExhaustive (rx))) (Base_dVec.C_Base_dVec_dVec_Cons (rx, Base_dVec.C_Base_dVec_dVec_Nil))))))) (Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_drenderPat dtb__8))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dstripAsPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__9, dtb__10, dtb__11) -> (v_Vuna_dCompiler_dElab_dMatch_dstripAsPat dtb__10)
  | _ -> mc0
))

# 73 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = dtb__15 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__14)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

# 77 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (n - 0)) n) Base_dList.C_Base_dList_dList_Nil))

# 85 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (dtb__16, Base_dList.C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__17) mc1), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__18, dtb__19) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__20, dtb__21) -> (dtb__18 = dtb__20)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__22, dtb__23) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__24) -> true
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__25, dtb__26) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__27, dtb__28) -> (dtb__25 = dtb__27)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__29, dtb__30) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__31) -> true
  | _ -> false
)
  | _ -> false
))

# 144 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__32, dtb__33) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__32, dtb__33))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__34, dtb__35) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__34, dtb__35))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))
))

# 164 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasAsHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> (match dtb__38 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__42, dtb__43, dtb__44) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__37)
)
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__37)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__36)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__45, dtb__46, dtb__47) -> dtb__46
  | _ -> mc0
))

# 192 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__48 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 } -> (match dtb__50 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__52)
  | _ -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
))

# 211 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if ((Base_dList.v_Base_dList_dmemName mc1) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dPair.v_Base_dPair_dsecondOf dtb__54))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__54))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__55) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor mc0) dtb__56) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> ((Base_dList.v_Base_dList_dallMem ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__58)) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__61; Base_dPair.f_Base_dPair_dPair_second = dtb__62 } -> (match dtb__61 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__60)
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (match dtb__63 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__65, dtb__66, dtb__67) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__60)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__59)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__70; Base_dPair.f_Base_dPair_dPair_second = dtb__71 } -> (match dtb__70 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match dtb__72 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__74, dtb__75, dtb__76) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__69)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__68)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__79; Base_dPair.f_Base_dPair_dPair_second = dtb__80 } -> (match dtb__79 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__78)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__77)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (match dtb__81 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__83; Base_dPair.f_Base_dPair_dPair_second = dtb__84 } -> dtb__84
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__85) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__86, dtb__87) -> true
  | _ -> false
))

# 256 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__90; Base_dPair.f_Base_dPair_dPair_second = dtb__91 } -> (match dtb__90 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__92) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__89) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__88)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__96; Base_dPair.f_Base_dPair_dPair_second = dtb__97 } -> (match dtb__96 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__97 }, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__95)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__94, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__95)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__94)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__100, dtb__101, dtb__102) -> ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__101)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__103, dtb__104) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__105, dtb__106) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__107, dtb__108, dtb__109) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__108)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__110) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__111, dtb__112, dtb__113) -> (Base_dList.C_Base_dList_dList_Cons (dtb__111, (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf dtb__112)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__114, dtb__115) -> (Base_dList.C_Base_dList_dList_Cons (dtb__114, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dfirstOf dtb__116))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__117))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName newName e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__118, dtb__119) -> (if (dtb__118 = oldName) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (newName, dtb__119)) else e)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__120, dtb__121) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__120, dtb__121))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__122, dtb__123) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__122, dtb__123))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__124, dtb__125) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__124, dtb__125))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__126, dtb__127, dtb__128) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__126, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) dtb__126) dtb__127), dtb__128))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__129, dtb__130, dtb__131) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__129), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__130), dtb__131))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__132, dtb__133, dtb__134, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__135), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (Base_dList.C_Base_dList_dList_Cons (dtb__132, Base_dList.C_Base_dList_dList_Nil))) dtb__136), dtb__137))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__138, dtb__139, dtb__140, dtb__141) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__138), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__138)) dtb__139), dtb__140, dtb__141))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__142, dtb__143, dtb__144) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__142), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__143), dtb__144))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__145, dtb__146) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__145), dtb__146))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__147, dtb__148, dtb__149, dtb__150) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__147), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__148), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__149), dtb__150))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__151, dtb__152, dtb__153) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__151), dtb__152, dtb__153))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__154, dtb__155, dtb__156) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__154, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__155), dtb__156))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__157, dtb__158, dtb__159) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__157), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__158), dtb__159))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__160, dtb__161) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__160, dtb__161))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__162, dtb__163, dtb__164, dtb__165) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__162, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__163), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__164), dtb__165))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__166, dtb__167, dtb__168, dtb__169) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__166, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__167), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__168), dtb__169))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__170, dtb__171) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__170, dtb__171))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__172, dtb__173, dtb__174) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__172, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__173), dtb__174))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__175, dtb__176, dtb__177) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__175), dtb__176, dtb__177))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__178, dtb__179) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__178), dtb__179))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__180, dtb__181, dtb__182) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__180), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__181), dtb__182))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__183, dtb__184, dtb__185) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__183, (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts oldName) newName) dtb__184), dtb__185))
  | _ -> failwith "DT: impossible branch"
))
# 320 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (match dtb__186 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__188) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr mc0) mc1) dtb__188))), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__187)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__189) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__189)), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__187)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 327 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName newName names body -> (if ((Base_dList.v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body)))
# 331 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName newName bind -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf bind); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf bind)) })
# 334 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName newName field -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf field); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf field)) })
# 339 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun oldName newName clause -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf clause); Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (Base_dPair.v_Base_dPair_dfirstOf clause))) (Base_dPair.v_Base_dPair_dsecondOf clause)) })
# 357 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName newName alt -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = p; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (Base_dPair.v_Base_dPair_dsecondOf alt)) }) (Base_dPair.v_Base_dPair_dfirstOf alt)))

# 126 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__190, dtb__191) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__190) mc0) mc2)
  | _ -> mc2
))

# 118 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (match dtb__192 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (match dtb__194 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__193) mc3)
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches mc0) dtb__196) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__193) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__197; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody mc1) dtb__196) dtb__195) }, mc3))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__193) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit pos clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) Base_dList.C_Base_dList_dList_Nil))

# 185 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_drenameAsHead = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__198, dtb__199) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__198) mc0) mc2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__200, dtb__201, dtb__202) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__200) mc0) mc2)
  | _ -> mc2
))

# 177 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dasInnerClause = (fun mc0 mc1 -> (match mc1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 } -> (match dtb__203 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | Base_dList.C_Base_dList_dList_Cons (dtb__205, dtb__206) -> { Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead dtb__205), Base_dList.C_Base_dList_dList_Nil))) dtb__206); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameAsHead mc0) dtb__205) dtb__204) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__209; Base_dPair.f_Base_dPair_dPair_second = dtb__210 } -> (match dtb__209 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__207, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__208)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (match dtb__211 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__213, dtb__214) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__212; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__213) mc0) dtb__210) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__208)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__215) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__212; Base_dPair.f_Base_dPair_dPair_second = dtb__210 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__208)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__212; Base_dPair.f_Base_dPair_dPair_second = dtb__210 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__208)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__207)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__216, dtb__217) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__218; Base_dPair.f_Base_dPair_dPair_second = dtb__219 } -> (match dtb__218 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__217) mc1)
  | Base_dList.C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (match dtb__220 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__222, dtb__223, dtb__224) -> (if (dtb__222 = mc1) then (Base_dList.v_Base_dList_dlength dtb__223) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__217) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__217) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__216)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

# 402 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos i n acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (n - i)) n) acc))

# 399 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) Base_dList.C_Base_dList_dList_Nil))

# 418 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__225, dtb__226) -> (if (dtb__225 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__225, dtb__226)) else (Base_dList.C_Base_dList_dList_Cons (dtb__225, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__226))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__229; Base_dPair.f_Base_dPair_dPair_second = dtb__230 } -> (match dtb__229 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__228)
  | Base_dList.C_Base_dList_dList_Cons (dtb__231, dtb__232) -> (match dtb__231 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__233, dtb__234, dtb__235) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__233) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__228))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__228)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__227)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__236, dtb__237) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__238; Base_dPair.f_Base_dPair_dPair_second = dtb__239 } -> (match dtb__238 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__237)
  | Base_dList.C_Base_dList_dList_Cons (dtb__240, dtb__241) -> (match dtb__240 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__242, dtb__243, dtb__244) -> (if (dtb__242 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend dtb__243) dtb__241); Base_dPair.f_Base_dPair_dPair_second = dtb__239 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__237))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__237))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__245, dtb__246) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) dtb__241); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__245) mc2) dtb__239) }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__237)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__247) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) dtb__241); Base_dPair.f_Base_dPair_dPair_second = dtb__239 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__237)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__237)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__236)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__250; Base_dPair.f_Base_dPair_dPair_second = dtb__251 } -> (match dtb__250 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__249)
  | Base_dList.C_Base_dList_dList_Cons (dtb__252, dtb__253) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__252) then (Base_dList.C_Base_dList_dList_Cons (dtb__248, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__249))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__249))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__248)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__254, dtb__255) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__256; Base_dPair.f_Base_dPair_dPair_second = dtb__257 } -> (match dtb__256 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__254, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__255)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__258, dtb__259) -> (match dtb__258 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__260, dtb__261) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__259; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__260) mc0) dtb__257) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__255)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__262) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__259; Base_dPair.f_Base_dPair_dPair_second = dtb__257 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__255)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__254, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__255)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__254)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 96 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (match dtb__263 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__265; Base_dPair.f_Base_dPair_dPair_second = dtb__266 } -> (match dtb__265 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dList.C_Base_dList_dList_Cons (dtb__267, dtb__268) -> (match dtb__267 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__269, dtb__270) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__271) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__264) pos) restParams) fb) (fuel - 1))) (fun restExpr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__267) pos) clauses)) restParams) fb) (fuel - 1))) (fun bodyExpr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__267), Base_dList.C_Base_dList_dList_Nil)))), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__267))), bodyExpr, restExpr, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__267)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
)) clauses)))
# 150 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun table clauses params fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dList.C_Base_dList_dList_Cons (dtb__272, dtb__273) -> (if (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dasColumn table) clauses) dtb__272) dtb__273) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn dtb__272) clauses)) dtb__273) fb) (fuel - 1)) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__272) dtb__273) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__272) dtb__273) fb) fuel) else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__272) dtb__273) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
))))
# 170 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dasColumn = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dMatch_dasInnerClause pos)) clauses)) (Base_dList.C_Base_dList_dList_Cons (pos, restParams))) fb) (fuel - 1))) (fun e -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (e))))))
# 201 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table clauses pos restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), alts, caseSp)))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun fbAlts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), ((Base_dList.v_Base_dList_dappend alts) fbAlts), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))
# 368 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table clauses pos restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 373 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__274, dtb__275) -> (if (mc6 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun bodyExpr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__275) mc3) mc4) mc5) (mc6 - 1))) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__274, branchPats, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = bodyExpr }, tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__274) branchPats) mc3) mc1))) ((Base_dList.v_Base_dList_dmap (fun n -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (n, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })))) freshSubs))) ((Base_dList.v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__274)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc6 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 449 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table pos clauses restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | dtb__276 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__276) restParams) fbSp) (fuel - 1))) (fun bodyExpr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ({ Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = bodyExpr }, Base_dList.C_Base_dList_dList_Nil))))))
)))

# 36 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table clauses -> ((fun _u -> (match (((v_Vuna_dCompiler_dElab_dMatch_dcoverageError table) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) ((Base_dList.v_Base_dList_dmap (Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dMatch_dstripAsPat)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) clauses))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__277) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__277))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FunctionNoClauses) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__278) -> ((fun names -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200)) (fun body -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__278))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line "M2E") else 0)))

# 53 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table clauses name -> (match (((v_Vuna_dCompiler_dElab_dMatch_dcoverageError table) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) ((Base_dList.v_Base_dList_dmap (Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dMatch_dstripAsPat)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) clauses))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__279))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (Base_dList.C_Base_dList_dList_Cons (name, Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200)
  | _ -> failwith "DT: impossible branch"
))
