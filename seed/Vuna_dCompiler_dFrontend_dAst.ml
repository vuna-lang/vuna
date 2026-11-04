open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
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
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild of (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan)
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
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__11, dtb__12) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__13, dtb__14, dtb__15) -> dtb__15
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__16, dtb__17) -> dtb__17
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__18, dtb__19, dtb__20) -> dtb__20
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__21, dtb__22, dtb__23) -> dtb__23
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__24, dtb__25, dtb__26) -> dtb__26
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__27, dtb__28, dtb__29, dtb__30) -> dtb__30
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__31, dtb__32, dtb__33) -> dtb__33
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__34, dtb__35) -> dtb__35
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__36, dtb__37, dtb__38, dtb__39) -> dtb__39
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__44
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__45, dtb__46, dtb__47) -> dtb__47
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__48, dtb__49, dtb__50) -> dtb__50
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__51, dtb__52) -> dtb__52
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__53, dtb__54) -> dtb__54
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__55, dtb__56) -> dtb__56
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__57, dtb__58) -> dtb__58
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__59, dtb__60, dtb__61) -> dtb__61
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__62, dtb__63) -> dtb__62
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__64, dtb__65, dtb__66) -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__67, dtb__68, dtb__69, dtb__70) -> dtb__70
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> dtb__79
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__80, dtb__81, dtb__82, dtb__83) -> dtb__83
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__84, dtb__85, dtb__86) -> dtb__86
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__87, dtb__88, dtb__89) -> dtb__89
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__96, dtb__97, dtb__98, dtb__99) -> dtb__99
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__100, dtb__101, dtb__102) -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__103, dtb__104, dtb__105) -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__106, dtb__107, dtb__108) -> dtb__107
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__109, dtb__110, dtb__111) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__112, dtb__113, dtb__114) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__115, dtb__116, dtb__117) -> dtb__117
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dimportSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dmodDeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__122, dtb__123, dtb__124, dtb__125) -> dtb__125
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__126, dtb__127) -> dtb__127
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__128, dtb__129) -> dtb__129
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__130, dtb__131) -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> (match dtb__132 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__134, dtb__135, dtb__136, dtb__137) -> (if ((bi_eq_str dtb__134) mc1) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__135, dtb__136)), ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__133) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__133) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__133) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls -> (fun name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name)))

let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name -> (fun decls -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> (match dtb__138 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__140)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name))))

let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__142, dtb__143, dtb__144, dtb__145) -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__146, dtb__147, dtb__148, dtb__149) -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__150, dtb__151, dtb__152) -> (match dtb__150 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__153, dtb__154) -> (if ((bi_eq_str dtb__153) "->") then (match dtb__151 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (match dtb__156 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (match dtb__158 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_add 1) (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__157))
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
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__159, dtb__160, dtb__161, dtb__162) -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__163)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorArityOf dtb__163))) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__164))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (match dtb__165 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity name) dtb__170) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity name) dtb__166)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__174, dtb__175, dtb__176, dtb__177, dtb__178) -> (if ((bi_eq_str name) dtb__174) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__176))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity name) dtb__166))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity name) dtb__166)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__179, dtb__180, dtb__181, dtb__182) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__183, dtb__184, dtb__185, dtb__186) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__185)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> (C_Base_dList_dList_Base_dList_dCons (dtb__187, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__195)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__198, dtb__199, dtb__200) -> (C_Base_dList_dList_Base_dList_dCons (dtb__198, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__201, dtb__202, dtb__203) -> (C_Base_dList_dList_Base_dList_dCons (dtb__201, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__204, dtb__205, dtb__206, dtb__207) -> (C_Base_dList_dList_Base_dList_dCons (dtb__204, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__208, dtb__209, dtb__210, dtb__211) -> (C_Base_dList_dList_Base_dList_dCons (dtb__208, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__210)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (C_Base_dList_dList_Base_dList_dCons (dtb__212, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222) -> (C_Base_dList_dList_Base_dList_dCons (dtb__217, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__220)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__223, dtb__224, dtb__225, dtb__226) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__225)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231) -> (C_Base_dList_dList_Base_dList_dCons (dtb__227, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__235)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__238, dtb__239, dtb__240, dtb__241) -> (C_Base_dList_dList_Base_dList_dCons (dtb__238, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (C_Base_dList_dList_Base_dList_dCons (dtb__242, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252) -> (C_Base_dList_dList_Base_dList_dCons (dtb__247, C_Base_dList_dList_Base_dList_dNil))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__253, dtb__254, dtb__255, dtb__256, dtb__257) -> dtb__256
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263) -> dtb__262
  | _ -> C_Base_dList_dList_Base_dList_dNil
))
