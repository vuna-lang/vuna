open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTermination_dFailCandidate = { f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcRank : int; f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcPos : int; f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcEdges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList }

# 14 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dpatNames = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__0) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__1, dtb__2, dtb__3) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (q : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (Base_dData_dPair.v_Base_dData_dPair_dsecondOf q)))) dtb__2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__4, dtb__5, dtb__6) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) dtb__5)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__7, dtb__8, dtb__9) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, (v_Vuna_dCompiler_dElab_dTermination_dpatNames dtb__8)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__10, dtb__11) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 22 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dpatsNames = (fun ps -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) ps))

# 25 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDoStmt) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__12, dtb__13) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__12) }
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__14, dtb__15, dtb__16) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTermination_dpatNames dtb__14); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__15) }
  | _ -> failwith "DT: impossible branch"
))
# 29 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__18) -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt mc0) dtb__17) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__19; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__20 } -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts ((Base_dData_dList.v_Base_dData_dList_dappend dtb__19) mc0)) dtb__18) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__21; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__22 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__21; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__20) dtb__22) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))
# 35 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dexprRefsB = (fun bound e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__23, dtb__24) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__23) bound) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__25, dtb__26) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__27, dtb__28) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__29, dtb__30, dtb__31) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__29)) bound)) dtb__30)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__32, dtb__33, dtb__34) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__32)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound)) dtb__33))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__38)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__35, bound))) dtb__39))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__41, dtb__42, dtb__43, dtb__44) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (bd : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf bd)))) dtb__41)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (bd : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf bd)))) dtb__41)) bound)) dtb__42))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__45, dtb__46, dtb__47) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__45)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (alt : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf alt))) bound)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf alt)))) dtb__46))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__48, dtb__49, dtb__50, dtb__51) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__48)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__49)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__50)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__52, dtb__53, dtb__54) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__52)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__55, dtb__56, dtb__57) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (q : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf q)))) dtb__56)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__58, dtb__59, dtb__60) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__58)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (q : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf q)))) dtb__59))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__61, dtb__62) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts bound) dtb__61))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__63, dtb__64, dtb__65) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__63)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__64))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__66, dtb__67) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf c))) bound)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf c)))) dtb__66)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 61 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_drefsOfDef = (fun clauses -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf c))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf c)))) clauses)))

# 64 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dmapEdges = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : (string, (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__68); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (r : string) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) r) mc0))) (v_Vuna_dCompiler_dElab_dTermination_drefsOfDef (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__68))) }, ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges mc0) dtb__69)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcallGraph = (fun defs -> ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) defs))

# 73 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dadjOf = (fun n g -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) n) g) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__70) -> dtb__70
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dadjTblOf = (fun g -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) g) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 86 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_daddSrcs = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, dtb__72) -> ((fun cur -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs mc0) dtb__72) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__71) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, cur))) mc2))) (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__71) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__73) -> dtb__73
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__76; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__77 } -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs dtb__76) dtb__77) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dreplacePair = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__81 } -> (if (dtb__80 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, dtb__79)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__81 }, (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair mc0) mc1) dtb__79))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_daddEdge = (fun n m acc -> (match ((Base_dData_dList.v_Base_dData_dList_dlookupPair n) acc) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__82) -> (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair n) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (m, dtb__82))) acc)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (m, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }, acc))
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_daddEdges = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (((v_Vuna_dCompiler_dElab_dTermination_daddEdges mc0) dtb__84) (((v_Vuna_dCompiler_dElab_dTermination_daddEdge dtb__83) mc0) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dtransposeGo = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (match dtb__85 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__87; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__88 } -> ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo dtb__86) (((v_Vuna_dCompiler_dElab_dTermination_daddEdges dtb__87) dtb__88) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__91; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__92 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__91; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__92) }, (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed dtb__90)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dtranspose = (fun g -> (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo g) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 122 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dedgeCount = (fun (mc0 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__93, dtb__94) -> (match dtb__93 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__95; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__96 } -> ((Base_dData_dList.v_Base_dData_dList_dlength dtb__96) + (v_Vuna_dCompiler_dElab_dTermination_dedgeCount dtb__94))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dgraphFuel = (fun g nodes -> (((4 * (Base_dData_dList.v_Base_dData_dList_dlength nodes)) + (4 * (v_Vuna_dCompiler_dElab_dTermination_dedgeCount g))) + 16))

# 130 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddfsPost = (fun steps fuel g visited post -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = post } else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> (if dtb__100 then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__98) (fuel - 1)) g) visited) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__99, post))) else (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__99) visited) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__98) (fuel - 1)) g) visited) post) else (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (m : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = m; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__99) g))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }, dtb__98)))) (fuel - 1)) g) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__99) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = visited; Base_dData_dPair.f_Base_dData_dPair_dPair_second = post }
  | _ -> failwith "DT: impossible branch"
)) steps)))

