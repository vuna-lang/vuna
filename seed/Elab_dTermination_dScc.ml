open Vuna_runtime
type t_Site = { f_Site_siteCaller : string; f_Site_siteCallee : string; f_Site_siteArgs : Frontend_dRast.t_Expr B_dData_dList.t_List; f_Site_siteSizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Site_siteRegion : string B_dData_dList.t_List; f_Site_siteBlind : bool }
and t_ScEdge = { f_ScEdge_edgeFrom : int; f_ScEdge_edgeTo : int; f_ScEdge_scStrictEdge : bool }

# 24 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindSitesOf = (fun (comp : string B_dData_dList.t_List) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (g : string) -> { f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = true })) comp))

# 32 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectList = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__1) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__0) mc9)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 51 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__3) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__5) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 70 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dRast.t_Expr) (mc9 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : t_Site B_dData_dList.t_List) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc10) else (((((((((((v_siteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__7) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) mc8) dtb__8)) mc7) dtb__9) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 90 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) dtb__13) dtb__12)) mc7) dtb__11) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__13) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 109 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectStmts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else (match dtb__14 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__16, dtb__17, dtb__18) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) dtb__17) dtb__16)) mc7) dtb__15) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__19, dtb__20) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__15) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) mc9))
  | Frontend_dRast.C_DoStmt_DLet (dtb__21, dtb__22) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Elab_dTermination_dMeasure.v_extendByBinds mc3) dtb__21) mc6)) mc7) dtb__15) ((((((((((v_siteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__21) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 121 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkC = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (match e with
  | Frontend_dRast.C_Expr_EApp (dtb__23, dtb__24, dtb__25) -> (((((((((((v_siteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__23) dtb__24) acc)
  | Frontend_dRast.C_Expr_ECase (dtb__26, dtb__27, dtb__28) -> (((((((((((v_siteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__26) dtb__27) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__26) acc))
  | Frontend_dRast.C_Expr_EIf (dtb__29, dtb__30, dtb__31, dtb__32) -> (let acc1 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__29) acc) in (let acc2 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb__29)) region)) dtb__30) acc1) in ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb__29)) region)) dtb__31) acc2)))
  | Frontend_dRast.C_Expr_ELam (dtb__33, dtb__34, dtb__35) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__34) acc)
  | Frontend_dRast.C_Expr_ELet (dtb__36, dtb__37, dtb__38, dtb__39) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) (((Elab_dTermination_dMeasure.v_extendByBinds projs) dtb__36) sizes)) region) dtb__37) ((((((((((v_siteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__36) acc))
  | Frontend_dRast.C_Expr_EPi (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__44) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__43) acc))
  | Frontend_dRast.C_Expr_EField (dtb__46, dtb__47, dtb__48) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__46) acc)
  | Frontend_dRast.C_Expr_ERecord (dtb__49, dtb__50, dtb__51) -> ((((((((((v_siteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__50) acc)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__52, dtb__53, dtb__54) -> ((((((((((v_siteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc))
  | Frontend_dRast.C_Expr_EDo (dtb__55, dtb__56) -> ((((((((((v_siteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__55) acc)
  | Frontend_dRast.C_Expr_EAnn (dtb__57, dtb__58, dtb__59) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__57) acc))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__60, dtb__61) -> ((((((((((v_siteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Elab_dTermination_dMeasure.v_localClauseBinds dtb__60)) acc)
  | Frontend_dRast.C_Expr_EVar (dtb__62, dtb__63) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__62)) comp) then (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = (Frontend_dRast_dName.v_rnameKey dtb__62); f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = true }, acc)) else acc)
  | _ -> acc
)))
# 148 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = dtb__64; f_Site_siteArgs = args; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__65, dtb__66) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__65) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__67) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (let acc1 = ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (dtb__68).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc) in (let sizes2 = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__68).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__68).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) (dtb__68).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__67).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then (((((((((((v_siteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
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
and v_siteWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (let nd_uscrut11 = args in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match dtb__72 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut19 = dtb__69 in (match nd_uscrut19 with
  | Frontend_dRast.C_Expr_EVar (dtb__73, dtb__74) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__73)) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Frontend_dRast_dName.v_rnameKey dtb__73)) B_dData_dList.C_List_Nil) dtb__71) dtb__74) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Frontend_dRast.C_Expr_EApp (dtb__75, dtb__76, dtb__77) -> (match dtb__75 with
  | Frontend_dRast.C_Expr_EVar (dtb__78, dtb__79) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__78)) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (Frontend_dRast_dName.v_rnameKey dtb__78)) dtb__76) dtb__71) dtb__77) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
))
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
))))
# 183 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dRast.t_Expr B_dData_dList.t_List) (lst : Frontend_dRast.t_Expr) (cbsp : Base_dSource.t_Span) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (let acc1 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc) in (let elems = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem") in (let fullArgs = ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "$elem"), cbsp)), B_dData_dList.C_List_Nil))) in (let acc2 = ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1) in (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = fullArgs; f_Site_siteSizes = elems; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc2))))))))

# 199 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasNameOf = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))

# 202 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_lookupAlias = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = dtb__83 } -> (if (mc0 = dtb__82) then (B_dData_dMaybe.C_Maybe_Just (dtb__83)) else ((v_lookupAlias mc0) dtb__81))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dropAliases = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> ((v_dropAliases dtb__85) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((v_aliasNameOf p) <> dtb__84))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = dtb__87 } -> (match dtb__86 with
  | Frontend_dRast.C_Pat_PVar (dtb__88, dtb__89) -> (match dtb__87 with
  | Frontend_dRast.C_Expr_EVar (dtb__90, dtb__91) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__90)) mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = (Frontend_dRast_dName.v_rnameKey dtb__90) })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scIsStrict = (fun (m : int) -> (m <> 0))

# 331 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_maxBaseOf = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (match dtb__95 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> ((Elab_dTermination_dMeasure.v_maxInt dtb__96) (v_maxBaseOf dtb__93))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_insertEdge = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (if ((mc0).f_ScEdge_edgeFrom < (dtb__100).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101)))) else (if ((mc0).f_ScEdge_edgeFrom = (dtb__100).f_ScEdge_edgeFrom) then (if ((mc0).f_ScEdge_edgeTo <= (dtb__100).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101)))) else (B_dData_dList.C_List__x58__x58_ (dtb__100, ((v_insertEdge mc0) dtb__101)))) else (B_dData_dList.C_List__x58__x58_ (dtb__100, ((v_insertEdge mc0) dtb__101)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sortEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> ((v_insertEdge dtb__102) (v_sortEdges dtb__103))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_mergeStrict = (fun (a : t_ScEdge) (b : t_ScEdge) -> { f_ScEdge_edgeFrom = (a).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (a).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (a).f_ScEdge_scStrictEdge then true else (b).f_ScEdge_scStrictEdge) })

# 352 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_compactEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (match dtb__105 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__104, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (if ((dtb__104).f_ScEdge_edgeFrom = (dtb__106).f_ScEdge_edgeFrom) then (if ((dtb__104).f_ScEdge_edgeTo = (dtb__106).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (((v_mergeStrict dtb__104) dtb__106), (v_compactEdges dtb__107))) else (B_dData_dList.C_List__x58__x58_ (dtb__104, (v_compactEdges dtb__105)))) else (B_dData_dList.C_List__x58__x58_ (dtb__104, (v_compactEdges dtb__105))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_canonEdges = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (v_compactEdges (v_sortEdges edges)))

# 366 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesEqCanon = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (if ((dtb__110).f_ScEdge_edgeFrom = (dtb__112).f_ScEdge_edgeFrom) then (if ((dtb__110).f_ScEdge_edgeTo = (dtb__112).f_ScEdge_edgeTo) then (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) (dtb__110).f_ScEdge_scStrictEdge) (dtb__112).f_ScEdge_scStrictEdge) then ((v_edgesEqCanon dtb__111) dtb__113) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgesEq = (fun (a : t_ScEdge B_dData_dList.t_List) (b : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEqCanon (v_canonEdges a)) (v_canonEdges b)))

# 382 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_combineWith = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (if ((mc0).f_ScEdge_edgeTo = (dtb__114).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = (mc0).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (dtb__114).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (mc0).f_ScEdge_scStrictEdge then true else (dtb__114).f_ScEdge_scStrictEdge) }, ((v_combineWith mc0) dtb__115))) else ((v_combineWith mc0) dtb__115))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_composeGo = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> ((B_dData_dList.v_append ((v_combineWith dtb__116) mc1)) ((v_composeGo dtb__117) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_composeEdges = (fun (g1 : t_ScEdge B_dData_dList.t_List) (g2 : t_ScEdge B_dData_dList.t_List) -> (v_canonEdges ((v_composeGo g1) g2)))

# 398 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasStrict = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (if (dtb__118).f_ScEdge_scStrictEdge then true else (v_hasStrict dtb__119))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphIdempotent = (fun (edges : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEq ((v_composeEdges edges) edges)) edges))

# 407 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphOK = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (if (v_graphIdempotent edges) then (v_hasStrict edges) else true))

# 410 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphsOK = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (if (v_graphOK dtb__120) then (v_graphsOK dtb__121) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableGraphCap = 512

# 420 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableLookup = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (match dtb__122 with
  | { B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = dtb__125 } -> (if ((B_dData_dPair.v_firstOf mc0) = (B_dData_dPair.v_firstOf dtb__124)) then (if ((B_dData_dPair.v_secondOf mc0) = (B_dData_dPair.v_secondOf dtb__124)) then (B_dData_dMaybe.C_Maybe_Just (dtb__125)) else ((v_tableLookup mc0) dtb__123)) else ((v_tableLookup mc0) dtb__123))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListHas = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (if ((v_edgesEq mc0) dtb__126) then true else ((v_graphListHas mc0) dtb__127))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListSubset = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (if ((v_graphListHas dtb__128) mc1) then ((v_graphListSubset dtb__129) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableAddPair = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (match dtb__132 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> (if (mc0 = dtb__134) then (if (mc1 = dtb__135) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, dtb__133)) }, dtb__131)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 }; B_dData_dPair.f_Pair_second = dtb__133 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__131)))) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 }; B_dData_dPair.f_Pair_second = dtb__133 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__131))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableAdd = (fun (f : string) (g : string) (edges : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_tableLookup { B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = g }) table) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (if ((v_graphListHas edges) dtb__136) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = true } else (if ((B_dData_dList.v_length dtb__136) >= v_tableGraphCap) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = false } else { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepHs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (let nd_uscrut8 = ((((v_tableAdd mc0) mc1) ((v_composeEdges mc2) dtb__137)) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 } -> (if dtb__140 then (((((v_closureStepHs mc0) mc1) mc2) dtb__138) dtb__139) else { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepOneGo = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (match dtb__141 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (match dtb__143 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> (if (dtb__145 = mc1) then (let nd_uscrut17 = (((((v_closureStepHs mc0) dtb__146) mc2) dtb__144) mc4) in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (if dtb__148 then ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__142) dtb__147) dtb__148) else { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) else ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__142) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStepOne = (fun (f : string) (g : string) (a : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_closureStepOneGo f) g) a) table) acc) true))

