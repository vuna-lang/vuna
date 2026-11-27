open Vuna_runtime
type t_SelectorRecord = { f_SelectorRecord_srName : string; f_SelectorRecord_srParams : string B_dData_dList.t_List; f_SelectorRecord_srFields : Frontend_dAst.t_Field B_dData_dList.t_List; f_SelectorRecord_srClaim : bool; f_SelectorRecord_srLinear : bool; f_SelectorRecord_srRef : Frontend_dAst.t_NodeRef }

# 23 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorDerivingName = "Selectors"

# 39 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_findSelectorRecord = (fun (dtb_u_u1 : string) (dtb_u_u2 : t_SelectorRecord B_dData_dList.t_List) -> (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (if ((dtb_u_u3).f_SelectorRecord_srName = dtb_u_u1) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3)) else ((v_findSelectorRecord dtb_u_u1) dtb_u_u4))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Loader/Selectors.vuna"
let[@tail_mod_cons] rec v_selectorRecords = (fun (dtb_u_u5 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u5 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u6, dtb_u_u7) -> (match dtb_u_u6 with
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u8, dtb_u_u9, dtb_u_u10, dtb_u_u11, dtb_u_u12, dtb_u_u13, dtb_u_u14, dtb_u_u15) -> (B_dData_dList.C_List__x58__x58_ ({ f_SelectorRecord_srName = dtb_u_u8; f_SelectorRecord_srParams = dtb_u_u9; f_SelectorRecord_srFields = dtb_u_u10; f_SelectorRecord_srClaim = ((B_dData_dList.v_memName v_selectorDerivingName) dtb_u_u11); f_SelectorRecord_srLinear = dtb_u_u14; f_SelectorRecord_srRef = dtb_u_u15 }, (v_selectorRecords dtb_u_u7)))
  | _ -> (v_selectorRecords dtb_u_u7)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_checkDataSelectors = (fun (dtb_u_u16 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (match dtb_u_u17 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u19, dtb_u_u20, dtb_u_u21, dtb_u_u22, dtb_u_u23, dtb_u_u24, dtb_u_u25, dtb_u_u26, dtb_u_u27) -> (if ((B_dData_dList.v_memName v_selectorDerivingName) dtb_u_u23) then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb_u_u27)) (Base_dDiagnostics_dRn.C_RnErr_SelectorNotRecord (dtb_u_u19))) dtb_u_u19) else (v_checkDataSelectors dtb_u_u18))
  | _ -> (v_checkDataSelectors dtb_u_u18)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Loader/Selectors.vuna"
