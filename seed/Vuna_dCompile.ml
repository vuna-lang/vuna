open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
open Vuna_dBuiltins
open Vuna_dLoader
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
let v_Vuna_dCompile_dcurrentPackageRoots = fun () -> (match v_Vuna_dPkg_dloadPackage "." with
  | C_Vuna_dResult_dErr (_) -> []
  | C_Vuna_dResult_dOk (pkg) -> v_Vuna_dPkg_dpackageRoots pkg
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 20 3 ("case pattern match failure"))

let v_Vuna_dCompile_deffectiveRoots = fun a0 -> match a0 with
  | ([]) -> v_Vuna_dCompile_dcurrentPackageRoots ()
  | (roots) -> roots
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 15 1 ("no matching clause for Vuna.Compile.effectiveRoots")

let v_Vuna_dCompile_dcompileFileTypedIn = fun entryPkg roots entry printResult -> v_Vuna_dResult_dandThen (v_Vuna_dLoader_dloadProgram roots entryPkg entry) (fun decls -> v_Vuna_dResult_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun p -> (match p with
  | C_Vuna_dPair_dPair (globals, elabDecls) -> v_Vuna_dTypedCodegen_dgenerateProgramTyped elabDecls globals printResult
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 26 153 ("case pattern match failure"))))

let v_Vuna_dCompile_dcompileFileTyped = fun roots entry printResult -> v_Vuna_dCompile_dcompileFileTypedIn "" roots entry printResult

let v_Vuna_dCompile_dcompileFileTypedExecIn = fun entryPkg roots entry -> v_Vuna_dResult_dandThen (v_Vuna_dLoader_dloadProgram roots entryPkg entry) (fun decls -> v_Vuna_dResult_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun p -> (match p with
  | C_Vuna_dPair_dPair (globals, elabDecls) -> v_Vuna_dTypedCodegen_dgenerateProgramTypedExec elabDecls globals
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 33 145 ("case pattern match failure"))))

let v_Vuna_dCompile_dcompileFileTypedExec = fun roots entry -> v_Vuna_dCompile_dcompileFileTypedExecIn "" roots entry

let v_Vuna_dCompile_dcheckFileIn = fun entryPkg roots entry -> (match v_Vuna_dLoader_dloadProgram roots entryPkg entry with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (decls) -> (match v_Vuna_dTypecheck_dcheckProgramInfoElab decls with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (globals, elabDecls)) -> C_Vuna_dResult_dOk (v_Vuna_dTypecheck_dexhaustiveWarningsFor globals elabDecls)
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 43 15 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 41 36 ("case pattern match failure"))

let v_Vuna_dCompile_dcheckFile = fun roots entry -> v_Vuna_dCompile_dcheckFileIn "" roots entry
