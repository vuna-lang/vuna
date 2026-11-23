open Vuna_runtime
type t_ParsedSource = { f_ParsedSource_parsedFile : Frontend_dAst.t_SourceFile; f_ParsedSource_parsedComments : Frontend_dLexer.t_Comment B_dData_dList.t_List; f_ParsedSource_parsedRawToks : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_ParsedSource_parsedEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List }
and t_DeclAcc = { f_DeclAcc_declAccFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_DeclAcc_declAccDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DeclAcc_declAccExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_DeclAcc_declAccOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }
and t_ParsedDecl = { f_ParsedDecl_parsedFixity : Frontend_dAst.t_FixityDecl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedDecl : Frontend_dAst.t_Decl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedExport : Frontend_dAst.t_ExportSpec B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedOpacity : Frontend_dAst.t_OpacitySpec B_dData_dMaybe.t_Maybe }
and t_DeclStart = { f_DeclStart_declStartId : int; f_DeclStart_declStartPos : Base_dSource.t_Pos }
and t_DeclBlock = { f_DeclBlock_dbOpen : string B_dData_dMaybe.t_Maybe; f_DeclBlock_dbClauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DeclBlock_dbFirst : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap }
and t_TraitHead = { f_TraitHead_traitHeadName : string; f_TraitHead_traitHeadParams : Frontend_dAst.t_TraitParam B_dData_dList.t_List; f_TraitHead_traitHeadSupers : Frontend_dAst.t_Expr B_dData_dList.t_List }
and t_BindingItem = C_BindingItem_BISig of (string) * (Frontend_dAst.t_Expr) * (Frontend_dAst.t_NodeRef) | C_BindingItem_BIBind of ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair)
and t_HandleOp = C_HandleOp_HandleOp of (string) * (Frontend_dAst.t_Pat B_dData_dList.t_List) * (Frontend_dAst.t_NodeRef) * (string) * (Frontend_dAst.t_Expr)
and t_HandleBlock = C_HandleBlock_HandleBlock of ((string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (t_HandleOp B_dData_dList.t_List)

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

# 1237 "Vuna/Compiler/Frontend/Parser.vuna"
let v_localFunMerge = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr) (mc2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (match dtb__121 with
  | { B_dData_dPair.f_Pair_first = dtb__123; B_dData_dPair.f_Pair_second = dtb__124 } -> (match dtb__123 with
  | Frontend_dAst.C_Pat_PVar (dtb__125, dtb__126) -> (match dtb__124 with
  | Frontend_dAst.C_Expr_EAnn (dtb__127, dtb__128, dtb__129) -> (match dtb__127 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__130, dtb__131) -> (if (dtb__125 = mc0) then (match mc1 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__132, dtb__133) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__125, dtb__126)); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EAnn ((Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_append dtb__130) dtb__132), dtb__131)), dtb__128, dtb__129)) }, dtb__122))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_ELocalFun (dtb__134, dtb__135) -> (if (dtb__125 = mc0) then (match mc1 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__136, dtb__137) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__125, dtb__126)); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_append dtb__134) dtb__136), dtb__135)) }, dtb__122))))
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

# 1255 "Vuna/Compiler/Frontend/Parser.vuna"
let v_patBoundName = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PVar (dtb__138, dtb__139) -> dtb__138
  | _ -> ""
))

# 1259 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingSigOf = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (match dtb__140 with
  | { B_dData_dPair.f_Pair_first = dtb__142; B_dData_dPair.f_Pair_second = dtb__143 } -> (if (dtb__142 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__143)) else ((v_bindingSigOf mc0) dtb__141))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1263 "Vuna/Compiler/Frontend/Parser.vuna"
let v_hasBindingSig = (fun (name : string) (sigs : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_bindingSigOf name) sigs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1269 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstDanglingSig = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match dtb__145 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (if ((B_dData_dList.v_memName dtb__147) mc1) then ((v_firstDanglingSig dtb__146) mc1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__150 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1199 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingBindsGo = (fun (mc0 : t_BindingItem B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (let nd_uscrut7 = dtb__151 in (match nd_uscrut7 with
  | C_BindingItem_BIBind (dtb__153) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 } -> (match (((v_localFunMerge (v_patBoundName dtb__154)) dtb__155) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> ((((v_bindingBindsGo dtb__152) mc1) mc2) dtb__156)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut14 = ((v_bindingSigOf (v_patBoundName dtb__154)) mc1) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_bindingBindsGo dtb__152) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName dtb__154), mc2))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 }, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (match dtb__157 with
  | { B_dData_dPair.f_Pair_first = dtb__158; B_dData_dPair.f_Pair_second = dtb__159 } -> (if ((B_dData_dList.v_memName (v_patBoundName dtb__154)) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__159))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigMultiClause ((v_patBoundName dtb__154)))) (B_dData_dVec.C_Vec_VCons ((v_patBoundName dtb__154), B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__152) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName dtb__154), mc2))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EAnn (dtb__155, dtb__158, dtb__159)) }, mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_BindingItem_BISig (dtb__160, dtb__161, dtb__162) -> (if ((B_dData_dList.v_memName dtb__160) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__162))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigBeforeClause (dtb__160))) (B_dData_dVec.C_Vec_VCons (dtb__160, B_dData_dVec.C_Vec_Nil)))))) else (if ((v_hasBindingSig dtb__160) mc1) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__162))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigDuplicate (dtb__160))) (B_dData_dVec.C_Vec_VCons (dtb__160, B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__152) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } }, mc1))) mc2) mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (let nd_uscrut5 = ((v_firstDanglingSig (B_dData_dList.v_reverse mc1)) mc2) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__165))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigNoDef (dtb__164))) (B_dData_dVec.C_Vec_VCons (dtb__164, B_dData_dVec.C_Vec_Nil))))))
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
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__166; Frontend_dLexer.f_PTok_ptokPos = dtb__167 } -> (match dtb__166 with
  | Frontend_dLexer.C_Tok_TKw (dtb__168) -> (if (dtb__168 = "record") then true else (if (dtb__168 = "linear") then (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__169; Frontend_dLexer.f_PTok_ptokPos = dtb__170 } -> (match dtb__169 with
  | Frontend_dLexer.C_Tok_TKw (dtb__171) -> (if (dtb__171 = "record") then true else false)
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
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__172; Frontend_dLexer.f_PTok_ptokPos = dtb__173 } -> (match dtb__172 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__174) -> (if (dtb__174 = "abstract") then true else false)
  | Frontend_dLexer.C_Tok_TKw (dtb__175) -> (if (dtb__175 = "opaque") then (B_dData_dBool.v_not (v_tierFollows st)) else (if (dtb__175 = "transparent") then (B_dData_dBool.v_not (v_tierFollows st)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1408 "Vuna/Compiler/Frontend/Parser.vuna"
let v_atIdentName = (fun (st : Frontend_dParser_dSupport.t_PState) (name : string) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__176; Frontend_dLexer.f_PTok_ptokPos = dtb__177 } -> (match dtb__176 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__178) -> (dtb__178 = name)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 291 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseImports = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "import") then ((Base_dCommon.v_step (v_parseImportSpec st)) (fun (imp : Frontend_dAst.t_Import) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (imp, dtb__179)); B_dData_dPair.f_Pair_second = dtb__180 }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "import") else false) then ((Base_dCommon.v_step (v_parseExportImport st)) (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__183)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__182) dtb__184) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "module") else false) then ((Base_dCommon.v_step (v_parseExportNamespace st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (item, dtb__186)) }; B_dData_dPair.f_Pair_second = st2 }))
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
  | Frontend_dAst.C_Expr_EPi (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> (v_innermostPiCod dtb__191)
  | _ -> mc0
))

