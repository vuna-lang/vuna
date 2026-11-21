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
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc10) else (((((((((((v_siteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__7) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) mc8) dtb__8)) mc7) dtb__9) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 91 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) dtb__13) dtb__12)) mc7) dtb__11) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__13) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 110 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
# 122 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
# 149 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
# 171 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
# 184 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dRast.t_Expr B_dData_dList.t_List) (lst : Frontend_dRast.t_Expr) (cbsp : Base_dSource.t_Span) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (let acc1 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc) in (let elems = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem") in (let fullArgs = ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "$elem"), cbsp)), B_dData_dList.C_List_Nil))) in (let acc2 = ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1) in (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = fullArgs; f_Site_siteSizes = elems; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc2))))))))

# 200 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasNameOf = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))

# 203 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_lookupAlias = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = dtb__83 } -> (if (mc0 = dtb__82) then (B_dData_dMaybe.C_Maybe_Just (dtb__83)) else ((v_lookupAlias mc0) dtb__81))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dropAliases = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> ((v_dropAliases dtb__85) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((v_aliasNameOf p) <> dtb__84))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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

# 334 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scIsStrict = (fun (m : int) -> (m <> 0))

# 337 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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

# 341 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_insertEdge = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (if ((mc0).f_ScEdge_edgeFrom < (dtb__100).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101)))) else (if ((mc0).f_ScEdge_edgeFrom = (dtb__100).f_ScEdge_edgeFrom) then (if ((mc0).f_ScEdge_edgeTo <= (dtb__100).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101)))) else (B_dData_dList.C_List__x58__x58_ (dtb__100, ((v_insertEdge mc0) dtb__101)))) else (B_dData_dList.C_List__x58__x58_ (dtb__100, ((v_insertEdge mc0) dtb__101)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sortEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> ((v_insertEdge dtb__102) (v_sortEdges dtb__103))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_mergeStrict = (fun (a : t_ScEdge) (b : t_ScEdge) -> { f_ScEdge_edgeFrom = (a).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (a).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (a).f_ScEdge_scStrictEdge then true else (b).f_ScEdge_scStrictEdge) })

# 358 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_compactEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (match dtb__105 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__104, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (if ((dtb__104).f_ScEdge_edgeFrom = (dtb__106).f_ScEdge_edgeFrom) then (if ((dtb__104).f_ScEdge_edgeTo = (dtb__106).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (((v_mergeStrict dtb__104) dtb__106), (v_compactEdges dtb__107))) else (B_dData_dList.C_List__x58__x58_ (dtb__104, (v_compactEdges dtb__105)))) else (B_dData_dList.C_List__x58__x58_ (dtb__104, (v_compactEdges dtb__105))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_canonEdges = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (v_compactEdges (v_sortEdges edges)))

# 372 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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

# 385 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgesEq = (fun (a : t_ScEdge B_dData_dList.t_List) (b : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEqCanon (v_canonEdges a)) (v_canonEdges b)))

# 388 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_combineWith = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (if ((mc0).f_ScEdge_edgeTo = (dtb__114).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = (mc0).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (dtb__114).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (mc0).f_ScEdge_scStrictEdge then true else (dtb__114).f_ScEdge_scStrictEdge) }, ((v_combineWith mc0) dtb__115))) else ((v_combineWith mc0) dtb__115))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_composeGo = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> ((B_dData_dList.v_append ((v_combineWith dtb__116) mc1)) ((v_composeGo dtb__117) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_composeEdges = (fun (g1 : t_ScEdge B_dData_dList.t_List) (g2 : t_ScEdge B_dData_dList.t_List) -> (v_canonEdges ((v_composeGo g1) g2)))

# 404 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasStrict = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (if (dtb__118).f_ScEdge_scStrictEdge then true else (v_hasStrict dtb__119))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphIdempotent = (fun (edges : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEq ((v_composeEdges edges) edges)) edges))

# 413 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphOK = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (if (v_graphIdempotent edges) then (v_hasStrict edges) else true))

# 416 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphsOK = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (if (v_graphOK dtb__120) then (v_graphsOK dtb__121) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableGraphCap = 512

