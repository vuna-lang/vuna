open Vuna_runtime
type t_DeclAcc = { f_DeclAcc_declAccFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_DeclAcc_declAccDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DeclAcc_declAccExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_DeclAcc_declAccOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }
and t_ParsedDecl = { f_ParsedDecl_parsedFixity : Frontend_dAst.t_FixityDecl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedDecl : Frontend_dAst.t_Decl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedExport : Frontend_dAst.t_ExportSpec B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedOpacity : Frontend_dAst.t_OpacitySpec B_dData_dMaybe.t_Maybe }
and t_DeclBlock = { f_DeclBlock_dbOpen : string B_dData_dMaybe.t_Maybe; f_DeclBlock_dbClauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DeclBlock_dbFirst : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap }
and t_TraitHead = { f_TraitHead_traitHeadName : string; f_TraitHead_traitHeadParams : Frontend_dAst.t_TraitParam B_dData_dList.t_List; f_TraitHead_traitHeadSupers : Frontend_dAst.t_Expr B_dData_dList.t_List }
and t_BindingItem = C_BindingItem_BISig of (string) * (Frontend_dAst.t_Expr) * (Base_dSource.t_Span) | C_BindingItem_BIBind of ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair)
and t_HandleOp = C_HandleOp_HandleOp of (string) * (Frontend_dAst.t_Pat B_dData_dList.t_List) * (Base_dSource.t_Span) * (string) * (Frontend_dAst.t_Expr)
and t_HandleBlock = C_HandleBlock_HandleBlock of ((string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (t_HandleOp B_dData_dList.t_List)

# 18 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps0 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dParser_dSupport.v_tokSpan st)) e))

# 21 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps1 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (a0 : string) -> (((Base_dDiagnostics_dFrontend.v_psErr1At (Frontend_dParser_dSupport.v_tokSpan st)) e) a0))

# 24 "Vuna/Compiler/Frontend/Parser.vuna"
let v_psAt = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (args : string B_dData_dVec.t_Vec) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dParser_dSupport.v_tokSpan st)) e) args))

# 58 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclAcc = { f_DeclAcc_declAccFixities = B_dData_dList.C_List_Nil; f_DeclAcc_declAccDecls = B_dData_dList.C_List_Nil; f_DeclAcc_declAccExports = B_dData_dList.C_List_Nil; f_DeclAcc_declAccOpacity = B_dData_dList.C_List_Nil }

# 67 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyParsedDecl = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }

# 159 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportItemOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportMembers) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__0) -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, dtb__0, mc2))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, B_dData_dList.C_List_Nil, mc2))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (mc0, mc2))
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespace = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "module")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (name : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st3) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "as")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st4)) (fun (alias : string) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, (B_dData_dMaybe.C_Maybe_Just (alias)), ((Frontend_dParser_dSupport.v_spanOf st) st5))); B_dData_dPair.f_Pair_second = st5 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, B_dData_dMaybe.C_Maybe_Nothing, ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 }))))))))))

# 198 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reexportPrefix = (fun (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> dtb__1
  | B_dData_dMaybe.C_Maybe_Nothing -> (imp).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Parser.vuna"
let v_qualifyExportItem = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__2, dtb__3, dtb__4) -> (Frontend_dAst.C_ExportItem_XNamespace (dtb__2, dtb__3, dtb__4))
  | Frontend_dAst.C_ExportItem_XModule (dtb__5, dtb__6) -> (Frontend_dAst.C_ExportItem_XModule (dtb__5, dtb__6))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__7, dtb__8, dtb__9) -> (Frontend_dAst.C_ExportItem_XTypeSome ((String.concat "" [mc0; "."; dtb__7]), dtb__8, dtb__9))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__10, dtb__11) -> (Frontend_dAst.C_ExportItem_XTypeAll ((String.concat "" [mc0; "."; dtb__10]), dtb__11))
  | Frontend_dAst.C_ExportItem_XBare (dtb__12, dtb__13) -> (Frontend_dAst.C_ExportItem_XBare ((String.concat "" [mc0; "."; dtb__12]), dtb__13))
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAlias = (fun (st : Frontend_dParser_dSupport.t_PState) (isQualified : bool) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "as")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (alias : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = (B_dData_dMaybe.C_Maybe_Just (alias)); Frontend_dAst.f_Import_importSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) }; B_dData_dPair.f_Pair_second = st1 }))))))

# 181 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAfterKeyword = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "qualified")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((v_parseImportAlias st1) true))) else ((v_parseImportAlias st) false)))

# 211 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpec = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "import")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "qualified")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((v_parseImportAlias st2) true))) else ((v_parseImportAlias st1) false)))))

# 270 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclBlock = { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil) }

# 273 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClose = (fun (b : t_DeclBlock) -> { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst })

# 277 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpenAt = (fun (n : string) (sp : Base_dSource.t_Span) (b : t_DeclBlock) -> ((fun first2 -> { f_DeclBlock_dbOpen = (B_dData_dMaybe.C_Maybe_Just (n)); f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = first2 }) (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) n) (b).f_DeclBlock_dbFirst) then (b).f_DeclBlock_dbFirst else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) n) sp) (b).f_DeclBlock_dbFirst))))

# 283 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbAddClause = (fun (b : t_DeclBlock) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> { f_DeclBlock_dbOpen = (b).f_DeclBlock_dbOpen; f_DeclBlock_dbClauses = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pats; B_dData_dPair.f_Pair_second = sp }, (b).f_DeclBlock_dbClauses)); f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst })

# 286 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyNullary = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__14 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (match dtb__16 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_anyNullary dtb__15)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_findShadow = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = dtb__21 } -> (if ((Frontend_dAst.v_clauseSubsumedBy dtb__20) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__21)) else ((v_findShadow dtb__19) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Frontend/Parser.vuna"
let v_shadowDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "an earlier clause already matches these values"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseShadowed (n))) (B_dData_dVec.C_Vec_VCons (n, B_dData_dVec.C_Vec_Nil))))))

# 298 "Vuna/Compiler/Frontend/Parser.vuna"
let v_clauseVerdict = (fun (mc0 : t_DeclBlock) (mc1 : string) (mc2 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> (if (v_anyNullary (mc0).f_DeclBlock_dbClauses) then (B_dData_dMaybe.C_Maybe_Just (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (mc3)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_DefinitionDuplicate (mc1))) (B_dData_dVec.C_Vec_VCons (mc1, B_dData_dVec.C_Vec_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (match ((v_findShadow (mc0).f_DeclBlock_dbClauses) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shadowDiag mc1) mc3) dtb__22)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
))

# 321 "Vuna/Compiler/Frontend/Parser.vuna"
let v_notAdjacentDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "the definition starts here"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseNotAdjacent (n))) (B_dData_dVec.C_Vec_VCons (n, B_dData_dVec.C_Vec_Nil))))))

