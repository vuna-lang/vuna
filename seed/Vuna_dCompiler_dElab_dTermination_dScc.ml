open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = { f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee : string; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteBlind : bool }
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo : int; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge : bool }

# 25 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (g : string) -> { f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = g; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteBlind = true })) comp))

# 33 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__1) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__0) mc9)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 52 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__5 } -> (if (mc0 <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__3) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__5) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 71 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc9 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc10 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__8; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__9 } -> (if (mc0 <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf mc1) mc4) mc6) mc7)) mc10) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__7) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__8)) mc7) dtb__9) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 91 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> (if (mc0 <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) dtb__13) dtb__12)) mc7) dtb__11) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__13) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 110 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string) (mc5 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc6 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : string Base_dData_dList.t_Base_dData_dList_dList) (mc8 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) (mc9 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf mc1) mc4) mc6) mc7)) mc9) else (match dtb__14 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__16, dtb__17, dtb__18) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) dtb__17) dtb__16)) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__19, dtb__20) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 121 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf comp) caller) sizes) region)) acc) else (match e with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__21, dtb__22, dtb__23) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__21) dtb__22) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__24, dtb__25, dtb__26) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__24) dtb__25) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__24) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__27, dtb__28, dtb__29, dtb__30) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardElsePosVars dtb__27)) region)) dtb__29) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardThenPosVars dtb__27)) region)) dtb__28) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__27) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__31, dtb__32, dtb__33) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__34, dtb__35, dtb__36, dtb__37) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendByBinds dtb__34) sizes)) region) dtb__35) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__34) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__42) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__41) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__44, dtb__45, dtb__46) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__44) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__47, dtb__48, dtb__49) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__48) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__50, dtb__51, dtb__52) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__51) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__50) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__53, dtb__54) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__55, dtb__56, dtb__57) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__56) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__55) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__58, dtb__59) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlocalClauseBinds dtb__58)) acc)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__60, dtb__61) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__60)) comp) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__60); f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteBlind = true }, acc)) else acc)
  | _ -> acc
)))
# 148 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (fn : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf comp) caller) sizes) region)) acc) else (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__62) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = dtb__62; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = args; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = sizes; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteBlind = false }, acc)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match fn with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__63, dtb__64) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__63)) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
# 160 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (fn : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (args : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf comp) caller) sizes) region)) acc) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__67, dtb__68, dtb__69) -> (match dtb__67 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__72; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__73 } -> (match dtb__71 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__66 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match dtb__75 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__68) acc1)) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__74) dtb__72))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__74) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__66 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut29 -> (match nd_uscrut29 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__78, dtb__79) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__78)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__78)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__76) dtb__79) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__80, dtb__81, dtb__82) -> (match dtb__80 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__83, dtb__84) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__83)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__83)) dtb__81) dtb__76) dtb__82) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__65)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb__66 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (match dtb__86 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__87, dtb__88) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__87)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__87)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__85) dtb__88) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__89, dtb__90, dtb__91) -> (match dtb__89 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__92, dtb__93) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__92)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__92)) dtb__90) dtb__85) dtb__91) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__65)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__66 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (match dtb__95 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__96, dtb__97) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__96)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__96)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__94) dtb__97) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__98, dtb__99, dtb__100) -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__101, dtb__102) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__101)) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__101)) dtb__99) dtb__94) dtb__100) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__65)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))
# 178 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun (fuel : int) (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (caller : string) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (region : string Base_dData_dList.t_Base_dData_dList_dList) (g : string) (pargs : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (lst : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (cbsp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (acc : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindSitesOf comp) caller) sizes) region)) acc) else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller = caller; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee = g; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs = fullArgs; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes = elems; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion = region; f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteBlind = false }, acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((Base_dData_dList.v_Base_dData_dList_dappend pargs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "$elem"), cbsp)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))

# 194 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_daliasNameOf = (fun (p : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))

