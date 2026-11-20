open Vuna_runtime
type t_Site = { f_Site_siteCaller : string; f_Site_siteCallee : string; f_Site_siteArgs : Frontend_dRast.t_Expr B_dData_dList.t_List; f_Site_siteSizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Site_siteRegion : string B_dData_dList.t_List; f_Site_siteBlind : bool }
and t_ScEdge = { f_ScEdge_edgeFrom : int; f_ScEdge_edgeTo : int; f_ScEdge_scStrictEdge : bool }

# 25 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindSitesOf = (fun (comp : string B_dData_dList.t_List) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (g : string) -> { f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = true })) comp))

# 33 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectList = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__1) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__0) mc9)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 52 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__3) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__5) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 71 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dRast.t_Expr) (mc9 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : t_Site B_dData_dList.t_List) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc10) else (((((((((((v_siteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__7) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Elab_dTermination_dMeasure.v_extendSizesStrict mc6) mc8) dtb__8)) mc7) dtb__9) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 91 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Elab_dTermination_dMeasure.v_extendSizesStrict mc6) dtb__13) dtb__12)) mc7) dtb__11) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__13) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 110 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectStmts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else (match dtb__14 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__16, dtb__17, dtb__18) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Elab_dTermination_dMeasure.v_extendSizesStrict mc6) dtb__17) dtb__16)) mc7) dtb__15) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__19, dtb__20) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__15) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 121 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkC = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (match e with
  | Frontend_dRast.C_Expr_EApp (dtb__21, dtb__22, dtb__23) -> (((((((((((v_siteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__21) dtb__22) acc)
  | Frontend_dRast.C_Expr_ECase (dtb__24, dtb__25, dtb__26) -> (((((((((((v_siteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__24) dtb__25) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__24) acc))
  | Frontend_dRast.C_Expr_EIf (dtb__27, dtb__28, dtb__29, dtb__30) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb__27)) region)) dtb__29) acc2)) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb__27)) region)) dtb__28) acc1))) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__27) acc))
  | Frontend_dRast.C_Expr_ELam (dtb__31, dtb__32, dtb__33) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) acc)
  | Frontend_dRast.C_Expr_ELet (dtb__34, dtb__35, dtb__36, dtb__37) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) ((Elab_dTermination_dMeasure.v_extendByBinds dtb__34) sizes)) region) dtb__35) ((((((((((v_siteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__34) acc))
  | Frontend_dRast.C_Expr_EPi (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__42) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__41) acc))
  | Frontend_dRast.C_Expr_EField (dtb__44, dtb__45, dtb__46) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__44) acc)
  | Frontend_dRast.C_Expr_ERecord (dtb__47, dtb__48, dtb__49) -> ((((((((((v_siteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__48) acc)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__50, dtb__51, dtb__52) -> ((((((((((v_siteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__51) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__50) acc))
  | Frontend_dRast.C_Expr_EDo (dtb__53, dtb__54) -> ((((((((((v_siteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) acc)
  | Frontend_dRast.C_Expr_EAnn (dtb__55, dtb__56, dtb__57) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__56) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__55) acc))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__58, dtb__59) -> ((((((((((v_siteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Elab_dTermination_dMeasure.v_localClauseBinds dtb__58)) acc)
  | Frontend_dRast.C_Expr_EVar (dtb__60, dtb__61) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__60)) comp) then (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = (Frontend_dRast_dName.v_rnameKey dtb__60); f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = true }, acc)) else acc)
  | _ -> acc
)))
# 148 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = dtb__62; f_Site_siteArgs = args; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__63, dtb__64) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__63) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__65) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) (dtb__66).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)) (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__66).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__66).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder))) ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (dtb__66).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__65).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then (((((((((((v_siteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
# 170 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__68 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | B_dData_dList.C_List_Nil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Frontend_dRast.C_Expr_EVar (dtb__71, dtb__72) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__71)) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Frontend_dRast_dName.v_rnameKey dtb__71)) B_dData_dList.C_List_Nil) dtb__69) dtb__72) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Frontend_dRast.C_Expr_EApp (dtb__73, dtb__74, dtb__75) -> (match dtb__73 with
  | Frontend_dRast.C_Expr_EVar (dtb__76, dtb__77) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__76)) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Frontend_dRast_dName.v_rnameKey dtb__76)) dtb__74) dtb__69) dtb__75) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__67)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))
# 183 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dRast.t_Expr B_dData_dList.t_List) (lst : Frontend_dRast.t_Expr) (cbsp : Base_dSource.t_Span) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = fullArgs; f_Site_siteSizes = elems; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc2))) ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "$elem"), cbsp)), B_dData_dList.C_List_Nil))))) (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem"))) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))

# 199 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasNameOf = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))

# 202 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_lookupAlias = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | { B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 } -> (if (mc0 = dtb__80) then (B_dData_dMaybe.C_Maybe_Just (dtb__81)) else ((v_lookupAlias mc0) dtb__79))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dropAliases = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> ((v_dropAliases dtb__83) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((v_aliasNameOf p) <> dtb__82))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__84; B_dData_dPair.f_Pair_second = dtb__85 } -> (match dtb__84 with
  | Frontend_dRast.C_Pat_PVar (dtb__86, dtb__87) -> (match dtb__85 with
  | Frontend_dRast.C_Expr_EVar (dtb__88, dtb__89) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__88)) mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = (Frontend_dRast_dName.v_rnameKey dtb__88) })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scIsStrict = (fun (m : int) -> (m <> 0))

# 332 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_maxBaseOf = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (match dtb__95 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> ((Elab_dTermination_dMeasure.v_maxInt dtb__94) (v_maxBaseOf dtb__91))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_insertEdge = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (if ((mc0).f_ScEdge_edgeFrom < (dtb__98).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99)))) else (if ((mc0).f_ScEdge_edgeFrom = (dtb__98).f_ScEdge_edgeFrom) then (if ((mc0).f_ScEdge_edgeTo <= (dtb__98).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99)))) else (B_dData_dList.C_List__x58__x58_ (dtb__98, ((v_insertEdge mc0) dtb__99)))) else (B_dData_dList.C_List__x58__x58_ (dtb__98, ((v_insertEdge mc0) dtb__99)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sortEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> ((v_insertEdge dtb__100) (v_sortEdges dtb__101))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_mergeStrict = (fun (a : t_ScEdge) (b : t_ScEdge) -> { f_ScEdge_edgeFrom = (a).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (a).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (a).f_ScEdge_scStrictEdge then true else (b).f_ScEdge_scStrictEdge) })

# 353 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_compactEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match dtb__103 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__102, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (if ((dtb__102).f_ScEdge_edgeFrom = (dtb__104).f_ScEdge_edgeFrom) then (if ((dtb__102).f_ScEdge_edgeTo = (dtb__104).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (((v_mergeStrict dtb__102) dtb__104), (v_compactEdges dtb__105))) else (B_dData_dList.C_List__x58__x58_ (dtb__102, (v_compactEdges dtb__103)))) else (B_dData_dList.C_List__x58__x58_ (dtb__102, (v_compactEdges dtb__103))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_canonEdges = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (v_compactEdges (v_sortEdges edges)))

# 367 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesEqCanon = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (if ((dtb__108).f_ScEdge_edgeFrom = (dtb__110).f_ScEdge_edgeFrom) then (if ((dtb__108).f_ScEdge_edgeTo = (dtb__110).f_ScEdge_edgeTo) then (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) (dtb__108).f_ScEdge_scStrictEdge) (dtb__110).f_ScEdge_scStrictEdge) then ((v_edgesEqCanon dtb__109) dtb__111) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgesEq = (fun (a : t_ScEdge B_dData_dList.t_List) (b : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEqCanon (v_canonEdges a)) (v_canonEdges b)))

# 383 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_combineWith = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (if ((mc0).f_ScEdge_edgeTo = (dtb__112).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = (mc0).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (dtb__112).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (mc0).f_ScEdge_scStrictEdge then true else (dtb__112).f_ScEdge_scStrictEdge) }, ((v_combineWith mc0) dtb__113))) else ((v_combineWith mc0) dtb__113))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_composeGo = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> ((B_dData_dList.v_append ((v_combineWith dtb__114) mc1)) ((v_composeGo dtb__115) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_composeEdges = (fun (g1 : t_ScEdge B_dData_dList.t_List) (g2 : t_ScEdge B_dData_dList.t_List) -> (v_canonEdges ((v_composeGo g1) g2)))

# 399 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasStrict = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (if (dtb__116).f_ScEdge_scStrictEdge then true else (v_hasStrict dtb__117))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphIdempotent = (fun (edges : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEq ((v_composeEdges edges) edges)) edges))

# 408 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphOK = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (if (v_graphIdempotent edges) then (v_hasStrict edges) else true))

# 411 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphsOK = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (if (v_graphOK dtb__118) then (v_graphsOK dtb__119) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableGraphCap = 512

# 421 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableLookup = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> (if ((B_dData_dPair.v_firstOf mc0) = (B_dData_dPair.v_firstOf dtb__122)) then (if ((B_dData_dPair.v_secondOf mc0) = (B_dData_dPair.v_secondOf dtb__122)) then (B_dData_dMaybe.C_Maybe_Just (dtb__123)) else ((v_tableLookup mc0) dtb__121)) else ((v_tableLookup mc0) dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListHas = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (if ((v_edgesEq mc0) dtb__124) then true else ((v_graphListHas mc0) dtb__125))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListSubset = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (if ((v_graphListHas dtb__126) mc1) then ((v_graphListSubset dtb__127) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 437 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableAddPair = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (match dtb__128 with
  | { B_dData_dPair.f_Pair_first = dtb__130; B_dData_dPair.f_Pair_second = dtb__131 } -> (match dtb__130 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (if (mc0 = dtb__132) then (if (mc1 = dtb__133) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, dtb__131)) }, dtb__129)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 }; B_dData_dPair.f_Pair_second = dtb__131 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__129)))) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 }; B_dData_dPair.f_Pair_second = dtb__131 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__129))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableAdd = (fun (f : string) (g : string) (edges : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_tableLookup { B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = g }) table) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (if ((v_graphListHas edges) dtb__134) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = true } else (if ((B_dData_dList.v_length dtb__134) >= v_tableGraphCap) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = false } else { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepHs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__137; B_dData_dPair.f_Pair_second = dtb__138 } -> (if dtb__138 then (((((v_closureStepHs mc0) mc1) mc2) dtb__136) dtb__137) else { B_dData_dPair.f_Pair_first = dtb__137; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) ((((v_tableAdd mc0) mc1) ((v_composeEdges mc2) dtb__135)) mc4))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepOneGo = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (match dtb__139 with
  | { B_dData_dPair.f_Pair_first = dtb__141; B_dData_dPair.f_Pair_second = dtb__142 } -> (match dtb__141 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (if (dtb__143 = mc1) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> (if dtb__146 then ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__140) dtb__145) dtb__146) else { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_closureStepHs mc0) dtb__144) mc2) dtb__142) mc4)) else ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__140) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStepOne = (fun (f : string) (g : string) (a : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_closureStepOneGo f) g) a) table) acc) true))