# 315 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reopenDiag = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) n) (b).f_DeclBlock_dbFirst) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (B_dData_dMaybe.C_Maybe_Just ((((v_notAdjacentDiag n) sp) dtb__23)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockFun = (fun (b : t_DeclBlock) (n : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (if (dtb__24 = n) then { B_dData_dPair.f_Pair_first = ((((v_clauseVerdict b) n) pats) sp); B_dData_dPair.f_Pair_second = (((v_dbAddClause b) pats) sp) } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) }
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockSig = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (if (dtb__25 = n) then { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = b } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) b) }
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockStep = (fun (mc0 : t_DeclBlock) (mc1 : t_ParsedDecl) -> (match mc1 with
  | { f_ParsedDecl_parsedFixity = dtb__26; f_ParsedDecl_parsedDecl = dtb__27; f_ParsedDecl_parsedExport = dtb__28; f_ParsedDecl_parsedOpacity = dtb__29 } -> (match dtb__26 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__27 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__28 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__29 with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc0 }
  | B_dData_dMaybe.C_Maybe_Just (dtb__30) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (match dtb__32 with
  | Frontend_dAst.C_Decl_DSig (dtb__33, dtb__34, dtb__35, dtb__36) -> (match dtb__28 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__29 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_blockSig mc0) dtb__33) dtb__36)
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Decl_DFun (dtb__39, dtb__40, dtb__41, dtb__42) -> (match dtb__28 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__29 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_blockFun mc0) dtb__39) dtb__40) dtb__42)
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb__28 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__29 with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__47) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Frontend/Parser.vuna"
let v_addParsedDecl = (fun (mc0 : t_ParsedDecl) (mc1 : t_DeclAcc) -> (match mc0 with
  | { f_ParsedDecl_parsedFixity = dtb__48; f_ParsedDecl_parsedDecl = dtb__49; f_ParsedDecl_parsedExport = dtb__50; f_ParsedDecl_parsedOpacity = dtb__51 } -> (match mc1 with
  | { f_DeclAcc_declAccFixities = dtb__52; f_DeclAcc_declAccDecls = dtb__53; f_DeclAcc_declAccExports = dtb__54; f_DeclAcc_declAccOpacity = dtb__55 } -> ((fun fixities2 -> ((fun decls2 -> ((fun exports2 -> ((fun opacity2 -> { f_DeclAcc_declAccFixities = fixities2; f_DeclAcc_declAccDecls = decls2; f_DeclAcc_declAccExports = exports2; f_DeclAcc_declAccOpacity = opacity2 }) (match dtb__51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__55))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__55
  | _ -> failwith "DT: impossible branch"
))) (match dtb__50 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__54))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__54
  | _ -> failwith "DT: impossible branch"
))) (match dtb__49 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__53))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__53
  | _ -> failwith "DT: impossible branch"
))) (match dtb__48 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__52))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__52
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reverseDeclAcc = (fun (mc0 : t_DeclAcc) -> (match mc0 with
  | { f_DeclAcc_declAccFixities = dtb__60; f_DeclAcc_declAccDecls = dtb__61; f_DeclAcc_declAccExports = dtb__62; f_DeclAcc_declAccOpacity = dtb__63 } -> { f_DeclAcc_declAccFixities = (B_dData_dList.v_reverse dtb__60); f_DeclAcc_declAccDecls = (B_dData_dList.v_reverse dtb__61); f_DeclAcc_declAccExports = (B_dData_dList.v_reverse dtb__62); f_DeclAcc_declAccOpacity = (B_dData_dList.v_reverse dtb__63) }
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_skipToDeclLine = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> ((v_skipFrom dtb__65) mc1)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 435 "Vuna/Compiler/Frontend/Parser.vuna"
and v_skipFrom = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (if ((Base_dSource.v_posCol (dtb__66).Frontend_dLexer.f_PTok_ptokPos) = mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67)) else ((v_skipToDeclLine dtb__67) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Frontend/Parser.vuna"
let v_recoverDecl = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : int) -> (match mc0 with
  | { Frontend_dParser_dSupport.f_PState_fileOf = dtb__68; Frontend_dParser_dSupport.f_PState_toksOf = dtb__69; Frontend_dParser_dSupport.f_PState_lastPos = dtb__70; Frontend_dParser_dSupport.f_PState_toksLeft = dtb__71; Frontend_dParser_dSupport.f_PState_pmodeOf = dtb__72 } -> ((fun rest -> { Frontend_dParser_dSupport.f_PState_fileOf = dtb__68; Frontend_dParser_dSupport.f_PState_toksOf = rest; Frontend_dParser_dSupport.f_PState_lastPos = dtb__70; Frontend_dParser_dSupport.f_PState_toksLeft = (B_dData_dList.v_length rest); Frontend_dParser_dSupport.f_PState_pmodeOf = dtb__72 }) ((v_skipToDeclLine dtb__69) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportMarkerFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__73; Frontend_dLexer.f_PTok_ptokPos = dtb__74 } -> (match dtb__73 with
  | Frontend_dLexer.C_Tok_TKw (dtb__75) -> (if (dtb__75 = "data") then true else (if (dtb__75 = "record") then true else (if (dtb__75 = "trait") then true else (if (dtb__75 = "axiom") then true else (if (dtb__75 = "extern") then true else (if (dtb__75 = "linear") then true else (if (dtb__75 = "opaque") then true else (if (dtb__75 = "transparent") then true else (if (dtb__75 = "import") then true else false)))))))))
  | Frontend_dLexer.C_Tok_TSym (dtb__76) -> (if (dtb__76 = ":") then false else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__77; Frontend_dLexer.f_PTok_ptokPos = dtb__78 } -> (match dtb__77 with
  | Frontend_dLexer.C_Tok_TSym (dtb__79) -> (if (dtb__79 = ":") then true else true)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__80) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__81; Frontend_dLexer.f_PTok_ptokPos = dtb__82 } -> (match dtb__81 with
  | Frontend_dLexer.C_Tok_TSym (dtb__83) -> (if (dtb__83 = ":") then true else true)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 467 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__84; Frontend_dLexer.f_PTok_ptokPos = dtb__85 } -> (match dtb__84 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__86) -> (if (dtb__86 = "export") then (v_exportMarkerFollows (Frontend_dParser_dSupport.v_advance st)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 559 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityGiven = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacitySpecOf = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (mc1 : string) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = mc1; Frontend_dAst.f_OpacitySpec_opacityKind = dtb__88; Frontend_dAst.f_OpacitySpec_opacitySpan = mc2 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 790 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_traitSupersFollowGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__91; Frontend_dLexer.f_PTok_ptokPos = dtb__92 } -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Frontend_dLexer.C_Tok_TSym (dtb__93) -> (if (dtb__93 = "=>") then (mc0 = 0) else (if (dtb__93 = "(") then ((v_traitSupersFollowGo (mc0 + 1)) dtb__90) else (if (dtb__93 = ")") then ((v_traitSupersFollowGo (if (mc0 > 0) then (mc0 - 1) else 0)) dtb__90) else ((v_traitSupersFollowGo mc0) dtb__90))))
  | Frontend_dLexer.C_Tok_TKw (dtb__94) -> (if (dtb__94 = "where") then false else ((v_traitSupersFollowGo mc0) dtb__90))
  | _ -> ((v_traitSupersFollowGo mc0) dtb__90)
)) dtb__91)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 787 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitSupersFollow = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((v_traitSupersFollowGo 0) (st).Frontend_dParser_dSupport.f_PState_toksOf))

# 826 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parenIsMemberList = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__95; Frontend_dLexer.f_PTok_ptokPos = dtb__96 } -> (match dtb__95 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__97) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__98; Frontend_dLexer.f_PTok_ptokPos = dtb__99 } -> (match dtb__98 with
  | Frontend_dLexer.C_Tok_TSym (dtb__100) -> (if (dtb__100 = ",") then true else (if (dtb__100 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TSym (dtb__101) -> (if (dtb__101 = "..") then true else (if (dtb__101 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 850 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectDeclName = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__102; Frontend_dLexer.f_PTok_ptokPos = dtb__103 } -> (match dtb__102 with
  | Frontend_dLexer.C_Tok_TSym (dtb__104) -> (if (dtb__104 = "(") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (match dtb__105 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__106; Frontend_dLexer.f_PTok_ptokPos = dtb__107 } -> (match dtb__106 with
  | Frontend_dLexer.C_Tok_TSym (dtb__108) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__108) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (match dtb__109 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__110; Frontend_dLexer.f_PTok_ptokPos = dtb__111 } -> (match dtb__110 with
  | Frontend_dLexer.C_Tok_TSym (dtb__112) -> (if (dtb__112 = ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) })) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator"))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 2)))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1)) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__104) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__113) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 150 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMemberNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseMemberNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 144 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (if ((Frontend_dParser_dSupport.v_atSym st1) "..") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "..")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step ((v_parseMemberNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (names)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 119 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItem = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__114; Frontend_dLexer.f_PTok_ptokPos = dtb__115 } -> (match dtb__114 with
  | Frontend_dLexer.C_Tok_TSym (dtb__116) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__116) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__116, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__117) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) "(") then ((Base_dCommon.v_step (v_parseExportMembers st1)) (fun (members : Frontend_dAst.t_ExportMembers) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_exportItemOf dtb__117) members) ((Frontend_dParser_dSupport.v_spanOf st) st2)); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__117, ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 })))) (Frontend_dParser_dSupport.v_advance st))
  | Frontend_dLexer.C_Tok_TKw (dtb__118) -> (if (dtb__118 = "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (name, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 110 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseExportItemsFrom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_parseExportItem st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseExportItemsFrom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 104 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItems = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_parseExportItemsFrom (Frontend_dParser_dSupport.v_stateFuel st1)) st1)))))

# 95 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDecl = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) "(") then ((Base_dCommon.v_step (v_parseExportItems st2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = true; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclSpan = ((Frontend_dParser_dSupport.v_spanOf st) st4) })); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = false; Frontend_dAst.f_ModDecl_modDeclExportItems = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 }))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 188 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseReexportTail = (fun (imp : Frontend_dAst.t_Import) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then ((Base_dCommon.v_step (v_parseExportItems st)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (v_qualifyExportItem (v_reexportPrefix imp))) items) }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st1 }))))))

# 166 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImport = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "import") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "import")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseImportAfterKeyword st2)) (fun (imp : Frontend_dAst.t_Import) (st3 : Frontend_dParser_dSupport.t_PState) -> ((v_parseReexportTail imp) st3))))) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))

# 838 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOptionalMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then (v_parseExportMembers st) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = st }))))

# 821 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (v_parseOptionalMembers st))

# 871 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectFixityLevel = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__119; Frontend_dLexer.f_PTok_ptokPos = dtb__120 } -> (match dtb__119 with
  | Frontend_dLexer.C_Tok_TInt (dtb__121) -> (if (if (dtb__121 >= 0) then (dtb__121 <= 9) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_FixityLevelRange))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedFixityLevel)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 880 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectOpName = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__122; Frontend_dLexer.f_PTok_ptokPos = dtb__123 } -> (match dtb__122 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__124) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__124) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TSym (dtb__125) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__125) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 842 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_step (v_expectFixityLevel (Frontend_dParser_dSupport.v_advance st))) (fun (level : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_expectOpName st1)) (fun (op : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixitySpan = { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) } }; B_dData_dPair.f_Pair_second = st2 })))))))

# 958 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rejectCtxSuffix = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere) else (Base_dDiag.C_Check_OkC (st))))

# 1121 "Vuna/Compiler/Frontend/Parser.vuna"
let v_localFunMerge = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr) (mc2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (match dtb__126 with
  | { B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = dtb__129 } -> (match dtb__128 with
  | Frontend_dAst.C_Pat_PVar (dtb__130, dtb__131) -> (match dtb__129 with
  | Frontend_dAst.C_Expr_EAnn (dtb__132, dtb__133, dtb__134) -> (match dtb__132 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__135, dtb__136) -> (if (dtb__130 = mc0) then (match mc1 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__137, dtb__138) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__130, dtb__131)); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EAnn ((Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_append dtb__135) dtb__137), dtb__136)), dtb__133, dtb__134)) }, dtb__127))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_ELocalFun (dtb__139, dtb__140) -> (if (dtb__130 = mc0) then (match mc1 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__141, dtb__142) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__130, dtb__131)); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_append dtb__139) dtb__141), dtb__140)) }, dtb__127))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1139 "Vuna/Compiler/Frontend/Parser.vuna"
let v_patBoundName = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PVar (dtb__143, dtb__144) -> dtb__143
  | _ -> ""
))

