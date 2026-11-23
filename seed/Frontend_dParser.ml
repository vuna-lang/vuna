open Vuna_runtime
type t_ParsedSource = { f_ParsedSource_parsedFile : Frontend_dAst.t_SourceFile; f_ParsedSource_parsedComments : Frontend_dLexer.t_Comment B_dData_dList.t_List; f_ParsedSource_parsedRawToks : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_ParsedSource_parsedEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List }
and t_DeclAcc = { f_DeclAcc_declAccFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_DeclAcc_declAccDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DeclAcc_declAccExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_DeclAcc_declAccOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }
and t_ParsedDecl = { f_ParsedDecl_parsedFixity : Frontend_dAst.t_FixityDecl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedDecl : Frontend_dAst.t_Decl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedExport : Frontend_dAst.t_ExportSpec B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedOpacity : Frontend_dAst.t_OpacitySpec B_dData_dMaybe.t_Maybe }
and t_DeclStart = { f_DeclStart_declStartId : int; f_DeclStart_declStartPos : Base_dSource.t_Pos }
and t_DeclBlock = { f_DeclBlock_dbOpen : string B_dData_dMaybe.t_Maybe; f_DeclBlock_dbClauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DeclBlock_dbFirst : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap }
and t_TraitHead = { f_TraitHead_traitHeadName : string; f_TraitHead_traitHeadParams : Frontend_dAst.t_TraitParam B_dData_dList.t_List; f_TraitHead_traitHeadSupers : Frontend_dAst.t_Expr B_dData_dList.t_List }
and t_BindingItem = C_BindingItem_BISig of (string) * (Frontend_dAst.t_Expr) * (Frontend_dAst.t_NodeRef) | C_BindingItem_BIBind of (Frontend_dAst.t_Binding)
and t_HandleOp = C_HandleOp_HandleOp of (string) * (Frontend_dAst.t_Pat B_dData_dList.t_List) * (Frontend_dAst.t_NodeRef) * (Frontend_dAst.t_NodeRef) * (string) * (Frontend_dAst.t_Expr)
and t_HandleBlock = C_HandleBlock_HandleBlock of ((string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (t_HandleOp B_dData_dList.t_List)

# 19 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps0 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dParser_dSupport.v_tokSpan st)) e))

# 22 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps1 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (a0 : string) -> (((Base_dDiagnostics_dFrontend.v_psErr1At (Frontend_dParser_dSupport.v_tokSpan st)) e) a0))

# 25 "Vuna/Compiler/Frontend/Parser.vuna"
let v_psAt = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (args : string B_dData_dVec.t_Vec) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dParser_dSupport.v_tokSpan st)) e) args))

# 87 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclAcc = { f_DeclAcc_declAccFixities = B_dData_dList.C_List_Nil; f_DeclAcc_declAccDecls = B_dData_dList.C_List_Nil; f_DeclAcc_declAccExports = B_dData_dList.C_List_Nil; f_DeclAcc_declAccOpacity = B_dData_dList.C_List_Nil }

# 96 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyParsedDecl = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }

# 105 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declRefAt = (fun (st : Frontend_dParser_dSupport.t_PState) (ds : t_DeclStart) (end_ : Frontend_dParser_dSupport.t_PState) -> { Frontend_dAst.f_NodeRef_nodeRefId = (ds).f_DeclStart_declStartId; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) end_) })

# 214 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportItemOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportMembers) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__0) -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, dtb__0, mc2))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, B_dData_dList.C_List_Nil, mc2))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (mc0, mc2))
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespaceBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "module")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (name : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st3) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "as")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st4)) (fun (alias : string) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, (B_dData_dMaybe.C_Maybe_Just (alias)), { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st5) })); B_dData_dPair.f_Pair_second = st5 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, B_dData_dMaybe.C_Maybe_Nothing, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 }))))))))))

# 232 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespace = (fun (st : Frontend_dParser_dSupport.t_PState) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportNamespaceBody st0))))

# 262 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reexportPrefix = (fun (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> dtb__1
  | B_dData_dMaybe.C_Maybe_Nothing -> (imp).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Parser.vuna"
let v_qualifyExportItem = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__2, dtb__3, dtb__4) -> (Frontend_dAst.C_ExportItem_XNamespace (dtb__2, dtb__3, dtb__4))
  | Frontend_dAst.C_ExportItem_XModule (dtb__5, dtb__6) -> (Frontend_dAst.C_ExportItem_XModule (dtb__5, dtb__6))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__7, dtb__8, dtb__9) -> (Frontend_dAst.C_ExportItem_XTypeSome ((String.concat "" [mc0; "."; dtb__7]), dtb__8, dtb__9))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__10, dtb__11) -> (Frontend_dAst.C_ExportItem_XTypeAll ((String.concat "" [mc0; "."; dtb__10]), dtb__11))
  | Frontend_dAst.C_ExportItem_XBare (dtb__12, dtb__13) -> (Frontend_dAst.C_ExportItem_XBare ((String.concat "" [mc0; "."; dtb__12]), dtb__13))
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAlias = (fun (start : Base_dSource.t_Pos) (nid : int) (st : Frontend_dParser_dSupport.t_PState) (isQualified : bool) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "as")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (alias : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = (B_dData_dMaybe.C_Maybe_Just (alias)); Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) start) st3) } }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) start) st1) } }; B_dData_dPair.f_Pair_second = st1 }))))))

# 243 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAfterKeyword = (fun (start : Base_dSource.t_Pos) (nid : int) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "qualified")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseImportAlias start) nid) st1) true))) else ((((v_parseImportAlias start) nid) st) false)))

# 278 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpecBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "import")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos st)) (st).Frontend_dParser_dSupport.f_PState_openNodeId) st1))))

# 275 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpec = (fun (st : Frontend_dParser_dSupport.t_PState) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseImportSpecBody st0))))

# 337 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclBlock = { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 340 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClose = (fun (b : t_DeclBlock) -> { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst })

# 344 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpenAt = (fun (n : string) (sp : Base_dSource.t_Span) (b : t_DeclBlock) -> (let first2 = (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) (b).f_DeclBlock_dbFirst) then (b).f_DeclBlock_dbFirst else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) sp) (b).f_DeclBlock_dbFirst)) in { f_DeclBlock_dbOpen = (B_dData_dMaybe.C_Maybe_Just (n)); f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = first2 }))

# 350 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbAddClause = (fun (b : t_DeclBlock) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> { f_DeclBlock_dbOpen = (b).f_DeclBlock_dbOpen; f_DeclBlock_dbClauses = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pats; B_dData_dPair.f_Pair_second = sp }, (b).f_DeclBlock_dbClauses)); f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst })

# 353 "Vuna/Compiler/Frontend/Parser.vuna"
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

# 360 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_findShadow = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = dtb__21 } -> (if ((Frontend_dAst.v_clauseSubsumedBy dtb__20) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__21)) else ((v_findShadow dtb__19) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Frontend/Parser.vuna"
let v_shadowDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "an earlier clause already matches these values"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseShadowed (n))) (B_dData_dVec.C_Vec_VCons (n, B_dData_dVec.C_Vec_Nil))))))

# 364 "Vuna/Compiler/Frontend/Parser.vuna"
let v_clauseVerdict = (fun (mc0 : t_DeclBlock) (mc1 : string) (mc2 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> (if (v_anyNullary (mc0).f_DeclBlock_dbClauses) then (B_dData_dMaybe.C_Maybe_Just (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (mc3)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_DefinitionDuplicate (mc1))) (B_dData_dVec.C_Vec_VCons (mc1, B_dData_dVec.C_Vec_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (match ((v_findShadow (mc0).f_DeclBlock_dbClauses) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shadowDiag mc1) mc3) dtb__22)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
))

# 387 "Vuna/Compiler/Frontend/Parser.vuna"
let v_notAdjacentDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "the definition starts here"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseNotAdjacent (n))) (B_dData_dVec.C_Vec_VCons (n, B_dData_dVec.C_Vec_Nil))))))

# 381 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reopenDiag = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) (b).f_DeclBlock_dbFirst) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (B_dData_dMaybe.C_Maybe_Just ((((v_notAdjacentDiag n) sp) dtb__23)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockFun = (fun (b : t_DeclBlock) (n : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (if (dtb__24 = n) then { B_dData_dPair.f_Pair_first = ((((v_clauseVerdict b) n) pats) sp); B_dData_dPair.f_Pair_second = (((v_dbAddClause b) pats) sp) } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) }
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockSig = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (if (dtb__25 = n) then { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = b } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) b) }
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Frontend/Parser.vuna"
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
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_blockSig mc0) dtb__33) (Frontend_dAst.v_nodeRefSpan dtb__36))
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Decl_DFun (dtb__39, dtb__40, dtb__41, dtb__42) -> (match dtb__28 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__29 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_blockFun mc0) dtb__39) dtb__40) (Frontend_dAst.v_nodeRefSpan dtb__42))
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

