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
type   t_Vuna_dCompiler_dTypedCodegen_dSplitCtx =
    C_Vuna_dCompiler_dTypedCodegen_dSplitCtx of ((t_Vuna_dCompiler_dLoader_dModule) list) * ((t_Vuna_dCompiler_dAst_dDecl) list) * ((t_Vuna_dCompiler_dAst_dDecl) list) * (((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) * (((string, string) t_Base_dPair_dPair) list) * ((string) list) * ((string) list) * ((string) list) * (((string, string) t_Base_dPair_dPair) list) * (((string, string) t_Base_dPair_dPair) list)
let show_Vuna_dCompiler_dTypedCodegen_dSplitCtx v =
  match v with
  | C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (f0, f1, f2, f3, f4, f5, f6, f7, f8, f9) -> show_ctor "SplitCtx" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dLoader_dModule) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dTypecheck_dScheme)) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f4; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f5; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f6; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f7; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f8; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f9]
let v_Vuna_dCompiler_dTypedCodegen_dsanitizeChar = fun c -> if v_vuna_ueq_uint c 46 then (95) :: ((100) :: ([])) else if v_vuna_ueq_uint c 95 then (95) :: ((117) :: ([])) else if v_vuna_ueq_uint c 39 then (95) :: ((112) :: ([])) else (c) :: ([])

let v_Vuna_dCompiler_dTypedCodegen_dsanitizeName = fun name -> bi_str_pack (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dsanitizeChar (bi_str_unpack name))

let v_Vuna_dCompiler_dTypedCodegen_docamlPad3 = fun s -> if v_vuna_ueq_uint (bi_str_length s) 1 then (("00") ^ (s)) else if v_vuna_ueq_uint (bi_str_length s) 2 then (("0") ^ (s)) else s

let v_Vuna_dCompiler_dTypedCodegen_docamlEscapeChar = fun c -> if v_vuna_ueq_uint c 34 then (92) :: ((34) :: ([])) else if v_vuna_ueq_uint c 92 then (92) :: ((92) :: ([])) else if v_vuna_ueq_uint c 10 then (92) :: ((110) :: ([])) else if v_vuna_ueq_uint c 9 then (92) :: ((116) :: ([])) else if v_vuna_ueq_uint c 13 then (92) :: ((114) :: ([])) else if (if (v_vuna_uge_uint c 32) then (v_vuna_ule_uint c 126) else false) then (c) :: ([]) else bi_str_unpack ((("\\") ^ (v_Vuna_dCompiler_dTypedCodegen_docamlPad3 (bi_str_from_int c))))

let v_Vuna_dCompiler_dTypedCodegen_docamlString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (bi_str_pack (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_docamlEscapeChar (bi_str_unpack s))) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dCompiler_dTypedCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 31 1 ("no matching clause for Vuna.Compiler.TypedCodegen.joinWith")

let v_Vuna_dCompiler_dTypedCodegen_dlastName = fun name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (rev, base) -> base
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 35 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_disBoolName = fun name -> v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_dlastName name) "Bool"

let v_Vuna_dCompiler_dTypedCodegen_disListName = fun name -> v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_dlastName name) "List"

let v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf = fun name -> (("t_") ^ (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name))

let v_Vuna_dCompiler_dTypedCodegen_dctorNameOf = fun name -> (("C_") ^ (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name))

let v_Vuna_dCompiler_dTypedCodegen_dvalueName = fun name -> (("v_") ^ (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name))

let v_Vuna_dCompiler_dTypedCodegen_dshowNameOf = fun name -> (("show_") ^ (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name))

let v_Vuna_dCompiler_dTypedCodegen_dparamVar = fun i -> (("'p") ^ (bi_str_from_int i))

let v_Vuna_dCompiler_dTypedCodegen_dshowParamVar = fun i -> (("s") ^ (bi_str_from_int i))

let rec v_Vuna_dCompiler_dTypedCodegen_dparamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Base_dPair_dPair (p, v_Vuna_dCompiler_dTypedCodegen_dparamVar i)) :: (v_Vuna_dCompiler_dTypedCodegen_dparamMapAt rest (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 54 1 ("no matching clause for Vuna.Compiler.TypedCodegen.paramMapAt")

let v_Vuna_dCompiler_dTypedCodegen_dparamMap = fun params -> v_Vuna_dCompiler_dTypedCodegen_dparamMapAt params 0

let rec v_Vuna_dCompiler_dTypedCodegen_dshowParamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Base_dPair_dPair (p, v_Vuna_dCompiler_dTypedCodegen_dshowParamVar i)) :: (v_Vuna_dCompiler_dTypedCodegen_dshowParamMapAt rest (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 59 1 ("no matching clause for Vuna.Compiler.TypedCodegen.showParamMapAt")

let v_Vuna_dCompiler_dTypedCodegen_dshowParamMap = fun params -> v_Vuna_dCompiler_dTypedCodegen_dshowParamMapAt params 0

let rec v_Vuna_dCompiler_dTypedCodegen_dlookupParam = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, v)) :: (rest)) -> if v_vuna_ueq_ugeneric n name then C_Base_dMaybe_dJust (v) else v_Vuna_dCompiler_dTypedCodegen_dlookupParam name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 64 1 ("no matching clause for Vuna.Compiler.TypedCodegen.lookupParam")

let rec v_Vuna_dCompiler_dTypedCodegen_ddataDecls = fun decls -> (match decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, _, _) -> (d) :: (v_Vuna_dCompiler_dTypedCodegen_ddataDecls rest)
  | _ -> v_Vuna_dCompiler_dTypedCodegen_ddataDecls rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 69 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 67 19 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData = fun decls -> (match v_Vuna_dCompiler_dTypedCodegen_ddataDecls decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, _, _) -> if (if (v_Vuna_dCompiler_dTypedCodegen_disBoolName name) then true else (v_Vuna_dCompiler_dTypedCodegen_disListName name)) then v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData rest else (d) :: (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData rest)
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 75 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 73 24 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dlookupData = fun decls name -> (match decls with
  | [] -> C_Base_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dn, ps, kind, cs, _, _) -> if v_vuna_ueq_ustr dn name then C_Base_dMaybe_dJust (d) else v_Vuna_dCompiler_dTypedCodegen_dlookupData rest name
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dlookupData rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 82 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 80 25 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dmapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Base_dResult_dOk ([])
  | (f, (x) :: (rest)) -> v_Base_dResult_dandThen (f x) (fun y -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult f rest) (fun ys -> C_Base_dResult_dOk ((y) :: (ys))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 86 1 ("no matching clause for Vuna.Compiler.TypedCodegen.mapResult")

let v_Vuna_dCompiler_dTypedCodegen_dappType = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> name
  | ((x) :: ([]), name) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (x) in (let vuna_cat2' = (") ") in (let vuna_cat3' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | (args, name) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " args) in (let vuna_cat2' = (") ") in (let vuna_cat3' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 116 1 ("no matching clause for Vuna.Compiler.TypedCodegen.appType")

let rec v_Vuna_dCompiler_dTypedCodegen_docamlType = fun decls params expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr name "Int" then C_Base_dResult_dOk ("int") else if v_vuna_ueq_ustr name "String" then C_Base_dResult_dOk ("string") else if v_Vuna_dCompiler_dTypedCodegen_disBoolName name then C_Base_dResult_dOk ("bool") else if v_Vuna_dCompiler_dTypedCodegen_disListName name then C_Base_dResult_dErr ("List type needs an argument") else (match v_Vuna_dCompiler_dTypedCodegen_dlookupParam name params with
  | C_Base_dMaybe_dJust (ty) -> C_Base_dResult_dOk (ty)
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypedCodegen_dlookupData decls name with
  | C_Base_dMaybe_dJust (d) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf name)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("typed codegen: unknown type ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 96 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 94 8 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_docamlType decls params a) (fun ta -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_docamlType decls params b) (fun tb -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") -> (") in (let vuna_cat3' = (tb) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Base_dResult_dErr ("typed codegen: invalid arrow type")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 100 20 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_Vuna_dCompiler_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_docamlType decls params a) (fun ta -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") list") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Base_dResult_dErr ("typed codegen: invalid List type")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 105 44 ("case pattern match failure")) else (match v_Vuna_dCompiler_dTypedCodegen_dlookupData decls name with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("typed codegen: unknown type constructor ") ^ (name)))
  | C_Base_dMaybe_dJust (d) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_docamlType decls params) args) (fun tys -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dappType tys (v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 108 10 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("typed codegen: invalid type application")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 99 21 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("typed codegen: invalid type expression")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 89 31 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dsplitArrows = fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (a) :: (v_Vuna_dCompiler_dTypedCodegen_dsplitArrows b)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 120 20 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_drange = fun i n -> if v_vuna_uge_uint i n then [] else (i) :: (v_Vuna_dCompiler_dTypedCodegen_drange (bi_add i 1) n)

let v_Vuna_dCompiler_dTypedCodegen_dgenParams = fun n -> v_Base_dList_dmap (fun i -> (("a") ^ (bi_str_from_int i))) (v_Vuna_dCompiler_dTypedCodegen_drange 0 n)

let rec v_Vuna_dCompiler_dTypedCodegen_dparamVarsAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (v_Vuna_dCompiler_dTypedCodegen_dparamVar i) :: (v_Vuna_dCompiler_dTypedCodegen_dparamVarsAt rest (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 137 1 ("no matching clause for Vuna.Compiler.TypedCodegen.paramVarsAt")

let v_Vuna_dCompiler_dTypedCodegen_dparamVars = fun params -> v_Vuna_dCompiler_dTypedCodegen_dparamVarsAt params 0

let v_Vuna_dCompiler_dTypedCodegen_ddataPrefix = fun params -> (match params with
  | [] -> ""
  | (p) :: ([]) -> ((v_Vuna_dCompiler_dTypedCodegen_dparamVar 0) ^ (" "))
  | _ -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " (v_Vuna_dCompiler_dTypedCodegen_dparamVars params)) in (let vuna_cat2' = (") ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 132 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dCompiler_dAst_dCtor (name, ty, arity, _)) -> (match v_Vuna_dCompiler_dTypedCodegen_dsplitArrows ty with
  | [] -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name)
  | (only) :: ([]) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_docamlType decls pmap only) (fun t -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" of (") in (let vuna_cat2' = (t) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | fields -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_docamlType decls pmap) fields) (fun ts -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" of ") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " * " (v_Base_dList_dmap (fun t -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (t) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) ts)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 142 45 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 142 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genCtor")

let v_Vuna_dCompiler_dTypedCodegen_dgenData = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, _, _)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenCtor decls (v_Vuna_dCompiler_dTypedCodegen_dparamMap params)) ctors) (fun cs -> C_Base_dResult_dOk ((let vuna_cat0' = ("  ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_ddataPrefix params) in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf name) in (let vuna_cat3' = (" =\n    ") in (let vuna_cat4' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\n  | " cs) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 128 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genData")

let v_Vuna_dCompiler_dTypedCodegen_dgenTypeDeclsOf = fun decls ds -> (match ds with
  | [] -> C_Base_dResult_dOk ("")
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenData decls) ds) (fun parts -> C_Base_dResult_dOk ((let vuna_cat0' = ("type ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\nand " parts) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 151 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenTypeDecls = fun decls -> v_Vuna_dCompiler_dTypedCodegen_dgenTypeDeclsOf decls (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData decls)

let rec v_Vuna_dCompiler_dTypedCodegen_dshowForType = fun decls params expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr name "Int" then C_Base_dResult_dOk ("string_of_int") else if v_vuna_ueq_ustr name "String" then C_Base_dResult_dOk ("show_vstring") else if v_Vuna_dCompiler_dTypedCodegen_disBoolName name then C_Base_dResult_dOk ("show_vbool") else if v_Vuna_dCompiler_dTypedCodegen_disListName name then C_Base_dResult_dErr ("typed codegen: List type needs an argument") else (match v_Vuna_dCompiler_dTypedCodegen_dlookupParam name params with
  | C_Base_dMaybe_dJust (s) -> C_Base_dResult_dOk (s)
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypedCodegen_dlookupData decls name with
  | C_Base_dMaybe_dJust (d) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dshowNameOf name)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("typed codegen: unknown show type ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 164 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 162 8 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar ("->", _) -> C_Base_dResult_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_Vuna_dCompiler_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dshowForType decls params a) (fun sa -> C_Base_dResult_dOk ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (") in (let vuna_cat1' = (sa) in (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Base_dResult_dErr ("typed codegen: invalid List show type")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 169 44 ("case pattern match failure")) else (match v_Vuna_dCompiler_dTypedCodegen_dlookupData decls name with
  | C_Base_dMaybe_dJust (d) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dshowForType decls params) args) (fun ss -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dshowNameOf name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " ss) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("typed codegen: unknown show type constructor ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 174 10 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("typed codegen: invalid show type application")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 167 21 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("typed codegen: invalid show type")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 157 33 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dshowForTy = fun decls ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> C_Base_dResult_dOk ("(fun _ -> \"<value>\")")
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> C_Base_dResult_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> (match head with
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, hargs) -> v_Vuna_dCompiler_dTypedCodegen_dshowForTy decls (C_Vuna_dCompiler_dTypecheck_dTCon (n, v_Base_dList_dappend hargs args))
  | _ -> C_Base_dResult_dErr ("typed codegen: main type has an unresolved type constructor")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 185 21 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTCon (name, args) -> if v_vuna_ueq_ustr name "Int" then C_Base_dResult_dOk ("string_of_int") else if v_vuna_ueq_ustr name "String" then C_Base_dResult_dOk ("show_vstring") else if v_Vuna_dCompiler_dTypedCodegen_disBoolName name then C_Base_dResult_dOk ("show_vbool") else if v_Vuna_dCompiler_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dshowForTy decls a) (fun sa -> C_Base_dResult_dOk ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (") in (let vuna_cat1' = (sa) in (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Base_dResult_dErr ("typed codegen: main List type must have one argument")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 191 32 ("case pattern match failure")) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dshowForTy decls) args) (fun ss -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dshowNameOf name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " ss) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 182 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dfieldVars = fun n -> v_Base_dList_dmap (fun i -> (("f") ^ (bi_str_from_int i))) (v_Vuna_dCompiler_dTypedCodegen_drange 0 n)

let rec v_Vuna_dCompiler_dTypedCodegen_dgenShowFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, pmap, [], []) -> C_Base_dResult_dOk ([])
  | (decls, pmap, (f) :: (fs), (v) :: (vs)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dshowForType decls pmap f) (fun s -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenShowFields decls pmap fs vs) (fun ss -> C_Base_dResult_dOk (((let vuna_cat0' = ("(") in (let vuna_cat1' = (s) in (let vuna_cat2' = (") ") in (let vuna_cat3' = (v) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (ss))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 201 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genShowFields")

let v_Vuna_dCompiler_dTypedCodegen_dgenShowCtorWith = fun decls pmap name fields -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenShowFields decls pmap fields (v_Vuna_dCompiler_dTypedCodegen_dfieldVars (v_Base_dList_dlength fields))) (fun shows -> (match v_Vuna_dCompiler_dTypedCodegen_dfieldVars (v_Base_dList_dlength fields) with
  | [] -> C_Base_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_docamlString (v_Vuna_dCompiler_dTypedCodegen_dlastName name)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | (v) :: ([]) -> C_Base_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v) in (let vuna_cat4' = (" -> show_ctor ") in (let vuna_cat5' = (v_Vuna_dCompiler_dTypedCodegen_docamlString (v_Vuna_dCompiler_dTypedCodegen_dlastName name)) in (let vuna_cat6' = (" [") in (let vuna_cat7' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "; " shows) in (let vuna_cat8' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8']))))))))))
  | vars -> C_Base_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " vars) in (let vuna_cat4' = (") -> show_ctor ") in (let vuna_cat5' = (v_Vuna_dCompiler_dTypedCodegen_docamlString (v_Vuna_dCompiler_dTypedCodegen_dlastName name)) in (let vuna_cat6' = (" [") in (let vuna_cat7' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "; " shows) in (let vuna_cat8' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8']))))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 208 123 ("case pattern match failure")))

let v_Vuna_dCompiler_dTypedCodegen_dgenShowCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dCompiler_dAst_dCtor (name, ty, arity, _)) -> v_Vuna_dCompiler_dTypedCodegen_dgenShowCtorWith decls pmap name (v_Vuna_dCompiler_dTypedCodegen_dsplitArrows ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 206 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genShowCtor")

let v_Vuna_dCompiler_dTypedCodegen_dshowAnnotation = fun params name -> (let vars = v_Vuna_dCompiler_dTypedCodegen_dparamVars params in (let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " vars) in (let vuna_cat1' = (". ") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " -> " (v_Base_dList_dappend (v_Base_dList_dmap (fun v -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v) in (let vuna_cat2' = (" -> string)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) vars) ((v_Vuna_dCompiler_dTypedCodegen_dappType vars (v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf name)) :: (("string") :: ([]))))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dCompiler_dTypedCodegen_dpairSecond = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (_, v)) -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 239 1 ("no matching clause for Vuna.Compiler.TypedCodegen.pairSecond")

