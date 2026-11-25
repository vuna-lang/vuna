open Vuna_runtime
type t_Annot = ((string, (int, (int, string) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair, Frontend_dRast_dName.t_RName) B_dContainer_dHashMap.t_HashMap

# 35 "Vuna/Compiler/Frontend/Refs.vuna"
let v_emptyKey = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (0 - 1); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (0 - 1); B_dData_dPair.f_Pair_second = "" } } }

# 32 "Vuna/Compiler/Frontend/Refs.vuna"
let v_emptyRefTable = ((((B_dContainer_dHashMap.v_remove ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString)))) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)))) v_emptyKey) (((B_dContainer_dHashMap.v_fromList ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString)))) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = (Frontend_dRast_dName.C_RName_RLocal ("")) }, B_dData_dList.C_List_Nil))))

# 38 "Vuna/Compiler/Frontend/Refs.vuna"
let v_emptyAnnot = v_emptyRefTable

# 57 "Vuna/Compiler/Frontend/Refs.vuna"
let v_refKey = (fun (name : string) (ref : Frontend_dAst.t_NodeRef) -> (let sp = (Frontend_dAst.v_nodeRefSpan ref) in { B_dData_dPair.f_Pair_first = (Base_dSource.v_spanFile sp); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset sp); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Base_dSource.v_spanEndOffset sp); B_dData_dPair.f_Pair_second = name } } }))

# 43 "Vuna/Compiler/Frontend/Refs.vuna"
let v_rnameAt = (fun (a : t_Annot) (name : string) (ref : Frontend_dAst.t_NodeRef) -> (match ((((B_dContainer_dHashMap.v_lookup ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString)))) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)))) ((v_refKey name) ref)) (let dtb__0 = a in dtb__0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> dtb__1
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast_dName.v_classifyName name)
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Refs.vuna"
let v_lookupRName = (fun (a : t_Annot) (name : string) (ref : Frontend_dAst.t_NodeRef) -> ((((B_dContainer_dHashMap.v_lookup ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString)))) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)))) ((v_refKey name) ref)) (let dtb__2 = a in dtb__2)))

# 73 "Vuna/Compiler/Frontend/Refs.vuna"
let rec v_foldRefs = (fun (mc0 : ((string, (int, (int, string) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair, Frontend_dRast_dName.t_RName) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : ((string, (int, (int, string) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair, Frontend_dRast_dName.t_RName) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (let k = (B_dData_dPair.v_firstOf dtb__3) in (let v = (B_dData_dPair.v_secondOf dtb__3) in (match ((((B_dContainer_dHashMap.v_lookup ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString)))) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)))) k) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__5) = (Frontend_dRast_dName.v_rnameKey v)) then ((v_foldRefs dtb__4) mc1) else ((v_foldRefs dtb__4) ((((B_dContainer_dHashMap.v_remove ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString)))) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)))) k) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_foldRefs dtb__4) (((((B_dContainer_dHashMap.v_insert ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) ((B_dData_dPair.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString)))) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)))) k) v) mc1))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Frontend/Refs.vuna"
let v_refEntry = (fun (scope : string B_dData_dList.t_List) (name : string) (ref : Frontend_dAst.t_NodeRef) -> (match (Frontend_dRast_dName.v_classifyName name) with
  | Frontend_dRast_dName.C_RName_RLocal (dtb__6) -> B_dData_dList.C_List_Nil
  | _ -> (if ((B_dData_dList.v_memName name) scope) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((v_refKey name) ref); B_dData_dPair.f_Pair_second = (Frontend_dRast_dName.C_RName_RLocal (name)) }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
))

# 140 "Vuna/Compiler/Frontend/Refs.vuna"
let rec v_patRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__7, dtb__8, dtb__9) -> ((B_dData_dList.v_append (((v_refEntry mc0) dtb__7) dtb__9)) ((B_dData_dList.v_concatMap (v_patFieldRefs mc0)) dtb__8))
  | Frontend_dAst.C_Pat_PStr (dtb__10, dtb__11) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__12, dtb__13) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__14, dtb__15, dtb__16) -> ((B_dData_dList.v_append (((v_refEntry mc0) dtb__14) dtb__16)) ((B_dData_dList.v_concatMap (v_patRefs mc0)) dtb__15))
  | Frontend_dAst.C_Pat_PWild (dtb__17) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__18, dtb__19, dtb__20) -> ((v_patRefs mc0) dtb__19)
  | Frontend_dAst.C_Pat_PVar (dtb__21, dtb__22) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 151 "Vuna/Compiler/Frontend/Refs.vuna"
