open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dRast_dField = { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName : string; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType : t_Vuna_dCompiler_dFrontend_dRast_dExpr; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dRast_dTraitMethod = { f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName : string; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType : t_Vuna_dCompiler_dFrontend_dRast_dExpr; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dRast_dTraitParam = { f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamName : string; f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamKind : t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dRast_dPat = C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dPat) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild of (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon of (Vuna_dCompiler_dFrontend_dRast_dName.t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) * (t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt of (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord of (Vuna_dCompiler_dFrontend_dRast_dName.t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) * ((string, t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dRast_dInterpPart = C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText of (string) | C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole of (t_Vuna_dCompiler_dFrontend_dRast_dExpr)
and t_Vuna_dCompiler_dFrontend_dRast_dExpr = C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar of (Vuna_dCompiler_dFrontend_dRast_dName.t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt of (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam of ((string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi of (string) * (bool) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet of ((t_Vuna_dCompiler_dFrontend_dRast_dPat, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun of ((t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * ((t_Vuna_dCompiler_dFrontend_dRast_dPat, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord of (Vuna_dCompiler_dFrontend_dRast_dName.t_Vuna_dCompiler_dFrontend_dRast_dName_dRName) * ((string, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo of (t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp of (bool) * (t_Vuna_dCompiler_dFrontend_dRast_dInterpPart Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dRast_dDoStmt = C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind of (t_Vuna_dCompiler_dFrontend_dRast_dPat) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr of (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dRast_dCtor = { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName : string; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType : t_Vuna_dCompiler_dFrontend_dRast_dExpr; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity : int; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dRast_dDecl = C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData of (string) * (string Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dCtor Base_dData_dList.t_Base_dData_dList_dList) * (string Base_dData_dList.t_Base_dData_dList_dList) * (bool) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord of (string) * (string Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dField Base_dData_dList.t_Base_dData_dList_dList) * (string Base_dData_dList.t_Base_dData_dList_dList) * (bool) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait of (string) * (t_Vuna_dCompiler_dFrontend_dRast_dTraitParam Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dTraitMethod Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance of (t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dRast_dExpr) * (t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dRast_dSourceFile = { f_Vuna_dCompiler_dFrontend_dRast_dSourceFile_sourceFileModDecl : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dModDecl Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dRast_dSourceFile_sourceFileImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dRast_dSourceFile_sourceFileFixities : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dRast_dSourceFile_sourceFileDecls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dRast_dSourceFile_sourceFileExports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExportSpec Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dRast_dSourceFile_sourceFileReexports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dRast_dSourceFile_sourceFileOpacity : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec Base_dData_dList.t_Base_dData_dList_dList }

# 141 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dpatSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__0, dtb__1, dtb__2) -> dtb__2
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__3, dtb__4) -> dtb__4
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__5, dtb__6) -> dtb__6
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__7, dtb__8, dtb__9) -> dtb__9
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__10) -> dtb__10
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__11, dtb__12, dtb__13) -> dtb__13
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__14, dtb__15) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dexprSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__16, dtb__17, dtb__18) -> dtb__18
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__19, dtb__20, dtb__21) -> dtb__21
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__22, dtb__23) -> dtb__23
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__24, dtb__25, dtb__26) -> dtb__26
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__27, dtb__28, dtb__29) -> dtb__29
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__30, dtb__31, dtb__32) -> dtb__32
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__33, dtb__34, dtb__35, dtb__36) -> dtb__36
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__37, dtb__38, dtb__39) -> dtb__39
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__40, dtb__41) -> dtb__41
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__42, dtb__43, dtb__44, dtb__45) -> dtb__45
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__52, dtb__53, dtb__54) -> dtb__54
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__55, dtb__56, dtb__57) -> dtb__57
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat (dtb__58, dtb__59) -> dtb__59
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__60, dtb__61) -> dtb__61
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__62, dtb__63) -> dtb__63
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (dtb__64, dtb__65, dtb__66) -> dtb__66
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__67, dtb__68, dtb__69) -> dtb__69
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp (dtb__70, dtb__71) -> dtb__71
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__72, dtb__73, dtb__74, dtb__75) -> dtb__75
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (dtb__76, dtb__77) -> (v_Vuna_dCompiler_dFrontend_dRast_dexprSpan dtb__76)
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__78, dtb__79, dtb__80, dtb__81) -> dtb__81
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__82, dtb__83) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dpatWeight = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__84, dtb__85, dtb__86) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dpatWeightFields dtb__85))
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__87, dtb__88) -> 1
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__89, dtb__90) -> 1
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__91, dtb__92, dtb__93) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dpatWeightList dtb__92))
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__94) -> 1
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__95, dtb__96, dtb__97) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dpatWeight dtb__96))
  | C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__98, dtb__99) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 189 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dpatWeightList = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__100, dtb__101) -> ((v_Vuna_dCompiler_dFrontend_dRast_dpatWeight dtb__100) + (v_Vuna_dCompiler_dFrontend_dRast_dpatWeightList dtb__101))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 193 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dpatWeightFields = (fun (mc0 : (string, t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, dtb__103) -> ((v_Vuna_dCompiler_dFrontend_dRast_dpatWeight (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__102)) + (v_Vuna_dCompiler_dFrontend_dRast_dpatWeightFields dtb__103))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dexprWeight = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__104, dtb__105, dtb__106) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dinterpWeight dtb__105))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__107, dtb__108, dtb__109) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__107)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__108))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__110, dtb__111) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_ddoStmtWeight dtb__110))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__112, dtb__113, dtb__114) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__112)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeightFields dtb__113))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__115, dtb__116, dtb__117) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeightFields dtb__116))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__118, dtb__119, dtb__120) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__118))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__121, dtb__122, dtb__123, dtb__124) -> (((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__121)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__122)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__123))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__125, dtb__126, dtb__127) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__125)) + (v_Vuna_dCompiler_dFrontend_dRast_dpatExprWeight dtb__126))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__128, dtb__129) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dclauseWeight dtb__128))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__130, dtb__131, dtb__132, dtb__133) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dpatExprWeight dtb__130)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__131))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__137)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__138))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__140, dtb__141, dtb__142) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__140)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeightList dtb__141))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__143, dtb__144, dtb__145) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__144))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (dtb__146, dtb__147, dtb__148) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__146))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__149, dtb__150, dtb__151) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__150))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp (dtb__152, dtb__153) -> 1
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__154, dtb__155, dtb__156, dtb__157) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__155)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__156))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (dtb__158, dtb__159) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__158))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__160, dtb__161, dtb__162, dtb__163) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__161)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__162))
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat (dtb__164, dtb__165) -> 1
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__166, dtb__167) -> 1
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__168, dtb__169) -> 1
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__170, dtb__171) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 224 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dexprWeightList = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__172, dtb__173) -> ((v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__172) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeightList dtb__173))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 228 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dpatExprWeight = (fun (mc0 : (t_Vuna_dCompiler_dFrontend_dRast_dPat, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__174, dtb__175) -> (((v_Vuna_dCompiler_dFrontend_dRast_dpatWeight (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__174)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__174))) + (v_Vuna_dCompiler_dFrontend_dRast_dpatExprWeight dtb__175))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 232 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dclauseWeight = (fun (mc0 : (t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__176, dtb__177) -> (((v_Vuna_dCompiler_dFrontend_dRast_dpatWeightList (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__176)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__176))) + (v_Vuna_dCompiler_dFrontend_dRast_dclauseWeight dtb__177))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 236 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dexprWeightFields = (fun (mc0 : (string, t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> ((v_Vuna_dCompiler_dFrontend_dRast_dexprWeight (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__178)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeightFields dtb__179))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 240 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_ddoStmtWeight = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, dtb__181) -> ((v_Vuna_dCompiler_dFrontend_dRast_doneDoStmtWeight dtb__180) + (v_Vuna_dCompiler_dFrontend_dRast_ddoStmtWeight dtb__181))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 244 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_doneDoStmtWeight = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__182, dtb__183) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__182))
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__184, dtb__185, dtb__186) -> ((1 + (v_Vuna_dCompiler_dFrontend_dRast_dpatWeight dtb__184)) + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__185))
  | _ -> failwith "DT: impossible branch"
))
# 248 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dinterpWeight = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dInterpPart Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__188) -> ((v_Vuna_dCompiler_dFrontend_dRast_doneInterpWeight dtb__187) + (v_Vuna_dCompiler_dFrontend_dRast_dinterpWeight dtb__188))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 252 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_doneInterpWeight = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dInterpPart) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole (dtb__189) -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight dtb__189))
  | C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__190) -> 1
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dexprBudget = (fun (base : int) (e : t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (base + (8 * (v_Vuna_dCompiler_dFrontend_dRast_dexprWeight e))))

# 261 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dpatBudget = (fun (base : int) (p : t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (base + (8 * (v_Vuna_dCompiler_dFrontend_dRast_dpatWeight p))))

# 264 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoStmtSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__191, dtb__192) -> dtb__192
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__193, dtb__194, dtb__195) -> dtb__195
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoStmtExpr = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__196, dtb__197) -> dtb__196
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__198, dtb__199, dtb__200) -> dtb__199
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__201, dtb__202, dtb__203, dtb__204) -> dtb__204
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__209
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> dtb__217
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__218, dtb__219, dtb__220, dtb__221) -> dtb__221
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__222, dtb__223, dtb__224, dtb__225) -> dtb__225
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__226, dtb__227, dtb__228, dtb__229) -> dtb__229
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__230, dtb__231, dtb__232) -> dtb__232
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241) -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__242; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__243; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__244; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__245 } -> dtb__245
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfieldSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__246; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = dtb__247; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__248 } -> dtb__248
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfieldName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__249; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = dtb__250; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__251 } -> dtb__249
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfieldType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__252; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = dtb__253; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__254 } -> dtb__253
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName = dtb__255; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType = dtb__256; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan = dtb__257 } -> dtb__255
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName = dtb__258; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType = dtb__259; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan = dtb__260 } -> dtb__260
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dexportItemSpan = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExportItem) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__261, dtb__262, dtb__263) -> dtb__263
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__264, dtb__265) -> dtb__265
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__266, dtb__267, dtb__268) -> dtb__268
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__269, dtb__270) -> dtb__270
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__271, dtb__272) -> dtb__272
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__273, dtb__274) -> (match dtb__273 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__275, dtb__276, dtb__277, dtb__278) -> (if (dtb__275 = mc1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__276; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__277 }, ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses dtb__274) mc1))) else ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses dtb__274) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses dtb__274) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dclausesFor = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses decls) name))

