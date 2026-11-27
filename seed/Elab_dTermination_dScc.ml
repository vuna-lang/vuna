open Vuna_runtime
type t_Site = { f_Site_siteCaller : string; f_Site_siteCallee : string; f_Site_siteArgs : Frontend_dAst.t_Expr B_dData_dList.t_List; f_Site_siteSizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Site_siteRegion : string B_dData_dList.t_List; f_Site_siteBlind : bool }
and t_ScEdge = { f_ScEdge_edgeFrom : int; f_ScEdge_edgeTo : int; f_ScEdge_scStrictEdge : bool }

# 27 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindSitesOf = (fun (comp : string B_dData_dList.t_List) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (g : string) -> { f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = true })) comp))

# 122 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_clauseWalkPair = (fun (c : Frontend_dAst.t_LocalClause) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_exprSpan (c).Frontend_dAst.f_LocalClause_lcBody)))); B_dData_dPair.f_Pair_second = (c).Frontend_dAst.f_LocalClause_lcBody })

# 118 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_bindingWalkPairs = (fun (mc0 : Frontend_dAst.t_Binding) -> (match mc0 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__0; Frontend_dAst.f_Binding_bindValue = dtb__1; Frontend_dAst.f_Binding_bindSig = dtb__2; Frontend_dAst.f_Binding_bindRef = dtb__3 } -> (match dtb__1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__4) -> ((B_dData_dList.v_map v_clauseWalkPair) dtb__4)
  | Frontend_dAst.C_BindingValue_BVal (dtb__5) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__0; B_dData_dPair.f_Pair_second = dtb__5 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_bindsToWalkPairs = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> ((B_dData_dList.v_append (v_bindingWalkPairs dtb__6)) (v_bindsToWalkPairs dtb__7))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectList = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__9) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__8) mc9)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 54 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__11) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__13) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 73 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dAst.t_Expr) (mc9 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc10 : t_Site B_dData_dList.t_List) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc10) else (((((((((((v_siteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__15) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) mc8) (dtb__14).Frontend_dAst.f_Alt_altPat)) mc7) (dtb__14).Frontend_dAst.f_Alt_altBody) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 93 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | { B_dData_dPair.f_Pair_first = dtb__18; B_dData_dPair.f_Pair_second = dtb__19 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) dtb__19) dtb__18)) mc7) dtb__17) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 125 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectStmts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else (match dtb__20 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__22, dtb__23, dtb__24) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) dtb__23) dtb__22)) mc7) dtb__21) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__23) mc9))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__25, dtb__26) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__21) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__25) mc9))
  | Frontend_dAst.C_DoStmt_DLet (dtb__27, dtb__28) -> ((((((((((v_siteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((Elab_dTermination_dMeasure.v_extendByBinds mc3) dtb__27) mc6)) mc7) dtb__21) ((((((((((v_siteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) (v_bindsToWalkPairs dtb__27)) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 137 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkC = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (match e with
  | Frontend_dAst.C_Expr_EApp (dtb__29, dtb__30, dtb__31) -> (((((((((((v_siteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__29) dtb__30) acc)
  | Frontend_dAst.C_Expr_ECase (dtb__32, dtb__33, dtb__34) -> (((((((((((v_siteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) dtb__33) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) acc))
  | Frontend_dAst.C_Expr_EIf (dtb__35, dtb__36, dtb__37, dtb__38) -> (let acc1 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__35) acc) in (let acc2 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb__35)) region)) dtb__36) acc1) in ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb__35)) region)) dtb__37) acc2)))
  | Frontend_dAst.C_Expr_ELam (dtb__39, dtb__40, dtb__41) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__40) acc)
  | Frontend_dAst.C_Expr_ELet (dtb__42, dtb__43, dtb__44, dtb__45) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) (((Elab_dTermination_dMeasure.v_extendByBinds projs) dtb__42) sizes)) region) dtb__43) ((((((((((v_siteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (v_bindsToWalkPairs dtb__42)) acc))
  | Frontend_dAst.C_Expr_EPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__50) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__49) acc))
  | Frontend_dAst.C_Expr_EField (dtb__52, dtb__53, dtb__54) -> ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc)
  | Frontend_dAst.C_Expr_ERecord (dtb__55, dtb__56, dtb__57) -> ((((((((((v_siteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__56) acc)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__58, dtb__59, dtb__60) -> ((((((((((v_siteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__59) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) acc))
  | Frontend_dAst.C_Expr_EDo (dtb__61, dtb__62) -> ((((((((((v_siteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__61) acc)
  | Frontend_dAst.C_Expr_EVar (dtb__63, dtb__64) -> (if ((B_dData_dList.v_memName dtb__63) comp) then (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = dtb__63; f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = true }, acc)) else acc)
  | Frontend_dAst.C_Expr_EInt (dtb__65, dtb__66) -> acc
  | Frontend_dAst.C_Expr_EStr (dtb__67, dtb__68) -> acc
  | Frontend_dAst.C_Expr_EFloat (dtb__69, dtb__70) -> acc
  | Frontend_dAst.C_Expr_EInterp (dtb__71, dtb__72) -> acc
  | _ -> failwith "DT: impossible branch"
)))
# 163 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = dtb__73; f_Site_siteArgs = args; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__74, dtb__75) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__74) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__76) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__77) -> (let acc1 = ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (dtb__77).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc) in (let sizes2 = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__77).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__77).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) (dtb__77).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__76).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then (((((((((((v_siteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
# 185 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (let nd_uscrut11 = args in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__79 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut19 = dtb__78 in (match nd_uscrut19 with
  | Frontend_dAst.C_Expr_EVar (dtb__82, dtb__83) -> (if ((B_dData_dList.v_memName dtb__82) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__82) B_dData_dList.C_List_Nil) dtb__80) (Frontend_dAst.v_nodeRefSpan dtb__83)) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Frontend_dAst.C_Expr_EApp (dtb__84, dtb__85, dtb__86) -> (match dtb__84 with
  | Frontend_dAst.C_Expr_EVar (dtb__87, dtb__88) -> (if ((B_dData_dList.v_memName dtb__87) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__87) dtb__85) dtb__80) (Frontend_dAst.v_nodeRefSpan dtb__86)) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
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
# 198 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dAst.t_Expr B_dData_dList.t_List) (lst : Frontend_dAst.t_Expr) (cbsp : Base_dSource.t_Span) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (let acc1 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc) in (let elems = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem") in (let fullArgs = ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("$elem", (Frontend_dAst.v_detachedNodeRef cbsp))), B_dData_dList.C_List_Nil))) in (let acc2 = ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1) in (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = fullArgs; f_Site_siteSizes = elems; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc2))))))))

# 214 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasNameOf = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))

# 217 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_lookupAlias = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> (if (mc0 = dtb__91) then (B_dData_dMaybe.C_Maybe_Just (dtb__92)) else ((v_lookupAlias mc0) dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dropAliases = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> ((v_dropAliases dtb__94) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((v_aliasNameOf p) <> dtb__93))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__95; B_dData_dPair.f_Pair_second = dtb__96 } -> (match dtb__95 with
  | Frontend_dAst.C_Pat_PVar (dtb__97, dtb__98) -> (match dtb__96 with
  | Frontend_dAst.C_Expr_EVar (dtb__99, dtb__100) -> (if ((B_dData_dList.v_memName dtb__99) mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__99 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_inlArgsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (B_dData_dList.C_List__x58__x58_ (((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__101), ((((v_inlArgsF (mc0 - 1)) mc1) mc2) dtb__102)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 237 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlFieldsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (match dtb__103 with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = ((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__106) }, ((((v_inlFieldsF (mc0 - 1)) mc1) mc2) dtb__104)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 242 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlPartsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__109) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__109)), ((((v_inlPartsF (mc0 - 1)) mc1) mc2) dtb__108)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__110) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__110))), ((((v_inlPartsF (mc0 - 1)) mc1) mc2) dtb__108)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 249 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBindsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (let b2 = ((((v_inlBindingF (mc0 - 1)) mc1) mc2) dtb__111) in (match (b2).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__113) -> (match ((v_aliasOf mc1) { B_dData_dPair.f_Pair_first = (b2).Frontend_dAst.f_Binding_bindPat; B_dData_dPair.f_Pair_second = dtb__113 }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (let restP = ((((v_inlBindsF (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__114, mc2))) dtb__112) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf restP); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | B_dData_dMaybe.C_Maybe_Nothing -> (let restP = ((((v_inlBindsF (mc0 - 1)) mc1) ((v_dropAliases (Frontend_dAstWalk.v_patBinders (b2).Frontend_dAst.f_Binding_bindPat)) mc2)) dtb__112) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (b2, (B_dData_dPair.v_firstOf restP))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__115) -> (let restP = ((((v_inlBindsF (mc0 - 1)) mc1) ((v_dropAliases (Frontend_dAstWalk.v_patBinders (b2).Frontend_dAst.f_Binding_bindPat)) mc2)) dtb__112) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (b2, (B_dData_dPair.v_firstOf restP))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))
# 270 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBindingF = (fun (fuel : int) (comp : string B_dData_dList.t_List) (als : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__117) -> (Frontend_dAst.C_BindingValue_BVal (((((v_inlGoF (fuel - 1)) comp) als) dtb__117)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb__118) -> (Frontend_dAst.C_BindingValue_BClauses (((((v_inlClausesF (fuel - 1)) comp) als) dtb__118)))
  | _ -> failwith "DT: impossible branch"
) in (let sig_ = (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb__116 with Frontend_dAst.f_BindingSig_sigType = ((((v_inlGoF (fuel - 1)) comp) als) (dtb__116).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { b with Frontend_dAst.f_Binding_bindValue = value; Frontend_dAst.f_Binding_bindSig = sig_ })))
# 283 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlAltsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (B_dData_dList.C_List__x58__x58_ ({ dtb__119 with Frontend_dAst.f_Alt_altBody = ((((v_inlGoF (mc0 - 1)) mc1) ((v_dropAliases (Frontend_dAstWalk.v_patBinders (dtb__119).Frontend_dAst.f_Alt_altPat)) mc2)) (dtb__119).Frontend_dAst.f_Alt_altBody) }, ((((v_inlAltsF (mc0 - 1)) mc1) mc2) dtb__120)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 289 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlClausesF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (B_dData_dList.C_List__x58__x58_ ({ dtb__121 with Frontend_dAst.f_LocalClause_lcBody = ((((v_inlGoF (mc0 - 1)) mc1) ((v_dropAliases ((B_dData_dList.v_concatMap Frontend_dAstWalk.v_patBinders) (dtb__121).Frontend_dAst.f_LocalClause_lcPats)) mc2)) (dtb__121).Frontend_dAst.f_LocalClause_lcBody) }, ((((v_inlClausesF (mc0 - 1)) mc1) mc2) dtb__122)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 295 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlStmtsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__125, dtb__126, dtb__127) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb__125, ((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__126), dtb__127)), ((((v_inlStmtsF (mc0 - 1)) mc1) ((v_dropAliases (Frontend_dAstWalk.v_patBinders dtb__125)) mc2)) dtb__124)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__128, dtb__129) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr (((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__128), dtb__129)), ((((v_inlStmtsF (mc0 - 1)) mc1) mc2) dtb__124)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__130, dtb__131) -> (let p = ((((v_inlBindsF (mc0 - 1)) mc1) mc2) dtb__130) in (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet ((B_dData_dPair.v_firstOf p), dtb__131)), ((((v_inlStmtsF (mc0 - 1)) mc1) (B_dData_dPair.v_secondOf p)) dtb__124))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 308 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlGoF = (fun (fuel : int) (comp : string B_dData_dList.t_List) (als : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then e else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__132, dtb__133) -> (match ((v_lookupAlias dtb__132) als) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (Frontend_dAst.C_Expr_EVar (dtb__134, dtb__133))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar (dtb__132, dtb__133))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ELam (dtb__135, dtb__136, dtb__137) -> (Frontend_dAst.C_Expr_ELam (dtb__135, ((((v_inlGoF (fuel - 1)) comp) ((v_dropAliases ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__135)) als)) dtb__136), dtb__137))
  | Frontend_dAst.C_Expr_EApp (dtb__138, dtb__139, dtb__140) -> (Frontend_dAst.C_Expr_EApp (((((v_inlGoF (fuel - 1)) comp) als) dtb__138), ((((v_inlArgsF (fuel - 1)) comp) als) dtb__139), dtb__140))
  | Frontend_dAst.C_Expr_EPi (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> (Frontend_dAst.C_Expr_EPi (dtb__141, dtb__142, dtb__143, ((((v_inlGoF (fuel - 1)) comp) als) dtb__144), ((((v_inlGoF (fuel - 1)) comp) ((v_dropAliases (B_dData_dList.C_List__x58__x58_ (dtb__141, B_dData_dList.C_List_Nil))) als)) dtb__145), dtb__146))
  | Frontend_dAst.C_Expr_ELet (dtb__147, dtb__148, dtb__149, dtb__150) -> (let p = ((((v_inlBindsF (fuel - 1)) comp) als) dtb__147) in (Frontend_dAst.C_Expr_ELet ((B_dData_dPair.v_firstOf p), ((((v_inlGoF (fuel - 1)) comp) (B_dData_dPair.v_secondOf p)) dtb__148), dtb__149, dtb__150)))
  | Frontend_dAst.C_Expr_ECase (dtb__151, dtb__152, dtb__153) -> (Frontend_dAst.C_Expr_ECase (((((v_inlGoF (fuel - 1)) comp) als) dtb__151), ((((v_inlAltsF (fuel - 1)) comp) als) dtb__152), dtb__153))
  | Frontend_dAst.C_Expr_EIf (dtb__154, dtb__155, dtb__156, dtb__157) -> (Frontend_dAst.C_Expr_EIf (((((v_inlGoF (fuel - 1)) comp) als) dtb__154), ((((v_inlGoF (fuel - 1)) comp) als) dtb__155), ((((v_inlGoF (fuel - 1)) comp) als) dtb__156), dtb__157))
  | Frontend_dAst.C_Expr_EField (dtb__158, dtb__159, dtb__160) -> (Frontend_dAst.C_Expr_EField (((((v_inlGoF (fuel - 1)) comp) als) dtb__158), dtb__159, dtb__160))
  | Frontend_dAst.C_Expr_ERecord (dtb__161, dtb__162, dtb__163) -> (Frontend_dAst.C_Expr_ERecord (dtb__161, ((((v_inlFieldsF (fuel - 1)) comp) als) dtb__162), dtb__163))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__164, dtb__165, dtb__166) -> (Frontend_dAst.C_Expr_ERecUpdate (((((v_inlGoF (fuel - 1)) comp) als) dtb__164), ((((v_inlFieldsF (fuel - 1)) comp) als) dtb__165), dtb__166))
  | Frontend_dAst.C_Expr_EDo (dtb__167, dtb__168) -> (Frontend_dAst.C_Expr_EDo (((((v_inlStmtsF (fuel - 1)) comp) als) dtb__167), dtb__168))
  | Frontend_dAst.C_Expr_EInterp (dtb__169, dtb__170) -> (Frontend_dAst.C_Expr_EInterp (((((v_inlPartsF (fuel - 1)) comp) als) dtb__169), dtb__170))
  | _ -> e
)))

# 334 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_inlineAliases = (fun (comp : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> ((((v_inlGoF ((Frontend_dAstQuery.v_exprBudget 32) e)) comp) B_dData_dList.C_List_Nil) e))

# 337 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string) (mc5 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (let body = ((v_inlineAliases mc0) (B_dData_dPair.v_secondOf dtb__171)) in (((((((v_siteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__172) ((((((((((v_siteWalkC ((Frontend_dAstQuery.v_exprBudget 32) body)) mc0) mc1) mc2) mc4) mc3) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf dtb__171))) B_dData_dList.C_List_Nil) body) mc6)))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (((((((v_siteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__174) (((((((v_siteCollectClauses mc0) mc1) mc2) mc4) dtb__173) ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__173) mc3)) mc6))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCollect = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_siteCollectGo comp) ctors) projs) defTbl) facts) comp) B_dData_dList.C_List_Nil))

# 366 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scIsStrict = (fun (m : int) -> (m <> 0))

# 369 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_maxBaseOf = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | { B_dData_dPair.f_Pair_first = dtb__177; B_dData_dPair.f_Pair_second = dtb__178 } -> (match dtb__178 with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (match dtb__180 with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> ((Elab_dTermination_dMeasure.v_maxInt dtb__179) (v_maxBaseOf dtb__176))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_insertEdge = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (if ((mc0).f_ScEdge_edgeFrom < (dtb__183).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184)))) else (if ((mc0).f_ScEdge_edgeFrom = (dtb__183).f_ScEdge_edgeFrom) then (if ((mc0).f_ScEdge_edgeTo <= (dtb__183).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184)))) else (B_dData_dList.C_List__x58__x58_ (dtb__183, ((v_insertEdge mc0) dtb__184)))) else (B_dData_dList.C_List__x58__x58_ (dtb__183, ((v_insertEdge mc0) dtb__184)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sortEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> ((v_insertEdge dtb__185) (v_sortEdges dtb__186))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_mergeStrict = (fun (a : t_ScEdge) (b : t_ScEdge) -> { f_ScEdge_edgeFrom = (a).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (a).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (a).f_ScEdge_scStrictEdge then true else (b).f_ScEdge_scStrictEdge) })

# 390 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_compactEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (match dtb__188 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__187, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (if ((dtb__187).f_ScEdge_edgeFrom = (dtb__189).f_ScEdge_edgeFrom) then (if ((dtb__187).f_ScEdge_edgeTo = (dtb__189).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (((v_mergeStrict dtb__187) dtb__189), (v_compactEdges dtb__190))) else (B_dData_dList.C_List__x58__x58_ (dtb__187, (v_compactEdges dtb__188)))) else (B_dData_dList.C_List__x58__x58_ (dtb__187, (v_compactEdges dtb__188))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_canonEdges = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (v_compactEdges (v_sortEdges edges)))

# 404 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesEqCanon = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (if ((dtb__193).f_ScEdge_edgeFrom = (dtb__195).f_ScEdge_edgeFrom) then (if ((dtb__193).f_ScEdge_edgeTo = (dtb__195).f_ScEdge_edgeTo) then (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) (dtb__193).f_ScEdge_scStrictEdge) (dtb__195).f_ScEdge_scStrictEdge) then ((v_edgesEqCanon dtb__194) dtb__196) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgesEq = (fun (a : t_ScEdge B_dData_dList.t_List) (b : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEqCanon (v_canonEdges a)) (v_canonEdges b)))

# 420 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_combineWith = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (if ((mc0).f_ScEdge_edgeTo = (dtb__197).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = (mc0).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (dtb__197).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (mc0).f_ScEdge_scStrictEdge then true else (dtb__197).f_ScEdge_scStrictEdge) }, ((v_combineWith mc0) dtb__198))) else ((v_combineWith mc0) dtb__198))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_composeGo = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> ((B_dData_dList.v_append ((v_combineWith dtb__199) mc1)) ((v_composeGo dtb__200) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_composeEdges = (fun (g1 : t_ScEdge B_dData_dList.t_List) (g2 : t_ScEdge B_dData_dList.t_List) -> (v_canonEdges ((v_composeGo g1) g2)))

# 436 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasStrict = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> (if (dtb__201).f_ScEdge_scStrictEdge then true else (v_hasStrict dtb__202))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphIdempotent = (fun (edges : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEq ((v_composeEdges edges) edges)) edges))

# 445 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphOK = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (if (v_graphIdempotent edges) then (v_hasStrict edges) else true))

# 448 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphsOK = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (if (v_graphOK dtb__203) then (v_graphsOK dtb__204) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableGraphCap = 512

# 458 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableLookup = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 } -> (if ((B_dData_dPair.v_firstOf mc0) = (B_dData_dPair.v_firstOf dtb__207)) then (if ((B_dData_dPair.v_secondOf mc0) = (B_dData_dPair.v_secondOf dtb__207)) then (B_dData_dMaybe.C_Maybe_Just (dtb__208)) else ((v_tableLookup mc0) dtb__206)) else ((v_tableLookup mc0) dtb__206))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListHas = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (if ((v_edgesEq mc0) dtb__209) then true else ((v_graphListHas mc0) dtb__210))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListSubset = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (if ((v_graphListHas dtb__211) mc1) then ((v_graphListSubset dtb__212) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_tableAddPair = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__213 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> (match dtb__215 with
  | { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 } -> (if (mc0 = dtb__217) then (if (mc1 = dtb__218) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, dtb__216)) }, dtb__214)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 }; B_dData_dPair.f_Pair_second = dtb__216 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__214)))) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 }; B_dData_dPair.f_Pair_second = dtb__216 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__214))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableAdd = (fun (f : string) (g : string) (edges : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_tableLookup { B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = g }) table) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }
  | B_dData_dMaybe.C_Maybe_Just (dtb__219) -> (if ((v_graphListHas edges) dtb__219) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = true } else (if ((B_dData_dList.v_length dtb__219) >= v_tableGraphCap) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = false } else { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepHs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> (let nd_uscrut8 = ((((v_tableAdd mc0) mc1) ((v_composeEdges mc2) dtb__220)) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = dtb__223 } -> (if dtb__223 then (((((v_closureStepHs mc0) mc1) mc2) dtb__221) dtb__222) else { B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepOneGo = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | { B_dData_dPair.f_Pair_first = dtb__226; B_dData_dPair.f_Pair_second = dtb__227 } -> (match dtb__226 with
  | { B_dData_dPair.f_Pair_first = dtb__228; B_dData_dPair.f_Pair_second = dtb__229 } -> (if (dtb__228 = mc1) then (let nd_uscrut17 = (((((v_closureStepHs mc0) dtb__229) mc2) dtb__227) mc4) in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (if dtb__231 then ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__225) dtb__230) dtb__231) else { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) else ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__225) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStepOne = (fun (f : string) (g : string) (a : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_closureStepOneGo f) g) a) table) acc) true))

# 517 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGraphs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (let nd_uscrut8 = (((((v_closureStepOne mc0) mc1) dtb__232) mc3) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__234; B_dData_dPair.f_Pair_second = dtb__235 } -> (if dtb__235 then (((((v_closureStepGraphs mc0) mc1) dtb__233) mc3) dtb__234) else { B_dData_dPair.f_Pair_first = dtb__234; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 524 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGo = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> (match dtb__236 with
  | { B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__239 } -> (match dtb__238 with
  | { B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = dtb__241 } -> (let nd_uscrut14 = (((((v_closureStepGraphs dtb__240) dtb__241) dtb__239) mc1) mc2) in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = dtb__243 } -> (if dtb__243 then (((v_closureStepGo dtb__237) mc1) dtb__242) else { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStep = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_closureStepGo table) table) table))

# 537 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableSubset = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (match dtb__244 with
  | { B_dData_dPair.f_Pair_first = dtb__246; B_dData_dPair.f_Pair_second = dtb__247 } -> (match ((v_tableLookup dtb__246) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__248) -> (if ((v_graphListSubset dtb__247) dtb__248) then ((v_tableSubset dtb__245) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableSame = (fun (a : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_tableSubset a) b) else false))

# 544 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureLoop = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } } else (let nd_uscrut2 = (v_closureStep table) in (match nd_uscrut2 with
  | { B_dData_dPair.f_Pair_first = dtb__249; B_dData_dPair.f_Pair_second = dtb__250 } -> (if dtb__250 then (if ((v_tableSame table) dtb__249) then { B_dData_dPair.f_Pair_first = dtb__249; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = fuel } } else ((v_closureLoop dtb__249) (fuel - 1))) else { B_dData_dPair.f_Pair_first = dtb__249; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } })
  | _ -> failwith "DT: impossible branch"
))))

# 562 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_basesUpToGo = (fun (i : int) (acc : int B_dData_dList.t_List) -> (if (i <= 0) then (B_dData_dList.C_List__x58__x58_ (0, acc)) else ((v_basesUpToGo (i - 1)) (B_dData_dList.C_List__x58__x58_ (i, acc)))))

# 565 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_basesUpTo = (fun (n : int) -> (if (n < 0) then B_dData_dList.C_List_Nil else ((v_basesUpToGo n) B_dData_dList.C_List_Nil)))

# 568 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasBase = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (if (mc0 = dtb__251) then true else ((v_hasBase mc0) dtb__252))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_dedupBases = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> (if ((v_hasBase dtb__253) dtb__254) then (v_dedupBases dtb__254) else (B_dData_dList.C_List__x58__x58_ (dtb__253, (v_dedupBases dtb__254))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_bindingPatBinders = (fun (b : Frontend_dAst.t_Binding) -> (Frontend_dAstWalk.v_patBinders (b).Frontend_dAst.f_Binding_bindPat))

# 582 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_argBasesGoF = (fun (fuel : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (locals : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__255, dtb__256) -> (let nd_uscrut6 = ((Elab_dTermination_dMeasure.v_sizeOfVarStrict dtb__255) sizes) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName dtb__255) locals) then (v_basesUpTo (v_maxBaseOf sizes)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__257) -> (match dtb__257 with
  | { B_dData_dPair.f_Pair_first = dtb__258; B_dData_dPair.f_Pair_second = dtb__259 } -> (B_dData_dList.C_List__x58__x58_ (dtb__258, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Expr_ELam (dtb__260, dtb__261, dtb__262) -> ((((v_argBasesGoF (fuel - 1)) sizes) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__260)) locals)) dtb__261)
  | Frontend_dAst.C_Expr_EApp (dtb__263, dtb__264, dtb__265) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__263)) ((((v_argBasesArgsF (fuel - 1)) sizes) locals) dtb__264))
  | Frontend_dAst.C_Expr_EPi (dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__269)) ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__270))
  | Frontend_dAst.C_Expr_ELet (dtb__272, dtb__273, dtb__274, dtb__275) -> ((B_dData_dList.v_append ((((v_argBasesBindsF (fuel - 1)) sizes) locals) dtb__272)) ((((v_argBasesGoF (fuel - 1)) sizes) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingPatBinders) dtb__272)) locals)) dtb__273))
  | Frontend_dAst.C_Expr_ECase (dtb__276, dtb__277, dtb__278) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__276)) ((((v_argBasesAltsF (fuel - 1)) sizes) locals) dtb__277))
  | Frontend_dAst.C_Expr_EIf (dtb__279, dtb__280, dtb__281, dtb__282) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__279)) ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__280)) ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__281)))
  | Frontend_dAst.C_Expr_EField (dtb__283, dtb__284, dtb__285) -> ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__283)
  | Frontend_dAst.C_Expr_ERecord (dtb__286, dtb__287, dtb__288) -> ((((v_argBasesFieldsF (fuel - 1)) sizes) locals) dtb__287)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__289, dtb__290, dtb__291) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__289)) ((((v_argBasesFieldsF (fuel - 1)) sizes) locals) dtb__290))
  | Frontend_dAst.C_Expr_EDo (dtb__292, dtb__293) -> ((((v_argBasesStmtsF (fuel - 1)) sizes) locals) dtb__292)
  | Frontend_dAst.C_Expr_EInterp (dtb__294, dtb__295) -> ((((v_argBasesPartsF (fuel - 1)) sizes) locals) dtb__294)
  | _ -> B_dData_dList.C_List_Nil
)))
# 605 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesArgsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__296, dtb__297) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__296)) ((((v_argBasesArgsF (mc0 - 1)) mc1) mc2) dtb__297)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 613 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesFieldsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (match dtb__298 with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__301)) ((((v_argBasesFieldsF (mc0 - 1)) mc1) mc2) dtb__299)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 621 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBindsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__302, dtb__303) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesBindingF (mc0 - 1)) mc1) mc2) dtb__302)) ((((v_argBasesBindsF (mc0 - 1)) mc1) mc2) dtb__303)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 631 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBindingF = (fun (fuel : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (locals : string B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__305) -> ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__305)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__306) -> ((((v_argBasesClausesF (fuel - 1)) sizes) locals) dtb__306)
  | _ -> failwith "DT: impossible branch"
) in (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> ((B_dData_dList.v_append value) ((((v_argBasesGoF (fuel - 1)) sizes) locals) (dtb__304).Frontend_dAst.f_BindingSig_sigType))
  | B_dData_dMaybe.C_Maybe_Nothing -> value
  | _ -> failwith "DT: impossible branch"
))))
# 645 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesAltsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) ((B_dData_dList.v_append (Frontend_dAstWalk.v_patBinders (dtb__307).Frontend_dAst.f_Alt_altPat)) mc2)) (dtb__307).Frontend_dAst.f_Alt_altBody)) ((((v_argBasesAltsF (mc0 - 1)) mc1) mc2) dtb__308)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 655 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesClausesF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Frontend_dAstWalk.v_patBinders) (dtb__309).Frontend_dAst.f_LocalClause_lcPats)) mc2)) (dtb__309).Frontend_dAst.f_LocalClause_lcBody)) ((((v_argBasesClausesF (mc0 - 1)) mc1) mc2) dtb__310)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 665 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesStmtsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (match dtb__311 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__313, dtb__314, dtb__315) -> ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__314)) ((((v_argBasesStmtsF (mc0 - 1)) mc1) ((B_dData_dList.v_append (Frontend_dAstWalk.v_patBinders dtb__313)) mc2)) dtb__312))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__316, dtb__317) -> ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__316)) ((((v_argBasesStmtsF (mc0 - 1)) mc1) mc2) dtb__312))
  | Frontend_dAst.C_DoStmt_DLet (dtb__318, dtb__319) -> ((B_dData_dList.v_append ((((v_argBasesBindsF (mc0 - 1)) mc1) mc2) dtb__318)) ((((v_argBasesStmtsF (mc0 - 1)) mc1) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingPatBinders) dtb__318)) mc2)) dtb__312))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 676 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesPartsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__320, dtb__321) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (match dtb__320 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__322) -> ((((v_argBasesPartsF (mc0 - 1)) mc1) mc2) dtb__321)
  | Frontend_dAst.C_InterpPart_IPHole (dtb__323) -> ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__323)) ((((v_argBasesPartsF (mc0 - 1)) mc1) mc2) dtb__321))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 579 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBasesGo = (fun (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (locals : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> ((((v_argBasesGoF ((Frontend_dAstQuery.v_exprBudget 32) e)) sizes) locals) e))

# 559 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBases = (fun (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (v_dedupBases (((v_argBasesGo sizes) B_dData_dList.C_List_Nil) e)))

# 687 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_blindEdgesJ = (fun (arity : int) (i : int) -> (if (arity <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = (arity - 1); f_ScEdge_scStrictEdge = false }, ((v_blindEdgesJ (arity - 1)) i)))))

# 691 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesI = (fun (i : int) (arity : int) -> (if (i <= 0) then (if (i = 0) then ((v_blindEdgesJ arity) 0) else B_dData_dList.C_List_Nil) else ((B_dData_dList.v_append ((v_blindEdgesJ arity) i)) ((v_blindEdgesI (i - 1)) arity))))

# 698 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindEdges = (fun (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> ((v_blindEdgesI ((Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCaller) defTbl)) - 1)) (Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCallee) defTbl))))

# 704 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgeAt = (fun (i : int) (j : int) (deps : int B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (s).f_Site_siteArgs) j) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> (match ((((((((Elab_dTermination_dMeasure.v_relOfArg i) dtb__324) (s).f_Site_siteSizes) ctors) projs) (s).f_Site_siteCaller) facts) (s).f_Site_siteRegion) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__325) -> (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = (v_scIsStrict dtb__325) }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasBase i) deps) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = false }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 714 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_nthDeps = (fun (mc0 : int B_dData_dList.t_List B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__326, dtb__327) -> (if (mc1 <= 0) then dtb__326 else ((v_nthDeps dtb__327) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 718 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesJ = (fun (i : int) (count : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (count <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((((((v_siteEdgeAt i) (count - 1)) ((v_nthDeps deps) (count - 1))) s) ctors) projs) facts)) (((((((v_siteEdgesJ i) (count - 1)) deps) s) ctors) projs) facts))))

# 727 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesI = (fun (i : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (i <= 0) then (((((((v_siteEdgesJ 0) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts) else ((B_dData_dList.v_append (((((((v_siteEdgesJ i) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts)) ((((((v_siteEdgesI (i - 1)) deps) s) ctors) projs) facts))))

# 736 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgesOf = (fun (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> (if (s).f_Site_siteBlind then ((v_blindEdges defTbl) s) else ((((((v_siteEdgesI (v_maxBaseOf (s).f_Site_siteSizes)) ((B_dData_dList.v_map (v_argBases (s).f_Site_siteSizes)) (s).f_Site_siteArgs)) s) ctors) projs) facts)))

# 746 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_initialTableGo = (fun (mc0 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : t_Site B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : bool) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__328, dtb__329) -> (if mc6 then (match ((((v_tableAdd (dtb__328).f_Site_siteCaller) (dtb__328).f_Site_siteCallee) (((((v_siteEdgesOf mc0) mc2) mc3) mc4) dtb__328)) mc5) with
  | { B_dData_dPair.f_Pair_first = dtb__330; B_dData_dPair.f_Pair_second = dtb__331 } -> (((((((v_initialTableGo mc0) dtb__329) mc2) mc3) mc4) dtb__330) dtb__331)
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = false })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = mc6 }
  | _ -> failwith "DT: impossible branch"
))