# 479 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGraphs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (let nd_uscrut8 = (((((v_closureStepOne mc0) mc1) dtb__149) mc3) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (if dtb__152 then (((((v_closureStepGraphs mc0) mc1) dtb__150) mc3) dtb__151) else { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGo = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> (match dtb__155 with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> (let nd_uscrut14 = (((((v_closureStepGraphs dtb__157) dtb__158) dtb__156) mc1) mc2) in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (if dtb__160 then (((v_closureStepGo dtb__154) mc1) dtb__159) else { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 493 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStep = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_closureStepGo table) table) table))

# 499 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableSubset = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> (match ((v_tableLookup dtb__163) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> (if ((v_graphListSubset dtb__164) dtb__165) then ((v_tableSubset dtb__162) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableSame = (fun (a : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_tableSubset a) b) else false))

# 506 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureLoop = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } } else (let nd_uscrut2 = (v_closureStep table) in (match nd_uscrut2 with
  | { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } -> (if dtb__167 then (if ((v_tableSame table) dtb__166) then { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = fuel } } else ((v_closureLoop dtb__166) (fuel - 1))) else { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } })
  | _ -> failwith "DT: impossible branch"
))))

# 524 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_basesUpToGo = (fun (i : int) (acc : int B_dData_dList.t_List) -> (if (i <= 0) then (B_dData_dList.C_List__x58__x58_ (0, acc)) else ((v_basesUpToGo (i - 1)) (B_dData_dList.C_List__x58__x58_ (i, acc)))))

