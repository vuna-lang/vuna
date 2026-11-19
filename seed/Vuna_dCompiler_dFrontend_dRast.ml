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

# 175 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoStmtSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__84, dtb__85) -> dtb__85
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__86, dtb__87, dtb__88) -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoStmtExpr = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__89, dtb__90) -> dtb__89
  | C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__91, dtb__92, dtb__93) -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__97
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__102
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__110
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__114
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__118
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__123, dtb__124, dtb__125) -> dtb__125
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__134
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__135; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__136; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__137; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__138 } -> dtb__138
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfieldSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__139; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = dtb__140; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__141 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfieldName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__142; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = dtb__143; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__144 } -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfieldType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__145; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = dtb__146; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__147 } -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName = dtb__148; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType = dtb__149; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan = dtb__150 } -> dtb__148
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName = dtb__151; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType = dtb__152; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan = dtb__153 } -> dtb__153
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dexportItemSpan = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExportItem) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__154, dtb__155, dtb__156) -> dtb__156
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__157, dtb__158) -> dtb__158
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__159, dtb__160, dtb__161) -> dtb__161
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__162, dtb__163) -> dtb__163
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__164, dtb__165) -> dtb__165
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (match dtb__166 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__168, dtb__169, dtb__170, dtb__171) -> (if (dtb__168 = mc1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__169; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__170 }, ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses dtb__167) mc1))) else ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses dtb__167) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses dtb__167) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dclausesFor = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> ((v_Vuna_dCompiler_dFrontend_dRast_dcollectClauses decls) name))

# 229 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dfunArity = (fun (name : string) (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__172, dtb__173) -> (match dtb__172 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__174; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__175 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__174)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dRast_dclausesFor decls) name)))

# 235 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__176; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__177; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__178; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__179 } -> dtb__176
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorShortName = (fun (name : string) -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 247 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorDisplayName = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__180; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__181 } -> (match dtb__180 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__181
  | _ -> (match (Base_dData_dList.v_Base_dData_dList_dreverse dtb__180) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__181
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__182, dtb__183) -> (String.concat "" [dtb__182; "."; dtb__181])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 256 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__184; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__185; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__186; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__187 } -> dtb__185
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dtypeArity = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__188, dtb__189, dtb__190) -> (match dtb__188 with
  | C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__191, dtb__192) -> (match dtb__191 with
  | Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__193) -> (if (dtb__193 = "->") then (match dtb__189 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, dtb__195) -> (match dtb__195 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (match dtb__197 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dRast_dtypeArity dtb__196))
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

# 263 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dlookupCtorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dRast_dCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (if ((v_Vuna_dCompiler_dFrontend_dRast_dctorName dtb__198) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__198).f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity)) else ((v_Vuna_dCompiler_dFrontend_dRast_dlookupCtorArity mc0) dtb__199))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dctorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__200, dtb__201) -> (match dtb__200 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> (match ((v_Vuna_dCompiler_dFrontend_dRast_dlookupCtorArity mc0) dtb__205) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__211) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__211))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dRast_dctorArity mc0) dtb__201)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> (if (mc0 = dtb__212) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__214))) else ((v_Vuna_dCompiler_dFrontend_dRast_dctorArity mc0) dtb__201))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dRast_dctorArity mc0) dtb__201)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__220, dtb__221, dtb__222, dtb__223) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName) dtb__227)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__229, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dctorName) dtb__240)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__246, dtb__247, dtb__248, dtb__249) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__250, dtb__251, dtb__252, dtb__253) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__254, dtb__255, dtb__256) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__254, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__257, dtb__258, dtb__259, dtb__260) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__257, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtopNames = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_ddeclNames) decls))

# 296 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclAllNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__261, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName) dtb__264)))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dctorName) dtb__277)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dRast_ddeclNames mc0)
))

# 303 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_d_udeclCtors = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dtraitMethodName) dtb__286)
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__288, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dctorName) dtb__299)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 309 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dctorsOf = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_d_udeclCtors) decls))

# 312 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclTypeNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__305, dtb__306, dtb__307, dtb__308, dtb__309) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__310, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__318, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 318 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dtypeNamesOf = (fun (decls : t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_ddeclTypeNames) decls))

