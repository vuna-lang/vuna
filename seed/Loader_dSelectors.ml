open Vuna_runtime
type t_SelectorRecord = { f_SelectorRecord_srName : string; f_SelectorRecord_srParams : string B_dData_dList.t_List; f_SelectorRecord_srFields : Frontend_dAst.t_Field B_dData_dList.t_List; f_SelectorRecord_srClaim : bool; f_SelectorRecord_srLinear : bool; f_SelectorRecord_srRef : Frontend_dAst.t_NodeRef }

# 23 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorDerivingName = "Selectors"

# 28 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorsStrict = false

# 45 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_findSelectorRecord = (fun (mc0 : string) (mc1 : t_SelectorRecord B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((dtb__0).f_SelectorRecord_srName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__0)) else ((v_findSelectorRecord mc0) dtb__1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_selectorRecords = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | Frontend_dAst.C_Decl_DRecord (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8, dtb__9, dtb__10, dtb__11) -> (B_dData_dList.C_List__x58__x58_ ({ f_SelectorRecord_srName = dtb__4; f_SelectorRecord_srParams = dtb__5; f_SelectorRecord_srFields = dtb__6; f_SelectorRecord_srClaim = ((B_dData_dList.v_memName v_selectorDerivingName) dtb__7); f_SelectorRecord_srLinear = dtb__10; f_SelectorRecord_srRef = dtb__11 }, (v_selectorRecords dtb__3)))
  | _ -> (v_selectorRecords dtb__3)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_checkDataSelectors = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (match dtb__12 with
  | Frontend_dAst.C_Decl_DData (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((B_dData_dList.v_memName v_selectorDerivingName) dtb__18) then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__22)) (Base_dDiagnostics_dRn.C_RnErr_SelectorNotRecord (dtb__14))) dtb__14) else (v_checkDataSelectors dtb__13))
  | _ -> (v_checkDataSelectors dtb__13)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_traitMethodNames = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (B_dData_dList.C_List__x58__x58_ ((dtb__23).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb__24)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_ctorNames = (fun (mc0 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (B_dData_dList.C_List__x58__x58_ ((dtb__25).Frontend_dAst.f_Ctor_ctorName, (v_ctorNames dtb__26)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Loader/Selectors.vuna"
let v_declTopNames = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__27, dtb__28, dtb__29, dtb__30) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DData (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (B_dData_dList.C_List__x58__x58_ (dtb__31, (v_ctorNames dtb__34)))
  | Frontend_dAst.C_Decl_DRecord (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> (B_dData_dList.C_List__x58__x58_ (dtb__40, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DTrait (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (B_dData_dList.C_List__x58__x58_ (dtb__48, (v_traitMethodNames dtb__51)))
  | Frontend_dAst.C_Decl_DExtern (dtb__53, dtb__54, dtb__55, dtb__56) -> (B_dData_dList.C_List__x58__x58_ (dtb__53, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__57, dtb__58, dtb__59) -> (B_dData_dList.C_List__x58__x58_ (dtb__57, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DFun (dtb__60, dtb__61, dtb__62, dtb__63) -> (B_dData_dList.C_List__x58__x58_ (dtb__60, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__64, dtb__65, dtb__66, dtb__67) -> (B_dData_dList.C_List__x58__x58_ (dtb__64, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_topLevelNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> ((B_dData_dList.v_append (v_declTopNames dtb__68)) (v_topLevelNames dtb__69))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_fieldNamesOf = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (B_dData_dList.C_List__x58__x58_ ((dtb__70).Frontend_dAst.f_Field_fieldName, (v_fieldNamesOf dtb__71)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Loader/Selectors.vuna"
let v_recordFieldNames = (fun (r : t_SelectorRecord) -> (v_fieldNamesOf (r).f_SelectorRecord_srFields))

# 116 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_fieldOwnerCount = (fun (mc0 : t_SelectorRecord B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (if ((B_dData_dList.v_memName mc1) (v_recordFieldNames dtb__72)) then (1 + ((v_fieldOwnerCount dtb__73) mc1)) else ((v_fieldOwnerCount dtb__73) mc1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Selectors.vuna"
let v_fieldNameSelected = (fun (all : t_SelectorRecord B_dData_dList.t_List) (topNames : string B_dData_dList.t_List) (r : t_SelectorRecord) (fieldName : string) -> (if (r).f_SelectorRecord_srLinear then false else (if (B_dData_dBool.v_not (if (r).f_SelectorRecord_srClaim then true else (((v_fieldOwnerCount all) fieldName) = 1))) then false else (if v_selectorsStrict then true else (B_dData_dBool.v_not ((B_dData_dList.v_memName fieldName) topNames))))))

# 41 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectedFieldNamesOf = (fun (all : t_SelectorRecord B_dData_dList.t_List) (topNames : string B_dData_dList.t_List) (r : t_SelectorRecord) -> (if (r).f_SelectorRecord_srLinear then B_dData_dList.C_List_Nil else ((B_dData_dList.v_filter (((v_fieldNameSelected all) topNames) r)) (v_recordFieldNames r))))

# 32 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectedFieldNames = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (recordName : string) -> (let all = (v_selectorRecords decls) in (let topNames = (v_topLevelNames decls) in (match ((v_findSelectorRecord recordName) all) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (((v_selectedFieldNamesOf all) topNames) dtb__74)
  | _ -> failwith "DT: impossible branch"
))))

# 124 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_fieldClaimCount = (fun (mc0 : t_SelectorRecord B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if (if (dtb__75).f_SelectorRecord_srClaim then ((B_dData_dList.v_memName mc1) (v_recordFieldNames dtb__75)) else false) then (1 + ((v_fieldClaimCount dtb__76) mc1)) else ((v_fieldClaimCount dtb__76) mc1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_ownersOf = (fun (mc0 : t_SelectorRecord B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if ((B_dData_dList.v_memName mc1) (v_recordFieldNames dtb__77)) then (B_dData_dList.C_List__x58__x58_ ((dtb__77).f_SelectorRecord_srName, ((v_ownersOf dtb__78) mc1))) else ((v_ownersOf dtb__78) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_joinWithComma = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__80) B_dData_dList.C_List_Nil) then dtb__79 else (String.concat "" [dtb__79; ", "; (v_joinWithComma dtb__80)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Loader/Selectors.vuna"
let v_ownersText = (fun (recs : t_SelectorRecord B_dData_dList.t_List) (fieldName : string) -> (v_joinWithComma ((v_ownersOf recs) fieldName)))

# 221 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_paramPis = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_NodeRef) (mc2 : Frontend_dAst.t_Expr) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (Frontend_dAst.C_Expr_EPi (dtb__81, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", mc1)), (((v_paramPis dtb__82) mc1) mc2), mc1))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Loader/Selectors.vuna"
let v_recordTypeExpr = (fun (r : t_SelectorRecord) -> (match (r).f_SelectorRecord_srParams with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((r).f_SelectorRecord_srName, (r).f_SelectorRecord_srRef))
  | dtb__83 -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((r).f_SelectorRecord_srName, (r).f_SelectorRecord_srRef)), ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dAst.C_Expr_EVar (p, (r).f_SelectorRecord_srRef)))) dtb__83), (r).f_SelectorRecord_srRef))
))

# 217 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorSigType = (fun (r : t_SelectorRecord) (f : Frontend_dAst.t_Field) -> (((v_paramPis (r).f_SelectorRecord_srParams) (f).Frontend_dAst.f_Field_fieldRef) (Frontend_dAst.C_Expr_EPi ("p", false, B_dData_dMaybe.C_Maybe_Nothing, (v_recordTypeExpr r), (f).Frontend_dAst.f_Field_fieldType, (f).Frontend_dAst.f_Field_fieldRef))))

# 214 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorSigDecl = (fun (r : t_SelectorRecord) (f : Frontend_dAst.t_Field) -> (Frontend_dAst.C_Decl_DSig ((f).Frontend_dAst.f_Field_fieldName, B_dData_dList.C_List_Nil, ((v_selectorSigType r) f), (f).Frontend_dAst.f_Field_fieldRef)))

# 250 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorArgName = (fun (i : int) -> ("s" ^ (bi_strFromInt i)))

# 246 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_selectorArgPatsRev = (fun (n : int) (ref : Frontend_dAst.t_NodeRef) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ((v_selectorArgName (n - 1)), ref)), ((v_selectorArgPatsRev (n - 1)) ref)))))

# 243 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorArgPats = (fun (n : int) (ref : Frontend_dAst.t_NodeRef) -> (B_dData_dList.v_reverse ((v_selectorArgPatsRev n) ref)))

# 256 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_fieldIndexOfGo = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if ((dtb__84).Frontend_dAst.f_Field_fieldName = mc0) then mc2 else (((v_fieldIndexOfGo mc0) dtb__85) (mc2 + 1)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Loader/Selectors.vuna"
let v_fieldIndexOf = (fun (name : string) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) -> (((v_fieldIndexOfGo name) fields) 0))

# 234 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorFunDecl = (fun (r : t_SelectorRecord) (f : Frontend_dAst.t_Field) -> (Frontend_dAst.C_Decl_DFun ((f).Frontend_dAst.f_Field_fieldName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("p", (f).Frontend_dAst.f_Field_fieldRef)), B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("p", (f).Frontend_dAst.f_Field_fieldRef)), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon ((r).f_SelectorRecord_srName, ((v_selectorArgPats (B_dData_dList.v_length (r).f_SelectorRecord_srFields)) (f).Frontend_dAst.f_Field_fieldRef), (f).Frontend_dAst.f_Field_fieldRef)); Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_EVar ((v_selectorArgName ((v_fieldIndexOf (f).Frontend_dAst.f_Field_fieldName) (r).f_SelectorRecord_srFields)), (f).Frontend_dAst.f_Field_fieldRef)); Frontend_dAst.f_Alt_altRef = (f).Frontend_dAst.f_Field_fieldRef }, B_dData_dList.C_List_Nil)), (f).Frontend_dAst.f_Field_fieldRef)), (f).Frontend_dAst.f_Field_fieldRef)))

# 179 "Vuna/Compiler/Loader/Selectors.vuna"
let v_checkOneField = (fun (all : t_SelectorRecord B_dData_dList.t_List) (r : t_SelectorRecord) (f : Frontend_dAst.t_Field) (topNames : string B_dData_dList.t_List) -> (let fieldName = (f).Frontend_dAst.f_Field_fieldName in (let owners = ((v_fieldOwnerCount all) fieldName) in (let claims = ((v_fieldClaimCount all) fieldName) in (if (claims > 1) then (if v_selectorsStrict then ((((Base_dDiagnostics_dRn.v_rnAt2 (Frontend_dAst.v_nodeRefSpan (r).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorConflict (fieldName, ((v_ownersText all) fieldName)))) fieldName) ((v_ownersText all) fieldName)) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (if (owners > 1) then (claims = 0) else false) then (if v_selectorsStrict then ((((Base_dDiagnostics_dRn.v_rnAt2 (Frontend_dAst.v_nodeRefSpan (r).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorShared (fieldName, ((v_ownersText all) fieldName)))) fieldName) ((v_ownersText all) fieldName)) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (B_dData_dBool.v_not ((((v_fieldNameSelected all) topNames) r) fieldName)) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (if ((B_dData_dList.v_memName fieldName) topNames) then (if v_selectorsStrict then ((((Base_dDiagnostics_dRn.v_rnAt2 (Frontend_dAst.v_nodeRefSpan (r).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorNameTaken (fieldName, (r).f_SelectorRecord_srName))) fieldName) (r).f_SelectorRecord_srName) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_selectorSigDecl r) f), (B_dData_dList.C_List__x58__x58_ (((v_selectorFunDecl r) f), B_dData_dList.C_List_Nil))))))))))))))

# 172 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_checkFieldClaims = (fun (mc0 : t_SelectorRecord B_dData_dList.t_List) (mc1 : t_SelectorRecord) (mc2 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> ((Base_dCommon.v_bind ((((v_checkOneField mc0) mc1) dtb__86) mc3)) (fun (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_checkFieldClaims mc0) mc1) dtb__87) mc3)) (fun (more : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ds) more)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Loader/Selectors.vuna"
let v_checkRecordClaims = (fun (all : t_SelectorRecord B_dData_dList.t_List) (r : t_SelectorRecord) (topNames : string B_dData_dList.t_List) -> (if (r).f_SelectorRecord_srLinear then (if (r).f_SelectorRecord_srClaim then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan (r).f_SelectorRecord_srRef)) (Base_dDiagnostics_dRn.C_RnErr_SelectorNotRecord ((r).f_SelectorRecord_srName))) (r).f_SelectorRecord_srName) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else ((((v_checkFieldClaims all) r) (r).f_SelectorRecord_srFields) topNames)))