# 466 "Vuna/Compiler/Frontend/Parser.vuna"
let v_addParsedDecl = (fun (mc0 : t_ParsedDecl) (mc1 : t_DeclAcc) -> (match mc0 with
  | { f_ParsedDecl_parsedFixity = dtb__48; f_ParsedDecl_parsedDecl = dtb__49; f_ParsedDecl_parsedExport = dtb__50; f_ParsedDecl_parsedOpacity = dtb__51 } -> (match mc1 with
  | { f_DeclAcc_declAccFixities = dtb__52; f_DeclAcc_declAccDecls = dtb__53; f_DeclAcc_declAccExports = dtb__54; f_DeclAcc_declAccOpacity = dtb__55 } -> (let fixities2 = (match dtb__48 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__52))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__52
  | _ -> failwith "DT: impossible branch"
) in (let decls2 = (match dtb__49 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__53))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__53
  | _ -> failwith "DT: impossible branch"
) in (let exports2 = (match dtb__50 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__54))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__54
  | _ -> failwith "DT: impossible branch"
) in (let opacity2 = (match dtb__51 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__55))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__55
  | _ -> failwith "DT: impossible branch"
) in { f_DeclAcc_declAccFixities = fixities2; f_DeclAcc_declAccDecls = decls2; f_DeclAcc_declAccExports = exports2; f_DeclAcc_declAccOpacity = opacity2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reverseDeclAcc = (fun (mc0 : t_DeclAcc) -> (match mc0 with
  | { f_DeclAcc_declAccFixities = dtb__60; f_DeclAcc_declAccDecls = dtb__61; f_DeclAcc_declAccExports = dtb__62; f_DeclAcc_declAccOpacity = dtb__63 } -> { f_DeclAcc_declAccFixities = (B_dData_dList.v_reverse dtb__60); f_DeclAcc_declAccDecls = (B_dData_dList.v_reverse dtb__61); f_DeclAcc_declAccExports = (B_dData_dList.v_reverse dtb__62); f_DeclAcc_declAccOpacity = (B_dData_dList.v_reverse dtb__63) }
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_skipToDeclLine = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> ((v_skipFrom dtb__65) mc1)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 503 "Vuna/Compiler/Frontend/Parser.vuna"
and v_skipFrom = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (if ((Base_dSource.v_posCol (dtb__66).Frontend_dLexer.f_PTok_ptokPos) = mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67)) else ((v_skipToDeclLine dtb__67) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 492 "Vuna/Compiler/Frontend/Parser.vuna"
let v_recoverDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let rest = ((v_skipToDeclLine (st).Frontend_dParser_dSupport.f_PState_toksOf) blockCol) in (let skipped = (bi_natSub (B_dData_dList.v_length (st).Frontend_dParser_dSupport.f_PState_toksOf) (B_dData_dList.v_length rest)) in { st with Frontend_dParser_dSupport.f_PState_toksOf = rest; Frontend_dParser_dSupport.f_PState_toksLeft = (B_dData_dList.v_length rest); Frontend_dParser_dSupport.f_PState_tokIndex = ((st).Frontend_dParser_dSupport.f_PState_tokIndex + skipped) })))

# 541 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportMarkerFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__68; Frontend_dLexer.f_PTok_ptokPos = dtb__69 } -> (match dtb__68 with
  | Frontend_dLexer.C_Tok_TKw (dtb__70) -> (if (dtb__70 = "data") then true else (if (dtb__70 = "record") then true else (if (dtb__70 = "trait") then true else (if (dtb__70 = "axiom") then true else (if (dtb__70 = "extern") then true else (if (dtb__70 = "linear") then true else (if (dtb__70 = "opaque") then true else (if (dtb__70 = "transparent") then true else (if (dtb__70 = "import") then true else false)))))))))
  | Frontend_dLexer.C_Tok_TSym (dtb__71) -> (if (dtb__71 = ":") then false else (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__72; Frontend_dLexer.f_PTok_ptokPos = dtb__73 } -> (match dtb__72 with
  | Frontend_dLexer.C_Tok_TSym (dtb__74) -> (if (dtb__74 = ":") then true else true)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__75) -> (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__76; Frontend_dLexer.f_PTok_ptokPos = dtb__77 } -> (match dtb__76 with
  | Frontend_dLexer.C_Tok_TSym (dtb__78) -> (if (dtb__78 = ":") then true else true)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 535 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__79; Frontend_dLexer.f_PTok_ptokPos = dtb__80 } -> (match dtb__79 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__81) -> (if (dtb__81 = "export") then (v_exportMarkerFollows (Frontend_dParser_dSupport.v_advance st)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 635 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityGiven = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 639 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacitySpecOf = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (mc1 : string) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = mc1; Frontend_dAst.f_OpacitySpec_opacityKind = dtb__83; Frontend_dAst.f_OpacitySpec_opacitySpan = mc2 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_traitSupersFollowGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match dtb__84 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__86; Frontend_dLexer.f_PTok_ptokPos = dtb__87 } -> (let nd_uscrut7 = dtb__86 in (match nd_uscrut7 with
  | Frontend_dLexer.C_Tok_TSym (dtb__88) -> (if (dtb__88 = "=>") then (mc0 = 0) else (if (dtb__88 = "(") then ((v_traitSupersFollowGo (mc0 + 1)) dtb__85) else (if (dtb__88 = ")") then ((v_traitSupersFollowGo (if (mc0 > 0) then (mc0 - 1) else 0)) dtb__85) else ((v_traitSupersFollowGo mc0) dtb__85))))
  | Frontend_dLexer.C_Tok_TKw (dtb__89) -> (if (dtb__89 = "where") then false else ((v_traitSupersFollowGo mc0) dtb__85))
  | _ -> ((v_traitSupersFollowGo mc0) dtb__85)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 870 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitSupersFollow = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((v_traitSupersFollowGo 0) (st).Frontend_dParser_dSupport.f_PState_toksOf))

# 909 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parenIsMemberList = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__90; Frontend_dLexer.f_PTok_ptokPos = dtb__91 } -> (match dtb__90 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__92) -> (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__93; Frontend_dLexer.f_PTok_ptokPos = dtb__94 } -> (match dtb__93 with
  | Frontend_dLexer.C_Tok_TSym (dtb__95) -> (if (dtb__95 = ",") then true else (if (dtb__95 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dLexer.C_Tok_TSym (dtb__96) -> (if (dtb__96 = "..") then true else (if (dtb__96 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 938 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectDeclName = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__97; Frontend_dLexer.f_PTok_ptokPos = dtb__98 } -> (match dtb__97 with
  | Frontend_dLexer.C_Tok_TSym (dtb__99) -> (if (dtb__99 = "(") then (let nd_uscrut5 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> (match dtb__100 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__101; Frontend_dLexer.f_PTok_ptokPos = dtb__102 } -> (match dtb__101 with
  | Frontend_dLexer.C_Tok_TSym (dtb__103) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__103) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (let nd_uscrut11 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> (match dtb__104 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__105; Frontend_dLexer.f_PTok_ptokPos = dtb__106 } -> (match dtb__105 with
  | Frontend_dLexer.C_Tok_TSym (dtb__107) -> (if (dtb__107 = ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) })) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator"))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__99) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__108) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 205 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMemberNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseMemberNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 199 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (if ((Frontend_dParser_dSupport.v_atSym st1) "..") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "..")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step ((v_parseMemberNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (names)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 174 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItem = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__109; Frontend_dLexer.f_PTok_ptokPos = dtb__110 } -> (match dtb__109 with
  | Frontend_dLexer.C_Tok_TSym (dtb__111) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__111) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__111, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__112) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "(") then ((Base_dCommon.v_step (v_parseExportMembers st1)) (fun (members : Frontend_dAst.t_ExportMembers) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_exportItemOf dtb__112) members) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__112, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
  | Frontend_dLexer.C_Tok_TKw (dtb__113) -> (if (dtb__113 = "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (name, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem)
)
  | _ -> failwith "DT: impossible branch"
)))

# 166 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItemAt = (fun (mc0 : bool) (mc1 : Frontend_dParser_dSupport.t_PState) -> (if mc0 then (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExportItemKind) mc1) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseExportItem st0)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExportItemRef { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf mc1) st1) }) item); B_dData_dPair.f_Pair_second = st1 })))))) else (v_parseExportItem mc1)))

# 157 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseExportItemsFrom = (fun (anchored : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step ((v_parseExportItemAt anchored) st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseExportItemsFrom anchored) (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 151 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItems = (fun (anchored : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (((v_parseExportItemsFrom anchored) (Frontend_dParser_dSupport.v_stateFuel st1)) st1)))))

# 140 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) "(") then ((Base_dCommon.v_step ((v_parseExportItems true) st2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = true; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st4) } })); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = false; Frontend_dAst.f_ModDecl_modDeclExportItems = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } })); B_dData_dPair.f_Pair_second = st3 }))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 133 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDecl = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstModHeadKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseModDeclBody st0))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 252 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseReexportTail = (fun (imp : Frontend_dAst.t_Import) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then ((Base_dCommon.v_step ((v_parseExportItems false) st)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (v_qualifyExportItem (v_reexportPrefix imp))) items) }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st1 }))))))

# 224 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImportBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "import") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "import")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos st)) (st).Frontend_dParser_dSupport.f_PState_openNodeId) st2)) (fun (imp : Frontend_dAst.t_Import) (st3 : Frontend_dParser_dSupport.t_PState) -> ((v_parseReexportTail imp) st3))))) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))

# 221 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImport = (fun (st : Frontend_dParser_dSupport.t_PState) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportImportBody st0))))

# 921 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOptionalMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then (v_parseExportMembers st) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = st }))))

# 904 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (v_parseOptionalMembers st))

# 959 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectFixityLevel = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__114; Frontend_dLexer.f_PTok_ptokPos = dtb__115 } -> (match dtb__114 with
  | Frontend_dLexer.C_Tok_TInt (dtb__116) -> (if (if (dtb__116 >= 0) then (dtb__116 <= 9) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__116; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_FixityLevelRange))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedFixityLevel)
)
  | _ -> failwith "DT: impossible branch"
)))

# 967 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectOpName = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__117; Frontend_dLexer.f_PTok_ptokPos = dtb__118 } -> (match dtb__117 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__119) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__119) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TSym (dtb__120) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__120) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)))

# 930 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) (nid : int) -> ((Base_dCommon.v_step (v_expectFixityLevel (Frontend_dParser_dSupport.v_advance st))) (fun (level : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_expectOpName st1)) (fun (op : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixityRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) kwPos) st2) } }; B_dData_dPair.f_Pair_second = st2 })))))))

# 926 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFixityKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseFixityDeclBody st0) blockCol) assoc) kwPos) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1053 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rejectCtxSuffix = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere) else (Base_dDiag.C_Check_OkC (st))))

# 1238 "Vuna/Compiler/Frontend/Parser.vuna"
let v_localFunMerge = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (match (dtb__121).Frontend_dAst.f_Binding_bindPat with
  | Frontend_dAst.C_Pat_PVar (dtb__123, dtb__124) -> (if (dtb__123 = mc0) then (match (dtb__121).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__125, dtb__126) -> (match mc1 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__127, dtb__128) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb__123, dtb__124)); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_append dtb__125) dtb__127), dtb__126)); Frontend_dAst.f_Binding_bindSig = (dtb__121).Frontend_dAst.f_Binding_bindSig; Frontend_dAst.f_Binding_bindRef = (dtb__121).Frontend_dAst.f_Binding_bindRef }, dtb__122))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1255 "Vuna/Compiler/Frontend/Parser.vuna"
let v_patBoundName = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PVar (dtb__129, dtb__130) -> dtb__129
  | _ -> ""
))

# 1259 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingSigOf = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (match dtb__131 with
  | { B_dData_dPair.f_Pair_first = dtb__133; B_dData_dPair.f_Pair_second = dtb__134 } -> (if (dtb__133 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__134)) else ((v_bindingSigOf mc0) dtb__132))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1263 "Vuna/Compiler/Frontend/Parser.vuna"