# 527 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_basesUpTo = (fun (n : int) -> (if (n < 0) then B_dData_dList.C_List_Nil else ((v_basesUpToGo n) B_dData_dList.C_List_Nil)))

# 530 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasBase = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (if (mc0 = dtb__168) then true else ((v_hasBase mc0) dtb__169))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dedupBases = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (if ((v_hasBase dtb__170) dtb__171) then (v_dedupBases dtb__171) else (B_dData_dList.C_List__x58__x58_ (dtb__170, (v_dedupBases dtb__171))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOf = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__172, dtb__173, dtb__174) -> (v_patNamesOfFields dtb__173)
  | Frontend_dRast.C_Pat_PCon (dtb__175, dtb__176, dtb__177) -> (v_patNamesOfPats dtb__176)
  | Frontend_dRast.C_Pat_PAs (dtb__178, dtb__179, dtb__180) -> (B_dData_dList.C_List__x58__x58_ (dtb__178, (v_patNamesOf dtb__179)))
  | Frontend_dRast.C_Pat_PVar (dtb__181, dtb__182) -> (B_dData_dList.C_List__x58__x58_ (dtb__181, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 545 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfPats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> ((B_dData_dList.v_append (v_patNamesOf dtb__183)) (v_patNamesOfPats dtb__184))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 549 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfFields = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> ((B_dData_dList.v_append (v_patNamesOf dtb__188)) (v_patNamesOfFields dtb__186))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_inlArgs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (B_dData_dList.C_List__x58__x58_ ((((v_inlGo mc0) mc1) dtb__189), (((v_inlArgs mc0) mc1) dtb__190)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 221 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlFields = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (match dtb__191 with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) mc1) dtb__194) }, (((v_inlFields mc0) mc1) dtb__192)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 225 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlParts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (match dtb__195 with
  | Frontend_dRast.C_InterpPart_IPText (dtb__197) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPText (dtb__197)), (((v_inlParts mc0) mc1) dtb__196)))
  | Frontend_dRast.C_InterpPart_IPHole (dtb__198) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPHole ((((v_inlGo mc0) mc1) dtb__198))), (((v_inlParts mc0) mc1) dtb__196)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 232 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> (match dtb__199 with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> (let rhs = (((v_inlGo mc0) mc1) dtb__202) in (match ((v_aliasOf mc0) { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = rhs }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__203) -> (let restP = (((v_inlBinds mc0) (B_dData_dList.C_List__x58__x58_ (dtb__203, mc1))) dtb__200) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf restP); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | B_dData_dMaybe.C_Maybe_Nothing -> (let restP = (((v_inlBinds mc0) ((v_dropAliases (v_patNamesOf dtb__201)) mc1)) dtb__200) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = rhs }, (B_dData_dPair.v_firstOf restP))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))