# 197 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dlookupAlias = (fun (mc0 : string) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__103, dtb__104) -> (match dtb__103 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__105; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__106 } -> (if (mc0 = dtb__105) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__106)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dlookupAlias mc0) dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases dtb__108) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (p : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_daliasNameOf p) <> dtb__107))) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_daliasOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__109; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__110 } -> (match dtb__109 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__111, dtb__112) -> (match dtb__110 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__113, dtb__114) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__113)) mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__111; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__113) })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun (m : int) -> (m <> 0))

# 329 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__115, dtb__116) -> (match dtb__115 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__117; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__118 } -> (match dtb__118 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 } -> (match dtb__120 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__121; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__122 } -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__119) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__116))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom < (dtb__123).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124)))) else (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__123).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo <= (dtb__123).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__124)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__124)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__125) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__126))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun (a : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) (b : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> { f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (a).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (b).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) })

# 350 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (if ((dtb__127).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__129).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__127).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__129).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__127) dtb__129), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__130))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__128)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__128))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

# 364 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__131, dtb__132) -> false
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__133, dtb__134) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (if ((dtb__133).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (dtb__135).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (if ((dtb__133).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__135).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo) then (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (dtb__133).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) (dtb__135).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__134) dtb__136) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun (a : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (b : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b)))

# 380 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (if ((mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__137).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (dtb__137).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (if (mc0).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (dtb__137).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge) }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__138))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__138))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__139, dtb__140) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__139) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__140) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun (g1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (g2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2)))

# 396 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__141, dtb__142) -> (if (dtb__141).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__142))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

# 405 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

# 408 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__143) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__144) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

# 418 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun (mc0 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc1 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (match dtb__145 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf mc0) = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__147)) then (if ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf mc0) = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__147)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__148)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__146)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__146))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__149) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__150))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__151) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__152) mc1) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc3 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__153, dtb__154) -> (match dtb__153 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__155; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__156 } -> (match dtb__155 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__157; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__158 } -> (if (mc0 = dtb__157) then (if (mc1 = dtb__158) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, dtb__156)) }, dtb__154)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__157; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__158 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__156 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__154)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__157; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__158 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__156 }, ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__154))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun (f : string) (g : string) (edges : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup { Base_dData_dPair.f_Base_dData_dPair_dPair_first = f; Base_dData_dPair.f_Base_dData_dPair_dPair_second = g }) table) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__159) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__159) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true } else (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__159) >= v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc3 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, dtb__161) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__162; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__163 } -> (if dtb__163 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__161) dtb__162) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__162; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__160)) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (mc3 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : bool) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__164, dtb__165) -> (match dtb__164 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__166; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__167 } -> (match dtb__166 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__168; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__169 } -> (if (dtb__168 = mc1) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__170; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__171 } -> (if dtb__171 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__165) dtb__170) dtb__171) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__170; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__169) mc2) dtb__167) mc4)) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__165) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun (f : string) (g : string) (a : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (acc : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))

# 480 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun (mc0 : string) (mc1 : string) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc3 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__172, dtb__173) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__174; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__175 } -> (if dtb__175 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__173) mc3) dtb__174) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__174; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__172) mc3) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__176, dtb__177) -> (match dtb__176 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__178; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__179 } -> (match dtb__178 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__180; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__181 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 } -> (if dtb__183 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__177) mc1) dtb__182) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__180) dtb__181) dtb__179) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

# 500 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__184, dtb__185) -> (match dtb__184 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__186; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__187 } -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__186) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__188) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__187) dtb__188) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__185) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun (a : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (b : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength a) = (Base_dData_dList.v_Base_dData_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false))

# 507 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = table; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = fuel } } else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 } -> (if dtb__190 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__189) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = fuel } } else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__189) (fuel - 1))) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = fuel } })
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table))))

# 525 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbasesUpToGo = (fun (i : int) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (i <= 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, acc)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbasesUpToGo (i - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (i, acc)))))