let v_hasBindingSig = (fun (name : string) (sigs : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_bindingSigOf name) sigs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1269 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstDanglingSig = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match dtb__136 with
  | { B_dData_dPair.f_Pair_first = dtb__138; B_dData_dPair.f_Pair_second = dtb__139 } -> (match dtb__139 with
  | { B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = dtb__141 } -> (if ((B_dData_dList.v_memName dtb__138) mc1) then ((v_firstDanglingSig dtb__137) mc1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__138; B_dData_dPair.f_Pair_second = dtb__141 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1199 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingBindsGo = (fun (mc0 : t_BindingItem B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (match dtb__142 with
  | C_BindingItem_BISig (dtb__144, dtb__145, dtb__146) -> (if ((B_dData_dList.v_memName dtb__144) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__146))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigBeforeClause (dtb__144))) (B_dData_dVec.C_Vec_VCons (dtb__144, B_dData_dVec.C_Vec_Nil)))))) else (if ((v_hasBindingSig dtb__144) mc1) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__146))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigDuplicate (dtb__144))) (B_dData_dVec.C_Vec_VCons (dtb__144, B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__143) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__144; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } }, mc1))) mc2) mc3)))
  | C_BindingItem_BIBind (dtb__147) -> (match (((v_localFunMerge (v_patBoundName (dtb__147).Frontend_dAst.f_Binding_bindPat)) (dtb__147).Frontend_dAst.f_Binding_bindValue) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> ((((v_bindingBindsGo dtb__143) mc1) mc2) dtb__148)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = ((v_bindingSigOf (v_patBoundName (dtb__147).Frontend_dAst.f_Binding_bindPat)) mc1) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_bindingBindsGo dtb__143) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb__147).Frontend_dAst.f_Binding_bindPat), mc2))) (B_dData_dList.C_List__x58__x58_ (dtb__147, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> (match dtb__149 with
  | { B_dData_dPair.f_Pair_first = dtb__150; B_dData_dPair.f_Pair_second = dtb__151 } -> (if ((B_dData_dList.v_memName (v_patBoundName (dtb__147).Frontend_dAst.f_Binding_bindPat)) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__151))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigMultiClause ((v_patBoundName (dtb__147).Frontend_dAst.f_Binding_bindPat)))) (B_dData_dVec.C_Vec_VCons ((v_patBoundName (dtb__147).Frontend_dAst.f_Binding_bindPat), B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__143) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb__147).Frontend_dAst.f_Binding_bindPat), mc2))) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__147).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = (dtb__147).Frontend_dAst.f_Binding_bindValue; Frontend_dAst.f_Binding_bindSig = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb__150; Frontend_dAst.f_BindingSig_sigRef = dtb__151 })); Frontend_dAst.f_Binding_bindRef = (dtb__147).Frontend_dAst.f_Binding_bindRef }, mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let nd_uscrut5 = ((v_firstDanglingSig (B_dData_dList.v_reverse mc1)) mc2) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> (match dtb__152 with
  | { B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = dtb__154 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__154))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigNoDef (dtb__153))) (B_dData_dVec.C_Vec_VCons (dtb__153, B_dData_dVec.C_Vec_Nil))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1196 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindingItemsToBinds = (fun (items : t_BindingItem B_dData_dList.t_List) -> ((((v_bindingBindsGo items) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1299 "Vuna/Compiler/Frontend/Parser.vuna"
let v_tierFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__155; Frontend_dLexer.f_PTok_ptokPos = dtb__156 } -> (match dtb__155 with
  | Frontend_dLexer.C_Tok_TKw (dtb__157) -> (if (dtb__157 = "record") then true else (if (dtb__157 = "linear") then (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__158; Frontend_dLexer.f_PTok_ptokPos = dtb__159 } -> (match dtb__158 with
  | Frontend_dLexer.C_Tok_TKw (dtb__160) -> (if (dtb__160 = "record") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 566 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__161; Frontend_dLexer.f_PTok_ptokPos = dtb__162 } -> (match dtb__161 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__163) -> (if (dtb__163 = "abstract") then true else false)
  | Frontend_dLexer.C_Tok_TKw (dtb__164) -> (if (dtb__164 = "opaque") then (B_dData_dBool.v_not (v_tierFollows st)) else (if (dtb__164 = "transparent") then (B_dData_dBool.v_not (v_tierFollows st)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1408 "Vuna/Compiler/Frontend/Parser.vuna"
let v_atIdentName = (fun (st : Frontend_dParser_dSupport.t_PState) (name : string) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__165; Frontend_dLexer.f_PTok_ptokPos = dtb__166 } -> (match dtb__165 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__167) -> (dtb__167 = name)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 291 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseImports = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "import") then ((Base_dCommon.v_step (v_parseImportSpec st)) (fun (imp : Frontend_dAst.t_Import) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__168; B_dData_dPair.f_Pair_second = dtb__169 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (imp, dtb__168)); B_dData_dPair.f_Pair_second = dtb__169 }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "import") else false) then ((Base_dCommon.v_step (v_parseExportImport st)) (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__173 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__172)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__171) dtb__173) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "module") else false) then ((Base_dCommon.v_step (v_parseExportNamespace st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__174; B_dData_dPair.f_Pair_second = dtb__175 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__174; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (item, dtb__175)) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st })))))))

# 1432 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDerivingNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseDerivingNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1426 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDerivingParens = (fun (via : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step ((v_parseDerivingNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1416 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeriving = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "deriving") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "deriving")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((v_atIdentName st1) "via") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (fld : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if (fld = "field") then ((v_parseDerivingParens true) st3) else (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("field"))) "field")))))) else ((v_parseDerivingParens false) st1)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = false }; B_dData_dPair.f_Pair_second = st }))))

# 1538 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_innermostPiCod = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> (v_innermostPiCod dtb__180)
  | _ -> mc0
))

# 1542 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_replacePiCod = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187) -> (Frontend_dAst.C_Expr_EPi (dtb__182, dtb__183, dtb__184, dtb__185, ((v_replacePiCod dtb__186) mc1), dtb__187))
  | _ -> mc1
))

# 1533 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ctxThenSplit = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_innermostPiCod (Frontend_dAst.C_Expr_EPi (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_replacePiCod (Frontend_dAst.C_Expr_EPi (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193))) mc1) }
  | _ -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = mc1 }
))

# 1598 "Vuna/Compiler/Frontend/Parser.vuna"
let v_instanceMethodStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__194; Frontend_dLexer.f_PTok_ptokPos = dtb__195 } -> (match dtb__194 with
  | Frontend_dLexer.C_Tok_TSym (dtb__196) -> (if (dtb__196 = "(") then (let nd_uscrut5 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> (match dtb__197 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__198; Frontend_dLexer.f_PTok_ptokPos = dtb__199 } -> (match dtb__198 with
  | Frontend_dLexer.C_Tok_TSym (dtb__200) -> (let nd_uscrut11 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__201) -> (match dtb__201 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__202; Frontend_dLexer.f_PTok_ptokPos = dtb__203 } -> (match dtb__202 with
  | Frontend_dLexer.C_Tok_TSym (dtb__204) -> (if (dtb__204 = ")") then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__200)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) else (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__196)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__205) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1612 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__206; Frontend_dLexer.f_PTok_ptokPos = dtb__207 } -> (match dtb__206 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__208) -> ((Base_dCommon.v_step ((v_parseParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : string B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__208, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1744 "Vuna/Compiler/Frontend/Parser.vuna"
let v_spanFromExpr = (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (let sp = (Frontend_dAst.v_exprSpan e) in (let p1 = (Frontend_dParser_dSupport.v_lastPos st2) in { Base_dSource.f_Span_spanFile = (sp).Base_dSource.f_Span_spanFile; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (Frontend_dParser_dSupport.v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) })))

# 1779 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldSuffix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (base : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ".") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ".")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (fname : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EField (base, fname, (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr base) st2))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st })))))

# 1793 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroBangAt = (fun (st : Frontend_dParser_dSupport.t_PState) (start : Base_dSource.t_Pos) (name : string) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__209; Frontend_dLexer.f_PTok_ptokPos = dtb__210 } -> (match dtb__209 with
  | Frontend_dLexer.C_Tok_TSym (dtb__211) -> (if (dtb__211 = "!") then (if ((Base_dSource.v_posLine dtb__210) = (Base_dSource.v_posLine start)) then ((Base_dSource.v_posCol dtb__210) = ((Base_dSource.v_posCol start) + (bi_strLength name))) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1800 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroAtom = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_macroSyntaxName mc0), (Frontend_dAst.v_detachedNodeRef mc3)))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_macroSyntaxName mc0), (Frontend_dAst.v_detachedNodeRef mc3))), mc1, (Frontend_dAst.v_detachedNodeRef mc2)))
))

# 1885 "Vuna/Compiler/Frontend/Parser.vuna"
let v_holeSpan = (fun (mc0 : string) (mc1 : Base_dSource.t_Pos) -> (match mc1 with
  | { Base_dSource.f_Pos_posLine = dtb__212; Base_dSource.f_Pos_posCol = dtb__213; Base_dSource.f_Pos_posOffset = dtb__214; Base_dSource.f_Pos_posEndOffset = dtb__215 } -> { Base_dSource.f_Span_spanFile = mc0; Base_dSource.f_Span_spanStartLine = dtb__212; Base_dSource.f_Span_spanStartCol = dtb__213; Base_dSource.f_Span_spanEndLine = dtb__212; Base_dSource.f_Span_spanEndCol = dtb__213; Base_dSource.f_Span_spanStartOffset = dtb__214; Base_dSource.f_Span_spanEndOffset = dtb__214 }
  | _ -> failwith "DT: impossible branch"
))

# 1889 "Vuna/Compiler/Frontend/Parser.vuna"
let v_toksFuel = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((128 * (B_dData_dList.v_length toks)) + 1024))

# 1893 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_textPartsOf = (fun (mc0 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> (match dtb__216 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__218) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_TmplPart_TPText (dtb__219) -> (match (v_textPartsOf dtb__217) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__219 ^ dtb__220)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (""))
  | _ -> failwith "DT: impossible branch"
))

# 1928 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairExprs = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__222 with
  | B_dData_dList.C_List_Nil -> dtb__221
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_tuplePairSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__221, (B_dData_dList.C_List__x58__x58_ (((v_foldPairExprs mc0) dtb__222), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_tupleUnitSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1968 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePiNamesRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__223; Frontend_dLexer.f_PTok_ptokPos = dtb__224 } -> (match dtb__223 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__225) -> (((v_parsePiNamesRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) (B_dData_dList.C_List__x58__x58_ (dtb__225, acc)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1959 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsePiNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parsePiNamesRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)))))))