# 743 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_initialTable = (fun (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_initialTableGo defTbl) sites) ctors) projs) facts) B_dData_dList.C_List_Nil) true))

# 759 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctClosureFuel = 240

# 763 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctCheckTable = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__332, dtb__333) -> (match dtb__332 with
  | { B_dData_dPair.f_Pair_first = dtb__334; B_dData_dPair.f_Pair_second = dtb__335 } -> (match dtb__334 with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> (if (dtb__336 = dtb__337) then (if (v_graphsOK dtb__335) then (v_sctCheckTable dtb__333) else false) else (v_sctCheckTable dtb__333))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 768 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_sctBadGraphs = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__338, dtb__339) -> (if (v_graphOK dtb__338) then ((v_sctBadGraphs mc0) dtb__339) else (B_dData_dList.C_List__x58__x58_ (mc0, ((v_sctBadGraphs mc0) dtb__339))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 772 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadPairs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__340, dtb__341) -> (match dtb__340 with
  | { B_dData_dPair.f_Pair_first = dtb__342; B_dData_dPair.f_Pair_second = dtb__343 } -> (match dtb__342 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> (if (dtb__344 = dtb__345) then ((B_dData_dList.v_append ((v_sctBadGraphs dtb__344) dtb__343)) (v_sctBadPairs dtb__341)) else (v_sctBadPairs dtb__341))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 780 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_strictEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(string_of_int (e).f_ScEdge_edgeFrom); "->>"; (string_of_int (e).f_ScEdge_edgeTo)]))