# 158 "Vuna/Compiler/Loader/Selectors.vuna"
let rec v_checkClaimsGo = (fun (mc0 : t_SelectorRecord B_dData_dList.t_List) (mc1 : t_SelectorRecord B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> ((Base_dCommon.v_bind (((v_checkRecordClaims mc0) dtb__88) mc2)) (fun (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_checkClaimsGo mc0) dtb__89) mc2)) (fun (more : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ds) more)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Loader/Selectors.vuna"
let v_checkClaims = (fun (recs : t_SelectorRecord B_dData_dList.t_List) (topNames : string B_dData_dList.t_List) -> (((v_checkClaimsGo recs) recs) topNames))

# 62 "Vuna/Compiler/Loader/Selectors.vuna"
let v_selectorDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkDataSelectors decls)) (fun (_u : int) -> ((v_checkClaims (v_selectorRecords decls)) (v_topLevelNames decls)))))

# 14 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srName = (fun (p : t_SelectorRecord) -> (match p with
  | { f_SelectorRecord_srName = dtb__90; f_SelectorRecord_srParams = dtb__91; f_SelectorRecord_srFields = dtb__92; f_SelectorRecord_srClaim = dtb__93; f_SelectorRecord_srLinear = dtb__94; f_SelectorRecord_srRef = dtb__95 } -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