# 318 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfunArity = (fun (name : string) (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__279, dtb__280) -> (match dtb__279 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__281; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__282 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__281)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dRast_dclausesFor decls) name)))

# 324 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__283; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__284; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__285; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__286 } -> dtb__283
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorShortName = (fun (name : string) -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 336 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__287; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__288 } -> (match dtb__287 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__288
  | _ -> (match (Base_dData_dList.v_Base_dData_dList_dreverse dtb__287) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__288
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__289, dtb__290) -> (String.concat "" [dtb__289; "."; dtb__288])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 345 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__291; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__292; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__293; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__294 } -> dtb__292
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dtypeArity = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__295, dtb__296, dtb__297) -> (match dtb__295 with
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__298, dtb__299) -> (match dtb__298 with
  | Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__300) -> (if (dtb__300 = "->") then (match dtb__296 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__301, dtb__302) -> (match dtb__302 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__303, dtb__304) -> (match dtb__304 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dtypeArity dtb__303))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
))

# 352 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dlookupCtorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dRast_dCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, dtb__306) -> (if ((v_Vuna_dCompiler_dFrontend_dRast_dctorName dtb__305) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__305).f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity)) else ((v_Vuna_dCompiler_dFrontend_dRast_dlookupCtorArity mc0) dtb__306))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dctorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__307, dtb__308) -> (match dtb__307 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317) -> (match ((v_Vuna_dCompiler_dFrontend_dRast_dlookupCtorArity mc0) dtb__312) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__318) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__318))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dRast_dctorArity mc0) dtb__308)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> (if (mc0 = dtb__319) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__321))) else ((v_Vuna_dCompiler_dFrontend_dRast_dctorArity mc0) dtb__308))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dRast_dctorArity mc0) dtb__308)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__327, dtb__328, dtb__329, dtb__330) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName) dtb__334)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__336, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dctorName) dtb__347)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__353, dtb__354, dtb__355, dtb__356) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__353, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__357, dtb__358, dtb__359, dtb__360) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__357, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__361, dtb__362, dtb__363) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__361, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__364, dtb__365, dtb__366, dtb__367) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__364, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtopNames = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_ddeclNames) decls))

