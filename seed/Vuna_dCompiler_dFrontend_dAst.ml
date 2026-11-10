open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dAst_dField = { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName : string; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod = { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitParam = { f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind : t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild of (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dInterpPart = C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText of (string) | C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole of (t_Vuna_dCompiler_dFrontend_dAst_dExpr)
and t_Vuna_dCompiler_dFrontend_dAst_dQty = C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1
and t_Vuna_dCompiler_dFrontend_dAst_dReprTier = C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprTransparent | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprOpaque
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam of (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun of ((t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp of (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dInterpPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl = { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp : string; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dDoStmt = C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dCtor = { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName : string; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity : int; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dDecl = C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dField Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitParam Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance of (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportItem = C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dModDecl = { f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName : string; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList : bool; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems : t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dSourceFile = { f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl : t_Vuna_dCompiler_dFrontend_dAst_dModDecl Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports : t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities : t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dFrontend_dAst_dImport = { f_Vuna_dCompiler_dFrontend_dAst_dImport_importName : string; f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified : bool; f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan }

let v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> false
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dreprPrefix = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprOpaque -> "opaque "
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprTransparent -> "transparent "
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp = dtb__0; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel = dtb__1; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc = dtb__2; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget = dtb__3; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan = dtb__4 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dpatSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__5, dtb__6, dtb__7) -> dtb__7
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__8, dtb__9) -> dtb__9
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__10, dtb__11) -> dtb__11
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__12, dtb__13, dtb__14) -> dtb__14
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__15) -> dtb__15
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__16, dtb__17, dtb__18) -> dtb__18
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__19, dtb__20) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__21, dtb__22, dtb__23) -> dtb__23
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__24, dtb__25, dtb__26) -> dtb__26
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__27, dtb__28) -> dtb__28
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__29, dtb__30, dtb__31) -> dtb__31
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__32, dtb__33, dtb__34) -> dtb__34
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__35, dtb__36, dtb__37) -> dtb__37
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__41
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__42, dtb__43, dtb__44) -> dtb__44
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__45, dtb__46) -> dtb__46
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__50
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> dtb__56
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__57, dtb__58, dtb__59) -> dtb__59
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__60, dtb__61, dtb__62) -> dtb__62
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__63, dtb__64) -> dtb__64
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__65, dtb__66) -> dtb__66
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__67, dtb__68) -> dtb__68
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__69, dtb__70, dtb__71) -> dtb__71
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__72, dtb__73, dtb__74) -> dtb__74
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__75, dtb__76) -> dtb__76
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__80
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__81, dtb__82) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__86
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, dtb__88) -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__89, dtb__90) -> dtb__90
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__91, dtb__92, dtb__93) -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__94, dtb__95) -> dtb__94
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__96, dtb__97, dtb__98) -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__102
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__103, dtb__104, dtb__105, dtb__106) -> dtb__106
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__114
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__118
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__123, dtb__124, dtb__125, dtb__126) -> dtb__126
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__127, dtb__128, dtb__129) -> dtb__129
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__138
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__139; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__140; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__141; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__142 } -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__143; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__144; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__145 } -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__146; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__147; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__148 } -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__149; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__150; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__151 } -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__152; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__153; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__154 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__155; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__156; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__157 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__158, dtb__159) -> dtb__159
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__160, dtb__161) -> dtb__161
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__162, dtb__163) -> dtb__163
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__164 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__166, dtb__167, dtb__168, dtb__169) -> (if (dtb__166 = mc1) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__167; Base_dPair.f_Base_dPair_dPair_second = dtb__168 }, ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__165) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__165) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__165) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name))

let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name decls -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (match dtb__170 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = dtb__173 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__172)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)))