# 1542 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_replacePiCod = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198) -> (Frontend_dAst.C_Expr_EPi (dtb__193, dtb__194, dtb__195, dtb__196, ((v_replacePiCod dtb__197) mc1), dtb__198))
  | _ -> mc1
))

# 1533 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ctxThenSplit = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_innermostPiCod (Frontend_dAst.C_Expr_EPi (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_replacePiCod (Frontend_dAst.C_Expr_EPi (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204))) mc1) }
  | _ -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = mc1 }
))

# 1598 "Vuna/Compiler/Frontend/Parser.vuna"
let v_instanceMethodStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__205; Frontend_dLexer.f_PTok_ptokPos = dtb__206 } -> (match dtb__205 with
  | Frontend_dLexer.C_Tok_TSym (dtb__207) -> (if (dtb__207 = "(") then (let nd_uscrut5 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (match dtb__208 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__209; Frontend_dLexer.f_PTok_ptokPos = dtb__210 } -> (match dtb__209 with
  | Frontend_dLexer.C_Tok_TSym (dtb__211) -> (let nd_uscrut11 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> (match dtb__212 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__213; Frontend_dLexer.f_PTok_ptokPos = dtb__214 } -> (match dtb__213 with
  | Frontend_dLexer.C_Tok_TSym (dtb__215) -> (if (dtb__215 = ")") then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__211)) else false)
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
)) else (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__207)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__216) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1612 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__217; Frontend_dLexer.f_PTok_ptokPos = dtb__218 } -> (match dtb__217 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__219) -> ((Base_dCommon.v_step ((v_parseParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : string B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__219, rest)); B_dData_dPair.f_Pair_second = st1 }))))
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
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__220; Frontend_dLexer.f_PTok_ptokPos = dtb__221 } -> (match dtb__220 with
  | Frontend_dLexer.C_Tok_TSym (dtb__222) -> (if (dtb__222 = "!") then (if ((Base_dSource.v_posLine dtb__221) = (Base_dSource.v_posLine start)) then ((Base_dSource.v_posCol dtb__221) = ((Base_dSource.v_posCol start) + (bi_strLength name))) else false) else false)
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
  | { Base_dSource.f_Pos_posLine = dtb__223; Base_dSource.f_Pos_posCol = dtb__224; Base_dSource.f_Pos_posOffset = dtb__225; Base_dSource.f_Pos_posEndOffset = dtb__226 } -> { Base_dSource.f_Span_spanFile = mc0; Base_dSource.f_Span_spanStartLine = dtb__223; Base_dSource.f_Span_spanStartCol = dtb__224; Base_dSource.f_Span_spanEndLine = dtb__223; Base_dSource.f_Span_spanEndCol = dtb__224; Base_dSource.f_Span_spanStartOffset = dtb__225; Base_dSource.f_Span_spanEndOffset = dtb__225 }
  | _ -> failwith "DT: impossible branch"
))

# 1889 "Vuna/Compiler/Frontend/Parser.vuna"
let v_toksFuel = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((128 * (B_dData_dList.v_length toks)) + 1024))

# 1893 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_textPartsOf = (fun (mc0 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__227, dtb__228) -> (match dtb__227 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__229) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_TmplPart_TPText (dtb__230) -> (match (v_textPartsOf dtb__228) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__231) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__230 ^ dtb__231)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (""))
  | _ -> failwith "DT: impossible branch"
))

# 1928 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairExprs = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__233 with
  | B_dData_dList.C_List_Nil -> dtb__232
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_tuplePairSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__232, (B_dData_dList.C_List__x58__x58_ (((v_foldPairExprs mc0) dtb__233), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_tupleUnitSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1968 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePiNamesRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__234; Frontend_dLexer.f_PTok_ptokPos = dtb__235 } -> (match dtb__234 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__236) -> (((v_parsePiNamesRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) (B_dData_dList.C_List__x58__x58_ (dtb__236, acc)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1959 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsePiNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parsePiNamesRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)))))))

# 1978 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPiNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : bool) (mc2 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> (Frontend_dAst.C_Expr_EPi (dtb__237, mc1, mc2, mc3, ((((((v_foldPiNames dtb__238) mc1) mc2) mc3) mc4) mc5), mc5))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 1983 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyDottedName = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (if (Base_dSource.v_containsDot dtb__239) then true else (v_anyDottedName dtb__240))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1988 "Vuna/Compiler/Frontend/Parser.vuna"
let v_consumeQty = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok mc0) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__242; Frontend_dLexer.f_PTok_ptokPos = dtb__243 } -> (match dtb__242 with
  | Frontend_dLexer.C_Tok_TInt (dtb__244) -> (if (dtb__244 = 0) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else (if (dtb__244 = 1) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)))
  | _ -> ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2049 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldCons = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__245, dtb__246) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_listConsSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__245, (B_dData_dList.C_List__x58__x58_ (((v_foldCons mc0) dtb__246), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_listNilSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2063 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLambdaParam = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_tokenSpan st) }; B_dData_dPair.f_Pair_second = st1 })))))

# 2067 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseLambdaParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ",") then ((Base_dCommon.v_step (v_parseLambdaParam (Frontend_dParser_dSupport.v_advance st))) (fun (p : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseLambdaParams (fuel - 1)) st1) ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (p, B_dData_dList.C_List_Nil)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = st })))))

# 2153 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rowAtNameExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__247, dtb__248) -> (Frontend_dAst.C_Expr_EStr (dtb__247, dtb__248))
  | _ -> mc0
))

# 2188 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpBinder = "@vuna@handle@o"

# 2192 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpIndexBinder = "@vuna@handle@ix"

# 2250 "Vuna/Compiler/Frontend/Parser.vuna"
let v_isReturnClauseHead = (fun (stat : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok stat) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__249; Frontend_dLexer.f_PTok_ptokPos = dtb__250 } -> (match dtb__249 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__251) -> (dtb__251 = "return")
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 2330 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpKName = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__255
  | _ -> failwith "DT: impossible branch"
))

# 2334 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstOtherKName = (fun (mc0 : t_HandleOp B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (let k2 = (v_handleOpKName dtb__257) in (if (k2 = mc1) then ((v_firstOtherKName dtb__258) mc1) else (B_dData_dMaybe.C_Maybe_Just (k2))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2342 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleAlt = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__259, dtb__260, dtb__261, dtb__262, dtb__263) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__259, dtb__260, dtb__261)); B_dData_dPair.f_Pair_second = dtb__263 }
  | _ -> failwith "DT: impossible branch"
))

# 2346 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleRetExpr = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (match dtb__264 with
  | { B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__266 } -> (match dtb__266 with
  | { B_dData_dPair.f_Pair_first = dtb__267; B_dData_dPair.f_Pair_second = dtb__268 } -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__268 }, B_dData_dList.C_List_Nil)), dtb__267, mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleNoRetSyntax, mc1))
  | _ -> failwith "DT: impossible branch"
))