# 1978 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPiNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : bool) (mc2 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__226, dtb__227) -> (Frontend_dAst.C_Expr_EPi (dtb__226, mc1, mc2, mc3, ((((((v_foldPiNames dtb__227) mc1) mc2) mc3) mc4) mc5), mc5))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 1983 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyDottedName = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (if (Base_dSource.v_containsDot dtb__228) then true else (v_anyDottedName dtb__229))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1988 "Vuna/Compiler/Frontend/Parser.vuna"
let v_consumeQty = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__230) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok mc0) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__231; Frontend_dLexer.f_PTok_ptokPos = dtb__232 } -> (match dtb__231 with
  | Frontend_dLexer.C_Tok_TInt (dtb__233) -> (if (dtb__233 = 0) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else (if (dtb__233 = 1) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)))
  | _ -> ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2049 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldCons = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_listConsSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__234, (B_dData_dList.C_List__x58__x58_ (((v_foldCons mc0) dtb__235), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_listNilSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2063 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLambdaParam = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_tokenSpan st) }; B_dData_dPair.f_Pair_second = st1 })))))

# 2067 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseLambdaParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ",") then ((Base_dCommon.v_step (v_parseLambdaParam (Frontend_dParser_dSupport.v_advance st))) (fun (p : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseLambdaParams (fuel - 1)) st1) ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (p, B_dData_dList.C_List_Nil)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = st })))))

# 2157 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rowAtNameExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__236, dtb__237) -> (Frontend_dAst.C_Expr_EStr (dtb__236, dtb__237))
  | _ -> mc0
))

# 2192 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpBinder = "@vuna@handle@o"

# 2196 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpIndexBinder = "@vuna@handle@ix"

# 2254 "Vuna/Compiler/Frontend/Parser.vuna"
let v_isReturnClauseHead = (fun (stat : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok stat) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__238; Frontend_dLexer.f_PTok_ptokPos = dtb__239 } -> (match dtb__238 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__240) -> (dtb__240 = "return")
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 2343 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpKName = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> dtb__245
  | _ -> failwith "DT: impossible branch"
))

# 2347 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstOtherKName = (fun (mc0 : t_HandleOp B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__247, dtb__248) -> (let k2 = (v_handleOpKName dtb__247) in (if (k2 = mc1) then ((v_firstOtherKName dtb__248) mc1) else (B_dData_dMaybe.C_Maybe_Just (k2))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2355 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleAlt = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254) -> { Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb__249, dtb__250, dtb__251)); Frontend_dAst.f_Alt_altBody = dtb__254; Frontend_dAst.f_Alt_altRef = dtb__252 }
  | _ -> failwith "DT: impossible branch"
))

# 2359 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleRetExpr = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (match dtb__255 with
  | { B_dData_dPair.f_Pair_first = dtb__256; B_dData_dPair.f_Pair_second = dtb__257 } -> (match dtb__257 with
  | { B_dData_dPair.f_Pair_first = dtb__258; B_dData_dPair.f_Pair_second = dtb__259 } -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__256; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__259) }, B_dData_dList.C_List_Nil)), dtb__258, dtb__259))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleNoRetSyntax, mc1))
  | _ -> failwith "DT: impossible branch"
))

# 2364 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpLam = (fun (ops : t_HandleOp B_dData_dList.t_List) (kname : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpIndexBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = kname; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (v_handleOpBinder, sp)), ((B_dData_dList.v_map v_handleAlt) ops), sp)), sp)))

# 2372 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : t_HandleBlock) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | C_HandleBlock_HandleBlock (dtb__260, dtb__261) -> (match dtb__261 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match ((v_firstOtherKName dtb__263) (v_handleOpKName dtb__262)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleSyntax, mc2)), (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (((v_handleRetExpr dtb__260) mc2), (B_dData_dList.C_List__x58__x58_ ((((v_handleOpLam (B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263))) (v_handleOpKName dtb__262)) mc2), B_dData_dList.C_List_Nil)))))), mc2))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dAst.v_nodeRefSpan mc2)) (Base_dDiagnostics_dFrontend.C_PsDiag_HandleContinuationNameMismatch ((v_handleOpKName dtb__262), dtb__264))) (B_dData_dVec.C_Vec_VCons ((v_handleOpKName dtb__262), (B_dData_dVec.C_Vec_VCons (dtb__264, B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan mc2)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2489 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_patBinderBindings = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__265, dtb__266) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__267, dtb__268) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PWild (dtb__269) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb__270, dtb__271, dtb__272) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinderBindings (B_dData_dPair.v_secondOf f)))) dtb__271)
  | Frontend_dAst.C_Pat_PCon (dtb__273, dtb__274, dtb__275) -> ((B_dData_dList.v_concatMap v_patBinderBindings) dtb__274)
  | Frontend_dAst.C_Pat_PAs (dtb__276, dtb__277, dtb__278) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__278) }, (v_patBinderBindings dtb__277)))
  | Frontend_dAst.C_Pat_PVar (dtb__279, dtb__280) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__279; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__280) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2503 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstRepeatedBindingGo = (fun (mc0 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__281, dtb__282) -> (match dtb__281 with
  | { B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = dtb__284 } -> (if ((B_dData_dList.v_memName dtb__283) mc1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = dtb__284 })) else ((v_firstRepeatedBindingGo dtb__282) (B_dData_dList.C_List__x58__x58_ (dtb__283, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2499 "Vuna/Compiler/Frontend/Parser.vuna"
let v_firstRepeatedBinding = (fun (binds : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_firstRepeatedBindingGo binds) B_dData_dList.C_List_Nil))

# 2518 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkNoRepeatedBinders = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let nd_uscrut1 = (v_firstRepeatedBinding ((B_dData_dList.v_concatMap v_patBinderBindings) pats)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (match dtb__285 with
  | { B_dData_dPair.f_Pair_first = dtb__286; B_dData_dPair.f_Pair_second = dtb__287 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__287)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_appendMessage (String.concat "" [" (repeated name: `"; dtb__286; "`)"])) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_RepeatedPatternBinder) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (pats))
  | _ -> failwith "DT: impossible branch"
)))

# 2512 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkBindersAt = (fun (st : Frontend_dParser_dSupport.t_PState) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (Frontend_dParser_dSupport.v_pmodeOf st) with
  | Frontend_dParser_dSupport.C_ParseMode_PmTool -> (Base_dDiag.C_Check_OkC (pats))
  | Frontend_dParser_dSupport.C_ParseMode_PmStrict -> (v_checkNoRepeatedBinders pats)
  | _ -> failwith "DT: impossible branch"
))

# 2636 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAsName = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__288; Frontend_dLexer.f_PTok_ptokPos = dtb__289 } -> (match dtb__288 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__290) -> (if (dtb__290 = "_") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__290; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))

# 2693 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPCon = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__291, dtb__292) -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_listConsSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__291, (B_dData_dList.C_List__x58__x58_ (((v_foldPCon mc0) dtb__292), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_listNilSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2708 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairPats = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (match dtb__294 with
  | B_dData_dList.C_List_Nil -> dtb__293
  | _ -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_tuplePairSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__293, (B_dData_dList.C_List__x58__x58_ (((v_foldPairPats mc0) dtb__294), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2527 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePatternSingle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstPatKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingleBody fuel) st0) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withPatId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) p); B_dData_dPair.f_Pair_second = st1 })))))))
# 2534 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternSingleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((v_parsePatternCons (fuel - 1)) st) blockCol)))
# 2539 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternCons = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternHead (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atSym st1) "::") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternCons (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("::", (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2548 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternHead = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__295; Frontend_dLexer.f_PTok_ptokPos = dtb__296 } -> (match dtb__295 with
  | Frontend_dLexer.C_Tok_TSym (dtb__297) -> (if (dtb__297 = "(") then (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (match dtb__298 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__299; Frontend_dLexer.f_PTok_ptokPos = dtb__300 } -> (match dtb__299 with
  | Frontend_dLexer.C_Tok_TSym (dtb__301) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__301) then (((v_parsePatternAtom (fuel - 1)) st) blockCol) else (let nd_uscrut13 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__302) -> (match dtb__302 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__303; Frontend_dLexer.f_PTok_ptokPos = dtb__304 } -> (match dtb__303 with
  | Frontend_dLexer.C_Tok_TSym (dtb__305) -> (if (dtb__305 = ")") then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__301, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
  | Frontend_dLexer.C_Tok_TIdent (dtb__306) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__306) then ((Frontend_dParser_dSupport.v_atSym st1) "{") else false) then ((Base_dCommon.v_step (((v_parseRecordPatternFields (fuel - 1)) st1) blockCol)) (fun (fields : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__306, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__306) then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__306, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2571 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternFields = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseRecordPatternList (fuel - 1)) st1) blockCol)))))
# 2580 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordPatternField (fuel - 1)) st) blockCol)) (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseRecordPatternList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "}")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2591 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternField = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__307; Frontend_dLexer.f_PTok_ptokPos = dtb__308 } -> (match dtb__307 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__309) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "=") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st2) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = pat }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Pat_PVar (dtb__309, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__308); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__308); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__308); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__308); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__308); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__308) }))) }; B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedRecordFieldPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2603 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtoms = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 2614 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_finishAsPattern (fuel - 1)) st) base) st1) blockCol)))))
# 2624 "Vuna/Compiler/Frontend/Parser.vuna"
and v_finishAsPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then (let nd_uscrut5 = base in (match nd_uscrut5 with
  | Frontend_dAst.C_Pat_PVar (dtb__310, dtb__311) -> (if (dtb__310 = "_") then ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, (Frontend_dAst.C_Pat_PWild (dtb__311)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__310, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, base, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st1 })))))
# 2645 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__312; Frontend_dLexer.f_PTok_ptokPos = dtb__313 } -> (match dtb__312 with
  | Frontend_dLexer.C_Tok_TSym (dtb__314) -> (if (dtb__314 = "(") then (if ((Frontend_dParser_dSupport.v_atSym (Frontend_dParser_dSupport.v_advance st)) ")") then (let st2 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))) else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (first : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairPats (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 })))))))) else (if (dtb__314 = "[") then (((v_parseListPattern (fuel - 1)) st) blockCol) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__315, dtb__316, dtb__317) -> (match (v_textPartsOf dtb__316) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__318) -> (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = ((Frontend_dParser_dSupport.v_withLastPos dtb__317) advanced) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__318, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateInPattern)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dLexer.C_Tok_TStr (dtb__319) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__319, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__320) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__320, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__321) -> (if (dtb__321 = "_") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__321) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__321, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__321, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2674 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_listNilSyntax, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) st1) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPCon (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2683 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPatternElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))
# 2698 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (p, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (p, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1275 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseClausePatterns = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseClausePatterns (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))