# 385 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclAllNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__368, dtb__369, dtb__370, dtb__371, dtb__372) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__368, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName) dtb__371)))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__373, dtb__374, dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__373, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__381, dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__381, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dctorName) dtb__384)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dRast_ddeclNames mc0)
))

# 392 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_d_udeclCtors = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName) dtb__393)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401, dtb__402) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__395, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410, dtb__411) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dctorName) dtb__406)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 398 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorsOf = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_d_udeclCtors) decls))

# 401 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclTypeNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__412, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__417, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__425, dtb__426, dtb__427, dtb__428, dtb__429, dtb__430, dtb__431, dtb__432, dtb__433) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__425, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 407 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtypeNamesOf = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_ddeclTypeNames) decls))

# 410 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclDerivings = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441) -> dtb__437
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, dtb__450) -> dtb__446
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 424 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dholeNamed = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__451, dtb__452) -> (if (dtb__451 = 63) then (match dtb__452 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__453, dtb__454) -> true
  | _ -> false
) else false)
  | _ -> false
)) (Base_dData_dList.dtp_unpack name)))

# 421 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disHoleName = (fun (name : string) -> (if (name = "_") then true else (v_Vuna_dCompiler_dFrontend_dRast_dholeNamed name)))

# 431 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dholeNameOf = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dRast_dholeNamed name) then name else ""))

