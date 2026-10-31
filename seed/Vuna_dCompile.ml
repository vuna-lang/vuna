open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
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
open Vuna_dCodegen
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
let v_Vuna_dCompile_deffectiveRoots = fun a0 -> match a0 with
  | ([]) -> (v_Vuna_dPkg_drawRoot "lib") :: ((v_Vuna_dPkg_drawRoot "stdlib/lib") :: ([]))
  | (roots) -> roots
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 16 1 ("no matching clause for Vuna.Compile.effectiveRoots")

let rec v_Vuna_dCompile_dpatsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((p) :: (rest)) -> if v_Vuna_dCompile_dpatNeedsElab p then true else v_Vuna_dCompile_dpatsNeedElab rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 33 1 ("no matching clause for Vuna.Compile.patsNeedElab")
and v_Vuna_dCompile_dpatNeedsElab = fun p -> (match p with
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> true
  | C_Vuna_dAst_dPCon (name, pats, sp) -> v_Vuna_dCompile_dpatsNeedElab pats
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 36 18 ("case pattern match failure"))

let rec v_Vuna_dCompile_dargsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((e) :: (rest)) -> if v_Vuna_dCompile_dexprNeedsElab e then true else v_Vuna_dCompile_dargsNeedElab rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 41 1 ("no matching clause for Vuna.Compile.argsNeedElab")
and v_Vuna_dCompile_dbindsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((C_Vuna_dPair_dPair (pat, value)) :: (rest)) -> if v_Vuna_dCompile_dpatNeedsElab pat then true else if v_Vuna_dCompile_dexprNeedsElab value then true else v_Vuna_dCompile_dbindsNeedElab rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 44 1 ("no matching clause for Vuna.Compile.bindsNeedElab")
and v_Vuna_dCompile_daltsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((C_Vuna_dPair_dPair (pat, body)) :: (rest)) -> if v_Vuna_dCompile_dpatNeedsElab pat then true else if v_Vuna_dCompile_dexprNeedsElab body then true else v_Vuna_dCompile_daltsNeedElab rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 48 1 ("no matching clause for Vuna.Compile.altsNeedElab")
and v_Vuna_dCompile_dexprNeedsElab = fun e -> (match e with
  | C_Vuna_dAst_dEField (base, fname, sp) -> true
  | C_Vuna_dAst_dERecord (name, fields, sp) -> true
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> true
  | C_Vuna_dAst_dEInstSel (meth, iname, sp) -> true
  | C_Vuna_dAst_dEVar (name, sp) -> false
  | C_Vuna_dAst_dEInt (n, sp) -> false
  | C_Vuna_dAst_dEStr (s, sp) -> false
  | C_Vuna_dAst_dELam (ps, body, sp) -> v_Vuna_dCompile_dexprNeedsElab body
  | C_Vuna_dAst_dEApp (fn, args, sp) -> if v_Vuna_dCompile_dexprNeedsElab fn then true else v_Vuna_dCompile_dargsNeedElab args
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> if v_Vuna_dCompile_dbindsNeedElab binds then true else v_Vuna_dCompile_dexprNeedsElab body
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> if v_Vuna_dCompile_dexprNeedsElab scrut then true else v_Vuna_dCompile_daltsNeedElab alts
  | C_Vuna_dAst_dEIf (c, t, el, sp) -> if v_Vuna_dCompile_dexprNeedsElab c then true else if v_Vuna_dCompile_dexprNeedsElab t then true else v_Vuna_dCompile_dexprNeedsElab el
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 52 19 ("case pattern match failure"))

let rec v_Vuna_dCompile_dprogramNeedsElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> true
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> true
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> true
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> (match derivings with
  | [] -> v_Vuna_dCompile_dprogramNeedsElab rest
  | _ -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 26 43 ("case pattern match failure"))
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> if v_Vuna_dCompile_dpatsNeedElab pats then true else if v_Vuna_dCompile_dexprNeedsElab body then true else v_Vuna_dCompile_dprogramNeedsElab rest
  | C_Vuna_dAst_dDSig (name, ty, sp) -> v_Vuna_dCompile_dprogramNeedsElab rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 22 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 21 1 ("no matching clause for Vuna.Compile.programNeedsElab")

let v_Vuna_dCompile_dcompileFileIn = fun entryPkg roots entry printResult -> v_Vuna_dResult_dandThen (v_Vuna_dLoader_dloadProgram roots entryPkg entry) (fun decls -> if v_Vuna_dCompile_dprogramNeedsElab decls then v_Vuna_dResult_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun p -> v_Vuna_dCodegen_dgenerateProgram (v_Vuna_dPair_dsecondOf p) printResult) else v_Vuna_dCodegen_dgenerateProgram decls printResult)

let v_Vuna_dCompile_dcompileFile = fun roots entry printResult -> v_Vuna_dCompile_dcompileFileIn "" roots entry printResult

let v_Vuna_dCompile_dcompileFileCheckedIn = fun entryPkg roots entry printResult -> v_Vuna_dResult_dandThen (v_Vuna_dLoader_dloadProgram roots entryPkg entry) (fun decls -> if v_Vuna_dCompile_dprogramNeedsElab decls then v_Vuna_dResult_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun p -> v_Vuna_dCodegen_dgenerateProgram (v_Vuna_dPair_dsecondOf p) printResult) else v_Vuna_dResult_dandThen (v_Vuna_dTypecheck_dcheckProgram decls) (fun _u -> v_Vuna_dCodegen_dgenerateProgram decls printResult))

let v_Vuna_dCompile_dcompileFileChecked = fun roots entry printResult -> v_Vuna_dCompile_dcompileFileCheckedIn "" roots entry printResult

let v_Vuna_dCompile_dcompileFileTypedIn = fun entryPkg roots entry printResult -> v_Vuna_dResult_dandThen (v_Vuna_dLoader_dloadProgram roots entryPkg entry) (fun decls -> v_Vuna_dResult_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun p -> (match p with
  | C_Vuna_dPair_dPair (globals, elabDecls) -> v_Vuna_dTypedCodegen_dgenerateProgramTyped elabDecls globals printResult
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 81 153 ("case pattern match failure"))))

let v_Vuna_dCompile_dcompileFileTyped = fun roots entry printResult -> v_Vuna_dCompile_dcompileFileTypedIn "" roots entry printResult

let v_Vuna_dCompile_dcheckFileIn = fun entryPkg roots entry -> (match v_Vuna_dLoader_dloadProgram roots entryPkg entry with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (decls) -> if v_Vuna_dCompile_dprogramNeedsElab decls then (match v_Vuna_dTypecheck_dcheckProgramInfoElab decls with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (globals, elabDecls)) -> C_Vuna_dResult_dOk (v_Vuna_dTypecheck_dexhaustiveWarnings elabDecls)
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 91 46 ("case pattern match failure")) else (match v_Vuna_dTypecheck_dcheckProgramInfo decls with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (_) -> C_Vuna_dResult_dOk (v_Vuna_dTypecheck_dexhaustiveWarnings decls)
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 94 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compile.vuna" 89 36 ("case pattern match failure"))

let v_Vuna_dCompile_dcheckFile = fun roots entry -> v_Vuna_dCompile_dcheckFileIn "" roots entry