# 528 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dbasesUpTo = (fun (n : int) -> (if (n < 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbasesUpToGo n) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 531 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasBase = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (if (mc0 = dtb__191) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasBase mc0) dtb__192))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_ddedupBases = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, dtb__194) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasBase dtb__193) dtb__194) then (v_Vuna_dCompiler_dElab_dTermination_dScc_ddedupBases dtb__194) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, (v_Vuna_dCompiler_dElab_dTermination_dScc_ddedupBases dtb__194))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__195, dtb__196, dtb__197) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfFields dtb__196)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__198, dtb__199, dtb__200) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfPats dtb__199)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__201, dtb__202, dtb__203) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__202)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__204, dtb__205) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__204, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))
# 546 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfPats = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__206, dtb__207) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__206)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfPats dtb__207))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 550 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfFields = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__208, dtb__209) -> (match dtb__208 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__210; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__211 } -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__211)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfFields dtb__209))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinlArgs = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__212, dtb__213) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__212), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlArgs mc0) mc1) dtb__213)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 218 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dinlFields = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__214, dtb__215) -> (match dtb__214 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__216; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__217 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__216; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__217) }, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlFields mc0) mc1) dtb__215)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 222 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dinlParts = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dInterpPart Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__220) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__220)), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlParts mc0) mc1) dtb__219)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole (dtb__221) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__221))), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlParts mc0) mc1) dtb__219)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 229 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dinlBinds = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__224; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__225 } -> ((fun rhs -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_daliasOf mc0) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__224; Base_dData_dPair.f_Base_dData_dPair_dPair_second = rhs }) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__226) -> ((fun restP -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf restP); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf restP) }) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlBinds mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__226, mc1))) dtb__223))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun restP -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__224; Base_dData_dPair.f_Base_dData_dPair_dPair_second = rhs }, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf restP))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf restP) }) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlBinds mc0) ((v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__224)) mc1)) dtb__223))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__225))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))
# 246 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dinlAlts = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__227, dtb__228) -> (match dtb__227 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__229; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__230 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__229; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) ((v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__229)) mc1)) dtb__230) }, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlAlts mc0) mc1) dtb__228)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 251 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dinlClauses = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__231, dtb__232) -> (match dtb__231 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__233; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__234 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__233; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) ((v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfPats dtb__233)) mc1)) dtb__234) }, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlClauses mc0) mc1) dtb__232)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 256 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dinlStmts = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__235, dtb__236) -> (match dtb__235 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__237, dtb__238, dtb__239) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__237, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__238), dtb__239)), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlStmts mc0) ((v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__237)) mc1)) dtb__236)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__240, dtb__241) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__240), dtb__241)), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlStmts mc0) mc1) dtb__236)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 264 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__242, dtb__243, dtb__244) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__242, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlParts mc0) mc1) dtb__243), dtb__244))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__245, dtb__246, dtb__247) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__245), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__246), dtb__247))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (dtb__248, dtb__249, dtb__250) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__248), dtb__249, dtb__250))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__251, dtb__252, dtb__253) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__251, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__252), dtb__253))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__254, dtb__255, dtb__256, dtb__257) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__254, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__255), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__256), dtb__257))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (dtb__258, dtb__259) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__258), dtb__259))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__260, dtb__261, dtb__262, dtb__263) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__260, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__261), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__262), dtb__263))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__264, dtb__265) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlStmts mc0) mc1) dtb__264), dtb__265))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__266, dtb__267, dtb__268) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__266), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlFields mc0) mc1) dtb__267), dtb__268))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__269, dtb__270, dtb__271) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__269, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlFields mc0) mc1) dtb__270), dtb__271))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__272, dtb__273, dtb__274) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__272), dtb__273, dtb__274))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__275, dtb__276, dtb__277, dtb__278) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__275), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__276), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__277), dtb__278))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__279, dtb__280, dtb__281) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__279), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlAlts mc0) mc1) dtb__280), dtb__281))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__282, dtb__283) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlClauses mc0) mc1) dtb__282), dtb__283))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__284, dtb__285, dtb__286, dtb__287) -> ((fun p -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) dtb__285), dtb__286, dtb__287))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlBinds mc0) mc1) dtb__284))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__288, dtb__289, dtb__290, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__291), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) ((v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__288, Base_dData_dList.C_Base_dData_dList_dList_Nil))) mc1)) dtb__292), dtb__293))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__294, dtb__295, dtb__296) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) mc1) dtb__294), (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlArgs mc0) mc1) dtb__295), dtb__296))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__297, dtb__298, dtb__299) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__297, (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo mc0) ((v_Vuna_dCompiler_dElab_dTermination_dScc_ddropAliases ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__297)) mc1)) dtb__298), dtb__299))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__300, dtb__301) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dlookupAlias (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__300)) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__302) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName dtb__302), dtb__301))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__300, dtb__301))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 294 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dinlineAliases = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlGo comp) Base_dData_dList.C_Base_dData_dList_dList_Nil) e))