# 783 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_weakEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(string_of_int (e).f_ScEdge_edgeFrom); "->"; (string_of_int (e).f_ScEdge_edgeTo)]))

# 777 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeText = (fun (e : t_ScEdge) -> (if (e).f_ScEdge_scStrictEdge then (v_strictEdgeText e) else (v_weakEdgeText e)))

# 786 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesText = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__346, dtb__347) -> (match dtb__347 with
  | B_dData_dList.C_List_Nil -> (v_edgeText dtb__346)
  | _ -> (String.concat "" [(v_edgeText dtb__346); ","; (v_edgesText dtb__347)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 791 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_badGraphText = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__348, dtb__349) -> (if (v_graphOK dtb__348) then ((v_badGraphText mc0) dtb__349) else (B_dData_dList.C_List__x58__x58_ ((String.concat "" [mc0; "{"; (v_edgesText dtb__348); "}"]), ((v_badGraphText mc0) dtb__349))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 796 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadText = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__350, dtb__351) -> (match dtb__350 with
  | { B_dData_dPair.f_Pair_first = dtb__352; B_dData_dPair.f_Pair_second = dtb__353 } -> (match dtb__352 with
  | { B_dData_dPair.f_Pair_first = dtb__354; B_dData_dPair.f_Pair_second = dtb__355 } -> (if (dtb__354 = dtb__355) then ((B_dData_dList.v_append ((v_badGraphText dtb__354) dtb__353)) (v_sctBadText dtb__351)) else (v_sctBadText dtb__351))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 801 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctDiag = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_joinComma (Elab_dTermination_dMeasure.v_dedup (v_sctBadText table))))

# 806 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_isBlindSite = (fun (s : t_Site) -> (s).f_Site_siteBlind)

# 809 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindPairText = (fun (s : t_Site) -> (String.concat "" [(s).f_Site_siteCaller; "->"; (s).f_Site_siteCallee]))

# 812 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctBlindNote = (fun (sites : t_Site B_dData_dList.t_List) -> (match (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_map v_blindPairText) ((B_dData_dList.v_filter v_isBlindSite) sites))) with
  | B_dData_dList.C_List_Nil -> ""
  | dtb__356 -> (String.concat "" [" [SCT \230\156\170\232\175\134\229\136\171\232\176\131\231\148\168\239\188\154"; (Elab_dTermination_dMeasure.v_joinComma dtb__356); "\239\188\136callee \228\187\165\229\128\188\228\188\160\233\128\146\230\136\150\233\129\141\229\142\134\233\162\132\231\174\151\232\128\151\229\176\189\239\188\140\229\143\170\230\140\137\229\188\177\232\190\185\232\174\161\229\133\165\239\188\137]"])
))

