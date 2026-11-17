open Vuna_runtime
# 14 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dpatNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__0) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__1, dtb__2, dtb__3) -> ((Base_dList.v_Base_dList_dconcatMap (fun q -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (Base_dPair.v_Base_dPair_dsecondOf q)))) dtb__2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__4, dtb__5, dtb__6) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) dtb__5)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__7, dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__7, (v_Vuna_dCompiler_dElab_dTermination_dpatNames dtb__8)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__10, dtb__11) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__10, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 22 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dpatsNames = (fun ps -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) ps))

# 25 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__12, dtb__13) -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__12) }
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__14, dtb__15, dtb__16) -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dpatNames dtb__14); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__15) }
  | _ -> failwith "DT: impossible branch"
))
# 29 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__17, dtb__18) -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt mc0) dtb__17) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__19; Base_dPair.f_Base_dPair_dPair_second = dtb__20 } -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts ((Base_dList.v_Base_dList_dappend dtb__19) mc0)) dtb__18) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = dtb__22 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__20) dtb__22) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))
# 35 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dexprRefsB = (fun bound e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__23, dtb__24) -> (if ((Base_dList.v_Base_dList_dmemName dtb__23) bound) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__23, Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__25, dtb__26) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__27, dtb__28) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__29, dtb__30, dtb__31) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__29)) bound)) dtb__30)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__32, dtb__33, dtb__34) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__32)) ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound)) dtb__33))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__38)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__35, bound))) dtb__39))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__41, dtb__42, dtb__43, dtb__44) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun bd -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (Base_dPair.v_Base_dPair_dsecondOf bd)))) dtb__41)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun bd -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (Base_dPair.v_Base_dPair_dfirstOf bd)))) dtb__41)) bound)) dtb__42))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__45, dtb__46, dtb__47) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__45)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatNames (Base_dPair.v_Base_dPair_dfirstOf alt))) bound)) (Base_dPair.v_Base_dPair_dsecondOf alt)))) dtb__46))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__48, dtb__49, dtb__50, dtb__51) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__48)) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__49)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__50)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__52, dtb__53, dtb__54) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__52)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__55, dtb__56, dtb__57) -> ((Base_dList.v_Base_dList_dconcatMap (fun q -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (Base_dPair.v_Base_dPair_dsecondOf q)))) dtb__56)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__58, dtb__59, dtb__60) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__58)) ((Base_dList.v_Base_dList_dconcatMap (fun q -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (Base_dPair.v_Base_dPair_dsecondOf q)))) dtb__59))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__61, dtb__62) -> (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts bound) dtb__61))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__63, dtb__64, dtb__65) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__63)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__64))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__66, dtb__67) -> ((Base_dList.v_Base_dList_dconcatMap (fun c -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (Base_dPair.v_Base_dPair_dfirstOf c))) bound)) (Base_dPair.v_Base_dPair_dsecondOf c)))) dtb__66)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 61 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_drefsOfDef = (fun clauses -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((Base_dList.v_Base_dList_dconcatMap (fun c -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (Base_dPair.v_Base_dPair_dfirstOf c))) (Base_dPair.v_Base_dPair_dsecondOf c)))) clauses)))

# 64 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dmapEdges = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__68); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dfilter (fun r -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) r) mc0))) (v_Vuna_dCompiler_dElab_dTermination_drefsOfDef (Base_dPair.v_Base_dPair_dsecondOf dtb__68))) }, ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges mc0) dtb__69)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcallGraph = (fun defs -> ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges (Base_dHashMap.v_Base_dHashMap_dofNames (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) defs))

