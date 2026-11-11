open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = { f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes : (string, (int, (int, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge : bool }

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__3))); Base_dPair.f_Base_dPair_dPair_second = dtb__3 }, (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__5) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__4) mc9)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__7) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__9) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__11) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__12)) mc7) dtb__13) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if (mc0 <= 0) then mc9 else (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__20, dtb__21, dtb__22) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__21) mc9))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__23, dtb__24) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__23) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun fuel comp ctors projs caller facts sizes region e acc -> (if (fuel <= 0) then acc else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__25, dtb__26, dtb__27) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__25) dtb__26) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__28, dtb__29, dtb__30) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) dtb__29) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__31, dtb__32, dtb__33, dtb__34) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__31) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) (Base_dList.C_Base_dList_dList_Cons (dtb__35, region))) dtb__33) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__31) acc))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__33) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__31) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__36, dtb__37, dtb__38) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__37) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__39, dtb__40, dtb__41, dtb__42) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__39) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__47) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__46) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__49, dtb__50, dtb__51) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__49) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__52, dtb__53, dtb__54) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__55, dtb__56, dtb__57) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__56) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__55) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__58, dtb__59) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__60, dtb__61, dtb__62) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__61) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__60) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__63, dtb__64) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__63)) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__65, dtb__66) -> (if ((Base_dList.v_Base_dList_dmemName dtb__65) comp) then (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = dtb__65; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc)) else acc)
  | _ -> acc
)))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun fuel comp ctors projs caller facts sizes region fn args acc -> (if (fuel <= 0) then acc else (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = dtb__67; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = args; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__68, dtb__69) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__68) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun fuel comp ctors projs caller facts sizes region fn args acc -> (if (fuel <= 0) then acc else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__72, dtb__73, dtb__74) -> (match dtb__72 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match dtb__76 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__71 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (match dtb__78 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__73) acc1)) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__77) dtb__75))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__77) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__71 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (match dtb__80 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__81, dtb__82) -> (if ((Base_dList.v_Base_dList_dmemName dtb__81) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__81) Base_dList.C_Base_dList_dList_Nil) dtb__79) dtb__82) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__83, dtb__84, dtb__85) -> (match dtb__83 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__86, dtb__87) -> (if ((Base_dList.v_Base_dList_dmemName dtb__86) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__86) dtb__84) dtb__79) dtb__85) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__90, dtb__91) -> (if ((Base_dList.v_Base_dList_dmemName dtb__90) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__90) Base_dList.C_Base_dList_dList_Nil) dtb__88) dtb__91) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__92, dtb__93, dtb__94) -> (match dtb__92 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__95, dtb__96) -> (if ((Base_dList.v_Base_dList_dmemName dtb__95) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__95) dtb__93) dtb__88) dtb__94) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__99, dtb__100) -> (if ((Base_dList.v_Base_dList_dmemName dtb__99) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__99) Base_dList.C_Base_dList_dList_Nil) dtb__97) dtb__100) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__101, dtb__102, dtb__103) -> (match dtb__101 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__104, dtb__105) -> (if ((Base_dList.v_Base_dList_dmemName dtb__104) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__104) dtb__102) dtb__97) dtb__103) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
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
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun fuel comp ctors projs caller facts sizes region g pargs lst cbsp acc -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = g; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = fullArgs; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = elems; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((Base_dList.v_Base_dList_dappend pargs) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("$elem", cbsp)), Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__107) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC 100000) mc0) mc1) mc2) mc4) mc3) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dPair.v_Base_dPair_dfirstOf dtb__106))) Base_dList.C_Base_dList_dList_Nil) (Base_dPair.v_Base_dPair_dsecondOf dtb__106)) mc6))
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__109) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__108) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__108) mc3)) mc6))
  | Base_dList.C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun comp ctors projs defTbl facts -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defTbl) facts) comp) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun m -> (m <> 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match dtb__110 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__112; Base_dPair.f_Base_dPair_dPair_second = dtb__113 } -> (match dtb__113 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__114; Base_dPair.f_Base_dPair_dPair_second = dtb__115 } -> (match dtb__115 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__116; Base_dPair.f_Base_dPair_dPair_second = dtb__117 } -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__114) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom < (dtb__118).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119)))) else (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__118).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo <= (dtb__118).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__118, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__119)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__118, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__119)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__120) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__121))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun a b -> { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (b).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) })

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__123 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__122, Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList_Cons (dtb__124, dtb__125) -> (if ((dtb__122).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__124).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__122).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__124).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__122) dtb__124), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__125))) else (Base_dList.C_Base_dList_dList_Cons (dtb__122, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__123)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__122, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__123))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (if ((dtb__128).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__130).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__128).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__130).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) (dtb__128).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) (dtb__130).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__129) dtb__131) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun a b -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__132).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__132).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (dtb__132).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__133))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__133))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__134) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__135) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun g1 g2 -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (if (dtb__136).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__137))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun edges -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun edges -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__138) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__139) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (match dtb__140 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 } -> (if ((Base_dPair.v_Base_dPair_dfirstOf mc0) = (Base_dPair.v_Base_dPair_dfirstOf dtb__142)) then (if ((Base_dPair.v_Base_dPair_dsecondOf mc0) = (Base_dPair.v_Base_dPair_dsecondOf dtb__142)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__143)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__141)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__141))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__144) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__145))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__146) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__147) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__148 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__150; Base_dPair.f_Base_dPair_dPair_second = dtb__151 } -> (match dtb__150 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 } -> (if (mc0 = dtb__152) then (if (mc1 = dtb__153) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__151) (Base_dList.C_Base_dList_dList_Cons (mc2, Base_dList.C_Base_dList_dList_Nil))) }, dtb__149)) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 }; Base_dPair.f_Base_dPair_dPair_second = dtb__151 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__149)))) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 }; Base_dPair.f_Base_dPair_dPair_second = dtb__151 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__149))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (mc2, Base_dList.C_Base_dList_dList_Nil)) }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun f g edges table -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup { Base_dPair.f_Base_dPair_dPair_first = f; Base_dPair.f_Base_dPair_dPair_second = g }) table) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dPair.f_Base_dPair_dPair_second = true }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__154) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__154) then { Base_dPair.f_Base_dPair_dPair_first = table; Base_dPair.f_Base_dPair_dPair_second = true } else (if ((Base_dList.v_Base_dList_dlength dtb__154) >= v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then { Base_dPair.f_Base_dPair_dPair_first = table; Base_dPair.f_Base_dPair_dPair_second = false } else { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dPair.f_Base_dPair_dPair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__157; Base_dPair.f_Base_dPair_dPair_second = dtb__158 } -> (if dtb__158 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__156) dtb__157) else { Base_dPair.f_Base_dPair_dPair_first = dtb__157; Base_dPair.f_Base_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__155)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> (match dtb__159 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = dtb__162 } -> (match dtb__161 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = dtb__164 } -> (if (dtb__163 = mc1) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__165; Base_dPair.f_Base_dPair_dPair_second = dtb__166 } -> (if dtb__166 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__160) dtb__165) dtb__166) else { Base_dPair.f_Base_dPair_dPair_first = dtb__165; Base_dPair.f_Base_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__164) mc2) dtb__162) mc4)) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__160) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun f g a table acc -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__169; Base_dPair.f_Base_dPair_dPair_second = dtb__170 } -> (if dtb__170 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__168) mc3) dtb__169) else { Base_dPair.f_Base_dPair_dPair_first = dtb__169; Base_dPair.f_Base_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__167) mc3) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__171 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__173; Base_dPair.f_Base_dPair_dPair_second = dtb__174 } -> (match dtb__173 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__175; Base_dPair.f_Base_dPair_dPair_second = dtb__176 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = dtb__178 } -> (if dtb__178 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__172) mc1) dtb__177) else { Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__175) dtb__176) dtb__174) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun table -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (match dtb__179 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__181; Base_dPair.f_Base_dPair_dPair_second = dtb__182 } -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__181) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__183) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__182) dtb__183) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__180) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun a b -> (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun table fuel -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = table; Base_dPair.f_Base_dPair_dPair_second = false } else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 } -> (if dtb__185 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__184) then { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = true } else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__184) (fuel - 1))) else { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun i j s ctors projs facts -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) j) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__186) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes) ctors) projs) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) facts) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__187) -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = i; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = j; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__187) }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun i count s ctors projs facts -> (if (count <= 0) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) (count - 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (count - 1)) s) ctors) projs) facts))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun i s ctors projs facts -> (if (i <= 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (Base_dList.v_Base_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) s) ctors) projs) facts) else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (Base_dList.v_Base_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (i - 1)) s) ctors) projs) facts))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun ctors projs facts s -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes)) s) ctors) projs) facts))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__189) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (dtb__188).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) (dtb__188).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__188)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun sites ctors projs facts -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (match dtb__190 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (match dtb__192 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (if (dtb__194 = dtb__195) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__193) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__191) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__196) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__197) else (Base_dList.C_Base_dList_dList_Cons (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__197))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (match dtb__198 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = dtb__201 } -> (match dtb__200 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__202; Base_dPair.f_Base_dPair_dPair_second = dtb__203 } -> (if (dtb__202 = dtb__203) then ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__202) dtb__201)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__199)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__199))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->>"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun e -> (if (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__204, dtb__205) -> (match dtb__205 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__204)
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__204); ","; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__205)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__206, dtb__207) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__206) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__207) else (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [mc0; "{"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__206); "}"]), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__207))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__208, dtb__209) -> (match dtb__208 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__210; Base_dPair.f_Base_dPair_dPair_second = dtb__211 } -> (match dtb__210 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__212; Base_dPair.f_Base_dPair_dPair_second = dtb__213 } -> (if (dtb__212 = dtb__213) then ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__212) dtb__211)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__209)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__209))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun table -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun table0 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 } -> (if dtb__215 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__214) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dappendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175: "; (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__214); "]"])) msg)))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (msg)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) 240))) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__216, dtb__217) -> (match dtb__216 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__218, dtb__219) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__218))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf = (fun name defTbl -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | Base_dList.C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (Base_dPair.v_Base_dPair_dfirstOf dtb__220)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__222) -> dtb__222
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__223, dtb__224, dtb__225, dtb__226) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__223) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__227) -> (dtb__227 = mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun callerFuel site -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (site).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) 0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__229, dtb__230, dtb__231) -> (match dtb__229 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__232, dtb__233) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName dtb__232) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (match dtb__234 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__236, dtb__237) -> (match dtb__235 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__238, dtb__239) -> (match dtb__238 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__240, dtb__241) -> (match dtb__239 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__236 = callerFuel) then (if (dtb__240 > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (true)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__230) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__242, dtb__243) -> (if (dtb__242 = callerFuel) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__228)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf (dtb__244).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) dtb__244) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__245) false) mc4)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__245) mc3) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = (dtb__244).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller; Base_dPair.f_Base_dPair_dPair_second = (dtb__244).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee }; Base_dPair.f_Base_dPair_dPair_second = (if dtb__246 then 1 else 0) }; Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 } }, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun comp defTbl sites -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defTbl) sites) true) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__247) mc1) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__249, dtb__250) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (Base_dPair.v_Base_dPair_dfirstOf dtb__249)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__251) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__251) (Base_dPair.v_Base_dPair_dsecondOf dtb__249)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded dtb__248) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__252; Base_dPair.f_Base_dPair_dPair_second = dtb__253 } -> (match dtb__252 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__254; Base_dPair.f_Base_dPair_dPair_second = dtb__255 } -> (match dtb__254 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__256; Base_dPair.f_Base_dPair_dPair_second = dtb__257 } -> dtb__255
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if (strictCount > 0) then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded comp) defTbl) then (if ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (msg)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (msg))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (msg)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defTbl) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))