# 426 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableLookup = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (match dtb__122 with
  | { B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = dtb__125 } -> (if ((B_dData_dPair.v_firstOf mc0) = (B_dData_dPair.v_firstOf dtb__124)) then (if ((B_dData_dPair.v_secondOf mc0) = (B_dData_dPair.v_secondOf dtb__124)) then (B_dData_dMaybe.C_Maybe_Just (dtb__125)) else ((v_tableLookup mc0) dtb__123)) else ((v_tableLookup mc0) dtb__123))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListHas = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (if ((v_edgesEq mc0) dtb__126) then true else ((v_graphListHas mc0) dtb__127))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListSubset = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (if ((v_graphListHas dtb__128) mc1) then ((v_graphListSubset dtb__129) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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

# 453 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableAdd = (fun (f : string) (g : string) (edges : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_tableLookup { B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = g }) table) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (if ((v_graphListHas edges) dtb__136) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = true } else (if ((B_dData_dList.v_length dtb__136) >= v_tableGraphCap) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = false } else { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepHs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (let nd_uscrut8 = ((((v_tableAdd mc0) mc1) ((v_composeEdges mc2) dtb__137)) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 } -> (if dtb__140 then (((((v_closureStepHs mc0) mc1) mc2) dtb__138) dtb__139) else { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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

# 475 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStepOne = (fun (f : string) (g : string) (a : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_closureStepOneGo f) g) a) table) acc) true))

# 488 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGraphs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (let nd_uscrut8 = (((((v_closureStepOne mc0) mc1) dtb__149) mc3) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (if dtb__152 then (((((v_closureStepGraphs mc0) mc1) dtb__150) mc3) dtb__151) else { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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

# 502 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStep = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_closureStepGo table) table) table))

# 508 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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

# 505 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableSame = (fun (a : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_tableSubset a) b) else false))

# 515 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureLoop = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } } else (let nd_uscrut2 = (v_closureStep table) in (match nd_uscrut2 with
  | { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } -> (if dtb__167 then (if ((v_tableSame table) dtb__166) then { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = fuel } } else ((v_closureLoop dtb__166) (fuel - 1))) else { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } })
  | _ -> failwith "DT: impossible branch"
))))

# 533 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_basesUpToGo = (fun (i : int) (acc : int B_dData_dList.t_List) -> (if (i <= 0) then (B_dData_dList.C_List__x58__x58_ (0, acc)) else ((v_basesUpToGo (i - 1)) (B_dData_dList.C_List__x58__x58_ (i, acc)))))

# 536 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_basesUpTo = (fun (n : int) -> (if (n < 0) then B_dData_dList.C_List_Nil else ((v_basesUpToGo n) B_dData_dList.C_List_Nil)))

# 539 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasBase = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (if (mc0 = dtb__168) then true else ((v_hasBase mc0) dtb__169))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dedupBases = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (if ((v_hasBase dtb__170) dtb__171) then (v_dedupBases dtb__171) else (B_dData_dList.C_List__x58__x58_ (dtb__170, (v_dedupBases dtb__171))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOf = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__172, dtb__173, dtb__174) -> (v_patNamesOfFields dtb__173)
  | Frontend_dRast.C_Pat_PCon (dtb__175, dtb__176, dtb__177) -> (v_patNamesOfPats dtb__176)
  | Frontend_dRast.C_Pat_PAs (dtb__178, dtb__179, dtb__180) -> (B_dData_dList.C_List__x58__x58_ (dtb__178, (v_patNamesOf dtb__179)))
  | Frontend_dRast.C_Pat_PVar (dtb__181, dtb__182) -> (B_dData_dList.C_List__x58__x58_ (dtb__181, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 554 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfPats = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> ((B_dData_dList.v_append (v_patNamesOf dtb__183)) (v_patNamesOfPats dtb__184))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 558 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfFields = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> ((B_dData_dList.v_append (v_patNamesOf dtb__188)) (v_patNamesOfFields dtb__186))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_inlArgs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (B_dData_dList.C_List__x58__x58_ ((((v_inlGo mc0) mc1) dtb__189), (((v_inlArgs mc0) mc1) dtb__190)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 222 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlFields = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (match dtb__191 with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) mc1) dtb__194) }, (((v_inlFields mc0) mc1) dtb__192)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 226 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlParts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (match dtb__195 with
  | Frontend_dRast.C_InterpPart_IPText (dtb__197) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPText (dtb__197)), (((v_inlParts mc0) mc1) dtb__196)))
  | Frontend_dRast.C_InterpPart_IPHole (dtb__198) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_InterpPart_IPHole ((((v_inlGo mc0) mc1) dtb__198))), (((v_inlParts mc0) mc1) dtb__196)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 233 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