# 15 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srParams = (fun (p : t_SelectorRecord) -> (match p with
  | { f_SelectorRecord_srName = dtb__96; f_SelectorRecord_srParams = dtb__97; f_SelectorRecord_srFields = dtb__98; f_SelectorRecord_srClaim = dtb__99; f_SelectorRecord_srLinear = dtb__100; f_SelectorRecord_srRef = dtb__101 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 16 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srFields = (fun (p : t_SelectorRecord) -> (match p with
  | { f_SelectorRecord_srName = dtb__102; f_SelectorRecord_srParams = dtb__103; f_SelectorRecord_srFields = dtb__104; f_SelectorRecord_srClaim = dtb__105; f_SelectorRecord_srLinear = dtb__106; f_SelectorRecord_srRef = dtb__107 } -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

# 17 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srClaim = (fun (p : t_SelectorRecord) -> (match p with
  | { f_SelectorRecord_srName = dtb__108; f_SelectorRecord_srParams = dtb__109; f_SelectorRecord_srFields = dtb__110; f_SelectorRecord_srClaim = dtb__111; f_SelectorRecord_srLinear = dtb__112; f_SelectorRecord_srRef = dtb__113 } -> dtb__111
  | _ -> failwith "DT: impossible branch"
))

# 18 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srLinear = (fun (p : t_SelectorRecord) -> (match p with
  | { f_SelectorRecord_srName = dtb__114; f_SelectorRecord_srParams = dtb__115; f_SelectorRecord_srFields = dtb__116; f_SelectorRecord_srClaim = dtb__117; f_SelectorRecord_srLinear = dtb__118; f_SelectorRecord_srRef = dtb__119 } -> dtb__118
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Loader/Selectors.vuna"
let v_srRef = (fun (p : t_SelectorRecord) -> (match p with
  | { f_SelectorRecord_srName = dtb__120; f_SelectorRecord_srParams = dtb__121; f_SelectorRecord_srFields = dtb__122; f_SelectorRecord_srClaim = dtb__123; f_SelectorRecord_srLinear = dtb__124; f_SelectorRecord_srRef = dtb__125 } -> dtb__125
  | _ -> failwith "DT: impossible branch"
))