# 483 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGraphs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (if dtb__150 then (((((v_closureStepGraphs mc0) mc1) dtb__148) mc3) dtb__149) else { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_closureStepOne mc0) mc1) dtb__147) mc3) mc4))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGo = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | { B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = dtb__154 } -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> (if dtb__158 then (((v_closureStepGo dtb__152) mc1) dtb__157) else { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) (((((v_closureStepGraphs dtb__155) dtb__156) dtb__154) mc1) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStep = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_closureStepGo table) table) table))

# 503 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableSubset = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match dtb__159 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (match ((v_tableLookup dtb__161) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> (if ((v_graphListSubset dtb__162) dtb__163) then ((v_tableSubset dtb__160) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableSame = (fun (a : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_tableSubset a) b) else false))

# 510 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureLoop = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } } else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 } -> (if dtb__165 then (if ((v_tableSame table) dtb__164) then { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = fuel } } else ((v_closureLoop dtb__164) (fuel - 1))) else { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } })
  | _ -> failwith "DT: impossible branch"
)) (v_closureStep table))))

# 528 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_basesUpToGo = (fun (i : int) (acc : int B_dData_dList.t_List) -> (if (i <= 0) then (B_dData_dList.C_List__x58__x58_ (0, acc)) else ((v_basesUpToGo (i - 1)) (B_dData_dList.C_List__x58__x58_ (i, acc)))))