# 73 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dadjOf = (fun n g -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) n) g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> dtb__70
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dadjTblOf = (fun g -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) g) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 86 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_daddSrcs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> ((fun cur -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs mc0) dtb__72) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__71) (Base_dList.C_Base_dList_dList__x58__x58_ (mc0, cur))) mc2))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__71) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> dtb__73
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = dtb__77 } -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs dtb__76) dtb__77) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dreplacePair = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__81 } -> (if (dtb__80 = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__79)) else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__81 }, (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair mc0) mc1) dtb__79))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_daddEdge = (fun n m acc -> (match ((Base_dList.v_Base_dList_dlookupPair n) acc) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair n) (Base_dList.C_Base_dList_dList__x58__x58_ (m, dtb__82))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (m, Base_dList.C_Base_dList_dList_Nil)) }, acc))
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_daddEdges = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (((v_Vuna_dCompiler_dElab_dTermination_daddEdges mc0) dtb__84) (((v_Vuna_dCompiler_dElab_dTermination_daddEdge dtb__83) mc0) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dtransposeGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (match dtb__85 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__87; Base_dPair.f_Base_dPair_dPair_second = dtb__88 } -> ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo dtb__86) (((v_Vuna_dCompiler_dElab_dTermination_daddEdges dtb__87) dtb__88) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__91; Base_dPair.f_Base_dPair_dPair_second = dtb__92 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__91; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__92) }, (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed dtb__90)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dtranspose = (fun g -> (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo g) Base_dList.C_Base_dList_dList_Nil)))

# 122 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dedgeCount = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__93, dtb__94) -> (match dtb__93 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__96 } -> ((Base_dList.v_Base_dList_dlength dtb__96) + (v_Vuna_dCompiler_dElab_dTermination_dedgeCount dtb__94))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dgraphFuel = (fun g nodes -> (((4 * (Base_dList.v_Base_dList_dlength nodes)) + (4 * (v_Vuna_dCompiler_dElab_dTermination_dedgeCount g))) + 16))

# 130 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddfsPost = (fun steps fuel g visited post -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = post } else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__100 } -> (if dtb__100 then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__98) (fuel - 1)) g) visited) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__99, post))) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__99) visited) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__98) (fuel - 1)) g) visited) post) else (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = false })) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__99) g))) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = true }, dtb__98)))) (fuel - 1)) g) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__99) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = post }
  | _ -> failwith "DT: impossible branch"
)) steps)))

# 140 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddfsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__101, dtb__102) -> (if (mc1 <= 0) then mc4 else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__101) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__102) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = false }, Base_dList.C_Base_dList_dList_Nil))) mc1) mc2) mc3) mc4) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__103; Base_dPair.f_Base_dPair_dPair_second = dtb__104 } -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__102) (mc1 - 1)) mc2) dtb__103) dtb__104)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dpostOrder = (fun gT g nodes -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll nodes) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes)) gT) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

# 150 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcollectComp = (fun stack fuel rg assigned comp -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = assigned; Base_dPair.f_Base_dPair_dPair_second = comp } else (match stack with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = assigned; Base_dPair.f_Base_dPair_dPair_second = comp }
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__105) assigned) then (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp dtb__106) (fuel - 1)) rg) assigned) comp) else (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__105) rg)) dtb__106)) (fuel - 1)) rg) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__105) true) assigned)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__105, comp))))
  | _ -> failwith "DT: impossible branch"
)))

