open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = { f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion : string Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge : bool }

# 110 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__3))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 }, (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 23 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__5) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__4) mc9)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 31 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__8; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__9 } -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__7) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__9) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 39 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__11) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__12)) mc7) dtb__13) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 47 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match dtb__14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__17 } -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) dtb__17) dtb__16)) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 56 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if (mc0 <= 0) then mc9 else (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__20, dtb__21, dtb__22) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) dtb__21) dtb__20)) mc7) dtb__19) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__21) mc9))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__23, dtb__24) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__23) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 68 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun fuel comp ctors projs caller facts sizes region e acc -> (if (fuel <= 0) then acc else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__25, dtb__26, dtb__27) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__25) dtb__26) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__28, dtb__29, dtb__30) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) dtb__29) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__31, dtb__32, dtb__33, dtb__34) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__31) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__35) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__35, region))) dtb__33) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__31) acc))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__33) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__31) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__36, dtb__37, dtb__38) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__37) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__39, dtb__40, dtb__41, dtb__42) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds dtb__39) sizes)) region) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__39) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__47) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__46) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__49, dtb__50, dtb__51) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__49) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__52, dtb__53, dtb__54) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__55, dtb__56, dtb__57) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__56) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__55) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__58, dtb__59) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__60, dtb__61, dtb__62) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__61) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__60) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__63, dtb__64) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__63)) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__65, dtb__66) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__65) comp) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = dtb__65; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc)) else acc)
  | _ -> acc
)))
# 115 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun fuel comp ctors projs caller facts sizes region fn args acc -> (if (fuel <= 0) then acc else (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__67) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = dtb__67; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = args; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__68, dtb__69) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__68) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
# 131 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun fuel comp ctors projs caller facts sizes region fn args acc -> (if (fuel <= 0) then acc else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__72, dtb__73, dtb__74) -> (match dtb__72 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (match dtb__75 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 } -> (match dtb__76 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__71 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (match dtb__80 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__73) acc1)) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__79) dtb__77))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__79) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__71 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (match dtb__82 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut29 -> (match nd_uscrut29 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__83, dtb__84) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__83) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__83) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__81) dtb__84) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__85, dtb__86, dtb__87) -> (match dtb__85 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__88, dtb__89) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__88) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__88) dtb__86) dtb__81) dtb__87) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__70)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb__71 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (match dtb__91 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__92, dtb__93) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__92) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__92) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__90) dtb__93) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__94, dtb__95, dtb__96) -> (match dtb__94 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__97, dtb__98) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__97) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__97) dtb__95) dtb__90) dtb__96) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__70)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__71 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__99, dtb__100) -> (match dtb__100 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__101, dtb__102) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__101) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__101) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__99) dtb__102) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__103, dtb__104, dtb__105) -> (match dtb__103 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__106, dtb__107) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__106) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__106) dtb__104) dtb__99) dtb__105) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__70)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))
# 153 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun fuel comp ctors projs caller facts sizes region g pargs lst cbsp acc -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = g; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = fullArgs; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = elems; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((Base_dData_dList.v_Base_dData_dList_dappend pargs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("$elem", cbsp)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))

# 163 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__108, dtb__109) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__109) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC 100000) mc0) mc1) mc2) mc4) mc3) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__108))) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__108)) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__111) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__110) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__110) mc3)) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun comp ctors projs defTbl facts -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defTbl) facts) comp) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 178 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun m -> (m <> 0))

# 181 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__112, dtb__113) -> (match dtb__112 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__114; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__115 } -> (match dtb__115 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__116; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__117 } -> (match dtb__117 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__118; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__119 } -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__116) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__113))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom < (dtb__120).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121)))) else (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__120).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo <= (dtb__120).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__121)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__121)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__122, dtb__123) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__122) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__123))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun a b -> { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (b).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) })

# 200 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> (match dtb__125 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, dtb__127) -> (if ((dtb__124).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__126).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__124).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__126).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__124) dtb__126), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__127))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__125)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__125))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

# 212 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, dtb__129) -> false
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (if ((dtb__130).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__132).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__130).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__132).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (dtb__130).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) (dtb__132).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__131) dtb__133) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun a b -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b)))

# 225 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__134).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__134).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (dtb__134).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__135))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__135))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__136, dtb__137) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__136) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__137) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun g1 g2 -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2)))

# 240 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__138, dtb__139) -> (if (dtb__138).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__139))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun edges -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

# 249 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun edges -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

# 252 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__141) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__140) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__141) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

# 262 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (match dtb__142 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__144; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__145 } -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf mc0) = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__144)) then (if ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf mc0) = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__144)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__145)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__143)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__143))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__146, dtb__147) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__146) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__147))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__148) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__149) mc1) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (match dtb__150 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__152; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__153 } -> (match dtb__152 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__154; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__155 } -> (if (mc0 = dtb__154) then (if (mc1 = dtb__155) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__153) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }, dtb__151)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__154; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__155 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__153 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__151)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__154; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__155 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__153 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__151))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun f g edges table -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup { Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = g }) table) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__156) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__156) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true } else (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__156) >= v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__157, dtb__158) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__159; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__160 } -> (if dtb__160 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__158) dtb__159) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__159; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__157)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__163; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__164 } -> (match dtb__163 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__165; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__166 } -> (if (dtb__165 = mc1) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__167; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__168 } -> (if dtb__168 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__162) dtb__167) dtb__168) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__167; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__166) mc2) dtb__164) mc4)) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__162) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun f g a table acc -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))