# 821 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_budgetDiagnostic = (fun (comp : string B_dData_dList.t_List) (msg : Base_dDiag.t_Diagnostic) -> (let subject = ((B_dData_dString.v_join ",") comp) in (let detail = (String.concat "" ["size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (string_of_int v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (string_of_int v_sctClosureFuel); " \232\189\174\239\188\137"]) in (let base = ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_TerminationBudgetExhausted (subject))) (B_dData_dVec.C_Vec__x58__x58_ (subject, B_dData_dVec.C_Vec_Nil))) in (let kept = { base with Base_dDiag.f_Diagnostic_diagLabels = (msg).Base_dDiag.f_Diagnostic_diagLabels; Base_dDiag.f_Diagnostic_diagFields = (msg).Base_dDiag.f_Diagnostic_diagFields } in ((Base_dDiag.v_appendMessage (String.concat "" [" ["; detail; "]"])) kept))))))

# 836 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_countGraphs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__357, dtb__358) -> (match dtb__357 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> ((B_dData_dList.v_length dtb__360) + (v_countGraphs dtb__358))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 840 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheckGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let note = (v_sctBlindNote sites) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.scc_size") (B_dData_dList.v_length comp)) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.sites") (B_dData_dList.v_length sites)) in (match (((((v_initialTable defTbl) sites) ctors) projs) facts) with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> (if dtb__362 then (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs") (v_countGraphs dtb__361)) in (let nd_uscrut12 = ((v_closureLoop dtb__361) v_sctClosureFuel) in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__363; B_dData_dPair.f_Pair_second = dtb__364 } -> (match dtb__364 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.closure_rounds") (v_sctClosureFuel - dtb__366)) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs_final") (v_countGraphs dtb__363)) in (if dtb__365 then (if (v_sctCheckTable dtb__363) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_sctDiag dtb__363); "]"])) msg))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((v_budgetDiagnostic comp) msg)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((v_budgetDiagnostic comp) msg)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 831 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheck = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> ((Base_dObs.v_obsCheck "vuna.term.sct") (fun (_u : int) -> ((((((v_sctCheckGo comp) defTbl) ctors) projs) facts) msg))))

