open Vuna_runtime
type t_Site = { f_Site_siteCaller : string; f_Site_siteCallee : string; f_Site_siteArgs : Frontend_dAst.t_Expr B_dData_dList.t_List; f_Site_siteSizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Site_siteRegion : string B_dData_dList.t_List; f_Site_siteBlind : bool }
and t_ScEdge = { f_ScEdge_edgeFrom : int; f_ScEdge_edgeTo : int; f_ScEdge_scStrictEdge : bool }

# 26 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindSitesOf = (fun (comp : string B_dData_dList.t_List) (caller : string) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (g : string) -> { f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = true })) comp))

# 121 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_clauseWalkPair = (fun (c : Frontend_dAst.t_LocalClause) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_exprSpan (c).Frontend_dAst.f_LocalClause_lcBody)))); B_dData_dPair.f_Pair_second = (c).Frontend_dAst.f_LocalClause_lcBody })

# 117 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_bindingWalkPairs = (fun (mc0 : Frontend_dAst.t_Binding) -> (match mc0 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__0; Frontend_dAst.f_Binding_bindValue = dtb__1; Frontend_dAst.f_Binding_bindSig = dtb__2; Frontend_dAst.f_Binding_bindRef = dtb__3 } -> (match dtb__1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__4) -> ((B_dData_dList.v_map v_clauseWalkPair) dtb__4)
  | Frontend_dAst.C_BindingValue_BVal (dtb__5) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__0; B_dData_dPair.f_Pair_second = dtb__5 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_bindsToWalkPairs = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> ((B_dData_dList.v_append (v_bindingWalkPairs dtb__6)) (v_bindsToWalkPairs dtb__7))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectList = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__9) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__8) mc9)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 53 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__11) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__13) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 72 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : Frontend_dAst.t_Expr) (mc9 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc10 : t_Site B_dData_dList.t_List) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc10) else (((((((((((v_siteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__15) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) mc8) (dtb__14).Frontend_dAst.f_Alt_altPat)) mc7) (dtb__14).Frontend_dAst.f_Alt_altBody) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 92 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : string B_dData_dList.t_List) (mc8 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc9 : t_Site B_dData_dList.t_List) -> (match mc8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | { B_dData_dPair.f_Pair_first = dtb__18; B_dData_dPair.f_Pair_second = dtb__19 } -> (if (mc0 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf mc1) mc4) mc6) mc7)) mc9) else ((((((((((v_siteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc6) dtb__19) dtb__18)) mc7) dtb__17) ((((((((((v_siteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
# 124 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
# 136 "Vuna/Compiler/Elab/Termination/Scc.vuna"
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
  | _ -> acc
)))
# 159 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = dtb__65; f_Site_siteArgs = args; f_Site_siteSizes = sizes; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__66, dtb__67) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__66) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__68) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (let acc1 = ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (dtb__69).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc) in (let sizes2 = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__69).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__69).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) (dtb__69).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__68).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then (((((((((((v_siteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
# 181 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (let nd_uscrut11 = args in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__71 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__73 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut19 = dtb__70 in (match nd_uscrut19 with
  | Frontend_dAst.C_Expr_EVar (dtb__74, dtb__75) -> (if ((B_dData_dList.v_memName dtb__74) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__74) B_dData_dList.C_List_Nil) dtb__72) (Frontend_dAst.v_nodeRefSpan dtb__75)) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | Frontend_dAst.C_Expr_EApp (dtb__76, dtb__77, dtb__78) -> (match dtb__76 with
  | Frontend_dAst.C_Expr_EVar (dtb__79, dtb__80) -> (if ((B_dData_dList.v_memName dtb__79) comp) then (((((((((((((v_siteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__79) dtb__77) dtb__72) (Frontend_dAst.v_nodeRefSpan dtb__78)) acc) else ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
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
# 194 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dAst.t_Expr B_dData_dList.t_List) (lst : Frontend_dAst.t_Expr) (cbsp : Base_dSource.t_Span) (acc : t_Site B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf comp) caller) sizes) region)) acc) else (let acc1 = ((((((((((v_siteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc) in (let elems = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem") in (let fullArgs = ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("$elem", (Frontend_dAst.v_detachedNodeRef cbsp))), B_dData_dList.C_List_Nil))) in (let acc2 = ((((((((((v_siteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1) in (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = caller; f_Site_siteCallee = g; f_Site_siteArgs = fullArgs; f_Site_siteSizes = elems; f_Site_siteRegion = region; f_Site_siteBlind = false }, acc2))))))))

# 210 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasNameOf = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))

# 213 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_lookupAlias = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (match dtb__81 with
  | { B_dData_dPair.f_Pair_first = dtb__83; B_dData_dPair.f_Pair_second = dtb__84 } -> (if (mc0 = dtb__83) then (B_dData_dMaybe.C_Maybe_Just (dtb__84)) else ((v_lookupAlias mc0) dtb__82))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dropAliases = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> ((v_dropAliases dtb__86) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((v_aliasNameOf p) <> dtb__85))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> (match dtb__87 with
  | Frontend_dAst.C_Pat_PVar (dtb__89, dtb__90) -> (match dtb__88 with
  | Frontend_dAst.C_Expr_EVar (dtb__91, dtb__92) -> (if ((B_dData_dList.v_memName dtb__91) mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__91 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scIsStrict = (fun (m : int) -> (m <> 0))

# 365 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_maxBaseOf = (fun (mc0 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__95; B_dData_dPair.f_Pair_second = dtb__96 } -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> ((Elab_dTermination_dMeasure.v_maxInt dtb__97) (v_maxBaseOf dtb__94))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_insertEdge = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (if ((mc0).f_ScEdge_edgeFrom < (dtb__101).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102)))) else (if ((mc0).f_ScEdge_edgeFrom = (dtb__101).f_ScEdge_edgeFrom) then (if ((mc0).f_ScEdge_edgeTo <= (dtb__101).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102)))) else (B_dData_dList.C_List__x58__x58_ (dtb__101, ((v_insertEdge mc0) dtb__102)))) else (B_dData_dList.C_List__x58__x58_ (dtb__101, ((v_insertEdge mc0) dtb__102)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sortEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> ((v_insertEdge dtb__103) (v_sortEdges dtb__104))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_mergeStrict = (fun (a : t_ScEdge) (b : t_ScEdge) -> { f_ScEdge_edgeFrom = (a).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (a).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (a).f_ScEdge_scStrictEdge then true else (b).f_ScEdge_scStrictEdge) })

# 386 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_compactEdges = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__106 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__105, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (if ((dtb__105).f_ScEdge_edgeFrom = (dtb__107).f_ScEdge_edgeFrom) then (if ((dtb__105).f_ScEdge_edgeTo = (dtb__107).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (((v_mergeStrict dtb__105) dtb__107), (v_compactEdges dtb__108))) else (B_dData_dList.C_List__x58__x58_ (dtb__105, (v_compactEdges dtb__106)))) else (B_dData_dList.C_List__x58__x58_ (dtb__105, (v_compactEdges dtb__106))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_canonEdges = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (v_compactEdges (v_sortEdges edges)))

# 400 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesEqCanon = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if ((dtb__111).f_ScEdge_edgeFrom = (dtb__113).f_ScEdge_edgeFrom) then (if ((dtb__111).f_ScEdge_edgeTo = (dtb__113).f_ScEdge_edgeTo) then (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) (dtb__111).f_ScEdge_scStrictEdge) (dtb__113).f_ScEdge_scStrictEdge) then ((v_edgesEqCanon dtb__112) dtb__114) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgesEq = (fun (a : t_ScEdge B_dData_dList.t_List) (b : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEqCanon (v_canonEdges a)) (v_canonEdges b)))

# 416 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_combineWith = (fun (mc0 : t_ScEdge) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (if ((mc0).f_ScEdge_edgeTo = (dtb__115).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = (mc0).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (dtb__115).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (mc0).f_ScEdge_scStrictEdge then true else (dtb__115).f_ScEdge_scStrictEdge) }, ((v_combineWith mc0) dtb__116))) else ((v_combineWith mc0) dtb__116))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_composeGo = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> ((B_dData_dList.v_append ((v_combineWith dtb__117) mc1)) ((v_composeGo dtb__118) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_composeEdges = (fun (g1 : t_ScEdge B_dData_dList.t_List) (g2 : t_ScEdge B_dData_dList.t_List) -> (v_canonEdges ((v_composeGo g1) g2)))

# 432 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasStrict = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (if (dtb__119).f_ScEdge_scStrictEdge then true else (v_hasStrict dtb__120))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphIdempotent = (fun (edges : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEq ((v_composeEdges edges) edges)) edges))

# 441 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphOK = (fun (edges : t_ScEdge B_dData_dList.t_List) -> (if (v_graphIdempotent edges) then (v_hasStrict edges) else true))

# 444 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphsOK = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (if (v_graphOK dtb__121) then (v_graphsOK dtb__122) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableGraphCap = 512

# 454 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableLookup = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (if ((B_dData_dPair.v_firstOf mc0) = (B_dData_dPair.v_firstOf dtb__125)) then (if ((B_dData_dPair.v_secondOf mc0) = (B_dData_dPair.v_secondOf dtb__125)) then (B_dData_dMaybe.C_Maybe_Just (dtb__126)) else ((v_tableLookup mc0) dtb__124)) else ((v_tableLookup mc0) dtb__124))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListHas = (fun (mc0 : t_ScEdge B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (if ((v_edgesEq mc0) dtb__127) then true else ((v_graphListHas mc0) dtb__128))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListSubset = (fun (mc0 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (if ((v_graphListHas dtb__129) mc1) then ((v_graphListSubset dtb__130) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_tableAddPair = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (match dtb__131 with
  | { B_dData_dPair.f_Pair_first = dtb__133; B_dData_dPair.f_Pair_second = dtb__134 } -> (match dtb__133 with
  | { B_dData_dPair.f_Pair_first = dtb__135; B_dData_dPair.f_Pair_second = dtb__136 } -> (if (mc0 = dtb__135) then (if (mc1 = dtb__136) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, dtb__134)) }, dtb__132)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__135; B_dData_dPair.f_Pair_second = dtb__136 }; B_dData_dPair.f_Pair_second = dtb__134 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__132)))) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__135; B_dData_dPair.f_Pair_second = dtb__136 }; B_dData_dPair.f_Pair_second = dtb__134 }, ((((v_tableAddPair mc0) mc1) mc2) dtb__132))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (mc2, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableAdd = (fun (f : string) (g : string) (edges : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_tableLookup { B_dData_dPair.f_Pair_first = f; B_dData_dPair.f_Pair_second = g }) table) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (if ((v_graphListHas edges) dtb__137) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = true } else (if ((B_dData_dList.v_length dtb__137) >= v_tableGraphCap) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = false } else { B_dData_dPair.f_Pair_first = ((((v_tableAddPair f) g) edges) table); B_dData_dPair.f_Pair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 493 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepHs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (let nd_uscrut8 = ((((v_tableAdd mc0) mc1) ((v_composeEdges mc2) dtb__138)) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = dtb__141 } -> (if dtb__141 then (((((v_closureStepHs mc0) mc1) mc2) dtb__139) dtb__140) else { B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 503 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepOneGo = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (match dtb__142 with
  | { B_dData_dPair.f_Pair_first = dtb__144; B_dData_dPair.f_Pair_second = dtb__145 } -> (match dtb__144 with
  | { B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__147 } -> (if (dtb__146 = mc1) then (let nd_uscrut17 = (((((v_closureStepHs mc0) dtb__147) mc2) dtb__145) mc4) in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = dtb__149 } -> (if dtb__149 then ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__143) dtb__148) dtb__149) else { B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) else ((((((v_closureStepOneGo mc0) mc1) mc2) dtb__143) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 }
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStepOne = (fun (f : string) (g : string) (a : t_ScEdge B_dData_dList.t_List) (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_closureStepOneGo f) g) a) table) acc) true))

# 513 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGraphs = (fun (mc0 : string) (mc1 : string) (mc2 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (mc3 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (let nd_uscrut8 = (((((v_closureStepOne mc0) mc1) dtb__150) mc3) mc4) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = dtb__153 } -> (if dtb__153 then (((((v_closureStepGraphs mc0) mc1) dtb__151) mc3) dtb__152) else { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGo = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (match dtb__154 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (match dtb__156 with
  | { B_dData_dPair.f_Pair_first = dtb__158; B_dData_dPair.f_Pair_second = dtb__159 } -> (let nd_uscrut14 = (((((v_closureStepGraphs dtb__158) dtb__159) dtb__157) mc1) mc2) in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = dtb__161 } -> (if dtb__161 then (((v_closureStepGo dtb__155) mc1) dtb__160) else { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStep = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_closureStepGo table) table) table))

# 533 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableSubset = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 } -> (match ((v_tableLookup dtb__164) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> (if ((v_graphListSubset dtb__165) dtb__166) then ((v_tableSubset dtb__163) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableSame = (fun (a : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_tableSubset a) b) else false))

# 540 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureLoop = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = table; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } } else (let nd_uscrut2 = (v_closureStep table) in (match nd_uscrut2 with
  | { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = dtb__168 } -> (if dtb__168 then (if ((v_tableSame table) dtb__167) then { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = fuel } } else ((v_closureLoop dtb__167) (fuel - 1))) else { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = fuel } })
  | _ -> failwith "DT: impossible branch"
))))

# 558 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_basesUpToGo = (fun (i : int) (acc : int B_dData_dList.t_List) -> (if (i <= 0) then (B_dData_dList.C_List__x58__x58_ (0, acc)) else ((v_basesUpToGo (i - 1)) (B_dData_dList.C_List__x58__x58_ (i, acc)))))

# 561 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_basesUpTo = (fun (n : int) -> (if (n < 0) then B_dData_dList.C_List_Nil else ((v_basesUpToGo n) B_dData_dList.C_List_Nil)))

# 564 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasBase = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (if (mc0 = dtb__169) then true else ((v_hasBase mc0) dtb__170))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_dedupBases = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (if ((v_hasBase dtb__171) dtb__172) then (v_dedupBases dtb__172) else (B_dData_dList.C_List__x58__x58_ (dtb__171, (v_dedupBases dtb__172))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_patNamesOf = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__173, dtb__174, dtb__175) -> (v_patNamesOfFields dtb__174)
  | Frontend_dAst.C_Pat_PCon (dtb__176, dtb__177, dtb__178) -> (v_patNamesOfPats dtb__177)
  | Frontend_dAst.C_Pat_PAs (dtb__179, dtb__180, dtb__181) -> (B_dData_dList.C_List__x58__x58_ (dtb__179, (v_patNamesOf dtb__180)))
  | Frontend_dAst.C_Pat_PVar (dtb__182, dtb__183) -> (B_dData_dList.C_List__x58__x58_ (dtb__182, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 579 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfPats = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__184, dtb__185) -> ((B_dData_dList.v_append (v_patNamesOf dtb__184)) (v_patNamesOfPats dtb__185))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 583 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfFields = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__186, dtb__187) -> (match dtb__186 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> ((B_dData_dList.v_append (v_patNamesOf dtb__189)) (v_patNamesOfFields dtb__187))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_inlArgsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (B_dData_dList.C_List__x58__x58_ (((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__190), ((((v_inlArgsF (mc0 - 1)) mc1) mc2) dtb__191)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 233 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlFieldsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = ((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__195) }, ((((v_inlFieldsF (mc0 - 1)) mc1) mc2) dtb__193)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 238 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlPartsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__198) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__198)), ((((v_inlPartsF (mc0 - 1)) mc1) mc2) dtb__197)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__199) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__199))), ((((v_inlPartsF (mc0 - 1)) mc1) mc2) dtb__197)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 245 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBindsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> (let b2 = ((((v_inlBindingF (mc0 - 1)) mc1) mc2) dtb__200) in (match (b2).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__202) -> (match ((v_aliasOf mc1) { B_dData_dPair.f_Pair_first = (b2).Frontend_dAst.f_Binding_bindPat; B_dData_dPair.f_Pair_second = dtb__202 }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__203) -> (let restP = ((((v_inlBindsF (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__203, mc2))) dtb__201) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf restP); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | B_dData_dMaybe.C_Maybe_Nothing -> (let restP = ((((v_inlBindsF (mc0 - 1)) mc1) ((v_dropAliases (v_patNamesOf (b2).Frontend_dAst.f_Binding_bindPat)) mc2)) dtb__201) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (b2, (B_dData_dPair.v_firstOf restP))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__204) -> (let restP = ((((v_inlBindsF (mc0 - 1)) mc1) ((v_dropAliases (v_patNamesOf (b2).Frontend_dAst.f_Binding_bindPat)) mc2)) dtb__201) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (b2, (B_dData_dPair.v_firstOf restP))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf restP) })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))
# 266 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBindingF = (fun (fuel : int) (comp : string B_dData_dList.t_List) (als : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__206) -> (Frontend_dAst.C_BindingValue_BVal (((((v_inlGoF (fuel - 1)) comp) als) dtb__206)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb__207) -> (Frontend_dAst.C_BindingValue_BClauses (((((v_inlClausesF (fuel - 1)) comp) als) dtb__207)))
  | _ -> failwith "DT: impossible branch"
) in (let sig_ = (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb__205 with Frontend_dAst.f_BindingSig_sigType = ((((v_inlGoF (fuel - 1)) comp) als) (dtb__205).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { b with Frontend_dAst.f_Binding_bindValue = value; Frontend_dAst.f_Binding_bindSig = sig_ })))
# 279 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlAltsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (B_dData_dList.C_List__x58__x58_ ({ dtb__208 with Frontend_dAst.f_Alt_altBody = ((((v_inlGoF (mc0 - 1)) mc1) ((v_dropAliases (v_patNamesOf (dtb__208).Frontend_dAst.f_Alt_altPat)) mc2)) (dtb__208).Frontend_dAst.f_Alt_altBody) }, ((((v_inlAltsF (mc0 - 1)) mc1) mc2) dtb__209)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 285 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlClausesF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (B_dData_dList.C_List__x58__x58_ ({ dtb__210 with Frontend_dAst.f_LocalClause_lcBody = ((((v_inlGoF (mc0 - 1)) mc1) ((v_dropAliases (v_patNamesOfPats (dtb__210).Frontend_dAst.f_LocalClause_lcPats)) mc2)) (dtb__210).Frontend_dAst.f_LocalClause_lcBody) }, ((((v_inlClausesF (mc0 - 1)) mc1) mc2) dtb__211)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 291 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlStmtsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__214, dtb__215, dtb__216) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb__214, ((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__215), dtb__216)), ((((v_inlStmtsF (mc0 - 1)) mc1) ((v_dropAliases (v_patNamesOf dtb__214)) mc2)) dtb__213)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__217, dtb__218) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr (((((v_inlGoF (mc0 - 1)) mc1) mc2) dtb__217), dtb__218)), ((((v_inlStmtsF (mc0 - 1)) mc1) mc2) dtb__213)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__219, dtb__220) -> (let p = ((((v_inlBindsF (mc0 - 1)) mc1) mc2) dtb__219) in (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet ((B_dData_dPair.v_firstOf p), dtb__220)), ((((v_inlStmtsF (mc0 - 1)) mc1) (B_dData_dPair.v_secondOf p)) dtb__213))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlGoF = (fun (fuel : int) (comp : string B_dData_dList.t_List) (als : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then e else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__221, dtb__222) -> (match ((v_lookupAlias dtb__221) als) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (Frontend_dAst.C_Expr_EVar (dtb__223, dtb__222))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar (dtb__221, dtb__222))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ELam (dtb__224, dtb__225, dtb__226) -> (Frontend_dAst.C_Expr_ELam (dtb__224, ((((v_inlGoF (fuel - 1)) comp) ((v_dropAliases ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__224)) als)) dtb__225), dtb__226))
  | Frontend_dAst.C_Expr_EApp (dtb__227, dtb__228, dtb__229) -> (Frontend_dAst.C_Expr_EApp (((((v_inlGoF (fuel - 1)) comp) als) dtb__227), ((((v_inlArgsF (fuel - 1)) comp) als) dtb__228), dtb__229))
  | Frontend_dAst.C_Expr_EPi (dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235) -> (Frontend_dAst.C_Expr_EPi (dtb__230, dtb__231, dtb__232, ((((v_inlGoF (fuel - 1)) comp) als) dtb__233), ((((v_inlGoF (fuel - 1)) comp) ((v_dropAliases (B_dData_dList.C_List__x58__x58_ (dtb__230, B_dData_dList.C_List_Nil))) als)) dtb__234), dtb__235))
  | Frontend_dAst.C_Expr_ELet (dtb__236, dtb__237, dtb__238, dtb__239) -> (let p = ((((v_inlBindsF (fuel - 1)) comp) als) dtb__236) in (Frontend_dAst.C_Expr_ELet ((B_dData_dPair.v_firstOf p), ((((v_inlGoF (fuel - 1)) comp) (B_dData_dPair.v_secondOf p)) dtb__237), dtb__238, dtb__239)))
  | Frontend_dAst.C_Expr_ECase (dtb__240, dtb__241, dtb__242) -> (Frontend_dAst.C_Expr_ECase (((((v_inlGoF (fuel - 1)) comp) als) dtb__240), ((((v_inlAltsF (fuel - 1)) comp) als) dtb__241), dtb__242))
  | Frontend_dAst.C_Expr_EIf (dtb__243, dtb__244, dtb__245, dtb__246) -> (Frontend_dAst.C_Expr_EIf (((((v_inlGoF (fuel - 1)) comp) als) dtb__243), ((((v_inlGoF (fuel - 1)) comp) als) dtb__244), ((((v_inlGoF (fuel - 1)) comp) als) dtb__245), dtb__246))
  | Frontend_dAst.C_Expr_EField (dtb__247, dtb__248, dtb__249) -> (Frontend_dAst.C_Expr_EField (((((v_inlGoF (fuel - 1)) comp) als) dtb__247), dtb__248, dtb__249))
  | Frontend_dAst.C_Expr_ERecord (dtb__250, dtb__251, dtb__252) -> (Frontend_dAst.C_Expr_ERecord (dtb__250, ((((v_inlFieldsF (fuel - 1)) comp) als) dtb__251), dtb__252))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__253, dtb__254, dtb__255) -> (Frontend_dAst.C_Expr_ERecUpdate (((((v_inlGoF (fuel - 1)) comp) als) dtb__253), ((((v_inlFieldsF (fuel - 1)) comp) als) dtb__254), dtb__255))
  | Frontend_dAst.C_Expr_EDo (dtb__256, dtb__257) -> (Frontend_dAst.C_Expr_EDo (((((v_inlStmtsF (fuel - 1)) comp) als) dtb__256), dtb__257))
  | Frontend_dAst.C_Expr_EInterp (dtb__258, dtb__259) -> (Frontend_dAst.C_Expr_EInterp (((((v_inlPartsF (fuel - 1)) comp) als) dtb__258), dtb__259))
  | _ -> e
)))