# 531 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_basesUpTo = (fun (n : int) -> (if (n < 0) then B_dData_dList.C_List_Nil else ((v_basesUpToGo n) B_dData_dList.C_List_Nil)))

# 534 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasBase = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (if (mc0 = dtb__166) then true else ((v_hasBase mc0) dtb__167))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dedupBases = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (if ((v_hasBase dtb__168) dtb__169) then (v_dedupBases dtb__169) else (B_dData_dList.C_List__x58__x58_ (dtb__168, (v_dedupBases dtb__169))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOf = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__170, dtb__171, dtb__172) -> (v_patNamesOfFields dtb__171)
  | Frontend_dRast.C_Pat_PCon (dtb__173, dtb__174, dtb__175) -> (v_patNamesOfPats dtb__174)
  | Frontend_dRast.C_Pat_PAs (dtb__176, dtb__177, dtb__178) -> (B_dData_dList.C_List__x58__x58_ (dtb__176, (v_patNamesOf dtb__177)))
  | Frontend_dRast.C_Pat_PVar (dtb__179, dtb__180) -> (B_dData_dList.C_List__x58__x58_ (dtb__179, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 549 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfPats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> ((B_dData_dList.v_append (v_patNamesOf dtb__181)) (v_patNamesOfPats dtb__182))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 553 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfFields = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (match dtb__183 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> ((B_dData_dList.v_append (v_patNamesOf dtb__186)) (v_patNamesOfFields dtb__184))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_inlArgs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (B_dData_dList.C_List__x58__x58_ ((((v_inlGo mc0) mc1) dtb__187), (((v_inlArgs mc0) mc1) dtb__188)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 221 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlFields = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (match dtb__189 with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) mc1) dtb__192) }, (((v_inlFields mc0) mc1) dtb__190)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 225 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlParts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (match dtb__193 with
  | Frontend_dRast.C_InterpPart_IPText (dtb__195) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPText (dtb__195)), (((v_inlParts mc0) mc1) dtb__194)))
  | Frontend_dRast.C_InterpPart_IPHole (dtb__196) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPHole ((((v_inlGo mc0) mc1) dtb__196))), (((v_inlParts mc0) mc1) dtb__194)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 232 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (match dtb__197 with
  | { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } -> ((fun rhs -> (match ((v_aliasOf mc0) { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = rhs }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__201) -> ((fun restP -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf restP); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) }) (((v_inlBinds mc0) (B_dData_dList.C_List__x58__x58_ (dtb__201, mc1))) dtb__198))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun restP -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = rhs }, (B_dData_dPair.v_firstOf restP))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) }) (((v_inlBinds mc0) ((v_dropAliases (v_patNamesOf dtb__199)) mc1)) dtb__198))
  | _ -> failwith "DT: impossible branch"
)) (((v_inlGo mc0) mc1) dtb__200))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))
# 249 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlAlts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (match dtb__202 with
  | { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) ((v_dropAliases (v_patNamesOf dtb__204)) mc1)) dtb__205) }, (((v_inlAlts mc0) mc1) dtb__203)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 254 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> (match dtb__206 with
  | { B_dData_dPair.f_Pair_first = dtb__208; B_dData_dPair.f_Pair_second = dtb__209 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__208; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) ((v_dropAliases (v_patNamesOfPats dtb__208)) mc1)) dtb__209) }, (((v_inlClauses mc0) mc1) dtb__207)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 259 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlStmts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (match dtb__210 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__212, dtb__213, dtb__214) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DBind (dtb__212, (((v_inlGo mc0) mc1) dtb__213), dtb__214)), (((v_inlStmts mc0) ((v_dropAliases (v_patNamesOf dtb__212)) mc1)) dtb__211)))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__215, dtb__216) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DExpr ((((v_inlGo mc0) mc1) dtb__215), dtb__216)), (((v_inlStmts mc0) mc1) dtb__211)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 267 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) -> (match mc2 with
  | Frontend_dRast.C_Expr_EInterp (dtb__217, dtb__218, dtb__219) -> (Frontend_dRast.C_Expr_EInterp (dtb__217, (((v_inlParts mc0) mc1) dtb__218), dtb__219))
  | Frontend_dRast.C_Expr_EAnn (dtb__220, dtb__221, dtb__222) -> (Frontend_dRast.C_Expr_EAnn ((((v_inlGo mc0) mc1) dtb__220), (((v_inlGo mc0) mc1) dtb__221), dtb__222))
  | Frontend_dRast.C_Expr_ESectR (dtb__223, dtb__224, dtb__225) -> (Frontend_dRast.C_Expr_ESectR ((((v_inlGo mc0) mc1) dtb__223), dtb__224, dtb__225))
  | Frontend_dRast.C_Expr_ESectL (dtb__226, dtb__227, dtb__228) -> (Frontend_dRast.C_Expr_ESectL (dtb__226, (((v_inlGo mc0) mc1) dtb__227), dtb__228))
  | Frontend_dRast.C_Expr_EBacktick (dtb__229, dtb__230, dtb__231, dtb__232) -> (Frontend_dRast.C_Expr_EBacktick (dtb__229, (((v_inlGo mc0) mc1) dtb__230), (((v_inlGo mc0) mc1) dtb__231), dtb__232))
  | Frontend_dRast.C_Expr_EParen (dtb__233, dtb__234) -> (Frontend_dRast.C_Expr_EParen ((((v_inlGo mc0) mc1) dtb__233), dtb__234))
  | Frontend_dRast.C_Expr_EInfix (dtb__235, dtb__236, dtb__237, dtb__238) -> (Frontend_dRast.C_Expr_EInfix (dtb__235, (((v_inlGo mc0) mc1) dtb__236), (((v_inlGo mc0) mc1) dtb__237), dtb__238))
  | Frontend_dRast.C_Expr_EDo (dtb__239, dtb__240) -> (Frontend_dRast.C_Expr_EDo ((((v_inlStmts mc0) mc1) dtb__239), dtb__240))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__241, dtb__242, dtb__243) -> (Frontend_dRast.C_Expr_ERecUpdate ((((v_inlGo mc0) mc1) dtb__241), (((v_inlFields mc0) mc1) dtb__242), dtb__243))
  | Frontend_dRast.C_Expr_ERecord (dtb__244, dtb__245, dtb__246) -> (Frontend_dRast.C_Expr_ERecord (dtb__244, (((v_inlFields mc0) mc1) dtb__245), dtb__246))
  | Frontend_dRast.C_Expr_EField (dtb__247, dtb__248, dtb__249) -> (Frontend_dRast.C_Expr_EField ((((v_inlGo mc0) mc1) dtb__247), dtb__248, dtb__249))
  | Frontend_dRast.C_Expr_EIf (dtb__250, dtb__251, dtb__252, dtb__253) -> (Frontend_dRast.C_Expr_EIf ((((v_inlGo mc0) mc1) dtb__250), (((v_inlGo mc0) mc1) dtb__251), (((v_inlGo mc0) mc1) dtb__252), dtb__253))
  | Frontend_dRast.C_Expr_ECase (dtb__254, dtb__255, dtb__256) -> (Frontend_dRast.C_Expr_ECase ((((v_inlGo mc0) mc1) dtb__254), (((v_inlAlts mc0) mc1) dtb__255), dtb__256))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__257, dtb__258) -> (Frontend_dRast.C_Expr_ELocalFun ((((v_inlClauses mc0) mc1) dtb__257), dtb__258))
  | Frontend_dRast.C_Expr_ELet (dtb__259, dtb__260, dtb__261, dtb__262) -> ((fun p -> (Frontend_dRast.C_Expr_ELet ((B_dData_dPair.v_firstOf p), (((v_inlGo mc0) (B_dData_dPair.v_secondOf p)) dtb__260), dtb__261, dtb__262))) (((v_inlBinds mc0) mc1) dtb__259))
  | Frontend_dRast.C_Expr_EPi (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267, dtb__268) -> (Frontend_dRast.C_Expr_EPi (dtb__263, dtb__264, dtb__265, (((v_inlGo mc0) mc1) dtb__266), (((v_inlGo mc0) ((v_dropAliases (B_dData_dList.C_List__x58__x58_ (dtb__263, B_dData_dList.C_List_Nil))) mc1)) dtb__267), dtb__268))
  | Frontend_dRast.C_Expr_EApp (dtb__269, dtb__270, dtb__271) -> (Frontend_dRast.C_Expr_EApp ((((v_inlGo mc0) mc1) dtb__269), (((v_inlArgs mc0) mc1) dtb__270), dtb__271))
  | Frontend_dRast.C_Expr_ELam (dtb__272, dtb__273, dtb__274) -> (Frontend_dRast.C_Expr_ELam (dtb__272, (((v_inlGo mc0) ((v_dropAliases ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__272)) mc1)) dtb__273), dtb__274))
  | Frontend_dRast.C_Expr_EVar (dtb__275, dtb__276) -> (match ((v_lookupAlias (Frontend_dRast_dName.v_rnameKey dtb__275)) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__277) -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__277), dtb__276))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar (dtb__275, dtb__276))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 297 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_inlineAliases = (fun (comp : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (((v_inlGo comp) B_dData_dList.C_List_Nil) e))

# 300 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string) (mc5 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__278, dtb__279) -> ((fun body -> (((((((v_siteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__279) ((((((((((v_siteWalkC ((Frontend_dRast.v_exprBudget 32) body)) mc0) mc1) mc2) mc4) mc3) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf dtb__278))) B_dData_dList.C_List_Nil) body) mc6))) ((v_inlineAliases mc0) (B_dData_dPair.v_secondOf dtb__278)))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> (((((((v_siteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__281) (((((((v_siteCollectClauses mc0) mc1) mc2) mc4) dtb__280) ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__280) mc3)) mc6))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCollect = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_siteCollectGo comp) ctors) projs) defTbl) facts) comp) B_dData_dList.C_List_Nil))

# 557 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOfBinds = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__282, dtb__283) -> (match dtb__282 with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> ((B_dData_dList.v_append (v_patNamesOf dtb__284)) (v_patNamesOfBinds dtb__283))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_argBasesGo = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) -> (match mc2 with
  | Frontend_dRast.C_Expr_EInterp (dtb__286, dtb__287, dtb__288) -> (((v_argBasesParts mc0) mc1) dtb__287)
  | Frontend_dRast.C_Expr_EAnn (dtb__289, dtb__290, dtb__291) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__289)) (((v_argBasesGo mc0) mc1) dtb__290))
  | Frontend_dRast.C_Expr_ESectR (dtb__292, dtb__293, dtb__294) -> (((v_argBasesGo mc0) mc1) dtb__292)
  | Frontend_dRast.C_Expr_ESectL (dtb__295, dtb__296, dtb__297) -> (((v_argBasesGo mc0) mc1) dtb__296)
  | Frontend_dRast.C_Expr_EBacktick (dtb__298, dtb__299, dtb__300, dtb__301) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__299)) (((v_argBasesGo mc0) mc1) dtb__300))
  | Frontend_dRast.C_Expr_EParen (dtb__302, dtb__303) -> (((v_argBasesGo mc0) mc1) dtb__302)
  | Frontend_dRast.C_Expr_EInfix (dtb__304, dtb__305, dtb__306, dtb__307) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__305)) (((v_argBasesGo mc0) mc1) dtb__306))
  | Frontend_dRast.C_Expr_EDo (dtb__308, dtb__309) -> (((v_argBasesStmts mc0) mc1) dtb__308)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__310, dtb__311, dtb__312) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__310)) (((v_argBasesFields mc0) mc1) dtb__311))
  | Frontend_dRast.C_Expr_ERecord (dtb__313, dtb__314, dtb__315) -> (((v_argBasesFields mc0) mc1) dtb__314)
  | Frontend_dRast.C_Expr_EField (dtb__316, dtb__317, dtb__318) -> (((v_argBasesGo mc0) mc1) dtb__316)
  | Frontend_dRast.C_Expr_EIf (dtb__319, dtb__320, dtb__321, dtb__322) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__319)) ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__320)) (((v_argBasesGo mc0) mc1) dtb__321)))
  | Frontend_dRast.C_Expr_ECase (dtb__323, dtb__324, dtb__325) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__323)) (((v_argBasesAlts mc0) mc1) dtb__324))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__326, dtb__327) -> (((v_argBasesClauses mc0) mc1) dtb__326)
  | Frontend_dRast.C_Expr_ELet (dtb__328, dtb__329, dtb__330, dtb__331) -> ((B_dData_dList.v_append (((v_argBasesBinds mc0) mc1) dtb__328)) (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOfBinds dtb__328)) mc1)) dtb__329))
  | Frontend_dRast.C_Expr_EPi (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__335)) (((v_argBasesGo mc0) mc1) dtb__336))
  | Frontend_dRast.C_Expr_EApp (dtb__338, dtb__339, dtb__340) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__338)) (((v_argBasesArgs mc0) mc1) dtb__339))
  | Frontend_dRast.C_Expr_ELam (dtb__341, dtb__342, dtb__343) -> (((v_argBasesGo mc0) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__341)) mc1)) dtb__342)
  | Frontend_dRast.C_Expr_EVar (dtb__344, dtb__345) -> ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName name) mc1) then (v_basesUpTo (v_maxBaseOf mc0)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (match dtb__346 with
  | { B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__348 } -> (B_dData_dList.C_List__x58__x58_ (dtb__347, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Elab_dTermination_dMeasure.v_sizeOfVarStrict name) mc0))) (Frontend_dRast_dName.v_rnameKey dtb__344))
  | _ -> B_dData_dList.C_List_Nil
))
# 601 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesArgs = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__349)) (((v_argBasesArgs mc0) mc1) dtb__350))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 606 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesFields = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__351, dtb__352) -> (match dtb__351 with
  | { B_dData_dPair.f_Pair_first = dtb__353; B_dData_dPair.f_Pair_second = dtb__354 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__354)) (((v_argBasesFields mc0) mc1) dtb__352))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 611 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBinds = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__355, dtb__356) -> (match dtb__355 with
  | { B_dData_dPair.f_Pair_first = dtb__357; B_dData_dPair.f_Pair_second = dtb__358 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__358)) (((v_argBasesBinds mc0) mc1) dtb__356))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 616 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesAlts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (match dtb__359 with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOf dtb__361)) mc1)) dtb__362)) (((v_argBasesAlts mc0) mc1) dtb__360))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 621 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesClauses = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__363, dtb__364) -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOfPats dtb__365)) mc1)) dtb__366)) (((v_argBasesClauses mc0) mc1) dtb__364))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 628 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesStmts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> (match dtb__367 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__369, dtb__370, dtb__371) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__370)) (((v_argBasesStmts mc0) ((B_dData_dList.v_append (v_patNamesOf dtb__369)) mc1)) dtb__368))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__372, dtb__373) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__372)) (((v_argBasesStmts mc0) mc1) dtb__368))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 636 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesParts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__374, dtb__375) -> (match dtb__374 with
  | Frontend_dRast.C_InterpPart_IPText (dtb__376) -> (((v_argBasesParts mc0) mc1) dtb__375)
  | Frontend_dRast.C_InterpPart_IPHole (dtb__377) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__377)) (((v_argBasesParts mc0) mc1) dtb__375))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 525 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBases = (fun (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (v_dedupBases (((v_argBasesGo sizes) B_dData_dList.C_List_Nil) e)))

# 644 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesJ = (fun (arity : int) (i : int) -> (if (arity <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = (arity - 1); f_ScEdge_scStrictEdge = false }, ((v_blindEdgesJ (arity - 1)) i)))))

# 648 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesI = (fun (i : int) (arity : int) -> (if (i <= 0) then (if (i = 0) then ((v_blindEdgesJ arity) 0) else B_dData_dList.C_List_Nil) else ((B_dData_dList.v_append ((v_blindEdgesJ arity) i)) ((v_blindEdgesI (i - 1)) arity))))

# 655 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindEdges = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> ((v_blindEdgesI ((Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCaller) defTbl)) - 1)) (Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCallee) defTbl))))

# 661 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgeAt = (fun (i : int) (j : int) (deps : int B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (s).f_Site_siteArgs) j) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> (match ((((((((Elab_dTermination_dMeasure.v_relOfArg i) dtb__378) (s).f_Site_siteSizes) ctors) projs) (s).f_Site_siteCaller) facts) (s).f_Site_siteRegion) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = (v_scIsStrict dtb__379) }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasBase i) deps) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = false }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_nthDeps = (fun (mc0 : int B_dData_dList.t_List B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__380, dtb__381) -> (if (mc1 <= 0) then dtb__380 else ((v_nthDeps dtb__381) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 675 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesJ = (fun (i : int) (count : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (count <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((((((v_siteEdgeAt i) (count - 1)) ((v_nthDeps deps) (count - 1))) s) ctors) projs) facts)) (((((((v_siteEdgesJ i) (count - 1)) deps) s) ctors) projs) facts))))

# 684 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesI = (fun (i : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (i <= 0) then (((((((v_siteEdgesJ 0) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts) else ((B_dData_dList.v_append (((((((v_siteEdgesJ i) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts)) ((((((v_siteEdgesI (i - 1)) deps) s) ctors) projs) facts))))

# 693 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgesOf = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> (if (s).f_Site_siteBlind then ((v_blindEdges defTbl) s) else ((((((v_siteEdgesI (v_maxBaseOf (s).f_Site_siteSizes)) ((B_dData_dList.v_map (v_argBases (s).f_Site_siteSizes)) (s).f_Site_siteArgs)) s) ctors) projs) facts)))

# 703 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_initialTableGo = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : t_Site B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : bool) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__382, dtb__383) -> (if mc6 then (match ((((v_tableAdd (dtb__382).f_Site_siteCaller) (dtb__382).f_Site_siteCallee) (((((v_siteEdgesOf mc0) mc2) mc3) mc4) dtb__382)) mc5) with
  | { B_dData_dPair.f_Pair_first = dtb__384; B_dData_dPair.f_Pair_second = dtb__385 } -> (((((((v_initialTableGo mc0) dtb__383) mc2) mc3) mc4) dtb__384) dtb__385)
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = false })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = mc6 }
  | _ -> failwith "DT: impossible branch"
))

