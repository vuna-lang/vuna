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
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCoreCodegen
let v_Vuna_dCompiler_dDt_ddtLoad = fun roots entry -> v_Vuna_dCompiler_dLoader_dloadProgramRaw roots entry

let v_Vuna_dCompiler_dDt_ddtCheckFile = fun roots entry -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDt_ddtLoad roots entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgram decls) (fun program -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckDtProgram program) (fun _u -> C_Base_dResult_dOk ([]))))

let v_Vuna_dCompiler_dDt_ddtCompileFile = fun roots entry printResult -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDt_ddtLoad roots entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgram decls) (fun program -> v_Vuna_dCompiler_dCoreCodegen_dgenerateDtProgram program printResult))

let v_Vuna_dCompiler_dDt_dlastName = fun name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (rev, base) -> base
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 64 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dDt_disIOType = fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTApp (fn, _, _) -> v_Vuna_dCompiler_dDt_disIOType fn
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> v_vuna_ueq_ustr (v_Vuna_dCompiler_dDt_dlastName g) "IO"
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 69 14 ("case pattern match failure"))

let v_Vuna_dCompiler_dDt_dshowValueResult = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVInt (n) -> bi_str_from_int n
  | _ -> v_Vuna_dCompiler_dCore_dshowValue v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 76 21 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dDt_dfindMainDef = fun a0 -> match a0 with
  | ([]) -> C_Base_dMaybe_dNothing
  | ((d) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtDefName d) "main" then C_Base_dMaybe_dJust (d) else v_Vuna_dCompiler_dDt_dfindMainDef rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 81 1 ("no matching clause for Vuna.Compiler.Dt.findMainDef")

let rec v_Vuna_dCompiler_dDt_ddefTableOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtDefName d, v_Vuna_dCompiler_dElab_ddtDefBody d)) :: (v_Vuna_dCompiler_dDt_ddefTableOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 85 1 ("no matching clause for Vuna.Compiler.Dt.defTableOf")

let v_Vuna_dCompiler_dDt_devalDtMain = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (_, defs)) -> (match v_Vuna_dCompiler_dDt_dfindMainDef defs with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("DT: no main definition")
  | C_Base_dMaybe_dJust (mainDef) -> (let table = v_Vuna_dCompiler_dDt_ddefTableOf defs in let mainVal = v_Vuna_dCompiler_dCore_dnormalize table [] v_Vuna_dCompiler_dCore_ddefaultFuel (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("main", []))) in if v_Vuna_dCompiler_dDt_disIOType (v_Vuna_dCompiler_dElab_ddtDefType mainDef) then (match mainVal with
  | C_Vuna_dCompiler_dCore_dVCon (_, args) -> (match v_Base_dList_dreverse args with
  | (f) :: (_) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dDt_dshowValueResult (v_Vuna_dCompiler_dCore_dnormalize table [] v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dCore_dapplyValue f (C_Vuna_dCompiler_dCore_dVInt (0)))))
  | [] -> C_Base_dResult_dErr ("DT: main : IO a but its constructor has no arguments")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 52 22 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("DT: main does not reduce to an IO action")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 51 45 ("case pattern match failure")) else (match mainVal with
  | C_Vuna_dCompiler_dCore_dVInt (n) -> C_Base_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dCompiler_dCore_dVStr (s) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dCore_dshowValue mainVal)
  | C_Vuna_dCompiler_dCore_dVBool (b) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dCore_dshowValue mainVal)
  | _ -> C_Base_dResult_dErr ("DT: main does not reduce to a value")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 56 10 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 45 28 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Dt.vuna" 45 1 ("no matching clause for Vuna.Compiler.Dt.evalDtMain")

let v_Vuna_dCompiler_dDt_ddtEvalFile = fun roots entry -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDt_ddtLoad roots entry) (fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgram decls) (fun program -> v_Vuna_dCompiler_dDt_devalDtMain program))