# 441 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dinternalNamePrefix = "@vuna@"

# 445 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix = "@vuna@ctor@"

# 449 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disInternalSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_dinternalNamePrefix) name))

# 453 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_ddropNChars = (fun (n : int) (xs : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__455, dtb__456) -> ((v_Vuna_dCompiler_dFrontend_dRast_ddropNChars (n - 1)) dtb__456)
  | _ -> failwith "DT: impossible branch"
)))

# 463 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix = (fun (p : string) (name : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith p) name) then (Base_dData_dList.dtp_pack ((v_Vuna_dCompiler_dFrontend_dRast_ddropNChars (bi_strLength p)) (Base_dData_dList.dtp_unpack name))) else name))

# 468 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__457, dtb__458) -> (match dtb__458 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__457
  | _ -> (String.concat "" [dtb__457; "@"; (v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt dtb__458)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorName = (fun (short : string) (targets : string Base_dData_dList.t_Base_dData_dList_dList) -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt targets)]))

# 478 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorShort = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__459, dtb__460) -> dtb__459
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorTargets = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__461, dtb__462) -> dtb__462
  | _ -> failwith "DT: impossible branch"
))

# 492 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disOverCtorName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix) name))

# 496 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix = "@vuna@value@"

# 499 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValueName = (fun (short : string) (targets : string Base_dData_dList.t_Base_dData_dList_dList) -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt targets)]))

# 502 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValueShort = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__463, dtb__464) -> dtb__463
  | _ -> failwith "DT: impossible branch"
))

# 508 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValueTargets = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__465, dtb__466) -> dtb__466
  | _ -> failwith "DT: impossible branch"
))

# 514 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disOverValueName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix) name))

# 520 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dlistNilSyntax = "@vuna@list@nil"

# 524 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dlistConsSyntax = "@vuna@list@cons"

# 528 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disListNilSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dlistNilSyntax))

# 532 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disListConsSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dlistConsSyntax))

# 554 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dperformSyntax = "@vuna@perform"

# 558 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disPerformSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dperformSyntax))

# 570 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dhandleSyntax = "@vuna@handle"

# 574 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disHandleSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dhandleSyntax))

# 578 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dhandleNoRetSyntax = "@vuna@handle@noret"

# 582 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disHandleNoRetSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dhandleNoRetSyntax))

# 588 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_drowAtSyntax = "@vuna@row@at"

# 592 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disRowAtSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_drowAtSyntax))

# 599 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dappAtSyntax = "@vuna@app@at"

# 603 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disAppAtSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dappAtSyntax))

# 608 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dinstArgSyntax = "@vuna@inst@arg"

# 612 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disInstArgSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dinstArgSyntax))

# 624 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix = "@vuna@macro@"

# 628 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxName = (fun (name : string) -> (v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix ^ name))

# 632 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disMacroSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix) name))

# 636 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dmacroNameOf = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dRast_disMacroSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 641 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix = "@vuna@do@bind@"

# 645 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 649 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxName = (fun (canonical : string) -> (v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix ^ canonical))

