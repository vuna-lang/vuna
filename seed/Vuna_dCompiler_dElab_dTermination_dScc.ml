open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = { f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion : string Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge : bool }

# 24 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__1) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__0) mc9)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 43 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__5 } -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__3) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__5) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 62 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc9 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc10 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__8; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__9 } -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__7) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__8)) mc7) dtb__9) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 82 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) dtb__13) dtb__12)) mc7) dtb__11) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__13) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 101 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 <= 0) then mc9 else (match dtb__14 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__16, dtb__17, dtb__18) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) dtb__17) dtb__16)) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__19, dtb__20) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 112 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then acc else (match e with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__21, dtb__22, dtb__23) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__21) dtb__22) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__24, dtb__25, dtb__26) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__24) dtb__25) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__24) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__27, dtb__28, dtb__29, dtb__30) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__27) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__31) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, region))) dtb__29) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__27) acc))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVar dtb__27) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__32) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__29) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, region))) dtb__28) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__27) acc))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__29) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__27) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__33, dtb__34, dtb__35) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__34) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__36, dtb__37, dtb__38, dtb__39) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds dtb__36) sizes)) region) dtb__37) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__36) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__44) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__43) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__46, dtb__47, dtb__48) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__46) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__49, dtb__50, dtb__51) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__50) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__52, dtb__53, dtb__54) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__55, dtb__56) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__55) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__57, dtb__58, dtb__59) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__57) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__60, dtb__61) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlocalClauseBinds dtb__60)) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__62, dtb__63) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__62)) comp) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__62); f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc)) else acc)
  | _ -> acc
)))
# 149 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (fn : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then acc else (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__64) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = dtb__64; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = args; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match fn with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__65, dtb__66) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__65)) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
# 161 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (fn : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then acc else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__69, dtb__70, dtb__71) -> (match dtb__69 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (match dtb__72 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__74; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__75 } -> (match dtb__73 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__68 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__70) acc1)) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__76) dtb__74))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__76) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__68 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, dtb__79) -> (match dtb__79 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut29 -> (match nd_uscrut29 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__80, dtb__81) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__80)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__80)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__78) dtb__81) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__82, dtb__83, dtb__84) -> (match dtb__82 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__85, dtb__86) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__85)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__85)) dtb__83) dtb__78) dtb__84) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__67)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb__68 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (match dtb__88 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__89, dtb__90) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__89)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__89)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__87) dtb__90) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__91, dtb__92, dtb__93) -> (match dtb__91 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__94, dtb__95) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__94)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__94)) dtb__92) dtb__87) dtb__93) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__67)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__68 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__98, dtb__99) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__98)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__98)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__96) dtb__99) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__100, dtb__101, dtb__102) -> (match dtb__100 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__103, dtb__104) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__103)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__103)) dtb__101) dtb__96) dtb__102) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__67)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))
# 179 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (g : string) (pargs : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (lst : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (cbsp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = g; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = fullArgs; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = elems; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region }, acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((Base_dData_dList.v_Base_dData_dList_dappend pargs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "$elem"), cbsp)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))

# 191 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__106) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dexprBudget (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__105))) mc0) mc1) mc2) mc4) mc3) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__105))) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__105)) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : string Base_dData_dList.t_Base_dData_dList_dList) (mc6 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__108) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__107) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__107) mc3)) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defTbl) facts) comp) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 218 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun (m : int) -> (m <> 0))

# 221 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110) -> (match dtb__109 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__111; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__112 } -> (match dtb__112 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__113; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__114 } -> (match dtb__114 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__115; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 } -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__113) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__110))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom < (dtb__117).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118)))) else (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__117).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo <= (dtb__117).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__118)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__118)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__119, dtb__120) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__119) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__120))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun (a : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) (b : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (b).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) })

# 242 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, dtb__122) -> (match dtb__122 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (if ((dtb__121).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__123).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__121).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__123).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__121) dtb__123), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__124))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__122)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__122))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

# 256 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> false
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, dtb__128) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (if ((dtb__127).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__129).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__127).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__129).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (dtb__127).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) (dtb__129).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__128) dtb__130) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun (a : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (b : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b)))