# 297 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : string) (mc5 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__303, dtb__304) -> ((fun body -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__304) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dexprBudget 32) body)) mc0) mc1) mc2) mc4) mc3) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__303))) Base_dData_dList.C_Base_dData_dList_dList_Nil) body) mc6))) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinlineAliases mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__303)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : string Base_dData_dList.t_Base_dData_dList_dList) (mc6 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, dtb__306) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__306) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__305) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__305) mc3)) mc6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defTbl) facts) comp) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 554 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfBinds = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__307, dtb__308) -> (match dtb__307 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__309; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__310 } -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__309)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfBinds dtb__308))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__311, dtb__312, dtb__313) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesParts mc0) mc1) dtb__312)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__314, dtb__315, dtb__316) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__314)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__315))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (dtb__317, dtb__318, dtb__319) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__317)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__320, dtb__321, dtb__322) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__321)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__323, dtb__324, dtb__325, dtb__326) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__324)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__325))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (dtb__327, dtb__328) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__327)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__329, dtb__330, dtb__331, dtb__332) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__330)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__331))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__333, dtb__334) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesStmts mc0) mc1) dtb__333)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__335, dtb__336, dtb__337) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__335)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesFields mc0) mc1) dtb__336))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__338, dtb__339, dtb__340) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesFields mc0) mc1) dtb__339)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__341, dtb__342, dtb__343) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__341)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__344, dtb__345, dtb__346, dtb__347) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__344)) ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__345)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__346)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__348, dtb__349, dtb__350) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__348)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesAlts mc0) mc1) dtb__349))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__351, dtb__352) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesClauses mc0) mc1) dtb__351)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__353, dtb__354, dtb__355, dtb__356) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesBinds mc0) mc1) dtb__353)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfBinds dtb__353)) mc1)) dtb__354))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__360)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__361))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__363, dtb__364, dtb__365) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__363)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesArgs mc0) mc1) dtb__364))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__366, dtb__367, dtb__368) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__366)) mc1)) dtb__367)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__369, dtb__370) -> ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) mc1) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dbasesUpTo (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf mc0)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__371) -> (match dtb__371 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__372; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__373 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__372, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict name) mc0))) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__369))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))
# 598 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesArgs = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__374, dtb__375) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__374)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesArgs mc0) mc1) dtb__375))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 603 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesFields = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__376, dtb__377) -> (match dtb__376 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__378; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__379 } -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__379)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesFields mc0) mc1) dtb__377))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 608 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesBinds = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__380, dtb__381) -> (match dtb__380 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__382; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__383 } -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__383)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesBinds mc0) mc1) dtb__381))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 613 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesAlts = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__384, dtb__385) -> (match dtb__384 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__386; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__387 } -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__386)) mc1)) dtb__387)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesAlts mc0) mc1) dtb__385))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 618 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesClauses = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__388, dtb__389) -> (match dtb__388 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__390; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__391 } -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOfPats dtb__390)) mc1)) dtb__391)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesClauses mc0) mc1) dtb__389))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 625 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesStmts = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__392, dtb__393) -> (match dtb__392 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__394, dtb__395, dtb__396) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__395)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesStmts mc0) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dScc_dpatNamesOf dtb__394)) mc1)) dtb__393))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__397, dtb__398) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__397)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesStmts mc0) mc1) dtb__393))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 633 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesParts = (fun (mc0 : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dInterpPart Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__399, dtb__400) -> (match dtb__399 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__401) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesParts mc0) mc1) dtb__400)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole (dtb__402) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo mc0) mc1) dtb__402)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesParts mc0) mc1) dtb__400))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dargBases = (fun (sizes : (string, (int, (int, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_ddedupBases (((v_Vuna_dCompiler_dElab_dTermination_dScc_dargBasesGo sizes) Base_dData_dList.C_Base_dData_dList_dList_Nil) e)))