# 250 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlAlts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) ((v_dropAliases (v_patNamesOf dtb__206)) mc1)) dtb__207) }, (((v_inlAlts mc0) mc1) dtb__205)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 255 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (match dtb__208 with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = (((v_inlGo mc0) ((v_dropAliases (v_patNamesOfPats dtb__210)) mc1)) dtb__211) }, (((v_inlClauses mc0) mc1) dtb__209)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 260 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
# 272 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) -> (match mc2 with
  | Frontend_dRast.C_Expr_EInterp (dtb__221, dtb__222, dtb__223) -> (Frontend_dRast.C_Expr_EInterp (dtb__221, (((v_inlParts mc0) mc1) dtb__222), dtb__223))
  | Frontend_dRast.C_Expr_EAnn (dtb__224, dtb__225, dtb__226) -> (Frontend_dRast.C_Expr_EAnn ((((v_inlGo mc0) mc1) dtb__224), (((v_inlGo mc0) mc1) dtb__225), dtb__226))
  | Frontend_dRast.C_Expr_ESectR (dtb__227, dtb__228, dtb__229) -> (Frontend_dRast.C_Expr_ESectR ((((v_inlGo mc0) mc1) dtb__227), dtb__228, dtb__229))
  | Frontend_dRast.C_Expr_ESectL (dtb__230, dtb__231, dtb__232) -> (Frontend_dRast.C_Expr_ESectL (dtb__230, (((v_inlGo mc0) mc1) dtb__231), dtb__232))
  | Frontend_dRast.C_Expr_EBacktick (dtb__233, dtb__234, dtb__235, dtb__236) -> (Frontend_dRast.C_Expr_EBacktick (dtb__233, (((v_inlGo mc0) mc1) dtb__234), (((v_inlGo mc0) mc1) dtb__235), dtb__236))
  | Frontend_dRast.C_Expr_EParen (dtb__237, dtb__238) -> (Frontend_dRast.C_Expr_EParen ((((v_inlGo mc0) mc1) dtb__237), dtb__238))
  | Frontend_dRast.C_Expr_EInfix (dtb__239, dtb__240, dtb__241, dtb__242) -> (Frontend_dRast.C_Expr_EInfix (dtb__239, (((v_inlGo mc0) mc1) dtb__240), (((v_inlGo mc0) mc1) dtb__241), dtb__242))
  | Frontend_dRast.C_Expr_EDo (dtb__243, dtb__244) -> (Frontend_dRast.C_Expr_EDo ((((v_inlStmts mc0) mc1) dtb__243), dtb__244))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__245, dtb__246, dtb__247) -> (Frontend_dRast.C_Expr_ERecUpdate ((((v_inlGo mc0) mc1) dtb__245), (((v_inlFields mc0) mc1) dtb__246), dtb__247))
  | Frontend_dRast.C_Expr_ERecord (dtb__248, dtb__249, dtb__250) -> (Frontend_dRast.C_Expr_ERecord (dtb__248, (((v_inlFields mc0) mc1) dtb__249), dtb__250))
  | Frontend_dRast.C_Expr_EField (dtb__251, dtb__252, dtb__253) -> (Frontend_dRast.C_Expr_EField ((((v_inlGo mc0) mc1) dtb__251), dtb__252, dtb__253))
  | Frontend_dRast.C_Expr_EIf (dtb__254, dtb__255, dtb__256, dtb__257) -> (Frontend_dRast.C_Expr_EIf ((((v_inlGo mc0) mc1) dtb__254), (((v_inlGo mc0) mc1) dtb__255), (((v_inlGo mc0) mc1) dtb__256), dtb__257))
  | Frontend_dRast.C_Expr_ECase (dtb__258, dtb__259, dtb__260) -> (Frontend_dRast.C_Expr_ECase ((((v_inlGo mc0) mc1) dtb__258), (((v_inlAlts mc0) mc1) dtb__259), dtb__260))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__261, dtb__262) -> (Frontend_dRast.C_Expr_ELocalFun ((((v_inlClauses mc0) mc1) dtb__261), dtb__262))
  | Frontend_dRast.C_Expr_ELet (dtb__263, dtb__264, dtb__265, dtb__266) -> (let p = (((v_inlBinds mc0) mc1) dtb__263) in (Frontend_dRast.C_Expr_ELet ((B_dData_dPair.v_firstOf p), (((v_inlGo mc0) (B_dData_dPair.v_secondOf p)) dtb__264), dtb__265, dtb__266)))
  | Frontend_dRast.C_Expr_EPi (dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272) -> (Frontend_dRast.C_Expr_EPi (dtb__267, dtb__268, dtb__269, (((v_inlGo mc0) mc1) dtb__270), (((v_inlGo mc0) ((v_dropAliases (B_dData_dList.C_List__x58__x58_ (dtb__267, B_dData_dList.C_List_Nil))) mc1)) dtb__271), dtb__272))
  | Frontend_dRast.C_Expr_EApp (dtb__273, dtb__274, dtb__275) -> (Frontend_dRast.C_Expr_EApp ((((v_inlGo mc0) mc1) dtb__273), (((v_inlArgs mc0) mc1) dtb__274), dtb__275))
  | Frontend_dRast.C_Expr_ELam (dtb__276, dtb__277, dtb__278) -> (Frontend_dRast.C_Expr_ELam (dtb__276, (((v_inlGo mc0) ((v_dropAliases ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__276)) mc1)) dtb__277), dtb__278))
  | Frontend_dRast.C_Expr_EVar (dtb__279, dtb__280) -> (match ((v_lookupAlias (Frontend_dRast_dName.v_rnameKey dtb__279)) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__281) -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__281), dtb__280))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar (dtb__279, dtb__280))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 302 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_inlineAliases = (fun (comp : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (((v_inlGo comp) B_dData_dList.C_List_Nil) e))

# 305 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string) (mc5 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__282, dtb__283) -> (let body = ((v_inlineAliases mc0) (B_dData_dPair.v_secondOf dtb__282)) in (((((((v_siteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__283) ((((((((((v_siteWalkC ((Frontend_dRast.v_exprBudget 32) body)) mc0) mc1) mc2) mc4) mc3) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf dtb__282))) B_dData_dList.C_List_Nil) body) mc6)))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__284, dtb__285) -> (((((((v_siteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__285) (((((((v_siteCollectClauses mc0) mc1) mc2) mc4) dtb__284) ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__284) mc3)) mc6))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCollect = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_siteCollectGo comp) ctors) projs) defTbl) facts) comp) B_dData_dList.C_List_Nil))

# 562 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOfBinds = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__286, dtb__287) -> (match dtb__286 with
  | { B_dData_dPair.f_Pair_first = dtb__288; B_dData_dPair.f_Pair_second = dtb__289 } -> ((B_dData_dList.v_append (v_patNamesOf dtb__288)) (v_patNamesOfBinds dtb__287))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_argBasesGo = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) -> (match mc2 with
  | Frontend_dRast.C_Expr_EInterp (dtb__290, dtb__291, dtb__292) -> (((v_argBasesParts mc0) mc1) dtb__291)
  | Frontend_dRast.C_Expr_EAnn (dtb__293, dtb__294, dtb__295) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__293)) (((v_argBasesGo mc0) mc1) dtb__294))
  | Frontend_dRast.C_Expr_ESectR (dtb__296, dtb__297, dtb__298) -> (((v_argBasesGo mc0) mc1) dtb__296)
  | Frontend_dRast.C_Expr_ESectL (dtb__299, dtb__300, dtb__301) -> (((v_argBasesGo mc0) mc1) dtb__300)
  | Frontend_dRast.C_Expr_EBacktick (dtb__302, dtb__303, dtb__304, dtb__305) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__303)) (((v_argBasesGo mc0) mc1) dtb__304))
  | Frontend_dRast.C_Expr_EParen (dtb__306, dtb__307) -> (((v_argBasesGo mc0) mc1) dtb__306)
  | Frontend_dRast.C_Expr_EInfix (dtb__308, dtb__309, dtb__310, dtb__311) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__309)) (((v_argBasesGo mc0) mc1) dtb__310))
  | Frontend_dRast.C_Expr_EDo (dtb__312, dtb__313) -> (((v_argBasesStmts mc0) mc1) dtb__312)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__314, dtb__315, dtb__316) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__314)) (((v_argBasesFields mc0) mc1) dtb__315))
  | Frontend_dRast.C_Expr_ERecord (dtb__317, dtb__318, dtb__319) -> (((v_argBasesFields mc0) mc1) dtb__318)
  | Frontend_dRast.C_Expr_EField (dtb__320, dtb__321, dtb__322) -> (((v_argBasesGo mc0) mc1) dtb__320)
  | Frontend_dRast.C_Expr_EIf (dtb__323, dtb__324, dtb__325, dtb__326) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__323)) ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__324)) (((v_argBasesGo mc0) mc1) dtb__325)))
  | Frontend_dRast.C_Expr_ECase (dtb__327, dtb__328, dtb__329) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__327)) (((v_argBasesAlts mc0) mc1) dtb__328))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__330, dtb__331) -> (((v_argBasesClauses mc0) mc1) dtb__330)
  | Frontend_dRast.C_Expr_ELet (dtb__332, dtb__333, dtb__334, dtb__335) -> ((B_dData_dList.v_append (((v_argBasesBinds mc0) mc1) dtb__332)) (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOfBinds dtb__332)) mc1)) dtb__333))
  | Frontend_dRast.C_Expr_EPi (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__339)) (((v_argBasesGo mc0) mc1) dtb__340))
  | Frontend_dRast.C_Expr_EApp (dtb__342, dtb__343, dtb__344) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__342)) (((v_argBasesArgs mc0) mc1) dtb__343))
  | Frontend_dRast.C_Expr_ELam (dtb__345, dtb__346, dtb__347) -> (((v_argBasesGo mc0) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__345)) mc1)) dtb__346)
  | Frontend_dRast.C_Expr_EVar (dtb__348, dtb__349) -> (let name = (Frontend_dRast_dName.v_rnameKey dtb__348) in (let nd_uscrut6 = ((Elab_dTermination_dMeasure.v_sizeOfVarStrict name) mc0) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName name) mc1) then (v_basesUpTo (v_maxBaseOf mc0)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__350) -> (match dtb__350 with
  | { B_dData_dPair.f_Pair_first = dtb__351; B_dData_dPair.f_Pair_second = dtb__352 } -> (B_dData_dList.C_List__x58__x58_ (dtb__351, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> B_dData_dList.C_List_Nil
))
# 606 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesArgs = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__353, dtb__354) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__353)) (((v_argBasesArgs mc0) mc1) dtb__354))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 611 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesFields = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__355, dtb__356) -> (match dtb__355 with
  | { B_dData_dPair.f_Pair_first = dtb__357; B_dData_dPair.f_Pair_second = dtb__358 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__358)) (((v_argBasesFields mc0) mc1) dtb__356))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 616 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBinds = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (match dtb__359 with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__362)) (((v_argBasesBinds mc0) mc1) dtb__360))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 621 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesAlts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__363, dtb__364) -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOf dtb__365)) mc1)) dtb__366)) (((v_argBasesAlts mc0) mc1) dtb__364))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 626 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesClauses = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> (match dtb__367 with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> ((B_dData_dList.v_append (((v_argBasesGo mc0) ((B_dData_dList.v_append (v_patNamesOfPats dtb__369)) mc1)) dtb__370)) (((v_argBasesClauses mc0) mc1) dtb__368))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 633 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesStmts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__371 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__373, dtb__374, dtb__375) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__374)) (((v_argBasesStmts mc0) ((B_dData_dList.v_append (v_patNamesOf dtb__373)) mc1)) dtb__372))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__376, dtb__377) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__376)) (((v_argBasesStmts mc0) mc1) dtb__372))
  | Frontend_dRast.C_DoStmt_DLet (dtb__378, dtb__379) -> ((B_dData_dList.v_append (((v_argBasesBinds mc0) mc1) dtb__378)) (((v_argBasesStmts mc0) ((B_dData_dList.v_append (v_patNamesOfBinds dtb__378)) mc1)) dtb__372))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 645 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesParts = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_InterpPart B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__380, dtb__381) -> (match dtb__380 with
  | Frontend_dRast.C_InterpPart_IPText (dtb__382) -> (((v_argBasesParts mc0) mc1) dtb__381)
  | Frontend_dRast.C_InterpPart_IPHole (dtb__383) -> ((B_dData_dList.v_append (((v_argBasesGo mc0) mc1) dtb__383)) (((v_argBasesParts mc0) mc1) dtb__381))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBases = (fun (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (v_dedupBases (((v_argBasesGo sizes) B_dData_dList.C_List_Nil) e)))

# 653 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesJ = (fun (arity : int) (i : int) -> (if (arity <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = (arity - 1); f_ScEdge_scStrictEdge = false }, ((v_blindEdgesJ (arity - 1)) i)))))

# 657 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesI = (fun (i : int) (arity : int) -> (if (i <= 0) then (if (i = 0) then ((v_blindEdgesJ arity) 0) else B_dData_dList.C_List_Nil) else ((B_dData_dList.v_append ((v_blindEdgesJ arity) i)) ((v_blindEdgesI (i - 1)) arity))))

# 664 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindEdges = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> ((v_blindEdgesI ((Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCaller) defTbl)) - 1)) (Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCallee) defTbl))))

# 670 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgeAt = (fun (i : int) (j : int) (deps : int B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (s).f_Site_siteArgs) j) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__384) -> (match ((((((((Elab_dTermination_dMeasure.v_relOfArg i) dtb__384) (s).f_Site_siteSizes) ctors) projs) (s).f_Site_siteCaller) facts) (s).f_Site_siteRegion) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = (v_scIsStrict dtb__385) }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasBase i) deps) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = false }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 680 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_nthDeps = (fun (mc0 : int B_dData_dList.t_List B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__386, dtb__387) -> (if (mc1 <= 0) then dtb__386 else ((v_nthDeps dtb__387) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 684 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesJ = (fun (i : int) (count : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (count <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((((((v_siteEdgeAt i) (count - 1)) ((v_nthDeps deps) (count - 1))) s) ctors) projs) facts)) (((((((v_siteEdgesJ i) (count - 1)) deps) s) ctors) projs) facts))))

# 693 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesI = (fun (i : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (i <= 0) then (((((((v_siteEdgesJ 0) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts) else ((B_dData_dList.v_append (((((((v_siteEdgesJ i) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts)) ((((((v_siteEdgesI (i - 1)) deps) s) ctors) projs) facts))))

# 702 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgesOf = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> (if (s).f_Site_siteBlind then ((v_blindEdges defTbl) s) else ((((((v_siteEdgesI (v_maxBaseOf (s).f_Site_siteSizes)) ((B_dData_dList.v_map (v_argBases (s).f_Site_siteSizes)) (s).f_Site_siteArgs)) s) ctors) projs) facts)))

# 712 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_initialTableGo = (fun (mc0 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : t_Site B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : bool) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__388, dtb__389) -> (if mc6 then (match ((((v_tableAdd (dtb__388).f_Site_siteCaller) (dtb__388).f_Site_siteCallee) (((((v_siteEdgesOf mc0) mc2) mc3) mc4) dtb__388)) mc5) with
  | { B_dData_dPair.f_Pair_first = dtb__390; B_dData_dPair.f_Pair_second = dtb__391 } -> (((((((v_initialTableGo mc0) dtb__389) mc2) mc3) mc4) dtb__390) dtb__391)
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = false })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = mc6 }
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_initialTable = (fun (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_initialTableGo defTbl) sites) ctors) projs) facts) B_dData_dList.C_List_Nil) true))