# 249 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlAlts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) ((v_dropAliases (v_patNamesOf dtb__206)) mc1)) dtb__207) }, (((v_inlAlts mc0) mc1) dtb__205)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 254 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (match dtb__208 with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) ((v_dropAliases (v_patNamesOfPats dtb__210)) mc1)) dtb__211) }, (((v_inlClauses mc0) mc1) dtb__209)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 259 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlStmts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__214, dtb__215, dtb__216) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DBind (dtb__214, (((v_inlGo mc0) mc1) dtb__215), dtb__216)), (((v_inlStmts mc0) ((v_dropAliases (v_patNamesOf dtb__214)) mc1)) dtb__213)))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__217, dtb__218) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DExpr ((((v_inlGo mc0) mc1) dtb__217), dtb__218)), (((v_inlStmts mc0) mc1) dtb__213)))
  | Frontend_dRast.C_DoStmt_DLet (dtb__219, dtb__220) -> (let p = (((v_inlBinds mc0) mc1) dtb__219) in (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_DoStmt_DLet ((B_dData_dPair.v_firstOf p), dtb__220)), (((v_inlStmts mc0) (B_dData_dPair.v_secondOf p)) dtb__213))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 271 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) -> (match mc2 with
  | Frontend_dRast.C_Expr_EInterp (dtb__221, dtb__222) -> (Frontend_dRast.C_Expr_EInterp ((((v_inlParts mc0) mc1) dtb__221), dtb__222))
  | Frontend_dRast.C_Expr_EAnn (dtb__223, dtb__224, dtb__225) -> (Frontend_dRast.C_Expr_EAnn ((((v_inlGo mc0) mc1) dtb__223), (((v_inlGo mc0) mc1) dtb__224), dtb__225))
  | Frontend_dRast.C_Expr_EDo (dtb__226, dtb__227) -> (Frontend_dRast.C_Expr_EDo ((((v_inlStmts mc0) mc1) dtb__226), dtb__227))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__228, dtb__229, dtb__230) -> (Frontend_dRast.C_Expr_ERecUpdate ((((v_inlGo mc0) mc1) dtb__228), (((v_inlFields mc0) mc1) dtb__229), dtb__230))
  | Frontend_dRast.C_Expr_ERecord (dtb__231, dtb__232, dtb__233) -> (Frontend_dRast.C_Expr_ERecord (dtb__231, (((v_inlFields mc0) mc1) dtb__232), dtb__233))
  | Frontend_dRast.C_Expr_EField (dtb__234, dtb__235, dtb__236) -> (Frontend_dRast.C_Expr_EField ((((v_inlGo mc0) mc1) dtb__234), dtb__235, dtb__236))
  | Frontend_dRast.C_Expr_EIf (dtb__237, dtb__238, dtb__239, dtb__240) -> (Frontend_dRast.C_Expr_EIf ((((v_inlGo mc0) mc1) dtb__237), (((v_inlGo mc0) mc1) dtb__238), (((v_inlGo mc0) mc1) dtb__239), dtb__240))
  | Frontend_dRast.C_Expr_ECase (dtb__241, dtb__242, dtb__243) -> (Frontend_dRast.C_Expr_ECase ((((v_inlGo mc0) mc1) dtb__241), (((v_inlAlts mc0) mc1) dtb__242), dtb__243))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__244, dtb__245) -> (Frontend_dRast.C_Expr_ELocalFun ((((v_inlClauses mc0) mc1) dtb__244), dtb__245))
  | Frontend_dRast.C_Expr_ELet (dtb__246, dtb__247, dtb__248, dtb__249) -> (let p = (((v_inlBinds mc0) mc1) dtb__246) in (Frontend_dRast.C_Expr_ELet ((B_dData_dPair.v_firstOf p), (((v_inlGo mc0) (B_dData_dPair.v_secondOf p)) dtb__247), dtb__248, dtb__249)))
  | Frontend_dRast.C_Expr_EPi (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255) -> (Frontend_dRast.C_Expr_EPi (dtb__250, dtb__251, dtb__252, (((v_inlGo mc0) mc1) dtb__253), (((v_inlGo mc0) ((v_dropAliases (B_dData_dList.C_List__x58__x58_ (dtb__250, B_dData_dList.C_List_Nil))) mc1)) dtb__254), dtb__255))
  | Frontend_dRast.C_Expr_EApp (dtb__256, dtb__257, dtb__258) -> (Frontend_dRast.C_Expr_EApp ((((v_inlGo mc0) mc1) dtb__256), (((v_inlArgs mc0) mc1) dtb__257), dtb__258))
  | Frontend_dRast.C_Expr_ELam (dtb__259, dtb__260, dtb__261) -> (Frontend_dRast.C_Expr_ELam (dtb__259, (((v_inlGo mc0) ((v_dropAliases ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__259)) mc1)) dtb__260), dtb__261))
  | Frontend_dRast.C_Expr_EVar (dtb__262, dtb__263) -> (match ((v_lookupAlias (Frontend_dRast_dName.v_rnameKey dtb__262)) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__264), dtb__263))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar (dtb__262, dtb__263))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 296 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_inlineAliases = (fun (comp : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (((v_inlGo comp) B_dData_dList.C_List_Nil) e))

# 299 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string) (mc5 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (let body = ((v_inlineAliases mc0) (B_dData_dPair.v_secondOf dtb__265)) in (((((((v_siteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__266) ((((((((((v_siteWalkC ((Frontend_dRast.v_exprBudget 32) body)) mc0) mc1) mc2) mc4) mc3) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf dtb__265))) B_dData_dList.C_List_Nil) body) mc6)))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__268) -> (((((((v_siteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__268) (((((((v_siteCollectClauses mc0) mc1) mc2) mc4) dtb__267) ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__267) mc3)) mc6))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCollect = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_siteCollectGo comp) ctors) projs) defTbl) facts) comp) B_dData_dList.C_List_Nil))

# 553 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOfBinds = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__269, dtb__270) -> (match dtb__269 with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> ((B_dData_dList.v_append (v_patNamesOf dtb__271)) (v_patNamesOfBinds dtb__270))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_argBasesGo = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) -> (match mc2 with
  | Frontend_dRast.C_Expr_EInterp (dtb__273, dtb__274) -> (((v_argBasesParts mc0) mc1) dtb__273)
  | Frontend_dRast.C_Expr_EAnn (dtb__275, dtb__276, dtb__277) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__275)) (((v_argBasesGo mc0) mc1) dtb__276))
  | Frontend_dRast.C_Expr_EDo (dtb__278, dtb__279) -> (((v_argBasesStmts mc0) mc1) dtb__278)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__280, dtb__281, dtb__282) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__280)) (((v_argBasesFields mc0) mc1) dtb__281))
  | Frontend_dRast.C_Expr_ERecord (dtb__283, dtb__284, dtb__285) -> (((v_argBasesFields mc0) mc1) dtb__284)
  | Frontend_dRast.C_Expr_EField (dtb__286, dtb__287, dtb__288) -> (((v_argBasesGo mc0) mc1) dtb__286)
  | Frontend_dRast.C_Expr_EIf (dtb__289, dtb__290, dtb__291, dtb__292) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__289)) ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__290)) (((v_argBasesGo mc0) mc1) dtb__291)))
  | Frontend_dRast.C_Expr_ECase (dtb__293, dtb__294, dtb__295) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__293)) (((v_argBasesAlts mc0) mc1) dtb__294))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__296, dtb__297) -> (((v_argBasesClauses mc0) mc1) dtb__296)
  | Frontend_dRast.C_Expr_ELet (dtb__298, dtb__299, dtb__300, dtb__301) -> ((B_dData_dList.v_append (((v_argBasesBinds mc0) mc1) dtb__298)) (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOfBinds dtb__298)) mc1)) dtb__299))
  | Frontend_dRast.C_Expr_EPi (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__305)) (((v_argBasesGo mc0) mc1) dtb__306))
  | Frontend_dRast.C_Expr_EApp (dtb__308, dtb__309, dtb__310) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__308)) (((v_argBasesArgs mc0) mc1) dtb__309))
  | Frontend_dRast.C_Expr_ELam (dtb__311, dtb__312, dtb__313) -> (((v_argBasesGo mc0) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__311)) mc1)) dtb__312)
  | Frontend_dRast.C_Expr_EVar (dtb__314, dtb__315) -> (let name = (Frontend_dRast_dName.v_rnameKey dtb__314) in (let nd_uscrut6 = ((Elab_dTermination_dMeasure.v_sizeOfVarStrict name) mc0) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName name) mc1) then (v_basesUpTo (v_maxBaseOf mc0)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__316) -> (match dtb__316 with
  | { B_dData_dPair.f_Pair_first = dtb__317; B_dData_dPair.f_Pair_second = dtb__318 } -> (B_dData_dList.C_List__x58__x58_ (dtb__317, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> B_dData_dList.C_List_Nil
))
# 590 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesArgs = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__319, dtb__320) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__319)) (((v_argBasesArgs mc0) mc1) dtb__320))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 595 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesFields = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__321, dtb__322) -> (match dtb__321 with
  | { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = dtb__324 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__324)) (((v_argBasesFields mc0) mc1) dtb__322))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 600 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBinds = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__325, dtb__326) -> (match dtb__325 with
  | { B_dData_dPair.f_Pair_first = dtb__327; B_dData_dPair.f_Pair_second = dtb__328 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__328)) (((v_argBasesBinds mc0) mc1) dtb__326))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 605 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesAlts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__329, dtb__330) -> (match dtb__329 with
  | { B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = dtb__332 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOf dtb__331)) mc1)) dtb__332)) (((v_argBasesAlts mc0) mc1) dtb__330))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 610 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesClauses = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__333, dtb__334) -> (match dtb__333 with
  | { B_dData_dPair.f_Pair_first = dtb__335; B_dData_dPair.f_Pair_second = dtb__336 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOfPats dtb__335)) mc1)) dtb__336)) (((v_argBasesClauses mc0) mc1) dtb__334))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 617 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesStmts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__337, dtb__338) -> (match dtb__337 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__339, dtb__340, dtb__341) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__340)) (((v_argBasesStmts mc0) ((B_dData_dList.v_append (v_patNamesOf dtb__339)) mc1)) dtb__338))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__342, dtb__343) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__342)) (((v_argBasesStmts mc0) mc1) dtb__338))
  | Frontend_dRast.C_DoStmt_DLet (dtb__344, dtb__345) -> ((B_dData_dList.v_append (((v_argBasesBinds mc0) mc1) dtb__344)) (((v_argBasesStmts mc0) ((B_dData_dList.v_append (v_patNamesOfBinds dtb__344)) mc1)) dtb__338))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 629 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesParts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__346, dtb__347) -> (match dtb__346 with
  | Frontend_dRast.C_InterpPart_IPText (dtb__348) -> (((v_argBasesParts mc0) mc1) dtb__347)
  | Frontend_dRast.C_InterpPart_IPHole (dtb__349) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__349)) (((v_argBasesParts mc0) mc1) dtb__347))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 521 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBases = (fun (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (v_dedupBases (((v_argBasesGo sizes) B_dData_dList.C_List_Nil) e)))

# 637 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesJ = (fun (arity : int) (i : int) -> (if (arity <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = (arity - 1); f_ScEdge_scStrictEdge = false }, ((v_blindEdgesJ (arity - 1)) i)))))

# 641 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesI = (fun (i : int) (arity : int) -> (if (i <= 0) then (if (i = 0) then ((v_blindEdgesJ arity) 0) else B_dData_dList.C_List_Nil) else ((B_dData_dList.v_append ((v_blindEdgesJ arity) i)) ((v_blindEdgesI (i - 1)) arity))))

# 648 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindEdges = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> ((v_blindEdgesI ((Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCaller) defTbl)) - 1)) (Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCallee) defTbl))))

# 654 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgeAt = (fun (i : int) (j : int) (deps : int B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (s).f_Site_siteArgs) j) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__350) -> (match ((((((((Elab_dTermination_dMeasure.v_relOfArg i) dtb__350) (s).f_Site_siteSizes) ctors) projs) (s).f_Site_siteCaller) facts) (s).f_Site_siteRegion) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__351) -> (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = (v_scIsStrict dtb__351) }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasBase i) deps) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = false }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_nthDeps = (fun (mc0 : int B_dData_dList.t_List B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__352, dtb__353) -> (if (mc1 <= 0) then dtb__352 else ((v_nthDeps dtb__353) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 668 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesJ = (fun (i : int) (count : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (count <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((((((v_siteEdgeAt i) (count - 1)) ((v_nthDeps deps) (count - 1))) s) ctors) projs) facts)) (((((((v_siteEdgesJ i) (count - 1)) deps) s) ctors) projs) facts))))

# 677 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesI = (fun (i : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (i <= 0) then (((((((v_siteEdgesJ 0) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts) else ((B_dData_dList.v_append (((((((v_siteEdgesJ i) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts)) ((((((v_siteEdgesI (i - 1)) deps) s) ctors) projs) facts))))

# 686 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgesOf = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> (if (s).f_Site_siteBlind then ((v_blindEdges defTbl) s) else ((((((v_siteEdgesI (v_maxBaseOf (s).f_Site_siteSizes)) ((B_dData_dList.v_map (v_argBases (s).f_Site_siteSizes)) (s).f_Site_siteArgs)) s) ctors) projs) facts)))

# 696 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_initialTableGo = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : t_Site B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : bool) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__354, dtb__355) -> (if mc6 then (match ((((v_tableAdd (dtb__354).f_Site_siteCaller) (dtb__354).f_Site_siteCallee) (((((v_siteEdgesOf mc0) mc2) mc3) mc4) dtb__354)) mc5) with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (((((((v_initialTableGo mc0) dtb__355) mc2) mc3) mc4) dtb__356) dtb__357)
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = false })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = mc6 }
  | _ -> failwith "DT: impossible branch"
))