let[@tail_mod_cons] rec v_traitMethodNames = (fun (dtb_u_u28 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (B_dData_dList.C_List__x58__x58_ ((dtb_u_u29).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb_u_u30)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Loader/Selectors.vuna"
let[@tail_mod_cons] rec v_ctorNames = (fun (dtb_u_u31 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (B_dData_dList.C_List__x58__x58_ ((dtb_u_u32).Frontend_dAst.f_Ctor_ctorName, (v_ctorNames dtb_u_u33)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Loader/Selectors.vuna"
let v_declTopNames = (fun (dtb_u_u34 : Frontend_dAst.t_Decl) -> (match dtb_u_u34 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u35, dtb_u_u36, dtb_u_u37, dtb_u_u38) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DData (dtb_u_u39, dtb_u_u40, dtb_u_u41, dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u45, dtb_u_u46, dtb_u_u47) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u39, (v_ctorNames dtb_u_u42)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u48, dtb_u_u49, dtb_u_u50, dtb_u_u51, dtb_u_u52, dtb_u_u53, dtb_u_u54, dtb_u_u55) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u48, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u56, dtb_u_u57, dtb_u_u58, dtb_u_u59, dtb_u_u60) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u56, (v_traitMethodNames dtb_u_u59)))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u61, dtb_u_u62, dtb_u_u63, dtb_u_u64) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u61, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u65, dtb_u_u66, dtb_u_u67) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u65, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DFun (dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u68, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u72, dtb_u_u73, dtb_u_u74, dtb_u_u75) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u72, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_topLevelNames = (fun (dtb_u_u76 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u78) -> ((B_dData_dList.v_append (v_declTopNames dtb_u_u77)) (v_topLevelNames dtb_u_u78))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Loader/Selectors.vuna"
let[@tail_mod_cons] rec v_fieldNamesOf = (fun (dtb_u_u79 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (B_dData_dList.C_List__x58__x58_ ((dtb_u_u80).Frontend_dAst.f_Field_fieldName, (v_fieldNamesOf dtb_u_u81)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Loader/Selectors.vuna"
let v_recordFieldNames = (fun (dtb_u_u82 : t_SelectorRecord) -> (v_fieldNamesOf (dtb_u_u82).f_SelectorRecord_srFields))

# 105 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_fieldOwnerCount = (fun (dtb_u_u83 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u84 : string) -> (match dtb_u_u83 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u85, dtb_u_u86) -> (if ((B_dData_dList.v_memName dtb_u_u84) (v_recordFieldNames dtb_u_u85)) then (1 + ((v_fieldOwnerCount dtb_u_u86) dtb_u_u84)) else ((v_fieldOwnerCount dtb_u_u86) dtb_u_u84))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Loader/Selectors.vuna"
let v_fieldNameSelected = (fun (dtb_u_u87 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u88 : t_SelectorRecord) (dtb_u_u89 : string) -> (if (B_dData_dBool.v_not (dtb_u_u88).f_SelectorRecord_srLinear) then (if (dtb_u_u88).f_SelectorRecord_srClaim then true else (((v_fieldOwnerCount dtb_u_u87) dtb_u_u89) = 1)) else false))

# 35 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectedFieldNamesOf = (fun (dtb_u_u90 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u91 : t_SelectorRecord) -> (if (dtb_u_u91).f_SelectorRecord_srLinear then B_dData_dList.C_List_Nil else ((B_dData_dList.v_filter ((v_fieldNameSelected dtb_u_u90) dtb_u_u91)) (v_recordFieldNames dtb_u_u91))))

# 27 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectedFieldNames = (fun (dtb_u_u92 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u93 : string) -> (let dtb_u_u94 = (v_selectorRecords dtb_u_u92) in (match ((v_findSelectorRecord dtb_u_u93) dtb_u_u94) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u95) -> ((v_selectedFieldNamesOf dtb_u_u94) dtb_u_u95)
  | _ -> failwith "DT: impossible branch"
)))

# 113 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_fieldClaimCount = (fun (dtb_u_u96 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u97 : string) -> (match dtb_u_u96 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (if (if (dtb_u_u98).f_SelectorRecord_srClaim then ((B_dData_dList.v_memName dtb_u_u97) (v_recordFieldNames dtb_u_u98)) else false) then (1 + ((v_fieldClaimCount dtb_u_u99) dtb_u_u97)) else ((v_fieldClaimCount dtb_u_u99) dtb_u_u97))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Loader/Selectors.vuna"
let[@tail_mod_cons] rec v_ownersOf = (fun (dtb_u_u100 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u101 : string) -> (match dtb_u_u100 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u102, dtb_u_u103) -> (if ((B_dData_dList.v_memName dtb_u_u101) (v_recordFieldNames dtb_u_u102)) then (B_dData_dList.C_List__x58__x58_ ((dtb_u_u102).f_SelectorRecord_srName, ((v_ownersOf dtb_u_u103) dtb_u_u101))) else ((v_ownersOf dtb_u_u103) dtb_u_u101))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_joinWithComma = (fun (dtb_u_u104 : string B_dData_dList.t_List) -> (match dtb_u_u104 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb_u_u106) B_dData_dList.C_List_Nil) then dtb_u_u105 else (String.concat "" [dtb_u_u105; ", "; (v_joinWithComma dtb_u_u106)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Loader/Selectors.vuna"
let v_ownersText = (fun (dtb_u_u107 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u108 : string) -> (v_joinWithComma ((v_ownersOf dtb_u_u107) dtb_u_u108)))

# 201 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_paramPis = (fun (dtb_u_u109 : string B_dData_dList.t_List) (dtb_u_u110 : Frontend_dAst.t_NodeRef) (dtb_u_u111 : Frontend_dAst.t_Expr) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u112, dtb_u_u113) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u112, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", dtb_u_u110)), (((v_paramPis dtb_u_u113) dtb_u_u110) dtb_u_u111), dtb_u_u110))
  | B_dData_dList.C_List_Nil -> dtb_u_u111
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Loader/Selectors.vuna"
let v_recordTypeExpr = (fun (dtb_u_u114 : t_SelectorRecord) -> (match (dtb_u_u114).f_SelectorRecord_srParams with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((dtb_u_u114).f_SelectorRecord_srName, (dtb_u_u114).f_SelectorRecord_srRef))
  | dtb_u_u115 -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((dtb_u_u114).f_SelectorRecord_srName, (dtb_u_u114).f_SelectorRecord_srRef)), ((B_dData_dList.v_map (fun (dtb_u_u116 : string) -> (Frontend_dAst.C_Expr_EVar (dtb_u_u116, (dtb_u_u114).f_SelectorRecord_srRef)))) dtb_u_u115), (dtb_u_u114).f_SelectorRecord_srRef))
))

# 197 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorSigType = (fun (dtb_u_u117 : t_SelectorRecord) (dtb_u_u118 : Frontend_dAst.t_Field) -> (((v_paramPis (dtb_u_u117).f_SelectorRecord_srParams) (dtb_u_u118).Frontend_dAst.f_Field_fieldRef) (Frontend_dAst.C_Expr_EPi ("p", false, B_dData_dMaybe.C_Maybe_Nothing, (v_recordTypeExpr dtb_u_u117), (dtb_u_u118).Frontend_dAst.f_Field_fieldType, (dtb_u_u118).Frontend_dAst.f_Field_fieldRef))))

# 194 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorSigDecl = (fun (dtb_u_u119 : t_SelectorRecord) (dtb_u_u120 : Frontend_dAst.t_Field) -> (Frontend_dAst.C_Decl_DSig ((dtb_u_u120).Frontend_dAst.f_Field_fieldName, B_dData_dList.C_List_Nil, ((v_selectorSigType dtb_u_u119) dtb_u_u120), (dtb_u_u120).Frontend_dAst.f_Field_fieldRef)))

# 230 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorArgName = (fun (dtb_u_u121 : int) -> ("s" ^ (string_of_int dtb_u_u121)))

# 226 "Vuna/Compiler/Loader/Selectors.vuna"
let[@tail_mod_cons] rec v_selectorArgPatsRev = (fun (dtb_u_u122 : int) (dtb_u_u123 : Frontend_dAst.t_NodeRef) -> (if (dtb_u_u122 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ((v_selectorArgName (dtb_u_u122 - 1)), dtb_u_u123)), ((v_selectorArgPatsRev (dtb_u_u122 - 1)) dtb_u_u123)))))

# 223 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorArgPats = (fun (dtb_u_u124 : int) (dtb_u_u125 : Frontend_dAst.t_NodeRef) -> (B_dData_dList.v_reverse ((v_selectorArgPatsRev dtb_u_u124) dtb_u_u125)))

# 236 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_fieldIndexOfGo = (fun (dtb_u_u126 : string) (dtb_u_u127 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u128 : int) -> (match dtb_u_u127 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130) -> (if ((dtb_u_u129).Frontend_dAst.f_Field_fieldName = dtb_u_u126) then dtb_u_u128 else (((v_fieldIndexOfGo dtb_u_u126) dtb_u_u130) (dtb_u_u128 + 1)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Loader/Selectors.vuna"
let v_fieldIndexOf = (fun (dtb_u_u131 : string) (dtb_u_u132 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (((v_fieldIndexOfGo dtb_u_u131) dtb_u_u132) 0))

# 214 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorFunDecl = (fun (dtb_u_u133 : t_SelectorRecord) (dtb_u_u134 : Frontend_dAst.t_Field) -> (Frontend_dAst.C_Decl_DFun ((dtb_u_u134).Frontend_dAst.f_Field_fieldName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("p", (dtb_u_u134).Frontend_dAst.f_Field_fieldRef)), B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("p", (dtb_u_u134).Frontend_dAst.f_Field_fieldRef)), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon ((dtb_u_u133).f_SelectorRecord_srName, ((v_selectorArgPats (B_dData_dList.v_length (dtb_u_u133).f_SelectorRecord_srFields)) (dtb_u_u134).Frontend_dAst.f_Field_fieldRef), (dtb_u_u134).Frontend_dAst.f_Field_fieldRef)); Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_EVar ((v_selectorArgName ((v_fieldIndexOf (dtb_u_u134).Frontend_dAst.f_Field_fieldName) (dtb_u_u133).f_SelectorRecord_srFields)), (dtb_u_u134).Frontend_dAst.f_Field_fieldRef)); Frontend_dAst.f_Alt_altRef = (dtb_u_u134).Frontend_dAst.f_Field_fieldRef }, B_dData_dList.C_List_Nil)), (dtb_u_u134).Frontend_dAst.f_Field_fieldRef)), (dtb_u_u134).Frontend_dAst.f_Field_fieldRef)))

# 168 "Vuna/Compiler/Loader/Selectors.vuna"
let v_checkOneField = (fun (dtb_u_u135 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u136 : t_SelectorRecord) (dtb_u_u137 : Frontend_dAst.t_Field) (dtb_u_u138 : string B_dData_dList.t_List) -> (let dtb_u_u139 = (dtb_u_u137).Frontend_dAst.f_Field_fieldName in (let dtb_u_u140 = ((v_fieldOwnerCount dtb_u_u135) dtb_u_u139) in (let dtb_u_u141 = ((v_fieldClaimCount dtb_u_u135) dtb_u_u139) in (if (dtb_u_u141 > 1) then ((((Base_dDiagnostics_dRn.v_rnAt2 (Frontend_dAst.v_nodeRefSpan (dtb_u_u136).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorConflict (dtb_u_u139, ((v_ownersText dtb_u_u135) dtb_u_u139)))) dtb_u_u139) ((v_ownersText dtb_u_u135) dtb_u_u139)) else (if (if (dtb_u_u140 > 1) then (dtb_u_u141 = 0) else false) then ((((Base_dDiagnostics_dRn.v_rnAt2 (Frontend_dAst.v_nodeRefSpan (dtb_u_u136).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorShared (dtb_u_u139, ((v_ownersText dtb_u_u135) dtb_u_u139)))) dtb_u_u139) ((v_ownersText dtb_u_u135) dtb_u_u139)) else (if (B_dData_dBool.v_not (((v_fieldNameSelected dtb_u_u135) dtb_u_u136) dtb_u_u139)) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (if ((B_dData_dList.v_memName dtb_u_u139) dtb_u_u138) then ((((Base_dDiagnostics_dRn.v_rnAt2 (Frontend_dAst.v_nodeRefSpan (dtb_u_u136).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorNameTaken (dtb_u_u139, (dtb_u_u136).f_SelectorRecord_srName))) dtb_u_u139) (dtb_u_u136).f_SelectorRecord_srName) else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_selectorSigDecl dtb_u_u136) dtb_u_u137), (B_dData_dList.C_List__x58__x58_ (((v_selectorFunDecl dtb_u_u136) dtb_u_u137), B_dData_dList.C_List_Nil))))))))))))))