let v_Vuna_dCompiler_dTypedCodegen_dgenShowBody = fun pmap params name arms -> (match v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dpairSecond pmap with
  | [] -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dshowNameOf name) in (let vuna_cat1' = (" v =\n  match v with\n") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\n" arms) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | pvars -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dshowNameOf name) in (let vuna_cat1' = (" : ") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_dshowAnnotation params name) in (let vuna_cat3' = (" = fun ") in (let vuna_cat4' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " (v_Base_dList_dappend pvars (("v") :: ([])))) in (let vuna_cat5' = (" -> match v with\n") in (let vuna_cat6' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\n" arms) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 226 37 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenShowFuncWith = fun decls pmap params name ctors -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenShowCtor decls pmap) ctors) (fun arms -> v_Vuna_dCompiler_dTypedCodegen_dgenShowBody pmap params name arms)

let v_Vuna_dCompiler_dTypedCodegen_dgenShowFunc = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, _, _)) -> v_Vuna_dCompiler_dTypedCodegen_dgenShowFuncWith decls (v_Vuna_dCompiler_dTypedCodegen_dshowParamMap params) params name ctors
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 218 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genShowFunc")

let v_Vuna_dCompiler_dTypedCodegen_dshowDeclFnName = fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> v_Vuna_dCompiler_dTypedCodegen_dshowNameOf name
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 241 20 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dshowFnNames = fun decls -> v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dshowDeclFnName (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData decls)

let rec v_Vuna_dCompiler_dTypedCodegen_dgenPat = fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPWild (_) -> C_Base_dResult_dOk ("_")
  | C_Vuna_dCompiler_dAst_dPVar (name, _) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name)
  | C_Vuna_dCompiler_dAst_dPInt (n, _) -> C_Base_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dCompiler_dAst_dPStr (s, _) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_docamlString s)
  | C_Vuna_dCompiler_dAst_dPCon (name, pats, _) -> (match name with
  | "Nil" -> C_Base_dResult_dOk ("[]")
  | "True" -> C_Base_dResult_dOk ("true")
  | "False" -> C_Base_dResult_dOk ("false")
  | "Cons" -> (match pats with
  | (h) :: ((t) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenPat h) (fun ph -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenPat t) (fun pt -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ph) in (let vuna_cat2' = (") :: (") in (let vuna_cat3' = (pt) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Base_dResult_dErr ("typed codegen: Cons pattern arity")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 287 15 ("case pattern match failure"))
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult v_Vuna_dCompiler_dTypedCodegen_dgenPat pats) (fun ps -> (match ps with
  | [] -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name)
  | (p) :: ([]) -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (p) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " ps) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 292 50 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 283 23 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 278 14 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dpatVars = fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPWild (_) -> []
  | C_Vuna_dCompiler_dAst_dPVar (name, _) -> (name) :: ([])
  | C_Vuna_dCompiler_dAst_dPInt (n, _) -> []
  | C_Vuna_dCompiler_dAst_dPStr (s, _) -> []
  | C_Vuna_dCompiler_dAst_dPCon (name, pats, _) -> v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dpatVars pats
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 298 15 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dconcatFlatten = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("++", _), (a) :: ((b) :: ([])), _) -> v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_dconcatFlatten a) (v_Vuna_dCompiler_dTypedCodegen_dconcatFlatten b)
  | _ -> (e) :: ([])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 340 19 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dnoLocSpan = C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)