# 2351 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpLam = (fun (ops : t_HandleOp B_dData_dList.t_List) (kname : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpIndexBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = kname; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (v_handleOpBinder, sp)), ((B_dData_dList.v_map v_handleAlt) ops), sp)), sp)))

# 2359 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : t_HandleBlock) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | C_HandleBlock_HandleBlock (dtb__269, dtb__270) -> (match dtb__270 with
  | B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__272) -> (match ((v_firstOtherKName dtb__272) (v_handleOpKName dtb__271)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleSyntax, mc2)), (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (((v_handleRetExpr dtb__269) mc2), (B_dData_dList.C_List__x58__x58_ ((((v_handleOpLam (B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__272))) (v_handleOpKName dtb__271)) mc2), B_dData_dList.C_List_Nil)))))), mc2))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dAst.v_nodeRefSpan mc2)) (Base_dDiagnostics_dFrontend.C_PsDiag_HandleContinuationNameMismatch ((v_handleOpKName dtb__271), dtb__273))) (B_dData_dVec.C_Vec_VCons ((v_handleOpKName dtb__271), (B_dData_dVec.C_Vec_VCons (dtb__273, B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan mc2)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2476 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_patBinderBindings = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__274, dtb__275) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__276, dtb__277) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PWild (dtb__278) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb__279, dtb__280, dtb__281) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinderBindings (B_dData_dPair.v_secondOf f)))) dtb__280)
  | Frontend_dAst.C_Pat_PCon (dtb__282, dtb__283, dtb__284) -> ((B_dData_dList.v_concatMap v_patBinderBindings) dtb__283)
  | Frontend_dAst.C_Pat_PAs (dtb__285, dtb__286, dtb__287) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__285; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__287) }, (v_patBinderBindings dtb__286)))
  | Frontend_dAst.C_Pat_PVar (dtb__288, dtb__289) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__288; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__289) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2490 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstRepeatedBindingGo = (fun (mc0 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__290, dtb__291) -> (match dtb__290 with
  | { B_dData_dPair.f_Pair_first = dtb__292; B_dData_dPair.f_Pair_second = dtb__293 } -> (if ((B_dData_dList.v_memName dtb__292) mc1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__292; B_dData_dPair.f_Pair_second = dtb__293 })) else ((v_firstRepeatedBindingGo dtb__291) (B_dData_dList.C_List__x58__x58_ (dtb__292, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2486 "Vuna/Compiler/Frontend/Parser.vuna"
let v_firstRepeatedBinding = (fun (binds : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_firstRepeatedBindingGo binds) B_dData_dList.C_List_Nil))

# 2505 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkNoRepeatedBinders = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let nd_uscrut1 = (v_firstRepeatedBinding ((B_dData_dList.v_concatMap v_patBinderBindings) pats)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__294) -> (match dtb__294 with
  | { B_dData_dPair.f_Pair_first = dtb__295; B_dData_dPair.f_Pair_second = dtb__296 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__296)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_appendMessage (String.concat "" [" (repeated name: `"; dtb__295; "`)"])) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_RepeatedPatternBinder) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (pats))
  | _ -> failwith "DT: impossible branch"
)))

# 2499 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkBindersAt = (fun (st : Frontend_dParser_dSupport.t_PState) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (Frontend_dParser_dSupport.v_pmodeOf st) with
  | Frontend_dParser_dSupport.C_ParseMode_PmTool -> (Base_dDiag.C_Check_OkC (pats))
  | Frontend_dParser_dSupport.C_ParseMode_PmStrict -> (v_checkNoRepeatedBinders pats)
  | _ -> failwith "DT: impossible branch"
))

# 2623 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAsName = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__297; Frontend_dLexer.f_PTok_ptokPos = dtb__298 } -> (match dtb__297 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__299) -> (if (dtb__299 = "_") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__299; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))

# 2680 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPCon = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__300, dtb__301) -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_listConsSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__300, (B_dData_dList.C_List__x58__x58_ (((v_foldPCon mc0) dtb__301), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_listNilSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2695 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairPats = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__302, dtb__303) -> (match dtb__303 with
  | B_dData_dList.C_List_Nil -> dtb__302
  | _ -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_tuplePairSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__302, (B_dData_dList.C_List__x58__x58_ (((v_foldPairPats mc0) dtb__303), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2514 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePatternSingle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstPatKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingleBody fuel) st0) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withPatId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) p); B_dData_dPair.f_Pair_second = st1 })))))))
# 2521 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternSingleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((v_parsePatternCons (fuel - 1)) st) blockCol)))
# 2526 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternCons = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternHead (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atSym st1) "::") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternCons (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("::", (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2535 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternHead = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__304; Frontend_dLexer.f_PTok_ptokPos = dtb__305 } -> (match dtb__304 with
  | Frontend_dLexer.C_Tok_TSym (dtb__306) -> (if (dtb__306 = "(") then (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__307) -> (match dtb__307 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__308; Frontend_dLexer.f_PTok_ptokPos = dtb__309 } -> (match dtb__308 with
  | Frontend_dLexer.C_Tok_TSym (dtb__310) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__310) then (((v_parsePatternAtom (fuel - 1)) st) blockCol) else (let nd_uscrut13 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__311) -> (match dtb__311 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__312; Frontend_dLexer.f_PTok_ptokPos = dtb__313 } -> (match dtb__312 with
  | Frontend_dLexer.C_Tok_TSym (dtb__314) -> (if (dtb__314 = ")") then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__310, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
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
  | Frontend_dLexer.C_Tok_TIdent (dtb__315) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__315) then ((Frontend_dParser_dSupport.v_atSym st1) "{") else false) then ((Base_dCommon.v_step (((v_parseRecordPatternFields (fuel - 1)) st1) blockCol)) (fun (fields : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__315, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__315) then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__315, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2558 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternFields = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseRecordPatternList (fuel - 1)) st1) blockCol)))))
# 2567 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordPatternField (fuel - 1)) st) blockCol)) (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseRecordPatternList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "}")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2578 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternField = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__316; Frontend_dLexer.f_PTok_ptokPos = dtb__317 } -> (match dtb__316 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__318) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "=") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st2) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__318; B_dData_dPair.f_Pair_second = pat }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__318; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Pat_PVar (dtb__318, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__317); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__317); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__317); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__317); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__317); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__317) }))) }; B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedRecordFieldPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2590 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtoms = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 2601 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_finishAsPattern (fuel - 1)) st) base) st1) blockCol)))))
# 2611 "Vuna/Compiler/Frontend/Parser.vuna"
and v_finishAsPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then (let nd_uscrut5 = base in (match nd_uscrut5 with
  | Frontend_dAst.C_Pat_PVar (dtb__319, dtb__320) -> (if (dtb__319 = "_") then ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, (Frontend_dAst.C_Pat_PWild (dtb__320)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__319, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, base, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st1 })))))
