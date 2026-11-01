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
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
type   t_Vuna_dCompiler_dTypecheck_dTy =
    C_Vuna_dCompiler_dTypecheck_dTVar of (int)
  | C_Vuna_dCompiler_dTypecheck_dTCon of (string) * ((t_Vuna_dCompiler_dTypecheck_dTy) list)
  | C_Vuna_dCompiler_dTypecheck_dTFun of (t_Vuna_dCompiler_dTypecheck_dTy) * (t_Vuna_dCompiler_dTypecheck_dTy)
  | C_Vuna_dCompiler_dTypecheck_dTApp of (t_Vuna_dCompiler_dTypecheck_dTy) * ((t_Vuna_dCompiler_dTypecheck_dTy) list)
and   t_Vuna_dCompiler_dTypecheck_dScheme =
    C_Vuna_dCompiler_dTypecheck_dScheme of ((int) list) * (((string, t_Vuna_dCompiler_dTypecheck_dTy) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dTypecheck_dTy)
and t_Vuna_dCompiler_dTypecheck_dRecordInfo
and t_Vuna_dCompiler_dTypecheck_dRecConstraint
and t_Vuna_dCompiler_dTypecheck_dTC
and t_Vuna_dCompiler_dTypecheck_dTySubst
and t_Vuna_dCompiler_dTypecheck_dEExpr
and t_Vuna_dCompiler_dTypecheck_dDictParam
and t_Vuna_dCompiler_dTypecheck_dTraitMethodInfo
and t_Vuna_dCompiler_dTypecheck_dTraitDecl
and t_Vuna_dCompiler_dTypecheck_dTraitMethodRef
and t_Vuna_dCompiler_dTypecheck_dTraitInst
and t_Vuna_dCompiler_dTypecheck_dTraitCtx
and t_Vuna_dCompiler_dTypecheck_dDataShape
val v_Vuna_dCompiler_dTypecheck_dlookupScheme : (string) -> ((((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) -> ((t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dMaybe_dMaybe))
val v_Vuna_dCompiler_dTypecheck_dcheckClauseArities : ((t_Vuna_dCompiler_dAst_dDecl) list) -> (((string) list) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElab : ((t_Vuna_dCompiler_dAst_dDecl) list) -> (((((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list, (t_Vuna_dCompiler_dAst_dDecl) list) t_Base_dPair_dPair) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElabOwners : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((((((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list, (t_Vuna_dCompiler_dAst_dDecl) list) t_Base_dPair_dPair, ((string, string) t_Base_dPair_dPair) list) t_Base_dPair_dPair) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dTypecheck_dexhaustiveWarningsFor : (((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> ((string) list))
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy : (t_Vuna_dCompiler_dTypecheck_dTy) -> ((t_Vuna_dCompiler_dTypecheck_dTy) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTy : (t_Vuna_dCompiler_dTypecheck_dTy) -> ((t_Vuna_dCompiler_dTypecheck_dTy) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uScheme : (t_Vuna_dCompiler_dTypecheck_dScheme) -> ((t_Vuna_dCompiler_dTypecheck_dScheme) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uScheme : (t_Vuna_dCompiler_dTypecheck_dScheme) -> ((t_Vuna_dCompiler_dTypecheck_dScheme) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uRecConstraint : (t_Vuna_dCompiler_dTypecheck_dRecConstraint) -> ((t_Vuna_dCompiler_dTypecheck_dRecConstraint) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uRecConstraint : (t_Vuna_dCompiler_dTypecheck_dRecConstraint) -> ((t_Vuna_dCompiler_dTypecheck_dRecConstraint) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTySubst : (t_Vuna_dCompiler_dTypecheck_dTySubst) -> ((t_Vuna_dCompiler_dTypecheck_dTySubst) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTySubst : (t_Vuna_dCompiler_dTypecheck_dTySubst) -> ((t_Vuna_dCompiler_dTypecheck_dTySubst) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr : (t_Vuna_dCompiler_dTypecheck_dEExpr) -> ((t_Vuna_dCompiler_dTypecheck_dEExpr) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uEExpr : (t_Vuna_dCompiler_dTypecheck_dEExpr) -> ((t_Vuna_dCompiler_dTypecheck_dEExpr) -> (bool))
val v_vuna_ushow_uVuna_uCompiler_uTypecheck_uDictParam : (t_Vuna_dCompiler_dTypecheck_dDictParam) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uDictParam : (t_Vuna_dCompiler_dTypecheck_dDictParam) -> ((t_Vuna_dCompiler_dTypecheck_dDictParam) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uDictParam : (t_Vuna_dCompiler_dTypecheck_dDictParam) -> ((t_Vuna_dCompiler_dTypecheck_dDictParam) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTraitMethodRef : (t_Vuna_dCompiler_dTypecheck_dTraitMethodRef) -> ((t_Vuna_dCompiler_dTypecheck_dTraitMethodRef) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTraitMethodRef : (t_Vuna_dCompiler_dTypecheck_dTraitMethodRef) -> ((t_Vuna_dCompiler_dTypecheck_dTraitMethodRef) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTraitInst : (t_Vuna_dCompiler_dTypecheck_dTraitInst) -> ((t_Vuna_dCompiler_dTypecheck_dTraitInst) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTraitInst : (t_Vuna_dCompiler_dTypecheck_dTraitInst) -> ((t_Vuna_dCompiler_dTypecheck_dTraitInst) -> (bool))
val show_Vuna_dCompiler_dTypecheck_dTy : t_Vuna_dCompiler_dTypecheck_dTy -> string
val show_Vuna_dCompiler_dTypecheck_dScheme : t_Vuna_dCompiler_dTypecheck_dScheme -> string
val show_Vuna_dCompiler_dTypecheck_dRecordInfo : t_Vuna_dCompiler_dTypecheck_dRecordInfo -> string
val show_Vuna_dCompiler_dTypecheck_dRecConstraint : t_Vuna_dCompiler_dTypecheck_dRecConstraint -> string
val show_Vuna_dCompiler_dTypecheck_dTC : t_Vuna_dCompiler_dTypecheck_dTC -> string
val show_Vuna_dCompiler_dTypecheck_dTySubst : t_Vuna_dCompiler_dTypecheck_dTySubst -> string
val show_Vuna_dCompiler_dTypecheck_dEExpr : t_Vuna_dCompiler_dTypecheck_dEExpr -> string
val show_Vuna_dCompiler_dTypecheck_dDictParam : t_Vuna_dCompiler_dTypecheck_dDictParam -> string
val show_Vuna_dCompiler_dTypecheck_dTraitMethodInfo : t_Vuna_dCompiler_dTypecheck_dTraitMethodInfo -> string
val show_Vuna_dCompiler_dTypecheck_dTraitDecl : t_Vuna_dCompiler_dTypecheck_dTraitDecl -> string
val show_Vuna_dCompiler_dTypecheck_dTraitMethodRef : t_Vuna_dCompiler_dTypecheck_dTraitMethodRef -> string
val show_Vuna_dCompiler_dTypecheck_dTraitInst : t_Vuna_dCompiler_dTypecheck_dTraitInst -> string
val show_Vuna_dCompiler_dTypecheck_dTraitCtx : t_Vuna_dCompiler_dTypecheck_dTraitCtx -> string
val show_Vuna_dCompiler_dTypecheck_dDataShape : t_Vuna_dCompiler_dTypecheck_dDataShape -> string
