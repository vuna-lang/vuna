open Vuna_runtime
type t_DeclAcc = { f_DeclAcc_declAccFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_DeclAcc_declAccDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DeclAcc_declAccExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_DeclAcc_declAccOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }
and t_ParsedDecl = { f_ParsedDecl_parsedFixity : Frontend_dAst.t_FixityDecl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedDecl : Frontend_dAst.t_Decl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedExport : Frontend_dAst.t_ExportSpec B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedOpacity : Frontend_dAst.t_OpacitySpec B_dData_dMaybe.t_Maybe }
and t_TraitHead = { f_TraitHead_traitHeadName : string; f_TraitHead_traitHeadParams : Frontend_dAst.t_TraitParam B_dData_dList.t_List; f_TraitHead_traitHeadSupers : Frontend_dAst.t_Expr B_dData_dList.t_List }
and t_BindingItem = C_BindingItem_BISig of (string) * (Frontend_dAst.t_Expr) * (Base_dSource.t_Span) | C_BindingItem_BIBind of ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair)
and t_HandleOp = C_HandleOp_HandleOp of (string) * (Frontend_dAst.t_Pat B_dData_dList.t_List) * (Base_dSource.t_Span) * (string) * (Frontend_dAst.t_Expr)
and t_HandleBlock = C_HandleBlock_HandleBlock of ((string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (t_HandleOp B_dData_dList.t_List)

# 17 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps0 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dParser_dSupport.v_tokSpan st)) e))

# 20 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps1 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (a0 : string) -> (((Base_dDiagnostics_dFrontend.v_psErr1At (Frontend_dParser_dSupport.v_tokSpan st)) e) a0))

# 23 "Vuna/Compiler/Frontend/Parser.vuna"
let v_psAt = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (args : string B_dData_dVec.t_Vec) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dParser_dSupport.v_tokSpan st)) e) args))

# 57 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclAcc = { f_DeclAcc_declAccFixities = B_dData_dList.C_List_Nil; f_DeclAcc_declAccDecls = B_dData_dList.C_List_Nil; f_DeclAcc_declAccExports = B_dData_dList.C_List_Nil; f_DeclAcc_declAccOpacity = B_dData_dList.C_List_Nil }

# 66 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyParsedDecl = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }

# 158 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportItemOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportMembers) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__0) -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, dtb__0, mc2))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, B_dData_dList.C_List_Nil, mc2))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (mc0, mc2))
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespace = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "module")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (name : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st3) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "as")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st4)) (fun (alias : string) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, (B_dData_dMaybe.C_Maybe_Just (alias)), ((Frontend_dParser_dSupport.v_spanOf st) st5))); B_dData_dPair.f_Pair_second = st5 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, B_dData_dMaybe.C_Maybe_Nothing, ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 }))))))))))

# 197 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reexportPrefix = (fun (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> dtb__1
  | B_dData_dMaybe.C_Maybe_Nothing -> (imp).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Frontend/Parser.vuna"
let v_qualifyExportItem = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__2, dtb__3, dtb__4) -> (Frontend_dAst.C_ExportItem_XNamespace (dtb__2, dtb__3, dtb__4))
  | Frontend_dAst.C_ExportItem_XModule (dtb__5, dtb__6) -> (Frontend_dAst.C_ExportItem_XModule (dtb__5, dtb__6))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__7, dtb__8, dtb__9) -> (Frontend_dAst.C_ExportItem_XTypeSome ((String.concat "" [mc0; "."; dtb__7]), dtb__8, dtb__9))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__10, dtb__11) -> (Frontend_dAst.C_ExportItem_XTypeAll ((String.concat "" [mc0; "."; dtb__10]), dtb__11))
  | Frontend_dAst.C_ExportItem_XBare (dtb__12, dtb__13) -> (Frontend_dAst.C_ExportItem_XBare ((String.concat "" [mc0; "."; dtb__12]), dtb__13))
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAlias = (fun (st : Frontend_dParser_dSupport.t_PState) (isQualified : bool) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "as")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (alias : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = (B_dData_dMaybe.C_Maybe_Just (alias)); Frontend_dAst.f_Import_importSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) }; B_dData_dPair.f_Pair_second = st1 }))))))

# 180 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAfterKeyword = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "qualified")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((v_parseImportAlias st1) true))) else ((v_parseImportAlias st) false)))

# 210 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpec = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "import")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "qualified")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((v_parseImportAlias st2) true))) else ((v_parseImportAlias st1) false)))))

# 293 "Vuna/Compiler/Frontend/Parser.vuna"
let v_addParsedDecl = (fun (mc0 : t_ParsedDecl) (mc1 : t_DeclAcc) -> (match mc0 with
  | { f_ParsedDecl_parsedFixity = dtb__14; f_ParsedDecl_parsedDecl = dtb__15; f_ParsedDecl_parsedExport = dtb__16; f_ParsedDecl_parsedOpacity = dtb__17 } -> (match mc1 with
  | { f_DeclAcc_declAccFixities = dtb__18; f_DeclAcc_declAccDecls = dtb__19; f_DeclAcc_declAccExports = dtb__20; f_DeclAcc_declAccOpacity = dtb__21 } -> ((fun fixities2 -> ((fun decls2 -> ((fun exports2 -> ((fun opacity2 -> { f_DeclAcc_declAccFixities = fixities2; f_DeclAcc_declAccDecls = decls2; f_DeclAcc_declAccExports = exports2; f_DeclAcc_declAccOpacity = opacity2 }) (match dtb__17 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__21))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__21
  | _ -> failwith "DT: impossible branch"
))) (match dtb__16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__20))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__20
  | _ -> failwith "DT: impossible branch"
))) (match dtb__15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__19))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__19
  | _ -> failwith "DT: impossible branch"
))) (match dtb__14 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__18))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__18
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reverseDeclAcc = (fun (mc0 : t_DeclAcc) -> (match mc0 with
  | { f_DeclAcc_declAccFixities = dtb__26; f_DeclAcc_declAccDecls = dtb__27; f_DeclAcc_declAccExports = dtb__28; f_DeclAcc_declAccOpacity = dtb__29 } -> { f_DeclAcc_declAccFixities = (B_dData_dList.v_reverse dtb__26); f_DeclAcc_declAccDecls = (B_dData_dList.v_reverse dtb__27); f_DeclAcc_declAccExports = (B_dData_dList.v_reverse dtb__28); f_DeclAcc_declAccOpacity = (B_dData_dList.v_reverse dtb__29) }
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_skipToDeclLine = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> ((v_skipFrom dtb__31) mc1)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 329 "Vuna/Compiler/Frontend/Parser.vuna"
and v_skipFrom = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (if ((Base_dSource.v_posCol (dtb__32).Frontend_dLexer.f_PTok_ptokPos) = mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33)) else ((v_skipToDeclLine dtb__33) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Frontend/Parser.vuna"
let v_recoverDecl = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : int) -> (match mc0 with
  | { Frontend_dParser_dSupport.f_PState_fileOf = dtb__34; Frontend_dParser_dSupport.f_PState_toksOf = dtb__35; Frontend_dParser_dSupport.f_PState_lastPos = dtb__36; Frontend_dParser_dSupport.f_PState_toksLeft = dtb__37; Frontend_dParser_dSupport.f_PState_pmodeOf = dtb__38 } -> ((fun rest -> { Frontend_dParser_dSupport.f_PState_fileOf = dtb__34; Frontend_dParser_dSupport.f_PState_toksOf = rest; Frontend_dParser_dSupport.f_PState_lastPos = dtb__36; Frontend_dParser_dSupport.f_PState_toksLeft = (B_dData_dList.v_length rest); Frontend_dParser_dSupport.f_PState_pmodeOf = dtb__38 }) ((v_skipToDeclLine dtb__35) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportMarkerFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__39; Frontend_dLexer.f_PTok_ptokPos = dtb__40 } -> (match dtb__39 with
  | Frontend_dLexer.C_Tok_TKw (dtb__41) -> (if (dtb__41 = "data") then true else (if (dtb__41 = "record") then true else (if (dtb__41 = "trait") then true else (if (dtb__41 = "axiom") then true else (if (dtb__41 = "extern") then true else (if (dtb__41 = "linear") then true else (if (dtb__41 = "opaque") then true else (if (dtb__41 = "transparent") then true else (if (dtb__41 = "import") then true else false)))))))))
  | Frontend_dLexer.C_Tok_TSym (dtb__42) -> (if (dtb__42 = ":") then false else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__43; Frontend_dLexer.f_PTok_ptokPos = dtb__44 } -> (match dtb__43 with
  | Frontend_dLexer.C_Tok_TSym (dtb__45) -> (if (dtb__45 = ":") then true else true)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__46) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__47; Frontend_dLexer.f_PTok_ptokPos = dtb__48 } -> (match dtb__47 with
  | Frontend_dLexer.C_Tok_TSym (dtb__49) -> (if (dtb__49 = ":") then true else true)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 361 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__50; Frontend_dLexer.f_PTok_ptokPos = dtb__51 } -> (match dtb__50 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__52) -> (if (dtb__52 = "export") then (v_exportMarkerFollows (Frontend_dParser_dSupport.v_advance st)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 453 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityGiven = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacitySpecOf = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (mc1 : string) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = mc1; Frontend_dAst.f_OpacitySpec_opacityKind = dtb__54; Frontend_dAst.f_OpacitySpec_opacitySpan = mc2 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 684 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_traitSupersFollowGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__55 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__57; Frontend_dLexer.f_PTok_ptokPos = dtb__58 } -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Frontend_dLexer.C_Tok_TSym (dtb__59) -> (if (dtb__59 = "=>") then (mc0 = 0) else (if (dtb__59 = "(") then ((v_traitSupersFollowGo (mc0 + 1)) dtb__56) else (if (dtb__59 = ")") then ((v_traitSupersFollowGo (if (mc0 > 0) then (mc0 - 1) else 0)) dtb__56) else ((v_traitSupersFollowGo mc0) dtb__56))))
  | Frontend_dLexer.C_Tok_TKw (dtb__60) -> (if (dtb__60 = "where") then false else ((v_traitSupersFollowGo mc0) dtb__56))
  | _ -> ((v_traitSupersFollowGo mc0) dtb__56)
)) dtb__57)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 681 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitSupersFollow = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((v_traitSupersFollowGo 0) (st).Frontend_dParser_dSupport.f_PState_toksOf))

# 720 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parenIsMemberList = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__61; Frontend_dLexer.f_PTok_ptokPos = dtb__62 } -> (match dtb__61 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__63) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__64; Frontend_dLexer.f_PTok_ptokPos = dtb__65 } -> (match dtb__64 with
  | Frontend_dLexer.C_Tok_TSym (dtb__66) -> (if (dtb__66 = ",") then true else (if (dtb__66 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TSym (dtb__67) -> (if (dtb__67 = "..") then true else (if (dtb__67 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 744 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectDeclName = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__68; Frontend_dLexer.f_PTok_ptokPos = dtb__69 } -> (match dtb__68 with
  | Frontend_dLexer.C_Tok_TSym (dtb__70) -> (if (dtb__70 = "(") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (match dtb__71 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__72; Frontend_dLexer.f_PTok_ptokPos = dtb__73 } -> (match dtb__72 with
  | Frontend_dLexer.C_Tok_TSym (dtb__74) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__74) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (match dtb__75 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__76; Frontend_dLexer.f_PTok_ptokPos = dtb__77 } -> (match dtb__76 with
  | Frontend_dLexer.C_Tok_TSym (dtb__78) -> (if (dtb__78 = ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__74; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) })) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator"))
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
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1)) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__70) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__79) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__79; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 149 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMemberNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseMemberNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 143 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (if ((Frontend_dParser_dSupport.v_atSym st1) "..") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "..")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step ((v_parseMemberNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (names)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 118 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItem = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__80; Frontend_dLexer.f_PTok_ptokPos = dtb__81 } -> (match dtb__80 with
  | Frontend_dLexer.C_Tok_TSym (dtb__82) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__82) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__82, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__83) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) "(") then ((Base_dCommon.v_step (v_parseExportMembers st1)) (fun (members : Frontend_dAst.t_ExportMembers) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_exportItemOf dtb__83) members) ((Frontend_dParser_dSupport.v_spanOf st) st2)); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__83, ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 })))) (Frontend_dParser_dSupport.v_advance st))
  | Frontend_dLexer.C_Tok_TKw (dtb__84) -> (if (dtb__84 = "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (name, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 109 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseExportItemsFrom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_parseExportItem st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseExportItemsFrom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 103 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItems = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_parseExportItemsFrom (Frontend_dParser_dSupport.v_stateFuel st1)) st1)))))

# 94 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDecl = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) "(") then ((Base_dCommon.v_step (v_parseExportItems st2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = true; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclSpan = ((Frontend_dParser_dSupport.v_spanOf st) st4) })); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = false; Frontend_dAst.f_ModDecl_modDeclExportItems = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 }))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 187 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseReexportTail = (fun (imp : Frontend_dAst.t_Import) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then ((Base_dCommon.v_step (v_parseExportItems st)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (v_qualifyExportItem (v_reexportPrefix imp))) items) }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st1 }))))))

# 165 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImport = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "import") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "import")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseImportAfterKeyword st2)) (fun (imp : Frontend_dAst.t_Import) (st3 : Frontend_dParser_dSupport.t_PState) -> ((v_parseReexportTail imp) st3))))) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))

# 732 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOptionalMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then (v_parseExportMembers st) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = st }))))

# 715 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (v_parseOptionalMembers st))

# 765 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectFixityLevel = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__85; Frontend_dLexer.f_PTok_ptokPos = dtb__86 } -> (match dtb__85 with
  | Frontend_dLexer.C_Tok_TInt (dtb__87) -> (if (if (dtb__87 >= 0) then (dtb__87 <= 9) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_FixityLevelRange))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedFixityLevel)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 774 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectOpName = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__88; Frontend_dLexer.f_PTok_ptokPos = dtb__89 } -> (match dtb__88 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__90) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__90) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TSym (dtb__91) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__91) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 736 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_step (v_expectFixityLevel (Frontend_dParser_dSupport.v_advance st))) (fun (level : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_expectOpName st1)) (fun (op : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixitySpan = { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) } }; B_dData_dPair.f_Pair_second = st2 })))))))