# 653 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxName = (fun (canonical : string) -> (v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix ^ canonical))

# 657 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disDoBindSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix) name))

# 661 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disDoIgnoreSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix) name))

# 666 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoSyntaxCanonical = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dRast_disDoBindSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix) name))) else (if (v_Vuna_dCompiler_dFrontend_dRast_disDoIgnoreSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 682 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dnameOf = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) scope) then (Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RLocal (name)) else (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName name)))

# 735 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dofPat = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (p : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) -> (match p with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__467, dtb__468) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__467, dtb__468))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__469, dtb__470, dtb__471) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__469, ((v_Vuna_dCompiler_dFrontend_dRast_dofPat scope) dtb__470), dtb__471))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__472) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__472))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__473, dtb__474, dtb__475) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__473), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPat scope)) dtb__474), dtb__475))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__476, dtb__477) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__476, dtb__477))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__478, dtb__479) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__478, dtb__479))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__480, dtb__481, dtb__482) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__480), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPatField scope)) dtb__481), dtb__482))
  | _ -> failwith "DT: impossible branch"
))
# 746 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofPatField = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__483; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__484 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__483; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofPat mc0) dtb__484) }
  | _ -> failwith "DT: impossible branch"
))

# 750 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dpatBinders = (fun (p : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) -> (match p with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__485, dtb__486) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__485, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__487, dtb__488, dtb__489) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__487, (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__488)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__490) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__491, dtb__492, dtb__493) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dpatBinders) dtb__492)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__494, dtb__495) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__496, dtb__497) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__498, dtb__499, dtb__500) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dpatFieldBinders) dtb__499)
  | _ -> failwith "DT: impossible branch"
))
# 832 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dpatFieldBinders = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__501; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__502 } -> (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__502)
  | _ -> failwith "DT: impossible branch"
))

# 761 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dbindersOfPats = (fun (pats : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dpatBinders) pats))

# 835 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dbindingBinders = (fun (mc0 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__503; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__504 } -> (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__503)
  | _ -> failwith "DT: impossible branch"
))

# 765 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dofExpr = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__505, dtb__506) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__505), dtb__506))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__507, dtb__508) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__507, dtb__508))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__509, dtb__510) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__509, dtb__510))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__511, dtb__512) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat (dtb__511, dtb__512))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__513, dtb__514, dtb__515) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__513, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofInterpPart scope)) dtb__514), dtb__515))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__516, dtb__517, dtb__518) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__516, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__516)) scope)) dtb__517), dtb__518))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__519, dtb__520, dtb__521) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__519), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope)) dtb__520), dtb__521))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__522, dtb__523, dtb__524, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__525), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__522, scope))) dtb__526), dtb__527))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__528, dtb__529, dtb__530, dtb__531) -> ((fun bound -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dFrontend_dRast_dofBinding bound) scope)) dtb__528), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr bound) dtb__529), dtb__530, dtb__531))) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dbindingBinders) dtb__528)) scope))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__532, dtb__533) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofLocalClause scope)) dtb__532), dtb__533))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__534, dtb__535, dtb__536) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__534), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofAlt scope)) dtb__535), dtb__536))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__537, dtb__538, dtb__539, dtb__540) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__537), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__538), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__539), dtb__540))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__541, dtb__542, dtb__543) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__541), dtb__542, dtb__543))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__544, dtb__545, dtb__546) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__544), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofFieldValue scope)) dtb__545), dtb__546))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__547, dtb__548, dtb__549) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__547), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofFieldValue scope)) dtb__548), dtb__549))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__550, dtb__551) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (((v_Vuna_dCompiler_dFrontend_dRast_dofStmts scope) dtb__550), dtb__551))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__552, dtb__553, dtb__554, dtb__555) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__552, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__553), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__554), dtb__555))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__556, dtb__557) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__556), dtb__557))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__558, dtb__559, dtb__560, dtb__561) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__558, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__559), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__560), dtb__561))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__562, dtb__563) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp (dtb__562, dtb__563))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__564, dtb__565, dtb__566) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__564, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__565), dtb__566))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__567, dtb__568, dtb__569) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__567), dtb__568, dtb__569))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__570, dtb__571, dtb__572) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__570), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__571), dtb__572))
  | _ -> failwith "DT: impossible branch"
))
# 799 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofBinding = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__573; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__574 } -> ((fun valueScope -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dRast_dofPat mc1) dtb__573); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr valueScope) dtb__574) }) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__573)) mc0))
  | _ -> failwith "DT: impossible branch"
))
# 805 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofLocalClause = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__575; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__576 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPat mc0)) dtb__575); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dbindersOfPats dtb__575)) mc0)) dtb__576) }
  | _ -> failwith "DT: impossible branch"
))
# 809 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofAlt = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__577; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__578 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dRast_dofPat mc0) dtb__577); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__577)) mc0)) dtb__578) }
  | _ -> failwith "DT: impossible branch"
))
# 812 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofFieldValue = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__579; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__580 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__579; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__580) }
  | _ -> failwith "DT: impossible branch"
))
# 815 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofInterpPart = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (part : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dInterpPart) -> (match part with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__581) -> (C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__581))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__582) -> (C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__582)))
  | _ -> failwith "DT: impossible branch"
))
# 821 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofStmts = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (stmts : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) -> (match stmts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__583, dtb__584) -> (match dtb__583 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__585, dtb__586, dtb__587) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (((v_Vuna_dCompiler_dFrontend_dRast_dofPat scope) dtb__585), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__586), dtb__587)), ((v_Vuna_dCompiler_dFrontend_dRast_dofStmts ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__585)) scope)) dtb__584)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__588, dtb__589) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__588), dtb__589)), ((v_Vuna_dCompiler_dFrontend_dRast_dofStmts scope) dtb__584)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 725 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofCtor = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__590; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__591; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__592; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__593 } -> { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__590; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__591); f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__592; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__593 }
  | _ -> failwith "DT: impossible branch"
))

