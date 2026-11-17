open Vuna_runtime
# 27 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__2, dtb__3) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__4) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (if ((Base_dList.v_Base_dList_dlength dtb__10) > mc0) then true else ((v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany mc0) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dstripAsPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__12, dtb__13, dtb__14) -> (v_Vuna_dCompiler_dElab_dMatch_dstripAsPat dtb__13)
  | _ -> mc0
))

# 64 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmatrixOf = (fun clauses -> ((Base_dList.v_Base_dList_dmap (Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dMatch_dstripAsPat)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) clauses)))

# 71 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__17; Base_dPair.f_Base_dPair_dPair_second = dtb__18 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList__x58__x58_ (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

# 75 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (n - 0)) n) Base_dList.C_Base_dList_dList_Nil))

# 83 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__19, dtb__20) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__19; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dList.C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__20) mc1), Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__21, dtb__22) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__23, dtb__24) -> (dtb__21 = dtb__23)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__25, dtb__26) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__27) -> true
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__28, dtb__29) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__30, dtb__31) -> (dtb__28 = dtb__30)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__32, dtb__33) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__34) -> true
  | _ -> false
)
  | _ -> false
))

# 142 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__35, dtb__36) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__35, dtb__36))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__37, dtb__38) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__37, dtb__38))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))
))

# 172 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasAsHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__39, dtb__40) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (match dtb__43 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__45, dtb__46, dtb__47) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__40)
)
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__40)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__39)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__48, dtb__49, dtb__50) -> dtb__49
  | _ -> mc0
))

# 200 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (match dtb__51 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__53; Base_dPair.f_Base_dPair_dPair_second = dtb__54 } -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__55)
  | _ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
))

# 219 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if ((Base_dList.v_Base_dList_dmemName mc1) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__57)))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__57))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__58) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor mc0) dtb__59) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> ((Base_dList.v_Base_dList_dallMem ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dPair.v_Base_dPair_dsecondOf dtb__61))) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__62, dtb__63) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__64; Base_dPair.f_Base_dPair_dPair_second = dtb__65 } -> (match dtb__64 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__63)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__68, dtb__69, dtb__70) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__63)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__62)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__73; Base_dPair.f_Base_dPair_dPair_second = dtb__74 } -> (match dtb__73 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (match dtb__75 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__77, dtb__78, dtb__79) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__72)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__71)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_disWildPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__80) -> true
  | _ -> false
))

# 251 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallWildPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (if (v_Vuna_dCompiler_dElab_dMatch_disWildPat dtb__81) then (v_Vuna_dCompiler_dElab_dMatch_dallWildPats dtb__82) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfirstPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (match dtb__83 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__85; Base_dPair.f_Base_dPair_dPair_second = dtb__86 } -> dtb__85
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dirrefutablePat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__87, dtb__88, dtb__89) -> (v_Vuna_dCompiler_dElab_dMatch_dirrefutablePat dtb__88)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__90) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__91, dtb__92) -> true
  | _ -> false
))

# 270 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallIrrefutablePats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__93, dtb__94) -> (if (v_Vuna_dCompiler_dElab_dMatch_dirrefutablePat dtb__93) then (v_Vuna_dCompiler_dElab_dMatch_dallIrrefutablePats dtb__94) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dpruneRows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (if (v_Vuna_dCompiler_dElab_dMatch_dallIrrefutablePats (Base_dPair.v_Base_dPair_dfirstOf dtb__95)) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__95, Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__95, (v_Vuna_dCompiler_dElab_dMatch_dpruneRows dtb__96))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__97, dtb__98) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__100 } -> (match dtb__99 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__98)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__97)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__101, dtb__102) -> (match dtb__101 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__103; Base_dPair.f_Base_dPair_dPair_second = dtb__104 } -> dtb__104
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__105) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__106, dtb__107) -> true
  | _ -> false
))