# 321 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddeclDerivings = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dRast_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> dtb__330
  | C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> dtb__339
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 335 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dholeNamed = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__344, dtb__345) -> (if (dtb__344 = 63) then (match dtb__345 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__346, dtb__347) -> true
  | _ -> false
) else false)
  | _ -> false
)) (Base_dData_dList.dtp_unpack name)))

# 332 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disHoleName = (fun (name : string) -> (if (name = "_") then true else (v_Vuna_dCompiler_dFrontend_dRast_dholeNamed name)))

# 342 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dholeNameOf = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dRast_dholeNamed name) then name else ""))

# 352 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dinternalNamePrefix = "@vuna@"

# 356 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix = "@vuna@ctor@"

# 360 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disInternalSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_dinternalNamePrefix) name))

# 364 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_ddropNChars = (fun (n : int) (xs : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__348, dtb__349) -> ((v_Vuna_dCompiler_dFrontend_dRast_ddropNChars (n - 1)) dtb__349)
  | _ -> failwith "DT: impossible branch"
)))

# 374 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix = (fun (p : string) (name : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith p) name) then (Base_dData_dList.dtp_pack ((v_Vuna_dCompiler_dFrontend_dRast_ddropNChars (bi_strLength p)) (Base_dData_dList.dtp_unpack name))) else name))

# 379 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__350, dtb__351) -> (match dtb__351 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__350
  | _ -> (String.concat "" [dtb__350; "@"; (v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt dtb__351)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorName = (fun (short : string) (targets : string Base_dData_dList.t_Base_dData_dList_dList) -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt targets)]))

# 389 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorShort = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__352, dtb__353) -> dtb__352
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverCtorTargets = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__354, dtb__355) -> dtb__355
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disOverCtorName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_doverCtorPrefix) name))

# 407 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix = "@vuna@value@"

# 410 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValueName = (fun (short : string) (targets : string Base_dData_dList.t_Base_dData_dList_dList) -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dRast_djoinWithAt targets)]))

# 413 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValueShort = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__356, dtb__357) -> dtb__356
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_doverValueTargets = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__358, dtb__359) -> dtb__359
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disOverValueName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_doverValuePrefix) name))

# 431 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dlistNilSyntax = "@vuna@list@nil"

# 435 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dlistConsSyntax = "@vuna@list@cons"

# 439 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disListNilSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dlistNilSyntax))

# 443 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disListConsSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dlistConsSyntax))

# 465 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dperformSyntax = "@vuna@perform"

# 469 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disPerformSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dperformSyntax))

# 481 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dhandleSyntax = "@vuna@handle"

# 485 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disHandleSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dhandleSyntax))

# 489 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dhandleNoRetSyntax = "@vuna@handle@noret"

# 493 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disHandleNoRetSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dhandleNoRetSyntax))

# 499 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_drowAtSyntax = "@vuna@row@at"

# 503 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disRowAtSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_drowAtSyntax))

# 510 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dappAtSyntax = "@vuna@app@at"

# 514 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disAppAtSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dappAtSyntax))

# 519 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dinstArgSyntax = "@vuna@inst@arg"

# 523 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disInstArgSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dRast_dinstArgSyntax))

# 535 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix = "@vuna@macro@"

# 539 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxName = (fun (name : string) -> (v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix ^ name))

# 543 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disMacroSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix) name))

# 547 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dmacroNameOf = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dRast_disMacroSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_dmacroSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 552 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix = "@vuna@do@bind@"

# 556 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 560 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxName = (fun (canonical : string) -> (v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix ^ canonical))

# 564 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxName = (fun (canonical : string) -> (v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix ^ canonical))

# 568 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disDoBindSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix) name))

# 572 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_disDoIgnoreSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix) name))

# 577 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_ddoSyntaxCanonical = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dRast_disDoBindSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_ddoBindSyntaxPrefix) name))) else (if (v_Vuna_dCompiler_dFrontend_dRast_disDoIgnoreSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dRast_ddoIgnoreSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 593 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dnameOf = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) scope) then (Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RLocal (name)) else (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName name)))