# 693 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_initialTable = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_initialTableGo defTbl) sites) ctors) projs) facts) B_dData_dList.C_List_Nil) true))

# 709 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctClosureFuel = 240

# 713 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctCheckTable = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__360; B_dData_dPair.f_Pair_second = dtb__361 } -> (match dtb__360 with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (if (dtb__362 = dtb__363) then (if (v_graphsOK dtb__361) then (v_sctCheckTable dtb__359) else false) else (v_sctCheckTable dtb__359))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 718 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadGraphs = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__364, dtb__365) -> (if (v_graphOK dtb__364) then ((v_sctBadGraphs mc0) dtb__365) else (B_dData_dList.C_List__x58__x58_ (mc0, ((v_sctBadGraphs mc0) dtb__365))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadPairs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__366, dtb__367) -> (match dtb__366 with
  | { B_dData_dPair.f_Pair_first = dtb__368; B_dData_dPair.f_Pair_second = dtb__369 } -> (match dtb__368 with
  | { B_dData_dPair.f_Pair_first = dtb__370; B_dData_dPair.f_Pair_second = dtb__371 } -> (if (dtb__370 = dtb__371) then ((B_dData_dList.v_append ((v_sctBadGraphs dtb__370) dtb__369)) (v_sctBadPairs dtb__367)) else (v_sctBadPairs dtb__367))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_strictEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(bi_strFromInt (e).f_ScEdge_edgeFrom); "->>"; (bi_strFromInt (e).f_ScEdge_edgeTo)]))

