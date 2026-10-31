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
open Vuna_dCore
open Vuna_dElab
open Vuna_dCoreCodegen
let v_Vuna_dDt_ddtLoad = fun entry -> if bi_file_exists entry then (match v_Vuna_dParser_dparseSource entry (bi_read_file entry) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dAst_dSource (hdr, imports, decls)) -> (match hdr with
  | C_Vuna_dMaybe_dJust (m) -> C_Vuna_dResult_dErr (((v_Vuna_dBase_dshowSpanLoc (v_Vuna_dAst_dmodDeclSpan m)) ^ (": DT: module header is not allowed in entry file")))
  | C_Vuna_dMaybe_dNothing -> (match imports with
  | [] -> C_Vuna_dResult_dOk (decls)
  | _ -> C_Vuna_dResult_dErr ("DT: imports are not supported yet (single-file mode)")
  | _ -> vuna_fail "compiler/lib/Vuna/Dt.vuna" 24 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Dt.vuna" 21 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Dt.vuna" 18 5 ("case pattern match failure")) else C_Vuna_dResult_dErr ((("entry file not found: ") ^ (entry)))

let v_Vuna_dDt_ddtCheckFile = fun entry -> v_Vuna_dResult_dandThen (v_Vuna_dDt_ddtLoad entry) (fun decls -> v_Vuna_dResult_dandThen (v_Vuna_dElab_delabProgram decls) (fun defs -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dcheckDtProgram defs) (fun _u -> C_Vuna_dResult_dOk ([]))))

let v_Vuna_dDt_ddtCompileFile = fun entry printResult -> v_Vuna_dResult_dandThen (v_Vuna_dDt_ddtLoad entry) (fun decls -> v_Vuna_dResult_dandThen (v_Vuna_dElab_delabProgram decls) (fun defs -> v_Vuna_dCoreCodegen_dgenerateDtProgram defs printResult))

let rec v_Vuna_dDt_dfindMainDef = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dMaybe_dNothing
  | ((d) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dElab_ddtDefName d) "main" then C_Vuna_dMaybe_dJust (d) else v_Vuna_dDt_dfindMainDef rest
  | _ -> vuna_fail "compiler/lib/Vuna/Dt.vuna" 60 1 ("no matching clause for Vuna.Dt.findMainDef")

let rec v_Vuna_dDt_ddefTableOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (C_Vuna_dPair_dPair (v_Vuna_dElab_ddtDefName d, v_Vuna_dElab_ddtDefBody d)) :: (v_Vuna_dDt_ddefTableOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Dt.vuna" 65 1 ("no matching clause for Vuna.Dt.defTableOf")

let v_Vuna_dDt_devalDtMain = fun defs -> (match v_Vuna_dDt_dfindMainDef defs with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("DT: no main definition")
  | C_Vuna_dMaybe_dJust (mainDef) -> (let table = v_Vuna_dDt_ddefTableOf defs in let mainVal = v_Vuna_dCore_dnormalize table [] v_Vuna_dCore_ddefaultFuel (C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNGlobal ("main", []))) in (match mainVal with
  | C_Vuna_dCore_dVInt (n) -> C_Vuna_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dCore_dVStr (s) -> C_Vuna_dResult_dOk (v_Vuna_dCore_dshowValue mainVal)
  | C_Vuna_dCore_dVBool (b) -> C_Vuna_dResult_dOk (v_Vuna_dCore_dshowValue mainVal)
  | _ -> C_Vuna_dResult_dErr ("DT: main does not reduce to a value")
  | _ -> vuna_fail "compiler/lib/Vuna/Dt.vuna" 53 10 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Dt.vuna" 48 3 ("case pattern match failure"))

let v_Vuna_dDt_ddtEvalFile = fun entry -> v_Vuna_dResult_dandThen (v_Vuna_dDt_ddtLoad entry) (fun decls -> v_Vuna_dResult_dandThen (v_Vuna_dElab_delabProgram decls) (fun defs -> v_Vuna_dDt_devalDtMain defs))