# 1131 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseBindingItemsAt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__322; Base_dSource.f_Pos_posCol = dtb__323; Base_dSource.f_Pos_posOffset = dtb__324; Base_dSource.f_Pos_posEndOffset = dtb__325 } -> (if (dtb__323 = bindCol) then ((Base_dCommon.v_step (((v_parseBindingItem (fuel - 1)) st) bindCol)) (fun (item : t_BindingItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st1) bindCol)) (fun (rest : t_BindingItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__323 > bindCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInBinding) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1143 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItem = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstBindingKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseBindingItemBody fuel) st0) bindCol)))))
# 1150 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItemBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__326; Frontend_dLexer.f_PTok_ptokPos = dtb__327 } -> (match dtb__326 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__328) -> (if (dtb__328 = "_") then (((v_parseBindingPattern fuel) st) bindCol) else (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__329) -> (match dtb__329 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__330; Frontend_dLexer.f_PTok_ptokPos = dtb__331 } -> (match dtb__330 with
  | Frontend_dLexer.C_Tok_TSym (dtb__332) -> (if (dtb__332 = ":") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance st)) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) bindCol)) (fun (ty : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st2)) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BISig (dtb__328, ty, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else (((v_parseBindingPattern fuel) st) bindCol))
  | _ -> (((v_parseBindingPattern fuel) st) bindCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parseBindingPattern fuel) st) bindCol)
)))
  | _ -> (((v_parseBindingPattern fuel) st) bindCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1169 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseBindingDef (fuel - 1)) st) st1) bindCol) pat))))
# 1176 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingDef = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__333, dtb__334) -> (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) bindCol) else false) then ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "=")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) bindCol)) (fun (value : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb__333, (Frontend_dAst.v_patRef pat))); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_Expr_ELocalFun ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = pats; Frontend_dAst.f_LocalClause_lcBody = value; Frontend_dAst.f_LocalClause_lcRef = { Frontend_dAst.f_NodeRef_nodeRefId = (stStart).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st4) }; Frontend_dAst.f_LocalClause_lcHead = (Frontend_dAst.v_patRef pat) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf stStart) st4)))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = (stStart).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st4) } })); B_dData_dPair.f_Pair_second = st4 })))))))))) else ((Base_dCommon.v_step ((((((v_parseBindingValue (fuel - 1)) stStart) st) (stStart).Frontend_dParser_dSupport.f_PState_openNodeId) pat) bindCol)) (fun (b : Frontend_dAst.t_Binding) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((((((v_parseBindingValue (fuel - 1)) stStart) st) (stStart).Frontend_dParser_dSupport.f_PState_openNodeId) pat) bindCol)) (fun (b : Frontend_dAst.t_Binding) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 }))))
)))
# 1185 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingValue = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (nid : int) (pat : Frontend_dAst.t_Pat) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "=")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = pat; Frontend_dAst.f_Binding_bindValue = value; Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st2) } }; B_dData_dPair.f_Pair_second = st2 }))))))))))
# 1650 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExprBody fuel) st0) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExprId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) e); B_dData_dPair.f_Pair_second = st1 })))))))
# 1657 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExprBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (((v_parseLhs (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st1) blockCol) lhs))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExprNotIndented)))))
# 1672 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseInfix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (lhs : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__335; Frontend_dLexer.f_PTok_ptokPos = dtb__336 } -> (match dtb__335 with
  | Frontend_dLexer.C_Tok_TSym (dtb__337) -> (if (dtb__337 = "`") then (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectValueName (Frontend_dParser_dSupport.v_advance st))) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "`")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st3) blockCol) (Frontend_dAst.C_Expr_EBacktick (name, lhs, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))) else (if (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isSyntaxSym dtb__337)) else false) then (if (Frontend_dParser_dSupport.v_closeParenNext st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectR (lhs, dtb__337, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EInfix (dtb__337, lhs, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))
# 1685 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLhs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__338; Frontend_dLexer.f_PTok_ptokPos = dtb__339 } -> (match dtb__338 with
  | Frontend_dLexer.C_Tok_TSym (dtb__340) -> (if (dtb__340 = "\\") then (((v_parseLambda (fuel - 1)) st) blockCol) else (if (dtb__340 = "-") then (((v_parseNegation (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))
  | Frontend_dLexer.C_Tok_TKw (dtb__341) -> (if (dtb__341 = "let") then (((v_parseLet (fuel - 1)) st) blockCol) else (if (dtb__341 = "case") then (((v_parseCase (fuel - 1)) st) blockCol) else (if (dtb__341 = "if") then (((v_parseIf (fuel - 1)) st) blockCol) else (if (dtb__341 = "do") then (((v_parseDo (fuel - 1)) st) blockCol) else (if (dtb__341 = "perform") then (((v_parsePerform (fuel - 1)) st) blockCol) else (if (dtb__341 = "handle") then (((v_parseHandle (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))))))
  | _ -> (((v_parseApplication (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1703 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseNegation = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__342) -> (match dtb__342 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__343; Frontend_dLexer.f_PTok_ptokPos = dtb__344 } -> (match dtb__343 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__345) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (("-" ^ dtb__345), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__346) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt ((0 - dtb__346), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
))))
# 1713 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseApplication = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st2) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_appAtSyntax, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (payload, args)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))); B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (let app = (Frontend_dAst.C_Expr_EApp (first, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))) in (if ((Frontend_dParser_dSupport.v_atSym st2) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_rowAtSyntax, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))), (B_dData_dList.C_List__x58__x58_ (app, (B_dData_dList.C_List__x58__x58_ (payload, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))); B_dData_dPair.f_Pair_second = st3 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = app; B_dData_dPair.f_Pair_second = st2 }))))
))))))))
# 1735 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtPayload = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_rowAtNameExpr e); B_dData_dPair.f_Pair_second = st1 }))))))
# 1758 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseArgs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (arg : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (arg, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 1769 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol) base)))))
# 1805 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__347; Frontend_dLexer.f_PTok_ptokPos = dtb__348 } -> (match dtb__347 with
  | Frontend_dLexer.C_Tok_TSym (dtb__349) -> (if (dtb__349 = "(") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__350) -> (if (Frontend_dParser_dSupport.v_piArrowAhead (Frontend_dParser_dSupport.v_advance st)) then ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__350)) (B_dData_dPair.v_secondOf dtb__350)) false) "(") ")") else (((v_parseParenAtom (fuel - 1)) st) blockCol))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dParser_dSupport.v_sectionOpAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__351) -> ((((v_parseSectionAtom (fuel - 1)) st) blockCol) dtb__351)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_parseParenAtom (fuel - 1)) st) blockCol)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__349 = "[") then (((v_parseListExpr (fuel - 1)) st) blockCol) else (if (dtb__349 = "?") then (match (Frontend_dParser_dSupport.v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((B_dData_dPair.v_firstOf dtb__352), (Frontend_dAst.v_detachedNodeRef (B_dData_dPair.v_secondOf dtb__352)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__349 = "{") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__353) -> ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__353)) (B_dData_dPair.v_secondOf dtb__353)) true) "{") "}")
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "|")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st3) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (base, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))
  | _ -> failwith "DT: impossible branch"
) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__354) -> (if (dtb__354 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__355, dtb__356, dtb__357) -> (((((v_parseTemplateAtom (fuel - 1)) st) dtb__355) dtb__356) dtb__357)
  | Frontend_dLexer.C_Tok_TStr (dtb__358) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__358, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TFloat (dtb__359) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__359, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__360) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__360, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__361) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "{") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "{")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st1b) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__361, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else (if (((v_macroBangAt st1) dtb__348) dtb__361) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "!")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1b) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((v_macroAtom dtb__361) args) ((Frontend_dParser_dSupport.v_spanOf st) st2)) ((Frontend_dParser_dSupport.v_spanOf st) st1b)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__361, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 })))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1844 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (multi : bool) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) (Frontend_dParser_dSupport.v_fileOf st)) (Frontend_dParser_dSupport.v_pmodeOf st)) (Frontend_dParser_dSupport.v_tokSpan st)) parts)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = ((Frontend_dParser_dSupport.v_withLastPos endP) advanced) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (multi, ps, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 1857 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateParts = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut5 = parts in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__362, dtb__363) -> (match dtb__362 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__364) -> ((Base_dCommon.v_bind (((((v_parseTemplateHole (v_toksFuel dtb__364)) file) mode) fallback) dtb__364)) (fun (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__363)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e)), ps))))))))
  | Frontend_dLexer.C_TmplPart_TPText (dtb__365) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__363)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__365)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 1869 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateHole = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match toks with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At fallback) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateHoleEmpty)
  | B_dData_dList.C_List__x58__x58_ (dtb__366, dtb__367) -> (let pos = (dtb__366).Frontend_dLexer.f_PTok_ptokPos in (let subState = (((((Frontend_dParser_dSupport.v_mkStateAt file) toks) pos) (B_dData_dList.v_length toks)) mode) in (let nd_uscrut10 = (((v_parseExpr (fuel - 1)) subState) 0) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__368) -> (match dtb__368 with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__370) then (Base_dDiag.C_Check_OkC (dtb__369)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (((v_holeSpan file) pos))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__371) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan ((v_holeSpan file) pos)) dtb__371)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 1902 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (let st2 = (Frontend_dParser_dSupport.v_advance st1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_tupleUnitSyntax, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ",") then ((Base_dCommon.v_step ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairExprs (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3))) elems); B_dData_dPair.f_Pair_second = st3 })))) else (if ((Frontend_dParser_dSupport.v_atSym st2) ":") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_ascribeSyntax, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EParen (first, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))); B_dData_dPair.f_Pair_second = st3 })))))))))))))
