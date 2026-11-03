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
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dAssembly
open Vuna_dCompiler_dDriver_dSplit
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
open Vuna_dCompiler_dDriver_dDt
let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun pkg -> (if (dtp_fileExists (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) then ((v_Vuna_dCompiler_dDriver_dDt_ddtCheck (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) else (match (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "check: library package ") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)) " has no app/Main.vuna (executable) and no [export].modules (library)"))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibrary (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) dtb__0)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun ctx -> (fun entry -> (fun printResult -> (fun outDir -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDriver_dDt_ddtSplitProject ctx) entry) printResult)) (fun files -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles outDir) files)) (fun n -> ((fun order -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (n))) ((dtp_writeFile ((bi_concat outDir) "/build.sh")) (v_Vuna_dCompiler_dDriver_dSplit_dbuildScript order)))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder (v_Vuna_dCompiler_dDriver_dSplit_dsplitInitFiles files)))))) (dtp_makeDir outDir))))))))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir -> (fun outDir -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir)))))

let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun dir -> (fun out -> (fun name -> ((fun code -> (if ((bi_eq_int code) 0) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "build: ") ((bi_concat name) ((bi_concat ": `sh build.sh ") ((bi_concat out) ((bi_concat "` failed in ") ((bi_concat dir) ((bi_concat " (exit ") ((bi_concat (bi_strFromInt code)) ")")))))))))))) (((fun dir args -> dtp_runIn dir (dtp_ocamlOf args)) dir) (C_Base_dList_dList_Base_dList_dCons ("sh", (C_Base_dList_dList_Base_dList_dCons ("build.sh", (C_Base_dList_dList_Base_dList_dCons (out, C_Base_dList_dList_Base_dList_dNil)))))))))))