# 725 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctClosureFuel = 240

# 729 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctCheckTable = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__392, dtb__393) -> (match dtb__392 with
  | { B_dData_dPair.f_Pair_first = dtb__394; B_dData_dPair.f_Pair_second = dtb__395 } -> (match dtb__394 with
  | { B_dData_dPair.f_Pair_first = dtb__396; B_dData_dPair.f_Pair_second = dtb__397 } -> (if (dtb__396 = dtb__397) then (if (v_graphsOK dtb__395) then (v_sctCheckTable dtb__393) else false) else (v_sctCheckTable dtb__393))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 734 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadGraphs = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__398, dtb__399) -> (if (v_graphOK dtb__398) then ((v_sctBadGraphs mc0) dtb__399) else (B_dData_dList.C_List__x58__x58_ (mc0, ((v_sctBadGraphs mc0) dtb__399))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 738 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadPairs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__400, dtb__401) -> (match dtb__400 with
  | { B_dData_dPair.f_Pair_first = dtb__402; B_dData_dPair.f_Pair_second = dtb__403 } -> (match dtb__402 with
  | { B_dData_dPair.f_Pair_first = dtb__404; B_dData_dPair.f_Pair_second = dtb__405 } -> (if (dtb__404 = dtb__405) then ((B_dData_dList.v_append ((v_sctBadGraphs dtb__404) dtb__403)) (v_sctBadPairs dtb__401)) else (v_sctBadPairs dtb__401))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_strictEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(bi_strFromInt (e).f_ScEdge_edgeFrom); "->>"; (bi_strFromInt (e).f_ScEdge_edgeTo)]))