# 330 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_inlineAliases = (fun (comp : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> ((((v_inlGoF ((Frontend_dAstQuery.v_exprBudget 32) e)) comp) B_dData_dList.C_List_Nil) e))

# 333 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectClauses = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : string) (mc5 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (let body = ((v_inlineAliases mc0) (B_dData_dPair.v_secondOf dtb__260)) in (((((((v_siteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__261) ((((((((((v_siteWalkC ((Frontend_dAstQuery.v_exprBudget 32) body)) mc0) mc1) mc2) mc4) mc3) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf dtb__260))) B_dData_dList.C_List_Nil) body) mc6)))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) (mc6 : t_Site B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (((((((v_siteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__263) (((((((v_siteCollectClauses mc0) mc1) mc2) mc4) dtb__262) ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__262) mc3)) mc6))
  | B_dData_dList.C_List_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCollect = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_siteCollectGo comp) ctors) projs) defTbl) facts) comp) B_dData_dList.C_List_Nil))

# 587 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOfBinds = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__264, dtb__265) -> ((B_dData_dList.v_append (v_patNamesOf (dtb__264).Frontend_dAst.f_Binding_bindPat)) (v_patNamesOfBinds dtb__265))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_argBasesGoF = (fun (fuel : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (locals : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__266, dtb__267) -> (let nd_uscrut6 = ((Elab_dTermination_dMeasure.v_sizeOfVarStrict dtb__266) sizes) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName dtb__266) locals) then (v_basesUpTo (v_maxBaseOf sizes)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (match dtb__268 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (B_dData_dList.C_List__x58__x58_ (dtb__269, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Expr_ELam (dtb__271, dtb__272, dtb__273) -> ((((v_argBasesGoF (fuel - 1)) sizes) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__271)) locals)) dtb__272)
  | Frontend_dAst.C_Expr_EApp (dtb__274, dtb__275, dtb__276) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__274)) ((((v_argBasesArgsF (fuel - 1)) sizes) locals) dtb__275))
  | Frontend_dAst.C_Expr_EPi (dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__280)) ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__281))
  | Frontend_dAst.C_Expr_ELet (dtb__283, dtb__284, dtb__285, dtb__286) -> ((B_dData_dList.v_append ((((v_argBasesBindsF (fuel - 1)) sizes) locals) dtb__283)) ((((v_argBasesGoF (fuel - 1)) sizes) ((B_dData_dList.v_append (v_patNamesOfBinds dtb__283)) locals)) dtb__284))
  | Frontend_dAst.C_Expr_ECase (dtb__287, dtb__288, dtb__289) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__287)) ((((v_argBasesAltsF (fuel - 1)) sizes) locals) dtb__288))
  | Frontend_dAst.C_Expr_EIf (dtb__290, dtb__291, dtb__292, dtb__293) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__290)) ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__291)) ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__292)))
  | Frontend_dAst.C_Expr_EField (dtb__294, dtb__295, dtb__296) -> ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__294)
  | Frontend_dAst.C_Expr_ERecord (dtb__297, dtb__298, dtb__299) -> ((((v_argBasesFieldsF (fuel - 1)) sizes) locals) dtb__298)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__300, dtb__301, dtb__302) -> ((B_dData_dList.v_append ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__300)) ((((v_argBasesFieldsF (fuel - 1)) sizes) locals) dtb__301))
  | Frontend_dAst.C_Expr_EDo (dtb__303, dtb__304) -> ((((v_argBasesStmtsF (fuel - 1)) sizes) locals) dtb__303)
  | Frontend_dAst.C_Expr_EInterp (dtb__305, dtb__306) -> ((((v_argBasesPartsF (fuel - 1)) sizes) locals) dtb__305)
  | _ -> B_dData_dList.C_List_Nil
)))
# 617 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesArgsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__307)) ((((v_argBasesArgsF (mc0 - 1)) mc1) mc2) dtb__308)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 625 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesFieldsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (match dtb__309 with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__312)) ((((v_argBasesFieldsF (mc0 - 1)) mc1) mc2) dtb__310)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 633 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBindsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__313, dtb__314) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesBindingF (mc0 - 1)) mc1) mc2) dtb__313)) ((((v_argBasesBindsF (mc0 - 1)) mc1) mc2) dtb__314)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 643 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBindingF = (fun (fuel : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (locals : string B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__316) -> ((((v_argBasesGoF (fuel - 1)) sizes) locals) dtb__316)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__317) -> ((((v_argBasesClausesF (fuel - 1)) sizes) locals) dtb__317)
  | _ -> failwith "DT: impossible branch"
) in (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__315) -> ((B_dData_dList.v_append value) ((((v_argBasesGoF (fuel - 1)) sizes) locals) (dtb__315).Frontend_dAst.f_BindingSig_sigType))
  | B_dData_dMaybe.C_Maybe_Nothing -> value
  | _ -> failwith "DT: impossible branch"
))))
# 657 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesAltsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) ((B_dData_dList.v_append (v_patNamesOf (dtb__318).Frontend_dAst.f_Alt_altPat)) mc2)) (dtb__318).Frontend_dAst.f_Alt_altBody)) ((((v_argBasesAltsF (mc0 - 1)) mc1) mc2) dtb__319)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 667 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesClausesF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__320, dtb__321) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) ((B_dData_dList.v_append (v_patNamesOfPats (dtb__320).Frontend_dAst.f_LocalClause_lcPats)) mc2)) (dtb__320).Frontend_dAst.f_LocalClause_lcBody)) ((((v_argBasesClausesF (mc0 - 1)) mc1) mc2) dtb__321)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 677 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesStmtsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__322, dtb__323) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (match dtb__322 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__324, dtb__325, dtb__326) -> ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__325)) ((((v_argBasesStmtsF (mc0 - 1)) mc1) ((B_dData_dList.v_append (v_patNamesOf dtb__324)) mc2)) dtb__323))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__327, dtb__328) -> ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__327)) ((((v_argBasesStmtsF (mc0 - 1)) mc1) mc2) dtb__323))
  | Frontend_dAst.C_DoStmt_DLet (dtb__329, dtb__330) -> ((B_dData_dList.v_append ((((v_argBasesBindsF (mc0 - 1)) mc1) mc2) dtb__329)) ((((v_argBasesStmtsF (mc0 - 1)) mc1) ((B_dData_dList.v_append (v_patNamesOfBinds dtb__329)) mc2)) dtb__323))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 688 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesPartsF = (fun (mc0 : int) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__331, dtb__332) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (match dtb__331 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__333) -> ((((v_argBasesPartsF (mc0 - 1)) mc1) mc2) dtb__332)
  | Frontend_dAst.C_InterpPart_IPHole (dtb__334) -> ((B_dData_dList.v_append ((((v_argBasesGoF (mc0 - 1)) mc1) mc2) dtb__334)) ((((v_argBasesPartsF (mc0 - 1)) mc1) mc2) dtb__332))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBasesGo = (fun (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (locals : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> ((((v_argBasesGoF ((Frontend_dAstQuery.v_exprBudget 32) e)) sizes) locals) e))

# 555 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBases = (fun (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (v_dedupBases (((v_argBasesGo sizes) B_dData_dList.C_List_Nil) e)))

# 699 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_blindEdgesJ = (fun (arity : int) (i : int) -> (if (arity <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = (arity - 1); f_ScEdge_scStrictEdge = false }, ((v_blindEdgesJ (arity - 1)) i)))))

# 703 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesI = (fun (i : int) (arity : int) -> (if (i <= 0) then (if (i = 0) then ((v_blindEdgesJ arity) 0) else B_dData_dList.C_List_Nil) else ((B_dData_dList.v_append ((v_blindEdgesJ arity) i)) ((v_blindEdgesI (i - 1)) arity))))

# 710 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindEdges = (fun (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> ((v_blindEdgesI ((Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCaller) defTbl)) - 1)) (Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (s).f_Site_siteCallee) defTbl))))

# 716 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgeAt = (fun (i : int) (j : int) (deps : int B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (s).f_Site_siteArgs) j) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__335) -> (match ((((((((Elab_dTermination_dMeasure.v_relOfArg i) dtb__335) (s).f_Site_siteSizes) ctors) projs) (s).f_Site_siteCaller) facts) (s).f_Site_siteRegion) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__336) -> (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = (v_scIsStrict dtb__336) }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasBase i) deps) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = i; f_ScEdge_edgeTo = j; f_ScEdge_scStrictEdge = false }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_nthDeps = (fun (mc0 : int B_dData_dList.t_List B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__337, dtb__338) -> (if (mc1 <= 0) then dtb__337 else ((v_nthDeps dtb__338) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesJ = (fun (i : int) (count : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (count <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((((((v_siteEdgeAt i) (count - 1)) ((v_nthDeps deps) (count - 1))) s) ctors) projs) facts)) (((((((v_siteEdgesJ i) (count - 1)) deps) s) ctors) projs) facts))))

# 739 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesI = (fun (i : int) (deps : int B_dData_dList.t_List B_dData_dList.t_List) (s : t_Site) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (i <= 0) then (((((((v_siteEdgesJ 0) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts) else ((B_dData_dList.v_append (((((((v_siteEdgesJ i) (B_dData_dList.v_length (s).f_Site_siteArgs)) deps) s) ctors) projs) facts)) ((((((v_siteEdgesI (i - 1)) deps) s) ctors) projs) facts))))

# 748 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgesOf = (fun (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (s : t_Site) -> (if (s).f_Site_siteBlind then ((v_blindEdges defTbl) s) else ((((((v_siteEdgesI (v_maxBaseOf (s).f_Site_siteSizes)) ((B_dData_dList.v_map (v_argBases (s).f_Site_siteSizes)) (s).f_Site_siteArgs)) s) ctors) projs) facts)))

# 758 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_initialTableGo = (fun (mc0 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : t_Site B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : bool) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> (if mc6 then (match ((((v_tableAdd (dtb__339).f_Site_siteCaller) (dtb__339).f_Site_siteCallee) (((((v_siteEdgesOf mc0) mc2) mc3) mc4) dtb__339)) mc5) with
  | { B_dData_dPair.f_Pair_first = dtb__341; B_dData_dPair.f_Pair_second = dtb__342 } -> (((((((v_initialTableGo mc0) dtb__340) mc2) mc3) mc4) dtb__341) dtb__342)
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = false })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc5; B_dData_dPair.f_Pair_second = mc6 }
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_initialTable = (fun (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_initialTableGo defTbl) sites) ctors) projs) facts) B_dData_dList.C_List_Nil) true))

