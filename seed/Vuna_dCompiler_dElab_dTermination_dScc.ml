open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site of (string) * (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * ((string, (int, (int, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge of (int) * (int) * (bool)

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__2, dtb__3) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__3))), dtb__3)), (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__1)))
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
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__8, dtb__9) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__7) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__9) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__10 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__12, dtb__13) -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__11) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__12)) mc7) dtb__13) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__14 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__16, dtb__17) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9)))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__65, dtb__66) -> (if ((Base_dList.v_Base_dList_dmemName dtb__65) comp) then (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (caller, dtb__65, Base_dList.C_Base_dList_dList_Nil, sizes, region)), acc)) else acc)
  | _ -> acc
)))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun fuel comp ctors projs caller facts sizes region fn args acc -> (if (fuel <= 0) then acc else (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (caller, dtb__67, args, sizes, region)), acc)))
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
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun fuel comp ctors projs caller facts sizes region g pargs lst cbsp acc -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (caller, g, fullArgs, elems, region)), acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((Base_dList.v_Base_dList_dappend pargs) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("$elem", cbsp)), Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))

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
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__114, dtb__115) -> (match dtb__115 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__116, dtb__117) -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__114) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__111))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__120, dtb__121, dtb__122) -> dtb__120
  | _ -> failwith "DT: impossible branch"
) < (match dtb__118 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__123, dtb__124, dtb__125) -> dtb__123
  | _ -> failwith "DT: impossible branch"
)) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119)))) else (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__126, dtb__127, dtb__128) -> dtb__126
  | _ -> failwith "DT: impossible branch"
) = (match dtb__118 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__129, dtb__130, dtb__131) -> dtb__129
  | _ -> failwith "DT: impossible branch"
)) then (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__132, dtb__133, dtb__134) -> dtb__133
  | _ -> failwith "DT: impossible branch"
) <= (match dtb__118 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__135, dtb__136, dtb__137) -> dtb__136
  | _ -> failwith "DT: impossible branch"
)) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__118, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__119)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__118, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__119)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__138) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__139))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun a b -> (C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge ((match a with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__140, dtb__141, dtb__142) -> dtb__140
  | _ -> failwith "DT: impossible branch"
), (match a with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__143, dtb__144, dtb__145) -> dtb__144
  | _ -> failwith "DT: impossible branch"
), (if (match a with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__146, dtb__147, dtb__148) -> dtb__148
  | _ -> failwith "DT: impossible branch"
) then true else (match b with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__149, dtb__150, dtb__151) -> dtb__151
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (match dtb__153 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__152, Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if ((match dtb__152 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__156, dtb__157, dtb__158) -> dtb__156
  | _ -> failwith "DT: impossible branch"
) = (match dtb__154 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__159, dtb__160, dtb__161) -> dtb__159
  | _ -> failwith "DT: impossible branch"
)) then (if ((match dtb__152 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__162, dtb__163, dtb__164) -> dtb__163
  | _ -> failwith "DT: impossible branch"
) = (match dtb__154 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__165, dtb__166, dtb__167) -> dtb__166
  | _ -> failwith "DT: impossible branch"
)) then (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__152) dtb__154), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__155))) else (Base_dList.C_Base_dList_dList_Cons (dtb__152, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__153)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__152, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__153))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__172, dtb__173) -> (if ((match dtb__170 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__174, dtb__175, dtb__176) -> dtb__174
  | _ -> failwith "DT: impossible branch"
) = (match dtb__172 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__177, dtb__178, dtb__179) -> dtb__177
  | _ -> failwith "DT: impossible branch"
)) then (if ((match dtb__170 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__180, dtb__181, dtb__182) -> dtb__181
  | _ -> failwith "DT: impossible branch"
) = (match dtb__172 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__183, dtb__184, dtb__185) -> dtb__184
  | _ -> failwith "DT: impossible branch"
)) then (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) (match dtb__170 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__186, dtb__187, dtb__188) -> dtb__188
  | _ -> failwith "DT: impossible branch"
)) (match dtb__172 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__189, dtb__190, dtb__191) -> dtb__191
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__171) dtb__173) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun a b -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__194, dtb__195, dtb__196) -> dtb__195
  | _ -> failwith "DT: impossible branch"
) = (match dtb__192 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__197, dtb__198, dtb__199) -> dtb__197
  | _ -> failwith "DT: impossible branch"
)) then (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__200, dtb__201, dtb__202) -> dtb__200
  | _ -> failwith "DT: impossible branch"
), (match dtb__192 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__203, dtb__204, dtb__205) -> dtb__204
  | _ -> failwith "DT: impossible branch"
), (if (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__206, dtb__207, dtb__208) -> dtb__208
  | _ -> failwith "DT: impossible branch"
) then true else (match dtb__192 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__209, dtb__210, dtb__211) -> dtb__211
  | _ -> failwith "DT: impossible branch"
)))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__193))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__193))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__212) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__213) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun g1 g2 -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__214, dtb__215) -> (if (match dtb__214 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__216, dtb__217, dtb__218) -> dtb__218
  | _ -> failwith "DT: impossible branch"
) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__215))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun edges -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun edges -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__219, dtb__220) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__219) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__220) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (match dtb__221 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__223, dtb__224) -> (if ((Base_dPair.v_Base_dPair_dfirstOf mc0) = (Base_dPair.v_Base_dPair_dfirstOf dtb__223)) then (if ((Base_dPair.v_Base_dPair_dsecondOf mc0) = (Base_dPair.v_Base_dPair_dsecondOf dtb__223)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__224)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__222)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__222))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__225, dtb__226) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__225) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__226))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__227) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__228) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (match dtb__229 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__231, dtb__232) -> (match dtb__231 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__233, dtb__234) -> (if (mc0 = dtb__233) then (if (mc1 = dtb__234) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), ((Base_dList.v_Base_dList_dappend dtb__232) (Base_dList.C_Base_dList_dList_Cons (mc2, Base_dList.C_Base_dList_dList_Nil))))), dtb__230)) else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__233, dtb__234)), dtb__232)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__230)))) else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__233, dtb__234)), dtb__232)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__230))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), (Base_dList.C_Base_dList_dList_Cons (mc2, Base_dList.C_Base_dList_dList_Nil)))), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun f g edges table -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup (Base_dPair.C_Base_dPair_dPair_Pair (f, g))) table) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__235) then (Base_dPair.C_Base_dPair_dPair_Pair (table, true)) else (if ((Base_dList.v_Base_dList_dlength dtb__235) >= v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then (Base_dPair.C_Base_dPair_dPair_Pair (table, false)) else (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__236, dtb__237) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__238, dtb__239) -> (if dtb__239 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__237) dtb__238) else (Base_dPair.C_Base_dPair_dPair_Pair (dtb__238, false)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__236)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__240, dtb__241) -> (match dtb__240 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__242, dtb__243) -> (match dtb__242 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__244, dtb__245) -> (if (dtb__244 = mc1) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__246, dtb__247) -> (if dtb__247 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__241) dtb__246) dtb__247) else (Base_dPair.C_Base_dPair_dPair_Pair (dtb__246, false)))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__245) mc2) dtb__243) mc4)) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__241) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc4, mc5))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun f g a table acc -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__250, dtb__251) -> (if dtb__251 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__249) mc3) dtb__250) else (Base_dPair.C_Base_dPair_dPair_Pair (dtb__250, false)))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__248) mc3) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__252, dtb__253) -> (match dtb__252 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__254, dtb__255) -> (match dtb__254 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__256, dtb__257) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__258, dtb__259) -> (if dtb__259 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__253) mc1) dtb__258) else (Base_dPair.C_Base_dPair_dPair_Pair (dtb__258, false)))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__256) dtb__257) dtb__255) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc2, true))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun table -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__260, dtb__261) -> (match dtb__260 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__262, dtb__263) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__262) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__264) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__263) dtb__264) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__261) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun a b -> (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun table fuel -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Pair (table, false)) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__265, dtb__266) -> (if dtb__266 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__265) then (Base_dPair.C_Base_dPair_dPair_Pair (dtb__265, true)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__265) (fuel - 1))) else (Base_dPair.C_Base_dPair_dPair_Pair (dtb__265, false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun i j s ctors projs facts -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__267, dtb__268, dtb__269, dtb__270, dtb__271) -> dtb__269
  | _ -> failwith "DT: impossible branch"
)) j) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__272) -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__272) (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> dtb__276
  | _ -> failwith "DT: impossible branch"
)) ctors) projs) (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> dtb__278
  | _ -> failwith "DT: impossible branch"
)) facts) (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> dtb__287
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (i, j, (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__288))), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun i count s ctors projs facts -> (if (count <= 0) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) (count - 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (count - 1)) s) ctors) projs) facts))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun i s ctors projs facts -> (if (i <= 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (Base_dList.v_Base_dList_dlength (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> dtb__291
  | _ -> failwith "DT: impossible branch"
))) s) ctors) projs) facts) else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (Base_dList.v_Base_dList_dlength (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298) -> dtb__296
  | _ -> failwith "DT: impossible branch"
))) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (i - 1)) s) ctors) projs) facts))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun ctors projs facts s -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> dtb__302
  | _ -> failwith "DT: impossible branch"
))) s) ctors) projs) facts))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__304, dtb__305) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__305) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (match dtb__304 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> dtb__306
  | _ -> failwith "DT: impossible branch"
)) (match dtb__304 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> dtb__312
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__304)) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun sites ctors projs facts -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__316, dtb__317) -> (match dtb__316 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__318, dtb__319) -> (match dtb__318 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__320, dtb__321) -> (if (dtb__320 = dtb__321) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__319) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__317) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__317))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__322, dtb__323) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__322) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__323) else (Base_dList.C_Base_dList_dList_Cons (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__323))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__324, dtb__325) -> (match dtb__324 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__326, dtb__327) -> (match dtb__326 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__328, dtb__329) -> (if (dtb__328 = dtb__329) then ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__328) dtb__327)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__325)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__325))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__330, dtb__331, dtb__332) -> dtb__330
  | _ -> failwith "DT: impossible branch"
)); "->>"; (bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__333, dtb__334, dtb__335) -> dtb__334
  | _ -> failwith "DT: impossible branch"
))]))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__336, dtb__337, dtb__338) -> dtb__336
  | _ -> failwith "DT: impossible branch"
)); "->"; (bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__339, dtb__340, dtb__341) -> dtb__340
  | _ -> failwith "DT: impossible branch"
))]))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun e -> (if (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_ScEdge (dtb__342, dtb__343, dtb__344) -> dtb__344
  | _ -> failwith "DT: impossible branch"
) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__345, dtb__346) -> (match dtb__346 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__345)
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__345); ","; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__346)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__347, dtb__348) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__347) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__348) else (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [mc0; "{"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__347); "}"]), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__348))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__349, dtb__350) -> (match dtb__349 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__351, dtb__352) -> (match dtb__351 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__353, dtb__354) -> (if (dtb__353 = dtb__354) then ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__353) dtb__352)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__350)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__350))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun table -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun table0 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__355, dtb__356) -> (if dtb__356 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__355) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [msg; " [SCT \230\151\160\228\184\139\233\153\141\231\142\175: "; (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__355); "]"])))) else (Base_dResult.C_Base_dResult_dResult_Err (msg)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) 240))) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__357, dtb__358) -> (match dtb__357 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__359, dtb__360) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__359))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf = (fun name defTbl -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | Base_dList.C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (Base_dPair.v_Base_dPair_dfirstOf dtb__361)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__363) -> dtb__363
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__364, dtb__365, dtb__366, dtb__367) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__364) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__368) -> (dtb__368 = mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun callerFuel site -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (match site with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__369, dtb__370, dtb__371, dtb__372, dtb__373) -> dtb__371
  | _ -> failwith "DT: impossible branch"
)) 0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__374) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__375, dtb__376, dtb__377) -> (match dtb__375 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__378, dtb__379) -> (if (dtb__378 = "-") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__380, dtb__381) -> (match dtb__380 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__382, dtb__383) -> (match dtb__381 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__384, dtb__385) -> (match dtb__384 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__386, dtb__387) -> (match dtb__385 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__382 = callerFuel) then (if (dtb__386 > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (true)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__376) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__388, dtb__389) -> (if (dtb__388 = callerFuel) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__374)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__390, dtb__391) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf (match dtb__390 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396) -> dtb__392
  | _ -> failwith "DT: impossible branch"
)) mc1)) dtb__390) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__391) false) mc4)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__397) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__391) mc3) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair ((match dtb__390 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__398, dtb__399, dtb__400, dtb__401, dtb__402) -> dtb__398
  | _ -> failwith "DT: impossible branch"
), (match dtb__390 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Site (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407) -> dtb__404
  | _ -> failwith "DT: impossible branch"
))), (if dtb__397 then 1 else 0))), mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun comp defTbl sites -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defTbl) sites) true) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__408, dtb__409) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__408) mc1) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__410, dtb__411) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (Base_dPair.v_Base_dPair_dfirstOf dtb__410)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__412) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__412) (Base_dPair.v_Base_dPair_dsecondOf dtb__410)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded dtb__409) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if (strictCount > 0) then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded comp) defTbl) then (if ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges) then (Base_dResult.C_Base_dResult_dResult_Err (msg)) else (Base_dResult.C_Base_dResult_dResult_Ok (0))) else (Base_dResult.C_Base_dResult_dResult_Err (msg))) else (Base_dResult.C_Base_dResult_dResult_Err (msg)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defTbl) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))