# 140 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddfsAll = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__101, dtb__102) -> (if (mc1 <= 0) then mc4 else (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__101) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__102) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) mc1) mc2) mc3) mc4) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 } -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__102) (mc1 - 1)) mc2) dtb__103) dtb__104)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dpostOrder = (fun gT g nodes -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll nodes) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes)) gT) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 150 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcollectComp = (fun stack fuel rg assigned comp -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = assigned; Base_dData_dPair.f_Base_dData_dPair_dPair_second = comp } else (match stack with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = assigned; Base_dData_dPair.f_Base_dData_dPair_dPair_second = comp }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__105) assigned) then (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp dtb__106) (fuel - 1)) rg) assigned) comp) else (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__105) rg)) dtb__106)) (fuel - 1)) rg) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__105) true) assigned)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, comp))))
  | _ -> failwith "DT: impossible branch"
)))

# 159 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dsccOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (if (mc1 <= 0) then mc4 else (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__107) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__108) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, Base_dData_dList.C_Base_dData_dList_dList_Nil))) (mc1 - 1)) mc2) mc3) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__109; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__110 } -> (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__108) (mc1 - 1)) mc2) dtb__109) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, mc4)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds = (fun (mc0 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__113; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__114 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__114))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__114 }, (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__112)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dhintEdge = (fun caller callee p args ctors sizes sp acc -> (match ((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRelHint p) args) sizes) ctors) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> acc
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115) -> (((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) callee) dtb__115) sp) acc)
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dstrWalk = (fun fuel comp ctors projs p sizes caller facts region e acc -> (if (fuel <= 0) then acc else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__116, dtb__117, dtb__118) -> (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__116) dtb__117) dtb__118) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__119, dtb__120, dtb__121) -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__119) dtb__120) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__119) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__122, dtb__123, dtb__124, dtb__125) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__122) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__126) -> ((fun acc1 -> ((fun acc2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, region))) dtb__124) acc2)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__123) acc1))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__122) acc))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__124) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__123) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__122) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__127, dtb__128, dtb__129) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__128) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__130, dtb__131, dtb__132, dtb__133) -> ((fun sizes2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__131) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__130) acc))) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds dtb__130) sizes))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__138) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__137) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__140, dtb__141, dtb__142) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__140) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__143, dtb__144, dtb__145) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__144) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__146, dtb__147, dtb__148) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__147) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__146) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__149, dtb__150) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__149) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__151, dtb__152, dtb__153) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__152) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__151) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__154, dtb__155) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__154)) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__156, dtb__157) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__156) comp) then (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc) else acc)
  | _ -> acc
)))
# 222 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp = (fun fuel comp ctors projs p sizes caller facts region fn args sp acc -> (if (fuel <= 0) then acc else (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__158) -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) args) sizes) ctors) projs) caller) facts) region) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) ((((((((v_Vuna_dCompiler_dElab_dTermination_dhintEdge caller) dtb__158) p) args) ctors) sizes) sp) acc)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__159) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) dtb__158) dtb__159) sp) acc))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__160, dtb__161) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__160) then ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
)))
# 239 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap = (fun fuel comp ctors projs p sizes caller facts region fn args acc -> (if (fuel <= 0) then acc else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__164, dtb__165, dtb__166) -> (match dtb__164 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, dtb__168) -> (match dtb__167 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__169; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__170 } -> (match dtb__168 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__163 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun acc1 -> ((fun sizes2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__165) acc1)) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__171) dtb__169))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__171) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (match dtb__163 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__175, dtb__176) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__175) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__175) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__173) dtb__176) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__177, dtb__178, dtb__179) -> (match dtb__177 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__180, dtb__181) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__180) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__180) dtb__178) dtb__173) dtb__179) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__162)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb__163 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__182, dtb__183) -> (match dtb__183 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__184, dtb__185) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__184) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__184) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__182) dtb__185) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__186, dtb__187, dtb__188) -> (match dtb__186 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__189, dtb__190) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__189) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__189) dtb__187) dtb__182) dtb__188) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__162)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (match dtb__163 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (match dtb__192 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__193, dtb__194) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__193) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__193) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__191) dtb__194) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__195, dtb__196, dtb__197) -> (match dtb__195 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__198, dtb__199) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__198) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__198) dtb__196) dtb__191) dtb__197) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__162)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) args)))
# 261 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline = (fun fuel comp ctors projs p sizes caller facts region g pargs lst cbsp acc -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__200) -> (((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) g) dtb__200) cbsp) acc2)
  | _ -> failwith "DT: impossible branch"
)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1))) ((Base_dData_dList.v_Base_dData_dList_dappend pargs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("$elem", cbsp)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc))))
# 273 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp = (fun fuel comp ctors projs p sizes caller facts region fn args acc -> (if (fuel <= 0) then acc else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc))))
# 279 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : string) (mc7 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc8 : string Base_dData_dList.t_Base_dData_dList_dList) (mc9 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc10 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, dtb__202) -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__202) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__201) mc10)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 287 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : string) (mc7 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc8 : string Base_dData_dList.t_Base_dData_dList_dList) (mc9 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) (mc10 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc11 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (match dtb__203 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__205; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__206 } -> (if (mc0 <= 0) then mc11 else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__204) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc5) mc9) dtb__205)) mc6) mc7) mc8) dtb__206) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
))
# 295 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : string) (mc7 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc8 : string Base_dData_dList.t_Base_dData_dList_dList) (mc9 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc10 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__207, dtb__208) -> (match dtb__207 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__209; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__210 } -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc5) dtb__210) dtb__209)) mc6) mc7) mc8) dtb__208) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__210) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : string) (mc7 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc8 : string Base_dData_dList.t_Base_dData_dList_dList) (mc9 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc10 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__211, dtb__212) -> (match dtb__211 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__213; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__214 } -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__212) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__214) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 312 "Vuna/Compiler/Elab/Termination.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : string) (mc7 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc8 : string Base_dData_dList.t_Base_dData_dList_dList) (mc9 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) (mc10 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (if (mc0 <= 0) then mc10 else (match dtb__215 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__217, dtb__218, dtb__219) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc5) dtb__218) dtb__217)) mc6) mc7) mc8) dtb__216) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__218) mc10))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__220, dtb__221) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__216) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__220) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dstrClause = (fun comp ctors projs p caller facts clause -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk 100000) comp) ctors) projs) p) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dData_dPair.v_Base_dData_dPair_dfirstOf clause))) caller) facts) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf clause)) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))