# 771 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctClosureFuel = 240

# 775 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctCheckTable = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__343, dtb__344) -> (match dtb__343 with
  | { B_dData_dPair.f_Pair_first = dtb__345; B_dData_dPair.f_Pair_second = dtb__346 } -> (match dtb__345 with
  | { B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__348 } -> (if (dtb__347 = dtb__348) then (if (v_graphsOK dtb__346) then (v_sctCheckTable dtb__344) else false) else (v_sctCheckTable dtb__344))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 780 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_sctBadGraphs = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> (if (v_graphOK dtb__349) then ((v_sctBadGraphs mc0) dtb__350) else (B_dData_dList.C_List__x58__x58_ (mc0, ((v_sctBadGraphs mc0) dtb__350))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadPairs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__351, dtb__352) -> (match dtb__351 with
  | { B_dData_dPair.f_Pair_first = dtb__353; B_dData_dPair.f_Pair_second = dtb__354 } -> (match dtb__353 with
  | { B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__356 } -> (if (dtb__355 = dtb__356) then ((B_dData_dList.v_append ((v_sctBadGraphs dtb__355) dtb__354)) (v_sctBadPairs dtb__352)) else (v_sctBadPairs dtb__352))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 792 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_strictEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(string_of_int (e).f_ScEdge_edgeFrom); "->>"; (string_of_int (e).f_ScEdge_edgeTo)]))

# 795 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_weakEdgeText = (fun (e : t_ScEdge) -> (String.concat "" [(string_of_int (e).f_ScEdge_edgeFrom); "->"; (string_of_int (e).f_ScEdge_edgeTo)]))

# 789 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeText = (fun (e : t_ScEdge) -> (if (e).f_ScEdge_scStrictEdge then (v_strictEdgeText e) else (v_weakEdgeText e)))

# 798 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesText = (fun (mc0 : t_ScEdge B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__357, dtb__358) -> (match dtb__358 with
  | B_dData_dList.C_List_Nil -> (v_edgeText dtb__357)
  | _ -> (String.concat "" [(v_edgeText dtb__357); ","; (v_edgesText dtb__358)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 803 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_badGraphText = (fun (mc0 : string) (mc1 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (if (v_graphOK dtb__359) then ((v_badGraphText mc0) dtb__360) else (B_dData_dList.C_List__x58__x58_ ((String.concat "" [mc0; "{"; (v_edgesText dtb__359); "}"]), ((v_badGraphText mc0) dtb__360))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 808 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadText = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__361, dtb__362) -> (match dtb__361 with
  | { B_dData_dPair.f_Pair_first = dtb__363; B_dData_dPair.f_Pair_second = dtb__364 } -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> (if (dtb__365 = dtb__366) then ((B_dData_dList.v_append ((v_badGraphText dtb__365) dtb__364)) (v_sctBadText dtb__362)) else (v_sctBadText dtb__362))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 813 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctDiag = (fun (table : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_joinComma (Elab_dTermination_dMeasure.v_dedup (v_sctBadText table))))

# 818 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_isBlindSite = (fun (s : t_Site) -> (s).f_Site_siteBlind)

# 821 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindPairText = (fun (s : t_Site) -> (String.concat "" [(s).f_Site_siteCaller; "->"; (s).f_Site_siteCallee]))

# 824 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctBlindNote = (fun (sites : t_Site B_dData_dList.t_List) -> (match (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_map v_blindPairText) ((B_dData_dList.v_filter v_isBlindSite) sites))) with
  | B_dData_dList.C_List_Nil -> ""
  | dtb__367 -> (String.concat "" [" [SCT \230\156\170\232\175\134\229\136\171\232\176\131\231\148\168\239\188\154"; (Elab_dTermination_dMeasure.v_joinComma dtb__367); "\239\188\136callee \228\187\165\229\128\188\228\188\160\233\128\146\230\136\150\233\129\141\229\142\134\233\162\132\231\174\151\232\128\151\229\176\189\239\188\140\229\143\170\230\140\137\229\188\177\232\190\185\232\174\161\229\133\165\239\188\137]"])
))

# 833 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_budgetDiagnostic = (fun (comp : string B_dData_dList.t_List) (msg : Base_dDiag.t_Diagnostic) -> (let subject = ((B_dData_dString.v_join ",") comp) in (let detail = (String.concat "" ["size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (string_of_int v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (string_of_int v_sctClosureFuel); " \232\189\174\239\188\137"]) in (let base = ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_TerminationBudgetExhausted (subject))) (B_dData_dVec.C_Vec__x58__x58_ (subject, B_dData_dVec.C_Vec_Nil))) in (let kept = { base with Base_dDiag.f_Diagnostic_diagLabels = (msg).Base_dDiag.f_Diagnostic_diagLabels; Base_dDiag.f_Diagnostic_diagFields = (msg).Base_dDiag.f_Diagnostic_diagFields } in ((Base_dDiag.v_appendMessage (String.concat "" [" ["; detail; "]"])) kept))))))

# 848 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_countGraphs = (fun (mc0 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__368, dtb__369) -> (match dtb__368 with
  | { B_dData_dPair.f_Pair_first = dtb__370; B_dData_dPair.f_Pair_second = dtb__371 } -> ((B_dData_dList.v_length dtb__371) + (v_countGraphs dtb__369))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 852 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheckGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let note = (v_sctBlindNote sites) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.scc_size") (B_dData_dList.v_length comp)) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.sites") (B_dData_dList.v_length sites)) in (match (((((v_initialTable defTbl) sites) ctors) projs) facts) with
  | { B_dData_dPair.f_Pair_first = dtb__372; B_dData_dPair.f_Pair_second = dtb__373 } -> (if dtb__373 then (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs") (v_countGraphs dtb__372)) in (let nd_uscrut12 = ((v_closureLoop dtb__372) v_sctClosureFuel) in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__374; B_dData_dPair.f_Pair_second = dtb__375 } -> (match dtb__375 with
  | { B_dData_dPair.f_Pair_first = dtb__376; B_dData_dPair.f_Pair_second = dtb__377 } -> (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.closure_rounds") (v_sctClosureFuel - dtb__377)) in (let _u = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs_final") (v_countGraphs dtb__374)) in (if dtb__376 then (if (v_sctCheckTable dtb__374) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_sctDiag dtb__374); "]"])) msg))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((v_budgetDiagnostic comp) msg)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage note) ((v_budgetDiagnostic comp) msg)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 843 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheck = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> ((Base_dObs.v_obsCheck "vuna.term.sct") (fun (_u : int) -> ((((((v_sctCheckGo comp) defTbl) ctors) projs) facts) msg))))