# 311 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__169, dtb__170) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__171; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__172 } -> (if dtb__172 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__170) mc3) dtb__171) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__171; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__169) mc3) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__175; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__176 } -> (match dtb__175 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__177; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__178 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__179; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__180 } -> (if dtb__180 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__174) mc1) dtb__179) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__179; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__177) dtb__178) dtb__176) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun table -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

# 329 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__181, dtb__182) -> (match dtb__181 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__183; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__184 } -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__183) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__185) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__184) dtb__185) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__182) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun a b -> (if ((Base_dData_dList.v_Base_dData_dList_dlength a) = (Base_dData_dList.v_Base_dData_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false))

# 335 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun table fuel -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false } else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__186; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__187 } -> (if dtb__187 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__186) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__186; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true } else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__186) (fuel - 1))) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__186; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table))))

# 345 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun i j s ctors projs facts -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) j) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__188) -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__188) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes) ctors) projs) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) facts) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__189) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = i; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = j; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__189) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun i count s ctors projs facts -> (if (count <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) (count - 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (count - 1)) s) ctors) projs) facts))))

# 358 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun i s ctors projs facts -> (if (i <= 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (Base_dData_dList.v_Base_dData_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) s) ctors) projs) facts) else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (Base_dData_dList.v_Base_dData_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (i - 1)) s) ctors) projs) facts))))

# 364 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun ctors projs facts s -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes)) s) ctors) projs) facts))

# 370 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__191) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (dtb__190).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) (dtb__190).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__190)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun sites ctors projs facts -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 380 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel = 240

# 384 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__194; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__195 } -> (match dtb__194 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 } -> (if (dtb__196 = dtb__197) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__195) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__193) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__193))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__198) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__199) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__199))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__200, dtb__201) -> (match dtb__200 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__202; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__203 } -> (match dtb__202 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__204; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__205 } -> (if (dtb__204 = dtb__205) then ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__204) dtb__203)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__201)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__201))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->>"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

# 404 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

# 398 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun e -> (if (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

# 407 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (match dtb__207 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__206)
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__206); ","; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__207)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__208, dtb__209) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__208) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__209) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" [mc0; "{"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__208); "}"]), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__209))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__210, dtb__211) -> (match dtb__210 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__212; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__213 } -> (match dtb__212 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__214; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__215 } -> (if (dtb__214 = dtb__215) then ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__214) dtb__213)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__211)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__211))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun table -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

# 425 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun table0 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__216; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__217 } -> (if dtb__217 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__216) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__216); "]"])) msg)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel); " \232\189\174\239\188\137]"])) msg))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel))) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))

# 445 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__220, dtb__221) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__220))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf = (fun name defTbl -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__222)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__224) -> dtb__224
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__225, dtb__226, dtb__227, dtb__228) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__225) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__229) -> (dtb__229 = mc0)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 465 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun callerFuel site -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (site).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__231, dtb__232, dtb__233) -> (match dtb__231 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__234, dtb__235) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName dtb__234) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__236, dtb__237) -> (match dtb__236 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__238, dtb__239) -> (match dtb__237 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__240, dtb__241) -> (match dtb__240 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__242, dtb__243) -> (match dtb__241 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__238 = callerFuel) then (if (dtb__242 > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (true)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__232) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__244, dtb__245) -> (if (dtb__244 = callerFuel) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__230)
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf (dtb__246).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) dtb__246) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__247) false) mc4)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__248) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__247) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__246).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__246).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (if dtb__248 then 1 else 0) }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 } }, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun comp defTbl sites -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defTbl) sites) true) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 489 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dmemberGuarded = (fun f defTbl -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl f) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__249, dtb__250) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__249)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__251) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__251) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__249))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__252, dtb__253) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dmemberGuarded dtb__252) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf dtb__253) mc1) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__252, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf dtb__253) mc1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__254, dtb__255) -> (match dtb__254 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__256; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__257 } -> (match dtb__256 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__258; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__259 } -> (match dtb__258 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__260; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__261 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__260; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__261 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = 0 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__257 }, (v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges dtb__255)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, dtb__263) -> (match dtb__262 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__264; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 } -> (match dtb__264 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__266; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__267 } -> (match dtb__266 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__269 } -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__268) mc0) then (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__269) mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__269 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__267 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__263))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__263)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__263))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 516 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedCycle = (fun unguarded edges -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle unguarded) (v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded unguarded) edges))))

# 523 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelAcceptable = (fun comp defTbl edges -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf comp) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | dtb__270 -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedCycle dtb__270) edges) then false else true)
))

# 540 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf = (fun mc0 -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__271; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__272 } -> (match dtb__271 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__273; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__274 } -> (match dtb__273 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__275; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__276 } -> dtb__274
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if (strictCount > 0) then (if (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelAcceptable comp) defTbl) edges) then (if ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (msg)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (msg))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (msg)))) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defTbl) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))