# 852 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rejectCtxSuffix = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere) else (Base_dDiag.C_Check_OkC (st))))

# 1015 "Vuna/Compiler/Frontend/Parser.vuna"
let v_localFunMerge = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr) (mc2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (match dtb__94 with
  | Frontend_dAst.C_Pat_PVar (dtb__96, dtb__97) -> (match dtb__95 with
  | Frontend_dAst.C_Expr_EAnn (dtb__98, dtb__99, dtb__100) -> (match dtb__98 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__101, dtb__102) -> (if (dtb__96 = mc0) then (match mc1 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__103, dtb__104) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__96, dtb__97)); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EAnn ((Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_append dtb__101) dtb__103), dtb__102)), dtb__99, dtb__100)) }, dtb__93))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_ELocalFun (dtb__105, dtb__106) -> (if (dtb__96 = mc0) then (match mc1 with
  | Frontend_dAst.C_Expr_ELocalFun (dtb__107, dtb__108) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__96, dtb__97)); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_append dtb__105) dtb__107), dtb__106)) }, dtb__93))))
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

# 1033 "Vuna/Compiler/Frontend/Parser.vuna"
let v_patBoundName = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PVar (dtb__109, dtb__110) -> dtb__109
  | _ -> ""
))

# 1037 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingSigOf = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> (if (dtb__113 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__114)) else ((v_bindingSigOf mc0) dtb__112))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1041 "Vuna/Compiler/Frontend/Parser.vuna"
let v_hasBindingSig = (fun (name : string) (sigs : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_bindingSigOf name) sigs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1047 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstDanglingSig = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (match dtb__116 with
  | { B_dData_dPair.f_Pair_first = dtb__118; B_dData_dPair.f_Pair_second = dtb__119 } -> (match dtb__119 with
  | { B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = dtb__121 } -> (if ((B_dData_dList.v_memName dtb__118) mc1) then ((v_firstDanglingSig dtb__117) mc1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__118; B_dData_dPair.f_Pair_second = dtb__121 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 978 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingBindsGo = (fun (mc0 : t_BindingItem B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_BindingItem_BIBind (dtb__124) -> (match dtb__124 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (match (((v_localFunMerge (v_patBoundName dtb__125)) dtb__126) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> ((((v_bindingBindsGo dtb__123) mc1) mc2) dtb__127)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_bindingBindsGo dtb__123) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName dtb__125), mc2))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 }, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__128) -> (match dtb__128 with
  | { B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 } -> (if ((B_dData_dList.v_memName (v_patBoundName dtb__125)) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__130)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigMultiClause ((v_patBoundName dtb__125)))) (B_dData_dVec.C_Vec_VCons ((v_patBoundName dtb__125), B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__123) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName dtb__125), mc2))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EAnn (dtb__126, dtb__129, dtb__130)) }, mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_bindingSigOf (v_patBoundName dtb__125)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_BindingItem_BISig (dtb__131, dtb__132, dtb__133) -> (if ((B_dData_dList.v_memName dtb__131) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__133)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigBeforeClause (dtb__131))) (B_dData_dVec.C_Vec_VCons (dtb__131, B_dData_dVec.C_Vec_Nil)))))) else (if ((v_hasBindingSig dtb__131) mc1) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__133)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigDuplicate (dtb__131))) (B_dData_dVec.C_Vec_VCons (dtb__131, B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__123) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } }, mc1))) mc2) mc3)))
  | _ -> failwith "DT: impossible branch"
)) dtb__122)
  | B_dData_dList.C_List_Nil -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (match dtb__134 with
  | { B_dData_dPair.f_Pair_first = dtb__135; B_dData_dPair.f_Pair_second = dtb__136 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__136)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigNoDef (dtb__135))) (B_dData_dVec.C_Vec_VCons (dtb__135, B_dData_dVec.C_Vec_Nil))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
)) ((v_firstDanglingSig (B_dData_dList.v_reverse mc1)) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 975 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindingItemsToBinds = (fun (items : t_BindingItem B_dData_dList.t_List) -> ((((v_bindingBindsGo items) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1077 "Vuna/Compiler/Frontend/Parser.vuna"
let v_tierFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__137; Frontend_dLexer.f_PTok_ptokPos = dtb__138 } -> (match dtb__137 with
  | Frontend_dLexer.C_Tok_TKw (dtb__139) -> (if (dtb__139 = "record") then true else (if (dtb__139 = "linear") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__140; Frontend_dLexer.f_PTok_ptokPos = dtb__141 } -> (match dtb__140 with
  | Frontend_dLexer.C_Tok_TKw (dtb__142) -> (if (dtb__142 = "record") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 392 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__143; Frontend_dLexer.f_PTok_ptokPos = dtb__144 } -> (match dtb__143 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__145) -> (if (dtb__145 = "abstract") then true else false)
  | Frontend_dLexer.C_Tok_TKw (dtb__146) -> (if (dtb__146 = "opaque") then (B_dData_dBool.v_not (v_tierFollows st)) else (if (dtb__146 = "transparent") then (B_dData_dBool.v_not (v_tierFollows st)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1175 "Vuna/Compiler/Frontend/Parser.vuna"
let v_atIdentName = (fun (st : Frontend_dParser_dSupport.t_PState) (name : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__147; Frontend_dLexer.f_PTok_ptokPos = dtb__148 } -> (match dtb__147 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__149) -> (dtb__149 = name)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 223 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseImports = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "import") then ((Base_dCommon.v_step (v_parseImportSpec st)) (fun (imp : Frontend_dAst.t_Import) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__150; B_dData_dPair.f_Pair_second = dtb__151 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (imp, dtb__150)); B_dData_dPair.f_Pair_second = dtb__151 }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "import") else false) then ((Base_dCommon.v_step (v_parseExportImport st)) (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = dtb__153 } -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__154)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__153) dtb__155) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "module") else false) then ((Base_dCommon.v_step (v_parseExportNamespace st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (item, dtb__157)) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st })))))))