# 1143 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingSigOf = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match dtb__145 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (if (dtb__147 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__148)) else ((v_bindingSigOf mc0) dtb__146))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1147 "Vuna/Compiler/Frontend/Parser.vuna"
let v_hasBindingSig = (fun (name : string) (sigs : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_bindingSigOf name) sigs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1153 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstDanglingSig = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (match dtb__150 with
  | { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = dtb__153 } -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 } -> (if ((B_dData_dList.v_memName dtb__152) mc1) then ((v_firstDanglingSig dtb__151) mc1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = dtb__155 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1084 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingBindsGo = (fun (mc0 : t_BindingItem B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_BindingItem_BIBind (dtb__158) -> (match dtb__158 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (match (((v_localFunMerge (v_patBoundName dtb__159)) dtb__160) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> ((((v_bindingBindsGo dtb__157) mc1) mc2) dtb__161)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_bindingBindsGo dtb__157) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName dtb__159), mc2))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 }, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (match dtb__162 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> (if ((B_dData_dList.v_memName (v_patBoundName dtb__159)) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__164)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigMultiClause ((v_patBoundName dtb__159)))) (B_dData_dVec.C_Vec_VCons ((v_patBoundName dtb__159), B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__157) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName dtb__159), mc2))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EAnn (dtb__160, dtb__163, dtb__164)) }, mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_bindingSigOf (v_patBoundName dtb__159)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_BindingItem_BISig (dtb__165, dtb__166, dtb__167) -> (if ((B_dData_dList.v_memName dtb__165) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__167)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigBeforeClause (dtb__165))) (B_dData_dVec.C_Vec_VCons (dtb__165, B_dData_dVec.C_Vec_Nil)))))) else (if ((v_hasBindingSig dtb__165) mc1) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__167)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigDuplicate (dtb__165))) (B_dData_dVec.C_Vec_VCons (dtb__165, B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__157) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } }, mc1))) mc2) mc3)))
  | _ -> failwith "DT: impossible branch"
)) dtb__156)
  | B_dData_dList.C_List_Nil -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> (match dtb__168 with
  | { B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__170 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__170)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigNoDef (dtb__169))) (B_dData_dVec.C_Vec_VCons (dtb__169, B_dData_dVec.C_Vec_Nil))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
)) ((v_firstDanglingSig (B_dData_dList.v_reverse mc1)) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 1081 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindingItemsToBinds = (fun (items : t_BindingItem B_dData_dList.t_List) -> ((((v_bindingBindsGo items) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1183 "Vuna/Compiler/Frontend/Parser.vuna"
let v_tierFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__171; Frontend_dLexer.f_PTok_ptokPos = dtb__172 } -> (match dtb__171 with
  | Frontend_dLexer.C_Tok_TKw (dtb__173) -> (if (dtb__173 = "record") then true else (if (dtb__173 = "linear") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__174; Frontend_dLexer.f_PTok_ptokPos = dtb__175 } -> (match dtb__174 with
  | Frontend_dLexer.C_Tok_TKw (dtb__176) -> (if (dtb__176 = "record") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 498 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__177; Frontend_dLexer.f_PTok_ptokPos = dtb__178 } -> (match dtb__177 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__179) -> (if (dtb__179 = "abstract") then true else false)
  | Frontend_dLexer.C_Tok_TKw (dtb__180) -> (if (dtb__180 = "opaque") then (B_dData_dBool.v_not (v_tierFollows st)) else (if (dtb__180 = "transparent") then (B_dData_dBool.v_not (v_tierFollows st)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1281 "Vuna/Compiler/Frontend/Parser.vuna"
let v_atIdentName = (fun (st : Frontend_dParser_dSupport.t_PState) (name : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__181; Frontend_dLexer.f_PTok_ptokPos = dtb__182 } -> (match dtb__181 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__183) -> (dtb__183 = name)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 224 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseImports = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "import") then ((Base_dCommon.v_step (v_parseImportSpec st)) (fun (imp : Frontend_dAst.t_Import) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (imp, dtb__184)); B_dData_dPair.f_Pair_second = dtb__185 }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "import") else false) then ((Base_dCommon.v_step (v_parseExportImport st)) (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__186; B_dData_dPair.f_Pair_second = dtb__187 } -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__186, dtb__188)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__187) dtb__189) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "module") else false) then ((Base_dCommon.v_step (v_parseExportNamespace st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__190; B_dData_dPair.f_Pair_second = dtb__191 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__190; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (item, dtb__191)) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st })))))))

# 1305 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDerivingNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseDerivingNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1299 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDerivingParens = (fun (via : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step ((v_parseDerivingNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1289 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeriving = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "deriving") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "deriving")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((v_atIdentName st1) "via") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (fld : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if (fld = "field") then ((v_parseDerivingParens true) st3) else (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("field"))) "field")))))) else ((v_parseDerivingParens false) st1)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = false }; B_dData_dPair.f_Pair_second = st }))))

# 1400 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_innermostPiCod = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> (v_innermostPiCod dtb__196)
  | _ -> mc0
))

# 1404 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_replacePiCod = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (Frontend_dAst.C_Expr_EPi (dtb__198, dtb__199, dtb__200, dtb__201, ((v_replacePiCod dtb__202) mc1), dtb__203))
  | _ -> mc1
))

# 1395 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ctxThenSplit = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_innermostPiCod (Frontend_dAst.C_Expr_EPi (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_replacePiCod (Frontend_dAst.C_Expr_EPi (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209))) mc1) }
  | _ -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = mc1 }
))

# 1450 "Vuna/Compiler/Frontend/Parser.vuna"
let v_instanceMethodStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__210; Frontend_dLexer.f_PTok_ptokPos = dtb__211 } -> (match dtb__210 with
  | Frontend_dLexer.C_Tok_TSym (dtb__212) -> (if (dtb__212 = "(") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (match dtb__213 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__214; Frontend_dLexer.f_PTok_ptokPos = dtb__215 } -> (match dtb__214 with
  | Frontend_dLexer.C_Tok_TSym (dtb__216) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (match dtb__217 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__218; Frontend_dLexer.f_PTok_ptokPos = dtb__219 } -> (match dtb__218 with
  | Frontend_dLexer.C_Tok_TSym (dtb__220) -> (if (dtb__220 = ")") then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__216)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 2))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1)) else (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__212)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__221) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1464 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__222; Frontend_dLexer.f_PTok_ptokPos = dtb__223 } -> (match dtb__222 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__224) -> ((Base_dCommon.v_step ((v_parseParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : string B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__224, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 1578 "Vuna/Compiler/Frontend/Parser.vuna"
let v_spanFromExpr = (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun sp -> { Base_dSource.f_Span_spanFile = (sp).Base_dSource.f_Span_spanFile; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) }) (Frontend_dAst.v_exprSpan e)))

# 1612 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldSuffix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (base : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ".") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ".")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (fname : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EField (base, fname, ((v_spanFromExpr base) st2)))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st })))))

# 1626 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroBangAt = (fun (st : Frontend_dParser_dSupport.t_PState) (start : Base_dSource.t_Pos) (name : string) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__225; Frontend_dLexer.f_PTok_ptokPos = dtb__226 } -> (match dtb__225 with
  | Frontend_dLexer.C_Tok_TSym (dtb__227) -> (if (dtb__227 = "!") then (if ((Base_dSource.v_posLine dtb__226) = (Base_dSource.v_posLine start)) then ((Base_dSource.v_posCol dtb__226) = ((Base_dSource.v_posCol start) + (bi_strLength name))) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1633 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroAtom = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dAst.v_macroSyntaxName mc0), mc3))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dAst.v_macroSyntaxName mc0), mc3)), mc1, mc2))
))

# 1717 "Vuna/Compiler/Frontend/Parser.vuna"
let v_holeSpan = (fun (mc0 : string) (mc1 : Base_dSource.t_Pos) -> (match mc1 with
  | { Base_dSource.f_Pos_posLine = dtb__228; Base_dSource.f_Pos_posCol = dtb__229; Base_dSource.f_Pos_posOffset = dtb__230; Base_dSource.f_Pos_posEndOffset = dtb__231 } -> { Base_dSource.f_Span_spanFile = mc0; Base_dSource.f_Span_spanStartLine = dtb__228; Base_dSource.f_Span_spanStartCol = dtb__229; Base_dSource.f_Span_spanEndLine = dtb__228; Base_dSource.f_Span_spanEndCol = dtb__229; Base_dSource.f_Span_spanStartOffset = dtb__230; Base_dSource.f_Span_spanEndOffset = dtb__230 }
  | _ -> failwith "DT: impossible branch"
))

# 1721 "Vuna/Compiler/Frontend/Parser.vuna"
let v_toksFuel = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((128 * (B_dData_dList.v_length toks)) + 1024))

# 1725 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_textPartsOf = (fun (mc0 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__232 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__234) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_TmplPart_TPText (dtb__235) -> (match (v_textPartsOf dtb__233) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__236) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__235 ^ dtb__236)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (""))
  | _ -> failwith "DT: impossible branch"
))

# 1760 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairExprs = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> (match dtb__238 with
  | B_dData_dList.C_List_Nil -> dtb__237
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_tuplePairSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__237, (B_dData_dList.C_List__x58__x58_ (((v_foldPairExprs mc0) dtb__238), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_tupleUnitSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1800 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePiNamesRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__239; Frontend_dLexer.f_PTok_ptokPos = dtb__240 } -> (match dtb__239 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__241) -> (((v_parsePiNamesRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) (B_dData_dList.C_List__x58__x58_ (dtb__241, acc)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 1791 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsePiNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parsePiNamesRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)))))))

# 1810 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPiNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : bool) (mc2 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr) (mc5 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> (Frontend_dAst.C_Expr_EPi (dtb__242, mc1, mc2, mc3, ((((((v_foldPiNames dtb__243) mc1) mc2) mc3) mc4) mc5), mc5))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 1815 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyDottedName = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (if (Base_dSource.v_containsDot dtb__244) then true else (v_anyDottedName dtb__245))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1820 "Vuna/Compiler/Frontend/Parser.vuna"
let v_consumeQty = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__247; Frontend_dLexer.f_PTok_ptokPos = dtb__248 } -> (match dtb__247 with
  | Frontend_dLexer.C_Tok_TInt (dtb__249) -> (if (dtb__249 = 0) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else (if (dtb__249 = 1) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)))
  | _ -> ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok mc0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1881 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldCons = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_listConsSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__250, (B_dData_dList.C_List__x58__x58_ (((v_foldCons mc0) dtb__251), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_listNilSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1895 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLambdaParam = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_tokenSpan st) }; B_dData_dPair.f_Pair_second = st1 })))))

# 1901 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseLambdaParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ",") then ((Base_dCommon.v_step (v_parseLambdaParam (Frontend_dParser_dSupport.v_advance st))) (fun (p : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseLambdaParams (fuel - 1)) st1) ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (p, B_dData_dList.C_List_Nil)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = st })))))

# 1977 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rowAtNameExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__252, dtb__253) -> (Frontend_dAst.C_Expr_EStr (dtb__252, dtb__253))
  | _ -> mc0
))