# 294 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__108, dtb__109) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__110; Base_dPair.f_Base_dPair_dPair_second = dtb__111 } -> (match dtb__110 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__112, dtb__113) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__112) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__109) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__108)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__114, dtb__115) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__116; Base_dPair.f_Base_dPair_dPair_second = dtb__117 } -> (match dtb__116 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__117 }, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__115)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__114, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__115)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__114)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__120, dtb__121, dtb__122) -> ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__121)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__123, dtb__124) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__125, dtb__126) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__127, dtb__128, dtb__129) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__128)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__130) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__131, dtb__132, dtb__133) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__131, (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf dtb__132)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__134, dtb__135) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__134, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__136, dtb__137) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dfirstOf dtb__136))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__137))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName newName e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__138, dtb__139) -> (if (dtb__138 = oldName) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (newName, dtb__139)) else e)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__140, dtb__141) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__140, dtb__141))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__142, dtb__143) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__142, dtb__143))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__144, dtb__145) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__144, dtb__145))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__146, dtb__147, dtb__148) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__146, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__146)) dtb__147), dtb__148))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__149, dtb__150, dtb__151) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__149), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__150), dtb__151))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__152, dtb__153, dtb__154, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__155), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__152, Base_dList.C_Base_dList_dList_Nil))) dtb__156), dtb__157))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__158, dtb__159, dtb__160, dtb__161) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__158), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__158)) dtb__159), dtb__160, dtb__161))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__162, dtb__163, dtb__164) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__162), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__163), dtb__164))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__165, dtb__166) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__165), dtb__166))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__167, dtb__168, dtb__169, dtb__170) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__167), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__168), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__169), dtb__170))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__171, dtb__172, dtb__173) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__171), dtb__172, dtb__173))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__174, dtb__175, dtb__176) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__174, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__175), dtb__176))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__177, dtb__178, dtb__179) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__177), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__178), dtb__179))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__180, dtb__181) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__180, dtb__181))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__182, dtb__183, dtb__184, dtb__185) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__182, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__183), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__184), dtb__185))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__186, dtb__187, dtb__188, dtb__189) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__186, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__187), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__188), dtb__189))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__190, dtb__191) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__190, dtb__191))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__192, dtb__193, dtb__194) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__192, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__193), dtb__194))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__195, dtb__196, dtb__197) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__195), dtb__196, dtb__197))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__198, dtb__199) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__198), dtb__199))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__200, dtb__201, dtb__202) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__200), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__201), dtb__202))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__203, dtb__204, dtb__205) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__203, (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts oldName) newName) dtb__204), dtb__205))
  | _ -> failwith "DT: impossible branch"
))
# 358 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (match dtb__206 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__208) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr mc0) mc1) dtb__208))), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__207)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__209) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__209)), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__207)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 365 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName newName names body -> (if ((Base_dList.v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body)))
# 369 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName newName bnd -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf bnd); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf bnd)) })
# 372 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName newName field -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf field); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf field)) })
# 377 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun oldName newName clause -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf clause); Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (Base_dPair.v_Base_dPair_dfirstOf clause))) (Base_dPair.v_Base_dPair_dsecondOf clause)) })
# 395 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName newName alt -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = p; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (Base_dPair.v_Base_dPair_dsecondOf alt)) }) (Base_dPair.v_Base_dPair_dfirstOf alt)))

# 124 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__210, dtb__211) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__210) mc0) mc2)
  | _ -> mc2
))

# 116 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 } -> (match dtb__214 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__213) mc3)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__216, dtb__217) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches mc0) dtb__216) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__213) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__217; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody mc1) dtb__216) dtb__215) }, mc3))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__213) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit pos clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) Base_dList.C_Base_dList_dList_Nil))

# 193 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_drenameAsHead = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__218, dtb__219) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__218) mc0) mc2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__220, dtb__221, dtb__222) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__220) mc0) mc2)
  | _ -> mc2
))