# 1199 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDerivingNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseDerivingNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1193 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDerivingParens = (fun (via : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step ((v_parseDerivingNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1183 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeriving = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "deriving") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "deriving")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((v_atIdentName st1) "via") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (fld : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if (fld = "field") then ((v_parseDerivingParens true) st3) else (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("field"))) "field")))))) else ((v_parseDerivingParens false) st1)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = false }; B_dData_dPair.f_Pair_second = st }))))

# 1294 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_innermostPiCod = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (v_innermostPiCod dtb__162)
  | _ -> mc0
))

# 1298 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_replacePiCod = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (Frontend_dAst.C_Expr_EPi (dtb__164, dtb__165, dtb__166, dtb__167, ((v_replacePiCod dtb__168) mc1), dtb__169))
  | _ -> mc1
))

# 1289 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ctxThenSplit = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_innermostPiCod (Frontend_dAst.C_Expr_EPi (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_replacePiCod (Frontend_dAst.C_Expr_EPi (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175))) mc1) }
  | _ -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = mc1 }
))

# 1344 "Vuna/Compiler/Frontend/Parser.vuna"
let v_instanceMethodStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__176; Frontend_dLexer.f_PTok_ptokPos = dtb__177 } -> (match dtb__176 with
  | Frontend_dLexer.C_Tok_TSym (dtb__178) -> (if (dtb__178 = "(") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__179) -> (match dtb__179 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__180; Frontend_dLexer.f_PTok_ptokPos = dtb__181 } -> (match dtb__180 with
  | Frontend_dLexer.C_Tok_TSym (dtb__182) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> (match dtb__183 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__184; Frontend_dLexer.f_PTok_ptokPos = dtb__185 } -> (match dtb__184 with
  | Frontend_dLexer.C_Tok_TSym (dtb__186) -> (if (dtb__186 = ")") then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__182)) else false)
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
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1)) else (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__178)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__187) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1358 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__188; Frontend_dLexer.f_PTok_ptokPos = dtb__189 } -> (match dtb__188 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__190) -> ((Base_dCommon.v_step ((v_parseParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : string B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__190, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 1472 "Vuna/Compiler/Frontend/Parser.vuna"
let v_spanFromExpr = (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun sp -> { Base_dSource.f_Span_spanFile = (sp).Base_dSource.f_Span_spanFile; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) }) (Frontend_dAst.v_exprSpan e)))

# 1506 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldSuffix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (base : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ".") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ".")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (fname : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EField (base, fname, ((v_spanFromExpr base) st2)))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st })))))

# 1520 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroBangAt = (fun (st : Frontend_dParser_dSupport.t_PState) (start : Base_dSource.t_Pos) (name : string) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__191; Frontend_dLexer.f_PTok_ptokPos = dtb__192 } -> (match dtb__191 with
  | Frontend_dLexer.C_Tok_TSym (dtb__193) -> (if (dtb__193 = "!") then (if ((Base_dSource.v_posLine dtb__192) = (Base_dSource.v_posLine start)) then ((Base_dSource.v_posCol dtb__192) = ((Base_dSource.v_posCol start) + (bi_strLength name))) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1527 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroAtom = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dAst.v_macroSyntaxName mc0), mc3))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dAst.v_macroSyntaxName mc0), mc3)), mc1, mc2))
))

# 1611 "Vuna/Compiler/Frontend/Parser.vuna"
let v_holeSpan = (fun (mc0 : string) (mc1 : Base_dSource.t_Pos) -> (match mc1 with
  | { Base_dSource.f_Pos_posLine = dtb__194; Base_dSource.f_Pos_posCol = dtb__195; Base_dSource.f_Pos_posOffset = dtb__196; Base_dSource.f_Pos_posEndOffset = dtb__197 } -> { Base_dSource.f_Span_spanFile = mc0; Base_dSource.f_Span_spanStartLine = dtb__194; Base_dSource.f_Span_spanStartCol = dtb__195; Base_dSource.f_Span_spanEndLine = dtb__194; Base_dSource.f_Span_spanEndCol = dtb__195; Base_dSource.f_Span_spanStartOffset = dtb__196; Base_dSource.f_Span_spanEndOffset = dtb__196 }
  | _ -> failwith "DT: impossible branch"
))

# 1615 "Vuna/Compiler/Frontend/Parser.vuna"
let v_toksFuel = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((128 * (B_dData_dList.v_length toks)) + 1024))

# 1619 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_textPartsOf = (fun (mc0 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__198 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__200) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_TmplPart_TPText (dtb__201) -> (match (v_textPartsOf dtb__199) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__202) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__201 ^ dtb__202)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (""))
  | _ -> failwith "DT: impossible branch"
))

# 1654 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairExprs = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (match dtb__204 with
  | B_dData_dList.C_List_Nil -> dtb__203
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_tuplePairSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__203, (B_dData_dList.C_List__x58__x58_ (((v_foldPairExprs mc0) dtb__204), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_tupleUnitSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1694 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePiNamesRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__205; Frontend_dLexer.f_PTok_ptokPos = dtb__206 } -> (match dtb__205 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__207) -> (((v_parsePiNamesRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) (B_dData_dList.C_List__x58__x58_ (dtb__207, acc)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 1685 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsePiNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parsePiNamesRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)))))))

# 1704 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPiNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : bool) (mc2 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr) (mc5 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (Frontend_dAst.C_Expr_EPi (dtb__208, mc1, mc2, mc3, ((((((v_foldPiNames dtb__209) mc1) mc2) mc3) mc4) mc5), mc5))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 1709 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyDottedName = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (if (Base_dSource.v_containsDot dtb__210) then true else (v_anyDottedName dtb__211))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1714 "Vuna/Compiler/Frontend/Parser.vuna"
let v_consumeQty = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__213; Frontend_dLexer.f_PTok_ptokPos = dtb__214 } -> (match dtb__213 with
  | Frontend_dLexer.C_Tok_TInt (dtb__215) -> (if (dtb__215 = 0) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else (if (dtb__215 = 1) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)))
  | _ -> ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok mc0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1775 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldCons = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_listConsSyntax, mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__216, (B_dData_dList.C_List__x58__x58_ (((v_foldCons mc0) dtb__217), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_listNilSyntax, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1789 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLambdaParam = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_tokenSpan st) }; B_dData_dPair.f_Pair_second = st1 })))))

# 1795 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseLambdaParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ",") then ((Base_dCommon.v_step (v_parseLambdaParam (Frontend_dParser_dSupport.v_advance st))) (fun (p : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseLambdaParams (fuel - 1)) st1) ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (p, B_dData_dList.C_List_Nil)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = st })))))

# 1871 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rowAtNameExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__218, dtb__219) -> (Frontend_dAst.C_Expr_EStr (dtb__218, dtb__219))
  | _ -> mc0
))

# 1906 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpBinder = "@vuna@handle@o"

# 1910 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpIndexBinder = "@vuna@handle@ix"

# 1968 "Vuna/Compiler/Frontend/Parser.vuna"
let v_isReturnClauseHead = (fun (stat : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__220; Frontend_dLexer.f_PTok_ptokPos = dtb__221 } -> (match dtb__220 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__222) -> (dtb__222 = "return")
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok stat)))

# 2048 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpKName = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__223, dtb__224, dtb__225, dtb__226, dtb__227) -> dtb__226
  | _ -> failwith "DT: impossible branch"
))

# 2052 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstOtherKName = (fun (mc0 : t_HandleOp B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> ((fun k2 -> (if (k2 = mc1) then ((v_firstOtherKName dtb__229) mc1) else (B_dData_dMaybe.C_Maybe_Just (k2)))) (v_handleOpKName dtb__228))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2060 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleAlt = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__230, dtb__231, dtb__232, dtb__233, dtb__234) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__230, dtb__231, dtb__232)); B_dData_dPair.f_Pair_second = dtb__234 }
  | _ -> failwith "DT: impossible branch"
))

# 2064 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleRetExpr = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (match dtb__235 with
  | { B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__237 } -> (match dtb__237 with
  | { B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__239 } -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__239 }, B_dData_dList.C_List_Nil)), dtb__238, dtb__239))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_handleNoRetSyntax, mc1))
  | _ -> failwith "DT: impossible branch"
))

# 2069 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpLam = (fun (ops : t_HandleOp B_dData_dList.t_List) (kname : string) (sp : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpIndexBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleOpBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = kname; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (v_handleOpBinder, sp)), ((B_dData_dList.v_map v_handleAlt) ops), sp)), sp)))