# 700 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_initialTable = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_initialTableGo defTbl) sites) ctors) projs) facts) B_dData_dList.C_List_Nil) true))

# 716 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctClosureFuel = 240

# 720 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctCheckTable = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__386, dtb__387) -> (match dtb__386 with
  | { B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = dtb__389 } -> (match dtb__388 with
  | { B_dData_dPair.f_Pair_first = dtb__390; B_dData_dPair.f_Pair_second = dtb__391 } -> (if (dtb__390 = dtb__391) then (if (v_graphsOK dtb__389) then (v_sctCheckTable dtb__387) else false) else (v_sctCheckTable dtb__387))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 725 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadGraphs = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__392, dtb__393) -> (if (v_graphOK dtb__392) then ((v_sctBadGraphs mc0) dtb__393) else (B_dData_dList.C_List__x58__x58_ (mc0, ((v_sctBadGraphs mc0) dtb__393))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadPairs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__394, dtb__395) -> (match dtb__394 with
  | { B_dData_dPair.f_Pair_first = dtb__396; B_dData_dPair.f_Pair_second = dtb__397 } -> (match dtb__396 with
  | { B_dData_dPair.f_Pair_first = dtb__398; B_dData_dPair.f_Pair_second = dtb__399 } -> (if (dtb__398 = dtb__399) then ((B_dData_dList.v_append ((v_sctBadGraphs dtb__398) dtb__397)) (v_sctBadPairs dtb__395)) else (v_sctBadPairs dtb__395))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 737 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_strictEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(bi_strFromInt (e).f_ScEdge_edgeFrom); "->>"; (bi_strFromInt (e).f_ScEdge_edgeTo)]))