# 2012 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpBinder = "@vuna@handle@o"

# 2016 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpIndexBinder = "@vuna@handle@ix"

# 2074 "Vuna/Compiler/Frontend/Parser.vuna"
let v_isReturnClauseHead = (fun (stat : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__254; Frontend_dLexer.f_PTok_ptokPos = dtb__255 } -> (match dtb__254 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__256) -> (dtb__256 = "return")
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok stat)))

# 2154 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpKName = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261) -> dtb__260
  | _ -> failwith "DT: impossible branch"
))

# 2158 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstOtherKName = (fun (mc0 : t_HandleOp B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> ((fun k2 -> (if (k2 = mc1) then ((v_firstOtherKName dtb__263) mc1) else (B_dData_dMaybe.C_Maybe_Just (k2)))) (v_handleOpKName dtb__262))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2166 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleAlt = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__264, dtb__265, dtb__266, dtb__267, dtb__268) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__264, dtb__265, dtb__266)); B_dData_dPair.f_Pair_second = dtb__268 }
  | _ -> failwith "DT: impossible branch"
))

# 2170 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleRetExpr = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__269) -> (match dtb__269 with
  | { B_dData_dPair.f_Pair_first = dtb__270; B_dData_dPair.f_Pair_second = dtb__271 } -> (match dtb__271 with
  | { B_dData_dPair.f_Pair_first = dtb__272; B_dData_dPair.f_Pair_second = dtb__273 } -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__270; B_dData_dPair.f_Pair_second = dtb__273 }, B_dData_dList.C_List_Nil)), dtb__272, dtb__273))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_handleNoRetSyntax, mc1))
  | _ -> failwith "DT: impossible branch"
))

# 2175 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpLam = (fun (ops : t_HandleOp B_dData_dList.t_List) (kname : string) (sp : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpIndexBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = kname; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (v_handleOpBinder, sp)), ((B_dData_dList.v_map v_handleAlt) ops), sp)), sp)))

# 2183 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : t_HandleBlock) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | C_HandleBlock_HandleBlock (dtb__274, dtb__275) -> (match dtb__275 with
  | B_dData_dList.C_List__x58__x58_ (dtb__276, dtb__277) -> (match ((v_firstOtherKName dtb__277) (v_handleOpKName dtb__276)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_handleSyntax, mc2)), (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (((v_handleRetExpr dtb__274) mc2), (B_dData_dList.C_List__x58__x58_ ((((v_handleOpLam (B_dData_dList.C_List__x58__x58_ (dtb__276, dtb__277))) (v_handleOpKName dtb__276)) mc2), B_dData_dList.C_List_Nil)))))), mc2))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (((Base_dDiagnostics_dFrontend.v_psErrAt mc2) (Base_dDiagnostics_dFrontend.C_PsDiag_HandleContinuationNameMismatch ((v_handleOpKName dtb__276), dtb__278))) (B_dData_dVec.C_Vec_VCons ((v_handleOpKName dtb__276), (B_dData_dVec.C_Vec_VCons (dtb__278, B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At mc2) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2275 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_patBinderBindings = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__279, dtb__280) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__281, dtb__282) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PWild (dtb__283) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb__284, dtb__285, dtb__286) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinderBindings (B_dData_dPair.v_secondOf f)))) dtb__285)
  | Frontend_dAst.C_Pat_PCon (dtb__287, dtb__288, dtb__289) -> ((B_dData_dList.v_concatMap v_patBinderBindings) dtb__288)
  | Frontend_dAst.C_Pat_PAs (dtb__290, dtb__291, dtb__292) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__290; B_dData_dPair.f_Pair_second = dtb__292 }, (v_patBinderBindings dtb__291)))
  | Frontend_dAst.C_Pat_PVar (dtb__293, dtb__294) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2290 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstRepeatedBindingGo = (fun (mc0 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__295, dtb__296) -> (match dtb__295 with
  | { B_dData_dPair.f_Pair_first = dtb__297; B_dData_dPair.f_Pair_second = dtb__298 } -> (if ((B_dData_dList.v_memName dtb__297) mc1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__297; B_dData_dPair.f_Pair_second = dtb__298 })) else ((v_firstRepeatedBindingGo dtb__296) (B_dData_dList.C_List__x58__x58_ (dtb__297, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2286 "Vuna/Compiler/Frontend/Parser.vuna"
let v_firstRepeatedBinding = (fun (binds : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_firstRepeatedBindingGo binds) B_dData_dList.C_List_Nil))

# 2305 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkNoRepeatedBinders = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (match dtb__299 with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__301)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_appendMessage (String.concat "" [" (repeated name: `"; dtb__300; "`)"])) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_RepeatedPatternBinder) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (pats))
  | _ -> failwith "DT: impossible branch"
)) (v_firstRepeatedBinding ((B_dData_dList.v_concatMap v_patBinderBindings) pats))))

# 2299 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkBindersAt = (fun (st : Frontend_dParser_dSupport.t_PState) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (Frontend_dParser_dSupport.v_pmodeOf st) with
  | Frontend_dParser_dSupport.C_ParseMode_PmTool -> (Base_dDiag.C_Check_OkC (pats))
  | Frontend_dParser_dSupport.C_ParseMode_PmStrict -> (v_checkNoRepeatedBinders pats)
  | _ -> failwith "DT: impossible branch"
))

# 2415 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAsName = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__302; Frontend_dLexer.f_PTok_ptokPos = dtb__303 } -> (match dtb__302 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__304) -> (if (dtb__304 = "_") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__304; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 2472 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPCon = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__305, dtb__306) -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_listConsSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__305, (B_dData_dList.C_List__x58__x58_ (((v_foldPCon mc0) dtb__306), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_listNilSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2487 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairPats = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (match dtb__308 with
  | B_dData_dList.C_List_Nil -> dtb__307
  | _ -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_tuplePairSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__307, (B_dData_dList.C_List__x58__x58_ (((v_foldPairPats mc0) dtb__308), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2313 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePatternSingle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((v_parsePatternCons (fuel - 1)) st) blockCol)))
# 2318 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternCons = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternHead (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atSym st1) "::") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternCons (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("::", (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2327 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternHead = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__309; Frontend_dLexer.f_PTok_ptokPos = dtb__310 } -> (match dtb__309 with
  | Frontend_dLexer.C_Tok_TSym (dtb__311) -> (if (dtb__311 = "(") then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__312) -> (match dtb__312 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__313; Frontend_dLexer.f_PTok_ptokPos = dtb__314 } -> (match dtb__313 with
  | Frontend_dLexer.C_Tok_TSym (dtb__315) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__315) then (((v_parsePatternAtom (fuel - 1)) st) blockCol) else ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__316) -> (match dtb__316 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__317; Frontend_dLexer.f_PTok_ptokPos = dtb__318 } -> (match dtb__317 with
  | Frontend_dLexer.C_Tok_TSym (dtb__319) -> (if (dtb__319 = ")") then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__315, args, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 2)))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1)) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
  | Frontend_dLexer.C_Tok_TIdent (dtb__320) -> ((fun st1 -> (if (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__320) then ((Frontend_dParser_dSupport.v_atSym st1) "{") else false) then ((Base_dCommon.v_step (((v_parseRecordPatternFields (fuel - 1)) st1) blockCol)) (fun (fields : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__320, fields, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__320) then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__320, args, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol)))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 2350 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternFields = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseRecordPatternList (fuel - 1)) st1) blockCol)))))
# 2359 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordPatternField (fuel - 1)) st) blockCol)) (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseRecordPatternList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "}")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2370 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternField = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__321; Frontend_dLexer.f_PTok_ptokPos = dtb__322 } -> (match dtb__321 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__323) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) "=") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st2) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = pat }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Pat_PVar (dtb__323, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__322); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__322); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__322); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__322); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__322); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__322) })) }; B_dData_dPair.f_Pair_second = st1 })))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedRecordFieldPattern)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 2382 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtoms = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 2393 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_finishAsPattern (fuel - 1)) st) base) st1) blockCol)))))
# 2403 "Vuna/Compiler/Frontend/Parser.vuna"
and v_finishAsPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Frontend_dAst.C_Pat_PVar (dtb__324, dtb__325) -> (if (dtb__324 = "_") then ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, (Frontend_dAst.C_Pat_PWild (dtb__325)), ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__324, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, base, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))))
)) base) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st1 })))))
# 2424 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__326; Frontend_dLexer.f_PTok_ptokPos = dtb__327 } -> (match dtb__326 with
  | Frontend_dLexer.C_Tok_TSym (dtb__328) -> (if (dtb__328 = "(") then (if ((Frontend_dParser_dSupport.v_atSym (Frontend_dParser_dSupport.v_advance st)) ")") then ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (first : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairPats ((Frontend_dParser_dSupport.v_spanOf st) st2)) pats); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 })))))))) else (if (dtb__328 = "[") then (((v_parseListPattern (fuel - 1)) st) blockCol) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__329, dtb__330, dtb__331) -> (match (v_textPartsOf dtb__330) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__332) -> ((fun advanced -> ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__332, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (((((Frontend_dParser_dSupport.v_mkStateAt (Frontend_dParser_dSupport.v_fileOf st)) (advanced).Frontend_dParser_dSupport.f_PState_toksOf) dtb__331) (advanced).Frontend_dParser_dSupport.f_PState_toksLeft) (Frontend_dParser_dSupport.v_pmodeOf st)))) (Frontend_dParser_dSupport.v_advance st))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateInPattern)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dLexer.C_Tok_TStr (dtb__333) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__333, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__334) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__334, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__335) -> (if (dtb__335 = "_") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__335) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__335, B_dData_dList.C_List_Nil, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__335, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 2453 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_listNilSyntax, B_dData_dList.C_List_Nil, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) st1) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPCon ((Frontend_dParser_dSupport.v_spanOf st) st2)) pats); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2462 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPatternElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))
# 2477 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (p, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (p, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1159 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseClausePatterns = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseClausePatterns (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))