# 1918 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (e, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))
# 1935 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseSectionAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (op : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) op)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectOp (op, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st2))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) })) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectL (op, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 1947 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePiBinder = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (names : string B_dData_dList.t_List) (implicit : bool) (openSym : string) (closeSym : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (v_anyDottedName names) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_PiBinderNameNotSimple) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) openSym)) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_consumeQty st1) qty)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st2)) (fun (names2 : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (dom : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st5) closeSym)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st6) "->")) (fun (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st7) blockCol)) (fun (cod : Frontend_dAst.t_Expr) (st8 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((v_foldPiNames names2) implicit) qty) dom) cod) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st8))); B_dData_dPair.f_Pair_second = st8 })))))))))))))))))))))
# 1997 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignments = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) st) blockCol)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = fs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2008 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (fname : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st3) ",") then ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st3)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, rest)); B_dData_dPair.f_Pair_second = st4 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "}")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 2017 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_listNilSyntax, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) st1) blockCol)) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldCons (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) elems); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2026 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExprElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e0 : Frontend_dAst.t_Expr) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseListElemAt (fuel - 1)) e0) st0)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))))
# 2037 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListElemAt = (fun (fuel : int) (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "@") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "@")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st1) 0)) (fun (nm : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_rowAtSyntax, (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr e) st2)))), (B_dData_dList.C_List__x58__x58_ (e, (B_dData_dList.C_List__x58__x58_ ((v_rowAtNameExpr nm), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr e) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e; B_dData_dPair.f_Pair_second = st })))))
# 2053 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLambda = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "\\")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseLambdaParam st1)) (fun (first : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLambdaParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (params : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "=>")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (params, body, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st5)))); B_dData_dPair.f_Pair_second = st5 }))))))))))))))
# 2078 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLet = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "let")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLetBindings (fuel - 1)) st1) blockCol)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "in")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (binds, body, false, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2089 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLetBindings = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__372; Base_dSource.f_Pos_posCol = dtb__373; Base_dSource.f_Pos_posOffset = dtb__374; Base_dSource.f_Pos_posEndOffset = dtb__375 } -> (if (dtb__373 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_LetBindingNotIndented) else ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st) dtb__373)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 2101 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "case")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (scrut : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "of")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCaseAlts (fuel - 1)) st3) blockCol)) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (scrut, alts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2110 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCaseAlts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__376; Base_dSource.f_Pos_posCol = dtb__377; Base_dSource.f_Pos_posOffset = dtb__378; Base_dSource.f_Pos_posEndOffset = dtb__379 } -> (if (dtb__377 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseAltNotIndented) else ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st) dtb__377)) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_badCaseIndent st2) dtb__377) then ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentAfterCaseAlt) else (match alts with
  | B_dData_dList.C_List_Nil -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = alts; B_dData_dPair.f_Pair_second = st2 }))
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2132 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__380; Base_dSource.f_Pos_posCol = dtb__381; Base_dSource.f_Pos_posOffset = dtb__382; Base_dSource.f_Pos_posEndOffset = dtb__383 } -> (if (dtb__381 = altCol) then ((Base_dCommon.v_step (((v_parseAlt (fuel - 1)) st) altCol)) (fun (alt : Frontend_dAst.t_Alt) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st1) altCol)) (fun (rest : Frontend_dAst.t_Alt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (alt, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
))))
# 2143 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAlt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltBody fuel) st0) altCol)) (fun (alt : Frontend_dAst.t_Alt) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = (alt).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = (alt).Frontend_dAst.f_Alt_altBody; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) } }; B_dData_dPair.f_Pair_second = st1 })))))))
# 2150 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) altCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) altCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = body; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3 })))))))))))
# 2163 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePerform = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "perform")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) st1) blockCol)) (fun (operand : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_performSyntax, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2200 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "handle")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleComp (fuel - 1)) st1) blockCol)) (fun (comp : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "{")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleBody (fuel - 1)) st3) blockCol)) (fun (blk : t_HandleBlock) (st4 : Frontend_dParser_dSupport.t_PState) -> (match (((v_handleExpr comp) blk) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))) with
  | Base_dDiag.C_Check_ErrC (dtb__384) -> (Base_dDiag.C_Check_ErrC (dtb__384))
  | Base_dDiag.C_Check_OkC (dtb__385) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__385; B_dData_dPair.f_Pair_second = st4 }))
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 2222 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleComp = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__386; Frontend_dLexer.f_PTok_ptokPos = dtb__387 } -> (match dtb__386 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__388) -> (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__389) -> (match dtb__389 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__390; Frontend_dLexer.f_PTok_ptokPos = dtb__391 } -> (match dtb__390 with
  | Frontend_dLexer.C_Tok_TSym (dtb__392) -> (if (dtb__392 = "{") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__388, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (((v_parseExpr (fuel - 1)) st) blockCol))
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
))
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2235 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (handleCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__393; Base_dSource.f_Pos_posCol = dtb__394; Base_dSource.f_Pos_posOffset = dtb__395; Base_dSource.f_Pos_posEndOffset = dtb__396 } -> (if (dtb__394 <= handleCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNotIndented) else ((Base_dCommon.v_step (((((v_parseHandleClauses (fuel - 1)) st) dtb__394) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dList.C_List_Nil)) (fun (p : ((string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe, t_HandleOp B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = dtb__398 } -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "}")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleBlock_HandleBlock (dtb__397, dtb__398)); B_dData_dPair.f_Pair_second = st3 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 2261 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleClauses = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (retOpt : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : t_HandleOp B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__399; Base_dSource.f_Pos_posCol = dtb__400; Base_dSource.f_Pos_posOffset = dtb__401; Base_dSource.f_Pos_posEndOffset = dtb__402 } -> (if (dtb__400 = clauseCol) then (if (v_isReturnClauseHead st) then (match retOpt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__403) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match acc with
  | B_dData_dList.C_List__x58__x58_ (dtb__404, dtb__405) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_step (((v_parseHandleRetClause (fuel - 1)) st) clauseCol)) (fun (p : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut13 = p in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> (match dtb__407 with
  | { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } }))) acc)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_step (((v_parseHandleOpClause (fuel - 1)) st) clauseCol)) (fun (op : t_HandleOp) (st2 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) retOpt) (B_dData_dList.C_List__x58__x58_ (op, acc)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))))
# 2291 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleRetClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st0)) (fun (_ukw : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (x : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "->")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = x; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st0) st4) } } }; B_dData_dPair.f_Pair_second = st4 }))))))))))))))
# 2302 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseHandleOpClauseBody fuel) st0) clauseCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId)))))
# 2310 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClauseBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) clauseCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match pat with
  | Frontend_dAst.C_Pat_PCon (dtb__410, dtb__411, dtb__412) -> (match (B_dData_dList.v_reverse dtb__411) with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__412)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
  | B_dData_dList.C_List__x58__x58_ (dtb__413, dtb__414) -> (match dtb__413 with
  | Frontend_dAst.C_Pat_PVar (dtb__415, dtb__416) -> (((((((((v_handleOpTail (fuel - 1)) st) st1) clauseCol) dtb__410) (B_dData_dList.v_reverse dtb__414)) dtb__412) nid) dtb__415)
  | Frontend_dAst.C_Pat_PWild (dtb__417) -> (((((((((v_handleOpTail (fuel - 1)) st) st1) clauseCol) dtb__410) (B_dData_dList.v_reverse dtb__414)) dtb__412) nid) "_")
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__412)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)))))))
# 2333 "Vuna/Compiler/Frontend/Parser.vuna"
and v_handleOpTail = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (cname : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (psp : Frontend_dAst.t_NodeRef) (nid : int) (kname : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "->")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleOp_HandleOp (cname, pats, psp, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st2) }, kname, body)); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2385 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseIf = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "if")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (cond : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "then")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (yes : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st4) "else")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st5) blockCol)) (fun (no : Frontend_dAst.t_Expr) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (cond, yes, no, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st6)))); B_dData_dPair.f_Pair_second = st6 }))))))))))))))))
# 2396 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDo = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "do")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st1) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement) else (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__418; Base_dSource.f_Pos_posCol = dtb__419; Base_dSource.f_Pos_posOffset = dtb__420; Base_dSource.f_Pos_posEndOffset = dtb__421 } -> (if (dtb__419 <= blockCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoStatementNotIndented) else ((Base_dCommon.v_step ((((v_parseDoStmts (fuel - 1)) st1) dtb__419) B_dData_dList.C_List_Nil)) (fun (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut10 = (B_dData_dList.v_reverse stmts) in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__422, dtb__423) -> (match dtb__422 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__424, dtb__425) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (stmts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 2419 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (acc : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__426; Base_dSource.f_Pos_posCol = dtb__427; Base_dSource.f_Pos_posOffset = dtb__428; Base_dSource.f_Pos_posEndOffset = dtb__429 } -> (if (dtb__427 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (if (dtb__427 > stmtCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((Base_dCommon.v_step (((v_parseDoStmt (fuel - 1)) st) stmtCol)) (fun (stmt : Frontend_dAst.t_DoStmt) (st1 : Frontend_dParser_dSupport.t_PState) -> (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__430; Base_dSource.f_Pos_posCol = dtb__431; Base_dSource.f_Pos_posOffset = dtb__432; Base_dSource.f_Pos_posEndOffset = dtb__433 } -> (if (Frontend_dParser_dSupport.v_isEof st1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__431 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__431 > stmtCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((((v_parseDoStmts (fuel - 1)) st1) stmtCol) (B_dData_dList.C_List__x58__x58_ (stmt, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2440 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDoStmtKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseDoStmtBody fuel) st0) stmtCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))
# 2444 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmtBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "let") then ((((v_doLetOrExpr fuel) st) stmtCol) nid) else (let nd_uscrut4 = (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) stmtCol) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_ErrC (dtb__434) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | Base_dDiag.C_Check_OkC (dtb__435) -> (match dtb__435 with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> (if ((Frontend_dParser_dSupport.v_atSym dtb__437) "<-") then ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (dtb__436, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb__437) "<-")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__436, e, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 2458 "Vuna/Compiler/Frontend/Parser.vuna"
and v_doLetOrExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match ((Frontend_dParser_dSupport.v_expectKw st) "let") with
  | Base_dDiag.C_Check_ErrC (dtb__438) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | Base_dDiag.C_Check_OkC (dtb__439) -> (let nd_uscrut6 = (((v_parseLetBindings (fuel - 1)) dtb__439) stmtCol) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__440) -> (match dtb__440 with
  | { B_dData_dPair.f_Pair_first = dtb__441; B_dData_dPair.f_Pair_second = dtb__442 } -> (if ((Frontend_dParser_dSupport.v_atKw dtb__442) "in") then ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb__441, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) dtb__442) })); B_dData_dPair.f_Pair_second = dtb__442 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__443) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 2470 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoExprStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_sameLineState st)) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (e, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) })); B_dData_dPair.f_Pair_second = st1 }))))))

# 74 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExpressionSource = (fun (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel (((Frontend_dParser_dSupport.v_mkState "<expr>") toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict))) (((Frontend_dParser_dSupport.v_mkState "<expr>") toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict)) 0)) (fun (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC (e)) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr)))))))

# 892 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitSupersRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ",")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) 0)) (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st2) (B_dData_dList.C_List__x58__x58_ (e, acc))))))))))

# 883 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitSupers = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) 0)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil)))))))

# 1030 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiom = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "axiom")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st4)) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (name, ty, (((v_declRefAt st) ds) st5))); B_dData_dPair.f_Pair_second = st5 })))))))))))))

# 672 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiomExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseAxiom st) blockCol) ds)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DAxiom (dtb__444, dtb__445, dtb__446) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__444, (Frontend_dAst.v_nodeRefSpan dtb__446))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseAxiomExport: not an axiom")
)))))

# 1038 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExtern = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "extern")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut6 = (Frontend_dParser_dSupport.v_peekTok st2) in (match nd_uscrut6 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__447; Frontend_dLexer.f_PTok_ptokPos = dtb__448 } -> (match dtb__447 with
  | Frontend_dLexer.C_Tok_TStr (dtb__449) -> ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__449; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) }))) (fun (cName2 : string) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st5)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (name, cName2, ty, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))))))))))
  | _ -> (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("string"))) "string")
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 684 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExternExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseExtern st) blockCol) ds)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DExtern (dtb__450, dtb__451, dtb__452, dtb__453) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__450, (Frontend_dAst.v_nodeRefSpan dtb__453))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseExternExport: not an extern")
)))))

