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
let v_Vuna_dCompiler_dDt_ddtLoad = fun entry -> if bi_file_exists entry then (match v_Vuna_dCompiler_dParser_dparseSource entry (bi_read_file entry) with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dSource (hdr, imports, decls)) -> (match hdr with
  | C_Base_dMaybe_dJust (m) -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dmodDeclSpan m)) ^ (": DT: module header is not allowed in entry file")))
  | C_Base_dMaybe_dNothing -> (match imports with
  | [] -> C_Base_dResult_dOk (decls)
  | _ -> C_Base_dResult_dErr ("DT: imports are not supported yet (single-file mode)")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 24 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 21 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 18 5 ("case pattern match failure")) else C_Base_dResult_dErr ((("entry file not found: ") ^ (entry)))

let v_Vuna_dCompiler_dDt_ddtCheckFile = fun entry -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDt_ddtLoad entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgram decls) (fun defs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckDtProgram defs) (fun _u -> C_Base_dResult_dOk ([]))))

let v_Vuna_dCompiler_dDt_ddtCompileFile = fun entry printResult -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDt_ddtLoad entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgram decls) (fun defs -> v_Vuna_dCompiler_dCoreCodegen_dgenerateDtProgram defs printResult))

let rec v_Vuna_dCompiler_dDt_dfindMainDef = fun a0 -> match a0 with
  | ([]) -> C_Base_dMaybe_dNothing
  | ((d) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtDefName d) "main" then C_Base_dMaybe_dJust (d) else v_Vuna_dCompiler_dDt_dfindMainDef rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 60 1 ("no matching clause for Vuna.Compiler.Dt.findMainDef")

let rec v_Vuna_dCompiler_dDt_ddefTableOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtDefName d, v_Vuna_dCompiler_dElab_ddtDefBody d)) :: (v_Vuna_dCompiler_dDt_ddefTableOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 65 1 ("no matching clause for Vuna.Compiler.Dt.defTableOf")

let v_Vuna_dCompiler_dDt_devalDtMain = fun defs -> (match v_Vuna_dCompiler_dDt_dfindMainDef defs with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("DT: no main definition")
  | C_Base_dMaybe_dJust (mainDef) -> (let table = v_Vuna_dCompiler_dDt_ddefTableOf defs in let mainVal = v_Vuna_dCompiler_dCore_dnormalize table [] v_Vuna_dCompiler_dCore_ddefaultFuel (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("main", []))) in (match mainVal with
  | C_Vuna_dCompiler_dCore_dVInt (n) -> C_Base_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dCompiler_dCore_dVStr (s) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dCore_dshowValue mainVal)
  | C_Vuna_dCompiler_dCore_dVBool (b) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dCore_dshowValue mainVal)
  | _ -> C_Base_dResult_dErr ("DT: main does not reduce to a value")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 53 10 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 48 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dDt_ddtEvalFile = fun entry -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDt_ddtLoad entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgram decls) (fun defs -> v_Vuna_dCompiler_dDt_devalDtMain defs))
