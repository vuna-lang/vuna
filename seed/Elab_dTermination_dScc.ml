open Vuna_runtime
type t_Site = { f_Site_siteCaller : string; f_Site_siteCallee : string; f_Site_siteArgs : Frontend_dAst.t_Expr B_dData_dList.t_List; f_Site_siteSizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Site_siteRegion : string B_dData_dList.t_List; f_Site_siteBlind : bool }
and t_ScEdge = { f_ScEdge_edgeFrom : int; f_ScEdge_edgeTo : int; f_ScEdge_scStrictEdge : bool }

# 26 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindSitesOf = (fun (dtb_u_u1 : string B_dData_dList.t_List) (dtb_u_u2 : string) (dtb_u_u3 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u4 : string B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u5 : string) -> { f_Site_siteCaller = dtb_u_u2; f_Site_siteCallee = dtb_u_u5; f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = dtb_u_u3; f_Site_siteRegion = dtb_u_u4; f_Site_siteBlind = true })) dtb_u_u1))

# 121 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_clauseWalkPair = (fun (dtb_u_u6 : Frontend_dAst.t_LocalClause) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_exprSpan (dtb_u_u6).Frontend_dAst.f_LocalClause_lcBody)))); B_dData_dPair.f_Pair_second = (dtb_u_u6).Frontend_dAst.f_LocalClause_lcBody })