# 646 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dofPat = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (p : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) -> (match p with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__360, dtb__361) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__360, dtb__361))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__362, dtb__363, dtb__364) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__362, ((v_Vuna_dCompiler_dFrontend_dRast_dofPat scope) dtb__363), dtb__364))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__365) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__365))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__366, dtb__367, dtb__368) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__366), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPat scope)) dtb__367), dtb__368))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__369, dtb__370) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__369, dtb__370))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__371, dtb__372) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__371, dtb__372))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__373, dtb__374, dtb__375) -> (C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__373), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPatField scope)) dtb__374), dtb__375))
  | _ -> failwith "DT: impossible branch"
))
# 657 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofPatField = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__376; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__377 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__376; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofPat mc0) dtb__377) }
  | _ -> failwith "DT: impossible branch"
))

# 661 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dpatBinders = (fun (p : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) -> (match p with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__378, dtb__379) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__378, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__380, dtb__381, dtb__382) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__380, (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__381)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__383) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__384, dtb__385, dtb__386) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dpatBinders) dtb__385)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__387, dtb__388) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__389, dtb__390) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__391, dtb__392, dtb__393) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dpatFieldBinders) dtb__392)
  | _ -> failwith "DT: impossible branch"
))
# 743 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dpatFieldBinders = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__394; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__395 } -> (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__395)
  | _ -> failwith "DT: impossible branch"
))

# 672 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dbindersOfPats = (fun (pats : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dpatBinders) pats))

# 746 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dbindingBinders = (fun (mc0 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__396; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__397 } -> (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__396)
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dofExpr = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (e : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__398, dtb__399) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__398), dtb__399))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__400, dtb__401) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__400, dtb__401))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__402, dtb__403) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__402, dtb__403))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__404, dtb__405) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat (dtb__404, dtb__405))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__406, dtb__407, dtb__408) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__406, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofInterpPart scope)) dtb__407), dtb__408))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__409, dtb__410, dtb__411) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__409, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__409)) scope)) dtb__410), dtb__411))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__412, dtb__413, dtb__414) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__412), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope)) dtb__413), dtb__414))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__415, dtb__416, dtb__417, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__418), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__415, scope))) dtb__419), dtb__420))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__421, dtb__422, dtb__423, dtb__424) -> ((fun bound -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dFrontend_dRast_dofBinding bound) scope)) dtb__421), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr bound) dtb__422), dtb__423, dtb__424))) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dRast_dbindingBinders) dtb__421)) scope))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__425, dtb__426) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofLocalClause scope)) dtb__425), dtb__426))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__427, dtb__428, dtb__429) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__427), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofAlt scope)) dtb__428), dtb__429))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__430, dtb__431, dtb__432, dtb__433) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__430), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__431), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__432), dtb__433))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__434, dtb__435, dtb__436) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__434), dtb__435, dtb__436))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__437, dtb__438, dtb__439) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (((v_Vuna_dCompiler_dFrontend_dRast_dnameOf scope) dtb__437), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofFieldValue scope)) dtb__438), dtb__439))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__440, dtb__441, dtb__442) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__440), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofFieldValue scope)) dtb__441), dtb__442))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__443, dtb__444) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (((v_Vuna_dCompiler_dFrontend_dRast_dofStmts scope) dtb__443), dtb__444))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__445, dtb__446, dtb__447, dtb__448) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__445, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__446), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__447), dtb__448))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__449, dtb__450) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__449), dtb__450))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__451, dtb__452, dtb__453, dtb__454) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__451, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__452), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__453), dtb__454))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__455, dtb__456) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp (dtb__455, dtb__456))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__457, dtb__458, dtb__459) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__457, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__458), dtb__459))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__460, dtb__461, dtb__462) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__460), dtb__461, dtb__462))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__463, dtb__464, dtb__465) -> (C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__463), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__464), dtb__465))
  | _ -> failwith "DT: impossible branch"
))
# 710 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofBinding = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__466; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__467 } -> ((fun valueScope -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dRast_dofPat mc1) dtb__466); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr valueScope) dtb__467) }) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__466)) mc0))
  | _ -> failwith "DT: impossible branch"
))
# 716 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofLocalClause = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__468; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__469 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPat mc0)) dtb__468); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dbindersOfPats dtb__468)) mc0)) dtb__469) }
  | _ -> failwith "DT: impossible branch"
))
# 720 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofAlt = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__470; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__471 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dRast_dofPat mc0) dtb__470); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__470)) mc0)) dtb__471) }
  | _ -> failwith "DT: impossible branch"
))
# 723 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofFieldValue = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__472; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__473 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__472; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__473) }
  | _ -> failwith "DT: impossible branch"
))
# 726 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofInterpPart = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (part : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dInterpPart) -> (match part with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__474) -> (C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__474))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__475) -> (C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__475)))
  | _ -> failwith "DT: impossible branch"
))
# 732 "Vuna/Compiler/Frontend/Rast.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dofStmts = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (stmts : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) -> (match stmts with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__476, dtb__477) -> (match dtb__476 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__478, dtb__479, dtb__480) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (((v_Vuna_dCompiler_dFrontend_dRast_dofPat scope) dtb__478), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__479), dtb__480)), ((v_Vuna_dCompiler_dFrontend_dRast_dofStmts ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dpatBinders dtb__478)) scope)) dtb__477)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__481, dtb__482) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__481), dtb__482)), ((v_Vuna_dCompiler_dFrontend_dRast_dofStmts scope) dtb__477)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofCtor = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__483; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__484; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__485; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__486 } -> { f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__483; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__484); f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__485; f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__486 }
  | _ -> failwith "DT: impossible branch"
))