and v_patFieldRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> ((v_patRefs mc0) dtb__24)
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Frontend/Refs.vuna"
let rec v_patBinders = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__25, dtb__26, dtb__27) -> ((B_dData_dList.v_concatMap v_patFieldBinders) dtb__26)
  | Frontend_dAst.C_Pat_PStr (dtb__28, dtb__29) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__30, dtb__31) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__32, dtb__33, dtb__34) -> ((B_dData_dList.v_concatMap v_patBinders) dtb__33)
  | Frontend_dAst.C_Pat_PWild (dtb__35) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__36, dtb__37, dtb__38) -> (B_dData_dList.C_List__x58__x58_ (dtb__36, (v_patBinders dtb__37)))
  | Frontend_dAst.C_Pat_PVar (dtb__39, dtb__40) -> (B_dData_dList.C_List__x58__x58_ (dtb__39, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 246 "Vuna/Compiler/Frontend/Refs.vuna"
and v_patFieldBinders = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> (v_patBinders dtb__42)
  | _ -> failwith "DT: impossible branch"
))

# 249 "Vuna/Compiler/Frontend/Refs.vuna"
let v_bindersOfPats = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_patBinders) pats))

# 252 "Vuna/Compiler/Frontend/Refs.vuna"
let v_bindingBinders = (fun (binding : Frontend_dAst.t_Binding) -> (v_patBinders (binding).Frontend_dAst.f_Binding_bindPat))