# 159 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dsccOf = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (if (mc1 <= 0) then mc4 else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__107) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__108) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__107, Base_dList.C_Base_dList_dList_Nil))) (mc1 - 1)) mc2) mc3) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__109; Base_dPair.f_Base_dPair_dPair_second = dtb__110 } -> (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__108) (mc1 - 1)) mc2) dtb__109) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__110, mc4)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__113; Base_dPair.f_Base_dPair_dPair_second = dtb__114 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__114))); Base_dPair.f_Base_dPair_dPair_second = dtb__114 }, (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__112)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dstrWalk = (fun fuel comp ctors projs p sizes caller facts region e acc -> (if (fuel <= 0) then acc else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__115, dtb__116, dtb__117) -> (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__115) dtb__116) dtb__117) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__118, dtb__119, dtb__120) -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__118) dtb__119) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__118) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__121, dtb__122, dtb__123, dtb__124) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__121) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__125) -> ((fun acc1 -> ((fun acc2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__125, region))) dtb__123) acc2)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__122) acc1))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__121) acc))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__123) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__122) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__121) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__126, dtb__127, dtb__128) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__127) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__129, dtb__130, dtb__131, dtb__132) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__130) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__129) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__137) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__136) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__139, dtb__140, dtb__141) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__139) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__142, dtb__143, dtb__144) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__143) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__145, dtb__146, dtb__147) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__146) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__145) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__148, dtb__149) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__148) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__150, dtb__151, dtb__152) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__151) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__150) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__153, dtb__154) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__153)) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__155, dtb__156) -> (if ((Base_dList.v_Base_dList_dmemName dtb__155) comp) then (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc) else acc)
  | _ -> acc
)))
# 214 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp = (fun fuel comp ctors projs p sizes caller facts region fn args sp acc -> (if (fuel <= 0) then acc else (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__157) -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) args) sizes) ctors) projs) caller) facts) region) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__158) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) dtb__157) dtb__158) sp) acc))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__159, dtb__160) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__159) then ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
)))
# 229 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap = (fun fuel comp ctors projs p sizes caller facts region fn args acc -> (if (fuel <= 0) then acc else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__163, dtb__164, dtb__165) -> (match dtb__163 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (match dtb__166 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__168; Base_dPair.f_Base_dPair_dPair_second = dtb__169 } -> (match dtb__167 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__162 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__170, dtb__171) -> (match dtb__171 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun acc1 -> ((fun sizes2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__164) acc1)) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__170) dtb__168))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__170) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (match dtb__162 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__172, dtb__173) -> (match dtb__173 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__174, dtb__175) -> (if ((Base_dList.v_Base_dList_dmemName dtb__174) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__174) Base_dList.C_Base_dList_dList_Nil) dtb__172) dtb__175) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__176, dtb__177, dtb__178) -> (match dtb__176 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__179, dtb__180) -> (if ((Base_dList.v_Base_dList_dmemName dtb__179) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__179) dtb__177) dtb__172) dtb__178) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__161)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb__162 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__181, dtb__182) -> (match dtb__182 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__183, dtb__184) -> (if ((Base_dList.v_Base_dList_dmemName dtb__183) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__183) Base_dList.C_Base_dList_dList_Nil) dtb__181) dtb__184) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__185, dtb__186, dtb__187) -> (match dtb__185 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__188, dtb__189) -> (if ((Base_dList.v_Base_dList_dmemName dtb__188) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__188) dtb__186) dtb__181) dtb__187) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__161)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (match dtb__162 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (match dtb__191 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__192, dtb__193) -> (if ((Base_dList.v_Base_dList_dmemName dtb__192) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__192) Base_dList.C_Base_dList_dList_Nil) dtb__190) dtb__193) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__194, dtb__195, dtb__196) -> (match dtb__194 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__197, dtb__198) -> (if ((Base_dList.v_Base_dList_dmemName dtb__197) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__197) dtb__195) dtb__190) dtb__196) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__161)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) args)))
# 249 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline = (fun fuel comp ctors projs p sizes caller facts region g pargs lst cbsp acc -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__199) -> (((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) g) dtb__199) cbsp) acc2)
  | _ -> failwith "DT: impossible branch"
)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1))) ((Base_dList.v_Base_dList_dappend pargs) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("$elem", cbsp)), Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc))))
# 261 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp = (fun fuel comp ctors projs p sizes caller facts region fn args acc -> (if (fuel <= 0) then acc else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc))))
# 267 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__200, dtb__201) -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__201) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__200) mc10)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 275 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 mc11 -> (match mc10 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__202, dtb__203) -> (match dtb__202 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__204; Base_dPair.f_Base_dPair_dPair_second = dtb__205 } -> (if (mc0 <= 0) then mc11 else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__203) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc5) mc9) dtb__204)) mc6) mc7) mc8) dtb__205) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
))
# 283 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (match dtb__206 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__209 } -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__207) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__209) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 291 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__210, dtb__211) -> (match dtb__210 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__212; Base_dPair.f_Base_dPair_dPair_second = dtb__213 } -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__211) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__213) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 299 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__214, dtb__215) -> (if (mc0 <= 0) then mc10 else (match dtb__214 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__216, dtb__217, dtb__218) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__215) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__217) mc10))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__219, dtb__220) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__215) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__219) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dstrClause = (fun comp ctors projs p caller facts clause -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk 100000) comp) ctors) projs) p) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dPair.v_Base_dPair_dfirstOf clause))) caller) facts) Base_dList.C_Base_dList_dList_Nil) (Base_dPair.v_Base_dPair_dsecondOf clause)) { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))