# 1036 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseBindingItemsAt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__336; Base_dSource.f_Pos_posCol = dtb__337; Base_dSource.f_Pos_posOffset = dtb__338; Base_dSource.f_Pos_posEndOffset = dtb__339 } -> (if (dtb__337 = bindCol) then ((Base_dCommon.v_step (((v_parseBindingItem (fuel - 1)) st) bindCol)) (fun (item : t_BindingItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st1) bindCol)) (fun (rest : t_BindingItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__337 > bindCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInBinding) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1048 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItem = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__340, dtb__341) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) bindCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BISig (dtb__340, ty, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 })))))))) else (((((v_parseBindingDef (fuel - 1)) st) st1) bindCol) pat))
  | _ -> (((((v_parseBindingDef (fuel - 1)) st) st1) bindCol) pat)
)))))
# 1061 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingDef = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__342, dtb__343) -> (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) bindCol) else false) then ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "=")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) bindCol)) (fun (value : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__342, (Frontend_dAst.v_patSpan pat))); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_ELocalFun ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pats; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf stStart) st4))) })); B_dData_dPair.f_Pair_second = st4 })))))))))) else ((Base_dCommon.v_step ((((v_parseBindingValue (fuel - 1)) st) pat) bindCol)) (fun (b : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((((v_parseBindingValue (fuel - 1)) st) pat) bindCol)) (fun (b : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 }))))
)))
# 1070 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingValue = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (pat : Frontend_dAst.t_Pat) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "=")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = value }; B_dData_dPair.f_Pair_second = st2 }))))))))))
# 1491 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (((v_parseLhs (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st1) blockCol) lhs))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExprNotIndented)))))
# 1506 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseInfix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (lhs : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__344; Frontend_dLexer.f_PTok_ptokPos = dtb__345 } -> (match dtb__344 with
  | Frontend_dLexer.C_Tok_TSym (dtb__346) -> (if (dtb__346 = "`") then (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectValueName (Frontend_dParser_dSupport.v_advance st))) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "`")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st3) blockCol) (Frontend_dAst.C_Expr_EBacktick (name, lhs, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st3)))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))) else (if (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isSyntaxSym dtb__346)) else false) then (if (Frontend_dParser_dSupport.v_closeParenNext st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectR (lhs, dtb__346, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EInfix (dtb__346, lhs, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st2))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 1519 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLhs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__347; Frontend_dLexer.f_PTok_ptokPos = dtb__348 } -> (match dtb__347 with
  | Frontend_dLexer.C_Tok_TSym (dtb__349) -> (if (dtb__349 = "\\") then (((v_parseLambda (fuel - 1)) st) blockCol) else (if (dtb__349 = "-") then (((v_parseNegation (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))
  | Frontend_dLexer.C_Tok_TKw (dtb__350) -> (if (dtb__350 = "let") then (((v_parseLet (fuel - 1)) st) blockCol) else (if (dtb__350 = "case") then (((v_parseCase (fuel - 1)) st) blockCol) else (if (dtb__350 = "if") then (((v_parseIf (fuel - 1)) st) blockCol) else (if (dtb__350 = "do") then (((v_parseDo (fuel - 1)) st) blockCol) else (if (dtb__350 = "perform") then (((v_parsePerform (fuel - 1)) st) blockCol) else (if (dtb__350 = "handle") then (((v_parseHandle (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))))))
  | _ -> (((v_parseApplication (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 1537 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseNegation = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__351) -> (match dtb__351 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__352; Frontend_dLexer.f_PTok_ptokPos = dtb__353 } -> (match dtb__352 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__354) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (("-" ^ dtb__354), ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__355) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt ((0 - dtb__355), ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1))))
# 1547 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseApplication = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st2) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_appAtSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st3))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (payload, args)))), ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((fun app -> (if ((Frontend_dParser_dSupport.v_atSym st2) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_rowAtSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st3))), (B_dData_dList.C_List__x58__x58_ (app, (B_dData_dList.C_List__x58__x58_ (payload, B_dData_dList.C_List_Nil)))), ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = app; B_dData_dPair.f_Pair_second = st2 })))) (Frontend_dAst.C_Expr_EApp (first, args, ((Frontend_dParser_dSupport.v_spanOf st) st2))))
))))))))
# 1569 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtPayload = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_rowAtNameExpr e); B_dData_dPair.f_Pair_second = st1 }))))))
# 1591 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseArgs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (arg : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (arg, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 1602 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol) base)))))
# 1637 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__356; Frontend_dLexer.f_PTok_ptokPos = dtb__357 } -> (match dtb__356 with
  | Frontend_dLexer.C_Tok_TSym (dtb__358) -> (if (dtb__358 = "(") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__359) -> (if (Frontend_dParser_dSupport.v_piArrowAhead (Frontend_dParser_dSupport.v_advance st)) then ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__359)) (B_dData_dPair.v_secondOf dtb__359)) false) "(") ")") else (((v_parseParenAtom (fuel - 1)) st) blockCol))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dParser_dSupport.v_sectionOpAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__360) -> ((((v_parseSectionAtom (fuel - 1)) st) blockCol) dtb__360)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_parseParenAtom (fuel - 1)) st) blockCol)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__358 = "[") then (((v_parseListExpr (fuel - 1)) st) blockCol) else (if (dtb__358 = "?") then (match (Frontend_dParser_dSupport.v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((B_dData_dPair.v_firstOf dtb__361), (B_dData_dPair.v_secondOf dtb__361))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__358 = "{") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__362) -> ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__362)) (B_dData_dPair.v_secondOf dtb__362)) true) "{") "}")
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "|")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st3) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (base, fields, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))
  | _ -> failwith "DT: impossible branch"
) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__363) -> (if (dtb__363 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ("Type", ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__364, dtb__365, dtb__366) -> (((((v_parseTemplateAtom (fuel - 1)) st) dtb__364) dtb__365) dtb__366)
  | Frontend_dLexer.C_Tok_TStr (dtb__367) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__367, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TFloat (dtb__368) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__368, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__369) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__369, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__370) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) "{") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "{")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st1b) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__370, fields, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))))) else (if (((v_macroBangAt st1) dtb__357) dtb__370) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "!")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1b) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((v_macroAtom dtb__370) args) ((Frontend_dParser_dSupport.v_spanOf st) st2)) ((Frontend_dParser_dSupport.v_spanOf st) st1b)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__370, ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 1676 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (multi : bool) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) (Frontend_dParser_dSupport.v_fileOf st)) (Frontend_dParser_dSupport.v_pmodeOf st)) (Frontend_dParser_dSupport.v_tokSpan st)) parts)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> ((fun advanced -> ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (multi, ps, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (((((Frontend_dParser_dSupport.v_mkStateAt (Frontend_dParser_dSupport.v_fileOf st)) (advanced).Frontend_dParser_dSupport.f_PState_toksOf) endP) (advanced).Frontend_dParser_dSupport.f_PState_toksLeft) (Frontend_dParser_dSupport.v_pmodeOf st)))) (Frontend_dParser_dSupport.v_advance st))))))