# 740 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_weakEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(bi_strFromInt (e).f_ScEdge_edgeFrom); "->"; (bi_strFromInt (e).f_ScEdge_edgeTo)]))

# 734 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeText = (fun (e : t_ScEdge) -> (if (e).f_ScEdge_scStrictEdge then (v_strictEdgeText e) else (v_weakEdgeText e)))

# 743 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesText = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__400, dtb__401) -> (match dtb__401 with
  | B_dData_dList.C_List_Nil -> (v_edgeText dtb__400)
  | _ -> (String.concat "" [(v_edgeText dtb__400); ","; (v_edgesText dtb__401)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_badGraphText = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__402, dtb__403) -> (if (v_graphOK dtb__402) then ((v_badGraphText mc0) dtb__403) else (B_dData_dList.C_List__x58__x58_ ((String.concat "" [mc0; "{"; (v_edgesText dtb__402); "}"]), ((v_badGraphText mc0) dtb__403))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadText = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__404, dtb__405) -> (match dtb__404 with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> (match dtb__406 with
  | { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } -> (if (dtb__408 = dtb__409) then ((B_dData_dList.v_append ((v_badGraphText dtb__408) dtb__407)) (v_sctBadText dtb__405)) else (v_sctBadText dtb__405))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 758 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctDiag = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_joinComma (Elab_dTermination_dMeasure.v_dedup (v_sctBadText table))))

# 763 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_isBlindSite = (fun (s : t_Site) -> (s).f_Site_siteBlind)

# 766 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindPairText = (fun (s : t_Site) -> (String.concat "" [(s).f_Site_siteCaller; "->"; (s).f_Site_siteCallee]))

# 769 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctBlindNote = (fun (sites : t_Site B_dData_dList.t_List) -> (match (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_map v_blindPairText) ((B_dData_dList.v_filter v_isBlindSite) sites))) with
  | B_dData_dList.C_List_Nil -> ""
  | dtb__410 -> (String.concat "" [" [SCT \230\156\170\232\175\134\229\136\171\232\176\131\231\148\168\239\188\154"; (Elab_dTermination_dMeasure.v_joinComma dtb__410); "\239\188\136callee \228\187\165\229\128\188\228\188\160\233\128\146\230\136\150\233\129\141\229\142\134\233\162\132\231\174\151\232\128\151\229\176\189\239\188\140\229\143\170\230\140\137\229\188\177\232\190\185\232\174\161\229\133\165\239\188\137]"])
))