# 318 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dgroupMessage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__221, dtb__222) -> (match dtb__222 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__221 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

# 338 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__223, dtb__224) -> (match dtb__223 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__225; Base_dPair.f_Base_dPair_dPair_second = dtb__226 } -> (match dtb__225 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__227; Base_dPair.f_Base_dPair_dPair_second = dtb__228 } -> (match dtb__227 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__229; Base_dPair.f_Base_dPair_dPair_second = dtb__230 } -> ((v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields dtb__224) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldCall ({ Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callCallee = dtb__230; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callArg = ("call at argument position " ^ (bi_strFromInt dtb__228)); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callRelation = "no structural decrease"; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__226)) }))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges = (fun comp edges -> ((fun desc -> ((fun base -> ((v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields edges) ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__231, dtb__232) -> (match dtb__231 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__233; Base_dPair.f_Base_dPair_dPair_second = dtb__234 } -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__234) base)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithAbsent Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dNoSourceReason_NsSynthetic) base)
  | _ -> failwith "DT: impossible branch"
)) edges))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotProveTermination (desc))) (Base_dVec.C_Base_dVec_dVec_VCons (desc, Base_dVec.C_Base_dVec_dVec_Nil))))) (v_Vuna_dCompiler_dElab_dTermination_dgroupMessage comp)))

# 323 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsg = (fun comp -> ((v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges comp) Base_dList.C_Base_dList_dList_Nil))

# 344 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcollectClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__235, dtb__236) -> (if (Base_dPair.v_Base_dPair_dfirstOf mc7) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__237; Base_dPair.f_Base_dPair_dPair_second = dtb__238 } -> (if dtb__237 then ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses dtb__236) mc1) mc2) mc3) mc4) mc5) mc6) { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf mc7)) dtb__238) }) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf mc7) })))
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dTermination_dstrClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__235)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc7)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__239, dtb__240) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__239) mc1)) mc0) mc2) mc3) mc4) dtb__239) mc5) mc7)) (fun acc2 -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__240) acc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork = (fun names defTbl rgT fuel facts work -> (if (fuel <= 0) then facts else ((fun namesTbl -> ((fun scan -> ((fun fresh -> ((fun newFacts -> ((fun merged -> ((fun nextWork -> (match nextWork with
  | Base_dList.C_Base_dList_dList_Nil -> merged
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork names) defTbl) rgT) (fuel - 1)) merged) nextWork)
)) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((Base_dList.v_Base_dList_dconcatMap (fun n -> ((v_Vuna_dCompiler_dElab_dTermination_dadjOf n) rgT))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) newFacts))))) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl fresh) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)))) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dPair.v_Base_dPair_dfirstOf scan)) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dPair.v_Base_dPair_dsecondOf scan))))) (((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames namesTbl) defTbl) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) work) { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))) (Base_dHashMap.v_Base_dHashMap_dofNames names))))