# 2077 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : t_HandleBlock) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | C_HandleBlock_HandleBlock (dtb__240, dtb__241) -> (match dtb__241 with
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> (match ((v_firstOtherKName dtb__243) (v_handleOpKName dtb__242)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_handleSyntax, mc2)), (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (((v_handleRetExpr dtb__240) mc2), (B_dData_dList.C_List__x58__x58_ ((((v_handleOpLam (B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243))) (v_handleOpKName dtb__242)) mc2), B_dData_dList.C_List_Nil)))))), mc2))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> (((Base_dDiagnostics_dFrontend.v_psErrAt mc2) (Base_dDiagnostics_dFrontend.C_PsDiag_HandleContinuationNameMismatch ((v_handleOpKName dtb__242), dtb__244))) (B_dData_dVec.C_Vec_VCons ((v_handleOpKName dtb__242), (B_dData_dVec.C_Vec_VCons (dtb__244, B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At mc2) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2169 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_patBinderBindings = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__245, dtb__246) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__247, dtb__248) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PWild (dtb__249) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb__250, dtb__251, dtb__252) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinderBindings (B_dData_dPair.v_secondOf f)))) dtb__251)
  | Frontend_dAst.C_Pat_PCon (dtb__253, dtb__254, dtb__255) -> ((B_dData_dList.v_concatMap v_patBinderBindings) dtb__254)
  | Frontend_dAst.C_Pat_PAs (dtb__256, dtb__257, dtb__258) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__256; B_dData_dPair.f_Pair_second = dtb__258 }, (v_patBinderBindings dtb__257)))
  | Frontend_dAst.C_Pat_PVar (dtb__259, dtb__260) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__259; B_dData_dPair.f_Pair_second = dtb__260 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2184 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstRepeatedBindingGo = (fun (mc0 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (match dtb__261 with
  | { B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = dtb__264 } -> (if ((B_dData_dList.v_memName dtb__263) mc1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = dtb__264 })) else ((v_firstRepeatedBindingGo dtb__262) (B_dData_dList.C_List__x58__x58_ (dtb__263, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2180 "Vuna/Compiler/Frontend/Parser.vuna"
let v_firstRepeatedBinding = (fun (binds : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_firstRepeatedBindingGo binds) B_dData_dList.C_List_Nil))

# 2199 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkNoRepeatedBinders = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> (match dtb__265 with
  | { B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = dtb__267 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__267)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_appendMessage (String.concat "" [" (repeated name: `"; dtb__266; "`)"])) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_RepeatedPatternBinder) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (pats))
  | _ -> failwith "DT: impossible branch"
)) (v_firstRepeatedBinding ((B_dData_dList.v_concatMap v_patBinderBindings) pats))))

# 2193 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkBindersAt = (fun (st : Frontend_dParser_dSupport.t_PState) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (Frontend_dParser_dSupport.v_pmodeOf st) with
  | Frontend_dParser_dSupport.C_ParseMode_PmTool -> (Base_dDiag.C_Check_OkC (pats))
  | Frontend_dParser_dSupport.C_ParseMode_PmStrict -> (v_checkNoRepeatedBinders pats)
  | _ -> failwith "DT: impossible branch"
))

# 2309 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAsName = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__268; Frontend_dLexer.f_PTok_ptokPos = dtb__269 } -> (match dtb__268 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__270) -> (if (dtb__270 = "_") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__270; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 2366 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPCon = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__272) -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_listConsSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__271, (B_dData_dList.C_List__x58__x58_ (((v_foldPCon mc0) dtb__272), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_listNilSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2381 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairPats = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__274) -> (match dtb__274 with
  | B_dData_dList.C_List_Nil -> dtb__273
  | _ -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_tuplePairSyntax, (B_dData_dList.C_List__x58__x58_ (dtb__273, (B_dData_dList.C_List__x58__x58_ (((v_foldPairPats mc0) dtb__274), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2207 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePatternSingle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((v_parsePatternCons (fuel - 1)) st) blockCol)))
# 2212 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternCons = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternHead (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atSym st1) "::") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternCons (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("::", (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2221 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternHead = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__275; Frontend_dLexer.f_PTok_ptokPos = dtb__276 } -> (match dtb__275 with
  | Frontend_dLexer.C_Tok_TSym (dtb__277) -> (if (dtb__277 = "(") then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (match dtb__278 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__279; Frontend_dLexer.f_PTok_ptokPos = dtb__280 } -> (match dtb__279 with
  | Frontend_dLexer.C_Tok_TSym (dtb__281) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__281) then (((v_parsePatternAtom (fuel - 1)) st) blockCol) else ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> (match dtb__282 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__283; Frontend_dLexer.f_PTok_ptokPos = dtb__284 } -> (match dtb__283 with
  | Frontend_dLexer.C_Tok_TSym (dtb__285) -> (if (dtb__285 = ")") then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__281, args, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
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
  | Frontend_dLexer.C_Tok_TIdent (dtb__286) -> ((fun st1 -> (if (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__286) then ((Frontend_dParser_dSupport.v_atSym st1) "{") else false) then ((Base_dCommon.v_step (((v_parseRecordPatternFields (fuel - 1)) st1) blockCol)) (fun (fields : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__286, fields, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__286) then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__286, args, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol)))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 2244 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternFields = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseRecordPatternList (fuel - 1)) st1) blockCol)))))
# 2253 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordPatternField (fuel - 1)) st) blockCol)) (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseRecordPatternList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "}")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2264 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternField = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__287; Frontend_dLexer.f_PTok_ptokPos = dtb__288 } -> (match dtb__287 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__289) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) "=") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st2) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__289; B_dData_dPair.f_Pair_second = pat }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__289; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Pat_PVar (dtb__289, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__288); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__288); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__288); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__288); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__288); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__288) })) }; B_dData_dPair.f_Pair_second = st1 })))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedRecordFieldPattern)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 2276 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtoms = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 2287 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_finishAsPattern (fuel - 1)) st) base) st1) blockCol)))))
# 2297 "Vuna/Compiler/Frontend/Parser.vuna"
and v_finishAsPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Frontend_dAst.C_Pat_PVar (dtb__290, dtb__291) -> (if (dtb__290 = "_") then ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, (Frontend_dAst.C_Pat_PWild (dtb__291)), ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__290, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, base, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))))
)) base) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st1 })))))
# 2318 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__292; Frontend_dLexer.f_PTok_ptokPos = dtb__293 } -> (match dtb__292 with
  | Frontend_dLexer.C_Tok_TSym (dtb__294) -> (if (dtb__294 = "(") then (if ((Frontend_dParser_dSupport.v_atSym (Frontend_dParser_dSupport.v_advance st)) ")") then ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_tupleUnitSyntax, B_dData_dList.C_List_Nil, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (first : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairPats ((Frontend_dParser_dSupport.v_spanOf st) st2)) pats); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 })))))))) else (if (dtb__294 = "[") then (((v_parseListPattern (fuel - 1)) st) blockCol) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__295, dtb__296, dtb__297) -> (match (v_textPartsOf dtb__296) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> ((fun advanced -> ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__298, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (((((Frontend_dParser_dSupport.v_mkStateAt (Frontend_dParser_dSupport.v_fileOf st)) (advanced).Frontend_dParser_dSupport.f_PState_toksOf) dtb__297) (advanced).Frontend_dParser_dSupport.f_PState_toksLeft) (Frontend_dParser_dSupport.v_pmodeOf st)))) (Frontend_dParser_dSupport.v_advance st))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateInPattern)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dLexer.C_Tok_TStr (dtb__299) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__299, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__300) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__300, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__301) -> (if (dtb__301 = "_") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__301) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__301, B_dData_dList.C_List_Nil, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__301, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 2347 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (Frontend_dAst.v_listNilSyntax, B_dData_dList.C_List_Nil, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) st1) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPCon ((Frontend_dParser_dSupport.v_spanOf st) st2)) pats); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2356 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPatternElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))
# 2371 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (p, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (p, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1053 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseClausePatterns = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseClausePatterns (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))

