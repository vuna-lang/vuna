open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dAst_dField = C_Vuna_dCompiler_dFrontend_dAst_dField_Field of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod = C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_TraitMethod of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dTraitParam = C_Vuna_dCompiler_dFrontend_dAst_dTraitParam_TraitParam of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild of (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dInterpPart = C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText of (string) | C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole of (t_Vuna_dCompiler_dFrontend_dAst_dExpr)
and t_Vuna_dCompiler_dFrontend_dAst_dQty = C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam of (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun of ((t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp of (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dInterpPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl = C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl of (string) * (int) * (int) * (string Base_dMaybe.t_Base_dMaybe_dMaybe) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDoStmt = C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dCtor = C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDecl = C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dField Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitParam Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance of (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportItem = C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dModDecl = C_Vuna_dCompiler_dFrontend_dAst_dModDecl_ModDecl of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dSourceFile = C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_SourceFile of (t_Vuna_dCompiler_dFrontend_dAst_dModDecl Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dAst_dImport = C_Vuna_dCompiler_dFrontend_dAst_dImport_Import of (string) * (bool) * (string Base_dMaybe.t_Base_dMaybe_dMaybe) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)

let v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> false
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__4
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
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__63, dtb__64) -> dtb__64
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__65, dtb__66) -> dtb__66
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__67, dtb__68, dtb__69) -> dtb__69
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__70, dtb__71, dtb__72) -> dtb__72
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__73, dtb__74) -> dtb__74
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__75, dtb__76, dtb__77, dtb__78) -> dtb__78
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__79, dtb__80) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__79)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__81, dtb__82, dtb__83, dtb__84) -> dtb__84
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__85, dtb__86) -> dtb__86
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__87, dtb__88) -> dtb__88
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__89, dtb__90, dtb__91) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__92, dtb__93) -> dtb__92
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__94, dtb__95, dtb__96) -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__97, dtb__98, dtb__99, dtb__100) -> dtb__100
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__104
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__110
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__114
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__118
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__123, dtb__124, dtb__125) -> dtb__125
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__133, dtb__134, dtb__135, dtb__136) -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Field (dtb__137, dtb__138, dtb__139) -> dtb__139
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Field (dtb__140, dtb__141, dtb__142) -> dtb__140
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Field (dtb__143, dtb__144, dtb__145) -> dtb__144
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_TraitMethod (dtb__146, dtb__147, dtb__148) -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_TraitMethod (dtb__149, dtb__150, dtb__151) -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__152, dtb__153) -> dtb__153
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__154, dtb__155) -> dtb__155
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__156, dtb__157) -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (match dtb__158 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__160, dtb__161, dtb__162, dtb__163) -> (if (dtb__160 = mc1) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__161, dtb__162)), ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__159) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__159) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__159) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name))

let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name decls -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__164 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__166, dtb__167) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__166)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)))

let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__168, dtb__169, dtb__170, dtb__171) -> dtb__168
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorShortName = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__172, dtb__173) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__173
  | _ -> (match (Base_dList.v_Base_dList_dreverse dtb__172) with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__173
  | Base_dList.C_Base_dList_dList_Cons (dtb__174, dtb__175) -> (String.concat "" [dtb__174; "."; dtb__173])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__176, dtb__177, dtb__178, dtb__179) -> dtb__177
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__180, dtb__181, dtb__182) -> (match dtb__180 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__183, dtb__184) -> (if (dtb__183 = "->") then (match dtb__181 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (match dtb__186 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (match dtb__188 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__187))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__189) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((match dtb__189 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__191, dtb__192, dtb__193, dtb__194) -> dtb__193
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__190))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__195 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__200) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__204) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__204))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__196)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> (if (mc0 = dtb__205) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__207))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__196))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__196)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__211, dtb__212, dtb__213, dtb__214) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__215, dtb__216, dtb__217, dtb__218) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__217)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> (Base_dList.C_Base_dList_dList_Cons (dtb__219, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__228)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__232, dtb__233, dtb__234, dtb__235) -> (Base_dList.C_Base_dList_dList_Cons (dtb__232, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__236, dtb__237, dtb__238, dtb__239) -> (Base_dList.C_Base_dList_dList_Cons (dtb__236, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__240, dtb__241, dtb__242) -> (Base_dList.C_Base_dList_dList_Cons (dtb__240, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__243, dtb__244, dtb__245, dtb__246) -> (Base_dList.C_Base_dList_dList_Cons (dtb__243, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__247, dtb__248, dtb__249, dtb__250) -> (Base_dList.C_Base_dList_dList_Cons (dtb__247, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__249)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> (Base_dList.C_Base_dList_dList_Cons (dtb__251, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263) -> (Base_dList.C_Base_dList_dList_Cons (dtb__257, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__260)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__264, dtb__265, dtb__266, dtb__267) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__266)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> (Base_dList.C_Base_dList_dList_Cons (dtb__268, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__277)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__281, dtb__282, dtb__283, dtb__284) -> (Base_dList.C_Base_dList_dList_Cons (dtb__281, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290) -> (Base_dList.C_Base_dList_dList_Cons (dtb__285, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295, dtb__296, dtb__297) -> (Base_dList.C_Base_dList_dList_Cons (dtb__291, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> dtb__301
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__304, dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> dtb__308
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dholeNamed = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__311, dtb__312) -> (if (dtb__311 = 63) then (match dtb__312 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__313, dtb__314) -> true
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__315, dtb__316) -> ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (n - 1)) dtb__316)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix = (fun p name -> (if ((Base_dString.v_Base_dString_dstartsWith p) name) then (Base_dList.dtp_pack ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (bi_strLength p)) (Base_dList.dtp_unpack name))) else name))

let rec v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__317, dtb__318) -> (match dtb__318 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__317
  | _ -> (String.concat "" [dtb__317; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt dtb__318)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_doverCtorName = (fun short targets -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)]))

let v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort = (fun name -> (match ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | Base_dList.C_Base_dList_dList_Cons (dtb__319, dtb__320) -> dtb__319
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets = (fun name -> (match ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__321, dtb__322) -> dtb__322
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name))

let v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax = "@vuna@list@nil"

let v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax = "@vuna@list@cons"

let v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax))

let v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax))