# 733 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_weakEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(bi_strFromInt (e).f_ScEdge_edgeFrom); "->"; (bi_strFromInt (e).f_ScEdge_edgeTo)]))

# 727 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeText = (fun (e : t_ScEdge) -> (if (e).f_ScEdge_scStrictEdge then (v_strictEdgeText e) else (v_weakEdgeText e)))

# 736 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesText = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__372, dtb__373) -> (match dtb__373 with
  | B_dData_dList.C_List_Nil -> (v_edgeText dtb__372)
  | _ -> (String.concat "" [(v_edgeText dtb__372); ","; (v_edgesText dtb__373)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 741 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_badGraphText = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__374, dtb__375) -> (if (v_graphOK dtb__374) then ((v_badGraphText mc0) dtb__375) else (B_dData_dList.C_List__x58__x58_ ((String.concat "" [mc0; "{"; (v_edgesText dtb__374); "}"]), ((v_badGraphText mc0) dtb__375))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadText = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__376, dtb__377) -> (match dtb__376 with
  | { B_dData_dPair.f_Pair_first = dtb__378; B_dData_dPair.f_Pair_second = dtb__379 } -> (match dtb__378 with
  | { B_dData_dPair.f_Pair_first = dtb__380; B_dData_dPair.f_Pair_second = dtb__381 } -> (if (dtb__380 = dtb__381) then ((B_dData_dList.v_append ((v_badGraphText dtb__380) dtb__379)) (v_sctBadText dtb__377)) else (v_sctBadText dtb__377))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 751 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctDiag = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_joinComma (Elab_dTermination_dMeasure.v_dedup (v_sctBadText table))))

# 756 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_isBlindSite = (fun (s : t_Site) -> (s).f_Site_siteBlind)

# 759 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindPairText = (fun (s : t_Site) -> (String.concat "" [(s).f_Site_siteCaller; "->"; (s).f_Site_siteCallee]))

# 762 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctBlindNote = (fun (sites : t_Site B_dData_dList.t_List) -> (match (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_map v_blindPairText) ((B_dData_dList.v_filter v_isBlindSite) sites))) with
  | B_dData_dList.C_List_Nil -> ""
  | dtb__382 -> (String.concat "" [" [SCT \230\156\170\232\175\134\229\136\171\232\176\131\231\148\168\239\188\154"; (Elab_dTermination_dMeasure.v_joinComma dtb__382); "\239\188\136callee \228\187\165\229\128\188\228\188\160\233\128\146\230\136\150\233\129\141\229\142\134\233\162\132\231\174\151\232\128\151\229\176\189\239\188\140\229\143\170\230\140\137\229\188\177\232\190\185\232\174\161\229\133\165\239\188\137]"])
))

# 774 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_countGraphs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__383, dtb__384) -> (match dtb__383 with
  | { B_dData_dPair.f_Pair_first = dtb__385; B_dData_dPair.f_Pair_second = dtb__386 } -> ((B_dData_dList.v_length dtb__386) + (v_countGraphs dtb__384))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheckGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let note = (v_sctBlindNote sites) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.scc_size") (B_dData_dList.v_length comp)) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.sites") (B_dData_dList.v_length sites)) in (match (((((v_initialTable defTbl) sites) ctors) projs) facts) with
  | { B_dData_dPair.f_Pair_first = dtb__387; B_dData_dPair.f_Pair_second = dtb__388 } -> (if dtb__388 then (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs") (v_countGraphs dtb__387)) in (let nd_uscrut12 = ((v_closureLoop dtb__387) v_sctClosureFuel) in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__389; B_dData_dPair.f_Pair_second = dtb__390 } -> (match dtb__390 with
  | { B_dData_dPair.f_Pair_first = dtb__391; B_dData_dPair.f_Pair_second = dtb__392 } -> (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.closure_rounds") (v_sctClosureFuel - dtb__392)) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs_final") (v_countGraphs dtb__389)) in (if dtb__391 then (if (v_sctCheckTable dtb__389) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_sctDiag dtb__389); "]"])) msg))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_sctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_sctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 769 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheck = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> ((Base_dObs.v_obsCheck "vuna.term.sct") (fun (_u : int) -> ((((((v_sctCheckGo comp) defTbl) ctors) projs) facts) msg))))