# 641 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdgesJ = (fun (arity : int) (i : int) -> (if (arity <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = i; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = (arity - 1); f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = false }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdgesJ (arity - 1)) i)))))

# 645 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdgesI = (fun (i : int) (arity : int) -> (if (i <= 0) then (if (i = 0) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdgesJ arity) 0) else Base_dData_dList.C_Base_dData_dList_dList_Nil) else ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdgesJ arity) i)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdgesI (i - 1)) arity))))

# 652 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdges = (fun (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdgesI ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) defTbl)) - 1)) (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) defTbl))))

# 658 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun (i : int) (j : int) (deps : int Base_dData_dList.t_Base_dData_dList_dList) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) j) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__403) -> (match ((((((((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__403) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes) ctors) projs) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) facts) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteRegion) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__404) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = i; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = j; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__404) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasBase i) deps) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom = i; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo = j; f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge = false }, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 668 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dnthDeps = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__405, dtb__406) -> (if (mc1 <= 0) then dtb__405 else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dnthDeps dtb__406) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 672 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun (i : int) (count : int) (deps : int Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (if (count <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dappend (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) (count - 1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dnthDeps deps) (count - 1))) s) ctors) projs) facts)) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (count - 1)) deps) s) ctors) projs) facts))))

# 681 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun (i : int) (deps : int Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (if (i <= 0) then (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (Base_dData_dList.v_Base_dData_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) deps) s) ctors) projs) facts) else ((Base_dData_dList.v_Base_dData_dList_dappend (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (Base_dData_dList.v_Base_dData_dList_dlength (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) deps) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (i - 1)) deps) s) ctors) projs) facts))))

# 690 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) -> (if (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteBlind then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dblindEdges defTbl) s) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes)) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dTermination_dScc_dargBases (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteSizes)) (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs)) s) ctors) projs) facts)))

# 700 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun (mc0 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc5 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : bool) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__407, dtb__408) -> (if mc6 then (match ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd (dtb__407).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) (dtb__407).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc0) mc2) mc3) mc4) dtb__407)) mc5) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__409; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__410 } -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo mc0) dtb__408) mc2) mc3) mc4) dtb__409) dtb__410)
  | _ -> failwith "DT: impossible branch"
) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc5; Base_dData_dPair.f_Base_dData_dPair_dPair_second = false })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc5; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc6 }
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sites : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo defTbl) sites) ctors) projs) facts) Base_dData_dList.C_Base_dData_dList_dList_Nil) true))

# 713 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel = 240

# 717 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__411, dtb__412) -> (match dtb__411 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__413; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__414 } -> (match dtb__413 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__415; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__416 } -> (if (dtb__415 = dtb__416) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__414) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__412) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__412))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__417, dtb__418) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__417) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__418) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__418))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__419, dtb__420) -> (match dtb__419 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__421; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__422 } -> (match dtb__421 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__423; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__424 } -> (if (dtb__423 = dtb__424) then ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__423) dtb__422)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__420)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__420))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 734 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun (e : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->>"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

# 737 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun (e : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> (String.concat "" [(bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeFrom); "->"; (bi_strFromInt (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_edgeTo)]))

# 731 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun (e : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge) -> (if (e).f_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_scStrictEdge then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

# 740 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun (mc0 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__425, dtb__426) -> (match dtb__426 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__425)
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__425); ","; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__426)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__427, dtb__428) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__427) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__428) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" [mc0; "{"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__427); "}"]), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__428))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 750 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__429, dtb__430) -> (match dtb__429 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__431; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__432 } -> (match dtb__431 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__433; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__434 } -> (if (dtb__433 = dtb__434) then ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__433) dtb__432)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__430)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__430))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun (table : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

