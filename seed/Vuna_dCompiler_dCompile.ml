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
let v_Vuna_dCompiler_dCompile_dcurrentPackageRoots = fun () -> (match (v_Vuna_dCompiler_dPkg_dloadPackage ".") with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__0) -> C_Base_dList_dList_Nil
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1) -> (v_Vuna_dCompiler_dPkg_dpackageRoots dtb__1)
  | _ -> failwith "DT: impossible branch"
)

let v_Vuna_dCompiler_dCompile_deffectiveRoots = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCompile_dcurrentPackageRoots ())
  | _ -> mc0
))

let v_Vuna_dCompiler_dCompile_dcheckFileDt = (fun roots -> (fun entry -> ((v_Vuna_dCompiler_dDt_ddtCheckFile roots) entry)))

let v_Vuna_dCompiler_dCompile_dcompileFileDt = (fun roots -> (fun entry -> (fun printResult -> (((v_Vuna_dCompiler_dDt_ddtCompileFile roots) entry) printResult))))

let v_Vuna_dCompiler_dCompile_dcheckProjectDt = (fun roots -> (fun entryPkg -> (fun entry -> (((v_Vuna_dCompiler_dDt_ddtCheckProject roots) entryPkg) entry))))

let v_Vuna_dCompiler_dCompile_dcompileProjectDt = (fun roots -> (fun entryPkg -> (fun entry -> (fun printResult -> ((((v_Vuna_dCompiler_dDt_ddtCompileProject roots) entryPkg) entry) printResult)))))

let v_Vuna_dCompiler_dCompile_dcheckLibraryDt = (fun roots -> (fun entryPkg -> (fun names -> (((v_Vuna_dCompiler_dDt_ddtCheckLibrary roots) entryPkg) names))))

let v_Vuna_dCompiler_dCompile_ddtMainFile = fun () -> "main.ml"

let v_Vuna_dCompiler_dCompile_ddtBuildScriptName = fun () -> "build.sh"

let v_Vuna_dCompiler_dCompile_ddtBuildScript = fun () -> ((bi_concat "#!/bin/sh\n") ((bi_concat "# \231\148\177 vuna \231\148\159\230\136\144\239\188\154DT \229\141\149\230\150\135\228\187\182\232\190\147\229\135\186\227\128\130\n") ((bi_concat "set -e\n") ((bi_concat "cd \"$(dirname \"$0\")\"\n") "ocamlopt -w -a -I +unix unix.cmxa main.ml -o main\n"))))

let v_Vuna_dCompiler_dCompile_ddtProjectFiles = (fun roots -> (fun entryPkg -> (fun entry -> (fun printResult -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDt_ddtCompileProject roots) entryPkg) entry) printResult)) (fun code -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCompile_ddtMainFile ()), code)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCompile_ddtBuildScriptName ()), (v_Vuna_dCompiler_dCompile_ddtBuildScript ()))), C_Base_dList_dList_Nil))))))))))))
