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
let rec v_Vuna_dCoreCodegen_ddefTable = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (C_Vuna_dPair_dPair (v_Vuna_dElab_ddtDefName d, v_Vuna_dElab_ddtDefBody d)) :: (v_Vuna_dCoreCodegen_ddefTable rest)
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 22 1 ("no matching clause for Vuna.CoreCodegen.defTable")

let rec v_Vuna_dCoreCodegen_dfindDtDef = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dMaybe_dNothing
  | (name, (d) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dElab_ddtDefName d) name then C_Vuna_dMaybe_dJust (d) else v_Vuna_dCoreCodegen_dfindDtDef name rest
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 26 1 ("no matching clause for Vuna.CoreCodegen.findDtDef")

let v_Vuna_dCoreCodegen_disTypeLevelDef = fun table d -> v_Vuna_dCore_disTypeValue (v_Vuna_dCore_dforce table [] v_Vuna_dCore_ddefaultFuel (v_Vuna_dCore_deval [] (v_Vuna_dElab_ddtDefType d)))

let rec v_Vuna_dCoreCodegen_dpartitionDefsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (table, [], runtime, typeNames) -> C_Vuna_dPair_dPair (v_Vuna_dList_dreverse runtime, v_Vuna_dList_dreverse typeNames)
  | (table, (d) :: (rest), runtime, typeNames) -> if v_Vuna_dCoreCodegen_disTypeLevelDef table d then v_Vuna_dCoreCodegen_dpartitionDefsGo table rest runtime ((v_Vuna_dElab_ddtDefName d) :: (typeNames)) else v_Vuna_dCoreCodegen_dpartitionDefsGo table rest ((d) :: (runtime)) typeNames
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 38 1 ("no matching clause for Vuna.CoreCodegen.partitionDefsGo")

let v_Vuna_dCoreCodegen_dpartitionDefs = fun table defs -> v_Vuna_dCoreCodegen_dpartitionDefsGo table defs [] []