# 728 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofField = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__594; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__595; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__596 } -> { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__594; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__595); f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__596 }
  | _ -> failwith "DT: impossible branch"
))

# 731 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofTraitMethod = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__597; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__598; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__599 } -> { f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName = dtb__597; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__598); f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan = dtb__599 }
  | _ -> failwith "DT: impossible branch"
))

# 838 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dastTraitParamName = (fun (p : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dTraitParam) -> (p).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName)

# 844 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofMaybeExpr = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__600) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__600)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 841 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofTraitParam = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dTraitParam) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__601; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__602 } -> { f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamName = dtb__601; f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamKind = ((v_Vuna_dCompiler_dFrontend_dRast_dofMaybeExpr mc0) dtb__602) }
  | _ -> failwith "DT: impossible branch"
))

# 690 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dofDecl = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (d : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__603, dtb__604, dtb__605, dtb__606, dtb__607, dtb__608, dtb__609, dtb__610, dtb__611) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__603, dtb__604, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend dtb__604) scope)) dtb__605), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofCtor ((Base_dData_dList.v_Base_dData_dList_dappend dtb__604) scope))) dtb__606), dtb__607, dtb__608, dtb__609, dtb__610, dtb__611))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__612, dtb__613, dtb__614) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__612, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__613), dtb__614))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__615, dtb__616, dtb__617, dtb__618) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__615, dtb__616, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__617), dtb__618))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__619, dtb__620, dtb__621, dtb__622) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__619, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope)) dtb__620), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__621), dtb__622))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__623, dtb__624, dtb__625, dtb__626) -> ((fun bound -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__623, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPat scope)) dtb__624), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr bound) dtb__625), dtb__626))) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dbindersOfPats dtb__624)) scope))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__627, dtb__628, dtb__629, dtb__630, dtb__631, dtb__632, dtb__633, dtb__634) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__627, dtb__628, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofField ((Base_dData_dList.v_Base_dData_dList_dappend dtb__628) scope))) dtb__629), dtb__630, dtb__631, dtb__632, dtb__633, dtb__634))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__635, dtb__636, dtb__637, dtb__638, dtb__639) -> ((fun bound -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__635, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofTraitParam bound)) dtb__636), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr bound)) dtb__637), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofTraitMethod bound)) dtb__638), dtb__639))) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dastTraitParamName) dtb__636)) scope))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__640, dtb__641, dtb__642, dtb__643) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope)) dtb__640), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__641), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofDecl scope)) dtb__642), dtb__643))
  | _ -> failwith "DT: impossible branch"
))

# 686 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofDecls = (fun (decls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofDecl Base_dData_dList.C_Base_dData_dList_dList_Nil)) decls))