# 930 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseBindingItemsAt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__302; Base_dSource.f_Pos_posCol = dtb__303; Base_dSource.f_Pos_posOffset = dtb__304; Base_dSource.f_Pos_posEndOffset = dtb__305 } -> (if (dtb__303 = bindCol) then ((Base_dCommon.v_step (((v_parseBindingItem (fuel - 1)) st) bindCol)) (fun (item : t_BindingItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st1) bindCol)) (fun (rest : t_BindingItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__303 > bindCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInBinding) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 942 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItem = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__306, dtb__307) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) bindCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BISig (dtb__306, ty, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 })))))))) else (((((v_parseBindingDef (fuel - 1)) st) st1) bindCol) pat))
  | _ -> (((((v_parseBindingDef (fuel - 1)) st) st1) bindCol) pat)
)))))
# 955 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingDef = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__308, dtb__309) -> (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) bindCol) else false) then ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "=")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) bindCol)) (fun (value : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__308, (Frontend_dAst.v_patSpan pat))); B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_ELocalFun ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pats; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf stStart) st4))) })); B_dData_dPair.f_Pair_second = st4 })))))))))) else ((Base_dCommon.v_step ((((v_parseBindingValue (fuel - 1)) st) pat) bindCol)) (fun (b : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((((v_parseBindingValue (fuel - 1)) st) pat) bindCol)) (fun (b : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 }))))
)))
# 964 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingValue = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (pat : Frontend_dAst.t_Pat) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "=")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = value }; B_dData_dPair.f_Pair_second = st2 }))))))))))
# 1385 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (((v_parseLhs (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st1) blockCol) lhs))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExprNotIndented)))))
# 1400 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseInfix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (lhs : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__310; Frontend_dLexer.f_PTok_ptokPos = dtb__311 } -> (match dtb__310 with
  | Frontend_dLexer.C_Tok_TSym (dtb__312) -> (if (dtb__312 = "`") then (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectValueName (Frontend_dParser_dSupport.v_advance st))) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "`")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st3) blockCol) (Frontend_dAst.C_Expr_EBacktick (name, lhs, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st3)))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))) else (if (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isSyntaxSym dtb__312)) else false) then (if (Frontend_dParser_dSupport.v_closeParenNext st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectR (lhs, dtb__312, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseInfix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EInfix (dtb__312, lhs, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st2))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 1413 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLhs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__313; Frontend_dLexer.f_PTok_ptokPos = dtb__314 } -> (match dtb__313 with
  | Frontend_dLexer.C_Tok_TSym (dtb__315) -> (if (dtb__315 = "\\") then (((v_parseLambda (fuel - 1)) st) blockCol) else (if (dtb__315 = "-") then (((v_parseNegation (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))
  | Frontend_dLexer.C_Tok_TKw (dtb__316) -> (if (dtb__316 = "let") then (((v_parseLet (fuel - 1)) st) blockCol) else (if (dtb__316 = "case") then (((v_parseCase (fuel - 1)) st) blockCol) else (if (dtb__316 = "if") then (((v_parseIf (fuel - 1)) st) blockCol) else (if (dtb__316 = "do") then (((v_parseDo (fuel - 1)) st) blockCol) else (if (dtb__316 = "perform") then (((v_parsePerform (fuel - 1)) st) blockCol) else (if (dtb__316 = "handle") then (((v_parseHandle (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))))))
  | _ -> (((v_parseApplication (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 1431 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseNegation = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__317) -> (match dtb__317 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__318; Frontend_dLexer.f_PTok_ptokPos = dtb__319 } -> (match dtb__318 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__320) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (("-" ^ dtb__320), ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__321) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt ((0 - dtb__321), ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))
)) ((Frontend_dParser_dSupport.v_peekTokAt st) 1))))
# 1441 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseApplication = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st2) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_appAtSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st3))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (payload, args)))), ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((fun app -> (if ((Frontend_dParser_dSupport.v_atSym st2) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_rowAtSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st3))), (B_dData_dList.C_List__x58__x58_ (app, (B_dData_dList.C_List__x58__x58_ (payload, B_dData_dList.C_List_Nil)))), ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = app; B_dData_dPair.f_Pair_second = st2 })))) (Frontend_dAst.C_Expr_EApp (first, args, ((Frontend_dParser_dSupport.v_spanOf st) st2))))
))))))))
# 1463 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtPayload = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_rowAtNameExpr e); B_dData_dPair.f_Pair_second = st1 }))))))
# 1485 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseArgs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (arg : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (arg, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 1496 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol) base)))))
# 1531 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__322; Frontend_dLexer.f_PTok_ptokPos = dtb__323 } -> (match dtb__322 with
  | Frontend_dLexer.C_Tok_TSym (dtb__324) -> (if (dtb__324 = "(") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__325) -> (if (Frontend_dParser_dSupport.v_piArrowAhead (Frontend_dParser_dSupport.v_advance st)) then ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__325)) (B_dData_dPair.v_secondOf dtb__325)) false) "(") ")") else (((v_parseParenAtom (fuel - 1)) st) blockCol))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dParser_dSupport.v_sectionOpAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__326) -> ((((v_parseSectionAtom (fuel - 1)) st) blockCol) dtb__326)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_parseParenAtom (fuel - 1)) st) blockCol)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__324 = "[") then (((v_parseListExpr (fuel - 1)) st) blockCol) else (if (dtb__324 = "?") then (match (Frontend_dParser_dSupport.v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__327) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((B_dData_dPair.v_firstOf dtb__327), (B_dData_dPair.v_secondOf dtb__327))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__324 = "{") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__328)) (B_dData_dPair.v_secondOf dtb__328)) true) "{") "}")
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "|")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st3) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (base, fields, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))
  | _ -> failwith "DT: impossible branch"
) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__329) -> (if (dtb__329 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ("Type", ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__330, dtb__331, dtb__332) -> (((((v_parseTemplateAtom (fuel - 1)) st) dtb__330) dtb__331) dtb__332)
  | Frontend_dLexer.C_Tok_TStr (dtb__333) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__333, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TFloat (dtb__334) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__334, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__335) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__335, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__336) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) "{") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "{")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st1b) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__336, fields, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))))) else (if (((v_macroBangAt st1) dtb__323) dtb__336) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "!")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1b) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((v_macroAtom dtb__336) args) ((Frontend_dParser_dSupport.v_spanOf st) st2)) ((Frontend_dParser_dSupport.v_spanOf st) st1b)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__336, ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))