# 880 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_paramNamesOf = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__378, dtb__379) -> (match dtb__378 with
  | Frontend_dAst.C_Pat_PVar (dtb__380, dtb__381) -> (B_dData_dList.C_List__x58__x58_ (dtb__380, (v_paramNamesOf dtb__379)))
  | _ -> (v_paramNamesOf dtb__379)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 887 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramIndexGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__382, dtb__383) -> (match dtb__382 with
  | Frontend_dAst.C_Pat_PVar (dtb__384, dtb__385) -> (if (dtb__384 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_paramIndexGo dtb__383) mc1) (mc2 + 1)))
  | _ -> (((v_paramIndexGo dtb__383) mc1) (mc2 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasFuelGuardF = (fun (fuel : int) (p0 : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then false else (match e with
  | Frontend_dAst.C_Expr_EIf (dtb__386, dtb__387, dtb__388, dtb__389) -> (match (Elab_dTermination_dMeasure.v_guardPosVar dtb__386) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__390) -> (dtb__390 = p0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_hasFuelGuardF (fuel - 1)) p0) dtb__387) then true else (((v_hasFuelGuardF (fuel - 1)) p0) dtb__388))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ECase (dtb__391, dtb__392, dtb__393) -> (((v_anyAltFuelGuardF (fuel - 1)) p0) dtb__392)
  | Frontend_dAst.C_Expr_ELet (dtb__394, dtb__395, dtb__396, dtb__397) -> (if (((v_hasFuelGuardF (fuel - 1)) p0) dtb__395) then true else (((v_anyBindFuelGuardF (fuel - 1)) p0) dtb__394))
  | Frontend_dAst.C_Expr_ELam (dtb__398, dtb__399, dtb__400) -> (((v_hasFuelGuardF (fuel - 1)) p0) dtb__399)
  | _ -> false
)))
# 916 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyAltFuelGuardF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__401, dtb__402) -> (if (mc0 <= 0) then false else (if (((v_hasFuelGuardF (mc0 - 1)) mc1) (dtb__401).Frontend_dAst.f_Alt_altBody) then true else (((v_anyAltFuelGuardF (mc0 - 1)) mc1) dtb__402)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 924 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyBindFuelGuardF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__403, dtb__404) -> (if (mc0 <= 0) then false else (if (((v_bindingHasFuelGuardF (mc0 - 1)) mc1) dtb__403) then true else (((v_anyBindFuelGuardF (mc0 - 1)) mc1) dtb__404)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 932 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_bindingHasFuelGuardF = (fun (fuel : int) (p0 : string) (b : Frontend_dAst.t_Binding) -> (if (fuel <= 0) then false else (let value = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__406) -> (((v_hasFuelGuardF (fuel - 1)) p0) dtb__406)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__407) -> (((v_anyClauseFuelGuardF (fuel - 1)) p0) dtb__407)
  | _ -> failwith "DT: impossible branch"
) in (if value then true else (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__405) -> (((v_hasFuelGuardF (fuel - 1)) p0) (dtb__405).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))
# 949 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyClauseFuelGuardF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__408, dtb__409) -> (if (mc0 <= 0) then false else (if (((v_hasFuelGuardF (mc0 - 1)) mc1) (dtb__408).Frontend_dAst.f_LocalClause_lcBody) then true else (((v_anyClauseFuelGuardF (mc0 - 1)) mc1) dtb__409)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_hasFuelGuard = (fun (p0 : string) (e : Frontend_dAst.t_Expr) -> (((v_hasFuelGuardF ((Frontend_dAstQuery.v_exprBudget 32) e)) p0) e))