# 2632 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__321; Frontend_dLexer.f_PTok_ptokPos = dtb__322 } -> (match dtb__321 with
  | Frontend_dLexer.C_Tok_TSym (dtb__323) -> (if (dtb__323 = "(") then (if ((Frontend_dParser_dSupport.v_atSym (Frontend_dParser_dSupport.v_advance st)) ")") then (let st2 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))) else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (first : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairPats (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 })))))))) else (if (dtb__323 = "[") then (((v_parseListPattern (fuel - 1)) st) blockCol) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__324, dtb__325, dtb__326) -> (match (v_textPartsOf dtb__325) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__327) -> (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = ((Frontend_dParser_dSupport.v_withLastPos dtb__326) advanced) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__327, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateInPattern)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dLexer.C_Tok_TStr (dtb__328) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__328, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__329) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__329, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__330) -> (if (dtb__330 = "_") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__330) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__330, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__330, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2661 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dReserved.v_listNilSyntax, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) st1) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPCon (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2670 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPatternElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))
# 2685 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (p, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (p, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1275 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseClausePatterns = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseClausePatterns (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))

# 1131 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseBindingItemsAt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__331; Base_dSource.f_Pos_posCol = dtb__332; Base_dSource.f_Pos_posOffset = dtb__333; Base_dSource.f_Pos_posEndOffset = dtb__334 } -> (if (dtb__332 = bindCol) then ((Base_dCommon.v_step (((v_parseBindingItem (fuel - 1)) st) bindCol)) (fun (item : t_BindingItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st1) bindCol)) (fun (rest : t_BindingItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__332 > bindCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInBinding) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1143 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItem = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstBindingKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseBindingItemBody fuel) st0) bindCol)))))
# 1150 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItemBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__335; Frontend_dLexer.f_PTok_ptokPos = dtb__336 } -> (match dtb__335 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__337) -> (if (dtb__337 = "_") then (((v_parseBindingPattern fuel) st) bindCol) else (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__338) -> (match dtb__338 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__339; Frontend_dLexer.f_PTok_ptokPos = dtb__340 } -> (match dtb__339 with
  | Frontend_dLexer.C_Tok_TSym (dtb__341) -> (if (dtb__341 = ":") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance st)) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) bindCol)) (fun (ty : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st2)) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BISig (dtb__337, ty, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else (((v_parseBindingPattern fuel) st) bindCol))
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
  | Frontend_dAst.C_Pat_PVar (dtb__342, dtb__343) -> (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) bindCol) else false) then ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "=")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) bindCol)) (fun (value : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__342, (Frontend_dAst.v_patRef pat))); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_ELocalFun ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pats; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf stStart) st4)))) })); B_dData_dPair.f_Pair_second = st4 })))))))))) else ((Base_dCommon.v_step ((((v_parseBindingValue (fuel - 1)) st) pat) bindCol)) (fun (b : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((((v_parseBindingValue (fuel - 1)) st) pat) bindCol)) (fun (b : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 }))))
)))
# 1185 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingValue = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (pat : Frontend_dAst.t_Pat) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "=")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = value }; B_dData_dPair.f_Pair_second = st2 }))))))))))
# 1650 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExprBody fuel) st0) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExprId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) e); B_dData_dPair.f_Pair_second = st1 })))))))
# 1657 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExprBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (((v_parseLhs (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st1) blockCol) lhs))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExprNotIndented)))))
# 1672 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseInfix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (lhs : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__344; Frontend_dLexer.f_PTok_ptokPos = dtb__345 } -> (match dtb__344 with
  | Frontend_dLexer.C_Tok_TSym (dtb__346) -> (if (dtb__346 = "`") then (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectValueName (Frontend_dParser_dSupport.v_advance st))) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "`")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st3) blockCol) (Frontend_dAst.C_Expr_EBacktick (name, lhs, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))) else (if (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isSyntaxSym dtb__346)) else false) then (if (Frontend_dParser_dSupport.v_closeParenNext st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectR (lhs, dtb__346, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EInfix (dtb__346, lhs, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))
# 1685 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLhs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__347; Frontend_dLexer.f_PTok_ptokPos = dtb__348 } -> (match dtb__347 with
  | Frontend_dLexer.C_Tok_TSym (dtb__349) -> (if (dtb__349 = "\\") then (((v_parseLambda (fuel - 1)) st) blockCol) else (if (dtb__349 = "-") then (((v_parseNegation (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))
  | Frontend_dLexer.C_Tok_TKw (dtb__350) -> (if (dtb__350 = "let") then (((v_parseLet (fuel - 1)) st) blockCol) else (if (dtb__350 = "case") then (((v_parseCase (fuel - 1)) st) blockCol) else (if (dtb__350 = "if") then (((v_parseIf (fuel - 1)) st) blockCol) else (if (dtb__350 = "do") then (((v_parseDo (fuel - 1)) st) blockCol) else (if (dtb__350 = "perform") then (((v_parsePerform (fuel - 1)) st) blockCol) else (if (dtb__350 = "handle") then (((v_parseHandle (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))))))
  | _ -> (((v_parseApplication (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1703 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseNegation = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__351) -> (match dtb__351 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__352; Frontend_dLexer.f_PTok_ptokPos = dtb__353 } -> (match dtb__352 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__354) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (("-" ^ dtb__354), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__355) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt ((0 - dtb__355), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((B_dData_dPair.v_firstOf dtb__361), (Frontend_dAst.v_detachedNodeRef (B_dData_dPair.v_secondOf dtb__361)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__358 = "{") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__362) -> ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__362)) (B_dData_dPair.v_secondOf dtb__362)) true) "{") "}")
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "|")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st3) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (base, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))
  | _ -> failwith "DT: impossible branch"
) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__363) -> (if (dtb__363 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__364, dtb__365, dtb__366) -> (((((v_parseTemplateAtom (fuel - 1)) st) dtb__364) dtb__365) dtb__366)
  | Frontend_dLexer.C_Tok_TStr (dtb__367) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__367, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TFloat (dtb__368) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__368, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__369) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__369, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__370) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "{") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "{")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st1b) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__370, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else (if (((v_macroBangAt st1) dtb__357) dtb__370) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "!")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1b) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((v_macroAtom dtb__370) args) ((Frontend_dParser_dSupport.v_spanOf st) st2)) ((Frontend_dParser_dSupport.v_spanOf st) st1b)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__370, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 })))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1844 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (multi : bool) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) (Frontend_dParser_dSupport.v_fileOf st)) (Frontend_dParser_dSupport.v_pmodeOf st)) (Frontend_dParser_dSupport.v_tokSpan st)) parts)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = ((Frontend_dParser_dSupport.v_withLastPos endP) advanced) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (multi, ps, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 1857 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateParts = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut5 = parts in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__371 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__373) -> ((Base_dCommon.v_bind (((((v_parseTemplateHole (v_toksFuel dtb__373)) file) mode) fallback) dtb__373)) (fun (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__372)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e)), ps))))))))
  | Frontend_dLexer.C_TmplPart_TPText (dtb__374) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__372)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__374)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 1869 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateHole = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match toks with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At fallback) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateHoleEmpty)
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> (let pos = (dtb__375).Frontend_dLexer.f_PTok_ptokPos in (let subState = (((((Frontend_dParser_dSupport.v_mkStateAt file) toks) pos) (B_dData_dList.v_length toks)) mode) in (let nd_uscrut10 = (((v_parseExpr (fuel - 1)) subState) 0) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__377) -> (match dtb__377 with
  | { B_dData_dPair.f_Pair_first = dtb__378; B_dData_dPair.f_Pair_second = dtb__379 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__379) then (Base_dDiag.C_Check_OkC (dtb__378)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (((v_holeSpan file) pos))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__380) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan ((v_holeSpan file) pos)) dtb__380)))
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
and v_parseLet = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "let")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLetBindings (fuel - 1)) st1) blockCol)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "in")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (binds, body, false, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2089 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLetBindings = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__381; Base_dSource.f_Pos_posCol = dtb__382; Base_dSource.f_Pos_posOffset = dtb__383; Base_dSource.f_Pos_posEndOffset = dtb__384 } -> (if (dtb__382 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_LetBindingNotIndented) else ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st) dtb__382)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 2101 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "case")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (scrut : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "of")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCaseAlts (fuel - 1)) st3) blockCol)) (fun (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (scrut, alts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2110 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCaseAlts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__385; Base_dSource.f_Pos_posCol = dtb__386; Base_dSource.f_Pos_posOffset = dtb__387; Base_dSource.f_Pos_posEndOffset = dtb__388 } -> (if (dtb__386 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseAltNotIndented) else ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st) dtb__386)) (fun (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_badCaseIndent st2) dtb__386) then ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentAfterCaseAlt) else (match alts with
  | B_dData_dList.C_List_Nil -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = alts; B_dData_dPair.f_Pair_second = st2 }))
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2132 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__389; Base_dSource.f_Pos_posCol = dtb__390; Base_dSource.f_Pos_posOffset = dtb__391; Base_dSource.f_Pos_posEndOffset = dtb__392 } -> (if (dtb__390 = altCol) then ((Base_dCommon.v_step (((v_parseAlt (fuel - 1)) st) altCol)) (fun (alt : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st1) altCol)) (fun (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (alt, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
))))
# 2143 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAlt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseAltBody fuel) st0) altCol))))
# 2146 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) altCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) altCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = body }; B_dData_dPair.f_Pair_second = st3 })))))))))))
# 2159 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePerform = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "perform")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) st1) blockCol)) (fun (operand : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_performSyntax, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2196 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "handle")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleComp (fuel - 1)) st1) blockCol)) (fun (comp : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "{")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleBody (fuel - 1)) st3) blockCol)) (fun (blk : t_HandleBlock) (st4 : Frontend_dParser_dSupport.t_PState) -> (match (((v_handleExpr comp) blk) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))) with
  | Base_dDiag.C_Check_ErrC (dtb__393) -> (Base_dDiag.C_Check_ErrC (dtb__393))
  | Base_dDiag.C_Check_OkC (dtb__394) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__394; B_dData_dPair.f_Pair_second = st4 }))
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 2218 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleComp = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__395; Frontend_dLexer.f_PTok_ptokPos = dtb__396 } -> (match dtb__395 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__397) -> (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__398) -> (match dtb__398 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__399; Frontend_dLexer.f_PTok_ptokPos = dtb__400 } -> (match dtb__399 with
  | Frontend_dLexer.C_Tok_TSym (dtb__401) -> (if (dtb__401 = "{") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__397, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (((v_parseExpr (fuel - 1)) st) blockCol))
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
# 2231 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (handleCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__402; Base_dSource.f_Pos_posCol = dtb__403; Base_dSource.f_Pos_posOffset = dtb__404; Base_dSource.f_Pos_posEndOffset = dtb__405 } -> (if (dtb__403 <= handleCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNotIndented) else ((Base_dCommon.v_step (((((v_parseHandleClauses (fuel - 1)) st) dtb__403) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dList.C_List_Nil)) (fun (p : ((string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe, t_HandleOp B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "}")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleBlock_HandleBlock (dtb__406, dtb__407)); B_dData_dPair.f_Pair_second = st3 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 2257 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleClauses = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (retOpt : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : t_HandleOp B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__408; Base_dSource.f_Pos_posCol = dtb__409; Base_dSource.f_Pos_posOffset = dtb__410; Base_dSource.f_Pos_posEndOffset = dtb__411 } -> (if (dtb__409 = clauseCol) then (if (v_isReturnClauseHead st) then (match retOpt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__412) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match acc with
  | B_dData_dList.C_List__x58__x58_ (dtb__413, dtb__414) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_step (((v_parseHandleRetClause (fuel - 1)) st) clauseCol)) (fun (p : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut13 = p in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = dtb__416 } -> (match dtb__416 with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } }))) acc)
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
# 2287 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleRetClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_ukw : string) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st0)) (fun (x : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "->")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = x; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3 }))))))))))))
# 2297 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) clauseCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match pat with
  | Frontend_dAst.C_Pat_PCon (dtb__419, dtb__420, dtb__421) -> (match (B_dData_dList.v_reverse dtb__420) with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__421)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
  | B_dData_dList.C_List__x58__x58_ (dtb__422, dtb__423) -> (match dtb__422 with
  | Frontend_dAst.C_Pat_PVar (dtb__424, dtb__425) -> (((((((v_handleOpTail (fuel - 1)) st1) clauseCol) dtb__419) (B_dData_dList.v_reverse dtb__423)) dtb__421) dtb__424)
  | Frontend_dAst.C_Pat_PWild (dtb__426) -> (((((((v_handleOpTail (fuel - 1)) st1) clauseCol) dtb__419) (B_dData_dList.v_reverse dtb__423)) dtb__421) "_")
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__421)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)))))))
# 2320 "Vuna/Compiler/Frontend/Parser.vuna"
and v_handleOpTail = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (cname : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (psp : Frontend_dAst.t_NodeRef) (kname : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "->")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleOp_HandleOp (cname, pats, psp, kname, body)); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2372 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseIf = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "if")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (cond : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "then")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (yes : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st4) "else")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st5) blockCol)) (fun (no : Frontend_dAst.t_Expr) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (cond, yes, no, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st6)))); B_dData_dPair.f_Pair_second = st6 }))))))))))))))))
# 2383 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDo = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "do")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st1) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement) else (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__427; Base_dSource.f_Pos_posCol = dtb__428; Base_dSource.f_Pos_posOffset = dtb__429; Base_dSource.f_Pos_posEndOffset = dtb__430 } -> (if (dtb__428 <= blockCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoStatementNotIndented) else ((Base_dCommon.v_step ((((v_parseDoStmts (fuel - 1)) st1) dtb__428) B_dData_dList.C_List_Nil)) (fun (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut10 = (B_dData_dList.v_reverse stmts) in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__431, dtb__432) -> (match dtb__431 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__433, dtb__434) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (stmts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 2406 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (acc : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__435; Base_dSource.f_Pos_posCol = dtb__436; Base_dSource.f_Pos_posOffset = dtb__437; Base_dSource.f_Pos_posEndOffset = dtb__438 } -> (if (dtb__436 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (if (dtb__436 > stmtCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((Base_dCommon.v_step (((v_parseDoStmt (fuel - 1)) st) stmtCol)) (fun (stmt : Frontend_dAst.t_DoStmt) (st1 : Frontend_dParser_dSupport.t_PState) -> (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__439; Base_dSource.f_Pos_posCol = dtb__440; Base_dSource.f_Pos_posOffset = dtb__441; Base_dSource.f_Pos_posEndOffset = dtb__442 } -> (if (Frontend_dParser_dSupport.v_isEof st1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__440 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__440 > stmtCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((((v_parseDoStmts (fuel - 1)) st1) stmtCol) (B_dData_dList.C_List__x58__x58_ (stmt, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2427 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDoStmtKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseDoStmtBody fuel) st0) stmtCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))
# 2431 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmtBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "let") then ((((v_doLetOrExpr fuel) st) stmtCol) nid) else (let nd_uscrut4 = (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) stmtCol) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_ErrC (dtb__443) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | Base_dDiag.C_Check_OkC (dtb__444) -> (match dtb__444 with
  | { B_dData_dPair.f_Pair_first = dtb__445; B_dData_dPair.f_Pair_second = dtb__446 } -> (if ((Frontend_dParser_dSupport.v_atSym dtb__446) "<-") then ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (dtb__445, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb__446) "<-")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__445, e, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 2445 "Vuna/Compiler/Frontend/Parser.vuna"