# 1570 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (multi : bool) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) (Frontend_dParser_dSupport.v_fileOf st)) (Frontend_dParser_dSupport.v_pmodeOf st)) (Frontend_dParser_dSupport.v_tokSpan st)) parts)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> ((fun advanced -> ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (multi, ps, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (((((Frontend_dParser_dSupport.v_mkStateAt (Frontend_dParser_dSupport.v_fileOf st)) (advanced).Frontend_dParser_dSupport.f_PState_toksOf) endP) (advanced).Frontend_dParser_dSupport.f_PState_toksLeft) (Frontend_dParser_dSupport.v_pmodeOf st)))) (Frontend_dParser_dSupport.v_advance st))))))
# 1583 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateParts = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__337, dtb__338) -> (match dtb__337 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__339) -> ((Base_dCommon.v_bind (((((v_parseTemplateHole (v_toksFuel dtb__339)) file) mode) fallback) dtb__339)) (fun (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__338)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e)), ps))))))))
  | Frontend_dLexer.C_TmplPart_TPText (dtb__340) -> ((Base_dCommon.v_bind (((((v_parseTemplateParts (fuel - 1)) file) mode) fallback) dtb__338)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__340)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 1595 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateHole = (fun (fuel : int) (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (fallback : Base_dSource.t_Span) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match toks with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At fallback) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateHoleEmpty)
  | B_dData_dList.C_List__x58__x58_ (dtb__341, dtb__342) -> ((fun pos -> ((fun subState -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__343) -> (match dtb__343 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__345) then (Base_dDiag.C_Check_OkC (dtb__344)) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (((v_holeSpan file) pos))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__346) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan ((v_holeSpan file) pos)) dtb__346)))
  | _ -> failwith "DT: impossible branch"
)) (((v_parseExpr (fuel - 1)) subState) 0))) (((((Frontend_dParser_dSupport.v_mkStateAt file) toks) pos) (B_dData_dList.v_length toks)) mode))) (dtb__341).Frontend_dLexer.f_PTok_ptokPos)
  | _ -> failwith "DT: impossible branch"
)))
# 1628 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then ((fun st2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_tupleUnitSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))) (Frontend_dParser_dSupport.v_advance st1)) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ",") then ((Base_dCommon.v_step ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairExprs ((Frontend_dParser_dSupport.v_spanOf st) st3)) elems); B_dData_dPair.f_Pair_second = st3 })))) else (if ((Frontend_dParser_dSupport.v_atSym st2) ":") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_ascribeSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st2))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil)))), ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EParen (first, ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))))))))))))
# 1644 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (e, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))
# 1661 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseSectionAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (op : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) op)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectOp (op, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st2)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) })) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ESectL (op, rhs, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 1673 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePiBinder = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (names : string B_dData_dList.t_List) (implicit : bool) (openSym : string) (closeSym : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (v_anyDottedName names) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_PiBinderNameNotSimple) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) openSym)) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_consumeQty st1) qty)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st2)) (fun (names2 : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (dom : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st5) closeSym)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st6) "->")) (fun (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st7) blockCol)) (fun (cod : Frontend_dAst.t_Expr) (st8 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((v_foldPiNames names2) implicit) qty) dom) cod) ((Frontend_dParser_dSupport.v_spanOf st) st8)); B_dData_dPair.f_Pair_second = st8 })))))))))))))))))))))
# 1723 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignments = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) st) blockCol)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = fs; B_dData_dPair.f_Pair_second = st1 })))))))
# 1734 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (fname : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st3) ",") then ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st3)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, rest)); B_dData_dPair.f_Pair_second = st4 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "}")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 1743 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_listNilSyntax, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) st1) blockCol)) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldCons ((Frontend_dParser_dSupport.v_spanOf st) st2)) elems); B_dData_dPair.f_Pair_second = st2 })))))))))
# 1752 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExprElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e0 : Frontend_dAst.t_Expr) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseListElemAt (fuel - 1)) e0) st0)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))))
# 1763 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListElemAt = (fun (fuel : int) (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "@") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "@")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st1) 0)) (fun (nm : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_rowAtSyntax, ((v_spanFromExpr e) st2))), (B_dData_dList.C_List__x58__x58_ (e, (B_dData_dList.C_List__x58__x58_ ((v_rowAtNameExpr nm), B_dData_dList.C_List_Nil)))), ((v_spanFromExpr e) st2))); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e; B_dData_dPair.f_Pair_second = st })))))
# 1779 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLambda = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "\\")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseLambdaParam st1)) (fun (first : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLambdaParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (params : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "=>")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (params, body, ((Frontend_dParser_dSupport.v_spanOf st) st5))); B_dData_dPair.f_Pair_second = st5 }))))))))))))))
# 1806 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLet = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "let")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLetBindings (fuel - 1)) st1) blockCol)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "in")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (binds, body, false, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 1817 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLetBindings = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__347; Base_dSource.f_Pos_posCol = dtb__348; Base_dSource.f_Pos_posOffset = dtb__349; Base_dSource.f_Pos_posEndOffset = dtb__350 } -> (if (dtb__348 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_LetBindingNotIndented) else ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st) dtb__348)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1829 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "case")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (scrut : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "of")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCaseAlts (fuel - 1)) st3) blockCol)) (fun (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (scrut, alts, ((Frontend_dParser_dSupport.v_spanOf st) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 1838 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCaseAlts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__351; Base_dSource.f_Pos_posCol = dtb__352; Base_dSource.f_Pos_posOffset = dtb__353; Base_dSource.f_Pos_posEndOffset = dtb__354 } -> (if (dtb__352 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseAltNotIndented) else ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st) dtb__352)) (fun (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_badCaseIndent st2) dtb__352) then ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentAfterCaseAlt) else (match alts with
  | B_dData_dList.C_List_Nil -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = alts; B_dData_dPair.f_Pair_second = st2 }))
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 1860 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__355; Base_dSource.f_Pos_posCol = dtb__356; Base_dSource.f_Pos_posOffset = dtb__357; Base_dSource.f_Pos_posEndOffset = dtb__358 } -> (if (dtb__356 = altCol) then ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) altCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) altCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st3) altCol)) (fun (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = body }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
))))
# 1877 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePerform = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "perform")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) st1) blockCol)) (fun (operand : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dAst.v_performSyntax, ((Frontend_dParser_dSupport.v_spanOf st) st2))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)), ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 1914 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "handle")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleComp (fuel - 1)) st1) blockCol)) (fun (comp : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "{")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleBody (fuel - 1)) st3) blockCol)) (fun (blk : t_HandleBlock) (st4 : Frontend_dParser_dSupport.t_PState) -> (match (((v_handleExpr comp) blk) ((Frontend_dParser_dSupport.v_spanOf st) st4)) with
  | Base_dDiag.C_Check_ErrC (dtb__359) -> (Base_dDiag.C_Check_ErrC (dtb__359))
  | Base_dDiag.C_Check_OkC (dtb__360) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__360; B_dData_dPair.f_Pair_second = st4 }))
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 1936 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleComp = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__361; Frontend_dLexer.f_PTok_ptokPos = dtb__362 } -> (match dtb__361 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__363) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__364) -> (match dtb__364 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__365; Frontend_dLexer.f_PTok_ptokPos = dtb__366 } -> (match dtb__365 with
  | Frontend_dLexer.C_Tok_TSym (dtb__367) -> (if (dtb__367 = "{") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__363, ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (((v_parseExpr (fuel - 1)) st) blockCol))
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
# 1949 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (handleCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__368; Base_dSource.f_Pos_posCol = dtb__369; Base_dSource.f_Pos_posOffset = dtb__370; Base_dSource.f_Pos_posEndOffset = dtb__371 } -> (if (dtb__369 <= handleCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNotIndented) else ((Base_dCommon.v_step (((((v_parseHandleClauses (fuel - 1)) st) dtb__369) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dList.C_List_Nil)) (fun (p : ((string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe, t_HandleOp B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__372; B_dData_dPair.f_Pair_second = dtb__373 } -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "}")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleBlock_HandleBlock (dtb__372, dtb__373)); B_dData_dPair.f_Pair_second = st3 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1975 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleClauses = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (retOpt : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : t_HandleOp B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__374; Base_dSource.f_Pos_posCol = dtb__375; Base_dSource.f_Pos_posOffset = dtb__376; Base_dSource.f_Pos_posEndOffset = dtb__377 } -> (if (dtb__375 = clauseCol) then (if (v_isReturnClauseHead st) then (match retOpt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match acc with
  | B_dData_dList.C_List__x58__x58_ (dtb__379, dtb__380) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_step (((v_parseHandleRetClause (fuel - 1)) st) clauseCol)) (fun (p : (string, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__381; B_dData_dPair.f_Pair_second = dtb__382 } -> (match dtb__382 with
  | { B_dData_dPair.f_Pair_first = dtb__383; B_dData_dPair.f_Pair_second = dtb__384 } -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__381; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__383; B_dData_dPair.f_Pair_second = dtb__384 } }))) acc)
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
# 2005 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleRetClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_ukw : string) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st0)) (fun (x : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "->")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = x; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3 }))))))))))))
# 2015 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) clauseCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match pat with
  | Frontend_dAst.C_Pat_PCon (dtb__385, dtb__386, dtb__387) -> (match (B_dData_dList.v_reverse dtb__386) with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb__387) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
  | B_dData_dList.C_List__x58__x58_ (dtb__388, dtb__389) -> (match dtb__388 with
  | Frontend_dAst.C_Pat_PVar (dtb__390, dtb__391) -> (((((((v_handleOpTail (fuel - 1)) st1) clauseCol) dtb__385) (B_dData_dList.v_reverse dtb__389)) dtb__387) dtb__390)
  | Frontend_dAst.C_Pat_PWild (dtb__392) -> (((((((v_handleOpTail (fuel - 1)) st1) clauseCol) dtb__385) (B_dData_dList.v_reverse dtb__389)) dtb__387) "_")
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb__387) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)))))))
# 2038 "Vuna/Compiler/Frontend/Parser.vuna"
and v_handleOpTail = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (cname : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (psp : Base_dSource.t_Span) (kname : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "->")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleOp_HandleOp (cname, pats, psp, kname, body)); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2087 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseIf = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "if")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (cond : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "then")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (yes : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st4) "else")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st5) blockCol)) (fun (no : Frontend_dAst.t_Expr) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (cond, yes, no, ((Frontend_dParser_dSupport.v_spanOf st) st6))); B_dData_dPair.f_Pair_second = st6 }))))))))))))))))
# 2098 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDo = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "do")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st1) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement) else (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__393; Base_dSource.f_Pos_posCol = dtb__394; Base_dSource.f_Pos_posOffset = dtb__395; Base_dSource.f_Pos_posEndOffset = dtb__396 } -> (if (dtb__394 <= blockCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoStatementNotIndented) else ((Base_dCommon.v_step ((((v_parseDoStmts (fuel - 1)) st1) dtb__394) B_dData_dList.C_List_Nil)) (fun (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__397, dtb__398) -> (match dtb__397 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__399, dtb__400) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (stmts, ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)) (B_dData_dList.v_reverse stmts)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 2121 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (acc : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__401; Base_dSource.f_Pos_posCol = dtb__402; Base_dSource.f_Pos_posOffset = dtb__403; Base_dSource.f_Pos_posEndOffset = dtb__404 } -> (if (dtb__402 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (if (dtb__402 > stmtCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((Base_dCommon.v_step (((v_parseDoStmt (fuel - 1)) st) stmtCol)) (fun (stmt : Frontend_dAst.t_DoStmt) (st1 : Frontend_dParser_dSupport.t_PState) -> (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__405; Base_dSource.f_Pos_posCol = dtb__406; Base_dSource.f_Pos_posOffset = dtb__407; Base_dSource.f_Pos_posEndOffset = dtb__408 } -> (if (Frontend_dParser_dSupport.v_isEof st1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__406 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__406 > stmtCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((((v_parseDoStmts (fuel - 1)) st1) stmtCol) (B_dData_dList.C_List__x58__x58_ (stmt, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2141 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dDiag.C_Check_ErrC (dtb__409) -> (((v_parseDoExprStmt (fuel - 1)) st) stmtCol)
  | Base_dDiag.C_Check_OkC (dtb__410) -> (match dtb__410 with
  | { B_dData_dPair.f_Pair_first = dtb__411; B_dData_dPair.f_Pair_second = dtb__412 } -> (if ((Frontend_dParser_dSupport.v_atSym dtb__412) "<-") then ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (dtb__411, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb__412) "<-")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__411, e, ((Frontend_dParser_dSupport.v_spanOf st) st3))); B_dData_dPair.f_Pair_second = st3 })))))))) else (((v_parseDoExprStmt (fuel - 1)) st) stmtCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) stmtCol))))
# 2150 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoExprStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_sameLineState st)) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (e, ((Frontend_dParser_dSupport.v_spanOf st) st1))); B_dData_dPair.f_Pair_second = st1 }))))))

# 44 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExpressionSource = (fun (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel (((Frontend_dParser_dSupport.v_mkState "<expr>") toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict))) (((Frontend_dParser_dSupport.v_mkState "<expr>") toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict)) 0)) (fun (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC (e)) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr)))))))

# 703 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitSupersRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ",")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) 0)) (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st2) (B_dData_dList.C_List__x58__x58_ (e, acc))))))))))

# 694 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitSupers = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) 0)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil)))))))

# 829 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiom = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "axiom")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st4)) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (name, ty, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st5)) })); B_dData_dPair.f_Pair_second = st5 })))))))))))))

# 490 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiomExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseAxiom st) blockCol) kwPos)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DAxiom (dtb__413, dtb__414, dtb__415) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__413, dtb__415)))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseAxiomExport: not an axiom")
)))))

# 837 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExtern = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "extern")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__416; Frontend_dLexer.f_PTok_ptokPos = dtb__417 } -> (match dtb__416 with
  | Frontend_dLexer.C_Tok_TStr (dtb__418) -> ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__418; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) }))) (fun (cName2 : string) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st5)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (name, cName2, ty, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st6)) })); B_dData_dPair.f_Pair_second = st6 }))))))))))
  | _ -> (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("string"))) "string")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st2)))))))

# 502 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExternExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseExtern st) blockCol) kwPos)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DExtern (dtb__419, dtb__420, dtb__421, dtb__422) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__419, dtb__422)))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseExternExport: not an extern")
)))))