# 117 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_bindingWalkPairs = (fun (dtb_u_u7 : Frontend_dAst.t_Binding) -> (match dtb_u_u7 with
  | { Frontend_dAst.f_Binding_bindPat = dtb_u_u8; Frontend_dAst.f_Binding_bindValue = dtb_u_u9; Frontend_dAst.f_Binding_bindSig = dtb_u_u10; Frontend_dAst.f_Binding_bindRef = dtb_u_u11 } -> (match dtb_u_u9 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u12) -> ((B_dData_dList.v_map v_clauseWalkPair) dtb_u_u12)
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u13) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u8; B_dData_dPair.f_Pair_second = dtb_u_u13 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_bindsToWalkPairs = (fun (dtb_u_u14 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u14 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u16) -> ((B_dData_dList.v_append (v_bindingWalkPairs dtb_u_u15)) (v_bindsToWalkPairs dtb_u_u16))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectList = (fun (dtb_u_u17 : int) (dtb_u_u18 : string B_dData_dList.t_List) (dtb_u_u19 : string B_dData_dList.t_List) (dtb_u_u20 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u21 : string) (dtb_u_u22 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u23 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u24 : string B_dData_dList.t_List) (dtb_u_u25 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u26 : t_Site B_dData_dList.t_List) -> (match dtb_u_u25 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u27, dtb_u_u28) -> (if (dtb_u_u17 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u18) dtb_u_u21) dtb_u_u23) dtb_u_u24)) dtb_u_u26) else ((((((((((v_siteCollectList (dtb_u_u17 - 1)) dtb_u_u18) dtb_u_u19) dtb_u_u20) dtb_u_u21) dtb_u_u22) dtb_u_u23) dtb_u_u24) dtb_u_u28) ((((((((((v_siteWalkC (dtb_u_u17 - 1)) dtb_u_u18) dtb_u_u19) dtb_u_u20) dtb_u_u21) dtb_u_u22) dtb_u_u23) dtb_u_u24) dtb_u_u27) dtb_u_u26)))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u17 <= 0) then dtb_u_u26 else dtb_u_u26)
  | _ -> failwith "DT: impossible branch"
))
# 53 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectFields = (fun (dtb_u_u29 : int) (dtb_u_u30 : string B_dData_dList.t_List) (dtb_u_u31 : string B_dData_dList.t_List) (dtb_u_u32 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u33 : string) (dtb_u_u34 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u35 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u36 : string B_dData_dList.t_List) (dtb_u_u37 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u38 : t_Site B_dData_dList.t_List) -> (match dtb_u_u37 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u39, dtb_u_u40) -> (match dtb_u_u39 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u41; B_dData_dPair.f_Pair_second = dtb_u_u42 } -> (if (dtb_u_u29 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u30) dtb_u_u33) dtb_u_u35) dtb_u_u36)) dtb_u_u38) else ((((((((((v_siteCollectFields (dtb_u_u29 - 1)) dtb_u_u30) dtb_u_u31) dtb_u_u32) dtb_u_u33) dtb_u_u34) dtb_u_u35) dtb_u_u36) dtb_u_u40) ((((((((((v_siteWalkC (dtb_u_u29 - 1)) dtb_u_u30) dtb_u_u31) dtb_u_u32) dtb_u_u33) dtb_u_u34) dtb_u_u35) dtb_u_u36) dtb_u_u42) dtb_u_u38)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u29 <= 0) then dtb_u_u38 else dtb_u_u38)
  | _ -> failwith "DT: impossible branch"
))
# 72 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectAlts = (fun (dtb_u_u43 : int) (dtb_u_u44 : string B_dData_dList.t_List) (dtb_u_u45 : string B_dData_dList.t_List) (dtb_u_u46 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u47 : string) (dtb_u_u48 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u49 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u50 : string B_dData_dList.t_List) (dtb_u_u51 : Frontend_dAst.t_Expr) (dtb_u_u52 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u53 : t_Site B_dData_dList.t_List) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (if (dtb_u_u43 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u44) dtb_u_u47) dtb_u_u49) dtb_u_u50)) dtb_u_u53) else (((((((((((v_siteCollectAlts (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u46) dtb_u_u47) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u55) ((((((((((v_siteWalkC (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u46) dtb_u_u47) dtb_u_u48) ((((Elab_dTermination_dMeasure.v_extendSizesStrict dtb_u_u46) dtb_u_u49) dtb_u_u51) (dtb_u_u54).Frontend_dAst.f_Alt_altPat)) dtb_u_u50) (dtb_u_u54).Frontend_dAst.f_Alt_altBody) dtb_u_u53)))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u43 <= 0) then dtb_u_u53 else dtb_u_u53)
  | _ -> failwith "DT: impossible branch"
))
# 92 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectBinds = (fun (dtb_u_u56 : int) (dtb_u_u57 : string B_dData_dList.t_List) (dtb_u_u58 : string B_dData_dList.t_List) (dtb_u_u59 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u60 : string) (dtb_u_u61 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u62 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u63 : string B_dData_dList.t_List) (dtb_u_u64 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u65 : t_Site B_dData_dList.t_List) -> (match dtb_u_u64 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (match dtb_u_u66 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u68; B_dData_dPair.f_Pair_second = dtb_u_u69 } -> (if (dtb_u_u56 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u57) dtb_u_u60) dtb_u_u62) dtb_u_u63)) dtb_u_u65) else ((((((((((v_siteCollectBinds (dtb_u_u56 - 1)) dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u60) dtb_u_u61) ((((Elab_dTermination_dMeasure.v_extendSizesStrict dtb_u_u59) dtb_u_u62) dtb_u_u69) dtb_u_u68)) dtb_u_u63) dtb_u_u67) ((((((((((v_siteWalkC (dtb_u_u56 - 1)) dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u60) dtb_u_u61) dtb_u_u62) dtb_u_u63) dtb_u_u69) dtb_u_u65)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u56 <= 0) then dtb_u_u65 else dtb_u_u65)
  | _ -> failwith "DT: impossible branch"
))
# 124 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteCollectStmts = (fun (dtb_u_u70 : int) (dtb_u_u71 : string B_dData_dList.t_List) (dtb_u_u72 : string B_dData_dList.t_List) (dtb_u_u73 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u74 : string) (dtb_u_u75 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u76 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u77 : string B_dData_dList.t_List) (dtb_u_u78 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u79 : t_Site B_dData_dList.t_List) -> (match dtb_u_u78 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (if (dtb_u_u70 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u71) dtb_u_u74) dtb_u_u76) dtb_u_u77)) dtb_u_u79) else (match dtb_u_u80 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u82, dtb_u_u83, dtb_u_u84) -> ((((((((((v_siteCollectStmts (dtb_u_u70 - 1)) dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74) dtb_u_u75) ((((Elab_dTermination_dMeasure.v_extendSizesStrict dtb_u_u73) dtb_u_u76) dtb_u_u83) dtb_u_u82)) dtb_u_u77) dtb_u_u81) ((((((((((v_siteWalkC (dtb_u_u70 - 1)) dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74) dtb_u_u75) dtb_u_u76) dtb_u_u77) dtb_u_u83) dtb_u_u79))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u85, dtb_u_u86) -> ((((((((((v_siteCollectStmts (dtb_u_u70 - 1)) dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74) dtb_u_u75) dtb_u_u76) dtb_u_u77) dtb_u_u81) ((((((((((v_siteWalkC (dtb_u_u70 - 1)) dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74) dtb_u_u75) dtb_u_u76) dtb_u_u77) dtb_u_u85) dtb_u_u79))
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u87, dtb_u_u88) -> ((((((((((v_siteCollectStmts (dtb_u_u70 - 1)) dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74) dtb_u_u75) (((Elab_dTermination_dMeasure.v_extendByBinds dtb_u_u73) dtb_u_u87) dtb_u_u76)) dtb_u_u77) dtb_u_u81) ((((((((((v_siteCollectBinds (dtb_u_u70 - 1)) dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74) dtb_u_u75) dtb_u_u76) dtb_u_u77) (v_bindsToWalkPairs dtb_u_u87)) dtb_u_u79))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u70 <= 0) then dtb_u_u79 else dtb_u_u79)
  | _ -> failwith "DT: impossible branch"
))
# 136 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkC = (fun (dtb_u_u89 : int) (dtb_u_u90 : string B_dData_dList.t_List) (dtb_u_u91 : string B_dData_dList.t_List) (dtb_u_u92 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u93 : string) (dtb_u_u94 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u95 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u96 : string B_dData_dList.t_List) (dtb_u_u97 : Frontend_dAst.t_Expr) (dtb_u_u98 : t_Site B_dData_dList.t_List) -> (if (dtb_u_u89 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u90) dtb_u_u93) dtb_u_u95) dtb_u_u96)) dtb_u_u98) else (match dtb_u_u97 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u99, dtb_u_u100, dtb_u_u101) -> (((((((((((v_siteWalkEApp (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u99) dtb_u_u100) dtb_u_u98)
  | Frontend_dAst.C_Expr_ECase (dtb_u_u102, dtb_u_u103, dtb_u_u104) -> (((((((((((v_siteCollectAlts (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u102) dtb_u_u103) ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u102) dtb_u_u98))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u105, dtb_u_u106, dtb_u_u107, dtb_u_u108) -> (let dtb_u_u109 = ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u105) dtb_u_u98) in (let dtb_u_u110 = ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb_u_u105)) dtb_u_u96)) dtb_u_u106) dtb_u_u109) in ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb_u_u105)) dtb_u_u96)) dtb_u_u107) dtb_u_u110)))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u111, dtb_u_u112, dtb_u_u113) -> ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u112) dtb_u_u98)
  | Frontend_dAst.C_Expr_ELet (dtb_u_u114, dtb_u_u115, dtb_u_u116, dtb_u_u117) -> ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) (((Elab_dTermination_dMeasure.v_extendByBinds dtb_u_u92) dtb_u_u114) dtb_u_u95)) dtb_u_u96) dtb_u_u115) ((((((((((v_siteCollectBinds (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) (v_bindsToWalkPairs dtb_u_u114)) dtb_u_u98))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u118, dtb_u_u119, dtb_u_u120, dtb_u_u121, dtb_u_u122, dtb_u_u123) -> ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u122) ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u121) dtb_u_u98))
  | Frontend_dAst.C_Expr_EField (dtb_u_u124, dtb_u_u125, dtb_u_u126) -> ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u124) dtb_u_u98)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u127, dtb_u_u128, dtb_u_u129) -> ((((((((((v_siteCollectFields (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u128) dtb_u_u98)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u130, dtb_u_u131, dtb_u_u132) -> ((((((((((v_siteCollectFields (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u131) ((((((((((v_siteWalkC (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u130) dtb_u_u98))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u133, dtb_u_u134) -> ((((((((((v_siteCollectStmts (dtb_u_u89 - 1)) dtb_u_u90) dtb_u_u91) dtb_u_u92) dtb_u_u93) dtb_u_u94) dtb_u_u95) dtb_u_u96) dtb_u_u133) dtb_u_u98)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u135, dtb_u_u136) -> (if ((B_dData_dList.v_memName dtb_u_u135) dtb_u_u90) then (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = dtb_u_u93; f_Site_siteCallee = dtb_u_u135; f_Site_siteArgs = B_dData_dList.C_List_Nil; f_Site_siteSizes = dtb_u_u95; f_Site_siteRegion = dtb_u_u96; f_Site_siteBlind = true }, dtb_u_u98)) else dtb_u_u98)
  | _ -> dtb_u_u98
)))
# 159 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEApp = (fun (dtb_u_u137 : int) (dtb_u_u138 : string B_dData_dList.t_List) (dtb_u_u139 : string B_dData_dList.t_List) (dtb_u_u140 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u141 : string) (dtb_u_u142 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u143 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u144 : string B_dData_dList.t_List) (dtb_u_u145 : Frontend_dAst.t_Expr) (dtb_u_u146 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u147 : t_Site B_dData_dList.t_List) -> (if (dtb_u_u137 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u138) dtb_u_u141) dtb_u_u143) dtb_u_u144)) dtb_u_u147) else (match ((Elab_dTermination_dMeasure.v_groupHead dtb_u_u138) dtb_u_u145) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u148) -> ((((((((((v_siteCollectList (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u146) (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = dtb_u_u141; f_Site_siteCallee = dtb_u_u148; f_Site_siteArgs = dtb_u_u146; f_Site_siteSizes = dtb_u_u143; f_Site_siteRegion = dtb_u_u144; f_Site_siteBlind = false }, dtb_u_u147)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u145 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u149, dtb_u_u150) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb_u_u149) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u151) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb_u_u151) dtb_u_u146) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u152) -> (let dtb_u_u153 = ((((((((((v_siteCollectList (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) (dtb_u_u152).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) dtb_u_u147) in (let dtb_u_u154 = (((Elab_dTermination_dMeasure.v_extendElemSizes dtb_u_u143) (dtb_u_u152).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb_u_u152).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in ((((((((((v_siteWalkC (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u154) dtb_u_u144) (dtb_u_u152).Elab_dTermination_dMeasure.f_HofCall_hofBody) dtb_u_u153)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb_u_u151).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then (((((((((((v_siteWalkEAppMap (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u145) dtb_u_u146) dtb_u_u147) else ((((((((((v_siteCollectList (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u146) ((((((((((v_siteWalkC (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u145) dtb_u_u147)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_siteCollectList (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u146) ((((((((((v_siteWalkC (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u145) dtb_u_u147))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((v_siteCollectList (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u146) ((((((((((v_siteWalkC (dtb_u_u137 - 1)) dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u142) dtb_u_u143) dtb_u_u144) dtb_u_u145) dtb_u_u147))
)
  | _ -> failwith "DT: impossible branch"
)))
# 181 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkEAppMap = (fun (dtb_u_u155 : int) (dtb_u_u156 : string B_dData_dList.t_List) (dtb_u_u157 : string B_dData_dList.t_List) (dtb_u_u158 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u159 : string) (dtb_u_u160 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u161 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u162 : string B_dData_dList.t_List) (dtb_u_u163 : Frontend_dAst.t_Expr) (dtb_u_u164 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u165 : t_Site B_dData_dList.t_List) -> (if (dtb_u_u155 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u156) dtb_u_u159) dtb_u_u161) dtb_u_u162)) dtb_u_u165) else (let dtb_u_u166 = dtb_u_u164 in (match dtb_u_u166 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u167, dtb_u_u168) -> (match dtb_u_u168 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u169, dtb_u_u170) -> (match dtb_u_u170 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u171 = dtb_u_u167 in (match dtb_u_u171 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u172, dtb_u_u173) -> (if ((B_dData_dList.v_memName dtb_u_u172) dtb_u_u156) then (((((((((((((v_siteWalkMapPartialInline (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u172) B_dData_dList.C_List_Nil) dtb_u_u169) (Frontend_dAst.v_nodeRefSpan dtb_u_u173)) dtb_u_u165) else ((((((((((v_siteCollectList (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u164) dtb_u_u165))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u174, dtb_u_u175, dtb_u_u176) -> (match dtb_u_u174 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u177, dtb_u_u178) -> (if ((B_dData_dList.v_memName dtb_u_u177) dtb_u_u156) then (((((((((((((v_siteWalkMapPartialInline (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u177) dtb_u_u175) dtb_u_u169) (Frontend_dAst.v_nodeRefSpan dtb_u_u176)) dtb_u_u165) else ((((((((((v_siteCollectList (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u164) dtb_u_u165))
  | _ -> ((((((((((v_siteCollectList (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u164) dtb_u_u165)
)
  | _ -> ((((((((((v_siteCollectList (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u164) dtb_u_u165)
))
  | _ -> ((((((((((v_siteCollectList (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u164) dtb_u_u165)
)
  | _ -> ((((((((((v_siteCollectList (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u164) dtb_u_u165)
)
  | _ -> ((((((((((v_siteCollectList (dtb_u_u155 - 1)) dtb_u_u156) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u161) dtb_u_u162) dtb_u_u164) dtb_u_u165)
))))
# 194 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_siteWalkMapPartialInline = (fun (dtb_u_u179 : int) (dtb_u_u180 : string B_dData_dList.t_List) (dtb_u_u181 : string B_dData_dList.t_List) (dtb_u_u182 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u183 : string) (dtb_u_u184 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u185 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u186 : string B_dData_dList.t_List) (dtb_u_u187 : string) (dtb_u_u188 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u189 : Frontend_dAst.t_Expr) (dtb_u_u190 : Base_dSource.t_Span) (dtb_u_u191 : t_Site B_dData_dList.t_List) -> (if (dtb_u_u179 <= 0) then ((B_dData_dList.v_append ((((v_blindSitesOf dtb_u_u180) dtb_u_u183) dtb_u_u185) dtb_u_u186)) dtb_u_u191) else (let dtb_u_u192 = ((((((((((v_siteWalkC (dtb_u_u179 - 1)) dtb_u_u180) dtb_u_u181) dtb_u_u182) dtb_u_u183) dtb_u_u184) dtb_u_u185) dtb_u_u186) dtb_u_u189) dtb_u_u191) in (let dtb_u_u193 = (((Elab_dTermination_dMeasure.v_extendElemSizes dtb_u_u185) dtb_u_u189) "$elem") in (let dtb_u_u194 = ((B_dData_dList.v_append dtb_u_u188) (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("$elem", (Frontend_dAst.v_detachedNodeRef dtb_u_u190))), B_dData_dList.C_List_Nil))) in (let dtb_u_u195 = ((((((((((v_siteCollectList (dtb_u_u179 - 1)) dtb_u_u180) dtb_u_u181) dtb_u_u182) dtb_u_u183) dtb_u_u184) dtb_u_u185) dtb_u_u186) dtb_u_u188) dtb_u_u192) in (B_dData_dList.C_List__x58__x58_ ({ f_Site_siteCaller = dtb_u_u183; f_Site_siteCallee = dtb_u_u187; f_Site_siteArgs = dtb_u_u194; f_Site_siteSizes = dtb_u_u193; f_Site_siteRegion = dtb_u_u186; f_Site_siteBlind = false }, dtb_u_u195))))))))

# 210 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasNameOf = (fun (dtb_u_u196 : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u196))

# 213 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_lookupAlias = (fun (dtb_u_u197 : string) (dtb_u_u198 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u198 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u199, dtb_u_u200) -> (match dtb_u_u199 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u201; B_dData_dPair.f_Pair_second = dtb_u_u202 } -> (if (dtb_u_u197 = dtb_u_u201) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u202)) else ((v_lookupAlias dtb_u_u197) dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_dropAliases = (fun (dtb_u_u203 : string B_dData_dList.t_List) (dtb_u_u204 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u203 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u205, dtb_u_u206) -> ((v_dropAliases dtb_u_u206) ((B_dData_dList.v_filter (fun (dtb_u_u207 : (string, string) B_dData_dPair.t_Pair) -> ((v_aliasNameOf dtb_u_u207) <> dtb_u_u205))) dtb_u_u204))
  | B_dData_dList.C_List_Nil -> dtb_u_u204
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_aliasOf = (fun (dtb_u_u208 : string B_dData_dList.t_List) (dtb_u_u209 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u209 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u210; B_dData_dPair.f_Pair_second = dtb_u_u211 } -> (match dtb_u_u210 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u212, dtb_u_u213) -> (match dtb_u_u211 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u214, dtb_u_u215) -> (if ((B_dData_dList.v_memName dtb_u_u214) dtb_u_u208) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u212; B_dData_dPair.f_Pair_second = dtb_u_u214 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scIsStrict = (fun (dtb_u_u216 : int) -> (dtb_u_u216 <> 0))

# 365 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_maxBaseOf = (fun (dtb_u_u217 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u217 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u218, dtb_u_u219) -> (match dtb_u_u218 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u220; B_dData_dPair.f_Pair_second = dtb_u_u221 } -> (match dtb_u_u221 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u222; B_dData_dPair.f_Pair_second = dtb_u_u223 } -> (match dtb_u_u223 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u224; B_dData_dPair.f_Pair_second = dtb_u_u225 } -> ((Elab_dTermination_dMeasure.v_maxInt dtb_u_u222) (v_maxBaseOf dtb_u_u219))
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
let[@tail_mod_cons] rec v_insertEdge = (fun (dtb_u_u226 : t_ScEdge) (dtb_u_u227 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u227 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u228, dtb_u_u229) -> (if ((dtb_u_u226).f_ScEdge_edgeFrom < (dtb_u_u228).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u226, (B_dData_dList.C_List__x58__x58_ (dtb_u_u228, dtb_u_u229)))) else (if ((dtb_u_u226).f_ScEdge_edgeFrom = (dtb_u_u228).f_ScEdge_edgeFrom) then (if ((dtb_u_u226).f_ScEdge_edgeTo <= (dtb_u_u228).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u226, (B_dData_dList.C_List__x58__x58_ (dtb_u_u228, dtb_u_u229)))) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u228, ((v_insertEdge dtb_u_u226) dtb_u_u229)))) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u228, ((v_insertEdge dtb_u_u226) dtb_u_u229)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u226, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sortEdges = (fun (dtb_u_u230 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u230 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u231, dtb_u_u232) -> ((v_insertEdge dtb_u_u231) (v_sortEdges dtb_u_u232))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_mergeStrict = (fun (dtb_u_u233 : t_ScEdge) (dtb_u_u234 : t_ScEdge) -> { f_ScEdge_edgeFrom = (dtb_u_u233).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (dtb_u_u233).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (dtb_u_u233).f_ScEdge_scStrictEdge then true else (dtb_u_u234).f_ScEdge_scStrictEdge) })

# 386 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_compactEdges = (fun (dtb_u_u235 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u235 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u236, dtb_u_u237) -> (match dtb_u_u237 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u236, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u238, dtb_u_u239) -> (if ((dtb_u_u236).f_ScEdge_edgeFrom = (dtb_u_u238).f_ScEdge_edgeFrom) then (if ((dtb_u_u236).f_ScEdge_edgeTo = (dtb_u_u238).f_ScEdge_edgeTo) then (B_dData_dList.C_List__x58__x58_ (((v_mergeStrict dtb_u_u236) dtb_u_u238), (v_compactEdges dtb_u_u239))) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u236, (v_compactEdges dtb_u_u237)))) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u236, (v_compactEdges dtb_u_u237))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_canonEdges = (fun (dtb_u_u240 : t_ScEdge B_dData_dList.t_List) -> (v_compactEdges (v_sortEdges dtb_u_u240)))

# 400 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesEqCanon = (fun (dtb_u_u241 : t_ScEdge B_dData_dList.t_List) (dtb_u_u242 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u241 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u242 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u243, dtb_u_u244) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u245, dtb_u_u246) -> (match dtb_u_u242 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u247, dtb_u_u248) -> (if ((dtb_u_u245).f_ScEdge_edgeFrom = (dtb_u_u247).f_ScEdge_edgeFrom) then (if ((dtb_u_u245).f_ScEdge_edgeTo = (dtb_u_u247).f_ScEdge_edgeTo) then (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) (dtb_u_u245).f_ScEdge_scStrictEdge) (dtb_u_u247).f_ScEdge_scStrictEdge) then ((v_edgesEqCanon dtb_u_u246) dtb_u_u248) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgesEq = (fun (dtb_u_u249 : t_ScEdge B_dData_dList.t_List) (dtb_u_u250 : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEqCanon (v_canonEdges dtb_u_u249)) (v_canonEdges dtb_u_u250)))

# 416 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_combineWith = (fun (dtb_u_u251 : t_ScEdge) (dtb_u_u252 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u252 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u253, dtb_u_u254) -> (if ((dtb_u_u251).f_ScEdge_edgeTo = (dtb_u_u253).f_ScEdge_edgeFrom) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = (dtb_u_u251).f_ScEdge_edgeFrom; f_ScEdge_edgeTo = (dtb_u_u253).f_ScEdge_edgeTo; f_ScEdge_scStrictEdge = (if (dtb_u_u251).f_ScEdge_scStrictEdge then true else (dtb_u_u253).f_ScEdge_scStrictEdge) }, ((v_combineWith dtb_u_u251) dtb_u_u254))) else ((v_combineWith dtb_u_u251) dtb_u_u254))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_composeGo = (fun (dtb_u_u255 : t_ScEdge B_dData_dList.t_List) (dtb_u_u256 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u255 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u257, dtb_u_u258) -> ((B_dData_dList.v_append ((v_combineWith dtb_u_u257) dtb_u_u256)) ((v_composeGo dtb_u_u258) dtb_u_u256))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_composeEdges = (fun (dtb_u_u259 : t_ScEdge B_dData_dList.t_List) (dtb_u_u260 : t_ScEdge B_dData_dList.t_List) -> (v_canonEdges ((v_composeGo dtb_u_u259) dtb_u_u260)))

# 432 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasStrict = (fun (dtb_u_u261 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u261 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u262, dtb_u_u263) -> (if (dtb_u_u262).f_ScEdge_scStrictEdge then true else (v_hasStrict dtb_u_u263))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphIdempotent = (fun (dtb_u_u264 : t_ScEdge B_dData_dList.t_List) -> ((v_edgesEq ((v_composeEdges dtb_u_u264) dtb_u_u264)) dtb_u_u264))

# 441 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_graphOK = (fun (dtb_u_u265 : t_ScEdge B_dData_dList.t_List) -> (if (v_graphIdempotent dtb_u_u265) then (v_hasStrict dtb_u_u265) else true))

# 444 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphsOK = (fun (dtb_u_u266 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u266 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u267, dtb_u_u268) -> (if (v_graphOK dtb_u_u267) then (v_graphsOK dtb_u_u268) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableGraphCap = 512

# 454 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableLookup = (fun (dtb_u_u269 : (string, string) B_dData_dPair.t_Pair) (dtb_u_u270 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u270 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u271, dtb_u_u272) -> (match dtb_u_u271 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u273; B_dData_dPair.f_Pair_second = dtb_u_u274 } -> (if ((B_dData_dPair.v_firstOf dtb_u_u269) = (B_dData_dPair.v_firstOf dtb_u_u273)) then (if ((B_dData_dPair.v_secondOf dtb_u_u269) = (B_dData_dPair.v_secondOf dtb_u_u273)) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u274)) else ((v_tableLookup dtb_u_u269) dtb_u_u272)) else ((v_tableLookup dtb_u_u269) dtb_u_u272))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListHas = (fun (dtb_u_u275 : t_ScEdge B_dData_dList.t_List) (dtb_u_u276 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u276 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u277, dtb_u_u278) -> (if ((v_edgesEq dtb_u_u275) dtb_u_u277) then true else ((v_graphListHas dtb_u_u275) dtb_u_u278))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_graphListSubset = (fun (dtb_u_u279 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u280 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u279 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u281, dtb_u_u282) -> (if ((v_graphListHas dtb_u_u281) dtb_u_u280) then ((v_graphListSubset dtb_u_u282) dtb_u_u280) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_tableAddPair = (fun (dtb_u_u283 : string) (dtb_u_u284 : string) (dtb_u_u285 : t_ScEdge B_dData_dList.t_List) (dtb_u_u286 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u286 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u287, dtb_u_u288) -> (match dtb_u_u287 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u289; B_dData_dPair.f_Pair_second = dtb_u_u290 } -> (match dtb_u_u289 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u291; B_dData_dPair.f_Pair_second = dtb_u_u292 } -> (if (dtb_u_u283 = dtb_u_u291) then (if (dtb_u_u284 = dtb_u_u292) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u283; B_dData_dPair.f_Pair_second = dtb_u_u284 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u285, dtb_u_u290)) }, dtb_u_u288)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u291; B_dData_dPair.f_Pair_second = dtb_u_u292 }; B_dData_dPair.f_Pair_second = dtb_u_u290 }, ((((v_tableAddPair dtb_u_u283) dtb_u_u284) dtb_u_u285) dtb_u_u288)))) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u291; B_dData_dPair.f_Pair_second = dtb_u_u292 }; B_dData_dPair.f_Pair_second = dtb_u_u290 }, ((((v_tableAddPair dtb_u_u283) dtb_u_u284) dtb_u_u285) dtb_u_u288))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u283; B_dData_dPair.f_Pair_second = dtb_u_u284 }; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u285, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableAdd = (fun (dtb_u_u293 : string) (dtb_u_u294 : string) (dtb_u_u295 : t_ScEdge B_dData_dList.t_List) (dtb_u_u296 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_tableLookup { B_dData_dPair.f_Pair_first = dtb_u_u293; B_dData_dPair.f_Pair_second = dtb_u_u294 }) dtb_u_u296) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((((v_tableAddPair dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u296); B_dData_dPair.f_Pair_second = true }
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u297) -> (if ((v_graphListHas dtb_u_u295) dtb_u_u297) then { B_dData_dPair.f_Pair_first = dtb_u_u296; B_dData_dPair.f_Pair_second = true } else (if ((B_dData_dList.v_length dtb_u_u297) >= v_tableGraphCap) then { B_dData_dPair.f_Pair_first = dtb_u_u296; B_dData_dPair.f_Pair_second = false } else { B_dData_dPair.f_Pair_first = ((((v_tableAddPair dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u296); B_dData_dPair.f_Pair_second = true }))
  | _ -> failwith "DT: impossible branch"
))

# 493 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepHs = (fun (dtb_u_u298 : string) (dtb_u_u299 : string) (dtb_u_u300 : t_ScEdge B_dData_dList.t_List) (dtb_u_u301 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u302 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u301 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u303, dtb_u_u304) -> (let dtb_u_u305 = ((((v_tableAdd dtb_u_u298) dtb_u_u299) ((v_composeEdges dtb_u_u300) dtb_u_u303)) dtb_u_u302) in (match dtb_u_u305 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u306; B_dData_dPair.f_Pair_second = dtb_u_u307 } -> (if dtb_u_u307 then (((((v_closureStepHs dtb_u_u298) dtb_u_u299) dtb_u_u300) dtb_u_u304) dtb_u_u306) else { B_dData_dPair.f_Pair_first = dtb_u_u306; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u302; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 503 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepOneGo = (fun (dtb_u_u308 : string) (dtb_u_u309 : string) (dtb_u_u310 : t_ScEdge B_dData_dList.t_List) (dtb_u_u311 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u312 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u313 : bool) -> (match dtb_u_u311 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u314, dtb_u_u315) -> (match dtb_u_u314 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u316; B_dData_dPair.f_Pair_second = dtb_u_u317 } -> (match dtb_u_u316 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u318; B_dData_dPair.f_Pair_second = dtb_u_u319 } -> (if (dtb_u_u318 = dtb_u_u309) then (let dtb_u_u320 = (((((v_closureStepHs dtb_u_u308) dtb_u_u319) dtb_u_u310) dtb_u_u317) dtb_u_u312) in (match dtb_u_u320 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u321; B_dData_dPair.f_Pair_second = dtb_u_u322 } -> (if dtb_u_u322 then ((((((v_closureStepOneGo dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u315) dtb_u_u321) dtb_u_u322) else { B_dData_dPair.f_Pair_first = dtb_u_u321; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
)) else ((((((v_closureStepOneGo dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u315) dtb_u_u312) dtb_u_u313))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u312; B_dData_dPair.f_Pair_second = dtb_u_u313 }
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStepOne = (fun (dtb_u_u323 : string) (dtb_u_u324 : string) (dtb_u_u325 : t_ScEdge B_dData_dList.t_List) (dtb_u_u326 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u327 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_closureStepOneGo dtb_u_u323) dtb_u_u324) dtb_u_u325) dtb_u_u326) dtb_u_u327) true))

# 513 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGraphs = (fun (dtb_u_u328 : string) (dtb_u_u329 : string) (dtb_u_u330 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u331 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u332 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u330 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u333, dtb_u_u334) -> (let dtb_u_u335 = (((((v_closureStepOne dtb_u_u328) dtb_u_u329) dtb_u_u333) dtb_u_u331) dtb_u_u332) in (match dtb_u_u335 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u336; B_dData_dPair.f_Pair_second = dtb_u_u337 } -> (if dtb_u_u337 then (((((v_closureStepGraphs dtb_u_u328) dtb_u_u329) dtb_u_u334) dtb_u_u331) dtb_u_u336) else { B_dData_dPair.f_Pair_first = dtb_u_u336; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u332; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureStepGo = (fun (dtb_u_u338 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u339 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u340 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u338 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u341, dtb_u_u342) -> (match dtb_u_u341 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u343; B_dData_dPair.f_Pair_second = dtb_u_u344 } -> (match dtb_u_u343 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u345; B_dData_dPair.f_Pair_second = dtb_u_u346 } -> (let dtb_u_u347 = (((((v_closureStepGraphs dtb_u_u345) dtb_u_u346) dtb_u_u344) dtb_u_u339) dtb_u_u340) in (match dtb_u_u347 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u348; B_dData_dPair.f_Pair_second = dtb_u_u349 } -> (if dtb_u_u349 then (((v_closureStepGo dtb_u_u342) dtb_u_u339) dtb_u_u348) else { B_dData_dPair.f_Pair_first = dtb_u_u348; B_dData_dPair.f_Pair_second = false })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u340; B_dData_dPair.f_Pair_second = true }
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_closureStep = (fun (dtb_u_u350 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_closureStepGo dtb_u_u350) dtb_u_u350) dtb_u_u350))

# 533 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_tableSubset = (fun (dtb_u_u351 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u352 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u351 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u353, dtb_u_u354) -> (match dtb_u_u353 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u355; B_dData_dPair.f_Pair_second = dtb_u_u356 } -> (match ((v_tableLookup dtb_u_u355) dtb_u_u352) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u357) -> (if ((v_graphListSubset dtb_u_u356) dtb_u_u357) then ((v_tableSubset dtb_u_u354) dtb_u_u352) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tableSame = (fun (dtb_u_u358 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u359 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((B_dData_dList.v_length dtb_u_u358) = (B_dData_dList.v_length dtb_u_u359)) then ((v_tableSubset dtb_u_u358) dtb_u_u359) else false))

# 540 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_closureLoop = (fun (dtb_u_u360 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u361 : int) -> (if (dtb_u_u361 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u360; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u361 } } else (let dtb_u_u362 = (v_closureStep dtb_u_u360) in (match dtb_u_u362 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u363; B_dData_dPair.f_Pair_second = dtb_u_u364 } -> (if dtb_u_u364 then (if ((v_tableSame dtb_u_u360) dtb_u_u363) then { B_dData_dPair.f_Pair_first = dtb_u_u363; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u361 } } else ((v_closureLoop dtb_u_u363) (dtb_u_u361 - 1))) else { B_dData_dPair.f_Pair_first = dtb_u_u363; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u361 } })
  | _ -> failwith "DT: impossible branch"
))))

# 558 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_basesUpToGo = (fun (dtb_u_u365 : int) (dtb_u_u366 : int B_dData_dList.t_List) -> (if (dtb_u_u365 <= 0) then (B_dData_dList.C_List__x58__x58_ (0, dtb_u_u366)) else ((v_basesUpToGo (dtb_u_u365 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u365, dtb_u_u366)))))

# 561 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_basesUpTo = (fun (dtb_u_u367 : int) -> (if (dtb_u_u367 < 0) then B_dData_dList.C_List_Nil else ((v_basesUpToGo dtb_u_u367) B_dData_dList.C_List_Nil)))

# 564 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasBase = (fun (dtb_u_u368 : int) (dtb_u_u369 : int B_dData_dList.t_List) -> (match dtb_u_u369 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u370, dtb_u_u371) -> (if (dtb_u_u368 = dtb_u_u370) then true else ((v_hasBase dtb_u_u368) dtb_u_u371))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_dedupBases = (fun (dtb_u_u372 : int B_dData_dList.t_List) -> (match dtb_u_u372 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u373, dtb_u_u374) -> (if ((v_hasBase dtb_u_u373) dtb_u_u374) then (v_dedupBases dtb_u_u374) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u373, (v_dedupBases dtb_u_u374))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_patNamesOf = (fun (dtb_u_u375 : Frontend_dAst.t_Pat) -> (match dtb_u_u375 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u376, dtb_u_u377, dtb_u_u378) -> (v_patNamesOfFields dtb_u_u377)
  | Frontend_dAst.C_Pat_PCon (dtb_u_u379, dtb_u_u380, dtb_u_u381) -> (v_patNamesOfPats dtb_u_u380)
  | Frontend_dAst.C_Pat_PAs (dtb_u_u382, dtb_u_u383, dtb_u_u384) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u382, (v_patNamesOf dtb_u_u383)))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u385, dtb_u_u386) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u385, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 579 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfPats = (fun (dtb_u_u387 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u387 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u388, dtb_u_u389) -> ((B_dData_dList.v_append (v_patNamesOf dtb_u_u388)) (v_patNamesOfPats dtb_u_u389))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 583 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_patNamesOfFields = (fun (dtb_u_u390 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u390 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u391, dtb_u_u392) -> (match dtb_u_u391 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u393; B_dData_dPair.f_Pair_second = dtb_u_u394 } -> ((B_dData_dList.v_append (v_patNamesOf dtb_u_u394)) (v_patNamesOfFields dtb_u_u392))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_inlArgsF = (fun (dtb_u_u395 : int) (dtb_u_u396 : string B_dData_dList.t_List) (dtb_u_u397 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u398 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u398 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u399, dtb_u_u400) -> (B_dData_dList.C_List__x58__x58_ (((((v_inlGoF (dtb_u_u395 - 1)) dtb_u_u396) dtb_u_u397) dtb_u_u399), ((((v_inlArgsF (dtb_u_u395 - 1)) dtb_u_u396) dtb_u_u397) dtb_u_u400)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 233 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlFieldsF = (fun (dtb_u_u401 : int) (dtb_u_u402 : string B_dData_dList.t_List) (dtb_u_u403 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u404 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u404 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u405, dtb_u_u406) -> (match dtb_u_u405 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u407; B_dData_dPair.f_Pair_second = dtb_u_u408 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u407; B_dData_dPair.f_Pair_second = ((((v_inlGoF (dtb_u_u401 - 1)) dtb_u_u402) dtb_u_u403) dtb_u_u408) }, ((((v_inlFieldsF (dtb_u_u401 - 1)) dtb_u_u402) dtb_u_u403) dtb_u_u406)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 238 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlPartsF = (fun (dtb_u_u409 : int) (dtb_u_u410 : string B_dData_dList.t_List) (dtb_u_u411 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u412 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match dtb_u_u412 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u413, dtb_u_u414) -> (match dtb_u_u413 with
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u415) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb_u_u415)), ((((v_inlPartsF (dtb_u_u409 - 1)) dtb_u_u410) dtb_u_u411) dtb_u_u414)))
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u416) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (((((v_inlGoF (dtb_u_u409 - 1)) dtb_u_u410) dtb_u_u411) dtb_u_u416))), ((((v_inlPartsF (dtb_u_u409 - 1)) dtb_u_u410) dtb_u_u411) dtb_u_u414)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 245 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBindsF = (fun (dtb_u_u417 : int) (dtb_u_u418 : string B_dData_dList.t_List) (dtb_u_u419 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u420 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u420 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u421, dtb_u_u422) -> (let dtb_u_u423 = ((((v_inlBindingF (dtb_u_u417 - 1)) dtb_u_u418) dtb_u_u419) dtb_u_u421) in (match (dtb_u_u423).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u424) -> (match ((v_aliasOf dtb_u_u418) { B_dData_dPair.f_Pair_first = (dtb_u_u423).Frontend_dAst.f_Binding_bindPat; B_dData_dPair.f_Pair_second = dtb_u_u424 }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u425) -> (let dtb_u_u426 = ((((v_inlBindsF (dtb_u_u417 - 1)) dtb_u_u418) (B_dData_dList.C_List__x58__x58_ (dtb_u_u425, dtb_u_u419))) dtb_u_u422) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u426); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u426) })
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u427 = ((((v_inlBindsF (dtb_u_u417 - 1)) dtb_u_u418) ((v_dropAliases (v_patNamesOf (dtb_u_u423).Frontend_dAst.f_Binding_bindPat)) dtb_u_u419)) dtb_u_u422) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u423, (B_dData_dPair.v_firstOf dtb_u_u427))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u427) })
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u428) -> (let dtb_u_u429 = ((((v_inlBindsF (dtb_u_u417 - 1)) dtb_u_u418) ((v_dropAliases (v_patNamesOf (dtb_u_u423).Frontend_dAst.f_Binding_bindPat)) dtb_u_u419)) dtb_u_u422) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u423, (B_dData_dPair.v_firstOf dtb_u_u429))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u429) })
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u419 }
  | _ -> failwith "DT: impossible branch"
))
# 266 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlBindingF = (fun (dtb_u_u430 : int) (dtb_u_u431 : string B_dData_dList.t_List) (dtb_u_u432 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u433 : Frontend_dAst.t_Binding) -> (let dtb_u_u434 = (match (dtb_u_u433).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u437) -> (Frontend_dAst.C_BindingValue_BVal (((((v_inlGoF (dtb_u_u430 - 1)) dtb_u_u431) dtb_u_u432) dtb_u_u437)))
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u438) -> (Frontend_dAst.C_BindingValue_BClauses (((((v_inlClausesF (dtb_u_u430 - 1)) dtb_u_u431) dtb_u_u432) dtb_u_u438)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u435 = (match (dtb_u_u433).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u436) -> (B_dData_dMaybe.C_Maybe_Just ({ dtb_u_u436 with Frontend_dAst.f_BindingSig_sigType = ((((v_inlGoF (dtb_u_u430 - 1)) dtb_u_u431) dtb_u_u432) (dtb_u_u436).Frontend_dAst.f_BindingSig_sigType) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in { dtb_u_u433 with Frontend_dAst.f_Binding_bindValue = dtb_u_u434; Frontend_dAst.f_Binding_bindSig = dtb_u_u435 })))
# 279 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlAltsF = (fun (dtb_u_u439 : int) (dtb_u_u440 : string B_dData_dList.t_List) (dtb_u_u441 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u442 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match dtb_u_u442 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u443, dtb_u_u444) -> (B_dData_dList.C_List__x58__x58_ ({ dtb_u_u443 with Frontend_dAst.f_Alt_altBody = ((((v_inlGoF (dtb_u_u439 - 1)) dtb_u_u440) ((v_dropAliases (v_patNamesOf (dtb_u_u443).Frontend_dAst.f_Alt_altPat)) dtb_u_u441)) (dtb_u_u443).Frontend_dAst.f_Alt_altBody) }, ((((v_inlAltsF (dtb_u_u439 - 1)) dtb_u_u440) dtb_u_u441) dtb_u_u444)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 285 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlClausesF = (fun (dtb_u_u445 : int) (dtb_u_u446 : string B_dData_dList.t_List) (dtb_u_u447 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u448 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u448 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u449, dtb_u_u450) -> (B_dData_dList.C_List__x58__x58_ ({ dtb_u_u449 with Frontend_dAst.f_LocalClause_lcBody = ((((v_inlGoF (dtb_u_u445 - 1)) dtb_u_u446) ((v_dropAliases (v_patNamesOfPats (dtb_u_u449).Frontend_dAst.f_LocalClause_lcPats)) dtb_u_u447)) (dtb_u_u449).Frontend_dAst.f_LocalClause_lcBody) }, ((((v_inlClausesF (dtb_u_u445 - 1)) dtb_u_u446) dtb_u_u447) dtb_u_u450)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 291 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlStmtsF = (fun (dtb_u_u451 : int) (dtb_u_u452 : string B_dData_dList.t_List) (dtb_u_u453 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u454 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match dtb_u_u454 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u455, dtb_u_u456) -> (match dtb_u_u455 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u457, dtb_u_u458, dtb_u_u459) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb_u_u457, ((((v_inlGoF (dtb_u_u451 - 1)) dtb_u_u452) dtb_u_u453) dtb_u_u458), dtb_u_u459)), ((((v_inlStmtsF (dtb_u_u451 - 1)) dtb_u_u452) ((v_dropAliases (v_patNamesOf dtb_u_u457)) dtb_u_u453)) dtb_u_u456)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u460, dtb_u_u461) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr (((((v_inlGoF (dtb_u_u451 - 1)) dtb_u_u452) dtb_u_u453) dtb_u_u460), dtb_u_u461)), ((((v_inlStmtsF (dtb_u_u451 - 1)) dtb_u_u452) dtb_u_u453) dtb_u_u456)))
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u462, dtb_u_u463) -> (let dtb_u_u464 = ((((v_inlBindsF (dtb_u_u451 - 1)) dtb_u_u452) dtb_u_u453) dtb_u_u462) in (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet ((B_dData_dPair.v_firstOf dtb_u_u464), dtb_u_u463)), ((((v_inlStmtsF (dtb_u_u451 - 1)) dtb_u_u452) (B_dData_dPair.v_secondOf dtb_u_u464)) dtb_u_u456))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_inlGoF = (fun (dtb_u_u465 : int) (dtb_u_u466 : string B_dData_dList.t_List) (dtb_u_u467 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u468 : Frontend_dAst.t_Expr) -> (if (dtb_u_u465 <= 0) then dtb_u_u468 else (match dtb_u_u468 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u469, dtb_u_u470) -> (match ((v_lookupAlias dtb_u_u469) dtb_u_u467) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u471) -> (Frontend_dAst.C_Expr_EVar (dtb_u_u471, dtb_u_u470))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar (dtb_u_u469, dtb_u_u470))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ELam (dtb_u_u472, dtb_u_u473, dtb_u_u474) -> (Frontend_dAst.C_Expr_ELam (dtb_u_u472, ((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) ((v_dropAliases ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u472)) dtb_u_u467)) dtb_u_u473), dtb_u_u474))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u475, dtb_u_u476, dtb_u_u477) -> (Frontend_dAst.C_Expr_EApp (((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u475), ((((v_inlArgsF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u476), dtb_u_u477))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u478, dtb_u_u479, dtb_u_u480, dtb_u_u481, dtb_u_u482, dtb_u_u483) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u478, dtb_u_u479, dtb_u_u480, ((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u481), ((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) ((v_dropAliases (B_dData_dList.C_List__x58__x58_ (dtb_u_u478, B_dData_dList.C_List_Nil))) dtb_u_u467)) dtb_u_u482), dtb_u_u483))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u484, dtb_u_u485, dtb_u_u486, dtb_u_u487) -> (let dtb_u_u488 = ((((v_inlBindsF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u484) in (Frontend_dAst.C_Expr_ELet ((B_dData_dPair.v_firstOf dtb_u_u488), ((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) (B_dData_dPair.v_secondOf dtb_u_u488)) dtb_u_u485), dtb_u_u486, dtb_u_u487)))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u489, dtb_u_u490, dtb_u_u491) -> (Frontend_dAst.C_Expr_ECase (((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u489), ((((v_inlAltsF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u490), dtb_u_u491))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u492, dtb_u_u493, dtb_u_u494, dtb_u_u495) -> (Frontend_dAst.C_Expr_EIf (((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u492), ((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u493), ((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u494), dtb_u_u495))
  | Frontend_dAst.C_Expr_EField (dtb_u_u496, dtb_u_u497, dtb_u_u498) -> (Frontend_dAst.C_Expr_EField (((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u496), dtb_u_u497, dtb_u_u498))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u499, dtb_u_u500, dtb_u_u501) -> (Frontend_dAst.C_Expr_ERecord (dtb_u_u499, ((((v_inlFieldsF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u500), dtb_u_u501))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u502, dtb_u_u503, dtb_u_u504) -> (Frontend_dAst.C_Expr_ERecUpdate (((((v_inlGoF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u502), ((((v_inlFieldsF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u503), dtb_u_u504))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u505, dtb_u_u506) -> (Frontend_dAst.C_Expr_EDo (((((v_inlStmtsF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u505), dtb_u_u506))
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u507, dtb_u_u508) -> (Frontend_dAst.C_Expr_EInterp (((((v_inlPartsF (dtb_u_u465 - 1)) dtb_u_u466) dtb_u_u467) dtb_u_u507), dtb_u_u508))
  | _ -> dtb_u_u468
)))

# 330 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_inlineAliases = (fun (dtb_u_u509 : string B_dData_dList.t_List) (dtb_u_u510 : Frontend_dAst.t_Expr) -> ((((v_inlGoF ((Frontend_dAstQuery.v_exprBudget 32) dtb_u_u510)) dtb_u_u509) B_dData_dList.C_List_Nil) dtb_u_u510))

# 333 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectClauses = (fun (dtb_u_u511 : string B_dData_dList.t_List) (dtb_u_u512 : string B_dData_dList.t_List) (dtb_u_u513 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u514 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u515 : string) (dtb_u_u516 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u517 : t_Site B_dData_dList.t_List) -> (match dtb_u_u516 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u518, dtb_u_u519) -> (let dtb_u_u520 = ((v_inlineAliases dtb_u_u511) (B_dData_dPair.v_secondOf dtb_u_u518)) in (((((((v_siteCollectClauses dtb_u_u511) dtb_u_u512) dtb_u_u513) dtb_u_u514) dtb_u_u515) dtb_u_u519) ((((((((((v_siteWalkC ((Frontend_dAstQuery.v_exprBudget 32) dtb_u_u520)) dtb_u_u511) dtb_u_u512) dtb_u_u513) dtb_u_u515) dtb_u_u514) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf dtb_u_u518))) B_dData_dList.C_List_Nil) dtb_u_u520) dtb_u_u517)))
  | B_dData_dList.C_List_Nil -> dtb_u_u517
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteCollectGo = (fun (dtb_u_u521 : string B_dData_dList.t_List) (dtb_u_u522 : string B_dData_dList.t_List) (dtb_u_u523 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u524 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u525 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u526 : string B_dData_dList.t_List) (dtb_u_u527 : t_Site B_dData_dList.t_List) -> (match dtb_u_u526 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u528, dtb_u_u529) -> (((((((v_siteCollectGo dtb_u_u521) dtb_u_u522) dtb_u_u523) dtb_u_u524) dtb_u_u525) dtb_u_u529) (((((((v_siteCollectClauses dtb_u_u521) dtb_u_u522) dtb_u_u523) dtb_u_u525) dtb_u_u528) ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb_u_u528) dtb_u_u524)) dtb_u_u527))
  | B_dData_dList.C_List_Nil -> dtb_u_u527
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCollect = (fun (dtb_u_u530 : string B_dData_dList.t_List) (dtb_u_u531 : string B_dData_dList.t_List) (dtb_u_u532 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u533 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u534 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_siteCollectGo dtb_u_u530) dtb_u_u531) dtb_u_u532) dtb_u_u533) dtb_u_u534) dtb_u_u530) B_dData_dList.C_List_Nil))

# 587 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_patNamesOfBinds = (fun (dtb_u_u535 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u535 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u536, dtb_u_u537) -> ((B_dData_dList.v_append (v_patNamesOf (dtb_u_u536).Frontend_dAst.f_Binding_bindPat)) (v_patNamesOfBinds dtb_u_u537))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_argBasesGoF = (fun (dtb_u_u538 : int) (dtb_u_u539 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u540 : string B_dData_dList.t_List) (dtb_u_u541 : Frontend_dAst.t_Expr) -> (if (dtb_u_u538 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u541 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u542, dtb_u_u543) -> (let dtb_u_u544 = ((Elab_dTermination_dMeasure.v_sizeOfVarStrict dtb_u_u542) dtb_u_u539) in (match dtb_u_u544 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName dtb_u_u542) dtb_u_u540) then (v_basesUpTo (v_maxBaseOf dtb_u_u539)) else B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u545) -> (match dtb_u_u545 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u546; B_dData_dPair.f_Pair_second = dtb_u_u547 } -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u546, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u548, dtb_u_u549, dtb_u_u550) -> ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u548)) dtb_u_u540)) dtb_u_u549)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u551, dtb_u_u552, dtb_u_u553) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u551)) ((((v_argBasesArgsF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u552))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u554, dtb_u_u555, dtb_u_u556, dtb_u_u557, dtb_u_u558, dtb_u_u559) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u557)) ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u558))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u560, dtb_u_u561, dtb_u_u562, dtb_u_u563) -> ((B_dData_dList.v_append ((((v_argBasesBindsF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u560)) ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) ((B_dData_dList.v_append (v_patNamesOfBinds dtb_u_u560)) dtb_u_u540)) dtb_u_u561))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u564, dtb_u_u565, dtb_u_u566) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u564)) ((((v_argBasesAltsF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u565))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u567, dtb_u_u568, dtb_u_u569, dtb_u_u570) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u567)) ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u568)) ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u569)))
  | Frontend_dAst.C_Expr_EField (dtb_u_u571, dtb_u_u572, dtb_u_u573) -> ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u571)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u574, dtb_u_u575, dtb_u_u576) -> ((((v_argBasesFieldsF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u575)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u577, dtb_u_u578, dtb_u_u579) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u577)) ((((v_argBasesFieldsF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u578))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u580, dtb_u_u581) -> ((((v_argBasesStmtsF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u580)
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u582, dtb_u_u583) -> ((((v_argBasesPartsF (dtb_u_u538 - 1)) dtb_u_u539) dtb_u_u540) dtb_u_u582)
  | _ -> B_dData_dList.C_List_Nil
)))
# 617 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesArgsF = (fun (dtb_u_u584 : int) (dtb_u_u585 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u586 : string B_dData_dList.t_List) (dtb_u_u587 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u587 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u588, dtb_u_u589) -> (if (dtb_u_u584 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u586) dtb_u_u588)) ((((v_argBasesArgsF (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u586) dtb_u_u589)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 625 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesFieldsF = (fun (dtb_u_u590 : int) (dtb_u_u591 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u592 : string B_dData_dList.t_List) (dtb_u_u593 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u593 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u594, dtb_u_u595) -> (match dtb_u_u594 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u596; B_dData_dPair.f_Pair_second = dtb_u_u597 } -> (if (dtb_u_u590 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u590 - 1)) dtb_u_u591) dtb_u_u592) dtb_u_u597)) ((((v_argBasesFieldsF (dtb_u_u590 - 1)) dtb_u_u591) dtb_u_u592) dtb_u_u595)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 633 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBindsF = (fun (dtb_u_u598 : int) (dtb_u_u599 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u600 : string B_dData_dList.t_List) (dtb_u_u601 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u601 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u602, dtb_u_u603) -> (if (dtb_u_u598 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesBindingF (dtb_u_u598 - 1)) dtb_u_u599) dtb_u_u600) dtb_u_u602)) ((((v_argBasesBindsF (dtb_u_u598 - 1)) dtb_u_u599) dtb_u_u600) dtb_u_u603)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 643 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesBindingF = (fun (dtb_u_u604 : int) (dtb_u_u605 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u606 : string B_dData_dList.t_List) (dtb_u_u607 : Frontend_dAst.t_Binding) -> (if (dtb_u_u604 <= 0) then B_dData_dList.C_List_Nil else (let dtb_u_u608 = (match (dtb_u_u607).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u610) -> ((((v_argBasesGoF (dtb_u_u604 - 1)) dtb_u_u605) dtb_u_u606) dtb_u_u610)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u611) -> ((((v_argBasesClausesF (dtb_u_u604 - 1)) dtb_u_u605) dtb_u_u606) dtb_u_u611)
  | _ -> failwith "DT: impossible branch"
) in (match (dtb_u_u607).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u609) -> ((B_dData_dList.v_append dtb_u_u608) ((((v_argBasesGoF (dtb_u_u604 - 1)) dtb_u_u605) dtb_u_u606) (dtb_u_u609).Frontend_dAst.f_BindingSig_sigType))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u608
  | _ -> failwith "DT: impossible branch"
))))
# 657 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesAltsF = (fun (dtb_u_u612 : int) (dtb_u_u613 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u614 : string B_dData_dList.t_List) (dtb_u_u615 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match dtb_u_u615 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u616, dtb_u_u617) -> (if (dtb_u_u612 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u612 - 1)) dtb_u_u613) ((B_dData_dList.v_append (v_patNamesOf (dtb_u_u616).Frontend_dAst.f_Alt_altPat)) dtb_u_u614)) (dtb_u_u616).Frontend_dAst.f_Alt_altBody)) ((((v_argBasesAltsF (dtb_u_u612 - 1)) dtb_u_u613) dtb_u_u614) dtb_u_u617)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 667 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesClausesF = (fun (dtb_u_u618 : int) (dtb_u_u619 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u620 : string B_dData_dList.t_List) (dtb_u_u621 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u621 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u622, dtb_u_u623) -> (if (dtb_u_u618 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u618 - 1)) dtb_u_u619) ((B_dData_dList.v_append (v_patNamesOfPats (dtb_u_u622).Frontend_dAst.f_LocalClause_lcPats)) dtb_u_u620)) (dtb_u_u622).Frontend_dAst.f_LocalClause_lcBody)) ((((v_argBasesClausesF (dtb_u_u618 - 1)) dtb_u_u619) dtb_u_u620) dtb_u_u623)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 677 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesStmtsF = (fun (dtb_u_u624 : int) (dtb_u_u625 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u626 : string B_dData_dList.t_List) (dtb_u_u627 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match dtb_u_u627 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u628, dtb_u_u629) -> (if (dtb_u_u624 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u628 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u630, dtb_u_u631, dtb_u_u632) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u624 - 1)) dtb_u_u625) dtb_u_u626) dtb_u_u631)) ((((v_argBasesStmtsF (dtb_u_u624 - 1)) dtb_u_u625) ((B_dData_dList.v_append (v_patNamesOf dtb_u_u630)) dtb_u_u626)) dtb_u_u629))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u633, dtb_u_u634) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u624 - 1)) dtb_u_u625) dtb_u_u626) dtb_u_u633)) ((((v_argBasesStmtsF (dtb_u_u624 - 1)) dtb_u_u625) dtb_u_u626) dtb_u_u629))
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u635, dtb_u_u636) -> ((B_dData_dList.v_append ((((v_argBasesBindsF (dtb_u_u624 - 1)) dtb_u_u625) dtb_u_u626) dtb_u_u635)) ((((v_argBasesStmtsF (dtb_u_u624 - 1)) dtb_u_u625) ((B_dData_dList.v_append (v_patNamesOfBinds dtb_u_u635)) dtb_u_u626)) dtb_u_u629))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 688 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_argBasesPartsF = (fun (dtb_u_u637 : int) (dtb_u_u638 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u639 : string B_dData_dList.t_List) (dtb_u_u640 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match dtb_u_u640 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u641, dtb_u_u642) -> (if (dtb_u_u637 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u641 with
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u643) -> ((((v_argBasesPartsF (dtb_u_u637 - 1)) dtb_u_u638) dtb_u_u639) dtb_u_u642)
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u644) -> ((B_dData_dList.v_append ((((v_argBasesGoF (dtb_u_u637 - 1)) dtb_u_u638) dtb_u_u639) dtb_u_u644)) ((((v_argBasesPartsF (dtb_u_u637 - 1)) dtb_u_u638) dtb_u_u639) dtb_u_u642))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBasesGo = (fun (dtb_u_u645 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u646 : string B_dData_dList.t_List) (dtb_u_u647 : Frontend_dAst.t_Expr) -> ((((v_argBasesGoF ((Frontend_dAstQuery.v_exprBudget 32) dtb_u_u647)) dtb_u_u645) dtb_u_u646) dtb_u_u647))

# 555 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_argBases = (fun (dtb_u_u648 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u649 : Frontend_dAst.t_Expr) -> (v_dedupBases (((v_argBasesGo dtb_u_u648) B_dData_dList.C_List_Nil) dtb_u_u649)))

# 699 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_blindEdgesJ = (fun (dtb_u_u650 : int) (dtb_u_u651 : int) -> (if (dtb_u_u650 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = dtb_u_u651; f_ScEdge_edgeTo = (dtb_u_u650 - 1); f_ScEdge_scStrictEdge = false }, ((v_blindEdgesJ (dtb_u_u650 - 1)) dtb_u_u651)))))

# 703 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_blindEdgesI = (fun (dtb_u_u652 : int) (dtb_u_u653 : int) -> (if (dtb_u_u652 <= 0) then (if (dtb_u_u652 = 0) then ((v_blindEdgesJ dtb_u_u653) 0) else B_dData_dList.C_List_Nil) else ((B_dData_dList.v_append ((v_blindEdgesJ dtb_u_u653) dtb_u_u652)) ((v_blindEdgesI (dtb_u_u652 - 1)) dtb_u_u653))))

# 710 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindEdges = (fun (dtb_u_u654 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u655 : t_Site) -> ((v_blindEdgesI ((Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (dtb_u_u655).f_Site_siteCaller) dtb_u_u654)) - 1)) (Elab_dTermination_dMeasure.v_defArity ((Elab_dTermination_dMeasure.v_clausesOfDefTbl (dtb_u_u655).f_Site_siteCallee) dtb_u_u654))))

# 716 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgeAt = (fun (dtb_u_u656 : int) (dtb_u_u657 : int) (dtb_u_u658 : int B_dData_dList.t_List) (dtb_u_u659 : t_Site) (dtb_u_u660 : string B_dData_dList.t_List) (dtb_u_u661 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u662 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (dtb_u_u659).f_Site_siteArgs) dtb_u_u657) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u663) -> (match ((((((((Elab_dTermination_dMeasure.v_relOfArg dtb_u_u656) dtb_u_u663) (dtb_u_u659).f_Site_siteSizes) dtb_u_u660) dtb_u_u661) (dtb_u_u659).f_Site_siteCaller) dtb_u_u662) (dtb_u_u659).f_Site_siteRegion) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u664) -> (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = dtb_u_u656; f_ScEdge_edgeTo = dtb_u_u657; f_ScEdge_scStrictEdge = (v_scIsStrict dtb_u_u664) }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_hasBase dtb_u_u656) dtb_u_u658) then (B_dData_dList.C_List__x58__x58_ ({ f_ScEdge_edgeFrom = dtb_u_u656; f_ScEdge_edgeTo = dtb_u_u657; f_ScEdge_scStrictEdge = false }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_nthDeps = (fun (dtb_u_u665 : int B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u666 : int) -> (match dtb_u_u665 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u667, dtb_u_u668) -> (if (dtb_u_u666 <= 0) then dtb_u_u667 else ((v_nthDeps dtb_u_u668) (dtb_u_u666 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesJ = (fun (dtb_u_u669 : int) (dtb_u_u670 : int) (dtb_u_u671 : int B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u672 : t_Site) (dtb_u_u673 : string B_dData_dList.t_List) (dtb_u_u674 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u675 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (dtb_u_u670 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((((((v_siteEdgeAt dtb_u_u669) (dtb_u_u670 - 1)) ((v_nthDeps dtb_u_u671) (dtb_u_u670 - 1))) dtb_u_u672) dtb_u_u673) dtb_u_u674) dtb_u_u675)) (((((((v_siteEdgesJ dtb_u_u669) (dtb_u_u670 - 1)) dtb_u_u671) dtb_u_u672) dtb_u_u673) dtb_u_u674) dtb_u_u675))))

# 739 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_siteEdgesI = (fun (dtb_u_u676 : int) (dtb_u_u677 : int B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u678 : t_Site) (dtb_u_u679 : string B_dData_dList.t_List) (dtb_u_u680 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u681 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (if (dtb_u_u676 <= 0) then (((((((v_siteEdgesJ 0) (B_dData_dList.v_length (dtb_u_u678).f_Site_siteArgs)) dtb_u_u677) dtb_u_u678) dtb_u_u679) dtb_u_u680) dtb_u_u681) else ((B_dData_dList.v_append (((((((v_siteEdgesJ dtb_u_u676) (B_dData_dList.v_length (dtb_u_u678).f_Site_siteArgs)) dtb_u_u677) dtb_u_u678) dtb_u_u679) dtb_u_u680) dtb_u_u681)) ((((((v_siteEdgesI (dtb_u_u676 - 1)) dtb_u_u677) dtb_u_u678) dtb_u_u679) dtb_u_u680) dtb_u_u681))))

# 748 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteEdgesOf = (fun (dtb_u_u682 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u683 : string B_dData_dList.t_List) (dtb_u_u684 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u685 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u686 : t_Site) -> (if (dtb_u_u686).f_Site_siteBlind then ((v_blindEdges dtb_u_u682) dtb_u_u686) else ((((((v_siteEdgesI (v_maxBaseOf (dtb_u_u686).f_Site_siteSizes)) ((B_dData_dList.v_map (v_argBases (dtb_u_u686).f_Site_siteSizes)) (dtb_u_u686).f_Site_siteArgs)) dtb_u_u686) dtb_u_u683) dtb_u_u684) dtb_u_u685)))

# 758 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_initialTableGo = (fun (dtb_u_u687 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u688 : t_Site B_dData_dList.t_List) (dtb_u_u689 : string B_dData_dList.t_List) (dtb_u_u690 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u691 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u692 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u693 : bool) -> (match dtb_u_u688 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u694, dtb_u_u695) -> (if dtb_u_u693 then (match ((((v_tableAdd (dtb_u_u694).f_Site_siteCaller) (dtb_u_u694).f_Site_siteCallee) (((((v_siteEdgesOf dtb_u_u687) dtb_u_u689) dtb_u_u690) dtb_u_u691) dtb_u_u694)) dtb_u_u692) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u696; B_dData_dPair.f_Pair_second = dtb_u_u697 } -> (((((((v_initialTableGo dtb_u_u687) dtb_u_u695) dtb_u_u689) dtb_u_u690) dtb_u_u691) dtb_u_u696) dtb_u_u697)
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = dtb_u_u692; B_dData_dPair.f_Pair_second = false })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u692; B_dData_dPair.f_Pair_second = dtb_u_u693 }
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_initialTable = (fun (dtb_u_u698 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u699 : t_Site B_dData_dList.t_List) (dtb_u_u700 : string B_dData_dList.t_List) (dtb_u_u701 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u702 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (((((((v_initialTableGo dtb_u_u698) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702) B_dData_dList.C_List_Nil) true))

# 771 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctClosureFuel = 240

# 775 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctCheckTable = (fun (dtb_u_u703 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u703 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u704, dtb_u_u705) -> (match dtb_u_u704 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u706; B_dData_dPair.f_Pair_second = dtb_u_u707 } -> (match dtb_u_u706 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u708; B_dData_dPair.f_Pair_second = dtb_u_u709 } -> (if (dtb_u_u708 = dtb_u_u709) then (if (v_graphsOK dtb_u_u707) then (v_sctCheckTable dtb_u_u705) else false) else (v_sctCheckTable dtb_u_u705))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 780 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_sctBadGraphs = (fun (dtb_u_u710 : string) (dtb_u_u711 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u711 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u712, dtb_u_u713) -> (if (v_graphOK dtb_u_u712) then ((v_sctBadGraphs dtb_u_u710) dtb_u_u713) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u710, ((v_sctBadGraphs dtb_u_u710) dtb_u_u713))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadPairs = (fun (dtb_u_u714 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u714 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u715, dtb_u_u716) -> (match dtb_u_u715 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u717; B_dData_dPair.f_Pair_second = dtb_u_u718 } -> (match dtb_u_u717 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u719; B_dData_dPair.f_Pair_second = dtb_u_u720 } -> (if (dtb_u_u719 = dtb_u_u720) then ((B_dData_dList.v_append ((v_sctBadGraphs dtb_u_u719) dtb_u_u718)) (v_sctBadPairs dtb_u_u716)) else (v_sctBadPairs dtb_u_u716))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 792 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_strictEdgeText = (fun (dtb_u_u721 : t_ScEdge) -> (String.concat "" [(string_of_int (dtb_u_u721).f_ScEdge_edgeFrom); "->>"; (string_of_int (dtb_u_u721).f_ScEdge_edgeTo)]))

# 795 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_weakEdgeText = (fun (dtb_u_u722 : t_ScEdge) -> (String.concat "" [(string_of_int (dtb_u_u722).f_ScEdge_edgeFrom); "->"; (string_of_int (dtb_u_u722).f_ScEdge_edgeTo)]))

# 789 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeText = (fun (dtb_u_u723 : t_ScEdge) -> (if (dtb_u_u723).f_ScEdge_scStrictEdge then (v_strictEdgeText dtb_u_u723) else (v_weakEdgeText dtb_u_u723)))

# 798 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_edgesText = (fun (dtb_u_u724 : t_ScEdge B_dData_dList.t_List) -> (match dtb_u_u724 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u725, dtb_u_u726) -> (match dtb_u_u726 with
  | B_dData_dList.C_List_Nil -> (v_edgeText dtb_u_u725)
  | _ -> (String.concat "" [(v_edgeText dtb_u_u725); ","; (v_edgesText dtb_u_u726)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 803 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_badGraphText = (fun (dtb_u_u727 : string) (dtb_u_u728 : t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u728 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u729, dtb_u_u730) -> (if (v_graphOK dtb_u_u729) then ((v_badGraphText dtb_u_u727) dtb_u_u730) else (B_dData_dList.C_List__x58__x58_ ((String.concat "" [dtb_u_u727; "{"; (v_edgesText dtb_u_u729); "}"]), ((v_badGraphText dtb_u_u727) dtb_u_u730))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 808 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_sctBadText = (fun (dtb_u_u731 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u731 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u732, dtb_u_u733) -> (match dtb_u_u732 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u734; B_dData_dPair.f_Pair_second = dtb_u_u735 } -> (match dtb_u_u734 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u736; B_dData_dPair.f_Pair_second = dtb_u_u737 } -> (if (dtb_u_u736 = dtb_u_u737) then ((B_dData_dList.v_append ((v_badGraphText dtb_u_u736) dtb_u_u735)) (v_sctBadText dtb_u_u733)) else (v_sctBadText dtb_u_u733))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 813 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctDiag = (fun (dtb_u_u738 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_joinComma (Elab_dTermination_dMeasure.v_dedup (v_sctBadText dtb_u_u738))))

# 818 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_isBlindSite = (fun (dtb_u_u739 : t_Site) -> (dtb_u_u739).f_Site_siteBlind)

# 821 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_blindPairText = (fun (dtb_u_u740 : t_Site) -> (String.concat "" [(dtb_u_u740).f_Site_siteCaller; "->"; (dtb_u_u740).f_Site_siteCallee]))

# 824 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctBlindNote = (fun (dtb_u_u741 : t_Site B_dData_dList.t_List) -> (match (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_map v_blindPairText) ((B_dData_dList.v_filter v_isBlindSite) dtb_u_u741))) with
  | B_dData_dList.C_List_Nil -> ""
  | dtb_u_u742 -> (String.concat "" [" [SCT \230\156\170\232\175\134\229\136\171\232\176\131\231\148\168\239\188\154"; (Elab_dTermination_dMeasure.v_joinComma dtb_u_u742); "\239\188\136callee \228\187\165\229\128\188\228\188\160\233\128\146\230\136\150\233\129\141\229\142\134\233\162\132\231\174\151\232\128\151\229\176\189\239\188\140\229\143\170\230\140\137\229\188\177\232\190\185\232\174\161\229\133\165\239\188\137]"])
))

# 833 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_budgetDiagnostic = (fun (dtb_u_u743 : string B_dData_dList.t_List) (dtb_u_u744 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u745 = ((B_dData_dString.v_join ",") dtb_u_u743) in (let dtb_u_u746 = (String.concat "" ["size-change \229\155\190\233\151\173\229\140\133\230\156\170\230\148\182\230\149\155\239\188\136\230\175\143\229\175\185\229\135\189\230\149\176\228\184\138\233\153\144 "; (string_of_int v_tableGraphCap); " \229\188\160\229\155\190\239\188\140"; (string_of_int v_sctClosureFuel); " \232\189\174\239\188\137"]) in (let dtb_u_u747 = ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_TerminationBudgetExhausted (dtb_u_u745))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u745, B_dData_dVec.C_Vec_Nil))) in (let dtb_u_u748 = { dtb_u_u747 with Base_dDiag.f_Diagnostic_diagLabels = (dtb_u_u744).Base_dDiag.f_Diagnostic_diagLabels; Base_dDiag.f_Diagnostic_diagFields = (dtb_u_u744).Base_dDiag.f_Diagnostic_diagFields } in ((Base_dDiag.v_appendMessage (String.concat "" [" ["; dtb_u_u746; "]"])) dtb_u_u748))))))

# 848 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_countGraphs = (fun (dtb_u_u749 : ((string, string) B_dData_dPair.t_Pair, t_ScEdge B_dData_dList.t_List B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u749 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u750, dtb_u_u751) -> (match dtb_u_u750 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u752; B_dData_dPair.f_Pair_second = dtb_u_u753 } -> ((B_dData_dList.v_length dtb_u_u753) + (v_countGraphs dtb_u_u751))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 852 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheckGo = (fun (dtb_u_u754 : string B_dData_dList.t_List) (dtb_u_u755 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u756 : string B_dData_dList.t_List) (dtb_u_u757 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u758 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u759 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u760 = (((((v_siteCollect dtb_u_u754) dtb_u_u756) dtb_u_u757) dtb_u_u755) dtb_u_u758) in (let dtb_u_u761 = (v_sctBlindNote dtb_u_u760) in (let dtb_u_u762 = ((Base_dObs.v_obsCounter "vuna.counter.term.scc_size") (B_dData_dList.v_length dtb_u_u754)) in (let dtb_u_u763 = ((Base_dObs.v_obsCounter "vuna.counter.term.sites") (B_dData_dList.v_length dtb_u_u760)) in (match (((((v_initialTable dtb_u_u755) dtb_u_u760) dtb_u_u756) dtb_u_u757) dtb_u_u758) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u764; B_dData_dPair.f_Pair_second = dtb_u_u765 } -> (if dtb_u_u765 then (let dtb_u_u766 = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs") (v_countGraphs dtb_u_u764)) in (let dtb_u_u767 = ((v_closureLoop dtb_u_u764) v_sctClosureFuel) in (match dtb_u_u767 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u768; B_dData_dPair.f_Pair_second = dtb_u_u769 } -> (match dtb_u_u769 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u770; B_dData_dPair.f_Pair_second = dtb_u_u771 } -> (let dtb_u_u772 = ((Base_dObs.v_obsCounter "vuna.counter.term.closure_rounds") (v_sctClosureFuel - dtb_u_u771)) in (let dtb_u_u773 = ((Base_dObs.v_obsCounter "vuna.counter.term.graphs_final") (v_countGraphs dtb_u_u768)) in (if dtb_u_u770 then (if (v_sctCheckTable dtb_u_u768) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage dtb_u_u761) ((Base_dDiag.v_appendMessage (String.concat "" [" [SCT \230\151\160\228\184\139\233\153\141\231\142\175\239\188\154"; (v_sctDiag dtb_u_u768); "]"])) dtb_u_u759))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage dtb_u_u761) ((v_budgetDiagnostic dtb_u_u754) dtb_u_u759)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_appendMessage dtb_u_u761) ((v_budgetDiagnostic dtb_u_u754) dtb_u_u759)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 843 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_sctCheck = (fun (dtb_u_u774 : string B_dData_dList.t_List) (dtb_u_u775 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u776 : string B_dData_dList.t_List) (dtb_u_u777 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u778 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u779 : Base_dDiag.t_Diagnostic) -> ((Base_dObs.v_obsCheck "vuna.term.sct") (fun (dtb_u_u780 : int) -> ((((((v_sctCheckGo dtb_u_u774) dtb_u_u775) dtb_u_u776) dtb_u_u777) dtb_u_u778) dtb_u_u779))))

# 880 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_paramNamesOf = (fun (dtb_u_u781 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u781 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u782, dtb_u_u783) -> (match dtb_u_u782 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u784, dtb_u_u785) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u784, (v_paramNamesOf dtb_u_u783)))
  | _ -> (v_paramNamesOf dtb_u_u783)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 887 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_paramIndexGo = (fun (dtb_u_u786 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u787 : string) (dtb_u_u788 : int) -> (match dtb_u_u786 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u789, dtb_u_u790) -> (match dtb_u_u789 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u791, dtb_u_u792) -> (if (dtb_u_u791 = dtb_u_u787) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u788)) else (((v_paramIndexGo dtb_u_u790) dtb_u_u787) (dtb_u_u788 + 1)))
  | _ -> (((v_paramIndexGo dtb_u_u790) dtb_u_u787) (dtb_u_u788 + 1))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_hasFuelGuardF = (fun (dtb_u_u793 : int) (dtb_u_u794 : string) (dtb_u_u795 : Frontend_dAst.t_Expr) -> (if (dtb_u_u793 <= 0) then false else (match dtb_u_u795 with
  | Frontend_dAst.C_Expr_EIf (dtb_u_u796, dtb_u_u797, dtb_u_u798, dtb_u_u799) -> (match (Elab_dTermination_dMeasure.v_guardPosVar dtb_u_u796) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u800) -> (dtb_u_u800 = dtb_u_u794)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_hasFuelGuardF (dtb_u_u793 - 1)) dtb_u_u794) dtb_u_u797) then true else (((v_hasFuelGuardF (dtb_u_u793 - 1)) dtb_u_u794) dtb_u_u798))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ECase (dtb_u_u801, dtb_u_u802, dtb_u_u803) -> (((v_anyAltFuelGuardF (dtb_u_u793 - 1)) dtb_u_u794) dtb_u_u802)
  | Frontend_dAst.C_Expr_ELet (dtb_u_u804, dtb_u_u805, dtb_u_u806, dtb_u_u807) -> (if (((v_hasFuelGuardF (dtb_u_u793 - 1)) dtb_u_u794) dtb_u_u805) then true else (((v_anyBindFuelGuardF (dtb_u_u793 - 1)) dtb_u_u794) dtb_u_u804))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u808, dtb_u_u809, dtb_u_u810) -> (((v_hasFuelGuardF (dtb_u_u793 - 1)) dtb_u_u794) dtb_u_u809)
  | _ -> false
)))
# 916 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyAltFuelGuardF = (fun (dtb_u_u811 : int) (dtb_u_u812 : string) (dtb_u_u813 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match dtb_u_u813 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u814, dtb_u_u815) -> (if (dtb_u_u811 <= 0) then false else (if (((v_hasFuelGuardF (dtb_u_u811 - 1)) dtb_u_u812) (dtb_u_u814).Frontend_dAst.f_Alt_altBody) then true else (((v_anyAltFuelGuardF (dtb_u_u811 - 1)) dtb_u_u812) dtb_u_u815)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 924 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyBindFuelGuardF = (fun (dtb_u_u816 : int) (dtb_u_u817 : string) (dtb_u_u818 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u818 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u819, dtb_u_u820) -> (if (dtb_u_u816 <= 0) then false else (if (((v_bindingHasFuelGuardF (dtb_u_u816 - 1)) dtb_u_u817) dtb_u_u819) then true else (((v_anyBindFuelGuardF (dtb_u_u816 - 1)) dtb_u_u817) dtb_u_u820)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 932 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_bindingHasFuelGuardF = (fun (dtb_u_u821 : int) (dtb_u_u822 : string) (dtb_u_u823 : Frontend_dAst.t_Binding) -> (if (dtb_u_u821 <= 0) then false else (let dtb_u_u824 = (match (dtb_u_u823).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u826) -> (((v_hasFuelGuardF (dtb_u_u821 - 1)) dtb_u_u822) dtb_u_u826)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u827) -> (((v_anyClauseFuelGuardF (dtb_u_u821 - 1)) dtb_u_u822) dtb_u_u827)
  | _ -> failwith "DT: impossible branch"
) in (if dtb_u_u824 then true else (match (dtb_u_u823).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u825) -> (((v_hasFuelGuardF (dtb_u_u821 - 1)) dtb_u_u822) (dtb_u_u825).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))
# 949 "Vuna/Compiler/Elab/Termination/Scc.vuna"
and v_anyClauseFuelGuardF = (fun (dtb_u_u828 : int) (dtb_u_u829 : string) (dtb_u_u830 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u830 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u831, dtb_u_u832) -> (if (dtb_u_u828 <= 0) then false else (if (((v_hasFuelGuardF (dtb_u_u828 - 1)) dtb_u_u829) (dtb_u_u831).Frontend_dAst.f_LocalClause_lcBody) then true else (((v_anyClauseFuelGuardF (dtb_u_u828 - 1)) dtb_u_u829) dtb_u_u832)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_hasFuelGuard = (fun (dtb_u_u833 : string) (dtb_u_u834 : Frontend_dAst.t_Expr) -> (((v_hasFuelGuardF ((Frontend_dAstQuery.v_exprBudget 32) dtb_u_u834)) dtb_u_u833) dtb_u_u834))

# 957 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let rec v_guardParamGo = (fun (dtb_u_u835 : string B_dData_dList.t_List) (dtb_u_u836 : Frontend_dAst.t_Expr) -> (match dtb_u_u835 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u837, dtb_u_u838) -> (if ((v_hasFuelGuard dtb_u_u837) dtb_u_u836) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u837)) else ((v_guardParamGo dtb_u_u838) dtb_u_u836))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamNameOf = (fun (dtb_u_u839 : string) (dtb_u_u840 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb_u_u839) dtb_u_u840) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u841, dtb_u_u842) -> ((v_guardParamGo (v_paramNamesOf (B_dData_dPair.v_firstOf dtb_u_u841))) (B_dData_dPair.v_secondOf dtb_u_u841))
  | _ -> failwith "DT: impossible branch"
))

# 970 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelParamIndexOf = (fun (dtb_u_u843 : string) (dtb_u_u844 : string) (dtb_u_u845 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb_u_u843) dtb_u_u845) with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u846, dtb_u_u847) -> (let dtb_u_u848 = (B_dData_dPair.v_firstOf dtb_u_u846) in (match ((v_fuelParamNameOf dtb_u_u843) dtb_u_u845) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u849) -> (((v_paramIndexGo dtb_u_u848) dtb_u_u849) 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_paramIndexGo dtb_u_u848) dtb_u_u844) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u850) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u850))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 984 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_callerFuelName = (fun (dtb_u_u851 : string) (dtb_u_u852 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf dtb_u_u851) dtb_u_u852) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u853) -> dtb_u_u853
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb_u_u851) dtb_u_u852) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u854, dtb_u_u855) -> (match (v_paramNamesOf (B_dData_dPair.v_firstOf dtb_u_u854)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u856, dtb_u_u857) -> dtb_u_u856
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_paramsOf = (fun (dtb_u_u858 : string) (dtb_u_u859 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb_u_u858) dtb_u_u859) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u860, dtb_u_u861) -> (v_paramNamesOf (B_dData_dPair.v_firstOf dtb_u_u860))
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteFuelStrict = (fun (dtb_u_u862 : string B_dData_dList.t_List) (dtb_u_u863 : string B_dData_dMaybe.t_Maybe) (dtb_u_u864 : int B_dData_dMaybe.t_Maybe) (dtb_u_u865 : t_Site) -> (match dtb_u_u864 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u866) -> (match ((Elab_dTermination_dMeasure.v_nthExpr (dtb_u_u865).f_Site_siteArgs) dtb_u_u866) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u867) -> (match dtb_u_u863 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u868 = dtb_u_u867 in (match dtb_u_u868 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u869, dtb_u_u870, dtb_u_u871) -> (match dtb_u_u869 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u872, dtb_u_u873) -> (if (Elab_dTermination_dMeasure.v_isSubOpName dtb_u_u872) then (let dtb_u_u874 = dtb_u_u870 in (match dtb_u_u874 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u875, dtb_u_u876) -> (match dtb_u_u875 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u877, dtb_u_u878) -> (match dtb_u_u876 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u879, dtb_u_u880) -> (match dtb_u_u879 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u881, dtb_u_u882) -> (match dtb_u_u880 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb_u_u881 > 0) then ((B_dData_dList.v_memName dtb_u_u877) dtb_u_u862) else false) then (B_dData_dMaybe.C_Maybe_Just (true)) else (B_dData_dMaybe.C_Maybe_Just (false)))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u883) -> (let dtb_u_u884 = dtb_u_u867 in (match dtb_u_u884 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u885, dtb_u_u886, dtb_u_u887) -> (match dtb_u_u885 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u888, dtb_u_u889) -> (if (Elab_dTermination_dMeasure.v_isSubOpName dtb_u_u888) then (let dtb_u_u890 = dtb_u_u886 in (match dtb_u_u890 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u891, dtb_u_u892) -> (match dtb_u_u891 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u893, dtb_u_u894) -> (match dtb_u_u892 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u895, dtb_u_u896) -> (match dtb_u_u895 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u897, dtb_u_u898) -> (match dtb_u_u896 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u893 = dtb_u_u883) then (if (dtb_u_u897 > 0) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
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
  | Frontend_dAst.C_Expr_EVar (dtb_u_u899, dtb_u_u900) -> (if (dtb_u_u899 = dtb_u_u883) then (B_dData_dMaybe.C_Maybe_Just (false)) else B_dData_dMaybe.C_Maybe_Nothing)
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
let rec v_fuelEdgesGo = (fun (dtb_u_u901 : string B_dData_dList.t_List) (dtb_u_u902 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u903 : t_Site B_dData_dList.t_List) (dtb_u_u904 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u903 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u905, dtb_u_u906) -> (let dtb_u_u907 = ((B_dData_dList.v_memName (dtb_u_u905).f_Site_siteCallee) dtb_u_u901) in (let dtb_u_u908 = (let dtb_u_u910 = ((((v_siteFuelStrict ((v_paramsOf (dtb_u_u905).f_Site_siteCaller) dtb_u_u902)) ((v_fuelParamNameOf (dtb_u_u905).f_Site_siteCaller) dtb_u_u902)) (((v_fuelParamIndexOf (dtb_u_u905).f_Site_siteCallee) ((v_callerFuelName (dtb_u_u905).f_Site_siteCaller) dtb_u_u902)) dtb_u_u902)) dtb_u_u905) in (match dtb_u_u910 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u911) -> (if dtb_u_u911 then 1 else 0)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u909 = (if dtb_u_u907 then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (dtb_u_u905).f_Site_siteCaller; B_dData_dPair.f_Pair_second = (dtb_u_u905).f_Site_siteCallee }; B_dData_dPair.f_Pair_second = dtb_u_u908 }; B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, dtb_u_u904)) else dtb_u_u904) in ((((v_fuelEdgesGo dtb_u_u901) dtb_u_u902) dtb_u_u906) dtb_u_u909))))
  | B_dData_dList.C_List_Nil -> dtb_u_u904
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelEdgesOf = (fun (dtb_u_u912 : string B_dData_dList.t_List) (dtb_u_u913 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u914 : t_Site B_dData_dList.t_List) -> ((((v_fuelEdgesGo dtb_u_u912) dtb_u_u913) dtb_u_u914) B_dData_dList.C_List_Nil))

# 1054 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_memberGuarded = (fun (dtb_u_u915 : string) (dtb_u_u916 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_fuelParamNameOf dtb_u_u915) dtb_u_u916) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u917) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1060 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_unguardedOf = (fun (dtb_u_u918 : string B_dData_dList.t_List) (dtb_u_u919 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u918 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u920, dtb_u_u921) -> (if ((v_memberGuarded dtb_u_u920) dtb_u_u919) then ((v_unguardedOf dtb_u_u921) dtb_u_u919) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u920, ((v_unguardedOf dtb_u_u921) dtb_u_u919))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1066 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let[@tail_mod_cons] rec v_allWeakEdges = (fun (dtb_u_u922 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u922 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u923, dtb_u_u924) -> (match dtb_u_u923 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u925; B_dData_dPair.f_Pair_second = dtb_u_u926 } -> (match dtb_u_u925 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u927; B_dData_dPair.f_Pair_second = dtb_u_u928 } -> (match dtb_u_u927 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u929; B_dData_dPair.f_Pair_second = dtb_u_u930 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u929; B_dData_dPair.f_Pair_second = dtb_u_u930 }; B_dData_dPair.f_Pair_second = 0 }; B_dData_dPair.f_Pair_second = dtb_u_u926 }, (v_allWeakEdges dtb_u_u924)))
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
let[@tail_mod_cons] rec v_onlyUnguarded = (fun (dtb_u_u931 : string B_dData_dList.t_List) (dtb_u_u932 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u932 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u933, dtb_u_u934) -> (match dtb_u_u933 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u935; B_dData_dPair.f_Pair_second = dtb_u_u936 } -> (match dtb_u_u935 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u937; B_dData_dPair.f_Pair_second = dtb_u_u938 } -> (match dtb_u_u937 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u939; B_dData_dPair.f_Pair_second = dtb_u_u940 } -> (if ((B_dData_dList.v_memName dtb_u_u939) dtb_u_u931) then (if ((B_dData_dList.v_memName dtb_u_u940) dtb_u_u931) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u939; B_dData_dPair.f_Pair_second = dtb_u_u940 }; B_dData_dPair.f_Pair_second = dtb_u_u938 }; B_dData_dPair.f_Pair_second = dtb_u_u936 }, ((v_onlyUnguarded dtb_u_u931) dtb_u_u934))) else ((v_onlyUnguarded dtb_u_u931) dtb_u_u934)) else ((v_onlyUnguarded dtb_u_u931) dtb_u_u934))
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
let v_unguardedCycle = (fun (dtb_u_u941 : string B_dData_dList.t_List) (dtb_u_u942 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Elab_dTermination_dMeasure.v_hasWeakCycle dtb_u_u941) (v_allWeakEdges ((v_onlyUnguarded dtb_u_u941) dtb_u_u942))))

# 1089 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_fuelAcceptable = (fun (dtb_u_u943 : string B_dData_dList.t_List) (dtb_u_u944 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u945 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_unguardedOf dtb_u_u943) dtb_u_u944) with
  | B_dData_dList.C_List_Nil -> true
  | dtb_u_u946 -> (if ((v_unguardedCycle dtb_u_u946) dtb_u_u945) then false else true)
))

# 1107 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeModeOf = (fun (dtb_u_u947 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match dtb_u_u947 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u948; B_dData_dPair.f_Pair_second = dtb_u_u949 } -> (match dtb_u_u948 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u950; B_dData_dPair.f_Pair_second = dtb_u_u951 } -> (match dtb_u_u950 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u952; B_dData_dPair.f_Pair_second = dtb_u_u953 } -> dtb_u_u951
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1095 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_tryFuelThread = (fun (dtb_u_u954 : string B_dData_dList.t_List) (dtb_u_u955 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u956 : string B_dData_dList.t_List) (dtb_u_u957 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u958 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u959 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u960 = (((((v_siteCollect dtb_u_u954) dtb_u_u956) dtb_u_u957) dtb_u_u955) dtb_u_u958) in (let dtb_u_u961 = (((v_fuelEdgesOf dtb_u_u954) dtb_u_u955) dtb_u_u960) in (let dtb_u_u962 = (B_dData_dList.v_length (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_edgeModeOf) dtb_u_u961))) in (if (if (if (dtb_u_u962 > 0) then (((v_fuelAcceptable dtb_u_u954) dtb_u_u955) dtb_u_u961) else false) then (B_dData_dBool.v_not ((Elab_dTermination_dMeasure.v_hasWeakCycle dtb_u_u954) dtb_u_u961)) else false) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.C_Check_ErrC (dtb_u_u959)))))))

# 15 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCaller = (fun (dtb_u_u963 : t_Site) -> (match dtb_u_u963 with
  | { f_Site_siteCaller = dtb_u_u964; f_Site_siteCallee = dtb_u_u965; f_Site_siteArgs = dtb_u_u966; f_Site_siteSizes = dtb_u_u967; f_Site_siteRegion = dtb_u_u968; f_Site_siteBlind = dtb_u_u969 } -> dtb_u_u964
  | _ -> failwith "DT: impossible branch"
))

# 16 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteCallee = (fun (dtb_u_u970 : t_Site) -> (match dtb_u_u970 with
  | { f_Site_siteCaller = dtb_u_u971; f_Site_siteCallee = dtb_u_u972; f_Site_siteArgs = dtb_u_u973; f_Site_siteSizes = dtb_u_u974; f_Site_siteRegion = dtb_u_u975; f_Site_siteBlind = dtb_u_u976 } -> dtb_u_u972
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteArgs = (fun (dtb_u_u977 : t_Site) -> (match dtb_u_u977 with
  | { f_Site_siteCaller = dtb_u_u978; f_Site_siteCallee = dtb_u_u979; f_Site_siteArgs = dtb_u_u980; f_Site_siteSizes = dtb_u_u981; f_Site_siteRegion = dtb_u_u982; f_Site_siteBlind = dtb_u_u983 } -> dtb_u_u980
  | _ -> failwith "DT: impossible branch"
))

# 18 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteSizes = (fun (dtb_u_u984 : t_Site) -> (match dtb_u_u984 with
  | { f_Site_siteCaller = dtb_u_u985; f_Site_siteCallee = dtb_u_u986; f_Site_siteArgs = dtb_u_u987; f_Site_siteSizes = dtb_u_u988; f_Site_siteRegion = dtb_u_u989; f_Site_siteBlind = dtb_u_u990 } -> dtb_u_u988
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteRegion = (fun (dtb_u_u991 : t_Site) -> (match dtb_u_u991 with
  | { f_Site_siteCaller = dtb_u_u992; f_Site_siteCallee = dtb_u_u993; f_Site_siteArgs = dtb_u_u994; f_Site_siteSizes = dtb_u_u995; f_Site_siteRegion = dtb_u_u996; f_Site_siteBlind = dtb_u_u997 } -> dtb_u_u996
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_siteBlind = (fun (dtb_u_u998 : t_Site) -> (match dtb_u_u998 with
  | { f_Site_siteCaller = dtb_u_u999; f_Site_siteCallee = dtb_u_u1000; f_Site_siteArgs = dtb_u_u1001; f_Site_siteSizes = dtb_u_u1002; f_Site_siteRegion = dtb_u_u1003; f_Site_siteBlind = dtb_u_u1004 } -> dtb_u_u1004
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeFrom = (fun (dtb_u_u1005 : t_ScEdge) -> (match dtb_u_u1005 with
  | { f_ScEdge_edgeFrom = dtb_u_u1006; f_ScEdge_edgeTo = dtb_u_u1007; f_ScEdge_scStrictEdge = dtb_u_u1008 } -> dtb_u_u1006
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_edgeTo = (fun (dtb_u_u1009 : t_ScEdge) -> (match dtb_u_u1009 with
  | { f_ScEdge_edgeFrom = dtb_u_u1010; f_ScEdge_edgeTo = dtb_u_u1011; f_ScEdge_scStrictEdge = dtb_u_u1012 } -> dtb_u_u1011
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Elab/Termination/Scc.vuna"
let v_scStrictEdge = (fun (dtb_u_u1013 : t_ScEdge) -> (match dtb_u_u1013 with
  | { f_ScEdge_edgeFrom = dtb_u_u1014; f_ScEdge_edgeTo = dtb_u_u1015; f_ScEdge_scStrictEdge = dtb_u_u1016 } -> dtb_u_u1016
  | _ -> failwith "DT: impossible branch"
))