and v_doLetOrExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match ((Frontend_dParser_dSupport.v_expectKw st) "let") with
  | Base_dDiag.C_Check_ErrC (dtb__447) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | Base_dDiag.C_Check_OkC (dtb__448) -> (let nd_uscrut6 = (((v_parseLetBindings (fuel - 1)) dtb__448) stmtCol) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__449) -> (match dtb__449 with
  | { B_dData_dPair.f_Pair_first = dtb__450; B_dData_dPair.f_Pair_second = dtb__451 } -> (if ((Frontend_dParser_dSupport.v_atKw dtb__451) "in") then ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb__450, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) dtb__451) })); B_dData_dPair.f_Pair_second = dtb__451 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__452) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 2457 "Vuna/Compiler/Frontend/Parser.vuna"
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
  | Frontend_dAst.C_Decl_DAxiom (dtb__453, dtb__454, dtb__455) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__453, (Frontend_dAst.v_nodeRefSpan dtb__455))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseAxiomExport: not an axiom")
)))))

# 1038 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExtern = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "extern")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut6 = (Frontend_dParser_dSupport.v_peekTok st2) in (match nd_uscrut6 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__456; Frontend_dLexer.f_PTok_ptokPos = dtb__457 } -> (match dtb__456 with
  | Frontend_dLexer.C_Tok_TStr (dtb__458) -> ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__458; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) }))) (fun (cName2 : string) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st5)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (name, cName2, ty, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))))))))))
  | _ -> (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("string"))) "string")
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 684 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExternExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseExtern st) blockCol) ds)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DExtern (dtb__459, dtb__460, dtb__461, dtb__462) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__459, (Frontend_dAst.v_nodeRefSpan dtb__462))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseExternExport: not an extern")
)))))