# 917 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhereBindings = (fun (st : Frontend_dParser_dSupport.t_PState) (whereCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__423; Base_dSource.f_Pos_posCol = dtb__424; Base_dSource.f_Pos_posOffset = dtb__425; Base_dSource.f_Pos_posEndOffset = dtb__426 } -> (if (dtb__424 > whereCol) then ((Base_dCommon.v_step (((v_parseBindingItemsAt (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__424)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 905 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhere = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__427; Frontend_dLexer.f_PTok_ptokPos = dtb__428 } -> (match dtb__427 with
  | Frontend_dLexer.C_Tok_TKw (dtb__429) -> (if (dtb__429 = "where") then (if ((Base_dSource.v_posCol dtb__428) > blockCol) then ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))) (fun (_u : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhereBindings st1) blockCol)) (fun (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 871 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseClause = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) (namePos : Base_dSource.t_Pos) -> ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhere st3) blockCol)) (fun (wheres : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> ((fun body2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (name, pats, body2, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine namePos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol namePos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset namePos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st4)) })); B_dData_dPair.f_Pair_second = st4 }))) (match wheres with
  | B_dData_dList.C_List_Nil -> body
  | B_dData_dList.C_List__x58__x58_ (dtb__430, dtb__431) -> (Frontend_dAst.C_Expr_ELet (wheres, body, true, ((Frontend_dParser_dSupport.v_spanOf st) st4)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))

# 1163 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__432; Base_dSource.f_Pos_posCol = dtb__433; Base_dSource.f_Pos_posOffset = dtb__434; Base_dSource.f_Pos_posEndOffset = dtb__435 } -> (if (dtb__433 = fieldCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) fieldCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseFieldList (fuel - 1)) st3b) fieldCol)) (fun (rest : Frontend_dAst.t_Field B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Field_fieldName = name; Frontend_dAst.f_Field_fieldType = ty; Frontend_dAst.f_Field_fieldSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (if (dtb__433 > fieldCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInRecord) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1155 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFields = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__436; Base_dSource.f_Pos_posCol = dtb__437; Base_dSource.f_Pos_posOffset = dtb__438; Base_dSource.f_Pos_posEndOffset = dtb__439 } -> (if (dtb__437 > blockCol) then (((v_parseFieldList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__437) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 611 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecordExport = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3b) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st6 }))) (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__440, dtb__441, tier, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st6)) })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 565 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredExport = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__442; Frontend_dLexer.f_PTok_ptokPos = dtb__443 } -> (match dtb__442 with
  | Frontend_dLexer.C_Tok_TKw (dtb__444) -> (if (dtb__444 = "linear") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__445; Frontend_dLexer.f_PTok_ptokPos = dtb__446 } -> (match dtb__445 with
  | Frontend_dLexer.C_Tok_TKw (dtb__447) -> (if (dtb__447 = "record") then (((((v_parseRecordExport true) tier) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) blockCol) kwPos) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) else (if (dtb__444 = "record") then (((((v_parseRecordExport false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) kwPos) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 1132 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecord = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = dtb__449 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__448, dtb__449, tier, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st6)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st6)) })); B_dData_dPair.f_Pair_second = st6 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 1089 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredDecl = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__450; Frontend_dLexer.f_PTok_ptokPos = dtb__451 } -> (match dtb__450 with
  | Frontend_dLexer.C_Tok_TKw (dtb__452) -> (if (dtb__452 = "linear") then ((fun st1 -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__453; Frontend_dLexer.f_PTok_ptokPos = dtb__454 } -> (match dtb__453 with
  | Frontend_dLexer.C_Tok_TKw (dtb__455) -> (if (dtb__455 = "record") then (((((v_parseRecord true) tier) st1) blockCol) kwPos) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st1))) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) else (if (dtb__452 = "record") then (((((v_parseRecord false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) kwPos) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st))))

# 1229 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__456; Frontend_dLexer.f_PTok_ptokPos = dtb__457 } -> (match dtb__456 with
  | Frontend_dLexer.C_Tok_TSym (dtb__458) -> (if (dtb__458 = "(") then (if (v_parenIsMemberList st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) 0)) (fun (kind : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st4) ")")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) st5)) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_TraitParam_traitParamName = n; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (kind)) })) names)) rest); B_dData_dPair.f_Pair_second = st6 }))))))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__459) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitParam_traitParamName = dtb__459; Frontend_dAst.f_TraitParam_traitParamKind = B_dData_dMaybe.C_Maybe_Nothing }, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st))))

# 668 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitHead = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if (v_traitSupersFollow st) then ((Base_dCommon.v_bind ((v_parseTraitSupers (Frontend_dParser_dSupport.v_stateFuel st)) st)) (fun (p : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair) -> ((fun supers -> ((fun st1 -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = supers }; B_dData_dPair.f_Pair_second = st3 }))))))) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p)))) else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1247 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMethodSigList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__460; Base_dSource.f_Pos_posCol = dtb__461; Base_dSource.f_Pos_posOffset = dtb__462; Base_dSource.f_Pos_posEndOffset = dtb__463 } -> (if (dtb__461 = methodCol) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) methodCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseMethodSigList (fuel - 1)) st3b) methodCol)) (fun (rest : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitMethod_traitMethodName = name; Frontend_dAst.f_TraitMethod_traitMethodType = ty; Frontend_dAst.f_TraitMethod_traitMethodSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (if (dtb__461 > methodCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInTrait) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1239 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigs = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__464; Base_dSource.f_Pos_posCol = dtb__465; Base_dSource.f_Pos_posOffset = dtb__466; Base_dSource.f_Pos_posEndOffset = dtb__467 } -> (if (dtb__465 > blockCol) then (((v_parseMethodSigList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__465) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 640 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitExportMembers st2)) (fun (members : Frontend_dAst.t_ExportMembers) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st4) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType ((h).f_TraitHead_traitHeadName, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st5 }))) (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st5)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st5)) }))))))))))))))

# 1210 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTrait = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st3) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = decl; B_dData_dPair.f_Pair_second = st4 }))) (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st4)) }))))))))))))

# 1303 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtxRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e, acc))) blockCol) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st3 }))))))))))))

# 1277 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtxThenExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctxThenSplit e1) hd); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil))) blockCol) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e1 }; B_dData_dPair.f_Pair_second = st1 }))))))))

# 857 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSignature = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (allowCtx : bool) (name : string) (namePos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> (match dtb__468 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, B_dData_dList.C_List_Nil, dtb__469, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine namePos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol namePos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset namePos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) })); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (if allowCtx then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, dtb__468, dtb__469, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine namePos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol namePos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset namePos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st2)) })); B_dData_dPair.f_Pair_second = st2 })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere))
)
  | _ -> failwith "DT: impossible branch"
))))))

# 462 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedValue = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__470; Frontend_dLexer.f_PTok_ptokPos = dtb__471 } -> (match dtb__470 with
  | Frontend_dLexer.C_Tok_TSym (dtb__472) -> (if (dtb__472 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) name) (Frontend_dParser_dSupport.v_peekPos st))) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) name) (Frontend_dParser_dSupport.v_peekPos st))) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__472) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__472) dtb__471)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__472, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__472) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__472) dtb__471)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__472, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__472) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))))) (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__473) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__473) dtb__471)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__473, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__473) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__473) dtb__471)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__473, ((Frontend_dParser_dSupport.v_spanOf st) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__473) ((Frontend_dParser_dSupport.v_spanOf st) st2)) }; B_dData_dPair.f_Pair_second = st2 })))))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 543 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityValue = (fun (kind : Frontend_dAst.t_Opacity) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwSpan : Base_dSource.t_Span) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__474; Frontend_dLexer.f_PTok_ptokPos = dtb__475 } -> (match dtb__474 with
  | Frontend_dLexer.C_Tok_TSym (dtb__476) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__476) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__476) dtb__475)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__476; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = ((Frontend_dParser_dSupport.v_spanOf st) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))) (Frontend_dParser_dSupport.v_advance st)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__477) -> ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__477) dtb__475)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__477; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = ((Frontend_dParser_dSupport.v_spanOf st) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))) (Frontend_dParser_dSupport.v_advance st))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 526 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__478; Frontend_dLexer.f_PTok_ptokPos = dtb__479 } -> (match dtb__478 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__480) -> (if (dtb__480 = "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityAbstract) st1) blockCol) ((Frontend_dParser_dSupport.v_spanOf st) st1)))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))
  | Frontend_dLexer.C_Tok_TKw (dtb__481) -> (if (dtb__481 = "opaque") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "opaque")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityOpaque) st1) blockCol) ((Frontend_dParser_dSupport.v_spanOf st) st1)))) else (if (dtb__481 = "transparent") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "transparent")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityTransparent) st1) blockCol) ((Frontend_dParser_dSupport.v_spanOf st) st1)))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 1334 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (v_instanceMethodStart st) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) false) name) (Frontend_dParser_dSupport.v_peekPos st)) else ((((v_parseClause st1) blockCol) name) (Frontend_dParser_dSupport.v_peekPos st))))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1324 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseInstanceDeclList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (declCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__482; Base_dSource.f_Pos_posCol = dtb__483; Base_dSource.f_Pos_posOffset = dtb__484; Base_dSource.f_Pos_posEndOffset = dtb__485 } -> (if (dtb__483 = declCol) then ((Base_dCommon.v_step ((v_parseInstanceDecl st) declCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseInstanceDeclList (fuel - 1)) st1) declCol)) (fun (rest : Frontend_dAst.t_Decl B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (decl, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__483 > declCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInInstance) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1316 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__486; Base_dSource.f_Pos_posCol = dtb__487; Base_dSource.f_Pos_posOffset = dtb__488; Base_dSource.f_Pos_posEndOffset = dtb__489 } -> (if (dtb__487 > blockCol) then (((v_parseInstanceDeclList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__487) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1271 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceTail = (fun (ctxE : Frontend_dAst.t_Expr B_dData_dList.t_List) (head : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseInstanceBody st3) blockCol)) (fun (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (ctxE, head, methods, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st4)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st4)) })); B_dData_dPair.f_Pair_second = st4 })))))))

# 1260 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstance = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "instance")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__490; B_dData_dPair.f_Pair_second = dtb__491 } -> ((((((v_parseInstanceTail dtb__490) dtb__491) st) blockCol) kwPos) st2)
  | _ -> failwith "DT: impossible branch"
))))))

# 1375 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtorList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__492; Base_dSource.f_Pos_posCol = dtb__493; Base_dSource.f_Pos_posOffset = dtb__494; Base_dSource.f_Pos_posEndOffset = dtb__495 } -> (if (dtb__493 = ctorCol) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) ctorCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtorList (fuel - 1)) st3b) ctorCol)) (fun (rest : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Ctor_ctorName = name; Frontend_dAst.f_Ctor_ctorType = ty; Frontend_dAst.f_Ctor_ctorArity = (Frontend_dParser_dSupport.v_countArrows ty); Frontend_dAst.f_Ctor_ctorSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) }, rest)); B_dData_dPair.f_Pair_second = st4 })))))))))))) else (if (dtb__493 > ctorCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInData) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1367 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtors = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__496; Base_dSource.f_Pos_posCol = dtb__497; Base_dSource.f_Pos_posOffset = dtb__498; Base_dSource.f_Pos_posEndOffset = dtb__499 } -> (if (dtb__497 > blockCol) then (((v_parseCtorList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__497) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 576 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDataExport = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3b) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__500; B_dData_dPair.f_Pair_second = dtb__501 } -> ((fun decl -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st8 }))) (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__500, dtb__501, Frontend_dAst.C_ReprTier_ReprAuto, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st8)) })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))))