# 331 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dgroupMessage = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match dtb__223 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__222 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

# 348 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields = (fun (mc0 : int) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__226; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__227 } -> (match dtb__226 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__228; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__229 } -> (match dtb__228 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__230; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__231 } -> (((v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields mc0) dtb__225) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldCall ({ Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callCallee = dtb__231; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callArg = ("argument " ^ (bi_strFromInt mc0)); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callRelation = (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelText dtb__229); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCallInfo_callSpan = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__227)) }))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges = (fun comp p edges -> ((fun desc -> ((fun base -> (((v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields p) edges) ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__232, dtb__233) -> (match dtb__232 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__234; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__235 } -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__235) base)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithAbsent Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dNoSourceReason_NsSynthetic) base)
  | _ -> failwith "DT: impossible branch"
)) edges))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotProveTermination (desc))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (desc, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))) (v_Vuna_dCompiler_dElab_dTermination_dgroupMessage comp)))

# 354 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcollectClauses = (fun (mc0 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : string) (mc6 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc7 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__236, dtb__237) -> (if (Base_dData_dPair.v_Base_dData_dPair_dfirstOf mc7) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__238; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__239 } -> (if dtb__238 then ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses dtb__237) mc1) mc2) mc3) mc4) mc5) mc6) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf mc7)) dtb__239) }) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dPair.v_Base_dData_dPair_dsecondOf mc7)) dtb__239) })))
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dTermination_dstrClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__236)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc7)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : string Base_dData_dList.t_Base_dData_dList_dList) (mc7 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__240, dtb__241) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__240) mc1)) mc0) mc2) mc3) mc4) dtb__240) mc5) mc7)) (fun (acc2 : (bool, (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__241) acc2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_demptyFail = (fun p -> { f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcRank = 0; f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcPos = p; f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcEdges = Base_dData_dList.C_Base_dData_dList_dList_Nil })

# 380 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dhintRankOf = (fun m -> (if (m = Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelMissingGuard) then 4 else (if (m = Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelAscending) then 4 else (if (m = Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelUnknownSize) then 3 else (if (m = Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOtherPosition) then 2 else (if (m = Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelNoRelation) then 1 else 0))))))

# 387 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dedgeRankOf = (fun (mc0 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__242; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__243 } -> (match dtb__242 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__244; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__245 } -> (match dtb__244 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__246; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__247 } -> (v_Vuna_dCompiler_dElab_dTermination_dhintRankOf dtb__245)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dedgesRankOf = (fun (mc0 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, dtb__249) -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt (v_Vuna_dCompiler_dElab_dTermination_dedgeRankOf dtb__248)) (v_Vuna_dCompiler_dElab_dTermination_dedgesRankOf dtb__249))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dbetterFail = (fun p edges best -> ((fun rank -> (if (rank > (best).f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcRank) then { f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcRank = rank; f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcPos = p; f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcEdges = edges } else best)) (v_Vuna_dCompiler_dElab_dTermination_dedgesRankOf edges)))

# 445 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork = (fun names defTbl rgT fuel facts work -> (if (fuel <= 0) then facts else ((fun namesTbl -> ((fun scan -> ((fun fresh -> ((fun newFacts -> ((fun merged -> ((fun nextWork -> (match nextWork with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> merged
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork names) defTbl) rgT) (fuel - 1)) merged) nextWork)
)) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (n : string) -> ((v_Vuna_dCompiler_dElab_dTermination_dadjOf n) rgT))) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) newFacts))))) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl facts) fresh))) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl fresh) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)))) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl (Base_dData_dPair.v_Base_dData_dPair_dfirstOf scan)) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf scan))))) (((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames namesTbl) defTbl) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)) work) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames names))))