# 1118 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhereBindings = (fun (st : Frontend_dParser_dSupport.t_PState) (whereCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__463; Base_dSource.f_Pos_posCol = dtb__464; Base_dSource.f_Pos_posOffset = dtb__465; Base_dSource.f_Pos_posEndOffset = dtb__466 } -> (if (dtb__464 > whereCol) then ((Base_dCommon.v_step (((v_parseBindingItemsAt (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__464)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1106 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhere = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__467; Frontend_dLexer.f_PTok_ptokPos = dtb__468 } -> (match dtb__467 with
  | Frontend_dLexer.C_Tok_TKw (dtb__469) -> (if (dtb__469 = "where") then (if ((Base_dSource.v_posCol dtb__468) > blockCol) then ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))) (fun (_u : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhereBindings st1) blockCol)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1072 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseClause = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) (ds : t_DeclStart) -> ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhere st3) blockCol)) (fun (wheres : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (let body2 = (match wheres with
  | B_dData_dList.C_List_Nil -> body
  | B_dData_dList.C_List__x58__x58_ (dtb__470, dtb__471) -> (Frontend_dAst.C_Expr_ELet (wheres, body, true, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))))
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (name, pats, body2, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))))

# 1400 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFieldBody = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) (nid : int) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) fieldCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = name; Frontend_dAst.f_Field_fieldType = ty; Frontend_dAst.f_Field_fieldRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1396 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseField = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFieldKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseFieldBody st0) fieldCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1385 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__472; Base_dSource.f_Pos_posCol = dtb__473; Base_dSource.f_Pos_posOffset = dtb__474; Base_dSource.f_Pos_posEndOffset = dtb__475 } -> (if (dtb__473 = fieldCol) then ((Base_dCommon.v_step ((v_parseField st) fieldCol)) (fun (fld : Frontend_dAst.t_Field) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseFieldList (fuel - 1)) st1) fieldCol)) (fun (rest : Frontend_dAst.t_Field B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (fld, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__473 > fieldCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInRecord) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1377 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFields = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__476; Base_dSource.f_Pos_posCol = dtb__477; Base_dSource.f_Pos_posOffset = dtb__478; Base_dSource.f_Pos_posEndOffset = dtb__479 } -> (if (dtb__477 > blockCol) then (((v_parseFieldList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__477) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 800 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecordExport = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3b) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__480; B_dData_dPair.f_Pair_second = dtb__481 } -> (let decl = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__480, dtb__481, tier, lin, (((v_declRefAt st) ds) st6))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st6 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 754 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredExport = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__482; Frontend_dLexer.f_PTok_ptokPos = dtb__483 } -> (match dtb__482 with
  | Frontend_dLexer.C_Tok_TKw (dtb__484) -> (if (dtb__484 = "linear") then (let nd_uscrut8 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut8 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__485; Frontend_dLexer.f_PTok_ptokPos = dtb__486 } -> (match dtb__485 with
  | Frontend_dLexer.C_Tok_TKw (dtb__487) -> (if (dtb__487 = "record") then (((((v_parseRecordExport true) tier) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__484 = "record") then (((((v_parseRecordExport false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1354 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecord = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__488; B_dData_dPair.f_Pair_second = dtb__489 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__488, dtb__489, tier, lin, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 1311 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredDecl = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__490; Frontend_dLexer.f_PTok_ptokPos = dtb__491 } -> (match dtb__490 with
  | Frontend_dLexer.C_Tok_TKw (dtb__492) -> (if (dtb__492 = "linear") then (let st1 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (let nd_uscrut9 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut9 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__493; Frontend_dLexer.f_PTok_ptokPos = dtb__494 } -> (match dtb__493 with
  | Frontend_dLexer.C_Tok_TKw (dtb__495) -> (if (dtb__495 = "record") then (((((v_parseRecord true) tier) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
))) else (if (dtb__492 = "record") then (((((v_parseRecord false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1462 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__496; Frontend_dLexer.f_PTok_ptokPos = dtb__497 } -> (match dtb__496 with
  | Frontend_dLexer.C_Tok_TSym (dtb__498) -> (if (dtb__498 = "(") then (if (v_parenIsMemberList st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) 0)) (fun (kind : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st4) ")")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) st5)) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_TraitParam_traitParamName = n; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (kind)) })) names)) rest); B_dData_dPair.f_Pair_second = st6 }))))))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__499) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitParam_traitParamName = dtb__499; Frontend_dAst.f_TraitParam_traitParamKind = B_dData_dMaybe.C_Maybe_Nothing }, rest)); B_dData_dPair.f_Pair_second = st1 }))))
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
  | { Base_dSource.f_Pos_posLine = dtb__500; Base_dSource.f_Pos_posCol = dtb__501; Base_dSource.f_Pos_posOffset = dtb__502; Base_dSource.f_Pos_posEndOffset = dtb__503 } -> (if (dtb__501 = methodCol) then ((Base_dCommon.v_step ((v_parseMethodSig st) methodCol)) (fun (m : Frontend_dAst.t_TraitMethod) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseMethodSigList (fuel - 1)) st1) methodCol)) (fun (rest : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (m, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__501 > methodCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInTrait) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1472 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigs = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__504; Base_dSource.f_Pos_posCol = dtb__505; Base_dSource.f_Pos_posOffset = dtb__506; Base_dSource.f_Pos_posEndOffset = dtb__507 } -> (if (dtb__505 > blockCol) then (((v_parseMethodSigList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__505) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
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
  | { B_dData_dPair.f_Pair_first = dtb__508; B_dData_dPair.f_Pair_second = dtb__509 } -> (match dtb__508 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, B_dData_dList.C_List_Nil, dtb__509, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (if allowCtx then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, dtb__508, dtb__509, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere))
)
  | _ -> failwith "DT: impossible branch"
))))))