# 868 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_paramNamesOf = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> (match dtb__367 with
  | Frontend_dAst.C_Pat_PVar (dtb__369, dtb__370) -> (B_dData_dList.C_List__x58__x58_ (dtb__369, (v_paramNamesOf dtb__368)))
  | _ -> (v_paramNamesOf dtb__368)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 875 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramIndexGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__371 with
  | Frontend_dAst.C_Pat_PVar (dtb__373, dtb__374) -> (if (dtb__373 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_paramIndexGo dtb__372) mc1) (mc2 + 1)))
  | _ -> (((v_paramIndexGo dtb__372) mc1) (mc2 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 889 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasFuelGuardF = (fun (fuel : int) (p0 : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then false else (match e with
  | Frontend_dAst.C_Expr_EIf (dtb__375, dtb__376, dtb__377, dtb__378) -> (match (Elab_dTermination_dMeasure.v_guardPosVar dtb__375) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (dtb__379 = p0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_hasFuelGuardF (fuel - 1)) p0) dtb__376) then true else (((v_hasFuelGuardF (fuel - 1)) p0) dtb__377))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ECase (dtb__380, dtb__381, dtb__382) -> (((v_anyAltFuelGuardF (fuel - 1)) p0) dtb__381)
  | Frontend_dAst.C_Expr_ELet (dtb__383, dtb__384, dtb__385, dtb__386) -> (if (((v_hasFuelGuardF (fuel - 1)) p0) dtb__384) then true else (((v_anyBindFuelGuardF (fuel - 1)) p0) dtb__383))
  | Frontend_dAst.C_Expr_ELam (dtb__387, dtb__388, dtb__389) -> (((v_hasFuelGuardF (fuel - 1)) p0) dtb__388)
  | _ -> false
)))
# 904 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyAltFuelGuardF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__390, dtb__391) -> (if (mc0 <= 0) then false else (if (((v_hasFuelGuardF (mc0 - 1)) mc1) (dtb__390).Frontend_dAst.f_Alt_altBody) then true else (((v_anyAltFuelGuardF (mc0 - 1)) mc1) dtb__391)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 912 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyBindFuelGuardF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__392, dtb__393) -> (if (mc0 <= 0) then false else (if (((v_bindingHasFuelGuardF (mc0 - 1)) mc1) dtb__392) then true else (((v_anyBindFuelGuardF (mc0 - 1)) mc1) dtb__393)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 920 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_bindingHasFuelGuardF = (fun (fuel : int) (p0 : string) (b : Frontend_dAst.t_Binding) -> (if (fuel <= 0) then false else (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__395) -> (((v_hasFuelGuardF (fuel - 1)) p0) dtb__395)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__396) -> (((v_anyClauseFuelGuardF (fuel - 1)) p0) dtb__396)
  | _ -> failwith "DT: impossible branch"
) in (if value then true else (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__394) -> (((v_hasFuelGuardF (fuel - 1)) p0) (dtb__394).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))
# 937 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyClauseFuelGuardF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__397, dtb__398) -> (if (mc0 <= 0) then false else (if (((v_hasFuelGuardF (mc0 - 1)) mc1) (dtb__397).Frontend_dAst.f_LocalClause_lcBody) then true else (((v_anyClauseFuelGuardF (mc0 - 1)) mc1) dtb__398)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 886 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_hasFuelGuard = (fun (p0 : string) (e : Frontend_dAst.t_Expr) -> (((v_hasFuelGuardF ((Frontend_dAstQuery.v_exprBudget 32) e)) p0) e))