# 229 "Vuna/Compiler/Frontend/Refs.vuna"
let v_scopeOfStmt = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__43, dtb__44) -> mc0
  | Frontend_dAst.C_DoStmt_DLet (dtb__45, dtb__46) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__45)) mc0)
  | Frontend_dAst.C_DoStmt_DBind (dtb__47, dtb__48, dtb__49) -> ((B_dData_dList.v_append (v_patBinders dtb__47)) mc0)
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Frontend/Refs.vuna"
let rec v_exprRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EDo (dtb__50, dtb__51) -> ((v_stmtsRefs mc0) dtb__50)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__52, dtb__53, dtb__54) -> ((B_dData_dList.v_append ((v_exprRefs mc0) dtb__52)) ((B_dData_dList.v_concatMap (v_fieldValueRefs mc0)) dtb__53))
  | Frontend_dAst.C_Expr_ERecord (dtb__55, dtb__56, dtb__57) -> ((B_dData_dList.v_append (((v_refEntry mc0) dtb__55) dtb__57)) ((B_dData_dList.v_concatMap (v_fieldValueRefs mc0)) dtb__56))
  | Frontend_dAst.C_Expr_EField (dtb__58, dtb__59, dtb__60) -> ((v_exprRefs mc0) dtb__58)
  | Frontend_dAst.C_Expr_EIf (dtb__61, dtb__62, dtb__63, dtb__64) -> ((B_dData_dList.v_append ((v_exprRefs mc0) dtb__61)) ((B_dData_dList.v_append ((v_exprRefs mc0) dtb__62)) ((v_exprRefs mc0) dtb__63)))
  | Frontend_dAst.C_Expr_ECase (dtb__65, dtb__66, dtb__67) -> ((B_dData_dList.v_append ((v_exprRefs mc0) dtb__65)) ((B_dData_dList.v_concatMap (v_altRefs mc0)) dtb__66))
  | Frontend_dAst.C_Expr_ELet (dtb__68, dtb__69, dtb__70, dtb__71) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__68)) mc0) in ((B_dData_dList.v_append ((B_dData_dList.v_concatMap ((v_bindingRefs bound) mc0)) dtb__68)) ((v_exprRefs bound) dtb__69)))
  | Frontend_dAst.C_Expr_EPi (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> ((B_dData_dList.v_append ((v_exprRefs mc0) dtb__75)) ((v_exprRefs (B_dData_dList.C_List__x58__x58_ (dtb__72, mc0))) dtb__76))
  | Frontend_dAst.C_Expr_EApp (dtb__78, dtb__79, dtb__80) -> ((B_dData_dList.v_append ((v_exprRefs mc0) dtb__78)) ((B_dData_dList.v_concatMap (v_exprRefs mc0)) dtb__79))
  | Frontend_dAst.C_Expr_ELam (dtb__81, dtb__82, dtb__83) -> ((v_exprRefs ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__81)) mc0)) dtb__82)
  | Frontend_dAst.C_Expr_EInterp (dtb__84, dtb__85) -> ((B_dData_dList.v_concatMap (v_interpRefs mc0)) dtb__84)
  | Frontend_dAst.C_Expr_EFloat (dtb__86, dtb__87) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EStr (dtb__88, dtb__89) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EInt (dtb__90, dtb__91) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EVar (dtb__92, dtb__93) -> (((v_refEntry mc0) dtb__92) dtb__93)
  | _ -> failwith "DT: impossible branch"
))
# 179 "Vuna/Compiler/Frontend/Refs.vuna"
and v_bindingRefs = (fun (bound : string B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binding : Frontend_dAst.t_Binding) -> (let pat = (binding).Frontend_dAst.f_Binding_bindPat in (let valueScope = ((B_dData_dList.v_append (v_patBinders pat)) bound) in (let valueRefs = (match (binding).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__95) -> ((v_exprRefs valueScope) dtb__95)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__96) -> ((B_dData_dList.v_concatMap (v_localClauseRefs valueScope)) dtb__96)
  | _ -> failwith "DT: impossible branch"
) in (let sigRefs = (match (binding).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__94) -> ((v_exprRefs valueScope) (dtb__94).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in ((B_dData_dList.v_append ((v_patRefs scope) pat)) ((B_dData_dList.v_append valueRefs) sigRefs)))))))
# 194 "Vuna/Compiler/Frontend/Refs.vuna"
and v_localClauseRefs = (fun (scope : string B_dData_dList.t_List) (clause : Frontend_dAst.t_LocalClause) -> (let pats = (clause).Frontend_dAst.f_LocalClause_lcPats in ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_patRefs scope)) pats)) ((v_exprRefs ((B_dData_dList.v_append (v_bindersOfPats pats)) scope)) (clause).Frontend_dAst.f_LocalClause_lcBody))))
# 202 "Vuna/Compiler/Frontend/Refs.vuna"
and v_altRefs = (fun (scope : string B_dData_dList.t_List) (alt : Frontend_dAst.t_Alt) -> (let pat = (alt).Frontend_dAst.f_Alt_altPat in ((B_dData_dList.v_append ((v_patRefs scope) pat)) ((v_exprRefs ((B_dData_dList.v_append (v_patBinders pat)) scope)) (alt).Frontend_dAst.f_Alt_altBody))))
# 208 "Vuna/Compiler/Frontend/Refs.vuna"
and v_fieldValueRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> ((v_exprRefs mc0) dtb__98)
  | _ -> failwith "DT: impossible branch"
))
# 211 "Vuna/Compiler/Frontend/Refs.vuna"
and v_interpRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__99) -> ((v_exprRefs mc0) dtb__99)
  | Frontend_dAst.C_InterpPart_IPText (dtb__100) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 215 "Vuna/Compiler/Frontend/Refs.vuna"
and v_stmtsRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> ((B_dData_dList.v_append ((v_stmtRefs mc0) dtb__101)) ((v_stmtsRefs ((v_scopeOfStmt mc0) dtb__101)) dtb__102))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 220 "Vuna/Compiler/Frontend/Refs.vuna"
and v_stmtRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__103, dtb__104) -> ((v_exprRefs mc0) dtb__103)
  | Frontend_dAst.C_DoStmt_DLet (dtb__105, dtb__106) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__105)) mc0) in ((B_dData_dList.v_concatMap ((v_bindingRefs bound) mc0)) dtb__105))
  | Frontend_dAst.C_DoStmt_DBind (dtb__107, dtb__108, dtb__109) -> ((B_dData_dList.v_append ((v_patRefs mc0) dtb__107)) ((v_exprRefs mc0) dtb__108))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Frontend/Refs.vuna"