# 806 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramNamesOf = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__393, dtb__394) -> (match dtb__393 with
  | Frontend_dRast.C_Pat_PVar (dtb__395, dtb__396) -> (B_dData_dList.C_List__x58__x58_ (dtb__395, (v_paramNamesOf dtb__394)))
  | _ -> (v_paramNamesOf dtb__394)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 813 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramIndexGo = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__397, dtb__398) -> (match dtb__397 with
  | Frontend_dRast.C_Pat_PVar (dtb__399, dtb__400) -> (if (dtb__399 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_paramIndexGo dtb__398) mc1) (mc2 + 1)))
  | _ -> (((v_paramIndexGo dtb__398) mc1) (mc2 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 824 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasFuelGuard = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_ELam (dtb__401, dtb__402, dtb__403) -> ((v_hasFuelGuard mc0) dtb__402)
  | Frontend_dRast.C_Expr_ELet (dtb__404, dtb__405, dtb__406, dtb__407) -> (if ((v_hasFuelGuard mc0) dtb__405) then true else ((v_anyBindFuelGuard mc0) dtb__404))
  | Frontend_dRast.C_Expr_ECase (dtb__408, dtb__409, dtb__410) -> ((v_anyAltFuelGuard mc0) dtb__409)
  | Frontend_dRast.C_Expr_EIf (dtb__411, dtb__412, dtb__413, dtb__414) -> (match (Elab_dTermination_dMeasure.v_guardPosVar dtb__411) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__415) -> (dtb__415 = mc0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasFuelGuard mc0) dtb__412) then true else ((v_hasFuelGuard mc0) dtb__413))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))
# 834 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyAltFuelGuard = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__416, dtb__417) -> (match dtb__416 with
  | { B_dData_dPair.f_Pair_first = dtb__418; B_dData_dPair.f_Pair_second = dtb__419 } -> (if ((v_hasFuelGuard mc0) dtb__419) then true else ((v_anyAltFuelGuard mc0) dtb__417))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 839 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyBindFuelGuard = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__420, dtb__421) -> (match dtb__420 with
  | { B_dData_dPair.f_Pair_first = dtb__422; B_dData_dPair.f_Pair_second = dtb__423 } -> (if ((v_hasFuelGuard mc0) dtb__423) then true else ((v_anyBindFuelGuard mc0) dtb__421))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 844 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_guardParamGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__424, dtb__425) -> (if ((v_hasFuelGuard dtb__424) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__424)) else ((v_guardParamGo dtb__425) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 849 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamNameOf = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__426, dtb__427) -> ((v_guardParamGo (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__426))) (B_dData_dPair.v_secondOf dtb__426))
  | _ -> failwith "DT: impossible branch"
))

# 857 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamIndexOf = (fun (callee : string) (callerFuel : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl callee) defTbl) with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__428, dtb__429) -> (let pats = (B_dData_dPair.v_firstOf dtb__428) in (match ((v_fuelParamNameOf callee) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__430) -> (((v_paramIndexGo pats) dtb__430) 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_paramIndexGo pats) callerFuel) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__431) -> (B_dData_dMaybe.C_Maybe_Just (dtb__431))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 871 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_callerFuelName = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf name) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__432) -> dtb__432
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__433, dtb__434) -> (match (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__433)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__435, dtb__436) -> dtb__435
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_paramsOf = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__437, dtb__438) -> (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__437))
  | _ -> failwith "DT: impossible branch"
))

# 892 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteFuelStrict = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : int B_dData_dMaybe.t_Maybe) (mc3 : t_Site) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__439) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (mc3).f_Site_siteArgs) dtb__439) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__440) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = dtb__440 in (match nd_uscrut9 with
  | Frontend_dRast.C_Expr_EApp (dtb__441, dtb__442, dtb__443) -> (match dtb__441 with
  | Frontend_dRast.C_Expr_EVar (dtb__444, dtb__445) -> (if (Elab_dTermination_dMeasure.v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__444)) then (let nd_uscrut15 = dtb__442 in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__446, dtb__447) -> (match dtb__446 with
  | Frontend_dRast.C_Expr_EVar (dtb__448, dtb__449) -> (match dtb__447 with
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> (match dtb__450 with
  | Frontend_dRast.C_Expr_EInt (dtb__452, dtb__453) -> (match dtb__451 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__452 > 0) then ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__448)) mc0) else false) then (B_dData_dMaybe.C_Maybe_Just (true)) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
))
  | B_dData_dMaybe.C_Maybe_Just (dtb__454) -> (let nd_uscrut10 = dtb__440 in (match nd_uscrut10 with
  | Frontend_dRast.C_Expr_EApp (dtb__455, dtb__456, dtb__457) -> (match dtb__455 with
  | Frontend_dRast.C_Expr_EVar (dtb__458, dtb__459) -> (if (Elab_dTermination_dMeasure.v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__458)) then (let nd_uscrut16 = dtb__456 in (match nd_uscrut16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__460, dtb__461) -> (match dtb__460 with
  | Frontend_dRast.C_Expr_EVar (dtb__462, dtb__463) -> (match dtb__461 with
  | B_dData_dList.C_List__x58__x58_ (dtb__464, dtb__465) -> (match dtb__464 with
  | Frontend_dRast.C_Expr_EInt (dtb__466, dtb__467) -> (match dtb__465 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__462) = dtb__454) then (if (dtb__466 > 0) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__468, dtb__469) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__468) = dtb__454) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_fuelEdgesGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : t_Site B_dData_dList.t_List) (mc3 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__470, dtb__471) -> (let inGroup = ((B_dData_dList.v_memName (dtb__470).f_Site_siteCallee) mc0) in (let mode = (let nd_uscrut8 = ((((v_siteFuelStrict ((v_paramsOf (dtb__470).f_Site_siteCaller) mc1)) ((v_fuelParamNameOf (dtb__470).f_Site_siteCaller) mc1)) (((v_fuelParamIndexOf (dtb__470).f_Site_siteCallee) ((v_callerFuelName (dtb__470).f_Site_siteCaller) mc1)) mc1)) dtb__470) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__472) -> (if dtb__472 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) in (let acc2 = (if inGroup then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (dtb__470).f_Site_siteCaller; B_dData_dPair.f_Pair_second = (dtb__470).f_Site_siteCallee }; B_dData_dPair.f_Pair_second = mode }; B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, mc3)) else mc3) in ((((v_fuelEdgesGo mc0) mc1) dtb__471) acc2))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 921 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelEdgesOf = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) -> ((((v_fuelEdgesGo comp) defTbl) sites) B_dData_dList.C_List_Nil))

