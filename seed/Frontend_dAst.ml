open Vuna_runtime
type t_NodeRef = { f_NodeRef_nodeRefId : int; f_NodeRef_nodeRefSpan : Base_dSource.t_Span }
and t_Field = { f_Field_fieldName : string; f_Field_fieldType : t_Expr; f_Field_fieldRef : t_NodeRef }
and t_TraitMethod = { f_TraitMethod_traitMethodName : string; f_TraitMethod_traitMethodType : t_Expr; f_TraitMethod_traitMethodRef : t_NodeRef }
and t_TraitParam = { f_TraitParam_traitParamName : string; f_TraitParam_traitParamKind : t_Expr B_dData_dMaybe.t_Maybe }
and t_Pat = C_Pat_PVar of (string) * (t_NodeRef) | C_Pat_PAs of (string) * (t_Pat) * (t_NodeRef) | C_Pat_PWild of (t_NodeRef) | C_Pat_PCon of (string) * (t_Pat B_dData_dList.t_List) * (t_NodeRef) | C_Pat_PInt of (int) * (t_NodeRef) | C_Pat_PStr of (string) * (t_NodeRef) | C_Pat_PRecord of (string) * ((string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef)
and t_InterpPart = C_InterpPart_IPText of (string) | C_InterpPart_IPHole of (t_Expr)
and t_Qty = C_Qty_Q0 | C_Qty_Q1
and t_ReprTier = C_ReprTier_ReprAuto | C_ReprTier_ReprAlias | C_ReprTier_ReprBoxed
and t_LocalClause = { f_LocalClause_lcPats : t_Pat B_dData_dList.t_List; f_LocalClause_lcBody : t_Expr; f_LocalClause_lcRef : t_NodeRef; f_LocalClause_lcHead : t_NodeRef }
and t_Alt = { f_Alt_altPat : t_Pat; f_Alt_altBody : t_Expr; f_Alt_altRef : t_NodeRef }
and t_BindingSig = { f_BindingSig_sigType : t_Expr; f_BindingSig_sigRef : t_NodeRef }
and t_BindingValue = C_BindingValue_BVal of (t_Expr) | C_BindingValue_BClauses of (t_LocalClause B_dData_dList.t_List)
and t_Binding = { f_Binding_bindPat : t_Pat; f_Binding_bindValue : t_BindingValue; f_Binding_bindSig : t_BindingSig B_dData_dMaybe.t_Maybe; f_Binding_bindRef : t_NodeRef }
and t_Expr = C_Expr_EVar of (string) * (t_NodeRef) | C_Expr_EInt of (int) * (t_NodeRef) | C_Expr_EStr of (string) * (t_NodeRef) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EPi of (string) * (bool) * (t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_ELet of (t_Binding B_dData_dList.t_List) * (t_Expr) * (bool) * (t_NodeRef) | C_Expr_ECase of (t_Expr) * (t_Alt B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EField of (t_Expr) * (string) * (t_NodeRef) | C_Expr_ERecord of (string) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EInterp of (t_InterpPart B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EFloat of (string) * (t_NodeRef)
and t_FixityDecl = { f_FixityDecl_fixityOp : string; f_FixityDecl_fixityLevel : int; f_FixityDecl_fixityAssoc : int; f_FixityDecl_fixityRef : t_NodeRef }
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (t_NodeRef) | C_DoStmt_DExpr of (t_Expr) * (t_NodeRef) | C_DoStmt_DLet of (t_Binding B_dData_dList.t_List) * (t_NodeRef)
and t_Ctor = { f_Ctor_ctorName : string; f_Ctor_ctorType : t_Expr; f_Ctor_ctorArity : int; f_Ctor_ctorRef : t_NodeRef }
and t_Decl = C_Decl_DData of (string) * (string B_dData_dList.t_List) * (t_Expr) * (t_Ctor B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (t_ReprTier) * (bool) * (t_NodeRef) | C_Decl_DAxiom of (string) * (t_Expr) * (t_NodeRef) | C_Decl_DExtern of (string) * (string) * (t_Expr) * (t_NodeRef) | C_Decl_DSig of (string) * (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Decl_DFun of (string) * (t_Pat B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Decl_DRecord of (string) * (string B_dData_dList.t_List) * (t_Field B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (t_ReprTier) * (bool) * (t_NodeRef) | C_Decl_DTrait of (string) * (t_TraitParam B_dData_dList.t_List) * (t_Expr B_dData_dList.t_List) * (t_TraitMethod B_dData_dList.t_List) * (t_NodeRef) | C_Decl_DInstance of (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_Decl B_dData_dList.t_List) * (t_NodeRef)
and t_ExportItem = C_ExportItem_XBare of (string) * (t_NodeRef) | C_ExportItem_XTypeAll of (string) * (t_NodeRef) | C_ExportItem_XTypeSome of (string) * (string B_dData_dList.t_List) * (t_NodeRef) | C_ExportItem_XModule of (string) * (t_NodeRef) | C_ExportItem_XNamespace of (string) * (string B_dData_dMaybe.t_Maybe) * (t_NodeRef)
and t_ExportMembers = C_ExportMembers_EMNone | C_ExportMembers_EMAll | C_ExportMembers_EMOnly of (string B_dData_dList.t_List)
and t_ExportSpec = C_ExportSpec_ESValue of (string) * (Base_dSource.t_Span) | C_ExportSpec_ESType of (string) * (t_ExportMembers) * (Base_dSource.t_Span)
and t_Opacity = C_Opacity_OpacityOpaque | C_Opacity_OpacityTransparent | C_Opacity_OpacityAbstract
and t_OpacitySpec = { f_OpacitySpec_opacityName : string; f_OpacitySpec_opacityKind : t_Opacity; f_OpacitySpec_opacitySpan : Base_dSource.t_Span }
and t_ModDecl = { f_ModDecl_modDeclName : string; f_ModDecl_modDeclHasExportList : bool; f_ModDecl_modDeclExportItems : t_ExportItem B_dData_dList.t_List; f_ModDecl_modDeclExports : t_ExportSpec B_dData_dList.t_List; f_ModDecl_modDeclReexports : t_ExportItem B_dData_dList.t_List; f_ModDecl_modDeclOpacity : t_OpacitySpec B_dData_dList.t_List; f_ModDecl_modDeclRef : t_NodeRef }
and t_SourceFile = { f_SourceFile_sourceFileModDecl : t_ModDecl B_dData_dMaybe.t_Maybe; f_SourceFile_sourceFileImports : t_Import B_dData_dList.t_List; f_SourceFile_sourceFileFixities : t_FixityDecl B_dData_dList.t_List; f_SourceFile_sourceFileDecls : t_Decl B_dData_dList.t_List; f_SourceFile_sourceFileExports : t_ExportSpec B_dData_dList.t_List; f_SourceFile_sourceFileReexports : t_ExportItem B_dData_dList.t_List; f_SourceFile_sourceFileOpacity : t_OpacitySpec B_dData_dList.t_List }
and t_Import = { f_Import_importName : string; f_Import_importIsQualified : bool; f_Import_importAlias : string B_dData_dMaybe.t_Maybe; f_Import_importRef : t_NodeRef }

# 21 "Vuna/Compiler/Frontend/Ast.vuna"
let v_noNodeRef = { f_NodeRef_nodeRefId = (0 - 1); f_NodeRef_nodeRefSpan = Base_dSource.v_spanEmpty }

# 25 "Vuna/Compiler/Frontend/Ast.vuna"
let v_detachedNodeRef = (fun (dtb_u_u1 : Base_dSource.t_Span) -> { f_NodeRef_nodeRefId = (0 - 1); f_NodeRef_nodeRefSpan = dtb_u_u1 })

# 37 "Vuna/Compiler/Frontend/Ast.vuna"
let v_synthNodeIdBase = 1099511627776

# 45 "Vuna/Compiler/Frontend/Ast.vuna"
let v_synthRefAt = (fun (dtb_u_u2 : Base_dSource.t_Span) -> { f_NodeRef_nodeRefId = (v_synthNodeIdBase + (Base_dSource.v_spanStartOffset dtb_u_u2)); f_NodeRef_nodeRefSpan = dtb_u_u2 })

# 96 "Vuna/Compiler/Frontend/Ast.vuna"
let v_qtyIsZero = (fun (dtb_u_u3 : t_Qty) -> (match dtb_u_u3 with
  | C_Qty_Q1 -> false
  | C_Qty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Frontend/Ast.vuna"
let v_reprPrefix = (fun (dtb_u_u4 : t_ReprTier) -> (match dtb_u_u4 with
  | C_ReprTier_ReprBoxed -> "boxed "
  | C_ReprTier_ReprAlias -> "alias "
  | C_ReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecName = (fun (dtb_u_u5 : t_ExportSpec) -> (match dtb_u_u5 with
  | C_ExportSpec_ESType (dtb_u_u6, dtb_u_u7, dtb_u_u8) -> dtb_u_u6
  | C_ExportSpec_ESValue (dtb_u_u9, dtb_u_u10) -> dtb_u_u9
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecSpan = (fun (dtb_u_u11 : t_ExportSpec) -> (match dtb_u_u11 with
  | C_ExportSpec_ESType (dtb_u_u12, dtb_u_u13, dtb_u_u14) -> dtb_u_u14
  | C_ExportSpec_ESValue (dtb_u_u15, dtb_u_u16) -> dtb_u_u16
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecName = (fun (dtb_u_u17 : t_OpacitySpec) -> (match dtb_u_u17 with
  | { f_OpacitySpec_opacityName = dtb_u_u18; f_OpacitySpec_opacityKind = dtb_u_u19; f_OpacitySpec_opacitySpan = dtb_u_u20 } -> dtb_u_u18
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecSpan = (fun (dtb_u_u21 : t_OpacitySpec) -> (match dtb_u_u21 with
  | { f_OpacitySpec_opacityName = dtb_u_u22; f_OpacitySpec_opacityKind = dtb_u_u23; f_OpacitySpec_opacitySpan = dtb_u_u24 } -> dtb_u_u24
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatRef = (fun (dtb_u_u25 : t_NodeRef) (dtb_u_u26 : t_Pat) -> (match dtb_u_u26 with
  | C_Pat_PRecord (dtb_u_u27, dtb_u_u28, dtb_u_u29) -> (C_Pat_PRecord (dtb_u_u27, dtb_u_u28, dtb_u_u25))
  | C_Pat_PStr (dtb_u_u30, dtb_u_u31) -> (C_Pat_PStr (dtb_u_u30, dtb_u_u25))
  | C_Pat_PInt (dtb_u_u32, dtb_u_u33) -> (C_Pat_PInt (dtb_u_u32, dtb_u_u25))
  | C_Pat_PCon (dtb_u_u34, dtb_u_u35, dtb_u_u36) -> (C_Pat_PCon (dtb_u_u34, dtb_u_u35, dtb_u_u25))
  | C_Pat_PWild (dtb_u_u37) -> (C_Pat_PWild (dtb_u_u25))
  | C_Pat_PAs (dtb_u_u38, dtb_u_u39, dtb_u_u40) -> (C_Pat_PAs (dtb_u_u38, dtb_u_u39, dtb_u_u25))
  | C_Pat_PVar (dtb_u_u41, dtb_u_u42) -> (C_Pat_PVar (dtb_u_u41, dtb_u_u25))
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patRef = (fun (dtb_u_u43 : t_Pat) -> (match dtb_u_u43 with
  | C_Pat_PRecord (dtb_u_u44, dtb_u_u45, dtb_u_u46) -> dtb_u_u46
  | C_Pat_PStr (dtb_u_u47, dtb_u_u48) -> dtb_u_u48
  | C_Pat_PInt (dtb_u_u49, dtb_u_u50) -> dtb_u_u50
  | C_Pat_PCon (dtb_u_u51, dtb_u_u52, dtb_u_u53) -> dtb_u_u53
  | C_Pat_PWild (dtb_u_u54) -> dtb_u_u54
  | C_Pat_PAs (dtb_u_u55, dtb_u_u56, dtb_u_u57) -> dtb_u_u57
  | C_Pat_PVar (dtb_u_u58, dtb_u_u59) -> dtb_u_u59
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_fieldPatOf = (fun (dtb_u_u60 : string) (dtb_u_u61 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u61 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u62, dtb_u_u63) -> (match dtb_u_u62 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u64; B_dData_dPair.f_Pair_second = dtb_u_u65 } -> (if (dtb_u_u64 = dtb_u_u60) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u65)) else ((v_fieldPatOf dtb_u_u60) dtb_u_u63))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_patSubsumes = (fun (dtb_u_u66 : t_Pat) (dtb_u_u67 : t_Pat) -> (match dtb_u_u66 with
  | C_Pat_PRecord (dtb_u_u68, dtb_u_u69, dtb_u_u70) -> (match dtb_u_u67 with
  | C_Pat_PRecord (dtb_u_u71, dtb_u_u72, dtb_u_u73) -> (if (dtb_u_u68 = dtb_u_u71) then ((v_subsumePatFields dtb_u_u69) dtb_u_u72) else false)
  | C_Pat_PAs (dtb_u_u74, dtb_u_u75, dtb_u_u76) -> ((v_patSubsumes dtb_u_u66) dtb_u_u75)
  | _ -> false
)
  | C_Pat_PStr (dtb_u_u77, dtb_u_u78) -> (match dtb_u_u67 with
  | C_Pat_PStr (dtb_u_u79, dtb_u_u80) -> (dtb_u_u77 = dtb_u_u79)
  | C_Pat_PAs (dtb_u_u81, dtb_u_u82, dtb_u_u83) -> ((v_patSubsumes dtb_u_u66) dtb_u_u82)
  | _ -> false
)
  | C_Pat_PInt (dtb_u_u84, dtb_u_u85) -> (match dtb_u_u67 with
  | C_Pat_PInt (dtb_u_u86, dtb_u_u87) -> (dtb_u_u84 = dtb_u_u86)
  | C_Pat_PAs (dtb_u_u88, dtb_u_u89, dtb_u_u90) -> ((v_patSubsumes dtb_u_u66) dtb_u_u89)
  | _ -> false
)
  | C_Pat_PCon (dtb_u_u91, dtb_u_u92, dtb_u_u93) -> (match dtb_u_u67 with
  | C_Pat_PCon (dtb_u_u94, dtb_u_u95, dtb_u_u96) -> (if (dtb_u_u91 = dtb_u_u94) then ((v_subsumePatList dtb_u_u92) dtb_u_u95) else false)
  | C_Pat_PAs (dtb_u_u97, dtb_u_u98, dtb_u_u99) -> ((v_patSubsumes dtb_u_u66) dtb_u_u98)
  | _ -> false
)
  | C_Pat_PAs (dtb_u_u100, dtb_u_u101, dtb_u_u102) -> ((v_patSubsumes dtb_u_u101) dtb_u_u67)
  | C_Pat_PWild (dtb_u_u103) -> true
  | C_Pat_PVar (dtb_u_u104, dtb_u_u105) -> true
  | _ -> failwith "DT: impossible branch"
))
# 363 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatList = (fun (dtb_u_u106 : t_Pat B_dData_dList.t_List) (dtb_u_u107 : t_Pat B_dData_dList.t_List) -> (match dtb_u_u106 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109) -> (match dtb_u_u107 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (if ((v_patSubsumes dtb_u_u108) dtb_u_u110) then ((v_subsumePatList dtb_u_u109) dtb_u_u111) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u107 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 369 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatFields = (fun (dtb_u_u112 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u113 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u112 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u114, dtb_u_u115) -> (match dtb_u_u114 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u116; B_dData_dPair.f_Pair_second = dtb_u_u117 } -> (match ((v_fieldPatOf dtb_u_u116) dtb_u_u113) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u118) -> (if ((v_patSubsumes dtb_u_u117) dtb_u_u118) then ((v_subsumePatFields dtb_u_u115) dtb_u_u113) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_subsumePatFields dtb_u_u115) dtb_u_u113)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clauseSubsumedBy = (fun (dtb_u_u119 : t_Pat B_dData_dList.t_List) (dtb_u_u120 : t_Pat B_dData_dList.t_List) -> ((v_subsumePatList dtb_u_u119) dtb_u_u120))

# 398 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprRef = (fun (dtb_u_u121 : t_NodeRef) (dtb_u_u122 : t_Expr) -> (match dtb_u_u122 with
  | C_Expr_EInterp (dtb_u_u123, dtb_u_u124) -> (C_Expr_EInterp (dtb_u_u123, dtb_u_u121))
  | C_Expr_EDo (dtb_u_u125, dtb_u_u126) -> (C_Expr_EDo (dtb_u_u125, dtb_u_u121))
  | C_Expr_ERecUpdate (dtb_u_u127, dtb_u_u128, dtb_u_u129) -> (C_Expr_ERecUpdate (dtb_u_u127, dtb_u_u128, dtb_u_u121))
  | C_Expr_ERecord (dtb_u_u130, dtb_u_u131, dtb_u_u132) -> (C_Expr_ERecord (dtb_u_u130, dtb_u_u131, dtb_u_u121))
  | C_Expr_EField (dtb_u_u133, dtb_u_u134, dtb_u_u135) -> (C_Expr_EField (dtb_u_u133, dtb_u_u134, dtb_u_u121))
  | C_Expr_EIf (dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u139) -> (C_Expr_EIf (dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u121))
  | C_Expr_ECase (dtb_u_u140, dtb_u_u141, dtb_u_u142) -> (C_Expr_ECase (dtb_u_u140, dtb_u_u141, dtb_u_u121))
  | C_Expr_ELet (dtb_u_u143, dtb_u_u144, dtb_u_u145, dtb_u_u146) -> (C_Expr_ELet (dtb_u_u143, dtb_u_u144, dtb_u_u145, dtb_u_u121))
  | C_Expr_EPi (dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u152) -> (C_Expr_EPi (dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u121))
  | C_Expr_EApp (dtb_u_u153, dtb_u_u154, dtb_u_u155) -> (C_Expr_EApp (dtb_u_u153, dtb_u_u154, dtb_u_u121))
  | C_Expr_ELam (dtb_u_u156, dtb_u_u157, dtb_u_u158) -> (C_Expr_ELam (dtb_u_u156, dtb_u_u157, dtb_u_u121))
  | C_Expr_EFloat (dtb_u_u159, dtb_u_u160) -> (C_Expr_EFloat (dtb_u_u159, dtb_u_u121))
  | C_Expr_EStr (dtb_u_u161, dtb_u_u162) -> (C_Expr_EStr (dtb_u_u161, dtb_u_u121))
  | C_Expr_EInt (dtb_u_u163, dtb_u_u164) -> (C_Expr_EInt (dtb_u_u163, dtb_u_u121))
  | C_Expr_EVar (dtb_u_u165, dtb_u_u166) -> (C_Expr_EVar (dtb_u_u165, dtb_u_u121))
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprRef = (fun (dtb_u_u167 : t_Expr) -> (match dtb_u_u167 with
  | C_Expr_EInterp (dtb_u_u168, dtb_u_u169) -> dtb_u_u169
  | C_Expr_EDo (dtb_u_u170, dtb_u_u171) -> dtb_u_u171
  | C_Expr_ERecUpdate (dtb_u_u172, dtb_u_u173, dtb_u_u174) -> dtb_u_u174
  | C_Expr_ERecord (dtb_u_u175, dtb_u_u176, dtb_u_u177) -> dtb_u_u177
  | C_Expr_EField (dtb_u_u178, dtb_u_u179, dtb_u_u180) -> dtb_u_u180
  | C_Expr_EIf (dtb_u_u181, dtb_u_u182, dtb_u_u183, dtb_u_u184) -> dtb_u_u184
  | C_Expr_ECase (dtb_u_u185, dtb_u_u186, dtb_u_u187) -> dtb_u_u187
  | C_Expr_ELet (dtb_u_u188, dtb_u_u189, dtb_u_u190, dtb_u_u191) -> dtb_u_u191
  | C_Expr_EPi (dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195, dtb_u_u196, dtb_u_u197) -> dtb_u_u197
  | C_Expr_EApp (dtb_u_u198, dtb_u_u199, dtb_u_u200) -> dtb_u_u200
  | C_Expr_ELam (dtb_u_u201, dtb_u_u202, dtb_u_u203) -> dtb_u_u203
  | C_Expr_EFloat (dtb_u_u204, dtb_u_u205) -> dtb_u_u205
  | C_Expr_EStr (dtb_u_u206, dtb_u_u207) -> dtb_u_u207
  | C_Expr_EInt (dtb_u_u208, dtb_u_u209) -> dtb_u_u209
  | C_Expr_EVar (dtb_u_u210, dtb_u_u211) -> dtb_u_u211
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtRef = (fun (dtb_u_u212 : t_DoStmt) -> (match dtb_u_u212 with
  | C_DoStmt_DLet (dtb_u_u213, dtb_u_u214) -> dtb_u_u214
  | C_DoStmt_DExpr (dtb_u_u215, dtb_u_u216) -> dtb_u_u216
  | C_DoStmt_DBind (dtb_u_u217, dtb_u_u218, dtb_u_u219) -> dtb_u_u219
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declRef = (fun (dtb_u_u220 : t_Decl) -> (match dtb_u_u220 with
  | C_Decl_DInstance (dtb_u_u221, dtb_u_u222, dtb_u_u223, dtb_u_u224) -> dtb_u_u224
  | C_Decl_DTrait (dtb_u_u225, dtb_u_u226, dtb_u_u227, dtb_u_u228, dtb_u_u229) -> dtb_u_u229
  | C_Decl_DRecord (dtb_u_u230, dtb_u_u231, dtb_u_u232, dtb_u_u233, dtb_u_u234, dtb_u_u235, dtb_u_u236, dtb_u_u237) -> dtb_u_u237
  | C_Decl_DFun (dtb_u_u238, dtb_u_u239, dtb_u_u240, dtb_u_u241) -> dtb_u_u241
  | C_Decl_DSig (dtb_u_u242, dtb_u_u243, dtb_u_u244, dtb_u_u245) -> dtb_u_u245
  | C_Decl_DExtern (dtb_u_u246, dtb_u_u247, dtb_u_u248, dtb_u_u249) -> dtb_u_u249
  | C_Decl_DAxiom (dtb_u_u250, dtb_u_u251, dtb_u_u252) -> dtb_u_u252
  | C_Decl_DData (dtb_u_u253, dtb_u_u254, dtb_u_u255, dtb_u_u256, dtb_u_u257, dtb_u_u258, dtb_u_u259, dtb_u_u260, dtb_u_u261) -> dtb_u_u261
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemRef = (fun (dtb_u_u262 : t_ExportItem) -> (match dtb_u_u262 with
  | C_ExportItem_XNamespace (dtb_u_u263, dtb_u_u264, dtb_u_u265) -> dtb_u_u265
  | C_ExportItem_XModule (dtb_u_u266, dtb_u_u267) -> dtb_u_u267
  | C_ExportItem_XTypeSome (dtb_u_u268, dtb_u_u269, dtb_u_u270) -> dtb_u_u270
  | C_ExportItem_XTypeAll (dtb_u_u271, dtb_u_u272) -> dtb_u_u272
  | C_ExportItem_XBare (dtb_u_u273, dtb_u_u274) -> dtb_u_u274
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExportItemRef = (fun (dtb_u_u275 : t_NodeRef) (dtb_u_u276 : t_ExportItem) -> (match dtb_u_u276 with
  | C_ExportItem_XNamespace (dtb_u_u277, dtb_u_u278, dtb_u_u279) -> (C_ExportItem_XNamespace (dtb_u_u277, dtb_u_u278, dtb_u_u275))
  | C_ExportItem_XModule (dtb_u_u280, dtb_u_u281) -> (C_ExportItem_XModule (dtb_u_u280, dtb_u_u275))
  | C_ExportItem_XTypeSome (dtb_u_u282, dtb_u_u283, dtb_u_u284) -> (C_ExportItem_XTypeSome (dtb_u_u282, dtb_u_u283, dtb_u_u275))
  | C_ExportItem_XTypeAll (dtb_u_u285, dtb_u_u286) -> (C_ExportItem_XTypeAll (dtb_u_u285, dtb_u_u275))
  | C_ExportItem_XBare (dtb_u_u287, dtb_u_u288) -> (C_ExportItem_XBare (dtb_u_u287, dtb_u_u275))
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Frontend/Ast.vuna"
let[@tail_mod_cons] rec v_collectClauses = (fun (dtb_u_u289 : t_Decl B_dData_dList.t_List) (dtb_u_u290 : string) -> (match dtb_u_u289 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u291, dtb_u_u292) -> (match dtb_u_u291 with
  | C_Decl_DFun (dtb_u_u293, dtb_u_u294, dtb_u_u295, dtb_u_u296) -> (if (dtb_u_u293 = dtb_u_u290) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u294; B_dData_dPair.f_Pair_second = dtb_u_u295 }, ((v_collectClauses dtb_u_u292) dtb_u_u290))) else ((v_collectClauses dtb_u_u292) dtb_u_u290))
  | _ -> ((v_collectClauses dtb_u_u292) dtb_u_u290)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clausesFor = (fun (dtb_u_u297 : t_Decl B_dData_dList.t_List) (dtb_u_u298 : string) -> ((v_collectClauses dtb_u_u297) dtb_u_u298))

# 498 "Vuna/Compiler/Frontend/Ast.vuna"
let v_funArity = (fun (dtb_u_u299 : string) (dtb_u_u300 : t_Decl B_dData_dList.t_List) -> (let dtb_u_u301 = ((v_clausesFor dtb_u_u300) dtb_u_u299) in (match dtb_u_u301 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u302, dtb_u_u303) -> (match dtb_u_u302 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u304; B_dData_dPair.f_Pair_second = dtb_u_u305 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb_u_u304)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 507 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorShortName = (fun (dtb_u_u306 : string) -> (Base_dSource.v_lastSeg dtb_u_u306))

# 513 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorDisplayName = (fun (dtb_u_u307 : string) -> (let dtb_u_u308 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u307)) in (match dtb_u_u308 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u309; B_dData_dPair.f_Pair_second = dtb_u_u310 } -> (match dtb_u_u309 with
  | B_dData_dList.C_List_Nil -> dtb_u_u310
  | _ -> (match (B_dData_dList.v_reverse dtb_u_u309) with
  | B_dData_dList.C_List_Nil -> dtb_u_u310
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u311, dtb_u_u312) -> (String.concat "" [dtb_u_u311; "."; dtb_u_u310])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 522 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_typeArity = (fun (dtb_u_u313 : t_Expr) -> (match dtb_u_u313 with
  | C_Expr_EApp (dtb_u_u314, dtb_u_u315, dtb_u_u316) -> (match dtb_u_u314 with
  | C_Expr_EVar (dtb_u_u317, dtb_u_u318) -> (if (dtb_u_u317 = "->") then (match dtb_u_u315 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u319, dtb_u_u320) -> (match dtb_u_u320 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u321, dtb_u_u322) -> (match dtb_u_u322 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb_u_u321))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
))

# 588 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declTypeNames = (fun (dtb_u_u323 : t_Decl) -> (match dtb_u_u323 with
  | C_Decl_DInstance (dtb_u_u324, dtb_u_u325, dtb_u_u326, dtb_u_u327) -> B_dData_dList.C_List_Nil
  | C_Decl_DSig (dtb_u_u328, dtb_u_u329, dtb_u_u330, dtb_u_u331) -> B_dData_dList.C_List_Nil
  | C_Decl_DExtern (dtb_u_u332, dtb_u_u333, dtb_u_u334, dtb_u_u335) -> B_dData_dList.C_List_Nil
  | C_Decl_DAxiom (dtb_u_u336, dtb_u_u337, dtb_u_u338) -> B_dData_dList.C_List_Nil
  | C_Decl_DFun (dtb_u_u339, dtb_u_u340, dtb_u_u341, dtb_u_u342) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb_u_u343, dtb_u_u344, dtb_u_u345, dtb_u_u346, dtb_u_u347) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u343, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb_u_u348, dtb_u_u349, dtb_u_u350, dtb_u_u351, dtb_u_u352, dtb_u_u353, dtb_u_u354, dtb_u_u355) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u348, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb_u_u356, dtb_u_u357, dtb_u_u358, dtb_u_u359, dtb_u_u360, dtb_u_u361, dtb_u_u362, dtb_u_u363, dtb_u_u364) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u356, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 598 "Vuna/Compiler/Frontend/Ast.vuna"
let v_typeNamesOf = (fun (dtb_u_u365 : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) dtb_u_u365))

# 601 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declDerivings = (fun (dtb_u_u366 : t_Decl) -> (match dtb_u_u366 with
  | C_Decl_DRecord (dtb_u_u367, dtb_u_u368, dtb_u_u369, dtb_u_u370, dtb_u_u371, dtb_u_u372, dtb_u_u373, dtb_u_u374) -> dtb_u_u370
  | C_Decl_DData (dtb_u_u375, dtb_u_u376, dtb_u_u377, dtb_u_u378, dtb_u_u379, dtb_u_u380, dtb_u_u381, dtb_u_u382, dtb_u_u383) -> dtb_u_u379
  | _ -> B_dData_dList.C_List_Nil
))

# 16 "Vuna/Compiler/Frontend/Ast.vuna"
let v_nodeRefId = (fun (dtb_u_u384 : t_NodeRef) -> (match dtb_u_u384 with
  | { f_NodeRef_nodeRefId = dtb_u_u385; f_NodeRef_nodeRefSpan = dtb_u_u386 } -> dtb_u_u385
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isSynthNodeRef = (fun (dtb_u_u387 : t_NodeRef) -> ((v_nodeRefId dtb_u_u387) >= v_synthNodeIdBase))

# 17 "Vuna/Compiler/Frontend/Ast.vuna"
let v_nodeRefSpan = (fun (dtb_u_u388 : t_NodeRef) -> (match dtb_u_u388 with
  | { f_NodeRef_nodeRefId = dtb_u_u389; f_NodeRef_nodeRefSpan = dtb_u_u390 } -> dtb_u_u390
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Ast.vuna"
let v_synthNodeRef = (fun (dtb_u_u391 : t_NodeRef) -> (v_synthRefAt (v_nodeRefSpan dtb_u_u391)))

# 58 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldSpan = (fun (dtb_u_u392 : t_Field) -> (v_nodeRefSpan (dtb_u_u392).f_Field_fieldRef))

# 68 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodSpan = (fun (dtb_u_u393 : t_TraitMethod) -> (v_nodeRefSpan (dtb_u_u393).f_TraitMethod_traitMethodRef))

# 194 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixitySpan = (fun (dtb_u_u394 : t_FixityDecl) -> (v_nodeRefSpan (dtb_u_u394).f_FixityDecl_fixityRef))

# 210 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorSpan = (fun (dtb_u_u395 : t_Ctor) -> (v_nodeRefSpan (dtb_u_u395).f_Ctor_ctorRef))

# 296 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclSpan = (fun (dtb_u_u396 : t_ModDecl) -> (v_nodeRefSpan (dtb_u_u396).f_ModDecl_modDeclRef))

# 311 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patSpan = (fun (dtb_u_u397 : t_Pat) -> (match dtb_u_u397 with
  | C_Pat_PRecord (dtb_u_u398, dtb_u_u399, dtb_u_u400) -> (v_nodeRefSpan dtb_u_u400)
  | C_Pat_PStr (dtb_u_u401, dtb_u_u402) -> (v_nodeRefSpan dtb_u_u402)
  | C_Pat_PInt (dtb_u_u403, dtb_u_u404) -> (v_nodeRefSpan dtb_u_u404)
  | C_Pat_PCon (dtb_u_u405, dtb_u_u406, dtb_u_u407) -> (v_nodeRefSpan dtb_u_u407)
  | C_Pat_PWild (dtb_u_u408) -> (v_nodeRefSpan dtb_u_u408)
  | C_Pat_PAs (dtb_u_u409, dtb_u_u410, dtb_u_u411) -> (v_nodeRefSpan dtb_u_u411)
  | C_Pat_PVar (dtb_u_u412, dtb_u_u413) -> (v_nodeRefSpan dtb_u_u413)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatId = (fun (dtb_u_u414 : int) (dtb_u_u415 : t_Pat) -> ((v_withPatRef { f_NodeRef_nodeRefId = dtb_u_u414; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_patRef dtb_u_u415)) }) dtb_u_u415))

# 386 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprSpan = (fun (dtb_u_u416 : t_Expr) -> (v_nodeRefSpan (v_exprRef dtb_u_u416)))

# 394 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprId = (fun (dtb_u_u417 : int) (dtb_u_u418 : t_Expr) -> ((v_withExprRef { f_NodeRef_nodeRefId = dtb_u_u417; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_exprRef dtb_u_u418)) }) dtb_u_u418))

# 433 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtSpan = (fun (dtb_u_u419 : t_DoStmt) -> (match dtb_u_u419 with
  | C_DoStmt_DLet (dtb_u_u420, dtb_u_u421) -> (v_nodeRefSpan dtb_u_u421)
  | C_DoStmt_DExpr (dtb_u_u422, dtb_u_u423) -> (v_nodeRefSpan dtb_u_u423)
  | C_DoStmt_DBind (dtb_u_u424, dtb_u_u425, dtb_u_u426) -> (v_nodeRefSpan dtb_u_u426)
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declSpan = (fun (dtb_u_u427 : t_Decl) -> (v_nodeRefSpan (v_declRef dtb_u_u427)))

# 464 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importSpan = (fun (dtb_u_u428 : t_Import) -> (v_nodeRefSpan (dtb_u_u428).f_Import_importRef))

# 484 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemSpan = (fun (dtb_u_u429 : t_ExportItem) -> (v_nodeRefSpan (v_exportItemRef dtb_u_u429)))

# 53 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldName = (fun (dtb_u_u430 : t_Field) -> (match dtb_u_u430 with
  | { f_Field_fieldName = dtb_u_u431; f_Field_fieldType = dtb_u_u432; f_Field_fieldRef = dtb_u_u433 } -> dtb_u_u431
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldType = (fun (dtb_u_u434 : t_Field) -> (match dtb_u_u434 with
  | { f_Field_fieldName = dtb_u_u435; f_Field_fieldType = dtb_u_u436; f_Field_fieldRef = dtb_u_u437 } -> dtb_u_u436
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldRef = (fun (dtb_u_u438 : t_Field) -> (match dtb_u_u438 with
  | { f_Field_fieldName = dtb_u_u439; f_Field_fieldType = dtb_u_u440; f_Field_fieldRef = dtb_u_u441 } -> dtb_u_u441
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodName = (fun (dtb_u_u442 : t_TraitMethod) -> (match dtb_u_u442 with
  | { f_TraitMethod_traitMethodName = dtb_u_u443; f_TraitMethod_traitMethodType = dtb_u_u444; f_TraitMethod_traitMethodRef = dtb_u_u445 } -> dtb_u_u443
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodType = (fun (dtb_u_u446 : t_TraitMethod) -> (match dtb_u_u446 with
  | { f_TraitMethod_traitMethodName = dtb_u_u447; f_TraitMethod_traitMethodType = dtb_u_u448; f_TraitMethod_traitMethodRef = dtb_u_u449 } -> dtb_u_u448
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodRef = (fun (dtb_u_u450 : t_TraitMethod) -> (match dtb_u_u450 with
  | { f_TraitMethod_traitMethodName = dtb_u_u451; f_TraitMethod_traitMethodType = dtb_u_u452; f_TraitMethod_traitMethodRef = dtb_u_u453 } -> dtb_u_u453
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitParamName = (fun (dtb_u_u454 : t_TraitParam) -> (match dtb_u_u454 with
  | { f_TraitParam_traitParamName = dtb_u_u455; f_TraitParam_traitParamKind = dtb_u_u456 } -> dtb_u_u455
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitParamKind = (fun (dtb_u_u457 : t_TraitParam) -> (match dtb_u_u457 with
  | { f_TraitParam_traitParamName = dtb_u_u458; f_TraitParam_traitParamKind = dtb_u_u459 } -> dtb_u_u459
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcPats = (fun (dtb_u_u460 : t_LocalClause) -> (match dtb_u_u460 with
  | { f_LocalClause_lcPats = dtb_u_u461; f_LocalClause_lcBody = dtb_u_u462; f_LocalClause_lcRef = dtb_u_u463; f_LocalClause_lcHead = dtb_u_u464 } -> dtb_u_u461
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcBody = (fun (dtb_u_u465 : t_LocalClause) -> (match dtb_u_u465 with
  | { f_LocalClause_lcPats = dtb_u_u466; f_LocalClause_lcBody = dtb_u_u467; f_LocalClause_lcRef = dtb_u_u468; f_LocalClause_lcHead = dtb_u_u469 } -> dtb_u_u467
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcRef = (fun (dtb_u_u470 : t_LocalClause) -> (match dtb_u_u470 with
  | { f_LocalClause_lcPats = dtb_u_u471; f_LocalClause_lcBody = dtb_u_u472; f_LocalClause_lcRef = dtb_u_u473; f_LocalClause_lcHead = dtb_u_u474 } -> dtb_u_u473
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcHead = (fun (dtb_u_u475 : t_LocalClause) -> (match dtb_u_u475 with
  | { f_LocalClause_lcPats = dtb_u_u476; f_LocalClause_lcBody = dtb_u_u477; f_LocalClause_lcRef = dtb_u_u478; f_LocalClause_lcHead = dtb_u_u479 } -> dtb_u_u479
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altPat = (fun (dtb_u_u480 : t_Alt) -> (match dtb_u_u480 with
  | { f_Alt_altPat = dtb_u_u481; f_Alt_altBody = dtb_u_u482; f_Alt_altRef = dtb_u_u483 } -> dtb_u_u481
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altBody = (fun (dtb_u_u484 : t_Alt) -> (match dtb_u_u484 with
  | { f_Alt_altPat = dtb_u_u485; f_Alt_altBody = dtb_u_u486; f_Alt_altRef = dtb_u_u487 } -> dtb_u_u486
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altRef = (fun (dtb_u_u488 : t_Alt) -> (match dtb_u_u488 with
  | { f_Alt_altPat = dtb_u_u489; f_Alt_altBody = dtb_u_u490; f_Alt_altRef = dtb_u_u491 } -> dtb_u_u491
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sigType = (fun (dtb_u_u492 : t_BindingSig) -> (match dtb_u_u492 with
  | { f_BindingSig_sigType = dtb_u_u493; f_BindingSig_sigRef = dtb_u_u494 } -> dtb_u_u493
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sigRef = (fun (dtb_u_u495 : t_BindingSig) -> (match dtb_u_u495 with
  | { f_BindingSig_sigType = dtb_u_u496; f_BindingSig_sigRef = dtb_u_u497 } -> dtb_u_u497
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindPat = (fun (dtb_u_u498 : t_Binding) -> (match dtb_u_u498 with
  | { f_Binding_bindPat = dtb_u_u499; f_Binding_bindValue = dtb_u_u500; f_Binding_bindSig = dtb_u_u501; f_Binding_bindRef = dtb_u_u502 } -> dtb_u_u499
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindValue = (fun (dtb_u_u503 : t_Binding) -> (match dtb_u_u503 with
  | { f_Binding_bindPat = dtb_u_u504; f_Binding_bindValue = dtb_u_u505; f_Binding_bindSig = dtb_u_u506; f_Binding_bindRef = dtb_u_u507 } -> dtb_u_u505
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindSig = (fun (dtb_u_u508 : t_Binding) -> (match dtb_u_u508 with
  | { f_Binding_bindPat = dtb_u_u509; f_Binding_bindValue = dtb_u_u510; f_Binding_bindSig = dtb_u_u511; f_Binding_bindRef = dtb_u_u512 } -> dtb_u_u511
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindRef = (fun (dtb_u_u513 : t_Binding) -> (match dtb_u_u513 with
  | { f_Binding_bindPat = dtb_u_u514; f_Binding_bindValue = dtb_u_u515; f_Binding_bindSig = dtb_u_u516; f_Binding_bindRef = dtb_u_u517 } -> dtb_u_u517
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityOp = (fun (dtb_u_u518 : t_FixityDecl) -> (match dtb_u_u518 with
  | { f_FixityDecl_fixityOp = dtb_u_u519; f_FixityDecl_fixityLevel = dtb_u_u520; f_FixityDecl_fixityAssoc = dtb_u_u521; f_FixityDecl_fixityRef = dtb_u_u522 } -> dtb_u_u519
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityLevel = (fun (dtb_u_u523 : t_FixityDecl) -> (match dtb_u_u523 with
  | { f_FixityDecl_fixityOp = dtb_u_u524; f_FixityDecl_fixityLevel = dtb_u_u525; f_FixityDecl_fixityAssoc = dtb_u_u526; f_FixityDecl_fixityRef = dtb_u_u527 } -> dtb_u_u525
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityAssoc = (fun (dtb_u_u528 : t_FixityDecl) -> (match dtb_u_u528 with
  | { f_FixityDecl_fixityOp = dtb_u_u529; f_FixityDecl_fixityLevel = dtb_u_u530; f_FixityDecl_fixityAssoc = dtb_u_u531; f_FixityDecl_fixityRef = dtb_u_u532 } -> dtb_u_u531
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityRef = (fun (dtb_u_u533 : t_FixityDecl) -> (match dtb_u_u533 with
  | { f_FixityDecl_fixityOp = dtb_u_u534; f_FixityDecl_fixityLevel = dtb_u_u535; f_FixityDecl_fixityAssoc = dtb_u_u536; f_FixityDecl_fixityRef = dtb_u_u537 } -> dtb_u_u537
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorName = (fun (dtb_u_u538 : t_Ctor) -> (match dtb_u_u538 with
  | { f_Ctor_ctorName = dtb_u_u539; f_Ctor_ctorType = dtb_u_u540; f_Ctor_ctorArity = dtb_u_u541; f_Ctor_ctorRef = dtb_u_u542 } -> dtb_u_u539
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_lookupCtorArity = (fun (dtb_u_u543 : string) (dtb_u_u544 : t_Ctor B_dData_dList.t_List) -> (match dtb_u_u544 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u545, dtb_u_u546) -> (if ((v_ctorName dtb_u_u545) = dtb_u_u543) then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u545).f_Ctor_ctorArity)) else ((v_lookupCtorArity dtb_u_u543) dtb_u_u546))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_declCtorArity = (fun (dtb_u_u547 : string) (dtb_u_u548 : t_Decl B_dData_dList.t_List) -> (match dtb_u_u548 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u549, dtb_u_u550) -> (match dtb_u_u549 with
  | C_Decl_DData (dtb_u_u551, dtb_u_u552, dtb_u_u553, dtb_u_u554, dtb_u_u555, dtb_u_u556, dtb_u_u557, dtb_u_u558, dtb_u_u559) -> (match ((v_lookupCtorArity dtb_u_u547) dtb_u_u554) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u560) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u560))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_declCtorArity dtb_u_u547) dtb_u_u550)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb_u_u561, dtb_u_u562, dtb_u_u563, dtb_u_u564, dtb_u_u565, dtb_u_u566, dtb_u_u567, dtb_u_u568) -> (if (dtb_u_u547 = dtb_u_u561) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb_u_u563))) else ((v_declCtorArity dtb_u_u547) dtb_u_u550))
  | C_Decl_DAxiom (dtb_u_u569, dtb_u_u570, dtb_u_u571) -> ((v_declCtorArity dtb_u_u569) dtb_u_u550)
  | C_Decl_DExtern (dtb_u_u572, dtb_u_u573, dtb_u_u574, dtb_u_u575) -> ((v_declCtorArity dtb_u_u572) dtb_u_u550)
  | C_Decl_DSig (dtb_u_u576, dtb_u_u577, dtb_u_u578, dtb_u_u579) -> ((v_declCtorArity dtb_u_u576) dtb_u_u550)
  | C_Decl_DFun (dtb_u_u580, dtb_u_u581, dtb_u_u582, dtb_u_u583) -> ((v_declCtorArity dtb_u_u580) dtb_u_u550)
  | C_Decl_DTrait (dtb_u_u584, dtb_u_u585, dtb_u_u586, dtb_u_u587, dtb_u_u588) -> ((v_declCtorArity dtb_u_u547) dtb_u_u550)
  | C_Decl_DInstance (dtb_u_u589, dtb_u_u590, dtb_u_u591, dtb_u_u592) -> ((v_declCtorArity dtb_u_u547) dtb_u_u550)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declNames = (fun (dtb_u_u593 : t_Decl) -> (match dtb_u_u593 with
  | C_Decl_DInstance (dtb_u_u594, dtb_u_u595, dtb_u_u596, dtb_u_u597) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb_u_u598, dtb_u_u599, dtb_u_u600, dtb_u_u601, dtb_u_u602) -> ((B_dData_dList.v_map v_traitMethodName) dtb_u_u601)
  | C_Decl_DRecord (dtb_u_u603, dtb_u_u604, dtb_u_u605, dtb_u_u606, dtb_u_u607, dtb_u_u608, dtb_u_u609, dtb_u_u610) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u603, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb_u_u611, dtb_u_u612, dtb_u_u613, dtb_u_u614, dtb_u_u615, dtb_u_u616, dtb_u_u617, dtb_u_u618, dtb_u_u619) -> ((B_dData_dList.v_map v_ctorName) dtb_u_u614)
  | C_Decl_DSig (dtb_u_u620, dtb_u_u621, dtb_u_u622, dtb_u_u623) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u620, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb_u_u624, dtb_u_u625, dtb_u_u626, dtb_u_u627) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u624, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb_u_u628, dtb_u_u629, dtb_u_u630) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u628, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb_u_u631, dtb_u_u632, dtb_u_u633, dtb_u_u634) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u631, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Frontend/Ast.vuna"
let v_topNames = (fun (dtb_u_u635 : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) dtb_u_u635))

# 564 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declAllNames = (fun (dtb_u_u636 : t_Decl) -> (match dtb_u_u636 with
  | C_Decl_DInstance (dtb_u_u637, dtb_u_u638, dtb_u_u639, dtb_u_u640) -> B_dData_dList.C_List_Nil
  | C_Decl_DSig (dtb_u_u641, dtb_u_u642, dtb_u_u643, dtb_u_u644) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u641, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb_u_u645, dtb_u_u646, dtb_u_u647, dtb_u_u648) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u645, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb_u_u649, dtb_u_u650, dtb_u_u651) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u649, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb_u_u652, dtb_u_u653, dtb_u_u654, dtb_u_u655) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u652, B_dData_dList.C_List_Nil))
  | C_Decl_DTrait (dtb_u_u656, dtb_u_u657, dtb_u_u658, dtb_u_u659, dtb_u_u660) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u656, ((B_dData_dList.v_map v_traitMethodName) dtb_u_u659)))
  | C_Decl_DRecord (dtb_u_u661, dtb_u_u662, dtb_u_u663, dtb_u_u664, dtb_u_u665, dtb_u_u666, dtb_u_u667, dtb_u_u668) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u661, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb_u_u669, dtb_u_u670, dtb_u_u671, dtb_u_u672, dtb_u_u673, dtb_u_u674, dtb_u_u675, dtb_u_u676, dtb_u_u677) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u669, ((B_dData_dList.v_map v_ctorName) dtb_u_u672)))
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Frontend/Ast.vuna"
let v__udeclCtors = (fun (dtb_u_u678 : t_Decl) -> (match dtb_u_u678 with
  | C_Decl_DInstance (dtb_u_u679, dtb_u_u680, dtb_u_u681, dtb_u_u682) -> B_dData_dList.C_List_Nil
  | C_Decl_DSig (dtb_u_u683, dtb_u_u684, dtb_u_u685, dtb_u_u686) -> B_dData_dList.C_List_Nil
  | C_Decl_DExtern (dtb_u_u687, dtb_u_u688, dtb_u_u689, dtb_u_u690) -> B_dData_dList.C_List_Nil
  | C_Decl_DAxiom (dtb_u_u691, dtb_u_u692, dtb_u_u693) -> B_dData_dList.C_List_Nil
  | C_Decl_DFun (dtb_u_u694, dtb_u_u695, dtb_u_u696, dtb_u_u697) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb_u_u698, dtb_u_u699, dtb_u_u700, dtb_u_u701, dtb_u_u702) -> ((B_dData_dList.v_map v_traitMethodName) dtb_u_u701)
  | C_Decl_DRecord (dtb_u_u703, dtb_u_u704, dtb_u_u705, dtb_u_u706, dtb_u_u707, dtb_u_u708, dtb_u_u709, dtb_u_u710) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u703, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb_u_u711, dtb_u_u712, dtb_u_u713, dtb_u_u714, dtb_u_u715, dtb_u_u716, dtb_u_u717, dtb_u_u718, dtb_u_u719) -> ((B_dData_dList.v_map v_ctorName) dtb_u_u714)
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorsOf = (fun (dtb_u_u720 : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) dtb_u_u720))

# 205 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorType = (fun (dtb_u_u721 : t_Ctor) -> (match dtb_u_u721 with
  | { f_Ctor_ctorName = dtb_u_u722; f_Ctor_ctorType = dtb_u_u723; f_Ctor_ctorArity = dtb_u_u724; f_Ctor_ctorRef = dtb_u_u725 } -> dtb_u_u723
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorArity = (fun (dtb_u_u726 : t_Ctor) -> (match dtb_u_u726 with
  | { f_Ctor_ctorName = dtb_u_u727; f_Ctor_ctorType = dtb_u_u728; f_Ctor_ctorArity = dtb_u_u729; f_Ctor_ctorRef = dtb_u_u730 } -> dtb_u_u729
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorRef = (fun (dtb_u_u731 : t_Ctor) -> (match dtb_u_u731 with
  | { f_Ctor_ctorName = dtb_u_u732; f_Ctor_ctorType = dtb_u_u733; f_Ctor_ctorArity = dtb_u_u734; f_Ctor_ctorRef = dtb_u_u735 } -> dtb_u_u735
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacityName = (fun (dtb_u_u736 : t_OpacitySpec) -> (match dtb_u_u736 with
  | { f_OpacitySpec_opacityName = dtb_u_u737; f_OpacitySpec_opacityKind = dtb_u_u738; f_OpacitySpec_opacitySpan = dtb_u_u739 } -> dtb_u_u737
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacityKind = (fun (dtb_u_u740 : t_OpacitySpec) -> (match dtb_u_u740 with
  | { f_OpacitySpec_opacityName = dtb_u_u741; f_OpacitySpec_opacityKind = dtb_u_u742; f_OpacitySpec_opacitySpan = dtb_u_u743 } -> dtb_u_u742
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpan = (fun (dtb_u_u744 : t_OpacitySpec) -> (match dtb_u_u744 with
  | { f_OpacitySpec_opacityName = dtb_u_u745; f_OpacitySpec_opacityKind = dtb_u_u746; f_OpacitySpec_opacitySpan = dtb_u_u747 } -> dtb_u_u747
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclName = (fun (dtb_u_u748 : t_ModDecl) -> (match dtb_u_u748 with
  | { f_ModDecl_modDeclName = dtb_u_u749; f_ModDecl_modDeclHasExportList = dtb_u_u750; f_ModDecl_modDeclExportItems = dtb_u_u751; f_ModDecl_modDeclExports = dtb_u_u752; f_ModDecl_modDeclReexports = dtb_u_u753; f_ModDecl_modDeclOpacity = dtb_u_u754; f_ModDecl_modDeclRef = dtb_u_u755 } -> dtb_u_u749
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclHasExportList = (fun (dtb_u_u756 : t_ModDecl) -> (match dtb_u_u756 with
  | { f_ModDecl_modDeclName = dtb_u_u757; f_ModDecl_modDeclHasExportList = dtb_u_u758; f_ModDecl_modDeclExportItems = dtb_u_u759; f_ModDecl_modDeclExports = dtb_u_u760; f_ModDecl_modDeclReexports = dtb_u_u761; f_ModDecl_modDeclOpacity = dtb_u_u762; f_ModDecl_modDeclRef = dtb_u_u763 } -> dtb_u_u758
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclExportItems = (fun (dtb_u_u764 : t_ModDecl) -> (match dtb_u_u764 with
  | { f_ModDecl_modDeclName = dtb_u_u765; f_ModDecl_modDeclHasExportList = dtb_u_u766; f_ModDecl_modDeclExportItems = dtb_u_u767; f_ModDecl_modDeclExports = dtb_u_u768; f_ModDecl_modDeclReexports = dtb_u_u769; f_ModDecl_modDeclOpacity = dtb_u_u770; f_ModDecl_modDeclRef = dtb_u_u771 } -> dtb_u_u767
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclExports = (fun (dtb_u_u772 : t_ModDecl) -> (match dtb_u_u772 with
  | { f_ModDecl_modDeclName = dtb_u_u773; f_ModDecl_modDeclHasExportList = dtb_u_u774; f_ModDecl_modDeclExportItems = dtb_u_u775; f_ModDecl_modDeclExports = dtb_u_u776; f_ModDecl_modDeclReexports = dtb_u_u777; f_ModDecl_modDeclOpacity = dtb_u_u778; f_ModDecl_modDeclRef = dtb_u_u779 } -> dtb_u_u776
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclReexports = (fun (dtb_u_u780 : t_ModDecl) -> (match dtb_u_u780 with
  | { f_ModDecl_modDeclName = dtb_u_u781; f_ModDecl_modDeclHasExportList = dtb_u_u782; f_ModDecl_modDeclExportItems = dtb_u_u783; f_ModDecl_modDeclExports = dtb_u_u784; f_ModDecl_modDeclReexports = dtb_u_u785; f_ModDecl_modDeclOpacity = dtb_u_u786; f_ModDecl_modDeclRef = dtb_u_u787 } -> dtb_u_u785
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclOpacity = (fun (dtb_u_u788 : t_ModDecl) -> (match dtb_u_u788 with
  | { f_ModDecl_modDeclName = dtb_u_u789; f_ModDecl_modDeclHasExportList = dtb_u_u790; f_ModDecl_modDeclExportItems = dtb_u_u791; f_ModDecl_modDeclExports = dtb_u_u792; f_ModDecl_modDeclReexports = dtb_u_u793; f_ModDecl_modDeclOpacity = dtb_u_u794; f_ModDecl_modDeclRef = dtb_u_u795 } -> dtb_u_u794
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclRef = (fun (dtb_u_u796 : t_ModDecl) -> (match dtb_u_u796 with
  | { f_ModDecl_modDeclName = dtb_u_u797; f_ModDecl_modDeclHasExportList = dtb_u_u798; f_ModDecl_modDeclExportItems = dtb_u_u799; f_ModDecl_modDeclExports = dtb_u_u800; f_ModDecl_modDeclReexports = dtb_u_u801; f_ModDecl_modDeclOpacity = dtb_u_u802; f_ModDecl_modDeclRef = dtb_u_u803 } -> dtb_u_u803
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileModDecl = (fun (dtb_u_u804 : t_SourceFile) -> (match dtb_u_u804 with
  | { f_SourceFile_sourceFileModDecl = dtb_u_u805; f_SourceFile_sourceFileImports = dtb_u_u806; f_SourceFile_sourceFileFixities = dtb_u_u807; f_SourceFile_sourceFileDecls = dtb_u_u808; f_SourceFile_sourceFileExports = dtb_u_u809; f_SourceFile_sourceFileReexports = dtb_u_u810; f_SourceFile_sourceFileOpacity = dtb_u_u811 } -> dtb_u_u805
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileImports = (fun (dtb_u_u812 : t_SourceFile) -> (match dtb_u_u812 with
  | { f_SourceFile_sourceFileModDecl = dtb_u_u813; f_SourceFile_sourceFileImports = dtb_u_u814; f_SourceFile_sourceFileFixities = dtb_u_u815; f_SourceFile_sourceFileDecls = dtb_u_u816; f_SourceFile_sourceFileExports = dtb_u_u817; f_SourceFile_sourceFileReexports = dtb_u_u818; f_SourceFile_sourceFileOpacity = dtb_u_u819 } -> dtb_u_u814
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileFixities = (fun (dtb_u_u820 : t_SourceFile) -> (match dtb_u_u820 with
  | { f_SourceFile_sourceFileModDecl = dtb_u_u821; f_SourceFile_sourceFileImports = dtb_u_u822; f_SourceFile_sourceFileFixities = dtb_u_u823; f_SourceFile_sourceFileDecls = dtb_u_u824; f_SourceFile_sourceFileExports = dtb_u_u825; f_SourceFile_sourceFileReexports = dtb_u_u826; f_SourceFile_sourceFileOpacity = dtb_u_u827 } -> dtb_u_u823
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileDecls = (fun (dtb_u_u828 : t_SourceFile) -> (match dtb_u_u828 with
  | { f_SourceFile_sourceFileModDecl = dtb_u_u829; f_SourceFile_sourceFileImports = dtb_u_u830; f_SourceFile_sourceFileFixities = dtb_u_u831; f_SourceFile_sourceFileDecls = dtb_u_u832; f_SourceFile_sourceFileExports = dtb_u_u833; f_SourceFile_sourceFileReexports = dtb_u_u834; f_SourceFile_sourceFileOpacity = dtb_u_u835 } -> dtb_u_u832
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileExports = (fun (dtb_u_u836 : t_SourceFile) -> (match dtb_u_u836 with
  | { f_SourceFile_sourceFileModDecl = dtb_u_u837; f_SourceFile_sourceFileImports = dtb_u_u838; f_SourceFile_sourceFileFixities = dtb_u_u839; f_SourceFile_sourceFileDecls = dtb_u_u840; f_SourceFile_sourceFileExports = dtb_u_u841; f_SourceFile_sourceFileReexports = dtb_u_u842; f_SourceFile_sourceFileOpacity = dtb_u_u843 } -> dtb_u_u841
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileReexports = (fun (dtb_u_u844 : t_SourceFile) -> (match dtb_u_u844 with
  | { f_SourceFile_sourceFileModDecl = dtb_u_u845; f_SourceFile_sourceFileImports = dtb_u_u846; f_SourceFile_sourceFileFixities = dtb_u_u847; f_SourceFile_sourceFileDecls = dtb_u_u848; f_SourceFile_sourceFileExports = dtb_u_u849; f_SourceFile_sourceFileReexports = dtb_u_u850; f_SourceFile_sourceFileOpacity = dtb_u_u851 } -> dtb_u_u850
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileOpacity = (fun (dtb_u_u852 : t_SourceFile) -> (match dtb_u_u852 with
  | { f_SourceFile_sourceFileModDecl = dtb_u_u853; f_SourceFile_sourceFileImports = dtb_u_u854; f_SourceFile_sourceFileFixities = dtb_u_u855; f_SourceFile_sourceFileDecls = dtb_u_u856; f_SourceFile_sourceFileExports = dtb_u_u857; f_SourceFile_sourceFileReexports = dtb_u_u858; f_SourceFile_sourceFileOpacity = dtb_u_u859 } -> dtb_u_u859
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importName = (fun (dtb_u_u860 : t_Import) -> (match dtb_u_u860 with
  | { f_Import_importName = dtb_u_u861; f_Import_importIsQualified = dtb_u_u862; f_Import_importAlias = dtb_u_u863; f_Import_importRef = dtb_u_u864 } -> dtb_u_u861
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importIsQualified = (fun (dtb_u_u865 : t_Import) -> (match dtb_u_u865 with
  | { f_Import_importName = dtb_u_u866; f_Import_importIsQualified = dtb_u_u867; f_Import_importAlias = dtb_u_u868; f_Import_importRef = dtb_u_u869 } -> dtb_u_u867
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importAlias = (fun (dtb_u_u870 : t_Import) -> (match dtb_u_u870 with
  | { f_Import_importName = dtb_u_u871; f_Import_importIsQualified = dtb_u_u872; f_Import_importAlias = dtb_u_u873; f_Import_importRef = dtb_u_u874 } -> dtb_u_u873
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importRef = (fun (dtb_u_u875 : t_Import) -> (match dtb_u_u875 with
  | { f_Import_importName = dtb_u_u876; f_Import_importIsQualified = dtb_u_u877; f_Import_importAlias = dtb_u_u878; f_Import_importRef = dtb_u_u879 } -> dtb_u_u879
  | _ -> failwith "DT: impossible branch"
))