# 272 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__131, dtb__132) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__131).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__131).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (dtb__131).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__132))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__132))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__133, dtb__134) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__133) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__134) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun (g1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (g2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2)))

# 288 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (if (dtb__135).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__136))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

# 297 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

# 300 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__137) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__138) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

# 310 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun (mc0 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc1 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (match dtb__139 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__141; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__142 } -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf mc0) = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__141)) then (if ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf mc0) = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__141)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__142)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__140)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__140))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__143) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__144))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__145) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__146) mc1) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc3 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__147, dtb__148) -> (match dtb__147 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__149; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 } -> (match dtb__149 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__151; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__152 } -> (if (mc0 = dtb__151) then (if (mc1 = dtb__152) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__150) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }, dtb__148)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__151; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__152 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__148)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__151; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__152 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__148))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun (f : string) (g : string) (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup { Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = g }) table) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__153) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__153) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true } else (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__153) >= v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc3 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__156; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__157 } -> (if dtb__157 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__155) dtb__156) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__156; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__154)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc3 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : bool) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (match dtb__158 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__160; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__161 } -> (match dtb__160 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__162; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__163 } -> (if (dtb__162 = mc1) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__164; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__165 } -> (if dtb__165 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__159) dtb__164) dtb__165) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__164; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__163) mc2) dtb__161) mc4)) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__159) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun (f : string) (g : string) (a : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (acc : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))

# 372 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc3 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__168; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__169 } -> (if dtb__169 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__167) mc3) dtb__168) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__168; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__166) mc3) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__170, dtb__171) -> (match dtb__170 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__172; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__173 } -> (match dtb__172 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__174; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__175 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__176; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__177 } -> (if dtb__177 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__171) mc1) dtb__176) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__176; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__174) dtb__175) dtb__173) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

# 392 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (match dtb__178 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__180; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__181 } -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__180) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__182) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__181) dtb__182) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__179) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun (a : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (b : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength a) = (Base_dData_dList.v_Base_dData_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false))

# 399 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false } else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__183; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__184 } -> (if dtb__184 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__183) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__183; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true } else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__183) (fuel - 1))) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__183; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table))))

# 411 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun (i : int) (j : int) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) j) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__185) -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__185) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes) ctors) projs) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) facts) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__186) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = i; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = j; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__186) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun (i : int) (count : int) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (if (count <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) (count - 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (count - 1)) s) ctors) projs) facts))))

# 429 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun (i : int) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (if (i <= 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (Base_dData_dList.v_Base_dData_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) s) ctors) projs) facts) else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (Base_dData_dList.v_Base_dData_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (i - 1)) s) ctors) projs) facts))))

# 438 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes)) s) ctors) projs) facts))

# 444 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__188) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__188) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (dtb__187).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) (dtb__187).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__187)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun (sites : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 458 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel = 240

# 462 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, dtb__190) -> (match dtb__189 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__191; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__192 } -> (match dtb__191 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__193; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 } -> (if (dtb__193 = dtb__194) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__192) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__190) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__190))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__195, dtb__196) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__195) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__196) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__196))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__197, dtb__198) -> (match dtb__197 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__199; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__200 } -> (match dtb__199 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__201; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__202 } -> (if (dtb__201 = dtb__202) then ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__201) dtb__200)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__198)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__198))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 479 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun (e : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->>"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

# 482 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun (e : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

# 476 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun (e : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> (if (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

# 485 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (match dtb__204 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__203)
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__203); ","; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__204)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__205) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__206) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" [mc0; "{"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__205); "}"]), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__206))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__207, dtb__208) -> (match dtb__207 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__209; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__210 } -> (match dtb__209 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__211; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__212 } -> (if (dtb__211 = dtb__212) then ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__211) dtb__210)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__208)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__208))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

# 503 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (msg : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> ((fun sites -> ((fun table0 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__213; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__214 } -> (if dtb__214 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__213) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__213); "]"])) msg)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel); " \232\189\174\239\188\137]"])) msg))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel))) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))