# 644 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedValue = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__510; Frontend_dLexer.f_PTok_ptokPos = dtb__511 } -> (match dtb__510 with
  | Frontend_dLexer.C_Tok_TSym (dtb__512) -> (if (dtb__512 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__512) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__512) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__512, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__512) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__512) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__512, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__512) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__513) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__513) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__513, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__513) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__513) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__513, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__513) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name")
)
  | _ -> failwith "DT: impossible branch"
)))

# 732 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityValue = (fun (kind : Frontend_dAst.t_Opacity) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__514; Frontend_dLexer.f_PTok_ptokPos = dtb__515 } -> (match dtb__514 with
  | Frontend_dLexer.C_Tok_TSym (dtb__516) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__516) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__516) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__516; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__517) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__517) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__517; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")
)
  | _ -> failwith "DT: impossible branch"
)))

# 715 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__518; Frontend_dLexer.f_PTok_ptokPos = dtb__519 } -> (match dtb__518 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__520) -> (if (dtb__520 = "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityAbstract) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))
  | Frontend_dLexer.C_Tok_TKw (dtb__521) -> (if (dtb__521 = "opaque") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "opaque")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityOpaque) st1) blockCol) ds))) else (if (dtb__521 = "transparent") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "transparent")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityTransparent) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))
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
  | { Base_dSource.f_Pos_posLine = dtb__522; Base_dSource.f_Pos_posCol = dtb__523; Base_dSource.f_Pos_posOffset = dtb__524; Base_dSource.f_Pos_posEndOffset = dtb__525 } -> (if (dtb__523 = declCol) then ((Base_dCommon.v_step ((v_parseInstanceDecl st) declCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseInstanceDeclList (fuel - 1)) st1) declCol)) (fun (rest : Frontend_dAst.t_Decl B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (decl, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__523 > declCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInInstance) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1560 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__526; Base_dSource.f_Pos_posCol = dtb__527; Base_dSource.f_Pos_posOffset = dtb__528; Base_dSource.f_Pos_posEndOffset = dtb__529 } -> (if (dtb__527 > blockCol) then (((v_parseInstanceDeclList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__527) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1515 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceTail = (fun (ctxE : Frontend_dAst.t_Expr B_dData_dList.t_List) (head : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseInstanceBody st3) blockCol)) (fun (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (ctxE, head, methods, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 })))))))

# 1504 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstance = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "instance")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__530; B_dData_dPair.f_Pair_second = dtb__531 } -> ((((((v_parseInstanceTail dtb__530) dtb__531) st) blockCol) ds) st2)
  | _ -> failwith "DT: impossible branch"
))))))

# 1643 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtorBody = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) (nid : int) -> ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) ctorCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = name; Frontend_dAst.f_Ctor_ctorType = ty; Frontend_dAst.f_Ctor_ctorArity = (Frontend_dParser_dSupport.v_countArrows ty); Frontend_dAst.f_Ctor_ctorRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1640 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtor = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstCtorKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseCtorBody st0) ctorCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1629 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtorList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__532; Base_dSource.f_Pos_posCol = dtb__533; Base_dSource.f_Pos_posOffset = dtb__534; Base_dSource.f_Pos_posEndOffset = dtb__535 } -> (if (dtb__533 = ctorCol) then ((Base_dCommon.v_step ((v_parseCtor st) ctorCol)) (fun (ctor : Frontend_dAst.t_Ctor) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtorList (fuel - 1)) st1) ctorCol)) (fun (rest : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (ctor, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__533 > ctorCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInData) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1621 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtors = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__536; Base_dSource.f_Pos_posCol = dtb__537; Base_dSource.f_Pos_posOffset = dtb__538; Base_dSource.f_Pos_posEndOffset = dtb__539 } -> (if (dtb__537 > blockCol) then (((v_parseCtorList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__537) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 765 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDataExport = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3b) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__540; B_dData_dPair.f_Pair_second = dtb__541 } -> (let decl = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__540, dtb__541, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st8 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))))

# 697 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__542; Frontend_dLexer.f_PTok_ptokPos = dtb__543 } -> (match dtb__542 with
  | Frontend_dLexer.C_Tok_TKw (dtb__544) -> (if (dtb__544 = "data") then ((((v_parseDataExport true) st1) blockCol) ds) else (if (dtb__544 = "record") then (((((v_parseRecordExport true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 589 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedPlain = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__545; Frontend_dLexer.f_PTok_ptokPos = dtb__546 } -> (match dtb__545 with
  | Frontend_dLexer.C_Tok_TSym (dtb__547) -> ((((v_parseExportedValue op) st) blockCol) ds)
  | Frontend_dLexer.C_Tok_TIdent (dtb__548) -> (if (if (if (dtb__548 = "alias") then true else (dtb__548 = "boxed")) then (v_tierFollows st) else false) then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseTieredExport (if (dtb__548 = "alias") then Frontend_dAst.C_ReprTier_ReprAlias else Frontend_dAst.C_ReprTier_ReprBoxed)) st) blockCol) ds)) else ((((v_parseExportedValue op) st) blockCol) ds))
  | Frontend_dLexer.C_Tok_TKw (dtb__549) -> (if (dtb__549 = "data") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseDataExport false) st) blockCol) ds)) else (if (dtb__549 = "linear") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseLinearExport st) blockCol) ds)) else (if (dtb__549 = "record") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((((v_parseRecordExport false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds)) else (if (dtb__549 = "trait") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseTraitExport st) blockCol) ds)) else (if (dtb__549 = "axiom") then ((((v_parseAxiomExport op) st) blockCol) ds) else (if (dtb__549 = "extern") then ((((v_parseExternExport op) st) blockCol) ds) else (if (dtb__549 = "transparent") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else (if (dtb__549 = "opaque") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))))))
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
  | { B_dData_dPair.f_Pair_first = dtb__550; B_dData_dPair.f_Pair_second = dtb__551 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__550, dtb__551, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))); B_dData_dPair.f_Pair_second = st8 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