# 781 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_countGraphs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__411, dtb__412) -> (match dtb__411 with
  | { B_dData_dPair.f_Pair_first = dtb__413; B_dData_dPair.f_Pair_second = dtb__414 } -> ((B_dData_dList.v_length dtb__414) + (v_countGraphs dtb__412))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheckGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> ((fun sites -> ((fun note -> ((fun _u -> ((fun _u -> (match (((((v_initialTable defTbl) sites) ctors) projs) facts) with
  | { B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = dtb__416 } -> (if dtb__416 then ((fun _u -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> (match dtb__418 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> ((fun _u -> ((fun _u -> (if dtb__419 then (if (v_sctCheckTable dtb__417) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_sctDiag dtb__417); "]"])) msg))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_sctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))) ((B_dData_dObs.v_obsCounter "vuna.counter.term.graphs_final") (v_countGraphs dtb__417)))) ((B_dData_dObs.v_obsCounter "vuna.counter.term.closure_rounds") (v_sctClosureFuel - dtb__420)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_closureLoop dtb__415) v_sctClosureFuel))) ((B_dData_dObs.v_obsCounter "vuna.counter.term.graphs") (v_countGraphs dtb__415))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_sctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dObs.v_obsCounter "vuna.counter.term.sites") (B_dData_dList.v_length sites)))) ((B_dData_dObs.v_obsCounter "vuna.counter.term.scc_size") (B_dData_dList.v_length comp)))) (v_sctBlindNote sites))) (((((v_siteCollect comp) ctors) projs) defTbl) facts)))