# 161 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_checkFieldClaims = (fun (dtb_u_u142 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u143 : t_SelectorRecord) (dtb_u_u144 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u145 : string B_dData_dList.t_List) -> (match dtb_u_u144 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u146, dtb_u_u147) -> ((Base_dCommon.v_bind ((((v_checkOneField dtb_u_u142) dtb_u_u143) dtb_u_u146) dtb_u_u145)) (fun (dtb_u_u148 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_checkFieldClaims dtb_u_u142) dtb_u_u143) dtb_u_u147) dtb_u_u145)) (fun (dtb_u_u149 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u148) dtb_u_u149)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Loader/Selectors.vuna"
let v_checkRecordClaims = (fun (dtb_u_u150 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u151 : t_SelectorRecord) (dtb_u_u152 : string B_dData_dList.t_List) -> (if (dtb_u_u151).f_SelectorRecord_srLinear then (if (dtb_u_u151).f_SelectorRecord_srClaim then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan (dtb_u_u151).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorNotRecord ((dtb_u_u151).f_SelectorRecord_srName))) (dtb_u_u151).f_SelectorRecord_srName) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else ((((v_checkFieldClaims dtb_u_u150) dtb_u_u151) (dtb_u_u151).f_SelectorRecord_srFields) dtb_u_u152)))