# 1689 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateParts = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__371 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__373) -> ((Base_dCommon.v_bind (((((v_parseTemplateHole (v_toksFuel dtb__373)) file) mode) fallback) dtb__373)) (fun (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__372)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e)), ps))))))))
  | Frontend_dLexer.C_TmplPart_TPText (dtb__374) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__372)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__374)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 1701 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateHole = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match toks with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At fallback) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateHoleEmpty)
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> ((fun pos -> ((fun subState -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__377) -> (match dtb__377 with
  | { B_dData_dPair.f_Pair_first = dtb__378; B_dData_dPair.f_Pair_second = dtb__379 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__379) then (Base_dDiag.C_Check_OkC (dtb__378)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (((v_holeSpan file) pos))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__380) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan ((v_holeSpan file) pos)) dtb__380)))
  | _ -> failwith "DT: impossible branch"
)) (((v_parseExpr (fuel - 1)) subState) 0))) (((((Frontend_dParser_dSupport.v_mkStateAt file) toks) pos) (B_dData_dList.v_length toks)) mode))) (dtb__375).Frontend_dLexer.f_PTok_ptokPos)
  | _ -> failwith "DT: impossible branch"
)))
# 1734 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_tupleUnitSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (Frontend_dParser_dSupport.v_advance st1)) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ",") then ((Base_dCommon.v_step ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairExprs ((Frontend_dParser_dSupport.v_spanOf st) st3)) elems); B_dData_dPair.f_Pair_second = st3 })))) else (if ((Frontend_dParser_dSupport.v_atSym st2) ":") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_ascribeSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st2))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil)))), ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EParen (first, ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))))))))))))
# 1750 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (e, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))
# 1767 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseSectionAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (op : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) op)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectOp (op, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st2)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) })) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectL (op, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 1779 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePiBinder = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (names : string B_dData_dList.t_List) (implicit : bool) (openSym : string) (closeSym : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (v_anyDottedName names) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_PiBinderNameNotSimple) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) openSym)) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_consumeQty st1) qty)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st2)) (fun (names2 : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (dom : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st5) closeSym)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st6) "->")) (fun (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st7) blockCol)) (fun (cod : Frontend_dAst.t_Expr) (st8 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((v_foldPiNames names2) implicit) qty) dom) cod) ((Frontend_dParser_dSupport.v_spanOf st) st8)); B_dData_dPair.f_Pair_second = st8 })))))))))))))))))))))
# 1829 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignments = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) st) blockCol)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = fs; B_dData_dPair.f_Pair_second = st1 })))))))
# 1840 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (fname : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st3) ",") then ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st3)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, rest)); B_dData_dPair.f_Pair_second = st4 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "}")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 1849 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_listNilSyntax, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) st1) blockCol)) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldCons ((Frontend_dParser_dSupport.v_spanOf st) st2)) elems); B_dData_dPair.f_Pair_second = st2 })))))))))
# 1858 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExprElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e0 : Frontend_dAst.t_Expr) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseListElemAt (fuel - 1)) e0) st0)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))))
# 1869 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListElemAt = (fun (fuel : int) (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "@") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "@")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st1) 0)) (fun (nm : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_rowAtSyntax, ((v_spanFromExpr e) st2))), (B_dData_dList.C_List__x58__x58_ (e, (B_dData_dList.C_List__x58__x58_ ((v_rowAtNameExpr nm), B_dData_dList.C_List_Nil)))), ((v_spanFromExpr e) st2))); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e; B_dData_dPair.f_Pair_second = st })))))
# 1885 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLambda = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "\\")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseLambdaParam st1)) (fun (first : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLambdaParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (params : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "=>")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (params, body, ((Frontend_dParser_dSupport.v_spanOf st) st5))); B_dData_dPair.f_Pair_second = st5 }))))))))))))))
# 1912 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLet = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "let")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLetBindings (fuel - 1)) st1) blockCol)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "in")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (binds, body, false, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 1923 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLetBindings = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__381; Base_dSource.f_Pos_posCol = dtb__382; Base_dSource.f_Pos_posOffset = dtb__383; Base_dSource.f_Pos_posEndOffset = dtb__384 } -> (if (dtb__382 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_LetBindingNotIndented) else ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st) dtb__382)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1935 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "case")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (scrut : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "of")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCaseAlts (fuel - 1)) st3) blockCol)) (fun (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (scrut, alts, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 1944 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCaseAlts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__385; Base_dSource.f_Pos_posCol = dtb__386; Base_dSource.f_Pos_posOffset = dtb__387; Base_dSource.f_Pos_posEndOffset = dtb__388 } -> (if (dtb__386 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseAltNotIndented) else ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st) dtb__386)) (fun (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_badCaseIndent st2) dtb__386) then ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentAfterCaseAlt) else (match alts with
  | B_dData_dList.C_List_Nil -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = alts; B_dData_dPair.f_Pair_second = st2 }))
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 1966 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__389; Base_dSource.f_Pos_posCol = dtb__390; Base_dSource.f_Pos_posOffset = dtb__391; Base_dSource.f_Pos_posEndOffset = dtb__392 } -> (if (dtb__390 = altCol) then ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) altCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) altCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st3) altCol)) (fun (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = body }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
))))
# 1983 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePerform = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "perform")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) st1) blockCol)) (fun (operand : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_performSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st2))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2020 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "handle")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleComp (fuel - 1)) st1) blockCol)) (fun (comp : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "{")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleBody (fuel - 1)) st3) blockCol)) (fun (blk : t_HandleBlock) (st4 : Frontend_dParser_dSupport.t_PState) -> (match (((v_handleExpr comp) blk) ((Frontend_dParser_dSupport.v_spanOf st) st4)) with
  | Base_dDiag.C_Check_ErrC (dtb__393) -> (Base_dDiag.C_Check_ErrC (dtb__393))
  | Base_dDiag.C_Check_OkC (dtb__394) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__394; B_dData_dPair.f_Pair_second = st4 }))
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 2042 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleComp = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__395; Frontend_dLexer.f_PTok_ptokPos = dtb__396 } -> (match dtb__395 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__397) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__398) -> (match dtb__398 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__399; Frontend_dLexer.f_PTok_ptokPos = dtb__400 } -> (match dtb__399 with
  | Frontend_dLexer.C_Tok_TSym (dtb__401) -> (if (dtb__401 = "{") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__397, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (((v_parseExpr (fuel - 1)) st) blockCol))
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1))
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 2055 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (handleCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__402; Base_dSource.f_Pos_posCol = dtb__403; Base_dSource.f_Pos_posOffset = dtb__404; Base_dSource.f_Pos_posEndOffset = dtb__405 } -> (if (dtb__403 <= handleCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNotIndented) else ((Base_dCommon.v_step (((((v_parseHandleClauses (fuel - 1)) st) dtb__403) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dList.C_List_Nil)) (fun (p : ((string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe, t_HandleOp B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "}")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleBlock_HandleBlock (dtb__406, dtb__407)); B_dData_dPair.f_Pair_second = st3 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 2081 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleClauses = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (retOpt : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : t_HandleOp B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__408; Base_dSource.f_Pos_posCol = dtb__409; Base_dSource.f_Pos_posOffset = dtb__410; Base_dSource.f_Pos_posEndOffset = dtb__411 } -> (if (dtb__409 = clauseCol) then (if (v_isReturnClauseHead st) then (match retOpt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__412) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match acc with
  | B_dData_dList.C_List__x58__x58_ (dtb__413, dtb__414) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_step (((v_parseHandleRetClause (fuel - 1)) st) clauseCol)) (fun (p : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = dtb__416 } -> (match dtb__416 with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } }))) acc)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_step (((v_parseHandleOpClause (fuel - 1)) st) clauseCol)) (fun (op : t_HandleOp) (st2 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) retOpt) (B_dData_dList.C_List__x58__x58_ (op, acc)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))))
# 2111 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleRetClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_ukw : string) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st0)) (fun (x : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "->")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = x; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3 }))))))))))))
# 2121 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) clauseCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match pat with
  | Frontend_dAst.C_Pat_PCon (dtb__419, dtb__420, dtb__421) -> (match (B_dData_dList.v_reverse dtb__420) with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb__421) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
  | B_dData_dList.C_List__x58__x58_ (dtb__422, dtb__423) -> (match dtb__422 with
  | Frontend_dAst.C_Pat_PVar (dtb__424, dtb__425) -> (((((((v_handleOpTail (fuel - 1)) st1) clauseCol) dtb__419) (B_dData_dList.v_reverse dtb__423)) dtb__421) dtb__424)
  | Frontend_dAst.C_Pat_PWild (dtb__426) -> (((((((v_handleOpTail (fuel - 1)) st1) clauseCol) dtb__419) (B_dData_dList.v_reverse dtb__423)) dtb__421) "_")
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb__421) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)))))))
# 2144 "Vuna/Compiler/Frontend/Parser.vuna"
and v_handleOpTail = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (cname : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (psp : Base_dSource.t_Span) (kname : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "->")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleOp_HandleOp (cname, pats, psp, kname, body)); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2193 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseIf = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "if")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (cond : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "then")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (yes : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st4) "else")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st5) blockCol)) (fun (no : Frontend_dAst.t_Expr) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (cond, yes, no, ((Frontend_dParser_dSupport.v_spanOf st) st6))); B_dData_dPair.f_Pair_second = st6 }))))))))))))))))
# 2204 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDo = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "do")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st1) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement) else (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__427; Base_dSource.f_Pos_posCol = dtb__428; Base_dSource.f_Pos_posOffset = dtb__429; Base_dSource.f_Pos_posEndOffset = dtb__430 } -> (if (dtb__428 <= blockCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoStatementNotIndented) else ((Base_dCommon.v_step ((((v_parseDoStmts (fuel - 1)) st1) dtb__428) B_dData_dList.C_List_Nil)) (fun (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__431, dtb__432) -> (match dtb__431 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__433, dtb__434) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (stmts, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)) (B_dData_dList.v_reverse stmts)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 2227 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (acc : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__435; Base_dSource.f_Pos_posCol = dtb__436; Base_dSource.f_Pos_posOffset = dtb__437; Base_dSource.f_Pos_posEndOffset = dtb__438 } -> (if (dtb__436 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (if (dtb__436 > stmtCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((Base_dCommon.v_step (((v_parseDoStmt (fuel - 1)) st) stmtCol)) (fun (stmt : Frontend_dAst.t_DoStmt) (st1 : Frontend_dParser_dSupport.t_PState) -> (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__439; Base_dSource.f_Pos_posCol = dtb__440; Base_dSource.f_Pos_posOffset = dtb__441; Base_dSource.f_Pos_posEndOffset = dtb__442 } -> (if (Frontend_dParser_dSupport.v_isEof st1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__440 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__440 > stmtCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((((v_parseDoStmts (fuel - 1)) st1) stmtCol) (B_dData_dList.C_List__x58__x58_ (stmt, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2247 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dDiag.C_Check_ErrC (dtb__443) -> (((v_parseDoExprStmt (fuel - 1)) st) stmtCol)
  | Base_dDiag.C_Check_OkC (dtb__444) -> (match dtb__444 with
  | { B_dData_dPair.f_Pair_first = dtb__445; B_dData_dPair.f_Pair_second = dtb__446 } -> (if ((Frontend_dParser_dSupport.v_atSym dtb__446) "<-") then ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (dtb__445, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb__446) "<-")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__445, e, ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))))))) else (((v_parseDoExprStmt (fuel - 1)) st) stmtCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) stmtCol))))
# 2256 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoExprStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_sameLineState st)) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (e, ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))))

# 45 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExpressionSource = (fun (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel (((Frontend_dParser_dSupport.v_mkState "<expr>") toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict))) (((Frontend_dParser_dSupport.v_mkState "<expr>") toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict)) 0)) (fun (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC (e)) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr)))))))

# 809 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitSupersRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ",")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) 0)) (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st2) (B_dData_dList.C_List__x58__x58_ (e, acc))))))))))

# 800 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitSupers = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) 0)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil)))))))

# 935 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiom = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "axiom")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st4)) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (name, ty, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st5)) })); B_dData_dPair.f_Pair_second = st5 })))))))))))))

# 596 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiomExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseAxiom st) blockCol) kwPos)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DAxiom (dtb__447, dtb__448, dtb__449) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__447, dtb__449)))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseAxiomExport: not an axiom")
)))))

# 943 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExtern = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "extern")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__450; Frontend_dLexer.f_PTok_ptokPos = dtb__451 } -> (match dtb__450 with
  | Frontend_dLexer.C_Tok_TStr (dtb__452) -> ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__452; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) }))) (fun (cName2 : string) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st5)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (name, cName2, ty, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st6)) })); B_dData_dPair.f_Pair_second = st6 }))))))))))
  | _ -> (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("string"))) "string")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st2)))))))

# 608 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExternExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseExtern st) blockCol) kwPos)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DExtern (dtb__453, dtb__454, dtb__455, dtb__456) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__453, dtb__456)))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseExternExport: not an extern")
)))))