let rec v_Vuna_dCompiler_dTypedCodegen_dfoldStringLiterals = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dCompiler_dAst_dEStr (s, _)) :: (rest)) -> (match v_Vuna_dCompiler_dTypedCodegen_dfoldStringLiterals rest with
  | (C_Vuna_dCompiler_dAst_dEStr (s2, _)) :: (rest2) -> (C_Vuna_dCompiler_dAst_dEStr (((s) ^ (s2)), v_Vuna_dCompiler_dTypedCodegen_dnoLocSpan)) :: (rest2)
  | folded -> (C_Vuna_dCompiler_dAst_dEStr (s, v_Vuna_dCompiler_dTypedCodegen_dnoLocSpan)) :: (folded)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 348 43 ("case pattern match failure"))
  | ((e) :: (rest)) -> (e) :: (v_Vuna_dCompiler_dTypedCodegen_dfoldStringLiterals rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 347 1 ("no matching clause for Vuna.Compiler.TypedCodegen.foldStringLiterals")

let v_Vuna_dCompiler_dTypedCodegen_dzeroArgBody = fun decls name -> (match v_Vuna_dCompiler_dAst_dfunArity name decls with
  | C_Base_dMaybe_dJust (0) -> (match v_Vuna_dCompiler_dAst_dclausesFor decls name with
  | (C_Base_dPair_dPair ([], body)) :: ([]) -> C_Base_dMaybe_dJust (body)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 355 13 ("case pattern match failure"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 354 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dallPureExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, seen, []) -> true
  | (decls, seen, (e) :: (rest)) -> (if (v_Vuna_dCompiler_dTypedCodegen_dpureExpr decls seen e) then (v_Vuna_dCompiler_dTypedCodegen_dallPureExpr decls seen rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 360 1 ("no matching clause for Vuna.Compiler.TypedCodegen.allPureExpr")
and v_Vuna_dCompiler_dTypedCodegen_dpureExpr = fun decls seen e -> (match e with
  | C_Vuna_dCompiler_dAst_dEInt (n, _) -> true
  | C_Vuna_dCompiler_dAst_dEStr (s, _) -> true
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_Base_dList_dmemName name seen then false else (match v_Vuna_dCompiler_dAst_dctorArity name decls with
  | C_Base_dMaybe_dJust (0) -> true
  | _ -> (match v_Vuna_dCompiler_dTypedCodegen_dzeroArgBody decls name with
  | C_Base_dMaybe_dJust (body) -> v_Vuna_dCompiler_dTypedCodegen_dpureExpr decls ((name) :: (seen)) body
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 369 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 367 8 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar ("++", _) -> (match v_Vuna_dCompiler_dTypedCodegen_dfoldStringLiterals (v_Vuna_dCompiler_dTypedCodegen_dconcatFlatten e) with
  | (C_Vuna_dCompiler_dAst_dEStr (_, _)) :: ([]) -> true
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dallPureExpr decls seen args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 373 20 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> (match v_Vuna_dCompiler_dAst_dctorArity name decls with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dTypedCodegen_dallPureExpr decls seen args
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 376 20 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 372 21 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 363 25 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_disPureZeroArg = fun decls name -> (match v_Vuna_dCompiler_dTypedCodegen_dzeroArgBody decls name with
  | C_Base_dMaybe_dJust (body) -> v_Vuna_dCompiler_dTypedCodegen_dpureExpr decls ((name) :: ([])) body
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 382 28 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dzeroArgRef = fun decls name -> if v_Vuna_dCompiler_dTypedCodegen_disPureZeroArg decls name then v_Vuna_dCompiler_dTypedCodegen_dvalueName name else ((v_Vuna_dCompiler_dTypedCodegen_dvalueName name) ^ (" ()"))

let v_Vuna_dCompiler_dTypedCodegen_dconcatBindingName = fun i -> (let vuna_cat0' = ("vuna_cat") in (let vuna_cat1' = (bi_str_from_int i) in (let vuna_cat2' = ("'") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dCompiler_dTypedCodegen_dwrapConcatBindings = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((C_Base_dPair_dPair (n, code)) :: (rest), body) -> (let vuna_cat0' = ("(let ") in (let vuna_cat1' = (n) in (let vuna_cat2' = (" = (") in (let vuna_cat3' = (code) in (let vuna_cat4' = (") in ") in (let vuna_cat5' = (v_Vuna_dCompiler_dTypedCodegen_dwrapConcatBindings rest body) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 396 1 ("no matching clause for Vuna.Compiler.TypedCodegen.wrapConcatBindings")

let v_Vuna_dCompiler_dTypedCodegen_dbuiltinName = fun a0 -> match a0 with
  | ("+") -> C_Base_dMaybe_dJust ("bi_add")
  | ("+") -> C_Base_dMaybe_dJust ("bi_add")
  | ("-") -> C_Base_dMaybe_dJust ("bi_sub")
  | ("*") -> C_Base_dMaybe_dJust ("bi_mul")
  | ("/") -> C_Base_dMaybe_dJust ("bi_div")
  | ("==") -> C_Base_dMaybe_dJust ("bi_eq")
  | ("/=") -> C_Base_dMaybe_dJust ("bi_neq")
  | ("<") -> C_Base_dMaybe_dJust ("bi_lt")
  | ("<=") -> C_Base_dMaybe_dJust ("bi_le")
  | (">") -> C_Base_dMaybe_dJust ("bi_gt")
  | (">=") -> C_Base_dMaybe_dJust ("bi_ge")
  | ("&&") -> C_Base_dMaybe_dJust ("bi_and")
  | ("||") -> C_Base_dMaybe_dJust ("bi_or")
  | ("++") -> C_Base_dMaybe_dJust ("bi_concat")
  | ("bi_show_string") -> C_Base_dMaybe_dJust ("bi_show_string")
  | ("bi_eq_generic") -> C_Base_dMaybe_dJust ("bi_eq_generic")
  | ("bi_neq_generic") -> C_Base_dMaybe_dJust ("bi_neq_generic")
  | ("bi_lt_generic") -> C_Base_dMaybe_dJust ("bi_lt_generic")
  | ("bi_le_generic") -> C_Base_dMaybe_dJust ("bi_le_generic")
  | ("bi_gt_generic") -> C_Base_dMaybe_dJust ("bi_gt_generic")
  | ("bi_ge_generic") -> C_Base_dMaybe_dJust ("bi_ge_generic")
  | ("bi_eq_int") -> C_Base_dMaybe_dJust ("bi_eq_int")
  | ("bi_neq_int") -> C_Base_dMaybe_dJust ("bi_neq_int")
  | ("bi_lt_int") -> C_Base_dMaybe_dJust ("bi_lt_int")
  | ("bi_le_int") -> C_Base_dMaybe_dJust ("bi_le_int")
  | ("bi_gt_int") -> C_Base_dMaybe_dJust ("bi_gt_int")
  | ("bi_ge_int") -> C_Base_dMaybe_dJust ("bi_ge_int")
  | ("bi_eq_str") -> C_Base_dMaybe_dJust ("bi_eq_str")
  | ("bi_neq_str") -> C_Base_dMaybe_dJust ("bi_neq_str")
  | ("bi_eq_bool") -> C_Base_dMaybe_dJust ("bi_eq_bool")
  | ("bi_neq_bool") -> C_Base_dMaybe_dJust ("bi_neq_bool")
  | ("strLength") -> C_Base_dMaybe_dJust ("bi_str_length")
  | ("strUnpack") -> C_Base_dMaybe_dJust ("bi_str_unpack")
  | ("strPack") -> C_Base_dMaybe_dJust ("bi_str_pack")
  | ("strFromInt") -> C_Base_dMaybe_dJust ("bi_str_from_int")
  | ("readFile") -> C_Base_dMaybe_dJust ("bi_read_file")
  | ("writeFile") -> C_Base_dMaybe_dJust ("bi_write_file")
  | ("print") -> C_Base_dMaybe_dJust ("bi_print")
  | ("getArgs") -> C_Base_dMaybe_dJust ("bi_get_args")
  | ("readLine") -> C_Base_dMaybe_dJust ("bi_read_line")
  | ("readDir") -> C_Base_dMaybe_dJust ("bi_read_dir")
  | ("isDirectory") -> C_Base_dMaybe_dJust ("bi_is_directory")
  | ("makeDir") -> C_Base_dMaybe_dJust ("bi_make_dir")
  | ("removeFile") -> C_Base_dMaybe_dJust ("bi_remove_file")
  | ("fileExists") -> C_Base_dMaybe_dJust ("bi_file_exists")
  | ("fileMtime") -> C_Base_dMaybe_dJust ("bi_file_mtime")
  | ("fileSize") -> C_Base_dMaybe_dJust ("bi_file_size")
  | ("exit") -> C_Base_dMaybe_dJust ("bi_exit")
  | ("prim_readFile") -> C_Base_dMaybe_dJust ("bi_read_file")
  | ("prim_writeFile") -> C_Base_dMaybe_dJust ("bi_write_file")
  | ("prim_print") -> C_Base_dMaybe_dJust ("bi_print")
  | ("prim_getArgs") -> C_Base_dMaybe_dJust ("bi_get_args")
  | ("prim_readLine") -> C_Base_dMaybe_dJust ("bi_read_line")
  | ("prim_readDir") -> C_Base_dMaybe_dJust ("bi_read_dir")
  | ("prim_isDirectory") -> C_Base_dMaybe_dJust ("bi_is_directory")
  | ("prim_makeDir") -> C_Base_dMaybe_dJust ("bi_make_dir")
  | ("prim_removeFile") -> C_Base_dMaybe_dJust ("bi_remove_file")
  | ("prim_fileExists") -> C_Base_dMaybe_dJust ("bi_file_exists")
  | ("prim_fileMtime") -> C_Base_dMaybe_dJust ("bi_file_mtime")
  | ("prim_fileSize") -> C_Base_dMaybe_dJust ("bi_file_size")
  | ("prim_exit") -> C_Base_dMaybe_dJust ("bi_exit")
  | ("prim_runIn") -> C_Base_dMaybe_dJust ("bi_run_in")
  | (_) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 410 1 ("no matching clause for Vuna.Compiler.TypedCodegen.builtinName")

let v_Vuna_dCompiler_dTypedCodegen_disAtomicExpr = fun decls env e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_Base_dList_dmemName name env then true else (match v_Vuna_dCompiler_dAst_dctorArity name decls with
  | C_Base_dMaybe_dJust (arity) -> if v_vuna_ueq_uint arity 0 then true else false
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypedCodegen_dbuiltinName name with
  | C_Base_dMaybe_dJust (ref) -> if (if ((if ((if (v_vuna_ueq_ustr name "getArgs") then true else (v_vuna_ueq_ustr name "readLine"))) then true else (v_vuna_ueq_ustr name "prim_getArgs"))) then true else (v_vuna_ueq_ustr name "prim_readLine")) then false else true
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dAst_dfunArity name decls with
  | C_Base_dMaybe_dJust (0) -> v_Vuna_dCompiler_dTypedCodegen_disPureZeroArg decls name
  | C_Base_dMaybe_dJust (_) -> true
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 318 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 314 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 312 8 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEInt (n, _) -> true
  | C_Vuna_dCompiler_dAst_dEStr (s, _) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 310 28 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dformatArg = fun decls env e code -> if v_Vuna_dCompiler_dTypedCodegen_disAtomicExpr decls env e then code else (let vuna_cat0' = ("(") in (let vuna_cat1' = (code) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dCompiler_dTypedCodegen_dapplyArgs = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], []) -> ""
  | (decls, env, (c) :: (cs), (e) :: (es)) -> (let vuna_cat0' = (" ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dformatArg decls env e c) in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_dapplyArgs decls env cs es) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | (decls, env, _, _) -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 328 1 ("no matching clause for Vuna.Compiler.TypedCodegen.applyArgs")

let v_Vuna_dCompiler_dTypedCodegen_dgenAppAware = fun decls env fn args fCode argCodes -> (let head = if v_Vuna_dCompiler_dTypedCodegen_disAtomicExpr decls env fn then fCode else (let vuna_cat0' = ("(") in (let vuna_cat1' = (fCode) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in ((head) ^ (v_Vuna_dCompiler_dTypedCodegen_dapplyArgs decls env argCodes args)))

let v_Vuna_dCompiler_dTypedCodegen_dgenCatchAll = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dCommon_dSpan (f, sl, sc, el, ec), msg) -> if v_vuna_ueq_uint sl 0 then (let vuna_cat0' = ("  | _ -> vuna_fail \"\" 0 0 (") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_docamlString msg) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else (let vuna_cat0' = ("  | _ -> vuna_fail ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_docamlString f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (bi_str_from_int sl) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (bi_str_from_int sc) in (let vuna_cat6' = (" (") in (let vuna_cat7' = (v_Vuna_dCompiler_dTypedCodegen_docamlString msg) in (let vuna_cat8' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 551 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genCatchAll")

let rec v_Vuna_dCompiler_dTypedCodegen_drecBindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPVar (name, _), _)) :: (rest)) -> (name) :: (v_Vuna_dCompiler_dTypedCodegen_drecBindNames rest)
  | ((C_Base_dPair_dPair (_, _)) :: (_)) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 571 1 ("no matching clause for Vuna.Compiler.TypedCodegen.recBindNames")

let v_Vuna_dCompiler_dTypedCodegen_disIrrefutable = fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (_, _) -> true
  | C_Vuna_dCompiler_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 592 19 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_disVarPattern = fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (_, _) -> true
  | C_Vuna_dCompiler_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 597 18 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dallVarPatterns = fun a0 -> match a0 with
  | ([]) -> true
  | ((p) :: (rest)) -> (if (v_Vuna_dCompiler_dTypedCodegen_disVarPattern p) then (v_Vuna_dCompiler_dTypedCodegen_dallVarPatterns rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 602 1 ("no matching clause for Vuna.Compiler.TypedCodegen.allVarPatterns")

let v_Vuna_dCompiler_dTypedCodegen_dpatParam = fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (name, _) -> v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name
  | _ -> "_"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 605 14 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dfunSpan = fun decls name -> (match decls with
  | [] -> v_Vuna_dCompiler_dTypedCodegen_dnoLocSpan
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then sp else v_Vuna_dCompiler_dTypedCodegen_dfunSpan rest name
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dfunSpan rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 612 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 610 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_ddeclFunName = fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, _) -> name
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 642 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_vuna_ueq_ustr name "" then v_Vuna_dCompiler_dTypedCodegen_duniqueNames rest else if v_Base_dList_dmemName name rest then v_Vuna_dCompiler_dTypedCodegen_duniqueNames rest else (name) :: (v_Vuna_dCompiler_dTypedCodegen_duniqueNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 646 1 ("no matching clause for Vuna.Compiler.TypedCodegen.uniqueNames")

let v_Vuna_dCompiler_dTypedCodegen_dfunctionNames = fun decls -> v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_ddeclFunName decls)

let rec v_Vuna_dCompiler_dTypedCodegen_dfilterNames = fun pred names -> (match names with
  | [] -> []
  | (n) :: (rest) -> if pred n then (n) :: (v_Vuna_dCompiler_dTypedCodegen_dfilterNames pred rest) else v_Vuna_dCompiler_dTypedCodegen_dfilterNames pred rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 652 26 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dnotIn = fun name names -> if v_Base_dList_dmemName name names then false else true

let rec v_Vuna_dCompiler_dTypedCodegen_dneighborsOf = fun adj name -> (match adj with
  | [] -> []
  | (C_Base_dPair_dPair (n, ns)) :: (rest) -> if v_vuna_ueq_ustr n name then ns else v_Vuna_dCompiler_dTypedCodegen_dneighborsOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 660 24 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_ddependentsOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (C_Base_dPair_dPair (n, ns)) :: (rest)) -> (let dep = v_Vuna_dCompiler_dTypedCodegen_ddependentsOf name rest in if v_Base_dList_dmemName name ns then (n) :: (dep) else dep)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 668 1 ("no matching clause for Vuna.Compiler.TypedCodegen.dependentsOf")

let v_Vuna_dCompiler_dTypedCodegen_dreverseAdj = fun names adj -> v_Base_dList_dmap (fun n -> C_Base_dPair_dPair (n, v_Vuna_dCompiler_dTypedCodegen_ddependentsOf n adj)) names

let rec v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsPost = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], visited, order) -> C_Base_dPair_dPair (visited, order)
  | (adj, (m) :: (rest), visited, order) -> if v_Base_dList_dmemName m visited then v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsPost adj rest visited order else (match v_Vuna_dCompiler_dTypedCodegen_ddfsPost adj m ((m) :: (visited)) order with
  | C_Base_dPair_dPair (visited2, order2) -> v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsPost adj rest visited2 order2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 680 6 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 678 1 ("no matching clause for Vuna.Compiler.TypedCodegen.foldNeighborsPost")
and v_Vuna_dCompiler_dTypedCodegen_ddfsPost = fun adj n visited order -> (match v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsPost adj (v_Vuna_dCompiler_dTypedCodegen_dneighborsOf adj n) visited order with
  | C_Base_dPair_dPair (visited2, order2) -> C_Base_dPair_dPair (visited2, (n) :: (order2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 684 31 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dpostOrder = fun adj nodes visited order -> (match nodes with
  | [] -> C_Base_dPair_dPair (visited, order)
  | (n) :: (rest) -> if v_Base_dList_dmemName n visited then v_Vuna_dCompiler_dTypedCodegen_dpostOrder adj rest visited order else (match v_Vuna_dCompiler_dTypedCodegen_ddfsPost adj n ((n) :: (visited)) order with
  | C_Base_dPair_dPair (visited2, order2) -> v_Vuna_dCompiler_dTypedCodegen_dpostOrder adj rest visited2 order2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 691 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 688 37 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsCollect = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (revAdj, [], visited, comp) -> C_Base_dPair_dPair (visited, comp)
  | (revAdj, (m) :: (rest), visited, comp) -> if v_Base_dList_dmemName m visited then v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsCollect revAdj rest visited comp else (match v_Vuna_dCompiler_dTypedCodegen_ddfsCollect revAdj m ((m) :: (visited)) comp with
  | C_Base_dPair_dPair (visited2, comp2) -> v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsCollect revAdj rest visited2 comp2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 697 6 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 695 1 ("no matching clause for Vuna.Compiler.TypedCodegen.foldNeighborsCollect")
and v_Vuna_dCompiler_dTypedCodegen_ddfsCollect = fun revAdj n visited comp -> (match v_Vuna_dCompiler_dTypedCodegen_dfoldNeighborsCollect revAdj (v_Vuna_dCompiler_dTypedCodegen_dneighborsOf revAdj n) visited comp with
  | C_Base_dPair_dPair (visited2, comp2) -> C_Base_dPair_dPair (visited2, (n) :: (comp2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 701 36 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dcollectComps = fun revAdj nodes visited comps -> (match nodes with
  | [] -> comps
  | (n) :: (rest) -> if v_Base_dList_dmemName n visited then v_Vuna_dCompiler_dTypedCodegen_dcollectComps revAdj rest visited comps else (match v_Vuna_dCompiler_dTypedCodegen_ddfsCollect revAdj n ((n) :: (visited)) [] with
  | C_Base_dPair_dPair (visited2, comp) -> v_Vuna_dCompiler_dTypedCodegen_dcollectComps revAdj rest visited2 ((comp) :: (comps))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 708 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 705 43 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dcomponentOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> C_Base_dMaybe_dNothing
  | ((g) :: (rest), name) -> if v_Base_dList_dmemName name g then C_Base_dMaybe_dJust (g) else v_Vuna_dCompiler_dTypedCodegen_dcomponentOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 712 1 ("no matching clause for Vuna.Compiler.TypedCodegen.componentOf")

let rec v_Vuna_dCompiler_dTypedCodegen_dgroupsFromCompsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (comps, allNames, [], emitted) -> []
  | (comps, allNames, (n) :: (rest), emitted) -> if v_Base_dList_dmemName n emitted then v_Vuna_dCompiler_dTypedCodegen_dgroupsFromCompsGo comps allNames rest emitted else (match v_Vuna_dCompiler_dTypedCodegen_dcomponentOf comps n with
  | C_Base_dMaybe_dJust (g) -> (v_Vuna_dCompiler_dTypedCodegen_dfilterNames (fun m -> v_Base_dList_dmemName m g) allNames) :: (v_Vuna_dCompiler_dTypedCodegen_dgroupsFromCompsGo comps allNames rest (v_Base_dList_dappend g emitted))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypedCodegen_dgroupsFromCompsGo comps allNames rest emitted
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 723 6 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 721 1 ("no matching clause for Vuna.Compiler.TypedCodegen.groupsFromCompsGo")

let v_Vuna_dCompiler_dTypedCodegen_dgroupsFromComps = fun comps names -> v_Vuna_dCompiler_dTypedCodegen_dgroupsFromCompsGo comps names names []

let v_Vuna_dCompiler_dTypedCodegen_dgroupDeps = fun adj group -> v_Vuna_dCompiler_dTypedCodegen_dfilterNames (fun n -> v_Vuna_dCompiler_dTypedCodegen_dnotIn n group) (v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypedCodegen_dneighborsOf adj) group))

let rec v_Vuna_dCompiler_dTypedCodegen_dallIn = fun names allowed -> (match names with
  | [] -> true
  | (n) :: (rest) -> if v_Base_dList_dmemName n allowed then v_Vuna_dCompiler_dTypedCodegen_dallIn rest allowed else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 734 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgroupReady = fun adj group emitted -> v_Vuna_dCompiler_dTypedCodegen_dallIn (v_Vuna_dCompiler_dTypedCodegen_dgroupDeps adj group) emitted

let rec v_Vuna_dCompiler_dTypedCodegen_dpickReadyAcc = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], before, emitted) -> C_Base_dMaybe_dNothing
  | (adj, (g) :: (rest), before, emitted) -> if v_Vuna_dCompiler_dTypedCodegen_dgroupReady adj g emitted then C_Base_dMaybe_dJust (C_Base_dPair_dPair (g, v_Base_dList_dappend (v_Base_dList_dreverse before) rest)) else v_Vuna_dCompiler_dTypedCodegen_dpickReadyAcc adj rest ((g) :: (before)) emitted
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 743 1 ("no matching clause for Vuna.Compiler.TypedCodegen.pickReadyAcc")

let v_Vuna_dCompiler_dTypedCodegen_dpickReady = fun adj groups emitted -> v_Vuna_dCompiler_dTypedCodegen_dpickReadyAcc adj groups [] emitted

let rec v_Vuna_dCompiler_dTypedCodegen_dorderGroupsAcc = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, [], emitted) -> C_Base_dResult_dOk ([])
  | (adj, remaining, emitted) -> (match v_Vuna_dCompiler_dTypedCodegen_dpickReady adj remaining emitted with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("typed codegen: dependency cycle between groups")
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (g, rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dorderGroupsAcc adj rest (v_Base_dList_dappend g emitted)) (fun tail -> C_Base_dResult_dOk ((g) :: (tail)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 751 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 750 1 ("no matching clause for Vuna.Compiler.TypedCodegen.orderGroupsAcc")

let v_Vuna_dCompiler_dTypedCodegen_dorderGroups = fun adj groups -> v_Vuna_dCompiler_dTypedCodegen_dorderGroupsAcc adj groups []

let rec v_Vuna_dCompiler_dTypedCodegen_dunionNames = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> if v_Base_dList_dmemName x ys then v_Vuna_dCompiler_dTypedCodegen_dunionNames rest ys else (x) :: (v_Vuna_dCompiler_dTypedCodegen_dunionNames rest ys)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 794 1 ("no matching clause for Vuna.Compiler.TypedCodegen.unionNames")

let rec v_Vuna_dCompiler_dTypedCodegen_dexprRefs = fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> (name) :: ([])
  | C_Vuna_dCompiler_dAst_dEInt (n, _) -> []
  | C_Vuna_dCompiler_dAst_dEStr (s, _) -> []
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, _) -> v_Vuna_dCompiler_dTypedCodegen_dunionNames (v_Vuna_dCompiler_dTypedCodegen_dexprRefs fn) (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dexprRefs args)
  | C_Vuna_dCompiler_dAst_dELam (params, body, _) -> v_Vuna_dCompiler_dTypedCodegen_dexprRefs body
  | C_Vuna_dCompiler_dAst_dELet (binds, body, _, _) -> v_Vuna_dCompiler_dTypedCodegen_dunionNames (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dbindRefs binds) (v_Vuna_dCompiler_dTypedCodegen_dexprRefs body)
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, _) -> v_Vuna_dCompiler_dTypedCodegen_dunionNames (v_Vuna_dCompiler_dTypedCodegen_dexprRefs scrut) (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_daltRefs alts)
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, _) -> v_Vuna_dCompiler_dTypedCodegen_dunionNames (v_Vuna_dCompiler_dTypedCodegen_dexprRefs c) (v_Vuna_dCompiler_dTypedCodegen_dunionNames (v_Vuna_dCompiler_dTypedCodegen_dexprRefs t) (v_Vuna_dCompiler_dTypedCodegen_dexprRefs e))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dCompiler_dTypedCodegen_dunionNames (v_Vuna_dCompiler_dTypedCodegen_dexprRefs dom) (v_Vuna_dCompiler_dTypedCodegen_dexprRefs cod)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 776 17 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypedCodegen_dbindRefs = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (pat, value)) -> v_Vuna_dCompiler_dTypedCodegen_dexprRefs value
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 788 1 ("no matching clause for Vuna.Compiler.TypedCodegen.bindRefs")
and v_Vuna_dCompiler_dTypedCodegen_daltRefs = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (pat, body)) -> v_Vuna_dCompiler_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 791 1 ("no matching clause for Vuna.Compiler.TypedCodegen.altRefs")

let v_Vuna_dCompiler_dTypedCodegen_dclauseRefs = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (pats, body)) -> v_Vuna_dCompiler_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 773 1 ("no matching clause for Vuna.Compiler.TypedCodegen.clauseRefs")

let v_Vuna_dCompiler_dTypedCodegen_dgenFunctionRefs = fun decls name -> v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dclauseRefs (v_Vuna_dCompiler_dAst_dclausesFor decls name))

let v_Vuna_dCompiler_dTypedCodegen_dgroupNeedsRec = fun decls group -> (match group with
  | [] -> false
  | (n) :: ([]) -> v_Base_dList_dmemName n (v_Vuna_dCompiler_dTypedCodegen_dgenFunctionRefs decls n)
  | _ -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 760 29 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_druntimePrelude = (C_Base_dPair_dPair ("vuna_fail", "let vuna_fail file line col msg =
  if line = 0 then failwith msg
  else failwith (file ^ \":\" ^ string_of_int line ^ \":\" ^ string_of_int col ^ \": \" ^ msg)
")) :: ((C_Base_dPair_dPair ("bi_add", "let bi_add a b = a + b\n")) :: ((C_Base_dPair_dPair ("bi_sub", "let bi_sub a b = a - b\n")) :: ((C_Base_dPair_dPair ("bi_mul", "let bi_mul a b = a * b\n")) :: ((C_Base_dPair_dPair ("bi_div", "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n")) :: ((C_Base_dPair_dPair ("bi_eq", "let bi_eq a b = a = b\n")) :: ((C_Base_dPair_dPair ("bi_neq", "let bi_neq a b = a <> b\n")) :: ((C_Base_dPair_dPair ("bi_lt", "let bi_lt a b = a < b\n")) :: ((C_Base_dPair_dPair ("bi_le", "let bi_le a b = a <= b\n")) :: ((C_Base_dPair_dPair ("bi_gt", "let bi_gt a b = a > b\n")) :: ((C_Base_dPair_dPair ("bi_ge", "let bi_ge a b = a >= b\n")) :: ((C_Base_dPair_dPair ("bi_eq_int", "let bi_eq_int (a : int) (b : int) = a = b\n")) :: ((C_Base_dPair_dPair ("bi_neq_int", "let bi_neq_int (a : int) (b : int) = a <> b\n")) :: ((C_Base_dPair_dPair ("bi_lt_int", "let bi_lt_int (a : int) (b : int) = a < b\n")) :: ((C_Base_dPair_dPair ("bi_le_int", "let bi_le_int (a : int) (b : int) = a <= b\n")) :: ((C_Base_dPair_dPair ("bi_gt_int", "let bi_gt_int (a : int) (b : int) = a > b\n")) :: ((C_Base_dPair_dPair ("bi_ge_int", "let bi_ge_int (a : int) (b : int) = a >= b\n")) :: ((C_Base_dPair_dPair ("bi_eq_str", "let bi_eq_str (a : string) (b : string) = a = b\n")) :: ((C_Base_dPair_dPair ("bi_neq_str", "let bi_neq_str (a : string) (b : string) = a <> b\n")) :: ((C_Base_dPair_dPair ("bi_eq_bool", "let bi_eq_bool (a : bool) (b : bool) = a = b\n")) :: ((C_Base_dPair_dPair ("bi_neq_bool", "let bi_neq_bool (a : bool) (b : bool) = a <> b\n")) :: ((C_Base_dPair_dPair ("bi_and", "let bi_and a b = a && b\n")) :: ((C_Base_dPair_dPair ("bi_or", "let bi_or a b = a || b\n")) :: ((C_Base_dPair_dPair ("bi_concat", "let bi_concat a b = a ^ b\n")) :: ((C_Base_dPair_dPair ("bi_str_length", "let bi_str_length a = String.length a\n")) :: ((C_Base_dPair_dPair ("bi_str_unpack", "let bi_str_unpack s =
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (Char.code s.[i] :: acc)
  in
  go (String.length s - 1) []
")) :: ((C_Base_dPair_dPair ("bi_str_pack", "let bi_str_pack cs =
  let buf = Buffer.create 16 in
  let rec go = function
    | [] -> ()
    | c :: rest -> Buffer.add_char buf (Char.chr c); go rest
  in
  go cs;
  Buffer.contents buf
")) :: ((C_Base_dPair_dPair ("bi_str_from_int", "let bi_str_from_int n = string_of_int n\n")) :: ((C_Base_dPair_dPair ("bi_read_file", "let bi_read_file path =
  try
    let ch = open_in_bin path in
    Fun.protect ~finally:(fun () -> close_in_noerr ch)
      (fun () -> really_input_string ch (in_channel_length ch))
  with Sys_error msg -> failwith (\"readFile: \" ^ msg)
")) :: ((C_Base_dPair_dPair ("bi_write_file", "let bi_write_file path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)
")) :: ((C_Base_dPair_dPair ("bi_print", "let bi_print s = print_string s; flush stdout; String.length s\n")) :: ((C_Base_dPair_dPair ("bi_file_exists", "let bi_file_exists path = Sys.file_exists path\n")) :: ((C_Base_dPair_dPair ("bi_file_mtime", "let bi_file_mtime path =
  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0
")) :: ((C_Base_dPair_dPair ("bi_file_size", "let bi_file_size path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n")) :: ((C_Base_dPair_dPair ("bi_exit", "let bi_exit n = exit n\n")) :: ((C_Base_dPair_dPair ("bi_run_in", "let bi_run_in dir args =
  let quote s = Filename.quote s in
  let cmd = String.concat \" \" (List.map quote args) in
  let old = Sys.getcwd () in
  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)
")) :: ((C_Base_dPair_dPair ("bi_get_args", "let bi_get_args () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
")) :: ((C_Base_dPair_dPair ("bi_read_line", "let bi_read_line () = try input_line stdin with End_of_file -> \"\"\n")) :: ((C_Base_dPair_dPair ("bi_read_dir", "let bi_read_dir path =
  try List.sort compare (Array.to_list (Sys.readdir path))
  with Sys_error msg -> failwith (\"readDir: \" ^ msg)
")) :: ((C_Base_dPair_dPair ("bi_is_directory", "let bi_is_directory path =
  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)
")) :: ((C_Base_dPair_dPair ("bi_make_dir", "let bi_make_dir path =
  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))
  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)
")) :: ((C_Base_dPair_dPair ("bi_remove_file", "let bi_remove_file path =
  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)
  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)
")) :: ((C_Base_dPair_dPair ("show_ctor", "let show_ctor name args = if args = [] then name else \"(\" ^ name ^ \" \" ^ String.concat \" \" args ^ \")\"
")) :: ((C_Base_dPair_dPair ("show_vbool", "let show_vbool b = if b then \"True\" else \"False\"\n")) :: ((C_Base_dPair_dPair ("show_vstring", "let show_vstring s =
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
")) :: ((C_Base_dPair_dPair ("bi_show_string", "let bi_show_string s = show_vstring s\n")) :: ((C_Base_dPair_dPair ("bi_eq_generic", "let bi_eq_generic (a : 'a) (b : 'a) = a = b\n")) :: ((C_Base_dPair_dPair ("bi_neq_generic", "let bi_neq_generic (a : 'a) (b : 'a) = a <> b\n")) :: ((C_Base_dPair_dPair ("bi_lt_generic", "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n")) :: ((C_Base_dPair_dPair ("bi_le_generic", "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n")) :: ((C_Base_dPair_dPair ("bi_gt_generic", "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n")) :: ((C_Base_dPair_dPair ("bi_ge_generic", "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n")) :: ((C_Base_dPair_dPair ("show_vlist", "let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =
  match v with
  | [] -> \"Nil\"
  | x :: xs -> \"(Cons \" ^ show_elem x ^ \" \" ^ show_vlist show_elem xs ^ \")\"
")) :: ([])))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dTypedCodegen_druntimeCodeTyped = fun () -> (("\n") ^ (v_Vuna_dCompiler_dTypedCodegen_djoinWith "" (v_Base_dList_dmap v_Base_dPair_dsecondOf v_Vuna_dCompiler_dTypedCodegen_druntimePrelude)))

let rec v_Vuna_dCompiler_dTypedCodegen_dstartsWith = fun a0 a1 -> match (a0, a1) with
  | ([], hay) -> true
  | ((c) :: (cs), []) -> false
  | ((c) :: (cs), (h) :: (hs)) -> if v_vuna_ueq_ugeneric c h then v_Vuna_dCompiler_dTypedCodegen_dstartsWith cs hs else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 876 1 ("no matching clause for Vuna.Compiler.TypedCodegen.startsWith")

let rec v_Vuna_dCompiler_dTypedCodegen_dcountName = fun a0 a1 -> match (a0, a1) with
  | (needle, []) -> 0
  | (needle, (c) :: (rest)) -> if v_Vuna_dCompiler_dTypedCodegen_dstartsWith needle ((c) :: (rest)) then bi_add 1 (v_Vuna_dCompiler_dTypedCodegen_dcountName needle (v_Base_dList_ddrop (v_Base_dList_dlength needle) ((c) :: (rest)))) else v_Vuna_dCompiler_dTypedCodegen_dcountName needle rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 254 1 ("no matching clause for Vuna.Compiler.TypedCodegen.countName")

let v_Vuna_dCompiler_dTypedCodegen_dselfRecursive = fun name code -> v_vuna_ugt_uint (v_Vuna_dCompiler_dTypedCodegen_dcountName (bi_str_unpack name) (bi_str_unpack code)) 1

let rec v_Vuna_dCompiler_dTypedCodegen_dcontainsName = fun a0 a1 -> match (a0, a1) with
  | (needle, []) -> false
  | (needle, (h) :: (hs)) -> if v_Vuna_dCompiler_dTypedCodegen_dstartsWith needle ((h) :: (hs)) then true else v_Vuna_dCompiler_dTypedCodegen_dcontainsName needle hs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 880 1 ("no matching clause for Vuna.Compiler.TypedCodegen.containsName")

let rec v_Vuna_dCompiler_dTypedCodegen_dcodeRefsOther = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (self, code, []) -> false
  | (self, code, (n) :: (rest)) -> if v_vuna_ueq_ustr n self then v_Vuna_dCompiler_dTypedCodegen_dcodeRefsOther self code rest else if v_Vuna_dCompiler_dTypedCodegen_dcontainsName (bi_str_unpack n) (bi_str_unpack code) then true else v_Vuna_dCompiler_dTypedCodegen_dcodeRefsOther self code rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 249 1 ("no matching clause for Vuna.Compiler.TypedCodegen.codeRefsOther")

let rec v_Vuna_dCompiler_dTypedCodegen_dpartsNeedRec = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], names) -> false
  | ((d) :: (ds), (code) :: (rest), names) -> if v_Vuna_dCompiler_dTypedCodegen_dcodeRefsOther (v_Vuna_dCompiler_dTypedCodegen_dshowDeclFnName d) code names then true else if v_Vuna_dCompiler_dTypedCodegen_dselfRecursive (v_Vuna_dCompiler_dTypedCodegen_dshowDeclFnName d) code then true else v_Vuna_dCompiler_dTypedCodegen_dpartsNeedRec ds rest names
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 262 1 ("no matching clause for Vuna.Compiler.TypedCodegen.partsNeedRec")

let v_Vuna_dCompiler_dTypedCodegen_dgenShowDeclsOf = fun decls ds -> (match ds with
  | [] -> C_Base_dResult_dOk ("")
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenShowFunc decls) ds) (fun parts -> (let names = v_Vuna_dCompiler_dTypedCodegen_dshowFnNames ds in C_Base_dResult_dOk ((let vuna_cat0' = (if v_Vuna_dCompiler_dTypedCodegen_dpartsNeedRec ds parts names then "let rec " else "let ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\nand " parts) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 269 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenShowDecls = fun decls -> v_Vuna_dCompiler_dTypedCodegen_dgenShowDeclsOf decls (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData decls)

let rec v_Vuna_dCompiler_dTypedCodegen_dfilterRuntime = fun a0 a1 -> match (a0, a1) with
  | ([], bodyChars) -> []
  | ((C_Base_dPair_dPair (name, chunk)) :: (rest), bodyChars) -> if v_Vuna_dCompiler_dTypedCodegen_dcontainsName (bi_str_unpack name) bodyChars then (C_Base_dPair_dPair (name, chunk)) :: (v_Vuna_dCompiler_dTypedCodegen_dfilterRuntime rest bodyChars) else v_Vuna_dCompiler_dTypedCodegen_dfilterRuntime rest bodyChars
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 883 1 ("no matching clause for Vuna.Compiler.TypedCodegen.filterRuntime")

let v_Vuna_dCompiler_dTypedCodegen_dchunkNameOf = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (n, c)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 888 1 ("no matching clause for Vuna.Compiler.TypedCodegen.chunkNameOf")

let v_Vuna_dCompiler_dTypedCodegen_dchunkTextOf = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (n, c)) -> c
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 890 1 ("no matching clause for Vuna.Compiler.TypedCodegen.chunkTextOf")

let v_Vuna_dCompiler_dTypedCodegen_dchunkNamesOf = fun chunks -> v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dchunkNameOf chunks

let v_Vuna_dCompiler_dTypedCodegen_dneededByChunks = fun chunks -> v_Base_dList_dconcatMap (fun ch -> v_Vuna_dCompiler_dTypedCodegen_dfilterNames (fun n -> v_Vuna_dCompiler_dTypedCodegen_dcontainsName (bi_str_unpack n) (bi_str_unpack (v_Vuna_dCompiler_dTypedCodegen_dchunkTextOf ch))) (v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dchunkNameOf v_Vuna_dCompiler_dTypedCodegen_druntimePrelude)) chunks

let rec v_Vuna_dCompiler_dTypedCodegen_dfilterNames2 = fun pred names all -> (match all with
  | [] -> []
  | (ch) :: (rest) -> if pred (v_Vuna_dCompiler_dTypedCodegen_dchunkNameOf ch) then (ch) :: (v_Vuna_dCompiler_dTypedCodegen_dfilterNames2 pred names rest) else v_Vuna_dCompiler_dTypedCodegen_dfilterNames2 pred names rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 907 31 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dmissingChunks = fun included -> v_Vuna_dCompiler_dTypedCodegen_dfilterNames2 (fun n -> (if (v_Vuna_dCompiler_dTypedCodegen_dnotIn n (v_Vuna_dCompiler_dTypedCodegen_dchunkNamesOf included)) then (v_Base_dList_dmemName n (v_Vuna_dCompiler_dTypedCodegen_dneededByChunks included)) else false)) (v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dchunkNameOf v_Vuna_dCompiler_dTypedCodegen_druntimePrelude) v_Vuna_dCompiler_dTypedCodegen_druntimePrelude

let rec v_Vuna_dCompiler_dTypedCodegen_dexpandRuntime = fun included -> (match v_Vuna_dCompiler_dTypedCodegen_dmissingChunks included with
  | [] -> included
  | missing -> v_Vuna_dCompiler_dTypedCodegen_dexpandRuntime (v_Base_dList_dappend included missing)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 899 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dkeepChunks = fun a0 a1 -> match (a0, a1) with
  | (names, []) -> []
  | (names, (ch) :: (rest)) -> if v_Base_dList_dmemName (v_Vuna_dCompiler_dTypedCodegen_dchunkNameOf ch) names then (ch) :: (v_Vuna_dCompiler_dTypedCodegen_dkeepChunks names rest) else v_Vuna_dCompiler_dTypedCodegen_dkeepChunks names rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 913 1 ("no matching clause for Vuna.Compiler.TypedCodegen.keepChunks")

let v_Vuna_dCompiler_dTypedCodegen_druntimeForBody = fun body -> if v_vuna_ugt_uint (bi_str_length body) 20000 then v_Vuna_dCompiler_dTypedCodegen_druntimeCodeTyped () else (let selected = v_Vuna_dCompiler_dTypedCodegen_dexpandRuntime (v_Vuna_dCompiler_dTypedCodegen_dfilterRuntime v_Vuna_dCompiler_dTypedCodegen_druntimePrelude (bi_str_unpack body)) in (("\n") ^ (v_Vuna_dCompiler_dTypedCodegen_djoinWith "" (v_Base_dList_dmap v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dTypedCodegen_dkeepChunks (v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dchunkNameOf selected) v_Vuna_dCompiler_dTypedCodegen_druntimePrelude)))))

let v_Vuna_dCompiler_dTypedCodegen_dindentSpaces = fun n -> v_Vuna_dCompiler_dTypedCodegen_djoinWith "" (v_Base_dList_dmap (fun _u -> " ") (v_Vuna_dCompiler_dTypedCodegen_drange 0 n))

let v_Vuna_dCompiler_dTypedCodegen_dindentWidth = fun depth -> if v_vuna_ugt_uint depth 12 then 24 else bi_mul depth 2

let v_Vuna_dCompiler_dTypedCodegen_demitStr = fun str acc -> v_Base_dList_dappend (v_Base_dList_dreverse (bi_str_unpack str)) acc

let rec v_Vuna_dCompiler_dTypedCodegen_dtrimTrailing = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 32 then v_Vuna_dCompiler_dTypedCodegen_dtrimTrailing rest else (c) :: (rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 933 1 ("no matching clause for Vuna.Compiler.TypedCodegen.trimTrailing")

let rec v_Vuna_dCompiler_dTypedCodegen_dformatChars = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | ([], col, depth, inStr, escaped, prev, acc) -> acc
  | ((c) :: (rest), col, depth, inStr, escaped, prev, acc) -> if inStr then if escaped then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc)) else if v_vuna_ueq_uint c 92 then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth true true c ((c) :: (acc)) else if v_vuna_ueq_uint c 34 then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc)) else if v_vuna_ueq_uint c 10 then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest 0 depth true false c ((c) :: (acc)) else v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc)) else if v_vuna_ueq_uint c 34 then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc)) else if v_vuna_ueq_uint c 10 then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest 0 depth false false c ((c) :: (v_Vuna_dCompiler_dTypedCodegen_dtrimTrailing acc)) else if v_vuna_ueq_uint c 40 then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) (bi_add depth 1) false false c ((c) :: (acc)) else if v_vuna_ueq_uint c 41 then v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) (if v_vuna_ugt_uint depth 0 then bi_sub depth 1 else 0) false false c ((c) :: (acc)) else if (if (v_vuna_ueq_uint prev 32) then (v_vuna_ueq_uint c 105) else false) then (match rest with
  | (110) :: ((32) :: (rest2)) -> (let width = v_Vuna_dCompiler_dTypedCodegen_dindentWidth depth in v_Vuna_dCompiler_dTypedCodegen_dformatChars rest2 (bi_add width 2) depth false false 32 (v_Vuna_dCompiler_dTypedCodegen_demitStr ((("in\n") ^ (v_Vuna_dCompiler_dTypedCodegen_dindentSpaces width))) acc))
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 947 37 ("case pattern match failure")) else if (if (v_vuna_ueq_uint prev 32) then (v_vuna_ueq_uint c 101) else false) then (match rest with
  | (108) :: ((115) :: ((101) :: ((32) :: (rest2)))) -> (let width = v_Vuna_dCompiler_dTypedCodegen_dindentWidth depth in v_Vuna_dCompiler_dTypedCodegen_dformatChars rest2 (bi_add width 5) depth false false 32 (v_Vuna_dCompiler_dTypedCodegen_demitStr ((let vuna_cat0' = ("\n") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dindentSpaces width) in (let vuna_cat2' = ("else ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dCompiler_dTypedCodegen_dtrimTrailing acc)))
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 953 37 ("case pattern match failure")) else if (if (v_vuna_ueq_uint c 32) then (v_vuna_ugt_uint col 100) else false) then (let width = v_Vuna_dCompiler_dTypedCodegen_dindentWidth depth in v_Vuna_dCompiler_dTypedCodegen_dformatChars rest width depth false false 32 (v_Vuna_dCompiler_dTypedCodegen_demitStr ((("\n") ^ (v_Vuna_dCompiler_dTypedCodegen_dindentSpaces width))) (v_Vuna_dCompiler_dTypedCodegen_dtrimTrailing acc))) else v_Vuna_dCompiler_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 937 1 ("no matching clause for Vuna.Compiler.TypedCodegen.formatChars")

let v_Vuna_dCompiler_dTypedCodegen_dformatOutput = fun s -> bi_str_pack (v_Base_dList_dreverse (v_Vuna_dCompiler_dTypedCodegen_dtrimTrailing (v_Vuna_dCompiler_dTypedCodegen_dformatChars (bi_str_unpack s) 0 0 false false 0 [])))

let v_Vuna_dCompiler_dTypedCodegen_dpadCode = fun c -> if v_vuna_ult_uint c 10 then (("00") ^ (bi_str_from_int c)) else if v_vuna_ult_uint c 100 then (("0") ^ (bi_str_from_int c)) else bi_str_from_int c

let v_Vuna_dCompiler_dTypedCodegen_descapeChar = fun c -> if v_vuna_ueq_uint c 34 then "\\\"" else if v_vuna_ueq_uint c 92 then "\\\\" else if v_vuna_ueq_uint c 10 then "\n" else if v_vuna_ueq_uint c 9 then "\t" else if v_vuna_ult_uint c 32 then (("\\") ^ (v_Vuna_dCompiler_dTypedCodegen_dpadCode c)) else if v_vuna_ugt_uint c 126 then (("\\") ^ (v_Vuna_dCompiler_dTypedCodegen_dpadCode c)) else bi_str_pack ((c) :: ([]))

let rec v_Vuna_dCompiler_dTypedCodegen_descapeLong = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (v_Vuna_dCompiler_dTypedCodegen_descapeChar c) :: (v_Vuna_dCompiler_dTypedCodegen_descapeLong rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 983 1 ("no matching clause for Vuna.Compiler.TypedCodegen.escapeLong")

let v_Vuna_dCompiler_dTypedCodegen_dtypedString = fun s -> if v_vuna_ugt_uint (bi_str_length s) 80 then (let vuna_cat0' = ("\"") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "" (v_Vuna_dCompiler_dTypedCodegen_descapeLong (bi_str_unpack s))) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else v_Vuna_dCompiler_dTypedCodegen_docamlString s

let rec v_Vuna_dCompiler_dTypedCodegen_dgenArgs = fun decls env args -> v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env) args
and v_Vuna_dCompiler_dTypedCodegen_dconcatBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, i, []) -> C_Base_dResult_dOk ([])
  | (decls, env, i, (e) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env e) (fun code -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dconcatBindings decls env (bi_add i 1) rest) (fun binds -> C_Base_dResult_dOk ((C_Base_dPair_dPair (v_Vuna_dCompiler_dTypedCodegen_dconcatBindingName i, code)) :: (binds))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 391 1 ("no matching clause for Vuna.Compiler.TypedCodegen.concatBindings")
and v_Vuna_dCompiler_dTypedCodegen_dgenConcatN = fun decls env pieces -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dconcatBindings decls env 0 pieces) (fun binds -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dwrapConcatBindings binds ((let vuna_cat0' = ("String.concat \"\" [") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "; " (v_Base_dList_dmap v_Base_dPair_dfirstOf binds)) in (let vuna_cat2' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))
and v_Vuna_dCompiler_dTypedCodegen_dgenCall = fun decls env fn args -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env fn) (fun f -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenArgs decls env args) (fun as2 -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dgenAppAware decls env fn args f as2)))
and v_Vuna_dCompiler_dTypedCodegen_dgenExpr = fun decls env expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_Base_dList_dmemName name env then C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name) else (match v_Vuna_dCompiler_dAst_dctorArity name decls with
  | C_Base_dMaybe_dJust (arity) -> if v_vuna_ueq_ustr name "Nil" then C_Base_dResult_dOk ("[]") else if v_vuna_ueq_ustr name "True" then C_Base_dResult_dOk ("true") else if v_vuna_ueq_ustr name "False" then C_Base_dResult_dOk ("false") else if v_vuna_ueq_uint arity 0 then C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) else C_Base_dResult_dErr ((let vuna_cat0' = ("typed codegen: constructor ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" used without arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypedCodegen_dbuiltinName name with
  | C_Base_dMaybe_dJust (ref) -> (match name with
  | "getArgs" -> C_Base_dResult_dOk ("bi_get_args ()")
  | "prim_getArgs" -> C_Base_dResult_dOk ("bi_get_args ()")
  | "readLine" -> C_Base_dResult_dOk ("bi_read_line ()")
  | "prim_readLine" -> C_Base_dResult_dOk ("bi_read_line ()")
  | _ -> C_Base_dResult_dOk (ref)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 485 19 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dAst_dfunArity name decls with
  | C_Base_dMaybe_dJust (0) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dzeroArgRef decls name)
  | C_Base_dMaybe_dJust (arity) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dvalueName name)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("typed codegen: unbound variable ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 491 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 484 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 477 8 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEInt (n, _) -> C_Base_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dCompiler_dAst_dEStr (s, _) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dtypedString s)
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> (match v_Vuna_dCompiler_dAst_dctorArity name decls with
  | C_Base_dMaybe_dJust (arity) -> if (if ((if (v_vuna_ueq_ustr name "Nil") then true else (v_vuna_ueq_ustr name "True"))) then true else (v_vuna_ueq_ustr name "False")) then C_Base_dResult_dErr ((let vuna_cat0' = ("typed codegen: constructor ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" cannot take arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else if v_vuna_ueq_ustr name "Cons" then (match args with
  | (h) :: ((t) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env h) (fun ph -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env t) (fun pt -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ph) in (let vuna_cat2' = (") :: (") in (let vuna_cat3' = (pt) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Base_dResult_dErr ("typed codegen: Cons arity")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 500 35 ("case pattern match failure")) else if v_vuna_ueq_uint (v_Base_dList_dlength args) arity then v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenArgs decls env args) (fun as2 -> (match as2 with
  | (a) :: ([]) -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (a) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " as2) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 505 83 ("case pattern match failure"))) else C_Base_dResult_dErr ((("typed codegen: partial constructor ") ^ (name)))
  | C_Base_dMaybe_dNothing -> if v_vuna_ueq_ustr name "&&" then (match args with
  | (a) :: ((b) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env a) (fun ga -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Base_dResult_dOk ((let vuna_cat0' = ("(if (") in (let vuna_cat1' = (ga) in (let vuna_cat2' = (") then (") in (let vuna_cat3' = (gb) in (let vuna_cat4' = (") else false)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 510 39 ("case pattern match failure")) else if v_vuna_ueq_ustr name "||" then (match args with
  | (a) :: ((b) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env a) (fun ga -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Base_dResult_dOk ((let vuna_cat0' = ("(if (") in (let vuna_cat1' = (ga) in (let vuna_cat2' = (") then true else (") in (let vuna_cat3' = (gb) in (let vuna_cat4' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 515 33 ("case pattern match failure")) else if v_vuna_ueq_ustr name "++" then (match args with
  | (_) :: ((_) :: ([])) -> (match v_Vuna_dCompiler_dTypedCodegen_dfoldStringLiterals (v_Vuna_dCompiler_dTypedCodegen_dconcatFlatten expr) with
  | (only) :: ([]) -> v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env only
  | (a) :: ((b) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env a) (fun ga -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Base_dResult_dOk ((let vuna_cat0' = ("((") in (let vuna_cat1' = (ga) in (let vuna_cat2' = (") ^ (") in (let vuna_cat3' = (gb) in (let vuna_cat4' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | pieces -> v_Vuna_dCompiler_dTypedCodegen_dgenConcatN decls env pieces
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 521 19 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 520 33 ("case pattern match failure")) else v_Vuna_dCompiler_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 498 20 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 497 21 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dELam (params, body, _) -> (let env2 = v_Base_dList_dappend params env in v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env2 body) (fun b -> C_Base_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " (v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dsanitizeName params)) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, _) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenLetBinds decls env binds body rec_u) (fun b -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (b) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env scrut) (fun s -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenAlt decls env) alts) (fun arms -> C_Base_dResult_dOk ((let vuna_cat0' = ("(match ") in (let vuna_cat1' = (s) in (let vuna_cat2' = (" with\n") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\n" (v_Base_dList_dappend arms ((v_Vuna_dCompiler_dTypedCodegen_dgenCatchAll sp "case pattern match failure") :: ([])))) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, _) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env c) (fun gc -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env t) (fun gt -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env e) (fun ge -> C_Base_dResult_dOk ((let vuna_cat0' = ("if ") in (let vuna_cat1' = (gc) in (let vuna_cat2' = (" then ") in (let vuna_cat3' = (gt) in (let vuna_cat4' = (" else ") in (let vuna_cat5' = (ge) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> C_Base_dResult_dErr ("typed codegen: unexpected dependent function type (use --dt)")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 475 26 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypedCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Base_dPair_dPair (pat, body)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenPat pat) (fun p -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls (v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_dpatVars pat) env) body) (fun b -> C_Base_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (p) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 546 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genAlt")
and v_Vuna_dCompiler_dTypedCodegen_dgenLetBinds = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, binds, body, false) -> v_Vuna_dCompiler_dTypedCodegen_dgenBinds decls env binds body
  | (decls, env, binds, body, true) -> v_Vuna_dCompiler_dTypedCodegen_dgenRecBinds decls env binds body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 563 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genLetBinds")
and v_Vuna_dCompiler_dTypedCodegen_dgenRecBinds = fun decls env binds body -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenRecDefs decls (v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_drecBindNames binds) env) binds) (fun defs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls (v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_drecBindNames binds) env) body) (fun b -> C_Base_dResult_dOk ((let vuna_cat0' = ("let rec ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\nand " defs) in (let vuna_cat2' = (" in ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
and v_Vuna_dCompiler_dTypedCodegen_dgenRecDefs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, []) -> C_Base_dResult_dOk ([])
  | (decls, env, (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPVar (name, _), value)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env value) (fun v -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenRecDefs decls env rest) (fun tail -> C_Base_dResult_dOk (((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName name) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (v) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: (tail))))
  | (decls, env, (C_Base_dPair_dPair (_, _)) :: (_)) -> C_Base_dResult_dErr ("recursive let bindings must be simple names")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 575 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genRecDefs")
and v_Vuna_dCompiler_dTypedCodegen_dgenBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], body) -> v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env body
  | (decls, env, (C_Base_dPair_dPair (pat, value)) :: (rest), body) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenPat pat) (fun p -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls env value) (fun v -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenBinds decls (v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_dpatVars pat) env) rest body) (fun r -> if v_Vuna_dCompiler_dTypedCodegen_disIrrefutable pat then C_Base_dResult_dOk ((let vuna_cat0' = ("let ") in (let vuna_cat1' = (p) in (let vuna_cat2' = (" = ") in (let vuna_cat3' = (v) in (let vuna_cat4' = (" in ") in (let vuna_cat5' = (r) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))) else C_Base_dResult_dOk ((let vuna_cat0' = ("(match ") in (let vuna_cat1' = (v) in (let vuna_cat2' = (" with\n  | ") in (let vuna_cat3' = (p) in (let vuna_cat4' = (" -> ") in (let vuna_cat5' = (r) in (let vuna_cat6' = ("\n  | _ -> vuna_fail ") in (let vuna_cat7' = (v_Vuna_dCompiler_dTypedCodegen_docamlString (v_Vuna_dCompiler_dCommon_dspanFile (v_Vuna_dCompiler_dAst_dpatSpan pat))) in (let vuna_cat8' = (" ") in (let vuna_cat9' = (bi_str_from_int (v_Vuna_dCompiler_dCommon_dspanStartLine (v_Vuna_dCompiler_dAst_dpatSpan pat))) in (let vuna_cat10' = (" ") in (let vuna_cat11' = (bi_str_from_int (v_Vuna_dCompiler_dCommon_dspanStartCol (v_Vuna_dCompiler_dAst_dpatSpan pat))) in (let vuna_cat12' = (" (\"let pattern match failure\"))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'; vuna_cat11'; vuna_cat12'])))))))))))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 582 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genBinds")

let v_Vuna_dCompiler_dTypedCodegen_dgenClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Base_dPair_dPair (pats, body)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult v_Vuna_dCompiler_dTypedCodegen_dgenPat pats) (fun ps -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls (v_Base_dList_dappend (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dpatVars pats) env) body) (fun b -> C_Base_dResult_dOk ((let vuna_cat0' = ("  | (") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " ps) in (let vuna_cat2' = (") -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 588 1 ("no matching clause for Vuna.Compiler.TypedCodegen.genClause")

let v_Vuna_dCompiler_dTypedCodegen_dgenFunction = fun decls name -> (match v_Vuna_dCompiler_dAst_dfunArity name decls with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("typed codegen: unknown function ") ^ (name)))
  | C_Base_dMaybe_dJust (arity) -> (match v_Vuna_dCompiler_dAst_dclausesFor decls name with
  | [] -> C_Base_dResult_dErr ((("typed codegen: no clauses for ") ^ (name)))
  | (C_Base_dPair_dPair (pats, body)) :: ([]) -> if v_vuna_ueq_uint arity 0 then if v_Vuna_dCompiler_dTypedCodegen_disPureZeroArg decls name then v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls [] body else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls [] body) (fun b -> C_Base_dResult_dOk ((("fun () -> ") ^ (b)))) else if v_Vuna_dCompiler_dTypedCodegen_dallVarPatterns pats then v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenExpr decls (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dpatVars pats) body) (fun b -> C_Base_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " (v_Base_dList_dmap v_Vuna_dCompiler_dTypedCodegen_dpatParam pats)) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenClause decls []) (v_Vuna_dCompiler_dAst_dclausesFor decls name)) (fun arms -> (let params = v_Vuna_dCompiler_dTypedCodegen_dgenParams arity in (let matched = if v_vuna_ueq_uint arity 1 then "a0" else (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " params) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in C_Base_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " params) in (let vuna_cat2' = (" -> match ") in (let vuna_cat3' = (matched) in (let vuna_cat4' = (" with\n") in (let vuna_cat5' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\n" (v_Base_dList_dappend arms ((v_Vuna_dCompiler_dTypedCodegen_dgenCatchAll (v_Vuna_dCompiler_dTypedCodegen_dfunSpan decls name) ((("no matching clause for ") ^ (name)))) :: ([])))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))))
  | (first) :: (rest) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenClause decls []) (v_Vuna_dCompiler_dAst_dclausesFor decls name)) (fun arms -> (let params = v_Vuna_dCompiler_dTypedCodegen_dgenParams arity in (let matched = if v_vuna_ueq_uint arity 1 then "a0" else (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith ", " params) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in C_Base_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith " " params) in (let vuna_cat2' = (" -> match ") in (let vuna_cat3' = (matched) in (let vuna_cat4' = (" with\n") in (let vuna_cat5' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\n" (v_Base_dList_dappend arms ((v_Vuna_dCompiler_dTypedCodegen_dgenCatchAll (v_Vuna_dCompiler_dTypedCodegen_dfunSpan decls name) ((("no matching clause for ") ^ (name)))) :: ([])))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 619 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 617 26 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenGroupDef = fun decls name -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenFunction decls name) (fun body -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dvalueName name) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (body) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))

let v_Vuna_dCompiler_dTypedCodegen_dgenGroup = fun decls group -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenGroupDef decls) group) (fun defs -> C_Base_dResult_dOk (((if v_Vuna_dCompiler_dTypedCodegen_dgroupNeedsRec decls group then "let rec " else "let ") ^ (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\nand " defs))))

let v_Vuna_dCompiler_dTypedCodegen_dgenTopNames = fun decls names -> (match names with
  | [] -> C_Base_dResult_dErr ("typed codegen: no definitions")
  | _ -> (let adj = v_Base_dList_dmap (fun n -> C_Base_dPair_dPair (n, v_Vuna_dCompiler_dTypedCodegen_dfilterNames (fun r -> v_Base_dList_dmemName r names) (v_Vuna_dCompiler_dTypedCodegen_dgenFunctionRefs decls n))) names in (let revAdj = v_Vuna_dCompiler_dTypedCodegen_dreverseAdj names adj in (match v_Vuna_dCompiler_dTypedCodegen_dpostOrder adj names [] [] with
  | C_Base_dPair_dPair (_, order) -> (let comps = v_Vuna_dCompiler_dTypedCodegen_dcollectComps revAdj order [] [] in (let groups = v_Vuna_dCompiler_dTypedCodegen_dgroupsFromComps comps names in v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dorderGroups adj groups) (fun ordered -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dgenGroup decls) ordered) (fun parts -> C_Base_dResult_dOk (((v_Vuna_dCompiler_dTypedCodegen_djoinWith "\n\n" parts) ^ ("\n")))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 807 8 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 800 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenTop = fun decls -> v_Vuna_dCompiler_dTypedCodegen_dgenTopNames decls (v_Vuna_dCompiler_dTypedCodegen_dfunctionNames decls)

let v_Vuna_dCompiler_dTypedCodegen_dtypedMainSuffix = fun decls showMain printResult -> if printResult then (let vuna_cat0' = ("let () = print_endline (") in (let vuna_cat1' = (showMain) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat4' = ("))\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat2' = (")\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dTypedCodegen_disIOType = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_dlastName n) "IO"
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 993 15 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dioResultTy = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> (match args with
  | (a) :: ([]) -> C_Base_dMaybe_dJust (a)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 998 18 ("case pattern match failure"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 997 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dioCtorOf = fun decls -> (match decls with
  | [] -> C_Base_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (n, params, kind, ctors, derivings, sp) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_dlastName n) "IO" then (match ctors with
  | (c) :: (cs) -> C_Base_dMaybe_dJust (v_Vuna_dCompiler_dAst_dctorName c)
  | [] -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1006 74 ("case pattern match failure")) else v_Vuna_dCompiler_dTypedCodegen_dioCtorOf rest
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dioCtorOf rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1005 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1003 18 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dioRunExpr = fun decls ctor -> (let vuna_cat0' = ("match ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat2' = (" with ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_dctorNameOf ctor) in (let vuna_cat4' = (" __iof -> __iof 0") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))

let rec v_Vuna_dCompiler_dTypedCodegen_dioTypeNameOf = fun decls -> (match decls with
  | [] -> C_Base_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (n, params, kind, ctors, derivings, sp) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_dlastName n) "IO" then C_Base_dMaybe_dJust (n) else v_Vuna_dCompiler_dTypedCodegen_dioTypeNameOf rest
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dioTypeNameOf rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1017 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1015 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dioOwnerModule = fun decls -> (match v_Vuna_dCompiler_dTypedCodegen_dioTypeNameOf decls with
  | C_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dJust (n) -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot n) with
  | C_Base_dPair_dPair (revPrefix, base) -> v_Vuna_dCompiler_dCommon_djoinDots revPrefix
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1024 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1022 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dioExecSuffix = fun decls ctor -> (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dioRunExpr decls ctor) in (let vuna_cat2' = (")\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dTypedCodegen_dioExecSuffixSplit = fun decls ctor -> (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dsanitizeName (v_Vuna_dCompiler_dTypedCodegen_dioOwnerModule decls)) in (let vuna_cat2' = (".__vuna_run_io (") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat4' = ("))\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))

let v_Vuna_dCompiler_dTypedCodegen_dinjectIOHelperOne = fun target ctorN typeN helperMl helperMli f -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dSplit_dsplitName f) (((target) ^ (".ml"))) then C_Vuna_dCompiler_dSplit_dSplitFile (v_Vuna_dCompiler_dSplit_dsplitName f, ((v_Vuna_dCompiler_dSplit_dsplitText f) ^ (helperMl))) else if v_vuna_ueq_ustr (v_Vuna_dCompiler_dSplit_dsplitName f) (((target) ^ (".mli"))) then C_Vuna_dCompiler_dSplit_dSplitFile (v_Vuna_dCompiler_dSplit_dsplitName f, ((v_Vuna_dCompiler_dSplit_dsplitText f) ^ (helperMli))) else f

let v_Vuna_dCompiler_dTypedCodegen_dinjectIOHelper = fun decls files -> (match v_Vuna_dCompiler_dTypedCodegen_dioTypeNameOf decls with
  | C_Base_dMaybe_dNothing -> files
  | C_Base_dMaybe_dJust (tyName) -> (match v_Vuna_dCompiler_dTypedCodegen_dioCtorOf decls with
  | C_Base_dMaybe_dNothing -> files
  | C_Base_dMaybe_dJust (ctor) -> (let target = v_Vuna_dCompiler_dTypedCodegen_dsanitizeName (v_Vuna_dCompiler_dTypedCodegen_dioOwnerModule decls) in let ctorN = v_Vuna_dCompiler_dTypedCodegen_dctorNameOf ctor in let typeN = v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf tyName in let helperMl = (let vuna_cat0' = ("\nlet __vuna_run_io (") in (let vuna_cat1' = (ctorN) in (let vuna_cat2' = (" f) = f 0\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in let helperMli = (let vuna_cat0' = ("\nval __vuna_run_io : ('a) ") in (let vuna_cat1' = (typeN) in (let vuna_cat2' = (" -> ('a)\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in v_Base_dList_dmap (v_Vuna_dCompiler_dTypedCodegen_dinjectIOHelperOne target ctorN typeN helperMl helperMli) files)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1045 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1043 30 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dioPermSuffix = fun decls ctor showResult printResult -> if printResult then (let vuna_cat0' = ("let () = let __io_r = (") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dioRunExpr decls ctor) in (let vuna_cat2' = (") in print_endline (") in (let vuna_cat3' = (showResult) in (let vuna_cat4' = (" __io_r)\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else v_Vuna_dCompiler_dTypedCodegen_dioExecSuffix decls ctor

let v_Vuna_dCompiler_dTypedCodegen_dmainSuffix = fun decls globals printResult exec -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme "main" globals with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("typed codegen: no main definition")
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> C_Base_dResult_dErr ("typed codegen: main must be zero-arity")
  | _ -> if v_Vuna_dCompiler_dTypedCodegen_disIOType ty then (match v_Vuna_dCompiler_dTypedCodegen_dioCtorOf decls with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("typed codegen: IO type is not defined in this program")
  | C_Base_dMaybe_dJust (ctor) -> if exec then C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dioExecSuffix decls ctor) else (match v_Vuna_dCompiler_dTypedCodegen_dioResultTy ty with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("typed codegen: IO type must have one argument")
  | C_Base_dMaybe_dJust (resultTy) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dshowForTy decls resultTy) (fun showResult -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dioPermSuffix decls ctor showResult printResult))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1071 12 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1068 30 ("case pattern match failure")) else if exec then C_Base_dResult_dErr ("typed codegen: executable main must have type IO a (use Base.IO)") else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dshowForTy decls ty) (fun showMain -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dtypedMainSuffix decls showMain printResult))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1066 31 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1064 45 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTypedMode = fun decls globals printResult exec -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmainSuffix decls globals printResult exec) (fun suffix -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenTypeDecls decls) (fun types -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenShowDecls decls) (fun shows -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenTop decls) (fun tops -> (let core = (let vuna_cat0' = (types) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (shows) in (let vuna_cat3' = ("\n") in (let vuna_cat4' = (tops) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) in C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dformatOutput ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_druntimeForBody (((core) ^ (suffix)))) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (core) in (let vuna_cat3' = (suffix) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))))))

let v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTyped = fun decls globals printResult -> v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTypedMode decls globals printResult false

let v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTypedExec = fun decls globals -> v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTypedMode decls globals false true

let v_Vuna_dCompiler_dTypedCodegen_dctxModules = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> modules
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1103 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxModules")

let v_Vuna_dCompiler_dTypedCodegen_dctxEntryDecls = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> entryDecls
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1106 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxEntryDecls")

let v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> elabDecls
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1109 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxElabDecls")

let v_Vuna_dCompiler_dTypedCodegen_dctxGlobals = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> globals
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1112 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxGlobals")

let v_Vuna_dCompiler_dTypedCodegen_dctxOwners = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> owners
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1115 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxOwners")

let v_Vuna_dCompiler_dTypedCodegen_dctxEntryNames = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> entryNames
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1118 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxEntryNames")

let v_Vuna_dCompiler_dTypedCodegen_dctxDefinedNames = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> definedNames
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1121 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxDefinedNames")

let v_Vuna_dCompiler_dTypedCodegen_dctxRuntimeSafe = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> runtimeSafe
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1124 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxRuntimeSafe")

let v_Vuna_dCompiler_dTypedCodegen_dctxRoutedFuns = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> routedFuns
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1127 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxRoutedFuns")

let v_Vuna_dCompiler_dTypedCodegen_dctxRoutedDatas = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> routedDatas
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1130 1 ("no matching clause for Vuna.Compiler.TypedCodegen.ctxRoutedDatas")

let v_Vuna_dCompiler_dTypedCodegen_dsplitPrefixOf = fun name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (rev, base) -> v_Vuna_dCompiler_dCommon_djoinDots rev
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1133 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_disBuiltinTypeCon = fun name -> (if ((if ((if (v_vuna_ueq_ustr name "Int") then true else (v_vuna_ueq_ustr name "String"))) then true else (v_vuna_ueq_ustr name "Bool"))) then true else (v_vuna_ueq_ustr name "List"))

let rec v_Vuna_dCompiler_dTypedCodegen_druntimeTyOk = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> true
  | C_Vuna_dCompiler_dTypecheck_dTCon (name, args) -> (if (v_Vuna_dCompiler_dTypedCodegen_disBuiltinTypeCon name) then (v_Vuna_dCompiler_dTypedCodegen_dallRuntimeTyOk args) else false)
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> (if (v_Vuna_dCompiler_dTypedCodegen_druntimeTyOk a) then (v_Vuna_dCompiler_dTypedCodegen_druntimeTyOk b) else false)
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1138 18 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypedCodegen_dallRuntimeTyOk = fun a0 -> match a0 with
  | ([]) -> true
  | ((t) :: (rest)) -> (if (v_Vuna_dCompiler_dTypedCodegen_druntimeTyOk t) then (v_Vuna_dCompiler_dTypedCodegen_dallRuntimeTyOk rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1144 1 ("no matching clause for Vuna.Compiler.TypedCodegen.allRuntimeTyOk")

let v_Vuna_dCompiler_dTypedCodegen_druntimeSchemeOk = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> (match cons with
  | [] -> v_Vuna_dCompiler_dTypedCodegen_druntimeTyOk ty
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1147 39 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1147 1 ("no matching clause for Vuna.Compiler.TypedCodegen.runtimeSchemeOk")

let rec v_Vuna_dCompiler_dTypedCodegen_drefsAllSafe = fun a0 a1 -> match (a0, a1) with
  | (safe, []) -> true
  | (safe, (r) :: (rest)) -> (if (v_Base_dList_dmemName r safe) then (v_Vuna_dCompiler_dTypedCodegen_drefsAllSafe safe rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1151 1 ("no matching clause for Vuna.Compiler.TypedCodegen.refsAllSafe")

let v_Vuna_dCompiler_dTypedCodegen_ddefinedRefs = fun ctx name -> v_Base_dList_dfilter (fun r -> v_Base_dList_dmemName r (v_Vuna_dCompiler_dTypedCodegen_dctxDefinedNames ctx)) (v_Vuna_dCompiler_dTypedCodegen_dgenFunctionRefs (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) name)

let rec v_Vuna_dCompiler_dTypedCodegen_druntimeSafeLoop = fun ctx safe -> (let safe2 = v_Base_dList_dfilter (fun n -> v_Vuna_dCompiler_dTypedCodegen_drefsAllSafe safe (v_Vuna_dCompiler_dTypedCodegen_ddefinedRefs ctx n)) safe in if v_vuna_ueq_uint (v_Base_dList_dlength safe2) (v_Base_dList_dlength safe) then safe else v_Vuna_dCompiler_dTypedCodegen_druntimeSafeLoop ctx safe2)

let v_Vuna_dCompiler_dTypedCodegen_dlookupSchemeDefault = fun globals name -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme name globals with
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dTypecheck_dScheme ([], [], C_Vuna_dCompiler_dTypecheck_dTCon ("Int", []))
  | C_Base_dMaybe_dJust (scheme) -> scheme
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1166 36 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_druntimeSafeOf = fun ctx candidates -> v_Vuna_dCompiler_dTypedCodegen_druntimeSafeLoop ctx (v_Base_dList_dfilter (fun n -> v_Vuna_dCompiler_dTypedCodegen_druntimeSchemeOk (v_Vuna_dCompiler_dTypedCodegen_dlookupSchemeDefault (v_Vuna_dCompiler_dTypedCodegen_dctxGlobals ctx) n)) candidates)

let v_Vuna_dCompiler_dTypedCodegen_ddeclSplitName = fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (n, ps, kind, cs, ds, sp) -> n
  | C_Vuna_dCompiler_dAst_dDRecord (n, ps, fs, ds, sp) -> n
  | C_Vuna_dCompiler_dAst_dDFun (n, ps, b, sp) -> n
  | C_Vuna_dCompiler_dAst_dDSig (n, ty, sp) -> n
  | C_Vuna_dCompiler_dAst_dDTrait (n, ps, ms, sp) -> n
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, methods, sp) -> (match iname with
  | C_Base_dMaybe_dJust (n) -> n
  | C_Base_dMaybe_dNothing -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1187 48 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1181 19 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_drouteData = fun ctx route -> (let names = v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dmap v_Base_dPair_dfirstOf (v_Base_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Base_dPair_dsecondOf p) route) (v_Vuna_dCompiler_dTypedCodegen_dctxRoutedDatas ctx))) in v_Base_dList_dfilter (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (n, ps, kind, cs, ds, sp) -> v_Base_dList_dmemName n names
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1199 20 ("case pattern match failure"))) (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx))

let v_Vuna_dCompiler_dTypedCodegen_drouteFunNames = fun ctx route -> v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dmap v_Base_dPair_dfirstOf (v_Base_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Base_dPair_dsecondOf p) route) (v_Vuna_dCompiler_dTypedCodegen_dctxRoutedFuns ctx)))

let v_Vuna_dCompiler_dTypedCodegen_dimportNameOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dImport (name, isQualified, alias, sp)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1217 1 ("no matching clause for Vuna.Compiler.TypedCodegen.importNameOf")

let rec v_Vuna_dCompiler_dTypedCodegen_dfindModuleByName = fun modules name -> (match modules with
  | [] -> C_Base_dMaybe_dNothing
  | (m) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dmoduleNameOf m) name then C_Base_dMaybe_dJust (m) else v_Vuna_dCompiler_dTypedCodegen_dfindModuleByName rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1219 33 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dtopoDeps = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (all, [], visited, order) -> C_Base_dResult_dOk (C_Base_dPair_dPair (visited, order))
  | (all, (imp) :: (rest), visited, order) -> (match v_Vuna_dCompiler_dTypedCodegen_dfindModuleByName all (v_Vuna_dCompiler_dTypedCodegen_dimportNameOf imp) with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("split mode: imported module ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dimportNameOf imp) in (let vuna_cat2' = (" is not loaded") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (dep) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dtopoVisit all dep visited order) (fun p -> v_Vuna_dCompiler_dTypedCodegen_dtopoDeps all rest (v_Base_dPair_dfirstOf p) (v_Base_dPair_dsecondOf p))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1230 44 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1229 1 ("no matching clause for Vuna.Compiler.TypedCodegen.topoDeps")
and v_Vuna_dCompiler_dTypedCodegen_dtopoVisit = fun all m visited order -> if v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dmoduleNameOf m) visited then C_Base_dResult_dOk (C_Base_dPair_dPair (visited, order)) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dtopoDeps all (v_Vuna_dCompiler_dLoader_dmoduleAllImportsOf m) ((v_Vuna_dCompiler_dLoader_dmoduleNameOf m) :: (visited)) order) (fun p -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dPair_dfirstOf p, v_Base_dList_dappend (v_Base_dPair_dsecondOf p) ((m) :: ([])))))

let rec v_Vuna_dCompiler_dTypedCodegen_dtopoAll = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (all, [], visited, order) -> C_Base_dResult_dOk (order)
  | (all, (m) :: (rest), visited, order) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dtopoVisit all m visited order) (fun p -> v_Vuna_dCompiler_dTypedCodegen_dtopoAll all rest (v_Base_dPair_dfirstOf p) (v_Base_dPair_dsecondOf p))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1225 1 ("no matching clause for Vuna.Compiler.TypedCodegen.topoAll")

let v_Vuna_dCompiler_dTypedCodegen_dtopoOrder = fun modules -> v_Vuna_dCompiler_dTypedCodegen_dtopoAll modules modules [] []

let v_Vuna_dCompiler_dTypedCodegen_dmoduleOwnNames = fun m -> v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames (v_Vuna_dCompiler_dLoader_dmoduleDeclsOf m)) (v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtypeNamesOf (v_Vuna_dCompiler_dLoader_dmoduleDeclsOf m)) (v_Vuna_dCompiler_dAst_dctorsOf (v_Vuna_dCompiler_dLoader_dmoduleDeclsOf m))))

let rec v_Vuna_dCompiler_dTypedCodegen_drouteModuleIn = fun modules name -> (match modules with
  | [] -> "#unknown"
  | (m) :: (rest) -> if v_Base_dList_dmemName name (v_Vuna_dCompiler_dTypedCodegen_dmoduleOwnNames m) then v_Vuna_dCompiler_dLoader_dmoduleNameOf m else v_Vuna_dCompiler_dTypedCodegen_drouteModuleIn rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1172 30 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_drouteModuleOf = fun ctx name -> v_Vuna_dCompiler_dTypedCodegen_drouteModuleIn (v_Vuna_dCompiler_dTypedCodegen_dctxModules ctx) name

let v_Vuna_dCompiler_dTypedCodegen_drouteOf = fun ctx name -> (match v_Base_dList_dlookupPair name (v_Vuna_dCompiler_dTypedCodegen_dctxOwners ctx) with
  | C_Base_dMaybe_dJust (owner) -> if v_vuna_ueq_ustr owner "" then if v_Base_dList_dmemName name (v_Vuna_dCompiler_dTypedCodegen_dctxRuntimeSafe ctx) then "#runtime" else "#main" else owner
  | C_Base_dMaybe_dNothing -> if v_Base_dList_dmemName name (v_Vuna_dCompiler_dTypedCodegen_dctxEntryNames ctx) then "#entry" else v_Vuna_dCompiler_dTypedCodegen_drouteModuleOf ctx name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1176 20 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_drouteDataTable = fun ctx decls -> v_Base_dList_dconcatMap (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (n, ps, kind, cs, ds, sp) -> (C_Base_dPair_dPair (n, v_Vuna_dCompiler_dTypedCodegen_drouteOf ctx n)) :: ([])
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1191 45 ("case pattern match failure"))) decls

let v_Vuna_dCompiler_dTypedCodegen_drouteFunTable = fun ctx decls -> v_Base_dList_dconcatMap (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, ps, b, sp) -> (C_Base_dPair_dPair (n, v_Vuna_dCompiler_dTypedCodegen_drouteOf ctx n)) :: ([])
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1204 44 ("case pattern match failure"))) decls

let v_Vuna_dCompiler_dTypedCodegen_dcheckRoutes = fun ctx -> (match v_Base_dList_dfilter (fun d -> v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_drouteOf ctx (v_Vuna_dCompiler_dTypedCodegen_ddeclSplitName d)) "#unknown") (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) with
  | [] -> C_Base_dResult_dOk (0)
  | (d) :: (rest) -> C_Base_dResult_dErr ((let vuna_cat0' = ("split mode: cannot assign declaration ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_ddeclSplitName d) in (let vuna_cat2' = (" to a module") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1212 19 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_docamlModName = fun m -> v_Vuna_dCompiler_dTypedCodegen_dsanitizeName (v_Vuna_dCompiler_dLoader_dmoduleNameOf m)

let v_Vuna_dCompiler_dTypedCodegen_dentryEq = fun a b -> (if ((if ((if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryKind a) (v_Vuna_dCompiler_dLoader_dentryKind b)) then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryPublic a) (v_Vuna_dCompiler_dLoader_dentryPublic b)) else false)) then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryTarget a) (v_Vuna_dCompiler_dLoader_dentryTarget b)) else false)) then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryParent a) (v_Vuna_dCompiler_dLoader_dentryParent b)) else false)

let rec v_Vuna_dCompiler_dTypedCodegen_dentryMem = fun a0 a1 -> match (a0, a1) with
  | (e, []) -> false
  | (e, (x) :: (rest)) -> if v_Vuna_dCompiler_dTypedCodegen_dentryEq e x then true else v_Vuna_dCompiler_dTypedCodegen_dentryMem e rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1254 1 ("no matching clause for Vuna.Compiler.TypedCodegen.entryMem")

let rec v_Vuna_dCompiler_dTypedCodegen_dentriesSubset = fun a0 a1 -> match (a0, a1) with
  | ([], supers) -> true
  | ((e) :: (rest), supers) -> (if (v_Vuna_dCompiler_dTypedCodegen_dentryMem e supers) then (v_Vuna_dCompiler_dTypedCodegen_dentriesSubset rest supers) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1257 1 ("no matching clause for Vuna.Compiler.TypedCodegen.entriesSubset")

let v_Vuna_dCompiler_dTypedCodegen_dentriesNonEmpty = fun a0 -> match a0 with
  | ([]) -> false
  | ((e) :: (rest)) -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1260 1 ("no matching clause for Vuna.Compiler.TypedCodegen.entriesNonEmpty")

let rec v_Vuna_dCompiler_dTypedCodegen_dimportsHave = fun earlier imps name -> (match imps with
  | [] -> false
  | (imp) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_dimportNameOf imp) name then true else v_Vuna_dCompiler_dTypedCodegen_dimportsHave earlier rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1263 33 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_ddirectImportsOf = fun earlier imps -> v_Base_dList_dfilter (fun m -> v_Vuna_dCompiler_dTypedCodegen_dimportsHave earlier imps (v_Vuna_dCompiler_dLoader_dmoduleNameOf m)) earlier

let v_Vuna_dCompiler_dTypedCodegen_dcoversModule = fun x y -> (if (v_Vuna_dCompiler_dTypedCodegen_dentriesNonEmpty (v_Vuna_dCompiler_dLoader_dmoduleExportsOf x)) then (v_Vuna_dCompiler_dTypedCodegen_dentriesSubset (v_Vuna_dCompiler_dLoader_dmoduleExportsOf x) (v_Vuna_dCompiler_dLoader_dmoduleExportsOf y)) else false)

let rec v_Vuna_dCompiler_dTypedCodegen_dcoveredBy = fun kept x -> (match kept with
  | [] -> false
  | (z) :: (rest) -> if v_Vuna_dCompiler_dTypedCodegen_dcoversModule x z then true else v_Vuna_dCompiler_dTypedCodegen_dcoveredBy rest x
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1272 20 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dmaximalIncludesGo = fun a0 a1 -> match (a0, a1) with
  | ([], kept) -> kept
  | ((x) :: (rest), kept) -> if v_Vuna_dCompiler_dTypedCodegen_dcoveredBy kept x then v_Vuna_dCompiler_dTypedCodegen_dmaximalIncludesGo rest kept else v_Vuna_dCompiler_dTypedCodegen_dmaximalIncludesGo rest ((x) :: (v_Base_dList_dfilter (fun z -> v_Base_dBool_dnot (v_Vuna_dCompiler_dTypedCodegen_dcoversModule z x)) kept))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1278 1 ("no matching clause for Vuna.Compiler.TypedCodegen.maximalIncludesGo")

let v_Vuna_dCompiler_dTypedCodegen_dmaximalIncludes = fun candidates -> v_Base_dList_dreverse (v_Vuna_dCompiler_dTypedCodegen_dmaximalIncludesGo candidates [])

let v_Vuna_dCompiler_dTypedCodegen_dincludeModulesOf = fun m earlier -> (let exports = v_Vuna_dCompiler_dLoader_dmoduleExportsOf m in let directs = v_Vuna_dCompiler_dTypedCodegen_ddirectImportsOf earlier (v_Vuna_dCompiler_dLoader_dmoduleImportsOf m) in let candidates = v_Base_dList_dfilter (fun x -> (if (v_Vuna_dCompiler_dTypedCodegen_dentriesNonEmpty (v_Vuna_dCompiler_dLoader_dmoduleExportsOf x)) then (v_Vuna_dCompiler_dTypedCodegen_dentriesSubset (v_Vuna_dCompiler_dLoader_dmoduleExportsOf x) exports) else false)) directs in v_Vuna_dCompiler_dTypedCodegen_dmaximalIncludes candidates)

let rec v_Vuna_dCompiler_dTypedCodegen_dcoveredByInclude = fun e includes -> (match includes with
  | [] -> false
  | (x) :: (rest) -> if v_Vuna_dCompiler_dTypedCodegen_dentryMem e (v_Vuna_dCompiler_dLoader_dmoduleExportsOf x) then true else v_Vuna_dCompiler_dTypedCodegen_dcoveredByInclude e rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1293 31 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dentryOwnedBy = fun m e -> (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypedCodegen_dsplitPrefixOf (v_Vuna_dCompiler_dLoader_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dmoduleNameOf m)) then true else (v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dentryTarget e) (v_Vuna_dCompiler_dTypedCodegen_dmoduleOwnNames m)))

let v_Vuna_dCompiler_dTypedCodegen_dcheckForeignExports = fun m includes -> (let foreign = v_Base_dList_dfilter (fun e -> v_Base_dBool_dnot (v_Vuna_dCompiler_dTypedCodegen_dentryOwnedBy m e)) (v_Vuna_dCompiler_dLoader_dmoduleExportsOf m) in (match v_Base_dList_dfilter (fun e -> v_Base_dBool_dnot (v_Vuna_dCompiler_dTypedCodegen_dcoveredByInclude e includes)) foreign with
  | [] -> C_Base_dResult_dOk (0)
  | (e) :: (rest) -> C_Base_dResult_dErr ((let vuna_cat0' = ("split mode: selective re-export of \"") in (let vuna_cat1' = (v_Vuna_dCompiler_dLoader_dentryPublic e) in (let vuna_cat2' = ("\" from module ") in (let vuna_cat3' = (v_Vuna_dCompiler_dLoader_dmoduleNameOf m) in (let vuna_cat4' = (" is not supported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1303 6 ("case pattern match failure")))

let v_Vuna_dCompiler_dTypedCodegen_dopenHeader = fun earlier -> (("open Vuna_runtime\n") ^ (v_Vuna_dCompiler_dTypedCodegen_djoinWith "" (v_Base_dList_dmap (fun m -> (let vuna_cat0' = ("open ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_docamlModName m) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) earlier)))

let v_Vuna_dCompiler_dTypedCodegen_dincludesIn = fun earlier includes -> v_Base_dList_dfilter (fun m -> v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dmoduleNameOf m) (v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dmoduleNameOf includes)) earlier

let v_Vuna_dCompiler_dTypedCodegen_dmlIncludeText = fun earlier includes -> v_Vuna_dCompiler_dTypedCodegen_djoinWith "" (v_Base_dList_dmap (fun m -> (let vuna_cat0' = ("include ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_docamlModName m) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dCompiler_dTypedCodegen_dincludesIn earlier includes))

let v_Vuna_dCompiler_dTypedCodegen_dmliIncludeText = fun earlier includes -> v_Vuna_dCompiler_dTypedCodegen_djoinWith "" (v_Base_dList_dmap (fun m -> (let vuna_cat0' = ("include module type of struct include ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_docamlModName m) in (let vuna_cat2' = (" end\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dCompiler_dTypedCodegen_dincludesIn earlier includes))

let v_Vuna_dCompiler_dTypedCodegen_dbuiltinTyArgs = fun a0 a1 -> match (a0, a1) with
  | ([], base) -> C_Base_dResult_dOk (base)
  | (args, base) -> C_Base_dResult_dErr ("split mode: builtin type cannot be applied")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1324 1 ("no matching clause for Vuna.Compiler.TypedCodegen.builtinTyArgs")

let rec v_Vuna_dCompiler_dTypedCodegen_drenderTy = fun ctx ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> C_Base_dResult_dOk ((("'a") ^ (bi_str_from_int i)))
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_drenderTy ctx a) (fun ta -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_drenderTy ctx b) (fun tb -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") -> (") in (let vuna_cat3' = (tb) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> C_Base_dResult_dErr ("split mode: unsupported constraint (type application) in exported signature")
  | C_Vuna_dCompiler_dTypecheck_dTCon (name, args) -> if v_vuna_ueq_ustr name "Int" then v_Vuna_dCompiler_dTypedCodegen_dbuiltinTyArgs args "int" else if v_vuna_ueq_ustr name "String" then v_Vuna_dCompiler_dTypedCodegen_dbuiltinTyArgs args "string" else if v_Vuna_dCompiler_dTypedCodegen_disBoolName name then v_Vuna_dCompiler_dTypedCodegen_dbuiltinTyArgs args "bool" else if v_Vuna_dCompiler_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_drenderTy ctx a) (fun ta -> C_Base_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") list") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Base_dResult_dErr ("split mode: invalid List type in exported signature")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1337 32 ("case pattern match failure")) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_drenderTy ctx) args) (fun ts -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dappType ts (v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1327 19 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dtyVarsIn = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (i) :: ([])
  | C_Vuna_dCompiler_dTypecheck_dTCon (name, args) -> v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dtyVarsIn args
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_dtyVarsIn a) (v_Vuna_dCompiler_dTypedCodegen_dtyVarsIn b)
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_dtyVarsIn head) (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypedCodegen_dtyVarsIn args)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1343 15 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dmemIntList = fun x xs -> (match xs with
  | [] -> false
  | (y) :: (rest) -> if v_vuna_ueq_ugeneric x y then true else v_Vuna_dCompiler_dTypedCodegen_dmemIntList x rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1349 19 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dallVarsBound = fun a0 a1 -> match (a0, a1) with
  | (qs, []) -> true
  | (qs, (v) :: (rest)) -> (if (v_Vuna_dCompiler_dTypedCodegen_dmemIntList v qs) then (v_Vuna_dCompiler_dTypedCodegen_dallVarsBound qs rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1353 1 ("no matching clause for Vuna.Compiler.TypedCodegen.allVarsBound")

let v_Vuna_dCompiler_dTypedCodegen_drenderValueType = fun ctx name -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme name (v_Vuna_dCompiler_dTypedCodegen_dctxGlobals ctx) with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (C_Base_dMaybe_dNothing)
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> (match cons with
  | [] -> if v_Vuna_dCompiler_dTypedCodegen_dallVarsBound qs (v_Vuna_dCompiler_dTypedCodegen_dtyVarsIn ty) then (match v_Vuna_dCompiler_dAst_dfunArity name (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) with
  | C_Base_dMaybe_dJust (0) -> if v_Vuna_dCompiler_dTypedCodegen_disPureZeroArg (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) name then v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_drenderTy ctx ty) (fun t -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (t))) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_drenderTy ctx ty) (fun t -> C_Base_dResult_dOk (C_Base_dMaybe_dJust ((("unit -> ") ^ (t)))))
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_drenderTy ctx ty) (fun t -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (t)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1360 49 ("case pattern match failure")) else C_Base_dResult_dErr ((let vuna_cat0' = ("split mode: exported value \"") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\" has unbound type variables") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("split mode: unsupported constraint (dictionary parameter) in exported value \"") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1359 31 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1357 28 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dshowValType = fun params name -> (match params with
  | [] -> ((v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf name) ^ (" -> string"))
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dshowAnnotation params name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1370 27 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dfindExportByTarget = fun kind target exports -> (match exports with
  | [] -> C_Base_dMaybe_dNothing
  | (e) :: (rest) -> if (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryKind e) kind) then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryTarget e) target) else false) then C_Base_dMaybe_dJust (e) else v_Vuna_dCompiler_dTypedCodegen_dfindExportByTarget kind target rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1374 42 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dctorExportsOf = fun target exports -> v_Base_dList_dfilter (fun e -> (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryKind e) "ctor") then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryParent e) target) else false)) exports

let v_Vuna_dCompiler_dTypedCodegen_dmliTypePart = fun ctx exports d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> (match v_Vuna_dCompiler_dTypedCodegen_dctorExportsOf name exports with
  | [] -> C_Base_dResult_dOk (((v_Vuna_dCompiler_dTypedCodegen_ddataPrefix params) ^ (v_Vuna_dCompiler_dTypedCodegen_dtypeNameOf name)))
  | ctorEntries -> if v_vuna_ueq_uint (v_Base_dList_dlength ctorEntries) (v_Base_dList_dlength ctors) then v_Vuna_dCompiler_dTypedCodegen_dgenData (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) d else C_Base_dResult_dErr ((let vuna_cat0' = ("split mode: partial constructor export of type ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" is not supported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1384 48 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("split mode: invalid type declaration")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1383 29 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dgenMliTypes = fun ctx exports datas -> (match v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData datas with
  | [] -> C_Base_dResult_dOk ("")
  | ds -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dmapResult (v_Vuna_dCompiler_dTypedCodegen_dmliTypePart ctx exports) ds) (fun parts -> C_Base_dResult_dOk ((let vuna_cat0' = ("type ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "\nand " parts) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1391 33 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypedCodegen_dconcatMapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Base_dResult_dOk ([])
  | (f, (x) :: (rest)) -> v_Base_dResult_dandThen (f x) (fun ys -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dconcatMapResult f rest) (fun zs -> C_Base_dResult_dOk (v_Base_dList_dappend ys zs)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1397 1 ("no matching clause for Vuna.Compiler.TypedCodegen.concatMapResult")

let v_Vuna_dCompiler_dTypedCodegen_dexportValLine = fun ctx m e -> if (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryKind e) "val") then (v_Vuna_dCompiler_dTypedCodegen_dentryOwnedBy m e) else false) then (match v_Vuna_dCompiler_dTypedCodegen_drenderValueType ctx (v_Vuna_dCompiler_dLoader_dentryTarget e) with
  | C_Base_dResult_dErr (err) -> C_Base_dResult_dErr (err)
  | C_Base_dResult_dOk (C_Base_dMaybe_dNothing) -> C_Base_dResult_dOk ([])
  | C_Base_dResult_dOk (C_Base_dMaybe_dJust (ty)) -> C_Base_dResult_dOk (((let vuna_cat0' = ("val ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dvalueName (v_Vuna_dCompiler_dLoader_dentryTarget e)) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (ty) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: ([]))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1401 74 ("case pattern match failure")) else C_Base_dResult_dOk ([])

let v_Vuna_dCompiler_dTypedCodegen_dgeneratedValLine = fun ctx name -> (match v_Vuna_dCompiler_dTypedCodegen_drenderValueType ctx name with
  | C_Base_dResult_dErr (err) -> C_Base_dResult_dErr (err)
  | C_Base_dResult_dOk (C_Base_dMaybe_dNothing) -> C_Base_dResult_dOk ([])
  | C_Base_dResult_dOk (C_Base_dMaybe_dJust (ty)) -> C_Base_dResult_dOk (((let vuna_cat0' = ("val ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dvalueName name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (ty) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: ([]))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1407 29 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dshowValLine = fun ctx d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> C_Base_dResult_dOk (((let vuna_cat0' = ("val ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dshowNameOf name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_dshowValType params name) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: ([]))
  | _ -> C_Base_dResult_dOk ([])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1412 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_downersOfPart = fun ctx part -> v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dmap v_Base_dPair_dfirstOf (v_Base_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Base_dPair_dsecondOf p) part) (v_Vuna_dCompiler_dTypedCodegen_dctxOwners ctx)))

let v_Vuna_dCompiler_dTypedCodegen_dgenMliVals = fun ctx m datas -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dconcatMapResult (v_Vuna_dCompiler_dTypedCodegen_dexportValLine ctx m) (v_Vuna_dCompiler_dLoader_dmoduleExportsOf m)) (fun exported -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dconcatMapResult (v_Vuna_dCompiler_dTypedCodegen_dgeneratedValLine ctx) (v_Vuna_dCompiler_dTypedCodegen_downersOfPart ctx (v_Vuna_dCompiler_dLoader_dmoduleNameOf m))) (fun generated -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dconcatMapResult (v_Vuna_dCompiler_dTypedCodegen_dshowValLine ctx) (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData datas)) (fun shows -> C_Base_dResult_dOk (v_Base_dList_dappend exported (v_Base_dList_dappend generated shows)))))

let v_Vuna_dCompiler_dTypedCodegen_dgenModuleTops = fun ctx names -> (match names with
  | [] -> C_Base_dResult_dOk ("")
  | _ -> v_Vuna_dCompiler_dTypedCodegen_dgenTopNames (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) names
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1425 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dsplitModuleMl = fun ctx earlier m -> (let part = v_Vuna_dCompiler_dLoader_dmoduleNameOf m in let datas = v_Vuna_dCompiler_dTypedCodegen_drouteData ctx part in let names = v_Vuna_dCompiler_dTypedCodegen_drouteFunNames ctx part in let includes = v_Vuna_dCompiler_dTypedCodegen_dincludeModulesOf m earlier in v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dcheckForeignExports m includes) (fun ok -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenTypeDeclsOf (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData datas)) (fun types -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenShowDeclsOf (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData datas)) (fun shows -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenModuleTops ctx names) (fun tops -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dopenHeader earlier) in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dmlIncludeText earlier includes) in (let vuna_cat2' = (types) in (let vuna_cat3' = (shows) in (let vuna_cat4' = (tops) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))))))

let v_Vuna_dCompiler_dTypedCodegen_dsplitModuleMli = fun ctx earlier m -> (let datas = v_Vuna_dCompiler_dTypedCodegen_drouteData ctx (v_Vuna_dCompiler_dLoader_dmoduleNameOf m) in let exports = v_Vuna_dCompiler_dLoader_dmoduleExportsOf m in let includes = v_Vuna_dCompiler_dTypedCodegen_dincludeModulesOf m earlier in v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenMliTypes ctx exports datas) (fun types -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenMliVals ctx m datas) (fun vals -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dopenHeader earlier) in (let vuna_cat1' = (v_Vuna_dCompiler_dTypedCodegen_dmliIncludeText earlier includes) in (let vuna_cat2' = (types) in (let vuna_cat3' = (v_Vuna_dCompiler_dTypedCodegen_djoinWith "" vals) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))))

let rec v_Vuna_dCompiler_dTypedCodegen_dsplitModuleFilesGo = fun ctx ordered earlier -> (match ordered with
  | [] -> C_Base_dResult_dOk ([])
  | (m) :: (rest) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dsplitModuleMli ctx earlier m) (fun mli -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dsplitModuleMl ctx earlier m) (fun ml -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dsplitModuleFilesGo ctx rest (v_Base_dList_dappend earlier ((m) :: ([])))) (fun more -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dSplit_dSplitFile (((v_Vuna_dCompiler_dTypedCodegen_docamlModName m) ^ (".mli")), mli)) :: ((C_Vuna_dCompiler_dSplit_dSplitFile (((v_Vuna_dCompiler_dTypedCodegen_docamlModName m) ^ (".ml")), ml)) :: (more))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1448 42 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dsplitModuleFiles = fun ctx ordered -> v_Vuna_dCompiler_dTypedCodegen_dsplitModuleFilesGo ctx ordered []

let v_Vuna_dCompiler_dTypedCodegen_dsplitRuntimeFile = fun ctx -> (match v_Vuna_dCompiler_dTypedCodegen_drouteFunNames ctx "#runtime" with
  | [] -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_druntimeCodeTyped ())
  | names -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenTopNames (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) names) (fun tops -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_druntimeCodeTyped ()) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (tops) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1454 24 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dsplitMainSuffix = fun ctx -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme "main" (v_Vuna_dCompiler_dTypedCodegen_dctxGlobals ctx) with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("typed codegen: no main definition")
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> C_Base_dResult_dErr ("typed codegen: main must be zero-arity")
  | _ -> if v_Vuna_dCompiler_dTypedCodegen_disIOType ty then (match v_Vuna_dCompiler_dTypedCodegen_dioCtorOf (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("typed codegen: IO type is not defined in this program")
  | C_Base_dMaybe_dJust (ctor) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypedCodegen_dioExecSuffixSplit (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) ctor)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1463 30 ("case pattern match failure")) else C_Base_dResult_dErr ("typed codegen: executable main must have type IO a (use Base.IO)")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1461 31 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/TypedCodegen.vuna" 1459 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypedCodegen_dsplitMainFile = fun ctx ordered -> (let entryData = v_Vuna_dCompiler_dTypedCodegen_drouteData ctx "#entry" in let mainNames = v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_drouteFunNames ctx "#entry") (v_Vuna_dCompiler_dTypedCodegen_drouteFunNames ctx "#main") in v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenTypeDeclsOf (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData entryData)) (fun types -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenShowDeclsOf (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dCompiler_dTypedCodegen_dnonSpecialData entryData)) (fun shows -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenModuleTops ctx mainNames) (fun tops -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dsplitMainSuffix ctx) (fun suffix -> C_Base_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCompiler_dTypedCodegen_dopenHeader ordered) in (let vuna_cat1' = (types) in (let vuna_cat2' = (shows) in (let vuna_cat3' = (tops) in (let vuna_cat4' = (suffix) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))))))

let v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitProgramIn = fun includeMain modules entryDecls elabDecls globals owners -> (let entryNames = v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames entryDecls) (v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtypeNamesOf entryDecls) (v_Vuna_dCompiler_dAst_dctorsOf entryDecls))) in let definedNames = v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dappend (v_Vuna_dCompiler_dTypedCodegen_dfunctionNames elabDecls) (v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dctorsOf elabDecls) (v_Vuna_dCompiler_dAst_dtypeNamesOf elabDecls))) in let runtimeCandidates = v_Vuna_dCompiler_dTypedCodegen_duniqueNames (v_Base_dList_dmap v_Base_dPair_dfirstOf (v_Base_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Base_dPair_dsecondOf p) "") owners)) in let baseCtx = C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, [], [], []) in let runtimeSafe = v_Vuna_dCompiler_dTypedCodegen_druntimeSafeOf baseCtx runtimeCandidates in let routeCtx = C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, [], []) in let routedFuns = v_Vuna_dCompiler_dTypedCodegen_drouteFunTable routeCtx elabDecls in let routedDatas = v_Vuna_dCompiler_dTypedCodegen_drouteDataTable routeCtx elabDecls in let ctx = C_Vuna_dCompiler_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dcheckRoutes ctx) (fun ok -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dtopoOrder modules) (fun ordered -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dsplitRuntimeFile ctx) (fun runtimeText -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dsplitModuleFiles ctx ordered) (fun moduleFiles -> if includeMain then v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dsplitMainFile ctx ordered) (fun mainText -> (let files = v_Vuna_dCompiler_dTypedCodegen_dinjectIOHelper (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) moduleFiles in C_Base_dResult_dOk ((C_Vuna_dCompiler_dSplit_dSplitFile ("Vuna_runtime.ml", runtimeText)) :: (v_Base_dList_dappend files ((C_Vuna_dCompiler_dSplit_dSplitFile ("Main.ml", mainText)) :: ([])))))) else (let files = v_Vuna_dCompiler_dTypedCodegen_dinjectIOHelper (v_Vuna_dCompiler_dTypedCodegen_dctxElabDecls ctx) moduleFiles in C_Base_dResult_dOk ((C_Vuna_dCompiler_dSplit_dSplitFile ("Vuna_runtime.ml", runtimeText)) :: (files))))))))

let v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitProgram = fun modules entryDecls elabDecls globals owners -> v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitProgramIn true modules entryDecls elabDecls globals owners

let v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitLibraryProgram = fun modules entryDecls elabDecls globals owners -> v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitProgramIn false modules entryDecls elabDecls globals owners