# 147 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_checkClaimsGo = (fun (dtb_u_u153 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u154 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u155 : string B_dData_dList.t_List) -> (match dtb_u_u154 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u156, dtb_u_u157) -> ((Base_dCommon.v_bind (((v_checkRecordClaims dtb_u_u153) dtb_u_u156) dtb_u_u155)) (fun (dtb_u_u158 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkClaimsGo dtb_u_u153) dtb_u_u157) dtb_u_u155)) (fun (dtb_u_u159 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u158) dtb_u_u159)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Loader/Selectors.vuna"
let v_checkClaims = (fun (dtb_u_u160 : t_SelectorRecord B_dData_dList.t_List) (dtb_u_u161 : string B_dData_dList.t_List) -> (((v_checkClaimsGo dtb_u_u160) dtb_u_u160) dtb_u_u161))

# 51 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorDecls = (fun (dtb_u_u162 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkDataSelectors dtb_u_u162)) (fun (dtb_u_u163 : int) -> ((v_checkClaims (v_selectorRecords dtb_u_u162)) (v_topLevelNames dtb_u_u162)))))

# 14 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srName = (fun (dtb_u_u164 : t_SelectorRecord) -> (match dtb_u_u164 with
  | { f_SelectorRecord_srName = dtb_u_u165; f_SelectorRecord_srParams = dtb_u_u166; f_SelectorRecord_srFields = dtb_u_u167; f_SelectorRecord_srClaim = dtb_u_u168; f_SelectorRecord_srLinear = dtb_u_u169; f_SelectorRecord_srRef = dtb_u_u170 } -> dtb_u_u165
  | _ -> failwith "DT: impossible branch"
))