let v_annotateExpr = (fun (e : Frontend_dAst.t_Expr) -> ((v_foldRefs ((v_exprRefs B_dData_dList.C_List_Nil) e)) v_emptyRefTable))

# 125 "Vuna/Compiler/Frontend/Refs.vuna"
let v_ctorRefs = (fun (scope : string B_dData_dList.t_List) (ctor : Frontend_dAst.t_Ctor) -> ((v_exprRefs scope) (ctor).Frontend_dAst.f_Ctor_ctorType))

# 128 "Vuna/Compiler/Frontend/Refs.vuna"
let v_fieldRefs = (fun (scope : string B_dData_dList.t_List) (field : Frontend_dAst.t_Field) -> ((v_exprRefs scope) (field).Frontend_dAst.f_Field_fieldType))

# 131 "Vuna/Compiler/Frontend/Refs.vuna"
let v_traitMethodRefs = (fun (scope : string B_dData_dList.t_List) (method_ : Frontend_dAst.t_TraitMethod) -> ((v_exprRefs scope) (method_).Frontend_dAst.f_TraitMethod_traitMethodType))

# 134 "Vuna/Compiler/Frontend/Refs.vuna"
let v_traitParamRefs = (fun (scope : string B_dData_dList.t_List) (param : Frontend_dAst.t_TraitParam) -> (match (param).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> ((v_exprRefs scope) dtb__110)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Frontend/Refs.vuna"
let v_astTraitParamName = (fun (p : Frontend_dAst.t_TraitParam) -> (p).Frontend_dAst.f_TraitParam_traitParamName)

# 101 "Vuna/Compiler/Frontend/Refs.vuna"
let rec v_declRefs = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__111, dtb__112, dtb__113, dtb__114) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_exprRefs mc0)) dtb__111)) ((B_dData_dList.v_append ((v_exprRefs mc0) dtb__112)) ((B_dData_dList.v_concatMap (v_declRefs mc0)) dtb__113)))
  | Frontend_dAst.C_Decl_DTrait (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_map v_astTraitParamName) dtb__116)) mc0) in ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_traitParamRefs bound)) dtb__116)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_exprRefs bound)) dtb__117)) ((B_dData_dList.v_concatMap (v_traitMethodRefs bound)) dtb__118))))
  | Frontend_dAst.C_Decl_DRecord (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> ((B_dData_dList.v_concatMap (v_fieldRefs ((B_dData_dList.v_append dtb__121) mc0))) dtb__122)
  | Frontend_dAst.C_Decl_DFun (dtb__128, dtb__129, dtb__130, dtb__131) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_patRefs mc0)) dtb__129)) ((v_exprRefs ((B_dData_dList.v_append (v_bindersOfPats dtb__129)) mc0)) dtb__130))
  | Frontend_dAst.C_Decl_DSig (dtb__132, dtb__133, dtb__134, dtb__135) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_exprRefs mc0)) dtb__133)) ((v_exprRefs mc0) dtb__134))
  | Frontend_dAst.C_Decl_DExtern (dtb__136, dtb__137, dtb__138, dtb__139) -> ((v_exprRefs mc0) dtb__138)
  | Frontend_dAst.C_Decl_DAxiom (dtb__140, dtb__141, dtb__142) -> ((v_exprRefs mc0) dtb__141)
  | Frontend_dAst.C_Decl_DData (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> (let bound = ((B_dData_dList.v_append dtb__144) mc0) in ((B_dData_dList.v_append ((v_exprRefs bound) dtb__145)) ((B_dData_dList.v_concatMap (v_ctorRefs bound)) dtb__146)))
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Frontend/Refs.vuna"
let rec v_declsRefs = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> ((B_dData_dList.v_append ((v_declRefs B_dData_dList.C_List_Nil) dtb__152)) (v_declsRefs dtb__153))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Refs.vuna"
let v_annotateDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_foldRefs (v_declsRefs decls)) v_emptyRefTable))

# 27 "Vuna/Compiler/Frontend/Refs.vuna"
let v_anRefs = (fun (p : t_Annot) -> (let dtb__154 = p in dtb__154))