# 941 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_memberGuarded = (fun (f : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf f) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__473) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 947 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_unguardedOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__474, dtb__475) -> (if ((v_memberGuarded dtb__474) mc1) then ((v_unguardedOf dtb__475) mc1) else (B_dData_dList.C_List__x58__x58_ (dtb__474, ((v_unguardedOf dtb__475) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 953 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_allWeakEdges = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__476, dtb__477) -> (match dtb__476 with
  | { B_dData_dPair.f_Pair_first = dtb__478; B_dData_dPair.f_Pair_second = dtb__479 } -> (match dtb__478 with
  | { B_dData_dPair.f_Pair_first = dtb__480; B_dData_dPair.f_Pair_second = dtb__481 } -> (match dtb__480 with
  | { B_dData_dPair.f_Pair_first = dtb__482; B_dData_dPair.f_Pair_second = dtb__483 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__482; B_dData_dPair.f_Pair_second = dtb__483 }; B_dData_dPair.f_Pair_second = 0 }; B_dData_dPair.f_Pair_second = dtb__479 }, (v_allWeakEdges dtb__477)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 957 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_onlyUnguarded = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__484, dtb__485) -> (match dtb__484 with
  | { B_dData_dPair.f_Pair_first = dtb__486; B_dData_dPair.f_Pair_second = dtb__487 } -> (match dtb__486 with
  | { B_dData_dPair.f_Pair_first = dtb__488; B_dData_dPair.f_Pair_second = dtb__489 } -> (match dtb__488 with
  | { B_dData_dPair.f_Pair_first = dtb__490; B_dData_dPair.f_Pair_second = dtb__491 } -> (if ((B_dData_dList.v_memName dtb__490) mc0) then (if ((B_dData_dList.v_memName dtb__491) mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__490; B_dData_dPair.f_Pair_second = dtb__491 }; B_dData_dPair.f_Pair_second = dtb__489 }; B_dData_dPair.f_Pair_second = dtb__487 }, ((v_onlyUnguarded mc0) dtb__485))) else ((v_onlyUnguarded mc0) dtb__485)) else ((v_onlyUnguarded mc0) dtb__485))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_unguardedCycle = (fun (unguarded : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Elab_dTermination_dMeasure.v_hasWeakCycle unguarded) (v_allWeakEdges ((v_onlyUnguarded unguarded) edges))))

# 976 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelAcceptable = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_unguardedOf comp) defTbl) with
  | B_dData_dList.C_List_Nil -> true
  | dtb__492 -> (if ((v_unguardedCycle dtb__492) edges) then false else true)
))

# 994 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeModeOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__493; B_dData_dPair.f_Pair_second = dtb__494 } -> (match dtb__493 with
  | { B_dData_dPair.f_Pair_first = dtb__495; B_dData_dPair.f_Pair_second = dtb__496 } -> (match dtb__495 with
  | { B_dData_dPair.f_Pair_first = dtb__497; B_dData_dPair.f_Pair_second = dtb__498 } -> dtb__496
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 982 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tryFuelThread = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let edges = (((v_fuelEdgesOf comp) defTbl) sites) in (let strictCount = (B_dData_dList.v_length (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_edgeModeOf) edges))) in (if (if (if (strictCount > 0) then (((v_fuelAcceptable comp) defTbl) edges) else false) then (B_dData_dBool.v_not ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) edges)) else false) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (msg)))))))

# 13 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCaller = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__499; f_Site_siteCallee = dtb__500; f_Site_siteArgs = dtb__501; f_Site_siteSizes = dtb__502; f_Site_siteRegion = dtb__503; f_Site_siteBlind = dtb__504 } -> dtb__499
  | _ -> failwith "DT: impossible branch"
))

# 14 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCallee = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__505; f_Site_siteCallee = dtb__506; f_Site_siteArgs = dtb__507; f_Site_siteSizes = dtb__508; f_Site_siteRegion = dtb__509; f_Site_siteBlind = dtb__510 } -> dtb__506
  | _ -> failwith "DT: impossible branch"
))

# 15 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteArgs = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__511; f_Site_siteCallee = dtb__512; f_Site_siteArgs = dtb__513; f_Site_siteSizes = dtb__514; f_Site_siteRegion = dtb__515; f_Site_siteBlind = dtb__516 } -> dtb__513
  | _ -> failwith "DT: impossible branch"
))

# 16 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteSizes = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__517; f_Site_siteCallee = dtb__518; f_Site_siteArgs = dtb__519; f_Site_siteSizes = dtb__520; f_Site_siteRegion = dtb__521; f_Site_siteBlind = dtb__522 } -> dtb__520
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteRegion = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__523; f_Site_siteCallee = dtb__524; f_Site_siteArgs = dtb__525; f_Site_siteSizes = dtb__526; f_Site_siteRegion = dtb__527; f_Site_siteBlind = dtb__528 } -> dtb__527
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteBlind = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__529; f_Site_siteCallee = dtb__530; f_Site_siteArgs = dtb__531; f_Site_siteSizes = dtb__532; f_Site_siteRegion = dtb__533; f_Site_siteBlind = dtb__534 } -> dtb__534
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeFrom = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__535; f_ScEdge_edgeTo = dtb__536; f_ScEdge_scStrictEdge = dtb__537 } -> dtb__535
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeTo = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__538; f_ScEdge_edgeTo = dtb__539; f_ScEdge_scStrictEdge = dtb__540 } -> dtb__539
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scStrictEdge = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__541; f_ScEdge_edgeTo = dtb__542; f_ScEdge_scStrictEdge = dtb__543 } -> dtb__543
  | _ -> failwith "DT: impossible branch"
))