# 1287 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__552; Frontend_dLexer.f_PTok_ptokPos = dtb__553 } -> (match dtb__552 with
  | Frontend_dLexer.C_Tok_TKw (dtb__554) -> (if (dtb__554 = "data") then ((((v_parseData true) st1) blockCol) ds) else (if (dtb__554 = "record") then (((((v_parseRecord true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 990 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__555; Frontend_dLexer.f_PTok_ptokPos = dtb__556 } -> (match dtb__555 with
  | Frontend_dLexer.C_Tok_TSym (dtb__557) -> (if (dtb__557 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) name) ds) else ((((v_parseClause st1) blockCol) name) ds)))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__557) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__557) ds) else ((((v_parseClause st1) blockCol) dtb__557) ds)))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__558) -> (if (if (dtb__558 = "alias") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (if (if (dtb__558 = "boxed") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__558) ds) else ((((v_parseClause st1) blockCol) dtb__558) ds)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__559) -> (if (dtb__559 = "data") then ((((v_parseData false) st) blockCol) ds) else (if (dtb__559 = "linear") then (((v_parseLinearDecl st) blockCol) ds) else (if (dtb__559 = "axiom") then (((v_parseAxiom st) blockCol) ds) else (if (dtb__559 = "extern") then (((v_parseExtern st) blockCol) ds) else (if (dtb__559 = "record") then (((((v_parseRecord false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds) else (if (dtb__559 = "trait") then (((v_parseTrait st) blockCol) ds) else (if (dtb__559 = "instance") then (((v_parseInstance st) blockCol) ds) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 983 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 509 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityOrDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__560; Frontend_dLexer.f_PTok_ptokPos = dtb__561 } -> (match dtb__560 with
  | Frontend_dLexer.C_Tok_TKw (dtb__562) -> (if (dtb__562 = "infixl") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 1) dtb__561)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__562 = "infixr") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 2) dtb__561)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__562 = "infix") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 0) dtb__561)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))))))))
  | _ -> (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))))))
)
  | _ -> failwith "DT: impossible branch"
)))

# 424 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDecls = (fun (recover : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : t_DeclAcc) (blocks : t_DeclBlock) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_reverseDeclAcc acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = st; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__563; Base_dSource.f_Pos_posCol = dtb__564; Base_dSource.f_Pos_posOffset = dtb__565; Base_dSource.f_Pos_posEndOffset = dtb__566 } -> (if (dtb__564 = blockCol) then (match ((v_parseFixityOrDecl st) blockCol) with
  | Base_dDiag.C_Check_ErrC (dtb__567) -> (if recover then (let st2 = ((v_recoverDecl st) blockCol) in ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st2) blockCol) acc) (v_dbClose blocks))) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = dtb__569 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__567, dtb__569)) } }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_ErrC (dtb__567)))
  | Base_dDiag.C_Check_OkC (dtb__570) -> (let pd = (B_dData_dPair.v_firstOf dtb__570) in (let st1 = (B_dData_dPair.v_secondOf dtb__570) in (let acc2 = ((v_addParsedDecl pd) acc) in (let verdict = ((v_blockStep blocks) pd) in (match (B_dData_dPair.v_firstOf verdict) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__571) -> (if recover then ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))) (fun (q : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__572; B_dData_dPair.f_Pair_second = dtb__573 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = q; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__572; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__571, dtb__573)) } }))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (dtb__571)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseDecls recover) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn ((bi_strFromInt blockCol)))) (bi_strFromInt blockCol)))
  | _ -> failwith "DT: impossible branch"
))))

# 110 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceFile = (fun (recover : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseModDecl st)) (fun (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (imp : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match imp with
  | { B_dData_dPair.f_Pair_first = dtb__574; B_dData_dPair.f_Pair_second = dtb__575 } -> (if (Frontend_dParser_dSupport.v_isEof st2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__574; Frontend_dAst.f_SourceFile_sourceFileFixities = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileDecls = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__575; Frontend_dAst.f_SourceFile_sourceFileOpacity = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) else (match (Frontend_dParser_dSupport.v_peekPos st2) with
  | { Base_dSource.f_Pos_posLine = dtb__576; Base_dSource.f_Pos_posCol = dtb__577; Base_dSource.f_Pos_posOffset = dtb__578; Base_dSource.f_Pos_posEndOffset = dtb__579 } -> ((Base_dCommon.v_step ((((((v_parseDecls recover) (Frontend_dParser_dSupport.v_stateFuel st2)) st2) dtb__577) v_emptyDeclAcc) v_emptyDeclBlock)) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__580; B_dData_dPair.f_Pair_second = dtb__581 } -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__582; f_DeclAcc_declAccDecls = dtb__583; f_DeclAcc_declAccExports = dtb__584; f_DeclAcc_declAccOpacity = dtb__585 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__580) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__574; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__582; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__583; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__584; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__575; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__585 }; B_dData_dPair.f_Pair_second = dtb__580 }; B_dData_dPair.f_Pair_second = dtb__581 })) else ((v_ps0 dtb__580) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput))
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
  | Base_dDiag.C_Check_OkC (dtb__586) -> (match dtb__586 with
  | { B_dData_dPair.f_Pair_first = dtb__587; B_dData_dPair.f_Pair_second = dtb__588 } -> (let st0 = (((Frontend_dParser_dSupport.v_mkState file) dtb__587) Frontend_dParser_dSupport.C_ParseMode_PmTool) in (match ((v_parseSourceFile false) st0) with
  | Base_dDiag.C_Check_ErrC (dtb__589) -> (Base_dDiag.C_Check_ErrC (dtb__589))
  | Base_dDiag.C_Check_OkC (dtb__590) -> (Base_dDiag.C_Check_OkC ({ f_ParsedSource_parsedFile = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__590)); f_ParsedSource_parsedComments = dtb__588; f_ParsedSource_parsedRawToks = dtb__587; f_ParsedSource_parsedEvents = ((Frontend_dParser_dSupport.v_eventsOf st0) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__590))) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__591) -> (Base_dDiag.C_Check_ErrC (dtb__591))
  | _ -> failwith "DT: impossible branch"
)))

# 61 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceWithComments = (fun (file : string) (source : string) -> (match ((v_parseSourceDetailed file) source) with
  | Base_dDiag.C_Check_ErrC (dtb__592) -> (Base_dDiag.C_Check_ErrC (dtb__592))
  | Base_dDiag.C_Check_OkC (dtb__593) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__593).f_ParsedSource_parsedFile; B_dData_dPair.f_Pair_second = (dtb__593).f_ParsedSource_parsedComments }))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSource = (fun (file : string) (source : string) -> (let nd_uscrut2 = ((v_parseSourceWithComments file) source) in (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__594) -> (match dtb__594 with
  | { B_dData_dPair.f_Pair_first = dtb__595; B_dData_dPair.f_Pair_second = dtb__596 } -> (Base_dDiag.C_Check_OkC (dtb__595))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__597) -> (Base_dDiag.C_Check_ErrC (dtb__597))
  | _ -> failwith "DT: impossible branch"
)))

# 2711 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecoveringTokens = (fun (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_parseSourceFile true) (((Frontend_dParser_dSupport.v_mkState file) toks) mode))) (fun (p : ((Frontend_dAst.t_SourceFile, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))

# 2703 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecovering = (fun (file : string) (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (((v_parseSourceRecoveringTokens file) Frontend_dParser_dSupport.C_ParseMode_PmStrict) toks))))