# 957 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_guardParamGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__410, dtb__411) -> (if ((v_hasFuelGuard dtb__410) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__410)) else ((v_guardParamGo dtb__411) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamNameOf = (fun (name : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__412, dtb__413) -> ((v_guardParamGo (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__412))) (B_dData_dPair.v_secondOf dtb__412))
  | _ -> failwith "DT: impossible branch"
))

# 970 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamIndexOf = (fun (callee : string) (callerFuel : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl callee) defTbl) with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | B_dData_dList.C_List__x58__x58_ (dtb__414, dtb__415) -> (let pats = (B_dData_dPair.v_firstOf dtb__414) in (match ((v_fuelParamNameOf callee) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (((v_paramIndexGo pats) dtb__416) 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_paramIndexGo pats) callerFuel) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__417) -> (B_dData_dMaybe.C_Maybe_Just (dtb__417))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 984 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_callerFuelName = (fun (name : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf name) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__418) -> dtb__418
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__419, dtb__420) -> (match (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__419)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__421, dtb__422) -> dtb__421
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_paramsOf = (fun (name : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl name) defTbl) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__423, dtb__424) -> (v_paramNamesOf (B_dData_dPair.v_firstOf dtb__423))
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteFuelStrict = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : int B_dData_dMaybe.t_Maybe) (mc3 : t_Site) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (mc3).f_Site_siteArgs) dtb__425) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__426) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = dtb__426 in (match nd_uscrut9 with
  | Frontend_dAst.C_Expr_EApp (dtb__427, dtb__428, dtb__429) -> (match dtb__427 with
  | Frontend_dAst.C_Expr_EVar (dtb__430, dtb__431) -> (if (Elab_dTermination_dMeasure.v_isSubOpName dtb__430) then (let nd_uscrut15 = dtb__428 in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> (match dtb__432 with
  | Frontend_dAst.C_Expr_EVar (dtb__434, dtb__435) -> (match dtb__433 with
  | B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__437) -> (match dtb__436 with
  | Frontend_dAst.C_Expr_EInt (dtb__438, dtb__439) -> (match dtb__437 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__438 > 0) then ((B_dData_dList.v_memName dtb__434) mc0) else false) then (B_dData_dMaybe.C_Maybe_Just (true)) else (B_dData_dMaybe.C_Maybe_Just (false)))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__440) -> (let nd_uscrut10 = dtb__426 in (match nd_uscrut10 with
  | Frontend_dAst.C_Expr_EApp (dtb__441, dtb__442, dtb__443) -> (match dtb__441 with
  | Frontend_dAst.C_Expr_EVar (dtb__444, dtb__445) -> (if (Elab_dTermination_dMeasure.v_isSubOpName dtb__444) then (let nd_uscrut16 = dtb__442 in (match nd_uscrut16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__446, dtb__447) -> (match dtb__446 with
  | Frontend_dAst.C_Expr_EVar (dtb__448, dtb__449) -> (match dtb__447 with
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> (match dtb__450 with
  | Frontend_dAst.C_Expr_EInt (dtb__452, dtb__453) -> (match dtb__451 with
  | B_dData_dList.C_List_Nil -> (if (dtb__448 = dtb__440) then (if (dtb__452 > 0) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
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
  | Frontend_dAst.C_Expr_EVar (dtb__454, dtb__455) -> (if (dtb__454 = dtb__440) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1039 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_fuelEdgesGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : t_Site B_dData_dList.t_List) (mc3 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (let inGroup = ((B_dData_dList.v_memName (dtb__456).f_Site_siteCallee) mc0) in (let mode = (let nd_uscrut8 = ((((v_siteFuelStrict ((v_paramsOf (dtb__456).f_Site_siteCaller) mc1)) ((v_fuelParamNameOf (dtb__456).f_Site_siteCaller) mc1)) (((v_fuelParamIndexOf (dtb__456).f_Site_siteCallee) ((v_callerFuelName (dtb__456).f_Site_siteCaller) mc1)) mc1)) dtb__456) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__458) -> (if dtb__458 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) in (let acc2 = (if inGroup then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (dtb__456).f_Site_siteCaller; B_dData_dPair.f_Pair_second = (dtb__456).f_Site_siteCallee }; B_dData_dPair.f_Pair_second = mode }; B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, mc3)) else mc3) in ((((v_fuelEdgesGo mc0) mc1) dtb__457) acc2))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelEdgesOf = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (sites : t_Site B_dData_dList.t_List) -> ((((v_fuelEdgesGo comp) defTbl) sites) B_dData_dList.C_List_Nil))

# 1054 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_memberGuarded = (fun (f : string) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf f) defTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__459) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1060 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_unguardedOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__460, dtb__461) -> (if ((v_memberGuarded dtb__460) mc1) then ((v_unguardedOf dtb__461) mc1) else (B_dData_dList.C_List__x58__x58_ (dtb__460, ((v_unguardedOf dtb__461) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1066 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_allWeakEdges = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__462, dtb__463) -> (match dtb__462 with
  | { B_dData_dPair.f_Pair_first = dtb__464; B_dData_dPair.f_Pair_second = dtb__465 } -> (match dtb__464 with
  | { B_dData_dPair.f_Pair_first = dtb__466; B_dData_dPair.f_Pair_second = dtb__467 } -> (match dtb__466 with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 }; B_dData_dPair.f_Pair_second = 0 }; B_dData_dPair.f_Pair_second = dtb__465 }, (v_allWeakEdges dtb__463)))
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
let[@tail_mod_cons] rec v_onlyUnguarded = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__470, dtb__471) -> (match dtb__470 with
  | { B_dData_dPair.f_Pair_first = dtb__472; B_dData_dPair.f_Pair_second = dtb__473 } -> (match dtb__472 with
  | { B_dData_dPair.f_Pair_first = dtb__474; B_dData_dPair.f_Pair_second = dtb__475 } -> (match dtb__474 with
  | { B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__477 } -> (if ((B_dData_dList.v_memName dtb__476) mc0) then (if ((B_dData_dList.v_memName dtb__477) mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__477 }; B_dData_dPair.f_Pair_second = dtb__475 }; B_dData_dPair.f_Pair_second = dtb__473 }, ((v_onlyUnguarded mc0) dtb__471))) else ((v_onlyUnguarded mc0) dtb__471)) else ((v_onlyUnguarded mc0) dtb__471))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1082 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_unguardedCycle = (fun (unguarded : string B_dData_dList.t_List) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Elab_dTermination_dMeasure.v_hasWeakCycle unguarded) (v_allWeakEdges ((v_onlyUnguarded unguarded) edges))))

# 1089 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelAcceptable = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_unguardedOf comp) defTbl) with
  | B_dData_dList.C_List_Nil -> true
  | dtb__478 -> (if ((v_unguardedCycle dtb__478) edges) then false else true)
))

# 1107 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeModeOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__479; B_dData_dPair.f_Pair_second = dtb__480 } -> (match dtb__479 with
  | { B_dData_dPair.f_Pair_first = dtb__481; B_dData_dPair.f_Pair_second = dtb__482 } -> (match dtb__481 with
  | { B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = dtb__484 } -> dtb__482
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1095 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tryFuelThread = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (msg : Base_dDiag.t_Diagnostic) -> (let sites = (((((v_siteCollect comp) ctors) projs) defTbl) facts) in (let edges = (((v_fuelEdgesOf comp) defTbl) sites) in (let strictCount = (B_dData_dList.v_length (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_edgeModeOf) edges))) in (if (if (if (strictCount > 0) then (((v_fuelAcceptable comp) defTbl) edges) else false) then (B_dData_dBool.v_not ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) edges)) else false) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (msg)))))))