let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__174; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__175; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__176; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__177 } -> dtb__174
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorShortName = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__178; Base_dPair.f_Base_dPair_dPair_second = dtb__179 } -> (match dtb__178 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__179
  | _ -> (match (Base_dList.v_Base_dList_dreverse dtb__178) with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__179
  | Base_dList.C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (String.concat "" [dtb__180; "."; dtb__179])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__182; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__183; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__184; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__185 } -> dtb__183
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__186, dtb__187, dtb__188) -> (match dtb__186 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__189, dtb__190) -> (if (dtb__189 = "->") then (match dtb__187 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (match dtb__192 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> (match dtb__194 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__193))
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

let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__195) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__195).f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity)) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__196))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__197, dtb__198) -> (match dtb__197 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__202) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__208) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__208))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__198)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (if (mc0 = dtb__209) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__211))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__198))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__198)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__217, dtb__218, dtb__219, dtb__220) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__221, dtb__222, dtb__223, dtb__224) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__223)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> (Base_dList.C_Base_dList_dList_Cons (dtb__225, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__236)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__242, dtb__243, dtb__244, dtb__245) -> (Base_dList.C_Base_dList_dList_Cons (dtb__242, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__246, dtb__247, dtb__248, dtb__249) -> (Base_dList.C_Base_dList_dList_Cons (dtb__246, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__250, dtb__251, dtb__252) -> (Base_dList.C_Base_dList_dList_Cons (dtb__250, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__253, dtb__254, dtb__255, dtb__256) -> (Base_dList.C_Base_dList_dList_Cons (dtb__253, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__257, dtb__258, dtb__259, dtb__260) -> (Base_dList.C_Base_dList_dList_Cons (dtb__257, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__259)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266, dtb__267, dtb__268) -> (Base_dList.C_Base_dList_dList_Cons (dtb__261, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (Base_dList.C_Base_dList_dList_Cons (dtb__269, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__272)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__278, dtb__279, dtb__280, dtb__281) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__280)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__282, dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289) -> (Base_dList.C_Base_dList_dList_Cons (dtb__282, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__293)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__299, dtb__300, dtb__301, dtb__302) -> (Base_dList.C_Base_dList_dList_Cons (dtb__299, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__303, dtb__304, dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> (Base_dList.C_Base_dList_dList_Cons (dtb__303, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317, dtb__318, dtb__319) -> (Base_dList.C_Base_dList_dList_Cons (dtb__311, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> dtb__323
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> dtb__332
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dholeNamed = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__337, dtb__338) -> (if (dtb__337 = 63) then (match dtb__338 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__339, dtb__340) -> true
  | _ -> false
) else false)
  | _ -> false
)) (Base_dList.dtp_unpack name)))

let v_Vuna_dCompiler_dFrontend_dAst_disHoleName = (fun name -> (if (name = "_") then true else (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name)))

let v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name) then name else ""))

let v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix = "@vuna@"

let v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix = "@vuna@ctor@"

let v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix) name))

let rec v_Vuna_dCompiler_dFrontend_dAst_ddropNChars = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__341, dtb__342) -> ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (n - 1)) dtb__342)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix = (fun p name -> (if ((Base_dString.v_Base_dString_dstartsWith p) name) then (Base_dList.dtp_pack ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (bi_strLength p)) (Base_dList.dtp_unpack name))) else name))

let rec v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__343, dtb__344) -> (match dtb__344 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__343
  | _ -> (String.concat "" [dtb__343; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt dtb__344)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_doverCtorName = (fun short targets -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)]))

let v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort = (fun name -> (match ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | Base_dList.C_Base_dList_dList_Cons (dtb__345, dtb__346) -> dtb__345
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets = (fun name -> (match ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__347, dtb__348) -> dtb__348
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name))

let v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax = "@vuna@list@nil"

let v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax = "@vuna@list@cons"

let v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax))

let v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax))

let v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax = "@vuna@perform"

let v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax))

let v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax = "@vuna@row@at"

let v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax))

let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix = "@vuna@do@bind@"

let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix = "@vuna@do@ignore@"

let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName = (fun canonical -> (v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix ^ canonical))

let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName = (fun canonical -> (v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix ^ canonical))

let v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))

let v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))

let v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName name) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))) else (if (v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName name) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