# 749 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_weakEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(bi_strFromInt (e).f_ScEdge_edgeFrom); "->"; (bi_strFromInt (e).f_ScEdge_edgeTo)]))

# 743 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeText = (fun (e : t_ScEdge) -> (if (e).f_ScEdge_scStrictEdge then (v_strictEdgeText e) else (v_weakEdgeText e)))

# 752 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesText = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__406, dtb__407) -> (match dtb__407 with
  | B_dData_dList.C_List_Nil -> (v_edgeText dtb__406)
  | _ -> (String.concat "" [(v_edgeText dtb__406); ","; (v_edgesText dtb__407)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 757 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_badGraphText = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__408, dtb__409) -> (if (v_graphOK dtb__408) then ((v_badGraphText mc0) dtb__409) else (B_dData_dList.C_List__x58__x58_ ((String.concat "" [mc0; "{"; (v_edgesText dtb__408); "}"]), ((v_badGraphText mc0) dtb__409))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadText = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__410, dtb__411) -> (match dtb__410 with
  | { B_dData_dPair.f_Pair_first = dtb__412; B_dData_dPair.f_Pair_second = dtb__413 } -> (match dtb__412 with
  | { B_dData_dPair.f_Pair_first = dtb__414; B_dData_dPair.f_Pair_second = dtb__415 } -> (if (dtb__414 = dtb__415) then ((B_dData_dList.v_append ((v_badGraphText dtb__414) dtb__413)) (v_sctBadText dtb__411)) else (v_sctBadText dtb__411))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 767 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctDiag = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_joinComma (Elab_dTermination_dMeasure.v_dedup (v_sctBadText table))))

# 772 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_isBlindSite = (fun (s : t_Site) -> (s).f_Site_siteBlind)

# 775 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindPairText = (fun (s : t_Site) -> (String.concat "" [(s).f_Site_siteCaller; "->"; (s).f_Site_siteCallee]))

# 778 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctBlindNote = (fun (sites : t_Site B_dData_dList.t_List) -> (match (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_map v_blindPairText) ((B_dData_dList.v_filter v_isBlindSite) sites))) with
  | B_dData_dList.C_List_Nil -> ""
  | dtb__416 -> (String.concat "" [" [SCT \230\156\170\232\175\134\229\136\171\232\176\131\231\148\168\239\188\154"; (Elab_dTermination_dMeasure.v_joinComma dtb__416); "\239\188\136callee \228\187\165\229\128\188\228\188\160\233\128\146\230\136\150\233\129\141\229\142\134\233\162\132\231\174\151\232\128\151\229\176\189\239\188\140\229\143\170\230\140\137\229\188\177\232\190\185\232\174\161\229\133\165\239\188\137]"])
))