# 15 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCaller = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__485; f_Site_siteCallee = dtb__486; f_Site_siteArgs = dtb__487; f_Site_siteSizes = dtb__488; f_Site_siteRegion = dtb__489; f_Site_siteBlind = dtb__490 } -> dtb__485
  | _ -> failwith "DT: impossible branch"
))

# 16 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCallee = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__491; f_Site_siteCallee = dtb__492; f_Site_siteArgs = dtb__493; f_Site_siteSizes = dtb__494; f_Site_siteRegion = dtb__495; f_Site_siteBlind = dtb__496 } -> dtb__492
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteArgs = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__497; f_Site_siteCallee = dtb__498; f_Site_siteArgs = dtb__499; f_Site_siteSizes = dtb__500; f_Site_siteRegion = dtb__501; f_Site_siteBlind = dtb__502 } -> dtb__499
  | _ -> failwith "DT: impossible branch"
))

# 18 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteSizes = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__503; f_Site_siteCallee = dtb__504; f_Site_siteArgs = dtb__505; f_Site_siteSizes = dtb__506; f_Site_siteRegion = dtb__507; f_Site_siteBlind = dtb__508 } -> dtb__506
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteRegion = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__509; f_Site_siteCallee = dtb__510; f_Site_siteArgs = dtb__511; f_Site_siteSizes = dtb__512; f_Site_siteRegion = dtb__513; f_Site_siteBlind = dtb__514 } -> dtb__513
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteBlind = (fun (p : t_Site) -> (match p with
  | { f_Site_siteCaller = dtb__515; f_Site_siteCallee = dtb__516; f_Site_siteArgs = dtb__517; f_Site_siteSizes = dtb__518; f_Site_siteRegion = dtb__519; f_Site_siteBlind = dtb__520 } -> dtb__520
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeFrom = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__521; f_ScEdge_edgeTo = dtb__522; f_ScEdge_scStrictEdge = dtb__523 } -> dtb__521
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeTo = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__524; f_ScEdge_edgeTo = dtb__525; f_ScEdge_scStrictEdge = dtb__526 } -> dtb__525
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scStrictEdge = (fun (p : t_ScEdge) -> (match p with
  | { f_ScEdge_edgeFrom = dtb__527; f_ScEdge_edgeTo = dtb__528; f_ScEdge_scStrictEdge = dtb__529 } -> dtb__529
  | _ -> failwith "DT: impossible branch"
))