# 1118 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhereBindings = (fun (st : Frontend_dParser_dSupport.t_PState) (whereCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__454; Base_dSource.f_Pos_posCol = dtb__455; Base_dSource.f_Pos_posOffset = dtb__456; Base_dSource.f_Pos_posEndOffset = dtb__457 } -> (if (dtb__455 > whereCol) then ((Base_dCommon.v_step (((v_parseBindingItemsAt (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__455)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1106 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhere = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__458; Frontend_dLexer.f_PTok_ptokPos = dtb__459 } -> (match dtb__458 with
  | Frontend_dLexer.C_Tok_TKw (dtb__460) -> (if (dtb__460 = "where") then (if ((Base_dSource.v_posCol dtb__459) > blockCol) then ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))) (fun (_u : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhereBindings st1) blockCol)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1072 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseClause = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) (ds : t_DeclStart) -> ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhere st3) blockCol)) (fun (wheres : Frontend_dAst.t_Binding B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (let body2 = (match wheres with
  | B_dData_dList.C_List_Nil -> body
  | B_dData_dList.C_List__x58__x58_ (dtb__461, dtb__462) -> (Frontend_dAst.C_Expr_ELet (wheres, body, true, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))))
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (name, pats, body2, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))))

# 1400 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFieldBody = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) (nid : int) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) fieldCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = name; Frontend_dAst.f_Field_fieldType = ty; Frontend_dAst.f_Field_fieldRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1396 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseField = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFieldKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseFieldBody st0) fieldCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1385 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__463; Base_dSource.f_Pos_posCol = dtb__464; Base_dSource.f_Pos_posOffset = dtb__465; Base_dSource.f_Pos_posEndOffset = dtb__466 } -> (if (dtb__464 = fieldCol) then ((Base_dCommon.v_step ((v_parseField st) fieldCol)) (fun (fld : Frontend_dAst.t_Field) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseFieldList (fuel - 1)) st1) fieldCol)) (fun (rest : Frontend_dAst.t_Field B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (fld, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__464 > fieldCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInRecord) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1377 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFields = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__467; Base_dSource.f_Pos_posCol = dtb__468; Base_dSource.f_Pos_posOffset = dtb__469; Base_dSource.f_Pos_posEndOffset = dtb__470 } -> (if (dtb__468 > blockCol) then (((v_parseFieldList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__468) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 800 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecordExport = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3b) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__471; B_dData_dPair.f_Pair_second = dtb__472 } -> (let decl = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__471, dtb__472, tier, lin, (((v_declRefAt st) ds) st6))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st6 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 754 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredExport = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__473; Frontend_dLexer.f_PTok_ptokPos = dtb__474 } -> (match dtb__473 with
  | Frontend_dLexer.C_Tok_TKw (dtb__475) -> (if (dtb__475 = "linear") then (let nd_uscrut8 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut8 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__476; Frontend_dLexer.f_PTok_ptokPos = dtb__477 } -> (match dtb__476 with
  | Frontend_dLexer.C_Tok_TKw (dtb__478) -> (if (dtb__478 = "record") then (((((v_parseRecordExport true) tier) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__475 = "record") then (((((v_parseRecordExport false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1354 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecord = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__479; B_dData_dPair.f_Pair_second = dtb__480 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__479, dtb__480, tier, lin, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 1311 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredDecl = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__481; Frontend_dLexer.f_PTok_ptokPos = dtb__482 } -> (match dtb__481 with
  | Frontend_dLexer.C_Tok_TKw (dtb__483) -> (if (dtb__483 = "linear") then (let st1 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (let nd_uscrut9 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut9 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__484; Frontend_dLexer.f_PTok_ptokPos = dtb__485 } -> (match dtb__484 with
  | Frontend_dLexer.C_Tok_TKw (dtb__486) -> (if (dtb__486 = "record") then (((((v_parseRecord true) tier) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
))) else (if (dtb__483 = "record") then (((((v_parseRecord false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1462 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__487; Frontend_dLexer.f_PTok_ptokPos = dtb__488 } -> (match dtb__487 with
  | Frontend_dLexer.C_Tok_TSym (dtb__489) -> (if (dtb__489 = "(") then (if (v_parenIsMemberList st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) 0)) (fun (kind : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st4) ")")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) st5)) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_TraitParam_traitParamName = n; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (kind)) })) names)) rest); B_dData_dPair.f_Pair_second = st6 }))))))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__490) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitParam_traitParamName = dtb__490; Frontend_dAst.f_TraitParam_traitParamKind = B_dData_dMaybe.C_Maybe_Nothing }, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 857 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitHead = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if (v_traitSupersFollow st) then ((Base_dCommon.v_bind ((v_parseTraitSupers (Frontend_dParser_dSupport.v_stateFuel st)) st)) (fun (p : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair) -> (let supers = (B_dData_dPair.v_firstOf p) in (let st1 = (B_dData_dPair.v_secondOf p) in ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = supers }; B_dData_dPair.f_Pair_second = st3 })))))))))) else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1495 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigBody = (fun (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) (nid : int) -> ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) methodCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = name; Frontend_dAst.f_TraitMethod_traitMethodType = ty; Frontend_dAst.f_TraitMethod_traitMethodRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1491 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSig = (fun (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstMethodKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseMethodSigBody st0) methodCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1480 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMethodSigList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__491; Base_dSource.f_Pos_posCol = dtb__492; Base_dSource.f_Pos_posOffset = dtb__493; Base_dSource.f_Pos_posEndOffset = dtb__494 } -> (if (dtb__492 = methodCol) then ((Base_dCommon.v_step ((v_parseMethodSig st) methodCol)) (fun (m : Frontend_dAst.t_TraitMethod) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseMethodSigList (fuel - 1)) st1) methodCol)) (fun (rest : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (m, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__492 > methodCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInTrait) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1472 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigs = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__495; Base_dSource.f_Pos_posCol = dtb__496; Base_dSource.f_Pos_posOffset = dtb__497; Base_dSource.f_Pos_posEndOffset = dtb__498 } -> (if (dtb__496 > blockCol) then (((v_parseMethodSigList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__496) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 829 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitExportMembers st2)) (fun (members : Frontend_dAst.t_ExportMembers) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st4) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> (let decl = (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, (((v_declRefAt st) ds) st5))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType ((h).f_TraitHead_traitHeadName, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st5 }))))))))))))))

# 1443 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTrait = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st3) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (let decl = (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, (((v_declRefAt st) ds) st4))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = decl; B_dData_dPair.f_Pair_second = st4 }))))))))))))

# 1547 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtxRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e, acc))) blockCol) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st3 }))))))))))))

# 1521 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtxThenExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctxThenSplit e1) hd); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil))) blockCol) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e1 }; B_dData_dPair.f_Pair_second = st1 }))))))))

# 1058 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSignature = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (allowCtx : bool) (name : string) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__499; B_dData_dPair.f_Pair_second = dtb__500 } -> (match dtb__499 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, B_dData_dList.C_List_Nil, dtb__500, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (if allowCtx then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, dtb__499, dtb__500, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere))
)
  | _ -> failwith "DT: impossible branch"
))))))

# 644 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedValue = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__501; Frontend_dLexer.f_PTok_ptokPos = dtb__502 } -> (match dtb__501 with
  | Frontend_dLexer.C_Tok_TSym (dtb__503) -> (if (dtb__503 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__503) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__503) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__503, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__503) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__503) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__503, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__503) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__504) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__504) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__504, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__504) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__504) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__504, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__504) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name")
)
  | _ -> failwith "DT: impossible branch"
)))

# 732 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityValue = (fun (kind : Frontend_dAst.t_Opacity) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__505; Frontend_dLexer.f_PTok_ptokPos = dtb__506 } -> (match dtb__505 with
  | Frontend_dLexer.C_Tok_TSym (dtb__507) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__507) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__507) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__507; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__508) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__508) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__508; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")
)
  | _ -> failwith "DT: impossible branch"
)))

# 715 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__509; Frontend_dLexer.f_PTok_ptokPos = dtb__510 } -> (match dtb__509 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__511) -> (if (dtb__511 = "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityAbstract) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))
  | Frontend_dLexer.C_Tok_TKw (dtb__512) -> (if (dtb__512 = "opaque") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "opaque")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityOpaque) st1) blockCol) ds))) else (if (dtb__512 = "transparent") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "transparent")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityTransparent) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 708 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseOpacityDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 1588 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_instanceMethodStart st) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) false) name) ds) else ((((v_parseClause st1) blockCol) name) ds)))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1578 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (v_instanceMethodStart st) then (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseInstanceDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1568 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseInstanceDeclList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (declCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__513; Base_dSource.f_Pos_posCol = dtb__514; Base_dSource.f_Pos_posOffset = dtb__515; Base_dSource.f_Pos_posEndOffset = dtb__516 } -> (if (dtb__514 = declCol) then ((Base_dCommon.v_step ((v_parseInstanceDecl st) declCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseInstanceDeclList (fuel - 1)) st1) declCol)) (fun (rest : Frontend_dAst.t_Decl B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (decl, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__514 > declCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInInstance) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1560 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__517; Base_dSource.f_Pos_posCol = dtb__518; Base_dSource.f_Pos_posOffset = dtb__519; Base_dSource.f_Pos_posEndOffset = dtb__520 } -> (if (dtb__518 > blockCol) then (((v_parseInstanceDeclList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__518) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1515 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceTail = (fun (ctxE : Frontend_dAst.t_Expr B_dData_dList.t_List) (head : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseInstanceBody st3) blockCol)) (fun (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (ctxE, head, methods, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 })))))))

# 1504 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstance = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "instance")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__521; B_dData_dPair.f_Pair_second = dtb__522 } -> ((((((v_parseInstanceTail dtb__521) dtb__522) st) blockCol) ds) st2)
  | _ -> failwith "DT: impossible branch"
))))))