# 1023 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhereBindings = (fun (st : Frontend_dParser_dSupport.t_PState) (whereCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__457; Base_dSource.f_Pos_posCol = dtb__458; Base_dSource.f_Pos_posOffset = dtb__459; Base_dSource.f_Pos_posEndOffset = dtb__460 } -> (if (dtb__458 > whereCol) then ((Base_dCommon.v_step (((v_parseBindingItemsAt (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__458)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1011 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhere = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__461; Frontend_dLexer.f_PTok_ptokPos = dtb__462 } -> (match dtb__461 with
  | Frontend_dLexer.C_Tok_TKw (dtb__463) -> (if (dtb__463 = "where") then (if ((Base_dSource.v_posCol dtb__462) > blockCol) then ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))) (fun (_u : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhereBindings st1) blockCol)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 977 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseClause = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) (namePos : Base_dSource.t_Pos) -> ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhere st3) blockCol)) (fun (wheres : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> ((fun body2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (name, pats, body2, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine namePos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol namePos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset namePos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st4)) })); B_dData_dPair.f_Pair_second = st4 }))) (match wheres with
  | B_dData_dList.C_List_Nil -> body
  | B_dData_dList.C_List__x58__x58_ (dtb__464, dtb__465) -> (Frontend_dAst.C_Expr_ELet (wheres, body, true, ((Frontend_dParser_dSupport.v_spanOf st) st4)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))

# 1269 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__466; Base_dSource.f_Pos_posCol = dtb__467; Base_dSource.f_Pos_posOffset = dtb__468; Base_dSource.f_Pos_posEndOffset = dtb__469 } -> (if (dtb__467 = fieldCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) fieldCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseFieldList (fuel - 1)) st3b) fieldCol)) (fun (rest : Frontend_dAst.t_Field B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Field_fieldName = name; Frontend_dAst.f_Field_fieldType = ty; Frontend_dAst.f_Field_fieldSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (if (dtb__467 > fieldCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInRecord) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1261 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFields = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__470; Base_dSource.f_Pos_posCol = dtb__471; Base_dSource.f_Pos_posOffset = dtb__472; Base_dSource.f_Pos_posEndOffset = dtb__473 } -> (if (dtb__471 > blockCol) then (((v_parseFieldList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__471) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 717 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecordExport = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3b) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__474; B_dData_dPair.f_Pair_second = dtb__475 } -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st6 }))) (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__474, dtb__475, tier, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st6)) })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 671 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredExport = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__476; Frontend_dLexer.f_PTok_ptokPos = dtb__477 } -> (match dtb__476 with
  | Frontend_dLexer.C_Tok_TKw (dtb__478) -> (if (dtb__478 = "linear") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__479; Frontend_dLexer.f_PTok_ptokPos = dtb__480 } -> (match dtb__479 with
  | Frontend_dLexer.C_Tok_TKw (dtb__481) -> (if (dtb__481 = "record") then (((((v_parseRecordExport true) tier) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) blockCol) kwPos) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) else (if (dtb__478 = "record") then (((((v_parseRecordExport false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) kwPos) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 1238 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecord = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__482; B_dData_dPair.f_Pair_second = dtb__483 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__482, dtb__483, tier, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st6)) })); B_dData_dPair.f_Pair_second = st6 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 1195 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredDecl = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__484; Frontend_dLexer.f_PTok_ptokPos = dtb__485 } -> (match dtb__484 with
  | Frontend_dLexer.C_Tok_TKw (dtb__486) -> (if (dtb__486 = "linear") then ((fun st1 -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__487; Frontend_dLexer.f_PTok_ptokPos = dtb__488 } -> (match dtb__487 with
  | Frontend_dLexer.C_Tok_TKw (dtb__489) -> (if (dtb__489 = "record") then (((((v_parseRecord true) tier) st1) blockCol) kwPos) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st1))) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) else (if (dtb__486 = "record") then (((((v_parseRecord false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) kwPos) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 1335 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__490; Frontend_dLexer.f_PTok_ptokPos = dtb__491 } -> (match dtb__490 with
  | Frontend_dLexer.C_Tok_TSym (dtb__492) -> (if (dtb__492 = "(") then (if (v_parenIsMemberList st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) 0)) (fun (kind : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st4) ")")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) st5)) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_TraitParam_traitParamName = n; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (kind)) })) names)) rest); B_dData_dPair.f_Pair_second = st6 }))))))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__493) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitParam_traitParamName = dtb__493; Frontend_dAst.f_TraitParam_traitParamKind = B_dData_dMaybe.C_Maybe_Nothing }, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 774 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitHead = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if (v_traitSupersFollow st) then ((Base_dCommon.v_bind ((v_parseTraitSupers (Frontend_dParser_dSupport.v_stateFuel st)) st)) (fun (p : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair) -> ((fun supers -> ((fun st1 -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = supers }; B_dData_dPair.f_Pair_second = st3 }))))))) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p)))) else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1353 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMethodSigList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__494; Base_dSource.f_Pos_posCol = dtb__495; Base_dSource.f_Pos_posOffset = dtb__496; Base_dSource.f_Pos_posEndOffset = dtb__497 } -> (if (dtb__495 = methodCol) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) methodCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseMethodSigList (fuel - 1)) st3b) methodCol)) (fun (rest : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitMethod_traitMethodName = name; Frontend_dAst.f_TraitMethod_traitMethodType = ty; Frontend_dAst.f_TraitMethod_traitMethodSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (if (dtb__495 > methodCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInTrait) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1345 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigs = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__498; Base_dSource.f_Pos_posCol = dtb__499; Base_dSource.f_Pos_posOffset = dtb__500; Base_dSource.f_Pos_posEndOffset = dtb__501 } -> (if (dtb__499 > blockCol) then (((v_parseMethodSigList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__499) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 746 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitExportMembers st2)) (fun (members : Frontend_dAst.t_ExportMembers) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st4) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType ((h).f_TraitHead_traitHeadName, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st5 }))) (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st5)) }))))))))))))))

# 1316 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTrait = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st3) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = decl; B_dData_dPair.f_Pair_second = st4 }))) (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st4)) }))))))))))))

# 1409 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtxRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e, acc))) blockCol) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st3 }))))))))))))

# 1383 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtxThenExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctxThenSplit e1) hd); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil))) blockCol) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e1 }; B_dData_dPair.f_Pair_second = st1 }))))))))

# 963 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSignature = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (allowCtx : bool) (name : string) (namePos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__502; B_dData_dPair.f_Pair_second = dtb__503 } -> (match dtb__502 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, B_dData_dList.C_List_Nil, dtb__503, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine namePos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol namePos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset namePos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) })); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (if allowCtx then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, dtb__502, dtb__503, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine namePos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol namePos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset namePos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) })); B_dData_dPair.f_Pair_second = st2 })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere))
)
  | _ -> failwith "DT: impossible branch"
))))))

# 568 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedValue = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__504; Frontend_dLexer.f_PTok_ptokPos = dtb__505 } -> (match dtb__504 with
  | Frontend_dLexer.C_Tok_TSym (dtb__506) -> (if (dtb__506 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) name) (Frontend_dParser_dSupport.v_peekPos st))) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) name) (Frontend_dParser_dSupport.v_peekPos st))) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__506) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__506) dtb__505)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__506, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__506) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__506) dtb__505)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__506, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__506) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))))) (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__507) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__507) dtb__505)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__507, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__507) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__507) dtb__505)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__507, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__507) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 649 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityValue = (fun (kind : Frontend_dAst.t_Opacity) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwSpan : Base_dSource.t_Span) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__508; Frontend_dLexer.f_PTok_ptokPos = dtb__509 } -> (match dtb__508 with
  | Frontend_dLexer.C_Tok_TSym (dtb__510) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__510) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__510) dtb__509)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__510; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = ((Frontend_dParser_dSupport.v_spanOf st) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))) (Frontend_dParser_dSupport.v_advance st)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__511) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__511) dtb__509)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__511; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = ((Frontend_dParser_dSupport.v_spanOf st) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 632 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__512; Frontend_dLexer.f_PTok_ptokPos = dtb__513 } -> (match dtb__512 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__514) -> (if (dtb__514 = "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityAbstract) st1) blockCol) ((Frontend_dParser_dSupport.v_spanOf st) st1)))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))
  | Frontend_dLexer.C_Tok_TKw (dtb__515) -> (if (dtb__515 = "opaque") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "opaque")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityOpaque) st1) blockCol) ((Frontend_dParser_dSupport.v_spanOf st) st1)))) else (if (dtb__515 = "transparent") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "transparent")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityTransparent) st1) blockCol) ((Frontend_dParser_dSupport.v_spanOf st) st1)))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1440 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (v_instanceMethodStart st) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) false) name) (Frontend_dParser_dSupport.v_peekPos st)) else ((((v_parseClause st1) blockCol) name) (Frontend_dParser_dSupport.v_peekPos st))))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1430 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseInstanceDeclList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (declCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__516; Base_dSource.f_Pos_posCol = dtb__517; Base_dSource.f_Pos_posOffset = dtb__518; Base_dSource.f_Pos_posEndOffset = dtb__519 } -> (if (dtb__517 = declCol) then ((Base_dCommon.v_step ((v_parseInstanceDecl st) declCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseInstanceDeclList (fuel - 1)) st1) declCol)) (fun (rest : Frontend_dAst.t_Decl B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (decl, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__517 > declCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInInstance) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1422 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__520; Base_dSource.f_Pos_posCol = dtb__521; Base_dSource.f_Pos_posOffset = dtb__522; Base_dSource.f_Pos_posEndOffset = dtb__523 } -> (if (dtb__521 > blockCol) then (((v_parseInstanceDeclList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__521) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1377 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceTail = (fun (ctxE : Frontend_dAst.t_Expr B_dData_dList.t_List) (head : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseInstanceBody st3) blockCol)) (fun (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (ctxE, head, methods, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st4)) })); B_dData_dPair.f_Pair_second = st4 })))))))

# 1366 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstance = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "instance")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> ((((((v_parseInstanceTail dtb__524) dtb__525) st) blockCol) kwPos) st2)
  | _ -> failwith "DT: impossible branch"
))))))

