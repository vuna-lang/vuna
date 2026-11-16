open Vuna_runtime
# 26 "Vuna/Compiler/Elab/Match.vuna"
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

# 50 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

# 54 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (n - 0)) n) Base_dList.C_Base_dList_dList_Nil))

# 62 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (dtb__12, Base_dList.C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__13) mc1), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__14, dtb__15) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__16, dtb__17) -> (dtb__14 = dtb__16)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__18, dtb__19) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__20) -> true
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__21, dtb__22) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__23, dtb__24) -> (dtb__21 = dtb__23)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__25, dtb__26) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__27) -> true
  | _ -> false
)
  | _ -> false
))

# 121 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__28, dtb__29) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__28, dtb__29))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__30, dtb__31) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__30, dtb__31))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))
))

# 141 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasAsHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__34; Base_dPair.f_Base_dPair_dPair_second = dtb__35 } -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__38, dtb__39, dtb__40) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__32)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__41, dtb__42, dtb__43) -> dtb__42
  | _ -> mc0
))

# 169 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__44 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__48)
  | _ -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
))

# 188 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if ((Base_dList.v_Base_dList_dmemName mc1) (Base_dPair.v_Base_dPair_dsecondOf dtb__50)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__50))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__51) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor mc0) dtb__52) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> ((Base_dList.v_Base_dList_dallMem dtb__54) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__57; Base_dPair.f_Base_dPair_dPair_second = dtb__58 } -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__56)
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__59 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__61, dtb__62, dtb__63) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__56)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__55)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = dtb__67 } -> (match dtb__66 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (match dtb__68 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__70, dtb__71, dtb__72) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__65)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__64)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = dtb__76 } -> (match dtb__75 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__74)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__73)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (match dtb__77 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__79; Base_dPair.f_Base_dPair_dPair_second = dtb__80 } -> dtb__80
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__81) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__82, dtb__83) -> true
  | _ -> false
))

# 233 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__86; Base_dPair.f_Base_dPair_dPair_second = dtb__87 } -> (match dtb__86 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__88) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__85) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__84)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = dtb__93 } -> (match dtb__92 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__93 }, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__91)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__90, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__91)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__90)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__96, dtb__97, dtb__98) -> ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__97)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__99, dtb__100) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__101, dtb__102) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__103, dtb__104, dtb__105) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__104)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__106) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__107, dtb__108, dtb__109) -> (Base_dList.C_Base_dList_dList_Cons (dtb__107, (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf dtb__108)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__110, dtb__111) -> (Base_dList.C_Base_dList_dList_Cons (dtb__110, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dfirstOf dtb__112))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__113))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName newName e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__114, dtb__115) -> (if (dtb__114 = oldName) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (newName, dtb__115)) else e)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__116, dtb__117) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__116, dtb__117))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__118, dtb__119) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__118, dtb__119))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__120, dtb__121) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__120, dtb__121))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__122, dtb__123, dtb__124) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__122, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) dtb__122) dtb__123), dtb__124))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__125, dtb__126, dtb__127) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__125), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__126), dtb__127))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__128, dtb__129, dtb__130, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__131), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (Base_dList.C_Base_dList_dList_Cons (dtb__128, Base_dList.C_Base_dList_dList_Nil))) dtb__132), dtb__133))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__134, dtb__135, dtb__136, dtb__137) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__134), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__134)) dtb__135), dtb__136, dtb__137))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__138, dtb__139, dtb__140) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__138), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__139), dtb__140))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__141, dtb__142) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__141), dtb__142))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__143, dtb__144, dtb__145, dtb__146) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__143), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__144), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__145), dtb__146))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__147, dtb__148, dtb__149) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__147), dtb__148, dtb__149))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__150, dtb__151, dtb__152) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__150, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__151), dtb__152))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__153, dtb__154, dtb__155) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__153), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__154), dtb__155))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__156, dtb__157) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__156, dtb__157))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__158, dtb__159, dtb__160, dtb__161) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__158, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__159), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__160), dtb__161))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__162, dtb__163, dtb__164, dtb__165) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__162, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__163), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__164), dtb__165))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__166, dtb__167) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__166, dtb__167))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__168, dtb__169, dtb__170) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__168, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__169), dtb__170))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__171, dtb__172, dtb__173) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__171), dtb__172, dtb__173))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__174, dtb__175) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__174), dtb__175))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__176, dtb__177, dtb__178) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__176), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__177), dtb__178))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__179, dtb__180, dtb__181) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__179, (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts oldName) newName) dtb__180), dtb__181))
  | _ -> failwith "DT: impossible branch"
))
# 297 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (match dtb__182 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__184) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr mc0) mc1) dtb__184))), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__183)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__185) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__185)), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__183)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName newName names body -> (if ((Base_dList.v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body)))
# 308 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName newName bind -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf bind); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf bind)) })
# 311 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName newName field -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf field); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf field)) })
# 316 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun oldName newName clause -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf clause); Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (Base_dPair.v_Base_dPair_dfirstOf clause))) (Base_dPair.v_Base_dPair_dsecondOf clause)) })
# 334 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName newName alt -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = p; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (Base_dPair.v_Base_dPair_dsecondOf alt)) }) (Base_dPair.v_Base_dPair_dfirstOf alt)))

# 103 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__186, dtb__187) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__186) mc0) mc2)
  | _ -> mc2
))

