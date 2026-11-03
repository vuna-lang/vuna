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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
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
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dProgram
open Vuna_dCompiler_dDriver_dSplit
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
open Vuna_dCompiler_dDriver_dDt
let v_Vuna_dCompiler_dDriver_dCompile_dcurrentPackageRoots = fun () -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ".") with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__0) -> C_Base_dList_dList_Nil
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1) -> (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots dtb__1)
  | _ -> failwith "DT: impossible branch"
)

let v_Vuna_dCompiler_dDriver_dCompile_deffectiveRoots = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompile_dcurrentPackageRoots ())
  | _ -> mc0
))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckFileDt = (fun roots -> (fun entry -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckFile roots) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileFileDt = (fun roots -> (fun entry -> (fun printResult -> (((v_Vuna_dCompiler_dDriver_dDt_ddtCompileFile roots) entry) printResult))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckProjectDt = (fun roots -> (fun entryPkg -> (fun entry -> (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckProject roots) entryPkg) entry))))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileProjectDt = (fun roots -> (fun entryPkg -> (fun entry -> (fun printResult -> ((((v_Vuna_dCompiler_dDriver_dDt_ddtCompileProject roots) entryPkg) entry) printResult)))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckLibraryDt = (fun roots -> (fun entryPkg -> (fun names -> (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibrary roots) entryPkg) names))))

let v_Vuna_dCompiler_dDriver_dCompile_ddtMainFile = fun () -> "main.ml"

let v_Vuna_dCompiler_dDriver_dCompile_ddtBuildScriptName = fun () -> "build.sh"

let v_Vuna_dCompiler_dDriver_dCompile_ddtBuildScript = fun () -> ((bi_concat "#!/bin/sh\n") ((bi_concat "# \231\148\177 vuna \231\148\159\230\136\144\239\188\154DT \229\141\149\230\150\135\228\187\182\232\190\147\229\135\186\227\128\130\n") ((bi_concat "set -e\n") ((bi_concat "cd \"$(dirname \"$0\")\"\n") "ocamlopt -w -a -I +unix unix.cmxa main.ml -o main\n"))))

let v_Vuna_dCompiler_dDriver_dCompile_ddtProjectFiles = (fun roots -> (fun entryPkg -> (fun entry -> (fun printResult -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDriver_dDt_ddtCompileProject roots) entryPkg) entry) printResult)) (fun code -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dCompile_ddtMainFile ()), code)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dCompile_ddtBuildScriptName ()), (v_Vuna_dCompiler_dDriver_dCompile_ddtBuildScript ()))), C_Base_dList_dList_Nil))))))))))))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitPackage = (fun pkg -> (fun outDir -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dDriver_dDt_ddtSplitProject (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true)) (fun files -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles outDir) files)) (fun n -> ((fun order -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (n))) ((dtp_writeFile ((bi_concat outDir) "/build.sh")) (v_Vuna_dCompiler_dDriver_dSplit_dbuildScript order)))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder (v_Vuna_dCompiler_dDriver_dSplit_dsplitInitFiles files)))))))))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir -> (fun outDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__2) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__2))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__3) -> ((v_Vuna_dCompiler_dDriver_dCompile_dsplitPackage dtb__3) outDir)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dseedSplit = (fun dir -> (fun outDir -> ((v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit dir) outDir)))