# 790 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_countGraphs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__417, dtb__418) -> (match dtb__417 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> ((B_dData_dList.v_length dtb__420) + (v_countGraphs dtb__418))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 794 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheckGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let note = (v_sctBlindNote sites) in (let _u = ((B_dData_dObs.v_obsCounter "vuna.counter.term.scc_size") (B_dData_dList.v_length comp)) in (let _u = ((B_dData_dObs.v_obsCounter "vuna.counter.term.sites") (B_dData_dList.v_length sites)) in (match (((((v_initialTable defTbl) sites) ctors) projs) facts) with
  | { B_dData_dPair.f_Pair_first = dtb__421; B_dData_dPair.f_Pair_second = dtb__422 } -> (if dtb__422 then (let _u = ((B_dData_dObs.v_obsCounter "vuna.counter.term.graphs") (v_countGraphs dtb__421)) in (let nd_uscrut12 = ((v_closureLoop dtb__421) v_sctClosureFuel) in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__423; B_dData_dPair.f_Pair_second = dtb__424 } -> (match dtb__424 with
  | { B_dData_dPair.f_Pair_first = dtb__425; B_dData_dPair.f_Pair_second = dtb__426 } -> (let _u = ((B_dData_dObs.v_obsCounter "vuna.counter.term.closure_rounds") (v_sctClosureFuel - dtb__426)) in (let _u = ((B_dData_dObs.v_obsCounter "vuna.counter.term.graphs_final") (v_countGraphs dtb__423)) in (if dtb__425 then (if (v_sctCheckTable dtb__423) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_sctDiag dtb__423); "]"])) msg))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_sctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\148\190\229\188\131\239\188\154size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (bi_strFromInt v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (bi_strFromInt v_sctClosureFuel); " \232\189\174\239\188\137]"])) msg)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 785 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheck = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> ((Base_dObs.v_obsCheck "vuna.term.sct") (fun (_u : int) -> ((((((v_sctCheckGo comp) defTbl) ctors) projs) facts) msg))))