# 1481 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtorList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__526; Base_dSource.f_Pos_posCol = dtb__527; Base_dSource.f_Pos_posOffset = dtb__528; Base_dSource.f_Pos_posEndOffset = dtb__529 } -> (if (dtb__527 = ctorCol) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) ctorCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtorList (fuel - 1)) st3b) ctorCol)) (fun (rest : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Ctor_ctorName = name; Frontend_dAst.f_Ctor_ctorType = ty; Frontend_dAst.f_Ctor_ctorArity = (Frontend_dParser_dSupport.v_countArrows ty); Frontend_dAst.f_Ctor_ctorSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (if (dtb__527 > ctorCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInData) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1473 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtors = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__530; Base_dSource.f_Pos_posCol = dtb__531; Base_dSource.f_Pos_posOffset = dtb__532; Base_dSource.f_Pos_posEndOffset = dtb__533 } -> (if (dtb__531 > blockCol) then (((v_parseCtorList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__531) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 682 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDataExport = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3b) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__534; B_dData_dPair.f_Pair_second = dtb__535 } -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st8 }))) (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__534, dtb__535, Frontend_dAst.C_ReprTier_ReprAuto, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st8)) })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))))

# 621 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__536; Frontend_dLexer.f_PTok_ptokPos = dtb__537 } -> (match dtb__536 with
  | Frontend_dLexer.C_Tok_TKw (dtb__538) -> (if (dtb__538 = "data") then ((((v_parseDataExport true) st1) blockCol) kwPos) else (if (dtb__538 = "record") then (((((v_parseRecordExport true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) kwPos) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st1)))))

# 513 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedPlain = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__539; Frontend_dLexer.f_PTok_ptokPos = dtb__540 } -> (match dtb__539 with
  | Frontend_dLexer.C_Tok_TSym (dtb__541) -> (((v_parseExportedValue op) st) blockCol)
  | Frontend_dLexer.C_Tok_TIdent (dtb__542) -> (if (if (if (dtb__542 = "alias") then true else (dtb__542 = "boxed")) then (v_tierFollows st) else false) then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseTieredExport (if (dtb__542 = "alias") then Frontend_dAst.C_ReprTier_ReprAlias else Frontend_dAst.C_ReprTier_ReprBoxed)) st) blockCol) dtb__540)) else (((v_parseExportedValue op) st) blockCol))
  | Frontend_dLexer.C_Tok_TKw (dtb__543) -> (if (dtb__543 = "data") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseDataExport false) st) blockCol) dtb__540)) else (if (dtb__543 = "linear") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseLinearExport st) blockCol) dtb__540)) else (if (dtb__543 = "record") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((((v_parseRecordExport false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) dtb__540)) else (if (dtb__543 = "trait") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseTraitExport st) blockCol) dtb__540)) else (if (dtb__543 = "axiom") then ((((v_parseAxiomExport op) st) blockCol) dtb__540) else (if (dtb__543 = "extern") then ((((v_parseExternExport op) st) blockCol) dtb__540) else (if (dtb__543 = "transparent") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) dtb__540) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else (if (dtb__543 = "opaque") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) dtb__540) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 507 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atKw st1) "opaque") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "opaque")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityOpaque))) st2) blockCol))) else (if (if ((Frontend_dParser_dSupport.v_atKw st1) "transparent") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "transparent")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityTransparent))) st2) blockCol))) else (if ((v_atIdentName st1) "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityAbstract))) st2) blockCol))) else (((v_parseExportedPlain B_dData_dMaybe.C_Maybe_Nothing) st1) blockCol)))))))

# 1207 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseData = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__544; B_dData_dPair.f_Pair_second = dtb__545 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__544, dtb__545, Frontend_dAst.C_ReprTier_ReprAuto, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st8)) })); B_dData_dPair.f_Pair_second = st8 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

# 1171 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__546; Frontend_dLexer.f_PTok_ptokPos = dtb__547 } -> (match dtb__546 with
  | Frontend_dLexer.C_Tok_TKw (dtb__548) -> (if (dtb__548 = "data") then ((((v_parseData true) st1) blockCol) kwPos) else (if (dtb__548 = "record") then (((((v_parseRecord true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) kwPos) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st1)))))

# 895 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__549; Frontend_dLexer.f_PTok_ptokPos = dtb__550 } -> (match dtb__549 with
  | Frontend_dLexer.C_Tok_TSym (dtb__551) -> (if (dtb__551 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) name) dtb__550) else ((((v_parseClause st1) blockCol) name) dtb__550)))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__551) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl) else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__551) dtb__550) else ((((v_parseClause st1) blockCol) dtb__551) dtb__550))) (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__552) -> (if (if (dtb__552 = "alias") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) dtb__550) else (if (if (dtb__552 = "boxed") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) dtb__550) else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__552) dtb__550) else ((((v_parseClause st1) blockCol) dtb__552) dtb__550))) (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TKw (dtb__553) -> (if (dtb__553 = "data") then ((((v_parseData false) st) blockCol) dtb__550) else (if (dtb__553 = "linear") then (((v_parseLinearDecl st) blockCol) dtb__550) else (if (dtb__553 = "axiom") then (((v_parseAxiom st) blockCol) dtb__550) else (if (dtb__553 = "extern") then (((v_parseExtern st) blockCol) dtb__550) else (if (dtb__553 = "record") then (((((v_parseRecord false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) dtb__550) else (if (dtb__553 = "trait") then (((v_parseTrait st) blockCol) dtb__550) else (if (dtb__553 = "instance") then (((v_parseInstance st) blockCol) dtb__550) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 441 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityOrDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__554; Frontend_dLexer.f_PTok_ptokPos = dtb__555 } -> (match dtb__554 with
  | Frontend_dLexer.C_Tok_TKw (dtb__556) -> (if (dtb__556 = "infixl") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 1) dtb__555)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__556 = "infixr") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 2) dtb__555)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__556 = "infix") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 0) dtb__555)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))))))))
  | _ -> (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))))))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 357 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDecls = (fun (recover : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : t_DeclAcc) (blocks : t_DeclBlock) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_reverseDeclAcc acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = st; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__557; Base_dSource.f_Pos_posCol = dtb__558; Base_dSource.f_Pos_posOffset = dtb__559; Base_dSource.f_Pos_posEndOffset = dtb__560 } -> (if (dtb__558 = blockCol) then (match ((v_parseFixityOrDecl st) blockCol) with
  | Base_dDiag.C_Check_ErrC (dtb__561) -> (if recover then ((fun st2 -> ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st2) blockCol) acc) (v_dbClose blocks))) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__562; B_dData_dPair.f_Pair_second = dtb__563 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__562; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__561, dtb__563)) } }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_recoverDecl st) blockCol)) else (Base_dDiag.C_Check_ErrC (dtb__561)))
  | Base_dDiag.C_Check_OkC (dtb__564) -> ((fun pd -> ((fun st1 -> ((fun acc2 -> ((fun verdict -> (match (B_dData_dPair.v_firstOf verdict) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__565) -> (if recover then ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))) (fun (q : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__566; B_dData_dPair.f_Pair_second = dtb__567 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = q; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__566; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__565, dtb__567)) } }))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (dtb__565)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseDecls recover) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))
  | _ -> failwith "DT: impossible branch"
)) ((v_blockStep blocks) pd))) ((v_addParsedDecl pd) acc))) (B_dData_dPair.v_secondOf dtb__564))) (B_dData_dPair.v_firstOf dtb__564))
  | _ -> failwith "DT: impossible branch"
) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn ((bi_strFromInt blockCol)))) (bi_strFromInt blockCol)))
  | _ -> failwith "DT: impossible branch"
))))

# 72 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceFile = (fun (recover : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseModDecl st)) (fun (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (imp : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match imp with
  | { B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = dtb__569 } -> (if (Frontend_dParser_dSupport.v_isEof st2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__568; Frontend_dAst.f_SourceFile_sourceFileFixities = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileDecls = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__569; Frontend_dAst.f_SourceFile_sourceFileOpacity = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) else (match (Frontend_dParser_dSupport.v_peekPos st2) with
  | { Base_dSource.f_Pos_posLine = dtb__570; Base_dSource.f_Pos_posCol = dtb__571; Base_dSource.f_Pos_posOffset = dtb__572; Base_dSource.f_Pos_posEndOffset = dtb__573 } -> ((Base_dCommon.v_step ((((((v_parseDecls recover) (Frontend_dParser_dSupport.v_stateFuel st2)) st2) dtb__571) v_emptyDeclAcc) v_emptyDeclBlock)) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__574; B_dData_dPair.f_Pair_second = dtb__575 } -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__576; f_DeclAcc_declAccDecls = dtb__577; f_DeclAcc_declAccExports = dtb__578; f_DeclAcc_declAccOpacity = dtb__579 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__574) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__568; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__576; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__577; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__578; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__569; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__579 }; B_dData_dPair.f_Pair_second = dtb__574 }; B_dData_dPair.f_Pair_second = dtb__575 })) else ((v_ps0 dtb__574) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 29 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceWithComments = (fun (file : string) (source : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__580) -> (match dtb__580 with
  | { B_dData_dPair.f_Pair_first = dtb__581; B_dData_dPair.f_Pair_second = dtb__582 } -> (match ((v_parseSourceFile false) (((Frontend_dParser_dSupport.v_mkState file) dtb__581) Frontend_dParser_dSupport.C_ParseMode_PmTool)) with
  | Base_dDiag.C_Check_ErrC (dtb__583) -> (Base_dDiag.C_Check_ErrC (dtb__583))
  | Base_dDiag.C_Check_OkC (dtb__584) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__584)); B_dData_dPair.f_Pair_second = dtb__582 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__585) -> (Base_dDiag.C_Check_ErrC (dtb__585))
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dLexer.v_lexSourceWithComments source)))

# 38 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSource = (fun (file : string) (source : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__586) -> (match dtb__586 with
  | { B_dData_dPair.f_Pair_first = dtb__587; B_dData_dPair.f_Pair_second = dtb__588 } -> (Base_dDiag.C_Check_OkC (dtb__587))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__589) -> (Base_dDiag.C_Check_ErrC (dtb__589))
  | _ -> failwith "DT: impossible branch"
)) ((v_parseSourceWithComments file) source)))

# 2503 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecoveringTokens = (fun (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_parseSourceFile true) (((Frontend_dParser_dSupport.v_mkState file) toks) mode))) (fun (p : ((Frontend_dAst.t_SourceFile, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))

# 2495 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecovering = (fun (file : string) (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (((v_parseSourceRecoveringTokens file) Frontend_dParser_dSupport.C_ParseMode_PmStrict) toks))))