let rec v_Vuna_dCoreCodegen_dbinderAt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dMaybe_dNothing
  | (i, (b) :: (rest)) -> if v_vuna_ule_uint i 0 then C_Vuna_dMaybe_dJust (b) else v_Vuna_dCoreCodegen_dbinderAt (bi_sub i 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 79 1 ("no matching clause for Vuna.CoreCodegen.binderAt")

let rec v_Vuna_dCoreCodegen_dcheckErasure = fun typeNames binders t -> (match t with
  | C_Vuna_dCore_dTVar (name, i) -> (match v_Vuna_dCoreCodegen_dbinderAt i binders with
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (n, erased)) -> if erased then C_Vuna_dResult_dErr ((let vuna_cat0' = ("DT: type-level binding `") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("` is used at runtime (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Vuna_dResult_dOk (0)
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("DT: internal: unbound runtime variable ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 54 7 ("case pattern match failure"))
  | C_Vuna_dCore_dTGlobal (name) -> if v_Vuna_dList_dmemName name typeNames then C_Vuna_dResult_dErr ((let vuna_cat0' = ("DT: type-level name `") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("` is used at runtime (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Vuna_dResult_dOk (0)
  | C_Vuna_dCore_dTType (n) -> C_Vuna_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> C_Vuna_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCore_dTMeta (m) -> C_Vuna_dResult_dErr ("DT: unsolved metavariable in runtime code")
  | C_Vuna_dCore_dTLam (name, erased, body) -> v_Vuna_dCoreCodegen_dcheckErasure typeNames ((C_Vuna_dPair_dPair (name, erased)) :: (binders)) body
  | C_Vuna_dCore_dTApp (f, a, erased) -> if erased then v_Vuna_dCoreCodegen_dcheckErasure typeNames binders f else v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dcheckErasure typeNames binders f) (fun _u -> v_Vuna_dCoreCodegen_dcheckErasure typeNames binders a)
  | C_Vuna_dCore_dTInt (n) -> C_Vuna_dResult_dOk (0)
  | C_Vuna_dCore_dTStr (s) -> C_Vuna_dResult_dOk (0)
  | C_Vuna_dCore_dTBool (b) -> C_Vuna_dResult_dOk (0)
  | C_Vuna_dCore_dTIf (c, th, el) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dcheckErasure typeNames binders c) (fun _u -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dcheckErasure typeNames binders th) (fun _u -> v_Vuna_dCoreCodegen_dcheckErasure typeNames binders el))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 52 3 ("case pattern match failure"))

let rec v_Vuna_dCoreCodegen_dcheckAllErasure = fun a0 a1 -> match (a0, a1) with
  | (typeNames, []) -> C_Vuna_dResult_dOk (0)
  | (typeNames, (d) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dcheckErasure typeNames [] (v_Vuna_dElab_ddtDefBody d)) (fun _u -> v_Vuna_dCoreCodegen_dcheckAllErasure typeNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 45 1 ("no matching clause for Vuna.CoreCodegen.checkAllErasure")

let rec v_Vuna_dCoreCodegen_daddName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> (name) :: ([])
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then (x) :: (rest) else (x) :: (v_Vuna_dCoreCodegen_daddName name rest)
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 102 1 ("no matching clause for Vuna.CoreCodegen.addName")

let rec v_Vuna_dCoreCodegen_dtermDepsInto = fun runtimeNames acc t -> (match t with
  | C_Vuna_dCore_dTGlobal (name) -> if v_Vuna_dList_dmemName name runtimeNames then v_Vuna_dCoreCodegen_daddName name acc else acc
  | C_Vuna_dCore_dTVar (name, i) -> acc
  | C_Vuna_dCore_dTMeta (m) -> acc
  | C_Vuna_dCore_dTType (n) -> acc
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> acc
  | C_Vuna_dCore_dTLam (name, erased, body) -> v_Vuna_dCoreCodegen_dtermDepsInto runtimeNames acc body
  | C_Vuna_dCore_dTApp (f, a, erased) -> if erased then v_Vuna_dCoreCodegen_dtermDepsInto runtimeNames acc f else v_Vuna_dCoreCodegen_dtermDepsInto runtimeNames (v_Vuna_dCoreCodegen_dtermDepsInto runtimeNames acc f) a
  | C_Vuna_dCore_dTInt (n) -> acc
  | C_Vuna_dCore_dTStr (s) -> acc
  | C_Vuna_dCore_dTBool (b) -> acc
  | C_Vuna_dCore_dTIf (c, th, el) -> v_Vuna_dCoreCodegen_dtermDepsInto runtimeNames (v_Vuna_dCoreCodegen_dtermDepsInto runtimeNames (v_Vuna_dCoreCodegen_dtermDepsInto runtimeNames acc c) th) el
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 85 3 ("case pattern match failure"))

let rec v_Vuna_dCoreCodegen_druntimeNamesOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (v_Vuna_dElab_ddtDefName d) :: (v_Vuna_dCoreCodegen_druntimeNamesOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 106 1 ("no matching clause for Vuna.CoreCodegen.runtimeNamesOf")

let v_Vuna_dCoreCodegen_dlookupDtDef = fun defs name -> v_Vuna_dCoreCodegen_dfindDtDef name defs

let rec v_Vuna_dCoreCodegen_dvisitMany = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (defs, [], stack, visited, order) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (visited, order))
  | (defs, (name) :: (rest), stack, visited, order) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dvisitOne defs name stack visited order) (fun p -> (match p with
  | C_Vuna_dPair_dPair (visited2, order2) -> v_Vuna_dCoreCodegen_dvisitMany defs rest stack visited2 order2
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 124 5 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 121 1 ("no matching clause for Vuna.CoreCodegen.visitMany")
and v_Vuna_dCoreCodegen_dvisitOne = fun defs name stack visited order -> if v_Vuna_dList_dmemName name visited then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (visited, order)) else if v_Vuna_dList_dmemName name stack then C_Vuna_dResult_dErr ((let vuna_cat0' = ("DT: definition ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" is recursive (not supported until M14/M16)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else (match v_Vuna_dCoreCodegen_dlookupDtDef defs name with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ((name) :: (visited), order))
  | C_Vuna_dMaybe_dJust (d) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dvisitMany defs (v_Vuna_dCoreCodegen_dtermDepsInto (v_Vuna_dCoreCodegen_druntimeNamesOf defs) [] (v_Vuna_dElab_ddtDefBody d)) ((name) :: (stack)) visited order) (fun p -> (match p with
  | C_Vuna_dPair_dPair (visited2, order2) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ((name) :: (visited2), (d) :: (order2)))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 137 11 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 133 5 ("case pattern match failure"))

let v_Vuna_dCoreCodegen_dtopoSortDefs = fun defs -> (let runtimeNames = v_Vuna_dCoreCodegen_druntimeNamesOf defs in v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dvisitMany defs runtimeNames [] [] []) (fun p -> (match p with
  | C_Vuna_dPair_dPair (visited, order) -> C_Vuna_dResult_dOk (v_Vuna_dList_dreverse order)
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 116 8 ("case pattern match failure"))))

let v_Vuna_dCoreCodegen_dprepareDtProgram = fun defs -> (let table = v_Vuna_dCoreCodegen_ddefTable defs in (match v_Vuna_dCoreCodegen_dpartitionDefs table defs with
  | C_Vuna_dPair_dPair (runtime, typeNames) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dcheckAllErasure typeNames runtime) (fun _u -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dtopoSortDefs runtime) (fun sorted -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (sorted, typeNames))))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 144 6 ("case pattern match failure")))

let v_Vuna_dCoreCodegen_dcheckDtProgram = fun defs -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dprepareDtProgram defs) (fun p -> C_Vuna_dResult_dOk (0))