# 185 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dasInnerClause = (fun mc0 mc1 -> (match mc1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__223; Base_dPair.f_Base_dPair_dPair_second = dtb__224 } -> (match dtb__223 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__225, dtb__226) -> { Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead dtb__225), Base_dList.C_Base_dList_dList_Nil))) dtb__226); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameAsHead mc0) dtb__225) dtb__224) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__227, dtb__228) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__229; Base_dPair.f_Base_dPair_dPair_second = dtb__230 } -> (match dtb__229 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__227, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__228)))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__231, dtb__232) -> (match dtb__231 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__233, dtb__234) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__232; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__233) mc0) dtb__230) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__228)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__235) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__232; Base_dPair.f_Base_dPair_dPair_second = dtb__230 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__228)))
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__232; Base_dPair.f_Base_dPair_dPair_second = dtb__230 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__228)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__227)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__236, dtb__237) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__238; Base_dPair.f_Base_dPair_dPair_second = dtb__239 } -> (match dtb__238 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__237) mc1)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__240, dtb__241) -> (match dtb__240 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__242, dtb__243, dtb__244) -> (if (dtb__242 = mc1) then (Base_dList.v_Base_dList_dlength dtb__243) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__237) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__237) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__236)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (remaining - 1)) n) (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

# 440 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos i n acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (n - i)) n) acc))

# 437 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) Base_dList.C_Base_dList_dList_Nil))

# 456 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__245, dtb__246) -> (if (dtb__245 = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__245, dtb__246)) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__245, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__246))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList__x58__x58_ (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__247, dtb__248) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__249; Base_dPair.f_Base_dPair_dPair_second = dtb__250 } -> (match dtb__249 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__248)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__251, dtb__252) -> (match dtb__251 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__253, dtb__254, dtb__255) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__253) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__248))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__248)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__247)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__256, dtb__257) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__258; Base_dPair.f_Base_dPair_dPair_second = dtb__259 } -> (match dtb__258 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__257)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (match dtb__260 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__262, dtb__263, dtb__264) -> (if (dtb__262 = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend dtb__263) dtb__261); Base_dPair.f_Base_dPair_dPair_second = dtb__259 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__257))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__257))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__265, dtb__266) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) dtb__261); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__265) mc2) dtb__259) }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__257)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__267) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) dtb__261); Base_dPair.f_Base_dPair_dPair_second = dtb__259 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__257)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__257)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__256)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__268, dtb__269) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__270; Base_dPair.f_Base_dPair_dPair_second = dtb__271 } -> (match dtb__270 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__269)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__272, dtb__273) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__272) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__268, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__269))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__269))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__268)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__274, dtb__275) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__276; Base_dPair.f_Base_dPair_dPair_second = dtb__277 } -> (match dtb__276 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__274, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__275)))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__278, dtb__279) -> (match dtb__278 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__280, dtb__281) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__279; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__280) mc0) dtb__277) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__275)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__282) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__279; Base_dPair.f_Base_dPair_dPair_second = dtb__277 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__275)))
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__274, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__275)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__274)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 94 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__283, dtb__284) -> (match dtb__283 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__285; Base_dPair.f_Base_dPair_dPair_second = dtb__286 } -> (match dtb__285 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__287, dtb__288) -> (match dtb__287 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__289, dtb__290) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__291) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__284) pos) restParams) fb) (fuel - 1))) (fun restExpr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__287) pos) clauses)) restParams) fb) (fuel - 1))) (fun bodyExpr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__287), Base_dList.C_Base_dList_dList_Nil)))), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__287))), bodyExpr, restExpr, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__287)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
)) clauses)))
# 148 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun table clauses0 params fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExprPruned table) (v_Vuna_dCompiler_dElab_dMatch_dpruneRows clauses0)) params) fb) fuel)))
# 153 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExprPruned = (fun table clauses params fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallWildPats (v_Vuna_dCompiler_dElab_dMatch_dfirstPats clauses)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__292, dtb__293) -> (if (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dasColumn table) clauses) dtb__292) dtb__293) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn dtb__292) clauses)) dtb__293) fb) (fuel - 1)) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__292) dtb__293) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__292) dtb__293) fb) fuel) else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__292) dtb__293) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 178 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dasColumn = (fun table clauses pos restParams fb fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dMatch_dasInnerClause pos)) clauses)) (Base_dList.C_Base_dList_dList__x58__x58_ (pos, restParams))) fb) (fuel - 1))) (fun e -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (e))))))
# 209 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table clauses pos restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), alts, caseSp)))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun fbAlts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), ((Base_dList.v_Base_dList_dappend alts) fbAlts), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))
# 406 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table clauses pos restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 411 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__294, dtb__295) -> (if (mc6 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun bodyExpr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__295) mc3) mc4) mc5) (mc6 - 1))) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__294, branchPats, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dPair.f_Base_dPair_dPair_second = bodyExpr }, tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__294) branchPats) mc3) mc1))) ((Base_dList.v_Base_dList_dmap (fun n -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (n, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })))) freshSubs))) ((Base_dList.v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__294)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc6 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 486 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table pos clauses restParams fbSp fuel -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | dtb__296 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__296) restParams) fbSp) (fuel - 1))) (fun bodyExpr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ({ Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dPair.f_Base_dPair_dPair_second = bodyExpr }, Base_dList.C_Base_dList_dList_Nil))))))
)))

# 43 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table clauses -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FunctionNoClauses) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__297) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany dtb__297) clauses) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns) else ((fun names -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200)) (fun body -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__297)))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table clauses name -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__298) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany dtb__298) clauses) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns) else (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (Base_dList.C_Base_dList_dList__x58__x58_ (name, Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200))
  | _ -> failwith "DT: impossible branch"
))