# 945 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_guardParamGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__399, dtb__400) -> (if ((v_hasFuelGuard dtb__399) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__399)) else ((v_guardParamGo dtb__400) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 950 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamNameOf = (fun (name : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__401, dtb__402) -> ((v_guardParamGo (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__401))) (B_dData_dPair.v_secondOf dtb__401))
  | _ -> failwith "DT: impossible branch"
))

# 958 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamIndexOf = (fun (callee : string) (callerFuel : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl callee) defTbl) with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__403, dtb__404) -> (let pats = (B_dData_dPair.v_firstOf dtb__403) in (match ((v_fuelParamNameOf callee) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__405) -> (((v_paramIndexGo pats) dtb__405) 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_paramIndexGo pats) callerFuel) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__406) -> (B_dData_dMaybe.C_Maybe_Just (dtb__406))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 972 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_callerFuelName = (fun (name : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf name) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__407) -> dtb__407
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__408, dtb__409) -> (match (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__408)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__410, dtb__411) -> dtb__410
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 984 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_paramsOf = (fun (name : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__412, dtb__413) -> (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__412))
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteFuelStrict = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : int B_dData_dMaybe.t_Maybe) (mc3 : t_Site) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__414) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (mc3).f_Site_siteArgs) dtb__414) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__415) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = dtb__415 in (match nd_uscrut9 with
  | Frontend_dAst.C_Expr_EApp (dtb__416, dtb__417, dtb__418) -> (match dtb__416 with
  | Frontend_dAst.C_Expr_EVar (dtb__419, dtb__420) -> (if (Elab_dTermination_dMeasure.v_isSubOpName dtb__419) then (let nd_uscrut15 = dtb__417 in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__421, dtb__422) -> (match dtb__421 with
  | Frontend_dAst.C_Expr_EVar (dtb__423, dtb__424) -> (match dtb__422 with
  | B_dData_dList.C_List__x58__x58_ (dtb__425, dtb__426) -> (match dtb__425 with
  | Frontend_dAst.C_Expr_EInt (dtb__427, dtb__428) -> (match dtb__426 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__427 > 0) then ((B_dData_dList.v_memName dtb__423) mc0) else false) then (B_dData_dMaybe.C_Maybe_Just (true)) else (B_dData_dMaybe.C_Maybe_Just (false)))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__429) -> (let nd_uscrut10 = dtb__415 in (match nd_uscrut10 with
  | Frontend_dAst.C_Expr_EApp (dtb__430, dtb__431, dtb__432) -> (match dtb__430 with
  | Frontend_dAst.C_Expr_EVar (dtb__433, dtb__434) -> (if (Elab_dTermination_dMeasure.v_isSubOpName dtb__433) then (let nd_uscrut16 = dtb__431 in (match nd_uscrut16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__435, dtb__436) -> (match dtb__435 with
  | Frontend_dAst.C_Expr_EVar (dtb__437, dtb__438) -> (match dtb__436 with
  | B_dData_dList.C_List__x58__x58_ (dtb__439, dtb__440) -> (match dtb__439 with
  | Frontend_dAst.C_Expr_EInt (dtb__441, dtb__442) -> (match dtb__440 with
  | B_dData_dList.C_List_Nil -> (if (dtb__437 = dtb__429) then (if (dtb__441 > 0) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
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
  | Frontend_dAst.C_Expr_EVar (dtb__443, dtb__444) -> (if (dtb__443 = dtb__429) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1027 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_fuelEdgesGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : t_Site B_dData_dList.t_List) (mc3 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__445, dtb__446) -> (let inGroup = ((B_dData_dList.v_memName (dtb__445).f_Site_siteCallee) mc0) in (let mode = (let nd_uscrut8 = ((((v_siteFuelStrict ((v_paramsOf (dtb__445).f_Site_siteCaller) mc1)) ((v_fuelParamNameOf (dtb__445).f_Site_siteCaller) mc1)) (((v_fuelParamIndexOf (dtb__445).f_Site_siteCallee) ((v_callerFuelName (dtb__445).f_Site_siteCaller) mc1)) mc1)) dtb__445) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__447) -> (if dtb__447 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) in (let acc2 = (if inGroup then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (dtb__445).f_Site_siteCaller; B_dData_dPair.f_Pair_second = (dtb__445).f_Site_siteCallee }; B_dData_dPair.f_Pair_second = mode }; B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, mc3)) else mc3) in ((((v_fuelEdgesGo mc0) mc1) dtb__446) acc2))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1022 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelEdgesOf = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) -> ((((v_fuelEdgesGo comp) defTbl) sites) B_dData_dList.C_List_Nil))

# 1042 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_memberGuarded = (fun (f : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf f) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__448) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1048 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_unguardedOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__449, dtb__450) -> (if ((v_memberGuarded dtb__449) mc1) then ((v_unguardedOf dtb__450) mc1) else (B_dData_dList.C_List__x58__x58_ (dtb__449, ((v_unguardedOf dtb__450) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1054 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_allWeakEdges = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__451, dtb__452) -> (match dtb__451 with
  | { B_dData_dPair.f_Pair_first = dtb__453; B_dData_dPair.f_Pair_second = dtb__454 } -> (match dtb__453 with
  | { B_dData_dPair.f_Pair_first = dtb__455; B_dData_dPair.f_Pair_second = dtb__456 } -> (match dtb__455 with
  | { B_dData_dPair.f_Pair_first = dtb__457; B_dData_dPair.f_Pair_second = dtb__458 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__457; B_dData_dPair.f_Pair_second = dtb__458 }; B_dData_dPair.f_Pair_second = 0 }; B_dData_dPair.f_Pair_second = dtb__454 }, (v_allWeakEdges dtb__452)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1058 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_onlyUnguarded = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__459, dtb__460) -> (match dtb__459 with
  | { B_dData_dPair.f_Pair_first = dtb__461; B_dData_dPair.f_Pair_second = dtb__462 } -> (match dtb__461 with
  | { B_dData_dPair.f_Pair_first = dtb__463; B_dData_dPair.f_Pair_second = dtb__464 } -> (match dtb__463 with
  | { B_dData_dPair.f_Pair_first = dtb__465; B_dData_dPair.f_Pair_second = dtb__466 } -> (if ((B_dData_dList.v_memName dtb__465) mc0) then (if ((B_dData_dList.v_memName dtb__466) mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__465; B_dData_dPair.f_Pair_second = dtb__466 }; B_dData_dPair.f_Pair_second = dtb__464 }; B_dData_dPair.f_Pair_second = dtb__462 }, ((v_onlyUnguarded mc0) dtb__460))) else ((v_onlyUnguarded mc0) dtb__460)) else ((v_onlyUnguarded mc0) dtb__460))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1070 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_unguardedCycle = (fun (unguarded : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Elab_dTermination_dMeasure.v_hasWeakCycle unguarded) (v_allWeakEdges ((v_onlyUnguarded unguarded) edges))))

# 1077 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelAcceptable = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_unguardedOf comp) defTbl) with
  | B_dData_dList.C_List_Nil -> true
  | dtb__467 -> (if ((v_unguardedCycle dtb__467) edges) then false else true)
))

# 1095 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeModeOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> (match dtb__468 with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> (match dtb__470 with
  | { B_dData_dPair.f_Pair_first = dtb__472; B_dData_dPair.f_Pair_second = dtb__473 } -> dtb__471
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1083 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tryFuelThread = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let edges = (((v_fuelEdgesOf comp) defTbl) sites) in (let strictCount = (B_dData_dList.v_length (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_edgeModeOf) edges))) in (if (if (if (strictCount > 0) then (((v_fuelAcceptable comp) defTbl) edges) else false) then (B_dData_dBool.v_not ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) edges)) else false) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (msg)))))))