# 822 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramNamesOf = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__427, dtb__428) -> (match dtb__427 with
  | Frontend_dRast.C_Pat_PVar (dtb__429, dtb__430) -> (B_dData_dList.C_List__x58__x58_ (dtb__429, (v_paramNamesOf dtb__428)))
  | _ -> (v_paramNamesOf dtb__428)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 829 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramIndexGo = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__431, dtb__432) -> (match dtb__431 with
  | Frontend_dRast.C_Pat_PVar (dtb__433, dtb__434) -> (if (dtb__433 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_paramIndexGo dtb__432) mc1) (mc2 + 1)))
  | _ -> (((v_paramIndexGo dtb__432) mc1) (mc2 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 840 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasFuelGuard = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_ELam (dtb__435, dtb__436, dtb__437) -> ((v_hasFuelGuard mc0) dtb__436)
  | Frontend_dRast.C_Expr_ELet (dtb__438, dtb__439, dtb__440, dtb__441) -> (if ((v_hasFuelGuard mc0) dtb__439) then true else ((v_anyBindFuelGuard mc0) dtb__438))
  | Frontend_dRast.C_Expr_ECase (dtb__442, dtb__443, dtb__444) -> ((v_anyAltFuelGuard mc0) dtb__443)
  | Frontend_dRast.C_Expr_EIf (dtb__445, dtb__446, dtb__447, dtb__448) -> (match (Elab_dTermination_dMeasure.v_guardPosVar dtb__445) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__449) -> (dtb__449 = mc0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasFuelGuard mc0) dtb__446) then true else ((v_hasFuelGuard mc0) dtb__447))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))
# 850 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyAltFuelGuard = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> (match dtb__450 with
  | { B_dData_dPair.f_Pair_first = dtb__452; B_dData_dPair.f_Pair_second = dtb__453 } -> (if ((v_hasFuelGuard mc0) dtb__453) then true else ((v_anyAltFuelGuard mc0) dtb__451))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 855 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyBindFuelGuard = (fun (mc0 : string) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__454, dtb__455) -> (match dtb__454 with
  | { B_dData_dPair.f_Pair_first = dtb__456; B_dData_dPair.f_Pair_second = dtb__457 } -> (if ((v_hasFuelGuard mc0) dtb__457) then true else ((v_anyBindFuelGuard mc0) dtb__455))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 860 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_guardParamGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__458, dtb__459) -> (if ((v_hasFuelGuard dtb__458) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__458)) else ((v_guardParamGo dtb__459) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 865 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamNameOf = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__460, dtb__461) -> ((v_guardParamGo (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__460))) (B_dData_dPair.v_secondOf dtb__460))
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamIndexOf = (fun (callee : string) (callerFuel : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl callee) defTbl) with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__462, dtb__463) -> (let pats = (B_dData_dPair.v_firstOf dtb__462) in (match ((v_fuelParamNameOf callee) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__464) -> (((v_paramIndexGo pats) dtb__464) 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_paramIndexGo pats) callerFuel) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__465) -> (B_dData_dMaybe.C_Maybe_Just (dtb__465))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 887 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_callerFuelName = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf name) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__466) -> dtb__466
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__467, dtb__468) -> (match (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__467)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__469, dtb__470) -> dtb__469
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 899 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_paramsOf = (fun (name : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__471, dtb__472) -> (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__471))
  | _ -> failwith "DT: impossible branch"
))