let v_Vuna_dCoreCodegen_dsanitizeChar = fun c -> if v_vuna_ueq_uint c 46 then (95) :: ((100) :: ([])) else if v_vuna_ueq_uint c 95 then (95) :: ((117) :: ([])) else if v_vuna_ueq_uint c 39 then (95) :: ((112) :: ([])) else (c) :: ([])

let v_Vuna_dCoreCodegen_dsanitizeName = fun name -> bi_str_pack (v_Vuna_dList_dconcatMap v_Vuna_dCoreCodegen_dsanitizeChar (bi_str_unpack name))

let v_Vuna_dCoreCodegen_docamlPad3 = fun s -> if v_vuna_ueq_uint (bi_str_length s) 1 then (("00") ^ (s)) else if v_vuna_ueq_uint (bi_str_length s) 2 then (("0") ^ (s)) else s

let v_Vuna_dCoreCodegen_docamlEscapeChar = fun c -> if v_vuna_ueq_uint c 34 then (92) :: ((34) :: ([])) else if v_vuna_ueq_uint c 92 then (92) :: ((92) :: ([])) else if v_vuna_ueq_uint c 10 then (92) :: ((110) :: ([])) else if v_vuna_ueq_uint c 9 then (92) :: ((116) :: ([])) else if v_vuna_ueq_uint c 13 then (92) :: ((114) :: ([])) else if (if (v_vuna_uge_uint c 32) then (v_vuna_ule_uint c 126) else false) then (c) :: ([]) else bi_str_unpack ((("\\") ^ (v_Vuna_dCoreCodegen_docamlPad3 (bi_str_from_int c))))

let v_Vuna_dCoreCodegen_docamlString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (bi_str_pack (v_Vuna_dList_dconcatMap v_Vuna_dCoreCodegen_docamlEscapeChar (bi_str_unpack s))) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCoreCodegen_dvalueName = fun name -> (("v_") ^ (v_Vuna_dCoreCodegen_dsanitizeName name))

