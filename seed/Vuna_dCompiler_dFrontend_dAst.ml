open Vuna_runtime
open Vuna_builtins
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
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dLoader_dDiagnostics
type t_Vuna_dCompiler_dFrontend_dAst_dField = C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild of (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam of (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDoStmt = C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dCtor = C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (int) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDecl = C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData of (string) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dCtor t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord of (string) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dField t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait of (string) * (string t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance of (string t_Base_dMaybe_dMaybe) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportItem = C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll of (string) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dModDecl = C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExportItem t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dSourceFile = C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource of (t_Vuna_dCompiler_dFrontend_dAst_dModDecl t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dAst_dImport = C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport of (string) * (bool) * (string t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dCommon_dSpan)

let v_Vuna_dCompiler_dFrontend_dAst_dpatSpan = (fun pat -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__0, dtb__1) -> dtb__1
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__2) -> dtb__2
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__3, dtb__4, dtb__5) -> dtb__5
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__6, dtb__7) -> dtb__7
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__8, dtb__9) -> dtb__9
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__10, dtb__11, dtb__12) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun expr -> (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__13, dtb__14) -> dtb__14
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__15, dtb__16) -> dtb__16
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__17, dtb__18) -> dtb__18
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__19, dtb__20, dtb__21) -> dtb__21
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__22, dtb__23, dtb__24) -> dtb__24
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> dtb__29
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__30, dtb__31, dtb__32, dtb__33) -> dtb__33
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__34, dtb__35, dtb__36) -> dtb__36
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__37, dtb__38, dtb__39, dtb__40) -> dtb__40
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__41, dtb__42, dtb__43) -> dtb__43
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__44, dtb__45, dtb__46) -> dtb__46
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__47, dtb__48, dtb__49) -> dtb__49
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__50, dtb__51, dtb__52) -> dtb__52
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__53, dtb__54) -> dtb__54
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__55, dtb__56, dtb__57) -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun stmt -> (match stmt with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__58, dtb__59, dtb__60) -> dtb__60
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__61, dtb__62) -> dtb__62
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun stmt -> (match stmt with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__63, dtb__64, dtb__65) -> dtb__64
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__66, dtb__67) -> dtb__66
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun decl -> (match decl with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> dtb__73
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__74, dtb__75, dtb__76) -> dtb__76
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__80
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> dtb__85
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__89
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__95, dtb__96, dtb__97, dtb__98) -> dtb__98
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__99, dtb__100, dtb__101) -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__102, dtb__103, dtb__104) -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__105, dtb__106, dtb__107) -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dimportSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__108, dtb__109, dtb__110, dtb__111) -> dtb__111
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dmodDeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__112, dtb__113, dtb__114, dtb__115) -> dtb__115
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun item -> (match item with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__116, dtb__117) -> dtb__117
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__118, dtb__119) -> dtb__119
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__120, dtb__121) -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__124, dtb__125, dtb__126, dtb__127) -> (if ((bi_eq_str dtb__124) mc1) then (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126)), ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__123) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__123) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__123) mc1)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls -> (fun name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name)))

let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name -> (fun decls -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name) with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (match dtb__128 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__130)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__132, dtb__133, dtb__134, dtb__135) -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__136, dtb__137, dtb__138, dtb__139) -> dtb__137
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__140, dtb__141, dtb__142) -> (match dtb__140 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__143, dtb__144) -> (if ((bi_eq_str dtb__143) "->") then (match dtb__141 with
  | C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match dtb__146 with
  | C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match dtb__148 with
  | C_Base_dList_dList_Nil -> ((bi_add 1) (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__147))
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
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__149, dtb__150, dtb__151, dtb__152) -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun name -> (fun ctors -> (match ctors with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__153)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorArityOf dtb__153))) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity name) dtb__154))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__155 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity name) dtb__160) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity name) dtb__156)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> (if ((bi_eq_str name) dtb__164) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dlength dtb__166))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity name) dtb__156))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity name) dtb__156)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__169, dtb__170, dtb__171, dtb__172) -> (C_Base_dList_dList_Cons (dtb__169, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__173, dtb__174, dtb__175) -> (C_Base_dList_dList_Cons (dtb__173, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__179)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> (C_Base_dList_dList_Cons (dtb__182, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__187, dtb__188, dtb__189, dtb__190) -> ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__189)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__191, dtb__192, dtb__193, dtb__194, dtb__195) -> (match dtb__191 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__196) -> (C_Base_dList_dList_Cons (dtb__196, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (C_Base_dList_dList_Cons (dtb__197, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__200)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> (C_Base_dList_dList_Cons (dtb__203, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__208, dtb__209, dtb__210, dtb__211) -> (C_Base_dList_dList_Cons (dtb__208, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__210)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames d)
))

let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__215)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222) -> (C_Base_dList_dList_Cons (dtb__218, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__223, dtb__224, dtb__225, dtb__226) -> ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__225)
  | _ -> C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> (C_Base_dList_dList_Cons (dtb__227, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237) -> (C_Base_dList_dList_Cons (dtb__233, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__238, dtb__239, dtb__240, dtb__241) -> (C_Base_dList_dList_Cons (dtb__238, C_Base_dList_dList_Nil))
  | _ -> C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247) -> dtb__246
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__248, dtb__249, dtb__250, dtb__251, dtb__252) -> dtb__251
  | _ -> C_Base_dList_dList_Nil
))