# 776 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheck = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> ((Base_dObs.v_obsCheck "vuna.term.sct") (fun (_u : int) -> ((((((v_sctCheckGo comp) defTbl) ctors) projs) facts) msg))))

# 813 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramNamesOf = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__421, dtb__422) -> (match dtb__421 with
  | Frontend_dRast.C_Pat_PVar (dtb__423, dtb__424) -> (B_dData_dList.C_List__x58__x58_ (dtb__423, (v_paramNamesOf dtb__422)))
  | _ -> (v_paramNamesOf dtb__422)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 820 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramIndexGo = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__425, dtb__426) -> (match dtb__425 with
  | Frontend_dRast.C_Pat_PVar (dtb__427, dtb__428) -> (if (dtb__427 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_paramIndexGo dtb__426) mc1) (mc2 + 1)))
  | _ -> (((v_paramIndexGo dtb__426) mc1) (mc2 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 827 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_hasFuelGuard = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EIf (dtb__429, dtb__430, dtb__431, dtb__432) -> (match (Elab_dTermination_dMeasure.v_guardPosVar dtb__429) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__433) -> (dtb__433 = mc0)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 834 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_guardParamGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__434, dtb__435) -> (if ((v_hasFuelGuard dtb__434) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__434)) else ((v_guardParamGo dtb__435) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 839 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamNameOf = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__437) -> ((v_guardParamGo (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__436))) (B_dData_dPair.v_secondOf dtb__436))
  | _ -> failwith "DT: impossible branch"
))

# 847 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamIndexOf = (fun (callee : string) (callerFuel : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl callee) defTbl) with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__438, dtb__439) -> ((fun pats -> (match ((v_fuelParamNameOf callee) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__440) -> (((v_paramIndexGo pats) dtb__440) 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_paramIndexGo pats) callerFuel) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__441) -> (B_dData_dMaybe.C_Maybe_Just (dtb__441))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (B_dData_dPair.v_firstOf dtb__438))
  | _ -> failwith "DT: impossible branch"
))

# 861 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_callerFuelName = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf name) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__442) -> dtb__442
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__443, dtb__444) -> (match (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__443)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__445, dtb__446) -> dtb__445
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_paramsOf = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__447, dtb__448) -> (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__447))
  | _ -> failwith "DT: impossible branch"
))