# 16 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCaller = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__474; f_Site_siteCallee = dtb__475; f_Site_siteArgs = dtb__476; f_Site_siteSizes = dtb__477; f_Site_siteRegion = dtb__478; f_Site_siteBlind = dtb__479 } -> dtb__474
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCallee = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__480; f_Site_siteCallee = dtb__481; f_Site_siteArgs = dtb__482; f_Site_siteSizes = dtb__483; f_Site_siteRegion = dtb__484; f_Site_siteBlind = dtb__485 } -> dtb__481
  | _ -> failwith "DT: impossible branch"
))

# 18 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteArgs = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__486; f_Site_siteCallee = dtb__487; f_Site_siteArgs = dtb__488; f_Site_siteSizes = dtb__489; f_Site_siteRegion = dtb__490; f_Site_siteBlind = dtb__491 } -> dtb__488
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteSizes = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__492; f_Site_siteCallee = dtb__493; f_Site_siteArgs = dtb__494; f_Site_siteSizes = dtb__495; f_Site_siteRegion = dtb__496; f_Site_siteBlind = dtb__497 } -> dtb__495
  | _ -> failwith "DT: impossible branch"
))

# 20 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteRegion = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__498; f_Site_siteCallee = dtb__499; f_Site_siteArgs = dtb__500; f_Site_siteSizes = dtb__501; f_Site_siteRegion = dtb__502; f_Site_siteBlind = dtb__503 } -> dtb__502
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteBlind = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__504; f_Site_siteCallee = dtb__505; f_Site_siteArgs = dtb__506; f_Site_siteSizes = dtb__507; f_Site_siteRegion = dtb__508; f_Site_siteBlind = dtb__509 } -> dtb__509
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeFrom = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__510; f_ScEdge_edgeTo = dtb__511; f_ScEdge_scStrictEdge = dtb__512 } -> dtb__510
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeTo = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__513; f_ScEdge_edgeTo = dtb__514; f_ScEdge_scStrictEdge = dtb__515 } -> dtb__514
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scStrictEdge = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__516; f_ScEdge_edgeTo = dtb__517; f_ScEdge_scStrictEdge = dtb__518 } -> dtb__518
  | _ -> failwith "DT: impossible branch"
))