# 908 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteFuelStrict = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : int B_dData_dMaybe.t_Maybe) (mc3 : t_Site) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__473) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (mc3).f_Site_siteArgs) dtb__473) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__474) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = dtb__474 in (match nd_uscrut9 with
  | Frontend_dRast.C_Expr_EApp (dtb__475, dtb__476, dtb__477) -> (match dtb__475 with
  | Frontend_dRast.C_Expr_EVar (dtb__478, dtb__479) -> (if (Elab_dTermination_dMeasure.v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__478)) then (let nd_uscrut15 = dtb__476 in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__480, dtb__481) -> (match dtb__480 with
  | Frontend_dRast.C_Expr_EVar (dtb__482, dtb__483) -> (match dtb__481 with
  | B_dData_dList.C_List__x58__x58_ (dtb__484, dtb__485) -> (match dtb__484 with
  | Frontend_dRast.C_Expr_EInt (dtb__486, dtb__487) -> (match dtb__485 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__486 > 0) then ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__482)) mc0) else false) then (B_dData_dMaybe.C_Maybe_Just (true)) else (B_dData_dMaybe.C_Maybe_Just (false)))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__488) -> (let nd_uscrut10 = dtb__474 in (match nd_uscrut10 with
  | Frontend_dRast.C_Expr_EApp (dtb__489, dtb__490, dtb__491) -> (match dtb__489 with
  | Frontend_dRast.C_Expr_EVar (dtb__492, dtb__493) -> (if (Elab_dTermination_dMeasure.v_isSubOpName (Frontend_dRast_dName.v_rnameKey dtb__492)) then (let nd_uscrut16 = dtb__490 in (match nd_uscrut16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__494, dtb__495) -> (match dtb__494 with
  | Frontend_dRast.C_Expr_EVar (dtb__496, dtb__497) -> (match dtb__495 with
  | B_dData_dList.C_List__x58__x58_ (dtb__498, dtb__499) -> (match dtb__498 with
  | Frontend_dRast.C_Expr_EInt (dtb__500, dtb__501) -> (match dtb__499 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__496) = dtb__488) then (if (dtb__500 > 0) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
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
  | Frontend_dRast.C_Expr_EVar (dtb__502, dtb__503) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__502) = dtb__488) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 942 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_fuelEdgesGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : t_Site B_dData_dList.t_List) (mc3 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__504, dtb__505) -> (let inGroup = ((B_dData_dList.v_memName (dtb__504).f_Site_siteCallee) mc0) in (let mode = (let nd_uscrut8 = ((((v_siteFuelStrict ((v_paramsOf (dtb__504).f_Site_siteCaller) mc1)) ((v_fuelParamNameOf (dtb__504).f_Site_siteCaller) mc1)) (((v_fuelParamIndexOf (dtb__504).f_Site_siteCallee) ((v_callerFuelName (dtb__504).f_Site_siteCaller) mc1)) mc1)) dtb__504) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__506) -> (if dtb__506 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) in (let acc2 = (if inGroup then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (dtb__504).f_Site_siteCaller; B_dData_dPair.f_Pair_second = (dtb__504).f_Site_siteCallee }; B_dData_dPair.f_Pair_second = mode }; B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, mc3)) else mc3) in ((((v_fuelEdgesGo mc0) mc1) dtb__505) acc2))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 937 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelEdgesOf = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) -> ((((v_fuelEdgesGo comp) defTbl) sites) B_dData_dList.C_List_Nil))

# 960 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_memberGuarded = (fun (f : string) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf f) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__507) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 966 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_unguardedOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__508, dtb__509) -> (if ((v_memberGuarded dtb__508) mc1) then ((v_unguardedOf dtb__509) mc1) else (B_dData_dList.C_List__x58__x58_ (dtb__508, ((v_unguardedOf dtb__509) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 972 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_allWeakEdges = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__510, dtb__511) -> (match dtb__510 with
  | { B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = dtb__513 } -> (match dtb__512 with
  | { B_dData_dPair.f_Pair_first = dtb__514; B_dData_dPair.f_Pair_second = dtb__515 } -> (match dtb__514 with
  | { B_dData_dPair.f_Pair_first = dtb__516; B_dData_dPair.f_Pair_second = dtb__517 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__516; B_dData_dPair.f_Pair_second = dtb__517 }; B_dData_dPair.f_Pair_second = 0 }; B_dData_dPair.f_Pair_second = dtb__513 }, (v_allWeakEdges dtb__511)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 977 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_onlyUnguarded = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__518, dtb__519) -> (match dtb__518 with
  | { B_dData_dPair.f_Pair_first = dtb__520; B_dData_dPair.f_Pair_second = dtb__521 } -> (match dtb__520 with
  | { B_dData_dPair.f_Pair_first = dtb__522; B_dData_dPair.f_Pair_second = dtb__523 } -> (match dtb__522 with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> (if ((B_dData_dList.v_memName dtb__524) mc0) then (if ((B_dData_dList.v_memName dtb__525) mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 }; B_dData_dPair.f_Pair_second = dtb__523 }; B_dData_dPair.f_Pair_second = dtb__521 }, ((v_onlyUnguarded mc0) dtb__519))) else ((v_onlyUnguarded mc0) dtb__519)) else ((v_onlyUnguarded mc0) dtb__519))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 989 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_unguardedCycle = (fun (unguarded : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Elab_dTermination_dMeasure.v_hasWeakCycle unguarded) (v_allWeakEdges ((v_onlyUnguarded unguarded) edges))))

# 996 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelAcceptable = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_unguardedOf comp) defTbl) with
  | B_dData_dList.C_List_Nil -> true
  | dtb__526 -> (if ((v_unguardedCycle dtb__526) edges) then false else true)
))

# 1014 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeModeOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> (match dtb__527 with
  | { B_dData_dPair.f_Pair_first = dtb__529; B_dData_dPair.f_Pair_second = dtb__530 } -> (match dtb__529 with
  | { B_dData_dPair.f_Pair_first = dtb__531; B_dData_dPair.f_Pair_second = dtb__532 } -> dtb__530
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1002 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tryFuelThread = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let edges = (((v_fuelEdgesOf comp) defTbl) sites) in (let strictCount = (B_dData_dList.v_length (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_edgeModeOf) edges))) in (if (if (if (strictCount > 0) then (((v_fuelAcceptable comp) defTbl) edges) else false) then (B_dData_dBool.v_not ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) edges)) else false) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (msg)))))))