# 882 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteFuelStrict = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : int B_dData_dMaybe.t_Maybe) (mc3 : t_Site) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__449) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (mc3).f_Site_siteArgs) dtb__449) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__450) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Frontend_dRast.C_Expr_EApp (dtb__451, dtb__452, dtb__453) -> (match dtb__451 with
  | Frontend_dRast.C_Expr_EVar (dtb__454, dtb__455) -> (if (Elab_dTermination_dMeasure.v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__454)) then ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (match dtb__456 with
  | Frontend_dRast.C_Expr_EVar (dtb__458, dtb__459) -> (match dtb__457 with
  | B_dData_dList.C_List__x58__x58_ (dtb__460, dtb__461) -> (match dtb__460 with
  | Frontend_dRast.C_Expr_EInt (dtb__462, dtb__463) -> (match dtb__461 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__462 > 0) then ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__458)) mc0) else false) then (B_dData_dMaybe.C_Maybe_Just (true)) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)) dtb__452) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)) dtb__450)
  | B_dData_dMaybe.C_Maybe_Just (dtb__464) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Frontend_dRast.C_Expr_EApp (dtb__465, dtb__466, dtb__467) -> (match dtb__465 with
  | Frontend_dRast.C_Expr_EVar (dtb__468, dtb__469) -> (if (Elab_dTermination_dMeasure.v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__468)) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__470, dtb__471) -> (match dtb__470 with
  | Frontend_dRast.C_Expr_EVar (dtb__472, dtb__473) -> (match dtb__471 with
  | B_dData_dList.C_List__x58__x58_ (dtb__474, dtb__475) -> (match dtb__474 with
  | Frontend_dRast.C_Expr_EInt (dtb__476, dtb__477) -> (match dtb__475 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__472) = dtb__464) then (if (dtb__476 > 0) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) dtb__466) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__478, dtb__479) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__478) = dtb__464) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) dtb__450)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 916 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_fuelEdgesGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : t_Site B_dData_dList.t_List) (mc3 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__480, dtb__481) -> ((fun inGroup -> ((fun mode -> ((fun acc2 -> ((((v_fuelEdgesGo mc0) mc1) dtb__481) acc2)) (if inGroup then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (dtb__480).f_Site_siteCaller; B_dData_dPair.f_Pair_second = (dtb__480).f_Site_siteCallee }; B_dData_dPair.f_Pair_second = mode }; B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, mc3)) else mc3))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__482) -> (if dtb__482 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) ((((v_siteFuelStrict ((v_paramsOf (dtb__480).f_Site_siteCaller) mc1)) ((v_fuelParamNameOf (dtb__480).f_Site_siteCaller) mc1)) (((v_fuelParamIndexOf (dtb__480).f_Site_siteCallee) ((v_callerFuelName (dtb__480).f_Site_siteCaller) mc1)) mc1)) dtb__480)))) ((B_dData_dList.v_memName (dtb__480).f_Site_siteCallee) mc0))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 911 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelEdgesOf = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) -> ((((v_fuelEdgesGo comp) defTbl) sites) B_dData_dList.C_List_Nil))

# 934 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_memberGuarded = (fun (f : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf f) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__483) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 940 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_unguardedOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__484, dtb__485) -> (if ((v_memberGuarded dtb__484) mc1) then ((v_unguardedOf dtb__485) mc1) else (B_dData_dList.C_List__x58__x58_ (dtb__484, ((v_unguardedOf dtb__485) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_allWeakEdges = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__486, dtb__487) -> (match dtb__486 with
  | { B_dData_dPair.f_Pair_first = dtb__488; B_dData_dPair.f_Pair_second = dtb__489 } -> (match dtb__488 with
  | { B_dData_dPair.f_Pair_first = dtb__490; B_dData_dPair.f_Pair_second = dtb__491 } -> (match dtb__490 with
  | { B_dData_dPair.f_Pair_first = dtb__492; B_dData_dPair.f_Pair_second = dtb__493 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__492; B_dData_dPair.f_Pair_second = dtb__493 }; B_dData_dPair.f_Pair_second = 0 }; B_dData_dPair.f_Pair_second = dtb__489 }, (v_allWeakEdges dtb__487)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 951 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_onlyUnguarded = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__494, dtb__495) -> (match dtb__494 with
  | { B_dData_dPair.f_Pair_first = dtb__496; B_dData_dPair.f_Pair_second = dtb__497 } -> (match dtb__496 with
  | { B_dData_dPair.f_Pair_first = dtb__498; B_dData_dPair.f_Pair_second = dtb__499 } -> (match dtb__498 with
  | { B_dData_dPair.f_Pair_first = dtb__500; B_dData_dPair.f_Pair_second = dtb__501 } -> (if ((B_dData_dList.v_memName dtb__500) mc0) then (if ((B_dData_dList.v_memName dtb__501) mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__500; B_dData_dPair.f_Pair_second = dtb__501 }; B_dData_dPair.f_Pair_second = dtb__499 }; B_dData_dPair.f_Pair_second = dtb__497 }, ((v_onlyUnguarded mc0) dtb__495))) else ((v_onlyUnguarded mc0) dtb__495)) else ((v_onlyUnguarded mc0) dtb__495))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_unguardedCycle = (fun (unguarded : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Elab_dTermination_dMeasure.v_hasWeakCycle unguarded) (v_allWeakEdges ((v_onlyUnguarded unguarded) edges))))

# 970 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelAcceptable = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_unguardedOf comp) defTbl) with
  | B_dData_dList.C_List_Nil -> true
  | dtb__502 -> (if ((v_unguardedCycle dtb__502) edges) then false else true)
))

# 988 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeModeOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__503; B_dData_dPair.f_Pair_second = dtb__504 } -> (match dtb__503 with
  | { B_dData_dPair.f_Pair_first = dtb__505; B_dData_dPair.f_Pair_second = dtb__506 } -> (match dtb__505 with
  | { B_dData_dPair.f_Pair_first = dtb__507; B_dData_dPair.f_Pair_second = dtb__508 } -> dtb__506
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 976 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tryFuelThread = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if (if (if (strictCount > 0) then (((v_fuelAcceptable comp) defTbl) edges) else false) then (B_dData_dBool.v_not ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) edges)) else false) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (msg)))) (B_dData_dList.v_length (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_edgeModeOf) edges))))) (((v_fuelEdgesOf comp) defTbl) sites))) (((((v_siteCollect comp) ctors) projs) defTbl) facts)))