# 760 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_disBlindSite = (fun (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) -> (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteBlind)

# 763 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dblindPairText = (fun (s : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) -> (String.concat "" [(s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller; "->"; (s).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee]))

# 766 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBlindNote = (fun (sites : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dScc_dblindPairText) ((Base_dData_dList.v_Base_dData_dList_dfilter v_Vuna_dCompiler_dElab_dTermination_dScc_disBlindSite) sites))) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | dtb__435 -> (String.concat "" [" [SCT \230\156\170\232\175\134\229\136\171\232\176\131\231\148\168\239\188\154"; (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma dtb__435); "\239\188\136callee \228\187\165\229\128\188\228\188\160\233\128\146\230\136\150\233\129\141\229\142\134\233\162\132\231\174\151\232\128\151\229\176\189\239\188\140\229\143\170\230\140\137\229\188\177\232\190\185\232\174\161\229\133\165\239\188\137]"])
))

# 778 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcountGraphs = (fun (mc0 : ((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__436, dtb__437) -> (match dtb__436 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__438; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__439 } -> ((Base_dData_dList.v_Base_dData_dList_dlength dtb__439) + (v_Vuna_dCompiler_dElab_dTermination_dScc_dcountGraphs dtb__437))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 782 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckGo = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (msg : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> ((fun sites -> ((fun note -> ((fun _u -> ((fun _u -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable defTbl) sites) ctors) projs) facts) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__440; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__441 } -> (if dtb__441 then ((fun _u -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__442; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__443 } -> (match dtb__443 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__444; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__445 } -> ((fun _u -> ((fun _u -> (if dtb__444 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__442) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage note) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__442); "]"])) msg))))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage note) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))) ((Base_dData_dObs.v_Base_dData_dObs_dobsCounter "vuna.counter.term.graphs_final") (v_Vuna_dCompiler_dElab_dTermination_dScc_dcountGraphs dtb__442)))) ((Base_dData_dObs.v_Base_dData_dObs_dobsCounter "vuna.counter.term.closure_rounds") (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel - dtb__445)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__440) v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel))) ((Base_dData_dObs.v_Base_dData_dObs_dobsCounter "vuna.counter.term.graphs") (v_Vuna_dCompiler_dElab_dTermination_dScc_dcountGraphs dtb__440))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage note) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_Vuna_dCompiler_dElab_dTermination_dScc_dsctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dObs.v_Base_dData_dObs_dobsCounter "vuna.counter.term.sites") (Base_dData_dList.v_Base_dData_dList_dlength sites)))) ((Base_dData_dObs.v_Base_dData_dObs_dobsCounter "vuna.counter.term.scc_size") (Base_dData_dList.v_Base_dData_dList_dlength comp)))) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBlindNote sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))

# 773 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (msg : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.term.sct") (fun (_u : int) -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckGo comp) defTbl) ctors) projs) facts) msg))))

# 810 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__446, dtb__447) -> (match dtb__446 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__448, dtb__449) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__448, (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf dtb__447)))
  | _ -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf dtb__447)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 817 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__450, dtb__451) -> (match dtb__450 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__452, dtb__453) -> (if (dtb__452 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo dtb__451) mc1) (mc2 + 1)))
  | _ -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo dtb__451) mc1) (mc2 + 1))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 824 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__454, dtb__455, dtb__456, dtb__457) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__454) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__458) -> (dtb__458 = mc0)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 831 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dguardParamGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__459, dtb__460) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__459) mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__459)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dguardParamGo dtb__460) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 836 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf = (fun (name : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__461, dtb__462) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dguardParamGo (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__461))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__461))
  | _ -> failwith "DT: impossible branch"
))

# 844 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamIndexOf = (fun (callee : string) (callerFuel : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl callee) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__463, dtb__464) -> ((fun pats -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf callee) defTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__465) -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo pats) dtb__465) 0)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamIndexGo pats) callerFuel) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__466) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__466))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__463))
  | _ -> failwith "DT: impossible branch"
))