# 1643 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtorBody = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) (nid : int) -> ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) ctorCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = name; Frontend_dAst.f_Ctor_ctorType = ty; Frontend_dAst.f_Ctor_ctorArity = (Frontend_dParser_dSupport.v_countArrows ty); Frontend_dAst.f_Ctor_ctorRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1640 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtor = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstCtorKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseCtorBody st0) ctorCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1629 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtorList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__523; Base_dSource.f_Pos_posCol = dtb__524; Base_dSource.f_Pos_posOffset = dtb__525; Base_dSource.f_Pos_posEndOffset = dtb__526 } -> (if (dtb__524 = ctorCol) then ((Base_dCommon.v_step ((v_parseCtor st) ctorCol)) (fun (ctor : Frontend_dAst.t_Ctor) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtorList (fuel - 1)) st1) ctorCol)) (fun (rest : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (ctor, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__524 > ctorCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInData) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1621 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtors = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__527; Base_dSource.f_Pos_posCol = dtb__528; Base_dSource.f_Pos_posOffset = dtb__529; Base_dSource.f_Pos_posEndOffset = dtb__530 } -> (if (dtb__528 > blockCol) then (((v_parseCtorList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__528) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 765 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDataExport = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3b) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__531; B_dData_dPair.f_Pair_second = dtb__532 } -> (let decl = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__531, dtb__532, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st8 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))))

# 697 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__533; Frontend_dLexer.f_PTok_ptokPos = dtb__534 } -> (match dtb__533 with
  | Frontend_dLexer.C_Tok_TKw (dtb__535) -> (if (dtb__535 = "data") then ((((v_parseDataExport true) st1) blockCol) ds) else (if (dtb__535 = "record") then (((((v_parseRecordExport true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 589 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedPlain = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__536; Frontend_dLexer.f_PTok_ptokPos = dtb__537 } -> (match dtb__536 with
  | Frontend_dLexer.C_Tok_TSym (dtb__538) -> ((((v_parseExportedValue op) st) blockCol) ds)
  | Frontend_dLexer.C_Tok_TIdent (dtb__539) -> (if (if (if (dtb__539 = "alias") then true else (dtb__539 = "boxed")) then (v_tierFollows st) else false) then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseTieredExport (if (dtb__539 = "alias") then Frontend_dAst.C_ReprTier_ReprAlias else Frontend_dAst.C_ReprTier_ReprBoxed)) st) blockCol) ds)) else ((((v_parseExportedValue op) st) blockCol) ds))
  | Frontend_dLexer.C_Tok_TKw (dtb__540) -> (if (dtb__540 = "data") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseDataExport false) st) blockCol) ds)) else (if (dtb__540 = "linear") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseLinearExport st) blockCol) ds)) else (if (dtb__540 = "record") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((((v_parseRecordExport false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds)) else (if (dtb__540 = "trait") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseTraitExport st) blockCol) ds)) else (if (dtb__540 = "axiom") then ((((v_parseAxiomExport op) st) blockCol) ds) else (if (dtb__540 = "extern") then ((((v_parseExternExport op) st) blockCol) ds) else (if (dtb__540 = "transparent") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else (if (dtb__540 = "opaque") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 583 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atKw st1) "opaque") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "opaque")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityOpaque))) st2) blockCol) ds))) else (if (if ((Frontend_dParser_dSupport.v_atKw st1) "transparent") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "transparent")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityTransparent))) st2) blockCol) ds))) else (if ((v_atIdentName st1) "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityAbstract))) st2) blockCol) ds))) else ((((v_parseExportedPlain B_dData_dMaybe.C_Maybe_Nothing) st1) blockCol) ds)))))))

# 576 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 1323 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseData = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__541; B_dData_dPair.f_Pair_second = dtb__542 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__541, dtb__542, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))); B_dData_dPair.f_Pair_second = st8 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

# 1287 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__543; Frontend_dLexer.f_PTok_ptokPos = dtb__544 } -> (match dtb__543 with
  | Frontend_dLexer.C_Tok_TKw (dtb__545) -> (if (dtb__545 = "data") then ((((v_parseData true) st1) blockCol) ds) else (if (dtb__545 = "record") then (((((v_parseRecord true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 990 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__546; Frontend_dLexer.f_PTok_ptokPos = dtb__547 } -> (match dtb__546 with
  | Frontend_dLexer.C_Tok_TSym (dtb__548) -> (if (dtb__548 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) name) ds) else ((((v_parseClause st1) blockCol) name) ds)))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__548) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__548) ds) else ((((v_parseClause st1) blockCol) dtb__548) ds)))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__549) -> (if (if (dtb__549 = "alias") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (if (if (dtb__549 = "boxed") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__549) ds) else ((((v_parseClause st1) blockCol) dtb__549) ds)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__550) -> (if (dtb__550 = "data") then ((((v_parseData false) st) blockCol) ds) else (if (dtb__550 = "linear") then (((v_parseLinearDecl st) blockCol) ds) else (if (dtb__550 = "axiom") then (((v_parseAxiom st) blockCol) ds) else (if (dtb__550 = "extern") then (((v_parseExtern st) blockCol) ds) else (if (dtb__550 = "record") then (((((v_parseRecord false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds) else (if (dtb__550 = "trait") then (((v_parseTrait st) blockCol) ds) else (if (dtb__550 = "instance") then (((v_parseInstance st) blockCol) ds) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 983 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 509 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityOrDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__551; Frontend_dLexer.f_PTok_ptokPos = dtb__552 } -> (match dtb__551 with
  | Frontend_dLexer.C_Tok_TKw (dtb__553) -> (if (dtb__553 = "infixl") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 1) dtb__552)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__553 = "infixr") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 2) dtb__552)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__553 = "infix") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 0) dtb__552)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))))))))
  | _ -> (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))))))
)
  | _ -> failwith "DT: impossible branch"
)))

# 424 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDecls = (fun (recover : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : t_DeclAcc) (blocks : t_DeclBlock) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_reverseDeclAcc acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = st; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__554; Base_dSource.f_Pos_posCol = dtb__555; Base_dSource.f_Pos_posOffset = dtb__556; Base_dSource.f_Pos_posEndOffset = dtb__557 } -> (if (dtb__555 = blockCol) then (match ((v_parseFixityOrDecl st) blockCol) with
  | Base_dDiag.C_Check_ErrC (dtb__558) -> (if recover then (let st2 = ((v_recoverDecl st) blockCol) in ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st2) blockCol) acc) (v_dbClose blocks))) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__559; B_dData_dPair.f_Pair_second = dtb__560 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__559; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__558, dtb__560)) } }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_ErrC (dtb__558)))
  | Base_dDiag.C_Check_OkC (dtb__561) -> (let pd = (B_dData_dPair.v_firstOf dtb__561) in (let st1 = (B_dData_dPair.v_secondOf dtb__561) in (let acc2 = ((v_addParsedDecl pd) acc) in (let verdict = ((v_blockStep blocks) pd) in (match (B_dData_dPair.v_firstOf verdict) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__562) -> (if recover then ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))) (fun (q : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__563; B_dData_dPair.f_Pair_second = dtb__564 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = q; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__563; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__562, dtb__564)) } }))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (dtb__562)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseDecls recover) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn ((bi_strFromInt blockCol)))) (bi_strFromInt blockCol)))
  | _ -> failwith "DT: impossible branch"
))))

# 110 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceFile = (fun (recover : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseModDecl st)) (fun (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (imp : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match imp with
  | { B_dData_dPair.f_Pair_first = dtb__565; B_dData_dPair.f_Pair_second = dtb__566 } -> (if (Frontend_dParser_dSupport.v_isEof st2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__565; Frontend_dAst.f_SourceFile_sourceFileFixities = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileDecls = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__566; Frontend_dAst.f_SourceFile_sourceFileOpacity = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) else (match (Frontend_dParser_dSupport.v_peekPos st2) with
  | { Base_dSource.f_Pos_posLine = dtb__567; Base_dSource.f_Pos_posCol = dtb__568; Base_dSource.f_Pos_posOffset = dtb__569; Base_dSource.f_Pos_posEndOffset = dtb__570 } -> ((Base_dCommon.v_step ((((((v_parseDecls recover) (Frontend_dParser_dSupport.v_stateFuel st2)) st2) dtb__568) v_emptyDeclAcc) v_emptyDeclBlock)) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__571; B_dData_dPair.f_Pair_second = dtb__572 } -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__573; f_DeclAcc_declAccDecls = dtb__574; f_DeclAcc_declAccExports = dtb__575; f_DeclAcc_declAccOpacity = dtb__576 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__571) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__565; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__573; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__574; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__575; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__566; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__576 }; B_dData_dPair.f_Pair_second = dtb__571 }; B_dData_dPair.f_Pair_second = dtb__572 })) else ((v_ps0 dtb__571) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 47 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceDetailed = (fun (file : string) (source : string) -> (let nd_uscrut2 = (Frontend_dLexer.v_lexSourceWithComments source) in (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__577) -> (match dtb__577 with
  | { B_dData_dPair.f_Pair_first = dtb__578; B_dData_dPair.f_Pair_second = dtb__579 } -> (let st0 = (((Frontend_dParser_dSupport.v_mkState file) dtb__578) Frontend_dParser_dSupport.C_ParseMode_PmTool) in (match ((v_parseSourceFile false) st0) with
  | Base_dDiag.C_Check_ErrC (dtb__580) -> (Base_dDiag.C_Check_ErrC (dtb__580))
  | Base_dDiag.C_Check_OkC (dtb__581) -> (Base_dDiag.C_Check_OkC ({ f_ParsedSource_parsedFile = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__581)); f_ParsedSource_parsedComments = dtb__579; f_ParsedSource_parsedRawToks = dtb__578; f_ParsedSource_parsedEvents = ((Frontend_dParser_dSupport.v_eventsOf st0) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__581))) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__582) -> (Base_dDiag.C_Check_ErrC (dtb__582))
  | _ -> failwith "DT: impossible branch"
)))

# 61 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceWithComments = (fun (file : string) (source : string) -> (match ((v_parseSourceDetailed file) source) with
  | Base_dDiag.C_Check_ErrC (dtb__583) -> (Base_dDiag.C_Check_ErrC (dtb__583))
  | Base_dDiag.C_Check_OkC (dtb__584) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__584).f_ParsedSource_parsedFile; B_dData_dPair.f_Pair_second = (dtb__584).f_ParsedSource_parsedComments }))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSource = (fun (file : string) (source : string) -> (let nd_uscrut2 = ((v_parseSourceWithComments file) source) in (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__585) -> (match dtb__585 with
  | { B_dData_dPair.f_Pair_first = dtb__586; B_dData_dPair.f_Pair_second = dtb__587 } -> (Base_dDiag.C_Check_OkC (dtb__586))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__588) -> (Base_dDiag.C_Check_ErrC (dtb__588))
  | _ -> failwith "DT: impossible branch"
)))

# 2724 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecoveringTokens = (fun (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_parseSourceFile true) (((Frontend_dParser_dSupport.v_mkState file) toks) mode))) (fun (p : ((Frontend_dAst.t_SourceFile, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))

# 2716 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecovering = (fun (file : string) (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (((v_parseSourceRecoveringTokens file) Frontend_dParser_dSupport.C_ParseMode_PmStrict) toks))))