# 525 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (match dtb__215 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__217, dtb__218) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__217, (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf dtb__216)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf dtb__216)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__219, dtb__220) -> (match dtb__219 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__221, dtb__222) -> (if (dtb__221 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo dtb__220) mc1) (mc2 + 1)))
  | _ -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo dtb__220) mc1) (mc2 + 1))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__223, dtb__224, dtb__225, dtb__226) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__223) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__227) -> (dtb__227 = mc0)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 546 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dguardParamGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__228, dtb__229) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__228) mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__228)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dguardParamGo dtb__229) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf = (fun (name : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__230, dtb__231) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dguardParamGo (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__230))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__230))
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamIndexOf = (fun (callee : string) (callerFuel : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl callee) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__232, dtb__233) -> ((fun pats -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf callee) defTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__234) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo pats) dtb__234) 0)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo pats) callerFuel) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__235) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__235))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__232))
  | _ -> failwith "DT: impossible branch"
))

# 573 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcallerFuelName = (fun (name : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf name) defTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__236) -> dtb__236
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__237, dtb__238) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__237)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__239, dtb__240) -> dtb__239
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dparamsOf = (fun (name : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__241))
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun (callerParams : string Base_dData_dList.t_Base_dData_dList_dList) (callerGuard : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (calleeIdx : int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (site : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) -> (match calleeIdx with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__243) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (site).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) dtb__243) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__244) -> (match callerGuard with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__245, dtb__246, dtb__247) -> (match dtb__245 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__248, dtb__249) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__248)) then ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (match dtb__250 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__252, dtb__253) -> (match dtb__251 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__254, dtb__255) -> (match dtb__254 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__256, dtb__257) -> (match dtb__255 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (if (dtb__256 > 0) then ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__252)) callerParams) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (true)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)) dtb__246) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)) dtb__244)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__258) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__259, dtb__260, dtb__261) -> (match dtb__259 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__262, dtb__263) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__262)) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__264, dtb__265) -> (match dtb__264 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__266, dtb__267) -> (match dtb__265 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__268, dtb__269) -> (match dtb__268 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__270, dtb__271) -> (match dtb__269 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__266) = dtb__258) then (if (dtb__270 > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (true)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__260) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__272, dtb__273) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__272) = dtb__258) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__244)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, dtb__275) -> ((fun inGroup -> ((fun mode -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__275) acc2)) (if inGroup then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__274).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__274).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mode }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 } }, mc3)) else mc3))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__276) -> (if dtb__276 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamsOf (dtb__274).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf (dtb__274).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamIndexOf (dtb__274).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcallerFuelName (dtb__274).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) mc1)) dtb__274)))) ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__274).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) mc0))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 625 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sites : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defTbl) sites) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 648 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dmemberGuarded = (fun (f : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf f) defTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__277) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 654 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__278, dtb__279) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dmemberGuarded dtb__278) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf dtb__279) mc1) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__278, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf dtb__279) mc1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 660 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges = (fun (mc0 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__280, dtb__281) -> (match dtb__280 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__282; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__283 } -> (match dtb__282 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__284; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__285 } -> (match dtb__284 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__286; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__287 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__286; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__287 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = 0 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__283 }, (v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges dtb__281)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 665 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__288, dtb__289) -> (match dtb__288 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__290; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 } -> (match dtb__290 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__292; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__293 } -> (match dtb__292 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__294; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__295 } -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__294) mc0) then (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__295) mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__294; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__295 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__293 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__289))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__289)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__289))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 677 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedCycle = (fun (unguarded : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle unguarded) (v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded unguarded) edges))))

# 684 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelAcceptable = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf comp) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | dtb__296 -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedCycle dtb__296) edges) then false else true)
))

# 702 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf = (fun (mc0 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__297; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__298 } -> (match dtb__297 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__299; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__300 } -> (match dtb__299 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__301; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__302 } -> dtb__300
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 690 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (msg : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if (if (if (strictCount > 0) then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelAcceptable comp) defTbl) edges) else false) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges)) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (msg)))) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defTbl) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))