# 15 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srParams = (fun (dtb_u_u171 : t_SelectorRecord) -> (match dtb_u_u171 with
  | { f_SelectorRecord_srName = dtb_u_u172; f_SelectorRecord_srParams = dtb_u_u173; f_SelectorRecord_srFields = dtb_u_u174; f_SelectorRecord_srClaim = dtb_u_u175; f_SelectorRecord_srLinear = dtb_u_u176; f_SelectorRecord_srRef = dtb_u_u177 } -> dtb_u_u173
  | _ -> failwith "DT: impossible branch"
))

# 16 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srFields = (fun (dtb_u_u178 : t_SelectorRecord) -> (match dtb_u_u178 with
  | { f_SelectorRecord_srName = dtb_u_u179; f_SelectorRecord_srParams = dtb_u_u180; f_SelectorRecord_srFields = dtb_u_u181; f_SelectorRecord_srClaim = dtb_u_u182; f_SelectorRecord_srLinear = dtb_u_u183; f_SelectorRecord_srRef = dtb_u_u184 } -> dtb_u_u181
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srClaim = (fun (dtb_u_u185 : t_SelectorRecord) -> (match dtb_u_u185 with
  | { f_SelectorRecord_srName = dtb_u_u186; f_SelectorRecord_srParams = dtb_u_u187; f_SelectorRecord_srFields = dtb_u_u188; f_SelectorRecord_srClaim = dtb_u_u189; f_SelectorRecord_srLinear = dtb_u_u190; f_SelectorRecord_srRef = dtb_u_u191 } -> dtb_u_u189
  | _ -> failwith "DT: impossible branch"
))

# 18 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srLinear = (fun (dtb_u_u192 : t_SelectorRecord) -> (match dtb_u_u192 with
  | { f_SelectorRecord_srName = dtb_u_u193; f_SelectorRecord_srParams = dtb_u_u194; f_SelectorRecord_srFields = dtb_u_u195; f_SelectorRecord_srClaim = dtb_u_u196; f_SelectorRecord_srLinear = dtb_u_u197; f_SelectorRecord_srRef = dtb_u_u198 } -> dtb_u_u197
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srRef = (fun (dtb_u_u199 : t_SelectorRecord) -> (match dtb_u_u199 with
  | { f_SelectorRecord_srName = dtb_u_u200; f_SelectorRecord_srParams = dtb_u_u201; f_SelectorRecord_srFields = dtb_u_u202; f_SelectorRecord_srClaim = dtb_u_u203; f_SelectorRecord_srLinear = dtb_u_u204; f_SelectorRecord_srRef = dtb_u_u205 } -> dtb_u_u205
  | _ -> failwith "DT: impossible branch"
))
