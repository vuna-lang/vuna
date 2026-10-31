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
open Vuna_dCompiler_dTypecheck
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dTypedCodegen
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCoreCodegen
open Vuna_dCompiler_dDt
let v_Vuna_dCompiler_dCompile_dcurrentPackageRoots = fun () -> (match v_Vuna_dCompiler_dPkg_dloadPackage "." with
  | C_Base_dResult_dErr (_) -> []
  | C_Base_dResult_dOk (pkg) -> v_Vuna_dCompiler_dPkg_dpackageRoots pkg
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 22 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dCompile_deffectiveRoots = fun a0 -> match a0 with
  | ([]) -> v_Vuna_dCompiler_dCompile_dcurrentPackageRoots ()
  | (roots) -> roots
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 17 1 ("no matching clause for Vuna.Compiler.Compile.effectiveRoots")

let v_Vuna_dCompiler_dCompile_dcompileFileTypedIn = fun entryPkg roots entry printResult -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dloadProgram roots entryPkg entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElab decls) (fun p -> (match p with
  | C_Base_dPair_dPair (globals, elabDecls) -> v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTyped elabDecls globals printResult
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 28 153 ("case pattern match failure"))))

let v_Vuna_dCompiler_dCompile_dcompileFileTyped = fun roots entry printResult -> v_Vuna_dCompiler_dCompile_dcompileFileTypedIn "" roots entry printResult

let v_Vuna_dCompiler_dCompile_dcompileFileTypedExecIn = fun entryPkg roots entry -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dloadProgram roots entryPkg entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElab decls) (fun p -> (match p with
  | C_Base_dPair_dPair (globals, elabDecls) -> v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTypedExec elabDecls globals
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 35 145 ("case pattern match failure"))))

let v_Vuna_dCompiler_dCompile_dcompileFileTypedExec = fun roots entry -> v_Vuna_dCompiler_dCompile_dcompileFileTypedExecIn "" roots entry

let v_Vuna_dCompiler_dCompile_dcheckFileIn = fun entryPkg roots entry -> (match v_Vuna_dCompiler_dLoader_dloadProgram roots entryPkg entry with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (decls) -> (match v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElab decls with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (globals, elabDecls)) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dexhaustiveWarningsFor globals elabDecls)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 45 15 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 43 36 ("case pattern match failure"))

let v_Vuna_dCompiler_dCompile_dcheckFile = fun roots entry -> v_Vuna_dCompiler_dCompile_dcheckFileIn "" roots entry

let v_Vuna_dCompiler_dCompile_dcheckPackageIn = fun entryPkg roots names -> (match v_Vuna_dCompiler_dLoader_dloadProjectModules roots entryPkg names with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (project) -> (match v_Vuna_dCompiler_dLoader_dresolveProject project with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (parts) -> (let flat = v_Base_dList_dappend (v_Base_dPair_dfirstOf parts) (v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf (v_Base_dPair_dsecondOf parts)) in (match v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElab flat with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (globals, elabDecls)) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dexhaustiveWarningsFor globals elabDecls)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 59 14 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 55 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Compile.vuna" 52 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dCompile_dcompileFileDt = fun entry printResult -> v_Vuna_dCompiler_dDt_ddtCompileFile entry printResult

let v_Vuna_dCompiler_dCompile_dcheckFileDt = fun entry -> v_Vuna_dCompiler_dDt_ddtCheckFile entry