# 515 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__502; Frontend_dLexer.f_PTok_ptokPos = dtb__503 } -> (match dtb__502 with
  | Frontend_dLexer.C_Tok_TKw (dtb__504) -> (if (dtb__504 = "data") then ((((v_parseDataExport true) st1) blockCol) kwPos) else (if (dtb__504 = "record") then (((((v_parseRecordExport true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) kwPos) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st1)))))

# 407 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedPlain = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__505; Frontend_dLexer.f_PTok_ptokPos = dtb__506 } -> (match dtb__505 with
  | Frontend_dLexer.C_Tok_TSym (dtb__507) -> (((v_parseExportedValue op) st) blockCol)
  | Frontend_dLexer.C_Tok_TIdent (dtb__508) -> (if (if (if (dtb__508 = "alias") then true else (dtb__508 = "boxed")) then (v_tierFollows st) else false) then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseTieredExport (if (dtb__508 = "alias") then Frontend_dAst.C_ReprTier_ReprAlias else Frontend_dAst.C_ReprTier_ReprBoxed)) st) blockCol) dtb__506)) else (((v_parseExportedValue op) st) blockCol))
  | Frontend_dLexer.C_Tok_TKw (dtb__509) -> (if (dtb__509 = "data") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseDataExport false) st) blockCol) dtb__506)) else (if (dtb__509 = "linear") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseLinearExport st) blockCol) dtb__506)) else (if (dtb__509 = "record") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((((v_parseRecordExport false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) dtb__506)) else (if (dtb__509 = "trait") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseTraitExport st) blockCol) dtb__506)) else (if (dtb__509 = "axiom") then ((((v_parseAxiomExport op) st) blockCol) dtb__506) else (if (dtb__509 = "extern") then ((((v_parseExternExport op) st) blockCol) dtb__506) else (if (dtb__509 = "transparent") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) dtb__506) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else (if (dtb__509 = "opaque") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) dtb__506) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 401 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atKw st1) "opaque") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "opaque")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityOpaque))) st2) blockCol))) else (if (if ((Frontend_dParser_dSupport.v_atKw st1) "transparent") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "transparent")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityTransparent))) st2) blockCol))) else (if ((v_atIdentName st1) "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityAbstract))) st2) blockCol))) else (((v_parseExportedPlain B_dData_dMaybe.C_Maybe_Nothing) st1) blockCol)))))))

# 1101 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseData = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__510; B_dData_dPair.f_Pair_second = dtb__511 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__510, dtb__511, Frontend_dAst.C_ReprTier_ReprAuto, lin, { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine kwPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol kwPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (Frontend_dParser_dSupport.v_lastPos st8)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset kwPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_lastPos st8)) })); B_dData_dPair.f_Pair_second = st8 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

# 1065 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (kwPos : Base_dSource.t_Pos) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__512; Frontend_dLexer.f_PTok_ptokPos = dtb__513 } -> (match dtb__512 with
  | Frontend_dLexer.C_Tok_TKw (dtb__514) -> (if (dtb__514 = "data") then ((((v_parseData true) st1) blockCol) kwPos) else (if (dtb__514 = "record") then (((((v_parseRecord true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) kwPos) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st1)))))

# 789 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__515; Frontend_dLexer.f_PTok_ptokPos = dtb__516 } -> (match dtb__515 with
  | Frontend_dLexer.C_Tok_TSym (dtb__517) -> (if (dtb__517 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) name) dtb__516) else ((((v_parseClause st1) blockCol) name) dtb__516)))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__517) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl) else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__517) dtb__516) else ((((v_parseClause st1) blockCol) dtb__517) dtb__516))) (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__518) -> (if (if (dtb__518 = "alias") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) dtb__516) else (if (if (dtb__518 = "boxed") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) dtb__516) else ((fun st1 -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__518) dtb__516) else ((((v_parseClause st1) blockCol) dtb__518) dtb__516))) (Frontend_dParser_dSupport.v_advance st))))
  | Frontend_dLexer.C_Tok_TKw (dtb__519) -> (if (dtb__519 = "data") then ((((v_parseData false) st) blockCol) dtb__516) else (if (dtb__519 = "linear") then (((v_parseLinearDecl st) blockCol) dtb__516) else (if (dtb__519 = "axiom") then (((v_parseAxiom st) blockCol) dtb__516) else (if (dtb__519 = "extern") then (((v_parseExtern st) blockCol) dtb__516) else (if (dtb__519 = "record") then (((((v_parseRecord false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) dtb__516) else (if (dtb__519 = "trait") then (((v_parseTrait st) blockCol) dtb__516) else (if (dtb__519 = "instance") then (((v_parseInstance st) blockCol) dtb__516) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 335 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityOrDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__520; Frontend_dLexer.f_PTok_ptokPos = dtb__521 } -> (match dtb__520 with
  | Frontend_dLexer.C_Tok_TKw (dtb__522) -> (if (dtb__522 = "infixl") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 1) dtb__521)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__522 = "infixr") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 2) dtb__521)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__522 = "infix") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 0) dtb__521)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))))))))
  | _ -> (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))))))
)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dParser_dSupport.v_peekTok st)))

# 262 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDecls = (fun (recover : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : t_DeclAcc) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_reverseDeclAcc acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = st; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__523; Base_dSource.f_Pos_posCol = dtb__524; Base_dSource.f_Pos_posOffset = dtb__525; Base_dSource.f_Pos_posEndOffset = dtb__526 } -> (if (dtb__524 = blockCol) then (match ((v_parseFixityOrDecl st) blockCol) with
  | Base_dDiag.C_Check_ErrC (dtb__527) -> (if recover then ((fun st2 -> ((Base_dCommon.v_step (((((v_parseDecls true) (fuel - 1)) st2) blockCol) acc)) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__528; B_dData_dPair.f_Pair_second = dtb__529 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__528; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__527, dtb__529)) } }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_recoverDecl st) blockCol)) else (Base_dDiag.C_Check_ErrC (dtb__527)))
  | Base_dDiag.C_Check_OkC (dtb__530) -> ((fun pd -> ((fun st1 -> ((fun acc2 -> (((((v_parseDecls recover) (fuel - 1)) st1) blockCol) acc2)) ((v_addParsedDecl pd) acc))) (B_dData_dPair.v_secondOf dtb__530))) (B_dData_dPair.v_firstOf dtb__530))
  | _ -> failwith "DT: impossible branch"
) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn ((bi_strFromInt blockCol)))) (bi_strFromInt blockCol)))
  | _ -> failwith "DT: impossible branch"
))))

# 71 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceFile = (fun (recover : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseModDecl st)) (fun (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (imp : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match imp with
  | { B_dData_dPair.f_Pair_first = dtb__531; B_dData_dPair.f_Pair_second = dtb__532 } -> (if (Frontend_dParser_dSupport.v_isEof st2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__531; Frontend_dAst.f_SourceFile_sourceFileFixities = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileDecls = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__532; Frontend_dAst.f_SourceFile_sourceFileOpacity = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) else (match (Frontend_dParser_dSupport.v_peekPos st2) with
  | { Base_dSource.f_Pos_posLine = dtb__533; Base_dSource.f_Pos_posCol = dtb__534; Base_dSource.f_Pos_posOffset = dtb__535; Base_dSource.f_Pos_posEndOffset = dtb__536 } -> ((Base_dCommon.v_step (((((v_parseDecls recover) (Frontend_dParser_dSupport.v_stateFuel st2)) st2) dtb__534) v_emptyDeclAcc)) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__537; B_dData_dPair.f_Pair_second = dtb__538 } -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__539; f_DeclAcc_declAccDecls = dtb__540; f_DeclAcc_declAccExports = dtb__541; f_DeclAcc_declAccOpacity = dtb__542 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__537) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__531; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__539; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__540; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__541; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__532; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__542 }; B_dData_dPair.f_Pair_second = dtb__537 }; B_dData_dPair.f_Pair_second = dtb__538 })) else ((v_ps0 dtb__537) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 28 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceWithComments = (fun (file : string) (source : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__543) -> (match dtb__543 with
  | { B_dData_dPair.f_Pair_first = dtb__544; B_dData_dPair.f_Pair_second = dtb__545 } -> (match ((v_parseSourceFile false) (((Frontend_dParser_dSupport.v_mkState file) dtb__544) Frontend_dParser_dSupport.C_ParseMode_PmTool)) with
  | Base_dDiag.C_Check_ErrC (dtb__546) -> (Base_dDiag.C_Check_ErrC (dtb__546))
  | Base_dDiag.C_Check_OkC (dtb__547) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__547)); B_dData_dPair.f_Pair_second = dtb__545 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__548) -> (Base_dDiag.C_Check_ErrC (dtb__548))
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dLexer.v_lexSourceWithComments source)))

# 37 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSource = (fun (file : string) (source : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__549) -> (match dtb__549 with
  | { B_dData_dPair.f_Pair_first = dtb__550; B_dData_dPair.f_Pair_second = dtb__551 } -> (Base_dDiag.C_Check_OkC (dtb__550))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__552) -> (Base_dDiag.C_Check_ErrC (dtb__552))
  | _ -> failwith "DT: impossible branch"
)) ((v_parseSourceWithComments file) source)))

# 2397 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecoveringTokens = (fun (file : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_parseSourceFile true) (((Frontend_dParser_dSupport.v_mkState file) toks) mode))) (fun (p : ((Frontend_dAst.t_SourceFile, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))

# 2389 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecovering = (fun (file : string) (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (((v_parseSourceRecoveringTokens file) Frontend_dParser_dSupport.C_ParseMode_PmStrict) toks))))