# 858 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dcallerFuelName = (fun (name : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf name) defTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__467) -> dtb__467
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__468, dtb__469) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__468)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__470, dtb__471) -> dtb__470
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 870 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dparamsOf = (fun (name : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__472, dtb__473) -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dparamNamesOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__472))
  | _ -> failwith "DT: impossible branch"
))

# 879 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun (callerParams : string Base_dData_dList.t_Base_dData_dList_dList) (callerGuard : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (calleeIdx : int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (site : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite) -> (match calleeIdx with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__474) -> (match ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (site).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteArgs) dtb__474) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__475) -> (match callerGuard with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__476, dtb__477, dtb__478) -> (match dtb__476 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__479, dtb__480) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__479)) then ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__481, dtb__482) -> (match dtb__481 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__483, dtb__484) -> (match dtb__482 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__485, dtb__486) -> (match dtb__485 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__487, dtb__488) -> (match dtb__486 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (if (dtb__487 > 0) then ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__483)) callerParams) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (true)) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)) dtb__477) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false))
)) dtb__475)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__489) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__490, dtb__491, dtb__492) -> (match dtb__490 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__493, dtb__494) -> (if (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__493)) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__495, dtb__496) -> (match dtb__495 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__497, dtb__498) -> (match dtb__496 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__499, dtb__500) -> (match dtb__499 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__501, dtb__502) -> (match dtb__500 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__497) = dtb__489) then (if (dtb__501 > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (true)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__491) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__503, dtb__504) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__503) = dtb__489) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (false)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__475)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 915 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__505, dtb__506) -> ((fun inGroup -> ((fun mode -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__506) acc2)) (if inGroup then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__505).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__505).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mode }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 } }, mc3)) else mc3))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__507) -> (if dtb__507 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dparamsOf (dtb__505).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf (dtb__505).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamIndexOf (dtb__505).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcallerFuelName (dtb__505).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCaller) mc1)) mc1)) dtb__505)))) ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__505).f_Vuna_dCompiler_dElab_dTermination_dScc_dSite_siteCallee) mc0))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 910 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sites : t_Vuna_dCompiler_dElab_dTermination_dScc_dSite Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defTbl) sites) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 933 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dmemberGuarded = (fun (f : string) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelParamNameOf f) defTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__508) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 939 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__509, dtb__510) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dmemberGuarded dtb__509) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf dtb__510) mc1) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__509, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf dtb__510) mc1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 945 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges = (fun (mc0 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__511, dtb__512) -> (match dtb__511 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__513; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__514 } -> (match dtb__513 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__515; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__516 } -> (match dtb__515 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__517; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__518 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__517; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__518 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = 0 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__514 }, (v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges dtb__512)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 950 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__519, dtb__520) -> (match dtb__519 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__521; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__522 } -> (match dtb__521 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__523; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__524 } -> (match dtb__523 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__525; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__526 } -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__525) mc0) then (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__526) mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__525; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__526 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__524 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__522 }, ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__520))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__520)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded mc0) dtb__520))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedCycle = (fun (unguarded : string Base_dData_dList.t_Base_dData_dList_dList) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle unguarded) (v_Vuna_dCompiler_dElab_dTermination_dScc_dallWeakEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_donlyUnguarded unguarded) edges))))

# 969 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelAcceptable = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (edges : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedOf comp) defTbl) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | dtb__527 -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dunguardedCycle dtb__527) edges) then false else true)
))

# 987 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf = (fun (mc0 : (((string, string) Base_dData_dPair.t_Base_dData_dPair_dPair, int) Base_dData_dPair.t_Base_dData_dPair_dPair, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__528; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__529 } -> (match dtb__528 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__530; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__531 } -> (match dtb__530 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__532; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__533 } -> dtb__531
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 975 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun (comp : string Base_dData_dList.t_Base_dData_dList_dList) (defTbl : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (ctors : string Base_dData_dList.t_Base_dData_dList_dList) (projs : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (msg : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if (if (if (strictCount > 0) then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelAcceptable comp) defTbl) edges) else false) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges)) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (msg)))) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defTbl) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))
