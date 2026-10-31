open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
type   t_Vuna_dCompiler_dAst_dField =
    C_Vuna_dCompiler_dAst_dField of (string) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dPat =
    C_Vuna_dCompiler_dAst_dPVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dPWild of (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dPCon of (string) * ((t_Vuna_dCompiler_dAst_dPat) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dPInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dPStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dPRecord of (string) * (((string, t_Vuna_dCompiler_dAst_dPat) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dExpr =
    C_Vuna_dCompiler_dAst_dEVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dELam of ((string) list) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEApp of (t_Vuna_dCompiler_dAst_dExpr) * ((t_Vuna_dCompiler_dAst_dExpr) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEPi of (string) * (bool) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dELet of (((t_Vuna_dCompiler_dAst_dPat, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dAst_dExpr) * (bool) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dECase of (t_Vuna_dCompiler_dAst_dExpr) * (((t_Vuna_dCompiler_dAst_dPat, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEIf of (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEField of (t_Vuna_dCompiler_dAst_dExpr) * (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dERecord of (string) * (((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dERecUpdate of (t_Vuna_dCompiler_dAst_dExpr) * (((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEInstSel of (t_Vuna_dCompiler_dAst_dExpr) * (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dEDo of ((t_Vuna_dCompiler_dAst_dDoStmt) list) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dDoStmt =
    C_Vuna_dCompiler_dAst_dDBind of (t_Vuna_dCompiler_dAst_dPat) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dDExpr of (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dCtor =
    C_Vuna_dCompiler_dAst_dCtor of (string) * (t_Vuna_dCompiler_dAst_dExpr) * (int) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dDecl =
    C_Vuna_dCompiler_dAst_dDData of (string) * ((string) list) * ((t_Vuna_dCompiler_dAst_dCtor) list) * ((string) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dDSig of (string) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dDFun of (string) * ((t_Vuna_dCompiler_dAst_dPat) list) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dDRecord of (string) * ((string) list) * ((t_Vuna_dCompiler_dAst_dField) list) * ((string) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dDTrait of (string) * ((string) list) * (((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dDInstance of ((string) t_Base_dMaybe_dMaybe) * (bool) * (t_Vuna_dCompiler_dAst_dExpr) * ((t_Vuna_dCompiler_dAst_dDecl) list) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dExportItem =
    C_Vuna_dCompiler_dAst_dXBare of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dXTypeAll of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dAst_dXModule of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dModDecl =
    C_Vuna_dCompiler_dAst_dModDecl of (string) * (bool) * ((t_Vuna_dCompiler_dAst_dExportItem) list) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dAst_dSourceFile =
    C_Vuna_dCompiler_dAst_dSource of ((t_Vuna_dCompiler_dAst_dModDecl) t_Base_dMaybe_dMaybe) * ((t_Vuna_dCompiler_dAst_dImport) list) * ((t_Vuna_dCompiler_dAst_dDecl) list)
and   t_Vuna_dCompiler_dAst_dImport =
    C_Vuna_dCompiler_dAst_dImport of (string) * (bool) * ((string) t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_ddoStmtSpan : (t_Vuna_dCompiler_dAst_dDoStmt) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_ddoStmtExpr : (t_Vuna_dCompiler_dAst_dDoStmt) -> (t_Vuna_dCompiler_dAst_dExpr)
val v_Vuna_dCompiler_dAst_dmodDeclSpan : (t_Vuna_dCompiler_dAst_dModDecl) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_dpatSpan : (t_Vuna_dCompiler_dAst_dPat) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_dexprSpan : (t_Vuna_dCompiler_dAst_dExpr) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_ddeclSpan : (t_Vuna_dCompiler_dAst_dDecl) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_dctorSpan : (t_Vuna_dCompiler_dAst_dCtor) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_dfieldSpan : (t_Vuna_dCompiler_dAst_dField) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_dfieldName : (t_Vuna_dCompiler_dAst_dField) -> (string)
val v_Vuna_dCompiler_dAst_dfieldType : (t_Vuna_dCompiler_dAst_dField) -> (t_Vuna_dCompiler_dAst_dExpr)
val v_Vuna_dCompiler_dAst_dimportSpan : (t_Vuna_dCompiler_dAst_dImport) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_dexportItemSpan : (t_Vuna_dCompiler_dAst_dExportItem) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dAst_dclausesFor : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((string) -> ((((t_Vuna_dCompiler_dAst_dPat) list, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list))
val v_Vuna_dCompiler_dAst_dfunArity : (string) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> ((int) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dAst_dctorName : (t_Vuna_dCompiler_dAst_dCtor) -> (string)
val v_Vuna_dCompiler_dAst_dctorType : (t_Vuna_dCompiler_dAst_dCtor) -> (t_Vuna_dCompiler_dAst_dExpr)
val v_Vuna_dCompiler_dAst_dctorArityOf : (t_Vuna_dCompiler_dAst_dCtor) -> (int)
val v_Vuna_dCompiler_dAst_dctorArity : (string) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> ((int) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dAst_ddeclNames : (t_Vuna_dCompiler_dAst_dDecl) -> ((string) list)
val v_Vuna_dCompiler_dAst_dtopNames : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((string) list)
val v_Vuna_dCompiler_dAst_dctorsOf : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((string) list)
val v_Vuna_dCompiler_dAst_dtypeNamesOf : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((string) list)
val v_Vuna_dCompiler_dAst_ddeclDerivings : (t_Vuna_dCompiler_dAst_dDecl) -> ((string) list)
val v_vuna_ueq_uVuna_uCompiler_uAst_uPat : (t_Vuna_dCompiler_dAst_dPat) -> ((t_Vuna_dCompiler_dAst_dPat) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uAst_uPat : (t_Vuna_dCompiler_dAst_dPat) -> ((t_Vuna_dCompiler_dAst_dPat) -> (bool))
val v_vuna_ushow_uVuna_uCompiler_uAst_uExportItem : (t_Vuna_dCompiler_dAst_dExportItem) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uAst_uExportItem : (t_Vuna_dCompiler_dAst_dExportItem) -> ((t_Vuna_dCompiler_dAst_dExportItem) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uAst_uExportItem : (t_Vuna_dCompiler_dAst_dExportItem) -> ((t_Vuna_dCompiler_dAst_dExportItem) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uAst_uModDecl : (t_Vuna_dCompiler_dAst_dModDecl) -> ((t_Vuna_dCompiler_dAst_dModDecl) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uAst_uModDecl : (t_Vuna_dCompiler_dAst_dModDecl) -> ((t_Vuna_dCompiler_dAst_dModDecl) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uAst_uImport : (t_Vuna_dCompiler_dAst_dImport) -> ((t_Vuna_dCompiler_dAst_dImport) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uAst_uImport : (t_Vuna_dCompiler_dAst_dImport) -> ((t_Vuna_dCompiler_dAst_dImport) -> (bool))
val show_Vuna_dCompiler_dAst_dField : t_Vuna_dCompiler_dAst_dField -> string
val show_Vuna_dCompiler_dAst_dPat : t_Vuna_dCompiler_dAst_dPat -> string
val show_Vuna_dCompiler_dAst_dExpr : t_Vuna_dCompiler_dAst_dExpr -> string
val show_Vuna_dCompiler_dAst_dDoStmt : t_Vuna_dCompiler_dAst_dDoStmt -> string
val show_Vuna_dCompiler_dAst_dCtor : t_Vuna_dCompiler_dAst_dCtor -> string
val show_Vuna_dCompiler_dAst_dDecl : t_Vuna_dCompiler_dAst_dDecl -> string
val show_Vuna_dCompiler_dAst_dExportItem : t_Vuna_dCompiler_dAst_dExportItem -> string
val show_Vuna_dCompiler_dAst_dModDecl : t_Vuna_dCompiler_dAst_dModDecl -> string
val show_Vuna_dCompiler_dAst_dSourceFile : t_Vuna_dCompiler_dAst_dSourceFile -> string
val show_Vuna_dCompiler_dAst_dImport : t_Vuna_dCompiler_dAst_dImport -> string