let v_Vuna_dCoreCodegen_ddtRuntime = "let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b
let bi_eq_int (a : int) (b : int) = a = b
let bi_neq_int (a : int) (b : int) = a <> b
let bi_lt_int (a : int) (b : int) = a < b
let bi_le_int (a : int) (b : int) = a <= b
let bi_gt_int (a : int) (b : int) = a > b
let bi_ge_int (a : int) (b : int) = a >= b
let bi_concat a b = a ^ b
let bi_and a b = a && b
let bi_or a b = a || b
let dt_show_bool b = if b then \"True\" else \"False\"
let dt_show_string s =
  let buf = Buffer.create 16 in
  Buffer.add_char buf (Char.chr 34);
  String.iter (fun c ->
    let n = Char.code c in
    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))
    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))
    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")
    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")
    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")
    else Buffer.add_char buf c) s;
  Buffer.add_char buf (Char.chr 34);
  Buffer.contents buf
"

let v_Vuna_dCoreCodegen_dglobalRef = fun name -> (match name with
  | "True" -> C_Vuna_dResult_dOk ("true")
  | "False" -> C_Vuna_dResult_dOk ("false")
  | "+" -> C_Vuna_dResult_dOk ("bi_add")
  | "-" -> C_Vuna_dResult_dOk ("bi_sub")
  | "*" -> C_Vuna_dResult_dOk ("bi_mul")
  | "/" -> C_Vuna_dResult_dOk ("bi_div")
  | "==" -> C_Vuna_dResult_dOk ("bi_eq_int")
  | "/=" -> C_Vuna_dResult_dOk ("bi_neq_int")
  | "<" -> C_Vuna_dResult_dOk ("bi_lt_int")
  | "<=" -> C_Vuna_dResult_dOk ("bi_le_int")
  | ">" -> C_Vuna_dResult_dOk ("bi_gt_int")
  | ">=" -> C_Vuna_dResult_dOk ("bi_ge_int")
  | "++" -> C_Vuna_dResult_dOk ("bi_concat")
  | "&&" -> C_Vuna_dResult_dOk ("bi_and")
  | "||" -> C_Vuna_dResult_dOk ("bi_or")
  | _ -> C_Vuna_dResult_dOk (v_Vuna_dCoreCodegen_dvalueName name)
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 223 3 ("case pattern match failure"))

