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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
let v_Vuna_dCompiler_dElab_dInstName_dinstanceHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__0, dtb__1, dtb__2) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__3, dtb__4) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__5, dtb__6) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dInstName_dargSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__7)) (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__8)))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dInstName_dexprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__9, dtb__10) -> dtb__9
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__11, dtb__12) -> (bi_strFromInt dtb__11)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__13, dtb__14) -> dtb__13
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__15, dtb__16, dtb__17) -> ((bi_concat (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__15)) (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__16))
  | _ -> "X"
))

let v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> ((bi_concat (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor dtb__18)) (v_Vuna_dCompiler_dElab_dInstName_dargSuffix dtb__19))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dInstName_dderivedInstName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__20, dtb__21, dtb__22) -> (v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail dtb__21)
  | _ -> (v_Vuna_dCompiler_dElab_dInstName_dexprNameFor mc0)
))

let v_Vuna_dCompiler_dElab_dInstName_dinstanceName = (fun cname -> (fun headExpr -> ((bi_concat (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf cname)) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dInstName_dderivedInstName headExpr)))))

let v_Vuna_dCompiler_dElab_dInstName_dargNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__23, dtb__24) -> dtb__23
  | _ -> "Int"
))
