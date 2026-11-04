open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
type t_Vuna_dCompiler_dFrontend_dAst_dField = C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod = C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild of (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam of (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun of ((t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDoStmt = C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dCtor = C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (int) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDecl = C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData of (string) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dCtor t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord of (string) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dField t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait of (string) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance of (t_Vuna_dCompiler_dFrontend_dAst_dExpr t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportItem = C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dModDecl = C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExportItem t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dSourceFile = C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource of (t_Vuna_dCompiler_dFrontend_dAst_dModDecl t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dAst_dImport = C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport of (string) * (bool) * (string t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dCommon_dSpan)

let v_Vuna_dCompiler_dFrontend_dAst_dpatSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__0, dtb__1, dtb__2) -> dtb__2
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__3, dtb__4) -> dtb__4
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__5, dtb__6) -> dtb__6
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__7, dtb__8, dtb__9) -> dtb__9
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__10) -> dtb__10
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__11, dtb__12, dtb__13) -> dtb__13
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__14, dtb__15) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__16, dtb__17, dtb__18) -> dtb__18
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__19, dtb__20) -> dtb__20
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__21, dtb__22, dtb__23) -> dtb__23
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__24, dtb__25, dtb__26) -> dtb__26
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__27, dtb__28, dtb__29) -> dtb__29
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__30, dtb__31, dtb__32, dtb__33) -> dtb__33
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__34, dtb__35, dtb__36) -> dtb__36
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__37, dtb__38) -> dtb__38
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__39, dtb__40, dtb__41, dtb__42) -> dtb__42
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> dtb__47
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__48, dtb__49, dtb__50) -> dtb__50
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__51, dtb__52, dtb__53) -> dtb__53
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__54, dtb__55) -> dtb__55
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__56, dtb__57) -> dtb__57
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__58, dtb__59) -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__60, dtb__61) -> dtb__61
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__62, dtb__63, dtb__64) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__65, dtb__66) -> dtb__65
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__67, dtb__68, dtb__69) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__70, dtb__71, dtb__72, dtb__73) -> dtb__73
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__77
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> dtb__82
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__86
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__87, dtb__88, dtb__89) -> dtb__89
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__90, dtb__91, dtb__92) -> dtb__92
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> dtb__98
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__103, dtb__104, dtb__105) -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__106, dtb__107, dtb__108) -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__109, dtb__110, dtb__111) -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__112, dtb__113, dtb__114) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__115, dtb__116, dtb__117) -> dtb__116
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__118, dtb__119, dtb__120) -> dtb__120
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dimportSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__121, dtb__122, dtb__123, dtb__124) -> dtb__124
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dmodDeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__125, dtb__126, dtb__127, dtb__128) -> dtb__128
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__129, dtb__130) -> dtb__130
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__131, dtb__132) -> dtb__132
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__133, dtb__134) -> dtb__134
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__135, dtb__136) -> (match dtb__135 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__137, dtb__138, dtb__139, dtb__140) -> (if ((bi_eq_str dtb__137) mc1) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__138, dtb__139)), ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__136) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__136) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__136) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls -> (fun name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name)))

let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name -> (fun decls -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__141, dtb__142) -> (match dtb__141 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__143)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name))))

let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__145, dtb__146, dtb__147, dtb__148) -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__149, dtb__150, dtb__151, dtb__152) -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__153, dtb__154, dtb__155) -> (match dtb__153 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__156, dtb__157) -> (if ((bi_eq_str dtb__156) "->") then (match dtb__154 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (match dtb__159 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (match dtb__161 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_add 1) (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__160))
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

let v_Vuna_dCompiler_dFrontend_dAst_dctorArityOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__162, dtb__163, dtb__164, dtb__165) -> dtb__164
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__166, dtb__167) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__166)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorArityOf dtb__166))) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__167))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__168, dtb__169) -> (match dtb__168 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__173) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__169)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> (if ((bi_eq_str mc0) dtb__177) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__179))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__169))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__169)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__182, dtb__183, dtb__184, dtb__185) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__186, dtb__187, dtb__188, dtb__189) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__188)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> (C_Base_dList_dList_Base_dList_dCons (dtb__190, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__198)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__201, dtb__202, dtb__203) -> (C_Base_dList_dList_Base_dList_dCons (dtb__201, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__204, dtb__205, dtb__206) -> (C_Base_dList_dList_Base_dList_dCons (dtb__204, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__207, dtb__208, dtb__209, dtb__210) -> (C_Base_dList_dList_Base_dList_dCons (dtb__207, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__211, dtb__212, dtb__213, dtb__214) -> (C_Base_dList_dList_Base_dList_dCons (dtb__211, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__213)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> (C_Base_dList_dList_Base_dList_dCons (dtb__215, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (C_Base_dList_dList_Base_dList_dCons (dtb__220, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__223)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__226, dtb__227, dtb__228, dtb__229) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__228)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__230, dtb__231, dtb__232, dtb__233, dtb__234) -> (C_Base_dList_dList_Base_dList_dCons (dtb__230, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__238)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__241, dtb__242, dtb__243, dtb__244) -> (C_Base_dList_dList_Base_dList_dCons (dtb__241, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> (C_Base_dList_dList_Base_dList_dCons (dtb__245, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255) -> (C_Base_dList_dList_Base_dList_dCons (dtb__250, C_Base_dList_dList_Base_dList_dNil))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260) -> dtb__259
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266) -> dtb__265
  | _ -> C_Base_dList_dList_Base_dList_dNil
))