let rec v_Vuna_dCoreCodegen_dgenTerm = fun t -> (match t with
  | C_Vuna_dCore_dTVar (name, i) -> C_Vuna_dResult_dOk (v_Vuna_dCoreCodegen_dsanitizeName name)
  | C_Vuna_dCore_dTGlobal (name) -> v_Vuna_dCoreCodegen_dglobalRef name
  | C_Vuna_dCore_dTInt (n) -> C_Vuna_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dCore_dTStr (s) -> C_Vuna_dResult_dOk (v_Vuna_dCoreCodegen_docamlString s)
  | C_Vuna_dCore_dTBool (b) -> C_Vuna_dResult_dOk (if b then "true" else "false")
  | C_Vuna_dCore_dTIf (c, th, el) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenTerm c) (fun gc -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenTerm th) (fun gt -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenTerm el) (fun ge -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(if ") in (let vuna_cat1' = (gc) in (let vuna_cat2' = (" then ") in (let vuna_cat3' = (gt) in (let vuna_cat4' = (" else ") in (let vuna_cat5' = (ge) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))))))
  | C_Vuna_dCore_dTLam (name, erased, body) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenTerm body) (fun b -> if erased then C_Vuna_dResult_dOk (b) else C_Vuna_dResult_dOk ((let vuna_cat0' = ("(fun ") in (let vuna_cat1' = (v_Vuna_dCoreCodegen_dsanitizeName name) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | C_Vuna_dCore_dTApp (f, a, erased) -> if erased then v_Vuna_dCoreCodegen_dgenTerm f else v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenTerm f) (fun fs -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenTerm a) (fun argText -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (fs) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (argText) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> C_Vuna_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCore_dTType (n) -> C_Vuna_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCore_dTMeta (m) -> C_Vuna_dResult_dErr ("DT: unsolved metavariable in runtime code")
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 243 3 ("case pattern match failure"))

let v_Vuna_dCoreCodegen_dgenDef = fun d -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenTerm (v_Vuna_dElab_ddtDefBody d)) (fun body -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("let ") in (let vuna_cat1' = (v_Vuna_dCoreCodegen_dvalueName (v_Vuna_dElab_ddtDefName d)) in (let vuna_cat2' = (" = ") in (let vuna_cat3' = (body) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))

let rec v_Vuna_dCoreCodegen_dgenDefs = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dResult_dOk ([])
  | ((d) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenDef d) (fun g -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenDefs rest) (fun gs -> C_Vuna_dResult_dOk ((g) :: (gs))))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 271 1 ("no matching clause for Vuna.CoreCodegen.genDefs")

let rec v_Vuna_dCoreCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Vuna_dCoreCodegen_djoinWith sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 277 1 ("no matching clause for Vuna.CoreCodegen.joinWith")

let v_Vuna_dCoreCodegen_dmainShowErr = C_Vuna_dResult_dErr ("DT: main must return Int, String or Bool (M13 limitation)")

let v_Vuna_dCoreCodegen_dmainShowForName = fun g -> (match g with
  | "Int" -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ("string_of_int", "int"))
  | "String" -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ("dt_show_string", "string"))
  | "Bool" -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ("dt_show_bool", "bool"))
  | _ -> v_Vuna_dCoreCodegen_dmainShowErr
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 293 3 ("case pattern match failure"))

let v_Vuna_dCoreCodegen_dmainShow = fun table tyTerm -> (match v_Vuna_dCore_dforce table [] v_Vuna_dCore_ddefaultFuel (v_Vuna_dCore_deval [] tyTerm) with
  | C_Vuna_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCore_dNGlobal (g, []) -> v_Vuna_dCoreCodegen_dmainShowForName g
  | _ -> v_Vuna_dCoreCodegen_dmainShowErr
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 286 7 ("case pattern match failure"))
  | _ -> v_Vuna_dCoreCodegen_dmainShowErr
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 284 3 ("case pattern match failure"))

let v_Vuna_dCoreCodegen_dgenerateDtProgram = fun defs printResult -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dprepareDtProgram defs) (fun p -> (match p with
  | C_Vuna_dPair_dPair (sorted, typeNames) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dgenDefs sorted) (fun bodies -> (match v_Vuna_dCoreCodegen_dfindDtDef "main" sorted with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("DT: no main definition")
  | C_Vuna_dMaybe_dJust (mainDef) -> v_Vuna_dResult_dandThen (v_Vuna_dCoreCodegen_dmainShow (v_Vuna_dCoreCodegen_ddefTable defs) (v_Vuna_dElab_ddtDefType mainDef)) (fun showPair -> (match showPair with
  | C_Vuna_dPair_dPair (showFn, kind) -> (let mainRef = v_Vuna_dCoreCodegen_dvalueName "main" in let hook = if printResult then (let vuna_cat0' = ("let () = print_endline (") in (let vuna_cat1' = (showFn) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (mainRef) in (let vuna_cat4' = ("))\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (mainRef) in (let vuna_cat2' = (")\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in let body = v_Vuna_dCoreCodegen_djoinWith "\n\n" bodies in C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCoreCodegen_ddtRuntime) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (body) in (let vuna_cat3' = ("\n") in (let vuna_cat4' = (hook) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 312 17 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 308 11 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/CoreCodegen.vuna" 305 5 ("case pattern match failure")))