# 418 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddfunNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (match dtb__241 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__243, dtb__244, dtb__245, dtb__246) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__243, (v_Vuna_dCompiler_dElab_dTermination_ddfunNames dtb__242)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_ddfunNames dtb__242)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__247, dtb__248) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__247) mc0) then true else ((v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl mc0) dtb__248))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcallMode = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__249; Base_dPair.f_Base_dPair_dPair_second = dtb__250 } -> (match dtb__249 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__251; Base_dPair.f_Base_dPair_dPair_second = dtb__252 } -> (match dtb__251 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__253; Base_dPair.f_Base_dPair_dPair_second = dtb__254 } -> dtb__252
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo = (fun comp defTbl ctors projs facts remaining maxP lastEdges -> (if (remaining <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges comp) lastEdges))) else ((fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__255) -> (match dtb__255 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__256; Base_dPair.f_Base_dPair_dPair_second = dtb__257 } -> (if dtb__256 then ((fun modes -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty modes) then (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame modes) then (if ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) dtb__257) then ((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) dtb__257) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))) else ((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) dtb__257)) else ((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) dtb__257))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dcallMode) dtb__257))) else ((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) dtb__257))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__258) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__258))
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure comp) defTbl) ctors) projs) p) facts) comp) { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))) (maxP - remaining))))

# 361 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dtryMeasure = (fun comp defTbl ctors projs facts p maxP -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (maxP - p)) maxP) Base_dList.C_Base_dList_dList_Nil))

# 381 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup = (fun comp defTbl ctors projs facts -> ((fun factsTbl -> (match (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasure comp) defTbl) ctors) projs) factsTbl) 0) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf comp) defTbl)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__259) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__259))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__260) -> (match ((((((Vuna_dCompiler_dElab_dTermination_dScc.v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread comp) defTbl) ctors) projs) factsTbl) dtb__260) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__261) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__261))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__262) -> ((((((Vuna_dCompiler_dElab_dTermination_dScc.v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck comp) defTbl) ctors) projs) factsTbl) dtb__262)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)))

# 391 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckComp = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__263, dtb__264) -> (match dtb__264 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((Base_dList.v_Base_dList_dmemName dtb__263) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__263) mc4)) then (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5)
))

# 449 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__265, dtb__266) -> (if ((v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl mc0) dtb__265) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckComp dtb__265) mc2) mc3) mc4) mc5) mc6)) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith mc0) dtb__266) mc2) mc3) mc4) mc5) mc6)) (fun m -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((n + m))))))) else (((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith mc0) dtb__266) mc2) mc3) mc4) mc5) mc6))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith = (fun own decls -> ((fun defs -> ((fun defTbl -> ((fun ctors -> ((fun projs -> ((fun g -> ((fun gT -> ((fun nodes -> ((fun rgT -> ((fun callerNames -> ((fun facts -> ((fun ownTbl -> ((fun _u -> ((fun fuel -> ((fun post -> ((fun comps -> (((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith ownTbl) (Base_dList.v_Base_dList_dreverse comps)) defTbl) ctors) projs) gT) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf post) fuel) rgT) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))) (((v_Vuna_dCompiler_dElab_dTermination_dpostOrder gT) g) nodes))) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes))) (if (dtp_debug_on 0) then (dtp_debug_line "term-facts") else 0))) (Base_dHashMap.v_Base_dHashMap_dofNames own))) ((((((v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork nodes) defTbl) rgT) 1024) Base_dList.C_Base_dList_dList_Nil) callerNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty ((v_Vuna_dCompiler_dElab_dTermination_dadjOf n) gT)))) nodes))) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf g))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) (v_Vuna_dCompiler_dElab_dTermination_dadjTblOf g))) (v_Vuna_dCompiler_dElab_dTermination_dcallGraph defs))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf defs))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf decls))) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) defs))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs decls)))

# 415 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls = (fun decls -> ((v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dTermination_ddfunNames decls)) decls))