# 639 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofField = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__487; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__488; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__489 } -> { f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__487; f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__488); f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__489 }
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofTraitMethod = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__490; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__491; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__492 } -> { f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName = dtb__490; f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType = ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__491); f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan = dtb__492 }
  | _ -> failwith "DT: impossible branch"
))

# 749 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dastTraitParamName = (fun (p : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dTraitParam) -> (p).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName)

# 755 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofMaybeExpr = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__493) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dRast_dofExpr mc0) dtb__493)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 752 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofTraitParam = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dTraitParam) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__494; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__495 } -> { f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamName = dtb__494; f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamKind = ((v_Vuna_dCompiler_dFrontend_dRast_dofMaybeExpr mc0) dtb__495) }
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dofDecl = (fun (scope : string Base_dData_dList.t_Base_dData_dList_dList) (d : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__496, dtb__497, dtb__498, dtb__499, dtb__500, dtb__501, dtb__502, dtb__503, dtb__504) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__496, dtb__497, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr ((Base_dData_dList.v_Base_dData_dList_dappend dtb__497) scope)) dtb__498), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofCtor ((Base_dData_dList.v_Base_dData_dList_dappend dtb__497) scope))) dtb__499), dtb__500, dtb__501, dtb__502, dtb__503, dtb__504))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__505, dtb__506, dtb__507) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__505, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__506), dtb__507))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__508, dtb__509, dtb__510, dtb__511) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__508, dtb__509, ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__510), dtb__511))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__512, dtb__513, dtb__514, dtb__515) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__512, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope)) dtb__513), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__514), dtb__515))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__516, dtb__517, dtb__518, dtb__519) -> ((fun bound -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__516, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofPat scope)) dtb__517), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr bound) dtb__518), dtb__519))) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dRast_dbindersOfPats dtb__517)) scope))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__520, dtb__521, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofField ((Base_dData_dList.v_Base_dData_dList_dappend dtb__521) scope))) dtb__522), dtb__523, dtb__524, dtb__525, dtb__526, dtb__527))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> ((fun bound -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__528, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofTraitParam bound)) dtb__529), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr bound)) dtb__530), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofTraitMethod bound)) dtb__531), dtb__532))) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dastTraitParamName) dtb__529)) scope))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__533, dtb__534, dtb__535, dtb__536) -> (C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope)) dtb__533), ((v_Vuna_dCompiler_dFrontend_dRast_dofExpr scope) dtb__534), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofDecl scope)) dtb__535), dtb__536))
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Frontend/Rast.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dofDecls = (fun (decls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dFrontend_dRast_dofDecl Base_dData_dList.C_Base_dData_dList_dList_Nil)) decls))