# 464 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_ddfunNames = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (match dtb__250 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__252, dtb__253, dtb__254, dtb__255) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__252, (v_Vuna_dCompiler_dElab_dTermination_ddfunNames dtb__251)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_ddfunNames dtb__251)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 491 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__256, dtb__257) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__256) mc0) then true else ((v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl mc0) dtb__257))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcallMode = (fun (mc0 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__258; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__259 } -> (match dtb__258 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__260; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__261 } -> (match dtb__260 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__262; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__263 } -> dtb__261
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo = (fun comp defTbl ctors projs facts remaining maxP lastP lastEdges best -> (if (remaining <= 0) then (if ((best).f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcRank > 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges comp) (best).f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcPos) (best).f_Vuna_dCompiler_dElab_dTermination_dFailCandidate_fcEdges))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges comp) lastP) lastEdges)))) else ((fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__264) -> (match dtb__264 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__265; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__266 } -> (if dtb__265 then ((fun modes -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty modes) then (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame modes) then (if ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) dtb__266) then ((((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__266) best) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__266) best)) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__266) best))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dcallMode) dtb__266))) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__266) (((v_Vuna_dCompiler_dElab_dTermination_dbetterFail p) dtb__266) best)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__267) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__267))
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure comp) defTbl) ctors) projs) p) facts) comp) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))) (maxP - remaining))))

# 401 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dtryMeasure = (fun comp defTbl ctors projs facts p maxP -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defTbl) ctors) projs) facts) (maxP - p)) maxP) p) Base_dData_dList.C_Base_dData_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTermination_demptyFail p)))

# 427 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup = (fun comp defTbl ctors projs facts -> ((fun factsTbl -> (match (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasure comp) defTbl) ctors) projs) factsTbl) 0) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf comp) defTbl)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__268) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__268))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__269) -> (match ((((((Vuna_dCompiler_dElab_dTermination_dScc.v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread comp) defTbl) ctors) projs) factsTbl) dtb__269) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__270) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__270))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__271) -> ((((((Vuna_dCompiler_dElab_dTermination_dScc.v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck comp) defTbl) ctors) projs) factsTbl) dtb__271)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf facts)))

# 437 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckComp = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__272, dtb__273) -> (match dtb__273 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__272) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__272) mc4)) then (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5)
))

# 495 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, dtb__275) -> (if ((v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl mc0) dtb__274) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckComp dtb__274) mc2) mc3) mc4) mc5) mc6)) (fun (n : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith mc0) dtb__275) mc2) mc3) mc4) mc5) mc6)) (fun (m : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((n + m))))))) else (((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith mc0) dtb__275) mc2) mc3) mc4) mc5) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith = (fun own decls -> ((fun defs -> ((fun defTbl -> ((fun ctors -> ((fun projs -> ((fun g -> ((fun gT -> ((fun nodes -> ((fun rgT -> ((fun callerNames -> ((fun facts -> ((fun ownTbl -> ((fun _u -> ((fun fuel -> ((fun post -> ((fun comps -> (((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith ownTbl) (Base_dData_dList.v_Base_dData_dList_dreverse comps)) defTbl) ctors) projs) gT) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf post) fuel) rgT) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil))) (((v_Vuna_dCompiler_dElab_dTermination_dpostOrder gT) g) nodes))) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes))) (if (dtp_debug_on 0) then (dtp_debug_line "term-facts") else 0))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames own))) ((((((v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork nodes) defTbl) rgT) 1024) Base_dData_dList.C_Base_dData_dList_dList_Nil) callerNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty ((v_Vuna_dCompiler_dElab_dTermination_dadjOf n) gT)))) nodes))) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf g))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) (v_Vuna_dCompiler_dElab_dTermination_dadjTblOf g))) (v_Vuna_dCompiler_dElab_dTermination_dcallGraph defs))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf defs))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf decls))) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) defs))) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs decls)))

# 461 "Vuna/Compiler/Elab/Termination.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls = (fun decls -> ((v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dTermination_ddfunNames decls)) decls))