# 95 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (match dtb__188 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__190; Base_dPair.f_Base_dPair_dPair_second = dtb__191 } -> (match dtb__190 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__189) mc3)
  | Base_dList.C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches mc0) dtb__192) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__189) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__193; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody mc1) dtb__192) dtb__191) }, mc3))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__189) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit pos clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) Base_dList.C_Base_dList_dList_Nil))

# 162 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_drenameAsHead = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__194, dtb__195) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__194) mc0) mc2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__196, dtb__197, dtb__198) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__196) mc0) mc2)
  | _ -> mc2
))

# 154 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dasInnerClause = (fun mc0 mc1 -> (match mc1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__199; Base_dPair.f_Base_dPair_dPair_second = dtb__200 } -> (match dtb__199 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | Base_dList.C_Base_dList_dList_Cons (dtb__201, dtb__202) -> { Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead dtb__201), Base_dList.C_Base_dList_dList_Nil))) dtb__202); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameAsHead mc0) dtb__201) dtb__200) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = dtb__206 } -> (match dtb__205 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__203, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__204)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> (match dtb__207 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__209, dtb__210) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__209) mc0) dtb__206) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__204)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__211) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__206 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__204)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__206 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__204)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__203)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 } -> (match dtb__214 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__213) mc1)
  | Base_dList.C_Base_dList_dList_Cons (dtb__216, dtb__217) -> (match dtb__216 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__218, dtb__219, dtb__220) -> (if (dtb__218 = mc1) then (Base_dList.v_Base_dList_dlength dtb__219) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__213) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__213) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__212)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

# 379 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos i n acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (n - i)) n) acc))

# 376 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) Base_dList.C_Base_dList_dList_Nil))

# 395 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (if (dtb__221 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222)) else (Base_dList.C_Base_dList_dList_Cons (dtb__221, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__222))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__225; Base_dPair.f_Base_dPair_dPair_second = dtb__226 } -> (match dtb__225 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__224)
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (match dtb__227 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__229, dtb__230, dtb__231) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__229) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__224))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__224)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__223)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__232, dtb__233) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__234; Base_dPair.f_Base_dPair_dPair_second = dtb__235 } -> (match dtb__234 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__233)
  | Base_dList.C_Base_dList_dList_Cons (dtb__236, dtb__237) -> (match dtb__236 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__238, dtb__239, dtb__240) -> (if (dtb__238 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend dtb__239) dtb__237); Base_dPair.f_Base_dPair_dPair_second = dtb__235 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__233))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__233))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__241, dtb__242) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) dtb__237); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__241) mc2) dtb__235) }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__233)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__243) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) dtb__237); Base_dPair.f_Base_dPair_dPair_second = dtb__235 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__233)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__233)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__232)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__246; Base_dPair.f_Base_dPair_dPair_second = dtb__247 } -> (match dtb__246 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__245)
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__248) then (Base_dList.C_Base_dList_dList_Cons (dtb__244, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__245))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__245))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__244)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__250, dtb__251) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__252; Base_dPair.f_Base_dPair_dPair_second = dtb__253 } -> (match dtb__252 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__250, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__251)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__254, dtb__255) -> (match dtb__254 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__256, dtb__257) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__256) mc0) dtb__253) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__251)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__258) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = dtb__253 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__251)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__250, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__251)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__250)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 73 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__259, dtb__260) -> (match dtb__259 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__261; Base_dPair.f_Base_dPair_dPair_second = dtb__262 } -> (match dtb__261 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (match dtb__263 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__265, dtb__266) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__267) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__260) pos) restParams) fb) (fuel - 1))) (fun restExpr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__263) pos) clauses)) restParams) fb) (fuel - 1))) (fun bodyExpr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__263), Base_dList.C_Base_dList_dList_Nil)))), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__263))), bodyExpr, restExpr, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__263)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
)) clauses)))
# 127 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun table clauses params fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dList.C_Base_dList_dList_Cons (dtb__268, dtb__269) -> (if (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dasColumn table) clauses) dtb__268) dtb__269) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn dtb__268) clauses)) dtb__269) fb) (fuel - 1)) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__268) dtb__269) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__268) dtb__269) fb) fuel) else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__268) dtb__269) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
))))
# 147 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dasColumn = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dMatch_dasInnerClause pos)) clauses)) (Base_dList.C_Base_dList_dList_Cons (pos, restParams))) fb) (fuel - 1))) (fun e -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (e))))))
# 178 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table clauses pos restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), alts, caseSp)))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun fbAlts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), ((Base_dList.v_Base_dList_dappend alts) fbAlts), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))
# 345 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table clauses pos restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 350 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__270, dtb__271) -> (if (mc6 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun bodyExpr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__271) mc3) mc4) mc5) (mc6 - 1))) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__270, branchPats, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = bodyExpr }, tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__270) branchPats) mc3) mc1))) ((Base_dList.v_Base_dList_dmap (fun n -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (n, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })))) freshSubs))) ((Base_dList.v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__270)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc6 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 426 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table pos clauses restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern matrix") else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | dtb__272 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__272) restParams) fbSp) (fuel - 1))) (fun bodyExpr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ({ Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = bodyExpr }, Base_dList.C_Base_dList_dList_Nil))))))
)))

# 35 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table clauses -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FunctionNoClauses) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__273) -> ((fun names -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200)) (fun body -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__273))
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table clauses name -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (Base_dList.C_Base_dList_dList_Cons (name, Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200))
