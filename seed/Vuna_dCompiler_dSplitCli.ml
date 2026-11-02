open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
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
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtMatch
open Vuna_dCompiler_dDtTerm
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dCoreCodegen
open Vuna_dCompiler_dDt
open Vuna_dCompiler_dCompile
let v_Vuna_dCompiler_dSplitCli_dsplitPackage = (fun pkg -> (fun outDir -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDt_ddtSplitProject (v_Vuna_dCompiler_dPkg_dpackageRoots pkg)) (v_Vuna_dCompiler_dPkg_dpackageName pkg)) (v_Vuna_dCompiler_dPkg_dpackageEntry pkg)) true)) (fun files -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dSplit_dwriteSplitFiles outDir) files)) (fun n -> ((fun order -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (n))) ((dtp_writeFile ((bi_concat outDir) "/build.sh")) (v_Vuna_dCompiler_dSplit_dbuildScript order)))) (v_Vuna_dCompiler_dSplit_dsplitCompileOrder (v_Vuna_dCompiler_dSplit_dsplitInitFiles files)))))))))

let v_Vuna_dCompiler_dSplitCli_dbuildSplit = (fun dir -> (fun outDir -> (match (v_Vuna_dCompiler_dPkg_dloadPackage dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__0) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__0))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1) -> ((v_Vuna_dCompiler_dSplitCli_dsplitPackage dtb__1) outDir)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dSplitCli_dseedSplit = (fun dir -> (fun outDir -> ((v_Vuna_dCompiler_dSplitCli_dbuildSplit dir) outDir)))
