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
type   t_Vuna_dTypedCodegen_dSplitCtx =
    C_Vuna_dTypedCodegen_dSplitCtx of ((t_Vuna_dLoader_dModule) list) * ((t_Vuna_dAst_dDecl) list) * ((t_Vuna_dAst_dDecl) list) * (((string, t_Vuna_dTypecheck_dScheme) t_Vuna_dPair_dPair) list) * (((string, string) t_Vuna_dPair_dPair) list) * ((string) list) * ((string) list) * ((string) list) * (((string, string) t_Vuna_dPair_dPair) list) * (((string, string) t_Vuna_dPair_dPair) list)
let show_Vuna_dTypedCodegen_dSplitCtx v =
  match v with
  | C_Vuna_dTypedCodegen_dSplitCtx (f0, f1, f2, f3, f4, f5, f6, f7, f8, f9) -> show_ctor "SplitCtx" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dLoader_dModule) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dTypecheck_dScheme)) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f4; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f5; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f6; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f7; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f8; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f9]
let v_Vuna_dTypedCodegen_dsanitizeChar = fun c -> if v_vuna_ueq_uint c 46 then (95) :: ((100) :: ([])) else if v_vuna_ueq_uint c 95 then (95) :: ((117) :: ([])) else if v_vuna_ueq_uint c 39 then (95) :: ((112) :: ([])) else (c) :: ([])

let v_Vuna_dTypedCodegen_dsanitizeName = fun name -> bi_str_pack (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dsanitizeChar (bi_str_unpack name))

let v_Vuna_dTypedCodegen_docamlPad3 = fun s -> if v_vuna_ueq_uint (bi_str_length s) 1 then (("00") ^ (s)) else if v_vuna_ueq_uint (bi_str_length s) 2 then (("0") ^ (s)) else s

let v_Vuna_dTypedCodegen_docamlEscapeChar = fun c -> if v_vuna_ueq_uint c 34 then (92) :: ((34) :: ([])) else if v_vuna_ueq_uint c 92 then (92) :: ((92) :: ([])) else if v_vuna_ueq_uint c 10 then (92) :: ((110) :: ([])) else if v_vuna_ueq_uint c 9 then (92) :: ((116) :: ([])) else if v_vuna_ueq_uint c 13 then (92) :: ((114) :: ([])) else if (if (v_vuna_uge_uint c 32) then (v_vuna_ule_uint c 126) else false) then (c) :: ([]) else bi_str_unpack ((("\\") ^ (v_Vuna_dTypedCodegen_docamlPad3 (bi_str_from_int c))))

let v_Vuna_dTypedCodegen_docamlString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (bi_str_pack (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_docamlEscapeChar (bi_str_unpack s))) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dTypedCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 38 1 ("no matching clause for Vuna.TypedCodegen.joinWith")

let v_Vuna_dTypedCodegen_dlastName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dPair_dPair (rev, base) -> base
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 43 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disBoolName = fun name -> v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dlastName name) "Bool"

let v_Vuna_dTypedCodegen_disListName = fun name -> v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dlastName name) "List"

let v_Vuna_dTypedCodegen_dtypeNameOf = fun name -> (("t_") ^ (v_Vuna_dTypedCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dctorNameOf = fun name -> (("C_") ^ (v_Vuna_dTypedCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dvalueName = fun name -> (("v_") ^ (v_Vuna_dTypedCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dshowNameOf = fun name -> (("show_") ^ (v_Vuna_dTypedCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dparamVar = fun i -> (("'p") ^ (bi_str_from_int i))

let v_Vuna_dTypedCodegen_dshowParamVar = fun i -> (("s") ^ (bi_str_from_int i))

let rec v_Vuna_dTypedCodegen_dparamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dPair_dPair (p, v_Vuna_dTypedCodegen_dparamVar i)) :: (v_Vuna_dTypedCodegen_dparamMapAt rest (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 62 1 ("no matching clause for Vuna.TypedCodegen.paramMapAt")

let v_Vuna_dTypedCodegen_dparamMap = fun params -> v_Vuna_dTypedCodegen_dparamMapAt params 0

let rec v_Vuna_dTypedCodegen_dshowParamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dPair_dPair (p, v_Vuna_dTypedCodegen_dshowParamVar i)) :: (v_Vuna_dTypedCodegen_dshowParamMapAt rest (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 67 1 ("no matching clause for Vuna.TypedCodegen.showParamMapAt")

let v_Vuna_dTypedCodegen_dshowParamMap = fun params -> v_Vuna_dTypedCodegen_dshowParamMapAt params 0

let rec v_Vuna_dTypedCodegen_dlookupParam = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dMaybe_dNothing
  | (name, (C_Vuna_dPair_dPair (n, v)) :: (rest)) -> if v_vuna_ueq_ugeneric n name then C_Vuna_dMaybe_dJust (v) else v_Vuna_dTypedCodegen_dlookupParam name rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 72 1 ("no matching clause for Vuna.TypedCodegen.lookupParam")

let rec v_Vuna_dTypedCodegen_ddataDecls = fun decls -> (match decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _, _) -> (d) :: (v_Vuna_dTypedCodegen_ddataDecls rest)
  | _ -> v_Vuna_dTypedCodegen_ddataDecls rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 80 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 77 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dnonSpecialData = fun decls -> (match v_Vuna_dTypedCodegen_ddataDecls decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _, _) -> if (if (v_Vuna_dTypedCodegen_disBoolName name) then true else (v_Vuna_dTypedCodegen_disListName name)) then v_Vuna_dTypedCodegen_dnonSpecialData rest else (d) :: (v_Vuna_dTypedCodegen_dnonSpecialData rest)
  | _ -> v_Vuna_dTypedCodegen_dnonSpecialData rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 88 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 85 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dlookupData = fun decls name -> (match decls with
  | [] -> C_Vuna_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dn, ps, cs, _, _) -> if v_vuna_ueq_ustr dn name then C_Vuna_dMaybe_dJust (d) else v_Vuna_dTypedCodegen_dlookupData rest name
  | _ -> v_Vuna_dTypedCodegen_dlookupData rest name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 98 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 95 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dmapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dResult_dOk ([])
  | (f, (x) :: (rest)) -> v_Vuna_dResult_dandThen (f x) (fun y -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult f rest) (fun ys -> C_Vuna_dResult_dOk ((y) :: (ys))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 102 1 ("no matching clause for Vuna.TypedCodegen.mapResult")

let v_Vuna_dTypedCodegen_dappType = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> name
  | ((x) :: ([]), name) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (x) in (let vuna_cat2' = (") ") in (let vuna_cat3' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | (args, name) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " args) in (let vuna_cat2' = (") ") in (let vuna_cat3' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 145 1 ("no matching clause for Vuna.TypedCodegen.appType")

let rec v_Vuna_dTypedCodegen_docamlType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr name "Int" then C_Vuna_dResult_dOk ("int") else if v_vuna_ueq_ustr name "String" then C_Vuna_dResult_dOk ("string") else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dResult_dOk ("bool") else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dResult_dErr ("List type needs an argument") else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dMaybe_dJust (ty) -> C_Vuna_dResult_dOk (ty)
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dMaybe_dJust (d) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dtypeNameOf name)
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("typed codegen: unknown type ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 118 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 115 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_docamlType decls params a) (fun ta -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_docamlType decls params b) (fun tb -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") -> (") in (let vuna_cat3' = (tb) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: invalid arrow type")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 124 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_docamlType decls params a) (fun ta -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") list") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: invalid List type")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 132 13 ("case pattern match failure")) else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("typed codegen: unknown type constructor ") ^ (name)))
  | C_Vuna_dMaybe_dJust (d) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_docamlType decls params) args) (fun tys -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dappType tys (v_Vuna_dTypedCodegen_dtypeNameOf name)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 137 13 ("case pattern match failure"))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: invalid type application")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 122 7 ("case pattern match failure"))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: invalid type expression")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 108 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dsplitArrows = fun expr -> (match expr with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (a) :: (v_Vuna_dTypedCodegen_dsplitArrows b)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 150 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_drange = fun i n -> if v_vuna_uge_uint i n then [] else (i) :: (v_Vuna_dTypedCodegen_drange (bi_add i 1) n)

let v_Vuna_dTypedCodegen_dgenParams = fun n -> v_Vuna_dList_dmap (fun i -> (("a") ^ (bi_str_from_int i))) (v_Vuna_dTypedCodegen_drange 0 n)

let rec v_Vuna_dTypedCodegen_dparamVarsAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (v_Vuna_dTypedCodegen_dparamVar i) :: (v_Vuna_dTypedCodegen_dparamVarsAt rest (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 168 1 ("no matching clause for Vuna.TypedCodegen.paramVarsAt")

let v_Vuna_dTypedCodegen_dparamVars = fun params -> v_Vuna_dTypedCodegen_dparamVarsAt params 0

let v_Vuna_dTypedCodegen_ddataPrefix = fun params -> (match params with
  | [] -> ""
  | (p) :: ([]) -> ((v_Vuna_dTypedCodegen_dparamVar 0) ^ (" "))
  | _ -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " (v_Vuna_dTypedCodegen_dparamVars params)) in (let vuna_cat2' = (") ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 163 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dAst_dCtor (name, ty, arity, _)) -> (match v_Vuna_dTypedCodegen_dsplitArrows ty with
  | [] -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dctorNameOf name)
  | (only) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_docamlType decls pmap only) (fun t -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" of (") in (let vuna_cat2' = (t) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | fields -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_docamlType decls pmap) fields) (fun ts -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" of ") in (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith " * " (v_Vuna_dList_dmap (fun t -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (t) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) ts)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 174 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 173 1 ("no matching clause for Vuna.TypedCodegen.genCtor")

let v_Vuna_dTypedCodegen_dgenData = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors, _, _)) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenCtor decls (v_Vuna_dTypedCodegen_dparamMap params)) ctors) (fun cs -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("  ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_ddataPrefix params) in (let vuna_cat2' = (v_Vuna_dTypedCodegen_dtypeNameOf name) in (let vuna_cat3' = (" =\n    ") in (let vuna_cat4' = (v_Vuna_dTypedCodegen_djoinWith "\n  | " cs) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 158 1 ("no matching clause for Vuna.TypedCodegen.genData")

let v_Vuna_dTypedCodegen_dgenTypeDeclsOf = fun decls ds -> (match ds with
  | [] -> C_Vuna_dResult_dOk ("")
  | _ -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenData decls) ds) (fun parts -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("type ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 184 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenTypeDecls = fun decls -> v_Vuna_dTypedCodegen_dgenTypeDeclsOf decls (v_Vuna_dTypedCodegen_dnonSpecialData decls)

let rec v_Vuna_dTypedCodegen_dshowForType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr name "Int" then C_Vuna_dResult_dOk ("string_of_int") else if v_vuna_ueq_ustr name "String" then C_Vuna_dResult_dOk ("show_vstring") else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dResult_dOk ("show_vbool") else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dResult_dErr ("typed codegen: List type needs an argument") else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dMaybe_dJust (s) -> C_Vuna_dResult_dOk (s)
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dMaybe_dJust (d) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dshowNameOf name)
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("typed codegen: unknown show type ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 201 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 198 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("->", _) -> C_Vuna_dResult_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dshowForType decls params a) (fun sa -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (") in (let vuna_cat1' = (sa) in (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: invalid List show type")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 209 13 ("case pattern match failure")) else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dMaybe_dJust (d) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForType decls params) args) (fun ss -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("typed codegen: unknown show type constructor ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 214 13 ("case pattern match failure"))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: invalid show type application")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 205 7 ("case pattern match failure"))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: invalid show type")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 191 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dshowForTy = fun decls ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> C_Vuna_dResult_dOk ("(fun _ -> \"<value>\")")
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dResult_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dTypecheck_dTApp (head, args) -> (match head with
  | C_Vuna_dTypecheck_dTCon (n, hargs) -> v_Vuna_dTypedCodegen_dshowForTy decls (C_Vuna_dTypecheck_dTCon (n, v_Vuna_dList_dappend hargs args))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: main type has an unresolved type constructor")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 227 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (name, args) -> if v_vuna_ueq_ustr name "Int" then C_Vuna_dResult_dOk ("string_of_int") else if v_vuna_ueq_ustr name "String" then C_Vuna_dResult_dOk ("show_vstring") else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dResult_dOk ("show_vbool") else if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dshowForTy decls a) (fun sa -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (") in (let vuna_cat1' = (sa) in (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: main List type must have one argument")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 235 9 ("case pattern match failure")) else v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForTy decls) args) (fun ss -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 223 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dfieldVars = fun n -> v_Vuna_dList_dmap (fun i -> (("f") ^ (bi_str_from_int i))) (v_Vuna_dTypedCodegen_drange 0 n)

let rec v_Vuna_dTypedCodegen_dgenShowFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, pmap, [], []) -> C_Vuna_dResult_dOk ([])
  | (decls, pmap, (f) :: (fs), (v) :: (vs)) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dshowForType decls pmap f) (fun s -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenShowFields decls pmap fs vs) (fun ss -> C_Vuna_dResult_dOk (((let vuna_cat0' = ("(") in (let vuna_cat1' = (s) in (let vuna_cat2' = (") ") in (let vuna_cat3' = (v) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (ss))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 244 1 ("no matching clause for Vuna.TypedCodegen.genShowFields")

let v_Vuna_dTypedCodegen_dgenShowCtorWith = fun decls pmap name fields -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenShowFields decls pmap fields (v_Vuna_dTypedCodegen_dfieldVars (v_Vuna_dList_dlength fields))) (fun shows -> (match v_Vuna_dTypedCodegen_dfieldVars (v_Vuna_dList_dlength fields) with
  | [] -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_docamlString (v_Vuna_dTypedCodegen_dlastName name)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | (v) :: ([]) -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v) in (let vuna_cat4' = (" -> show_ctor ") in (let vuna_cat5' = (v_Vuna_dTypedCodegen_docamlString (v_Vuna_dTypedCodegen_dlastName name)) in (let vuna_cat6' = (" [") in (let vuna_cat7' = (v_Vuna_dTypedCodegen_djoinWith "; " shows) in (let vuna_cat8' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8']))))))))))
  | vars -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith ", " vars) in (let vuna_cat4' = (") -> show_ctor ") in (let vuna_cat5' = (v_Vuna_dTypedCodegen_docamlString (v_Vuna_dTypedCodegen_dlastName name)) in (let vuna_cat6' = (" [") in (let vuna_cat7' = (v_Vuna_dTypedCodegen_djoinWith "; " shows) in (let vuna_cat8' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8']))))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 254 5 ("case pattern match failure")))

let v_Vuna_dTypedCodegen_dgenShowCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dAst_dCtor (name, ty, arity, _)) -> v_Vuna_dTypedCodegen_dgenShowCtorWith decls pmap name (v_Vuna_dTypedCodegen_dsplitArrows ty)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 250 1 ("no matching clause for Vuna.TypedCodegen.genShowCtor")

let v_Vuna_dTypedCodegen_dshowAnnotation = fun params name -> (let vars = v_Vuna_dTypedCodegen_dparamVars params in (let vuna_cat0' = (v_Vuna_dTypedCodegen_djoinWith " " vars) in (let vuna_cat1' = (". ") in (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith " -> " (v_Vuna_dList_dappend (v_Vuna_dList_dmap (fun v -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v) in (let vuna_cat2' = (" -> string)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) vars) ((v_Vuna_dTypedCodegen_dappType vars (v_Vuna_dTypedCodegen_dtypeNameOf name)) :: (("string") :: ([]))))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dTypedCodegen_dpairSecond = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (_, v)) -> v
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 281 1 ("no matching clause for Vuna.TypedCodegen.pairSecond")

let v_Vuna_dTypedCodegen_dgenShowBody = fun pmap params name arms -> (match v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dpairSecond pmap with
  | [] -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dshowNameOf name) in (let vuna_cat1' = (" v =\n  match v with\n") in (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith "\n" arms) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | pvars -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dshowNameOf name) in (let vuna_cat1' = (" : ") in (let vuna_cat2' = (v_Vuna_dTypedCodegen_dshowAnnotation params name) in (let vuna_cat3' = (" = fun ") in (let vuna_cat4' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dList_dappend pvars (("v") :: ([])))) in (let vuna_cat5' = (" -> match v with\n") in (let vuna_cat6' = (v_Vuna_dTypedCodegen_djoinWith "\n" arms) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 269 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenShowFuncWith = fun decls pmap params name ctors -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowCtor decls pmap) ctors) (fun arms -> v_Vuna_dTypedCodegen_dgenShowBody pmap params name arms)

let v_Vuna_dTypedCodegen_dgenShowFunc = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors, _, _)) -> v_Vuna_dTypedCodegen_dgenShowFuncWith decls (v_Vuna_dTypedCodegen_dshowParamMap params) params name ctors
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 259 1 ("no matching clause for Vuna.TypedCodegen.genShowFunc")

let v_Vuna_dTypedCodegen_dshowDeclFnName = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> v_Vuna_dTypedCodegen_dshowNameOf name
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 284 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dshowFnNames = fun decls -> v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dshowDeclFnName (v_Vuna_dTypedCodegen_dnonSpecialData decls)

let rec v_Vuna_dTypedCodegen_dgenPat = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dResult_dOk ("_")
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dsanitizeName name)
  | C_Vuna_dAst_dPInt (n, _) -> C_Vuna_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dAst_dPStr (s, _) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_docamlString s)
  | C_Vuna_dAst_dPCon (name, pats, _) -> (match name with
  | "Nil" -> C_Vuna_dResult_dOk ("[]")
  | "True" -> C_Vuna_dResult_dOk ("true")
  | "False" -> C_Vuna_dResult_dOk ("false")
  | "Cons" -> (match pats with
  | (h) :: ((t) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenPat h) (fun ph -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenPat t) (fun pt -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ph) in (let vuna_cat2' = (") :: (") in (let vuna_cat3' = (pt) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: Cons pattern arity")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 341 11 ("case pattern match failure"))
  | _ -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult v_Vuna_dTypedCodegen_dgenPat pats) (fun ps -> (match ps with
  | [] -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dctorNameOf name)
  | (p) :: ([]) -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (p) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith ", " ps) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 348 13 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 336 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 330 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dpatVars = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> []
  | C_Vuna_dAst_dPVar (name, _) -> (name) :: ([])
  | C_Vuna_dAst_dPInt (n, _) -> []
  | C_Vuna_dAst_dPStr (s, _) -> []
  | C_Vuna_dAst_dPCon (name, pats, _) -> v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 354 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dconcatFlatten = fun e -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("++", _), (a) :: ((b) :: ([])), _) -> v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_dconcatFlatten a) (v_Vuna_dTypedCodegen_dconcatFlatten b)
  | _ -> (e) :: ([])
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 401 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dnoLocSpan = C_Vuna_dBase_dSpan ("", 0, 0, 0, 0)

let rec v_Vuna_dTypedCodegen_dfoldStringLiterals = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dAst_dEStr (s, _)) :: (rest)) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals rest with
  | (C_Vuna_dAst_dEStr (s2, _)) :: (rest2) -> (C_Vuna_dAst_dEStr (((s) ^ (s2)), v_Vuna_dTypedCodegen_dnoLocSpan)) :: (rest2)
  | folded -> (C_Vuna_dAst_dEStr (s, v_Vuna_dTypedCodegen_dnoLocSpan)) :: (folded)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 410 3 ("case pattern match failure"))
  | ((e) :: (rest)) -> (e) :: (v_Vuna_dTypedCodegen_dfoldStringLiterals rest)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 408 1 ("no matching clause for Vuna.TypedCodegen.foldStringLiterals")

let v_Vuna_dTypedCodegen_dzeroArgBody = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dJust (0) -> (match v_Vuna_dAst_dclausesFor decls name with
  | (C_Vuna_dPair_dPair ([], body)) :: ([]) -> C_Vuna_dMaybe_dJust (body)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 419 7 ("case pattern match failure"))
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 417 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dallPureExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, seen, []) -> true
  | (decls, seen, (e) :: (rest)) -> (if (v_Vuna_dTypedCodegen_dpureExpr decls seen e) then (v_Vuna_dTypedCodegen_dallPureExpr decls seen rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 424 1 ("no matching clause for Vuna.TypedCodegen.allPureExpr")
and v_Vuna_dTypedCodegen_dpureExpr = fun decls seen e -> (match e with
  | C_Vuna_dAst_dEInt (n, _) -> true
  | C_Vuna_dAst_dEStr (s, _) -> true
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dList_dmemName name seen then false else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (0) -> true
  | _ -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls name with
  | C_Vuna_dMaybe_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: (seen)) body
  | C_Vuna_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 437 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 434 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("++", _) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals (v_Vuna_dTypedCodegen_dconcatFlatten e) with
  | (C_Vuna_dAst_dEStr (_, _)) :: ([]) -> true
  | _ -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 443 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (_) -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args
  | C_Vuna_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 447 11 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 441 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 428 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disPureZeroArg = fun decls name -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls name with
  | C_Vuna_dMaybe_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: ([])) body
  | C_Vuna_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 454 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dzeroArgRef = fun decls name -> if v_Vuna_dTypedCodegen_disPureZeroArg decls name then v_Vuna_dTypedCodegen_dvalueName name else ((v_Vuna_dTypedCodegen_dvalueName name) ^ (" ()"))

let v_Vuna_dTypedCodegen_dconcatBindingName = fun i -> (let vuna_cat0' = ("vuna_cat") in (let vuna_cat1' = (bi_str_from_int i) in (let vuna_cat2' = ("'") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dTypedCodegen_dwrapConcatBindings = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((C_Vuna_dPair_dPair (n, code)) :: (rest), body) -> (let vuna_cat0' = ("(let ") in (let vuna_cat1' = (n) in (let vuna_cat2' = (" = (") in (let vuna_cat3' = (code) in (let vuna_cat4' = (") in ") in (let vuna_cat5' = (v_Vuna_dTypedCodegen_dwrapConcatBindings rest body) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 471 1 ("no matching clause for Vuna.TypedCodegen.wrapConcatBindings")

let v_Vuna_dTypedCodegen_dbuiltinName = fun a0 -> match a0 with
  | ("+") -> C_Vuna_dMaybe_dJust ("bi_add")
  | ("+") -> C_Vuna_dMaybe_dJust ("bi_add")
  | ("-") -> C_Vuna_dMaybe_dJust ("bi_sub")
  | ("*") -> C_Vuna_dMaybe_dJust ("bi_mul")
  | ("/") -> C_Vuna_dMaybe_dJust ("bi_div")
  | ("==") -> C_Vuna_dMaybe_dJust ("bi_eq")
  | ("/=") -> C_Vuna_dMaybe_dJust ("bi_neq")
  | ("<") -> C_Vuna_dMaybe_dJust ("bi_lt")
  | ("<=") -> C_Vuna_dMaybe_dJust ("bi_le")
  | (">") -> C_Vuna_dMaybe_dJust ("bi_gt")
  | (">=") -> C_Vuna_dMaybe_dJust ("bi_ge")
  | ("&&") -> C_Vuna_dMaybe_dJust ("bi_and")
  | ("||") -> C_Vuna_dMaybe_dJust ("bi_or")
  | ("++") -> C_Vuna_dMaybe_dJust ("bi_concat")
  | ("bi_show_string") -> C_Vuna_dMaybe_dJust ("bi_show_string")
  | ("bi_eq_generic") -> C_Vuna_dMaybe_dJust ("bi_eq_generic")
  | ("bi_neq_generic") -> C_Vuna_dMaybe_dJust ("bi_neq_generic")
  | ("bi_lt_generic") -> C_Vuna_dMaybe_dJust ("bi_lt_generic")
  | ("bi_le_generic") -> C_Vuna_dMaybe_dJust ("bi_le_generic")
  | ("bi_gt_generic") -> C_Vuna_dMaybe_dJust ("bi_gt_generic")
  | ("bi_ge_generic") -> C_Vuna_dMaybe_dJust ("bi_ge_generic")
  | ("bi_eq_int") -> C_Vuna_dMaybe_dJust ("bi_eq_int")
  | ("bi_neq_int") -> C_Vuna_dMaybe_dJust ("bi_neq_int")
  | ("bi_lt_int") -> C_Vuna_dMaybe_dJust ("bi_lt_int")
  | ("bi_le_int") -> C_Vuna_dMaybe_dJust ("bi_le_int")
  | ("bi_gt_int") -> C_Vuna_dMaybe_dJust ("bi_gt_int")
  | ("bi_ge_int") -> C_Vuna_dMaybe_dJust ("bi_ge_int")
  | ("bi_eq_str") -> C_Vuna_dMaybe_dJust ("bi_eq_str")
  | ("bi_neq_str") -> C_Vuna_dMaybe_dJust ("bi_neq_str")
  | ("bi_eq_bool") -> C_Vuna_dMaybe_dJust ("bi_eq_bool")
  | ("bi_neq_bool") -> C_Vuna_dMaybe_dJust ("bi_neq_bool")
  | ("strLength") -> C_Vuna_dMaybe_dJust ("bi_str_length")
  | ("strUnpack") -> C_Vuna_dMaybe_dJust ("bi_str_unpack")
  | ("strPack") -> C_Vuna_dMaybe_dJust ("bi_str_pack")
  | ("strFromInt") -> C_Vuna_dMaybe_dJust ("bi_str_from_int")
  | ("readFile") -> C_Vuna_dMaybe_dJust ("bi_read_file")
  | ("writeFile") -> C_Vuna_dMaybe_dJust ("bi_write_file")
  | ("print") -> C_Vuna_dMaybe_dJust ("bi_print")
  | ("getArgs") -> C_Vuna_dMaybe_dJust ("bi_get_args")
  | ("readLine") -> C_Vuna_dMaybe_dJust ("bi_read_line")
  | ("readDir") -> C_Vuna_dMaybe_dJust ("bi_read_dir")
  | ("isDirectory") -> C_Vuna_dMaybe_dJust ("bi_is_directory")
  | ("makeDir") -> C_Vuna_dMaybe_dJust ("bi_make_dir")
  | ("removeFile") -> C_Vuna_dMaybe_dJust ("bi_remove_file")
  | ("fileExists") -> C_Vuna_dMaybe_dJust ("bi_file_exists")
  | ("exit") -> C_Vuna_dMaybe_dJust ("bi_exit")
  | ("prim_readFile") -> C_Vuna_dMaybe_dJust ("bi_read_file")
  | ("prim_writeFile") -> C_Vuna_dMaybe_dJust ("bi_write_file")
  | ("prim_print") -> C_Vuna_dMaybe_dJust ("bi_print")
  | ("prim_getArgs") -> C_Vuna_dMaybe_dJust ("bi_get_args")
  | ("prim_readLine") -> C_Vuna_dMaybe_dJust ("bi_read_line")
  | ("prim_readDir") -> C_Vuna_dMaybe_dJust ("bi_read_dir")
  | ("prim_isDirectory") -> C_Vuna_dMaybe_dJust ("bi_is_directory")
  | ("prim_makeDir") -> C_Vuna_dMaybe_dJust ("bi_make_dir")
  | ("prim_removeFile") -> C_Vuna_dMaybe_dJust ("bi_remove_file")
  | ("prim_fileExists") -> C_Vuna_dMaybe_dJust ("bi_file_exists")
  | ("prim_exit") -> C_Vuna_dMaybe_dJust ("bi_exit")
  | (_) -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 486 1 ("no matching clause for Vuna.TypedCodegen.builtinName")

let v_Vuna_dTypedCodegen_disAtomicExpr = fun decls env e -> (match e with
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dList_dmemName name env then true else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (arity) -> if v_vuna_ueq_uint arity 0 then true else false
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dTypedCodegen_dbuiltinName name with
  | C_Vuna_dMaybe_dJust (ref) -> if (if ((if ((if (v_vuna_ueq_ustr name "getArgs") then true else (v_vuna_ueq_ustr name "readLine"))) then true else (v_vuna_ueq_ustr name "prim_getArgs"))) then true else (v_vuna_ueq_ustr name "prim_readLine")) then false else true
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dJust (0) -> v_Vuna_dTypedCodegen_disPureZeroArg decls name
  | C_Vuna_dMaybe_dJust (_) -> true
  | C_Vuna_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 378 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 375 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 372 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, _) -> true
  | C_Vuna_dAst_dEStr (s, _) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 368 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dformatArg = fun decls env e code -> if v_Vuna_dTypedCodegen_disAtomicExpr decls env e then code else (let vuna_cat0' = ("(") in (let vuna_cat1' = (code) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dTypedCodegen_dapplyArgs = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], []) -> ""
  | (decls, env, (c) :: (cs), (e) :: (es)) -> (let vuna_cat0' = (" ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dformatArg decls env e c) in (let vuna_cat2' = (v_Vuna_dTypedCodegen_dapplyArgs decls env cs es) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | (decls, env, _, _) -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 389 1 ("no matching clause for Vuna.TypedCodegen.applyArgs")

let v_Vuna_dTypedCodegen_dgenAppAware = fun decls env fn args fCode argCodes -> (let head = if v_Vuna_dTypedCodegen_disAtomicExpr decls env fn then fCode else (let vuna_cat0' = ("(") in (let vuna_cat1' = (fCode) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in ((head) ^ (v_Vuna_dTypedCodegen_dapplyArgs decls env argCodes args)))

let v_Vuna_dTypedCodegen_dgenCatchAll = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec), msg) -> if v_vuna_ueq_uint sl 0 then (let vuna_cat0' = ("  | _ -> vuna_fail \"\" 0 0 (") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_docamlString msg) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else (let vuna_cat0' = ("  | _ -> vuna_fail ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_docamlString f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (bi_str_from_int sl) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (bi_str_from_int sc) in (let vuna_cat6' = (" (") in (let vuna_cat7' = (v_Vuna_dTypedCodegen_docamlString msg) in (let vuna_cat8' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 648 1 ("no matching clause for Vuna.TypedCodegen.genCatchAll")

let rec v_Vuna_dTypedCodegen_drecBindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dPair_dPair (C_Vuna_dAst_dPVar (name, _), _)) :: (rest)) -> (name) :: (v_Vuna_dTypedCodegen_drecBindNames rest)
  | ((C_Vuna_dPair_dPair (_, _)) :: (_)) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 661 1 ("no matching clause for Vuna.TypedCodegen.recBindNames")

let v_Vuna_dTypedCodegen_disIrrefutable = fun p -> (match p with
  | C_Vuna_dAst_dPVar (_, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 688 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disVarPattern = fun p -> (match p with
  | C_Vuna_dAst_dPVar (_, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 694 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dallVarPatterns = fun a0 -> match a0 with
  | ([]) -> true
  | ((p) :: (rest)) -> (if (v_Vuna_dTypedCodegen_disVarPattern p) then (v_Vuna_dTypedCodegen_dallVarPatterns rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 699 1 ("no matching clause for Vuna.TypedCodegen.allVarPatterns")

let v_Vuna_dTypedCodegen_dpatParam = fun p -> (match p with
  | C_Vuna_dAst_dPVar (name, _) -> v_Vuna_dTypedCodegen_dsanitizeName name
  | _ -> "_"
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 703 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfunSpan = fun decls name -> (match decls with
  | [] -> v_Vuna_dTypedCodegen_dnoLocSpan
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then sp else v_Vuna_dTypedCodegen_dfunSpan rest name
  | _ -> v_Vuna_dTypedCodegen_dfunSpan rest name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 712 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 709 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_ddeclFunName = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> name
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 746 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_vuna_ueq_ustr name "" then v_Vuna_dTypedCodegen_duniqueNames rest else if v_Vuna_dList_dmemName name rest then v_Vuna_dTypedCodegen_duniqueNames rest else (name) :: (v_Vuna_dTypedCodegen_duniqueNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 750 1 ("no matching clause for Vuna.TypedCodegen.uniqueNames")

let v_Vuna_dTypedCodegen_dfunctionNames = fun decls -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dmap v_Vuna_dTypedCodegen_ddeclFunName decls)

let rec v_Vuna_dTypedCodegen_dfilterNames = fun pred names -> (match names with
  | [] -> []
  | (n) :: (rest) -> if pred n then (n) :: (v_Vuna_dTypedCodegen_dfilterNames pred rest) else v_Vuna_dTypedCodegen_dfilterNames pred rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 758 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dnotIn = fun name names -> if v_Vuna_dList_dmemName name names then false else true

let rec v_Vuna_dTypedCodegen_dneighborsOf = fun adj name -> (match adj with
  | [] -> []
  | (C_Vuna_dPair_dPair (n, ns)) :: (rest) -> if v_vuna_ueq_ustr n name then ns else v_Vuna_dTypedCodegen_dneighborsOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 767 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_ddependentsOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (C_Vuna_dPair_dPair (n, ns)) :: (rest)) -> (let dep = v_Vuna_dTypedCodegen_ddependentsOf name rest in if v_Vuna_dList_dmemName name ns then (n) :: (dep) else dep)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 777 1 ("no matching clause for Vuna.TypedCodegen.dependentsOf")

let v_Vuna_dTypedCodegen_dreverseAdj = fun names adj -> v_Vuna_dList_dmap (fun n -> C_Vuna_dPair_dPair (n, v_Vuna_dTypedCodegen_ddependentsOf n adj)) names

let rec v_Vuna_dTypedCodegen_dfoldNeighborsPost = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], visited, order) -> C_Vuna_dPair_dPair (visited, order)
  | (adj, (m) :: (rest), visited, order) -> if v_Vuna_dList_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsPost adj rest visited order else (match v_Vuna_dTypedCodegen_ddfsPost adj m ((m) :: (visited)) order with
  | C_Vuna_dPair_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dfoldNeighborsPost adj rest visited2 order2
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 790 5 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 786 1 ("no matching clause for Vuna.TypedCodegen.foldNeighborsPost")
and v_Vuna_dTypedCodegen_ddfsPost = fun adj n visited order -> (match v_Vuna_dTypedCodegen_dfoldNeighborsPost adj (v_Vuna_dTypedCodegen_dneighborsOf adj n) visited order with
  | C_Vuna_dPair_dPair (visited2, order2) -> C_Vuna_dPair_dPair (visited2, (n) :: (order2))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 795 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dpostOrder = fun adj nodes visited order -> (match nodes with
  | [] -> C_Vuna_dPair_dPair (visited, order)
  | (n) :: (rest) -> if v_Vuna_dList_dmemName n visited then v_Vuna_dTypedCodegen_dpostOrder adj rest visited order else (match v_Vuna_dTypedCodegen_ddfsPost adj n ((n) :: (visited)) order with
  | C_Vuna_dPair_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dpostOrder adj rest visited2 order2
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 805 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 800 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfoldNeighborsCollect = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (revAdj, [], visited, comp) -> C_Vuna_dPair_dPair (visited, comp)
  | (revAdj, (m) :: (rest), visited, comp) -> if v_Vuna_dList_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsCollect revAdj rest visited comp else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj m ((m) :: (visited)) comp with
  | C_Vuna_dPair_dPair (visited2, comp2) -> v_Vuna_dTypedCodegen_dfoldNeighborsCollect revAdj rest visited2 comp2
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 813 5 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 809 1 ("no matching clause for Vuna.TypedCodegen.foldNeighborsCollect")
and v_Vuna_dTypedCodegen_ddfsCollect = fun revAdj n visited comp -> (match v_Vuna_dTypedCodegen_dfoldNeighborsCollect revAdj (v_Vuna_dTypedCodegen_dneighborsOf revAdj n) visited comp with
  | C_Vuna_dPair_dPair (visited2, comp2) -> C_Vuna_dPair_dPair (visited2, (n) :: (comp2))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 818 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dcollectComps = fun revAdj nodes visited comps -> (match nodes with
  | [] -> comps
  | (n) :: (rest) -> if v_Vuna_dList_dmemName n visited then v_Vuna_dTypedCodegen_dcollectComps revAdj rest visited comps else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj n ((n) :: (visited)) [] with
  | C_Vuna_dPair_dPair (visited2, comp) -> v_Vuna_dTypedCodegen_dcollectComps revAdj rest visited2 ((comp) :: (comps))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 828 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 823 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dcomponentOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> C_Vuna_dMaybe_dNothing
  | ((g) :: (rest), name) -> if v_Vuna_dList_dmemName name g then C_Vuna_dMaybe_dJust (g) else v_Vuna_dTypedCodegen_dcomponentOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 832 1 ("no matching clause for Vuna.TypedCodegen.componentOf")

let rec v_Vuna_dTypedCodegen_dgroupsFromCompsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (comps, allNames, [], emitted) -> []
  | (comps, allNames, (n) :: (rest), emitted) -> if v_Vuna_dList_dmemName n emitted then v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest emitted else (match v_Vuna_dTypedCodegen_dcomponentOf comps n with
  | C_Vuna_dMaybe_dJust (g) -> (v_Vuna_dTypedCodegen_dfilterNames (fun m -> v_Vuna_dList_dmemName m g) allNames) :: (v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest (v_Vuna_dList_dappend g emitted))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest emitted
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 846 5 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 842 1 ("no matching clause for Vuna.TypedCodegen.groupsFromCompsGo")

let v_Vuna_dTypedCodegen_dgroupsFromComps = fun comps names -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps names names []

let v_Vuna_dTypedCodegen_dgroupDeps = fun adj group -> v_Vuna_dTypedCodegen_dfilterNames (fun n -> v_Vuna_dTypedCodegen_dnotIn n group) (v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dconcatMap (v_Vuna_dTypedCodegen_dneighborsOf adj) group))

let rec v_Vuna_dTypedCodegen_dallIn = fun names allowed -> (match names with
  | [] -> true
  | (n) :: (rest) -> if v_Vuna_dList_dmemName n allowed then v_Vuna_dTypedCodegen_dallIn rest allowed else false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 857 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgroupReady = fun adj group emitted -> v_Vuna_dTypedCodegen_dallIn (v_Vuna_dTypedCodegen_dgroupDeps adj group) emitted

let rec v_Vuna_dTypedCodegen_dpickReadyAcc = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], before, emitted) -> C_Vuna_dMaybe_dNothing
  | (adj, (g) :: (rest), before, emitted) -> if v_Vuna_dTypedCodegen_dgroupReady adj g emitted then C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (g, v_Vuna_dList_dappend (v_Vuna_dList_dreverse before) rest)) else v_Vuna_dTypedCodegen_dpickReadyAcc adj rest ((g) :: (before)) emitted
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 866 1 ("no matching clause for Vuna.TypedCodegen.pickReadyAcc")

let v_Vuna_dTypedCodegen_dpickReady = fun adj groups emitted -> v_Vuna_dTypedCodegen_dpickReadyAcc adj groups [] emitted

let rec v_Vuna_dTypedCodegen_dorderGroupsAcc = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, [], emitted) -> C_Vuna_dResult_dOk ([])
  | (adj, remaining, emitted) -> (match v_Vuna_dTypedCodegen_dpickReady adj remaining emitted with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("typed codegen: dependency cycle between groups")
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (g, rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dorderGroupsAcc adj rest (v_Vuna_dList_dappend g emitted)) (fun tail -> C_Vuna_dResult_dOk ((g) :: (tail)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 876 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 874 1 ("no matching clause for Vuna.TypedCodegen.orderGroupsAcc")

let v_Vuna_dTypedCodegen_dorderGroups = fun adj groups -> v_Vuna_dTypedCodegen_dorderGroupsAcc adj groups []

let rec v_Vuna_dTypedCodegen_dunionNames = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> if v_Vuna_dList_dmemName x ys then v_Vuna_dTypedCodegen_dunionNames rest ys else (x) :: (v_Vuna_dTypedCodegen_dunionNames rest ys)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 924 1 ("no matching clause for Vuna.TypedCodegen.unionNames")

let rec v_Vuna_dTypedCodegen_dexprRefs = fun expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> (name) :: ([])
  | C_Vuna_dAst_dEInt (n, _) -> []
  | C_Vuna_dAst_dEStr (s, _) -> []
  | C_Vuna_dAst_dEApp (fn, args, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs fn) (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dexprRefs args)
  | C_Vuna_dAst_dELam (params, body, _) -> v_Vuna_dTypedCodegen_dexprRefs body
  | C_Vuna_dAst_dELet (binds, body, _, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dbindRefs binds) (v_Vuna_dTypedCodegen_dexprRefs body)
  | C_Vuna_dAst_dECase (scrut, alts, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs scrut) (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_daltRefs alts)
  | C_Vuna_dAst_dEIf (c, t, e, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs c) (v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs t) (v_Vuna_dTypedCodegen_dexprRefs e))
  | C_Vuna_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs dom) (v_Vuna_dTypedCodegen_dexprRefs cod)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 906 3 ("case pattern match failure"))
and v_Vuna_dTypedCodegen_dbindRefs = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (pat, value)) -> v_Vuna_dTypedCodegen_dexprRefs value
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 918 1 ("no matching clause for Vuna.TypedCodegen.bindRefs")
and v_Vuna_dTypedCodegen_daltRefs = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (pat, body)) -> v_Vuna_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 921 1 ("no matching clause for Vuna.TypedCodegen.altRefs")

let v_Vuna_dTypedCodegen_dclauseRefs = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (pats, body)) -> v_Vuna_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 902 1 ("no matching clause for Vuna.TypedCodegen.clauseRefs")

let v_Vuna_dTypedCodegen_dgenFunctionRefs = fun decls name -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dclauseRefs (v_Vuna_dAst_dclausesFor decls name))

let v_Vuna_dTypedCodegen_dgroupNeedsRec = fun decls group -> (match group with
  | [] -> false
  | (n) :: ([]) -> v_Vuna_dList_dmemName n (v_Vuna_dTypedCodegen_dgenFunctionRefs decls n)
  | _ -> true
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 888 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_druntimePrelude = (C_Vuna_dPair_dPair ("vuna_fail", "let vuna_fail file line col msg =
  if line = 0 then failwith msg
  else failwith (file ^ \":\" ^ string_of_int line ^ \":\" ^ string_of_int col ^ \": \" ^ msg)
")) :: ((C_Vuna_dPair_dPair ("bi_add", "let bi_add a b = a + b\n")) :: ((C_Vuna_dPair_dPair ("bi_sub", "let bi_sub a b = a - b\n")) :: ((C_Vuna_dPair_dPair ("bi_mul", "let bi_mul a b = a * b\n")) :: ((C_Vuna_dPair_dPair ("bi_div", "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n")) :: ((C_Vuna_dPair_dPair ("bi_eq", "let bi_eq a b = a = b\n")) :: ((C_Vuna_dPair_dPair ("bi_neq", "let bi_neq a b = a <> b\n")) :: ((C_Vuna_dPair_dPair ("bi_lt", "let bi_lt a b = a < b\n")) :: ((C_Vuna_dPair_dPair ("bi_le", "let bi_le a b = a <= b\n")) :: ((C_Vuna_dPair_dPair ("bi_gt", "let bi_gt a b = a > b\n")) :: ((C_Vuna_dPair_dPair ("bi_ge", "let bi_ge a b = a >= b\n")) :: ((C_Vuna_dPair_dPair ("bi_eq_int", "let bi_eq_int (a : int) (b : int) = a = b\n")) :: ((C_Vuna_dPair_dPair ("bi_neq_int", "let bi_neq_int (a : int) (b : int) = a <> b\n")) :: ((C_Vuna_dPair_dPair ("bi_lt_int", "let bi_lt_int (a : int) (b : int) = a < b\n")) :: ((C_Vuna_dPair_dPair ("bi_le_int", "let bi_le_int (a : int) (b : int) = a <= b\n")) :: ((C_Vuna_dPair_dPair ("bi_gt_int", "let bi_gt_int (a : int) (b : int) = a > b\n")) :: ((C_Vuna_dPair_dPair ("bi_ge_int", "let bi_ge_int (a : int) (b : int) = a >= b\n")) :: ((C_Vuna_dPair_dPair ("bi_eq_str", "let bi_eq_str (a : string) (b : string) = a = b\n")) :: ((C_Vuna_dPair_dPair ("bi_neq_str", "let bi_neq_str (a : string) (b : string) = a <> b\n")) :: ((C_Vuna_dPair_dPair ("bi_eq_bool", "let bi_eq_bool (a : bool) (b : bool) = a = b\n")) :: ((C_Vuna_dPair_dPair ("bi_neq_bool", "let bi_neq_bool (a : bool) (b : bool) = a <> b\n")) :: ((C_Vuna_dPair_dPair ("bi_and", "let bi_and a b = a && b\n")) :: ((C_Vuna_dPair_dPair ("bi_or", "let bi_or a b = a || b\n")) :: ((C_Vuna_dPair_dPair ("bi_concat", "let bi_concat a b = a ^ b\n")) :: ((C_Vuna_dPair_dPair ("bi_str_length", "let bi_str_length a = String.length a\n")) :: ((C_Vuna_dPair_dPair ("bi_str_unpack", "let bi_str_unpack s =
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (Char.code s.[i] :: acc)
  in
  go (String.length s - 1) []
")) :: ((C_Vuna_dPair_dPair ("bi_str_pack", "let bi_str_pack cs =
  let buf = Buffer.create 16 in
  let rec go = function
    | [] -> ()
    | c :: rest -> Buffer.add_char buf (Char.chr c); go rest
  in
  go cs;
  Buffer.contents buf
")) :: ((C_Vuna_dPair_dPair ("bi_str_from_int", "let bi_str_from_int n = string_of_int n\n")) :: ((C_Vuna_dPair_dPair ("bi_read_file", "let bi_read_file path =
  try
    let ch = open_in_bin path in
    Fun.protect ~finally:(fun () -> close_in_noerr ch)
      (fun () -> really_input_string ch (in_channel_length ch))
  with Sys_error msg -> failwith (\"readFile: \" ^ msg)
")) :: ((C_Vuna_dPair_dPair ("bi_write_file", "let bi_write_file path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)
")) :: ((C_Vuna_dPair_dPair ("bi_print", "let bi_print s = print_string s; flush stdout; String.length s\n")) :: ((C_Vuna_dPair_dPair ("bi_file_exists", "let bi_file_exists path = Sys.file_exists path\n")) :: ((C_Vuna_dPair_dPair ("bi_exit", "let bi_exit n = exit n\n")) :: ((C_Vuna_dPair_dPair ("bi_get_args", "let bi_get_args () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
")) :: ((C_Vuna_dPair_dPair ("bi_read_line", "let bi_read_line () = try input_line stdin with End_of_file -> \"\"\n")) :: ((C_Vuna_dPair_dPair ("bi_read_dir", "let bi_read_dir path =
  try List.sort compare (Array.to_list (Sys.readdir path))
  with Sys_error msg -> failwith (\"readDir: \" ^ msg)
")) :: ((C_Vuna_dPair_dPair ("bi_is_directory", "let bi_is_directory path =
  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)
")) :: ((C_Vuna_dPair_dPair ("bi_make_dir", "let bi_make_dir path =
  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))
  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)
")) :: ((C_Vuna_dPair_dPair ("bi_remove_file", "let bi_remove_file path =
  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)
  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)
")) :: ((C_Vuna_dPair_dPair ("show_ctor", "let show_ctor name args = if args = [] then name else \"(\" ^ name ^ \" \" ^ String.concat \" \" args ^ \")\"
")) :: ((C_Vuna_dPair_dPair ("show_vbool", "let show_vbool b = if b then \"True\" else \"False\"\n")) :: ((C_Vuna_dPair_dPair ("show_vstring", "let show_vstring s =
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
")) :: ((C_Vuna_dPair_dPair ("bi_show_string", "let bi_show_string s = show_vstring s\n")) :: ((C_Vuna_dPair_dPair ("bi_eq_generic", "let bi_eq_generic (a : 'a) (b : 'a) = a = b\n")) :: ((C_Vuna_dPair_dPair ("bi_neq_generic", "let bi_neq_generic (a : 'a) (b : 'a) = a <> b\n")) :: ((C_Vuna_dPair_dPair ("bi_lt_generic", "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n")) :: ((C_Vuna_dPair_dPair ("bi_le_generic", "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n")) :: ((C_Vuna_dPair_dPair ("bi_gt_generic", "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n")) :: ((C_Vuna_dPair_dPair ("bi_ge_generic", "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n")) :: ((C_Vuna_dPair_dPair ("show_vlist", "let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =
  match v with
  | [] -> \"Nil\"
  | x :: xs -> \"(Cons \" ^ show_elem x ^ \" \" ^ show_vlist show_elem xs ^ \")\"
")) :: ([]))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dTypedCodegen_druntimeCodeTyped = fun () -> (("\n") ^ (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dList_dmap v_Vuna_dPair_dsecondOf v_Vuna_dTypedCodegen_druntimePrelude)))

let rec v_Vuna_dTypedCodegen_dstartsWith = fun a0 a1 -> match (a0, a1) with
  | ([], hay) -> true
  | ((c) :: (cs), []) -> false
  | ((c) :: (cs), (h) :: (hs)) -> if v_vuna_ueq_ugeneric c h then v_Vuna_dTypedCodegen_dstartsWith cs hs else false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1006 1 ("no matching clause for Vuna.TypedCodegen.startsWith")

let rec v_Vuna_dTypedCodegen_dcountName = fun a0 a1 -> match (a0, a1) with
  | (needle, []) -> 0
  | (needle, (c) :: (rest)) -> if v_Vuna_dTypedCodegen_dstartsWith needle ((c) :: (rest)) then bi_add 1 (v_Vuna_dTypedCodegen_dcountName needle (v_Vuna_dList_ddrop (v_Vuna_dList_dlength needle) ((c) :: (rest)))) else v_Vuna_dTypedCodegen_dcountName needle rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 299 1 ("no matching clause for Vuna.TypedCodegen.countName")

let v_Vuna_dTypedCodegen_dselfRecursive = fun name code -> v_vuna_ugt_uint (v_Vuna_dTypedCodegen_dcountName (bi_str_unpack name) (bi_str_unpack code)) 1

let rec v_Vuna_dTypedCodegen_dcontainsName = fun a0 a1 -> match (a0, a1) with
  | (needle, []) -> false
  | (needle, (h) :: (hs)) -> if v_Vuna_dTypedCodegen_dstartsWith needle ((h) :: (hs)) then true else v_Vuna_dTypedCodegen_dcontainsName needle hs
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1010 1 ("no matching clause for Vuna.TypedCodegen.containsName")

let rec v_Vuna_dTypedCodegen_dcodeRefsOther = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (self, code, []) -> false
  | (self, code, (n) :: (rest)) -> if v_vuna_ueq_ustr n self then v_Vuna_dTypedCodegen_dcodeRefsOther self code rest else if v_Vuna_dTypedCodegen_dcontainsName (bi_str_unpack n) (bi_str_unpack code) then true else v_Vuna_dTypedCodegen_dcodeRefsOther self code rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 292 1 ("no matching clause for Vuna.TypedCodegen.codeRefsOther")

let rec v_Vuna_dTypedCodegen_dpartsNeedRec = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], names) -> false
  | ((d) :: (ds), (code) :: (rest), names) -> if v_Vuna_dTypedCodegen_dcodeRefsOther (v_Vuna_dTypedCodegen_dshowDeclFnName d) code names then true else if v_Vuna_dTypedCodegen_dselfRecursive (v_Vuna_dTypedCodegen_dshowDeclFnName d) code then true else v_Vuna_dTypedCodegen_dpartsNeedRec ds rest names
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 310 1 ("no matching clause for Vuna.TypedCodegen.partsNeedRec")

let v_Vuna_dTypedCodegen_dgenShowDeclsOf = fun decls ds -> (match ds with
  | [] -> C_Vuna_dResult_dOk ("")
  | _ -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowFunc decls) ds) (fun parts -> (let names = v_Vuna_dTypedCodegen_dshowFnNames ds in C_Vuna_dResult_dOk ((let vuna_cat0' = (if v_Vuna_dTypedCodegen_dpartsNeedRec ds parts names then "let rec " else "let ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 320 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenShowDecls = fun decls -> v_Vuna_dTypedCodegen_dgenShowDeclsOf decls (v_Vuna_dTypedCodegen_dnonSpecialData decls)

let rec v_Vuna_dTypedCodegen_dfilterRuntime = fun a0 a1 -> match (a0, a1) with
  | ([], bodyChars) -> []
  | ((C_Vuna_dPair_dPair (name, chunk)) :: (rest), bodyChars) -> if v_Vuna_dTypedCodegen_dcontainsName (bi_str_unpack name) bodyChars then (C_Vuna_dPair_dPair (name, chunk)) :: (v_Vuna_dTypedCodegen_dfilterRuntime rest bodyChars) else v_Vuna_dTypedCodegen_dfilterRuntime rest bodyChars
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1014 1 ("no matching clause for Vuna.TypedCodegen.filterRuntime")

let v_Vuna_dTypedCodegen_dchunkNameOf = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (n, c)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1020 1 ("no matching clause for Vuna.TypedCodegen.chunkNameOf")

let v_Vuna_dTypedCodegen_dchunkTextOf = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (n, c)) -> c
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1022 1 ("no matching clause for Vuna.TypedCodegen.chunkTextOf")

let v_Vuna_dTypedCodegen_dchunkNamesOf = fun chunks -> v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dchunkNameOf chunks

let v_Vuna_dTypedCodegen_dneededByChunks = fun chunks -> v_Vuna_dList_dconcatMap (fun ch -> v_Vuna_dTypedCodegen_dfilterNames (fun n -> v_Vuna_dTypedCodegen_dcontainsName (bi_str_unpack n) (bi_str_unpack (v_Vuna_dTypedCodegen_dchunkTextOf ch))) (v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dchunkNameOf v_Vuna_dTypedCodegen_druntimePrelude)) chunks

let rec v_Vuna_dTypedCodegen_dfilterNames2 = fun pred names all -> (match all with
  | [] -> []
  | (ch) :: (rest) -> if pred (v_Vuna_dTypedCodegen_dchunkNameOf ch) then (ch) :: (v_Vuna_dTypedCodegen_dfilterNames2 pred names rest) else v_Vuna_dTypedCodegen_dfilterNames2 pred names rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1041 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dmissingChunks = fun included -> v_Vuna_dTypedCodegen_dfilterNames2 (fun n -> (if (v_Vuna_dTypedCodegen_dnotIn n (v_Vuna_dTypedCodegen_dchunkNamesOf included)) then (v_Vuna_dList_dmemName n (v_Vuna_dTypedCodegen_dneededByChunks included)) else false)) (v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dchunkNameOf v_Vuna_dTypedCodegen_druntimePrelude) v_Vuna_dTypedCodegen_druntimePrelude

let rec v_Vuna_dTypedCodegen_dexpandRuntime = fun included -> (match v_Vuna_dTypedCodegen_dmissingChunks included with
  | [] -> included
  | missing -> v_Vuna_dTypedCodegen_dexpandRuntime (v_Vuna_dList_dappend included missing)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1030 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dkeepChunks = fun a0 a1 -> match (a0, a1) with
  | (names, []) -> []
  | (names, (ch) :: (rest)) -> if v_Vuna_dList_dmemName (v_Vuna_dTypedCodegen_dchunkNameOf ch) names then (ch) :: (v_Vuna_dTypedCodegen_dkeepChunks names rest) else v_Vuna_dTypedCodegen_dkeepChunks names rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1047 1 ("no matching clause for Vuna.TypedCodegen.keepChunks")

let v_Vuna_dTypedCodegen_druntimeForBody = fun body -> if v_vuna_ugt_uint (bi_str_length body) 20000 then v_Vuna_dTypedCodegen_druntimeCodeTyped () else (let selected = v_Vuna_dTypedCodegen_dexpandRuntime (v_Vuna_dTypedCodegen_dfilterRuntime v_Vuna_dTypedCodegen_druntimePrelude (bi_str_unpack body)) in (("\n") ^ (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dList_dmap v_Vuna_dPair_dsecondOf (v_Vuna_dTypedCodegen_dkeepChunks (v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dchunkNameOf selected) v_Vuna_dTypedCodegen_druntimePrelude)))))

let v_Vuna_dTypedCodegen_dindentSpaces = fun n -> v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dList_dmap (fun _u -> " ") (v_Vuna_dTypedCodegen_drange 0 n))

let v_Vuna_dTypedCodegen_dindentWidth = fun depth -> if v_vuna_ugt_uint depth 12 then 24 else bi_mul depth 2

let v_Vuna_dTypedCodegen_demitStr = fun str acc -> v_Vuna_dList_dappend (v_Vuna_dList_dreverse (bi_str_unpack str)) acc

let rec v_Vuna_dTypedCodegen_dtrimTrailing = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 32 then v_Vuna_dTypedCodegen_dtrimTrailing rest else (c) :: (rest)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1070 1 ("no matching clause for Vuna.TypedCodegen.trimTrailing")

let rec v_Vuna_dTypedCodegen_dformatChars = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | ([], col, depth, inStr, escaped, prev, acc) -> acc
  | ((c) :: (rest), col, depth, inStr, escaped, prev, acc) -> if inStr then if escaped then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc)) else if v_vuna_ueq_uint c 92 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true true c ((c) :: (acc)) else if v_vuna_ueq_uint c 34 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc)) else if v_vuna_ueq_uint c 10 then v_Vuna_dTypedCodegen_dformatChars rest 0 depth true false c ((c) :: (acc)) else v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc)) else if v_vuna_ueq_uint c 34 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc)) else if v_vuna_ueq_uint c 10 then v_Vuna_dTypedCodegen_dformatChars rest 0 depth false false c ((c) :: (v_Vuna_dTypedCodegen_dtrimTrailing acc)) else if v_vuna_ueq_uint c 40 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) (bi_add depth 1) false false c ((c) :: (acc)) else if v_vuna_ueq_uint c 41 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) (if v_vuna_ugt_uint depth 0 then bi_sub depth 1 else 0) false false c ((c) :: (acc)) else if (if (v_vuna_ueq_uint prev 32) then (v_vuna_ueq_uint c 105) else false) then (match rest with
  | (110) :: ((32) :: (rest2)) -> (let width = v_Vuna_dTypedCodegen_dindentWidth depth in v_Vuna_dTypedCodegen_dformatChars rest2 (bi_add width 2) depth false false 32 (v_Vuna_dTypedCodegen_demitStr ((("in\n") ^ (v_Vuna_dTypedCodegen_dindentSpaces width))) acc))
  | _ -> v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1087 5 ("case pattern match failure")) else if (if (v_vuna_ueq_uint prev 32) then (v_vuna_ueq_uint c 101) else false) then (match rest with
  | (108) :: ((115) :: ((101) :: ((32) :: (rest2)))) -> (let width = v_Vuna_dTypedCodegen_dindentWidth depth in v_Vuna_dTypedCodegen_dformatChars rest2 (bi_add width 5) depth false false 32 (v_Vuna_dTypedCodegen_demitStr ((let vuna_cat0' = ("\n") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dindentSpaces width) in (let vuna_cat2' = ("else ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dTypedCodegen_dtrimTrailing acc)))
  | _ -> v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1093 5 ("case pattern match failure")) else if (if (v_vuna_ueq_uint c 32) then (v_vuna_ugt_uint col 100) else false) then (let width = v_Vuna_dTypedCodegen_dindentWidth depth in v_Vuna_dTypedCodegen_dformatChars rest width depth false false 32 (v_Vuna_dTypedCodegen_demitStr ((("\n") ^ (v_Vuna_dTypedCodegen_dindentSpaces width))) (v_Vuna_dTypedCodegen_dtrimTrailing acc))) else v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1074 1 ("no matching clause for Vuna.TypedCodegen.formatChars")

let v_Vuna_dTypedCodegen_dformatOutput = fun s -> bi_str_pack (v_Vuna_dList_dreverse (v_Vuna_dTypedCodegen_dtrimTrailing (v_Vuna_dTypedCodegen_dformatChars (bi_str_unpack s) 0 0 false false 0 [])))

let v_Vuna_dTypedCodegen_dpadCode = fun c -> if v_vuna_ult_uint c 10 then (("00") ^ (bi_str_from_int c)) else if v_vuna_ult_uint c 100 then (("0") ^ (bi_str_from_int c)) else bi_str_from_int c

let v_Vuna_dTypedCodegen_descapeChar = fun c -> if v_vuna_ueq_uint c 34 then "\\\"" else if v_vuna_ueq_uint c 92 then "\\\\" else if v_vuna_ueq_uint c 10 then "\n" else if v_vuna_ueq_uint c 9 then "\t" else if v_vuna_ult_uint c 32 then (("\\") ^ (v_Vuna_dTypedCodegen_dpadCode c)) else if v_vuna_ugt_uint c 126 then (("\\") ^ (v_Vuna_dTypedCodegen_dpadCode c)) else bi_str_pack ((c) :: ([]))

let rec v_Vuna_dTypedCodegen_descapeLong = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (v_Vuna_dTypedCodegen_descapeChar c) :: (v_Vuna_dTypedCodegen_descapeLong rest)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1124 1 ("no matching clause for Vuna.TypedCodegen.escapeLong")

let v_Vuna_dTypedCodegen_dtypedString = fun s -> if v_vuna_ugt_uint (bi_str_length s) 80 then (let vuna_cat0' = ("\"") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dTypedCodegen_descapeLong (bi_str_unpack s))) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else v_Vuna_dTypedCodegen_docamlString s

let rec v_Vuna_dTypedCodegen_dgenArgs = fun decls env args -> v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenExpr decls env) args
and v_Vuna_dTypedCodegen_dconcatBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, i, []) -> C_Vuna_dResult_dOk ([])
  | (decls, env, i, (e) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env e) (fun code -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dconcatBindings decls env (bi_add i 1) rest) (fun binds -> C_Vuna_dResult_dOk ((C_Vuna_dPair_dPair (v_Vuna_dTypedCodegen_dconcatBindingName i, code)) :: (binds))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 465 1 ("no matching clause for Vuna.TypedCodegen.concatBindings")
and v_Vuna_dTypedCodegen_dgenConcatN = fun decls env pieces -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dconcatBindings decls env 0 pieces) (fun binds -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dwrapConcatBindings binds ((let vuna_cat0' = ("String.concat \"\" [") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "; " (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf binds)) in (let vuna_cat2' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))
and v_Vuna_dTypedCodegen_dgenCall = fun decls env fn args -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env fn) (fun f -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenArgs decls env args) (fun as2 -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dgenAppAware decls env fn args f as2)))
and v_Vuna_dTypedCodegen_dgenExpr = fun decls env expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dList_dmemName name env then C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dsanitizeName name) else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (arity) -> if v_vuna_ueq_ustr name "Nil" then C_Vuna_dResult_dOk ("[]") else if v_vuna_ueq_ustr name "True" then C_Vuna_dResult_dOk ("true") else if v_vuna_ueq_ustr name "False" then C_Vuna_dResult_dOk ("false") else if v_vuna_ueq_uint arity 0 then C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dctorNameOf name) else C_Vuna_dResult_dErr ((let vuna_cat0' = ("typed codegen: constructor ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" used without arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dTypedCodegen_dbuiltinName name with
  | C_Vuna_dMaybe_dJust (ref) -> (match name with
  | "getArgs" -> C_Vuna_dResult_dOk ("bi_get_args ()")
  | "prim_getArgs" -> C_Vuna_dResult_dOk ("bi_get_args ()")
  | "readLine" -> C_Vuna_dResult_dOk ("bi_read_line ()")
  | "prim_readLine" -> C_Vuna_dResult_dOk ("bi_read_line ()")
  | _ -> C_Vuna_dResult_dOk (ref)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 562 17 ("case pattern match failure"))
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dJust (0) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dzeroArgRef decls name)
  | C_Vuna_dMaybe_dJust (arity) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dvalueName name)
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("typed codegen: unbound variable ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 569 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 560 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 552 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dResult_dOk (bi_str_from_int n)
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dtypedString s)
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar (name, _) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (arity) -> if (if ((if (v_vuna_ueq_ustr name "Nil") then true else (v_vuna_ueq_ustr name "True"))) then true else (v_vuna_ueq_ustr name "False")) then C_Vuna_dResult_dErr ((let vuna_cat0' = ("typed codegen: constructor ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" cannot take arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else if v_vuna_ueq_ustr name "Cons" then (match args with
  | (h) :: ((t) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env h) (fun ph -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env t) (fun pt -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ph) in (let vuna_cat2' = (") :: (") in (let vuna_cat3' = (pt) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dResult_dErr ("typed codegen: Cons arity")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 583 17 ("case pattern match failure")) else if v_vuna_ueq_uint (v_Vuna_dList_dlength args) arity then v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenArgs decls env args) (fun as2 -> (match as2 with
  | (a) :: ([]) -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (a) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith ", " as2) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 591 19 ("case pattern match failure"))) else C_Vuna_dResult_dErr ((("typed codegen: partial constructor ") ^ (name)))
  | C_Vuna_dMaybe_dNothing -> if v_vuna_ueq_ustr name "&&" then (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(if (") in (let vuna_cat1' = (ga) in (let vuna_cat2' = (") then (") in (let vuna_cat3' = (gb) in (let vuna_cat4' = (") else false)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 597 17 ("case pattern match failure")) else if v_vuna_ueq_ustr name "||" then (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(if (") in (let vuna_cat1' = (ga) in (let vuna_cat2' = (") then true else (") in (let vuna_cat3' = (gb) in (let vuna_cat4' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 604 17 ("case pattern match failure")) else if v_vuna_ueq_ustr name "++" then (match args with
  | (_) :: ((_) :: ([])) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals (v_Vuna_dTypedCodegen_dconcatFlatten expr) with
  | (only) :: ([]) -> v_Vuna_dTypedCodegen_dgenExpr decls env only
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("((") in (let vuna_cat1' = (ga) in (let vuna_cat2' = (") ^ (") in (let vuna_cat3' = (gb) in (let vuna_cat4' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | pieces -> v_Vuna_dTypedCodegen_dgenConcatN decls env pieces
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 613 21 ("case pattern match failure"))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 611 17 ("case pattern match failure")) else v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 578 11 ("case pattern match failure"))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 576 7 ("case pattern match failure"))
  | C_Vuna_dAst_dELam (params, body, _) -> (let env2 = v_Vuna_dList_dappend params env in v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env2 body) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dsanitizeName params)) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | C_Vuna_dAst_dELet (binds, body, rec_u, _) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenLetBinds decls env binds body rec_u) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (b) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env scrut) (fun s -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenAlt decls env) alts) (fun arms -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(match ") in (let vuna_cat1' = (s) in (let vuna_cat2' = (" with\n") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith "\n" (v_Vuna_dList_dappend arms ((v_Vuna_dTypedCodegen_dgenCatchAll sp "case pattern match failure") :: ([])))) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dAst_dEIf (c, t, e, _) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env c) (fun gc -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env t) (fun gt -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env e) (fun ge -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("if ") in (let vuna_cat1' = (gc) in (let vuna_cat2' = (" then ") in (let vuna_cat3' = (gt) in (let vuna_cat4' = (" else ") in (let vuna_cat5' = (ge) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))))
  | C_Vuna_dAst_dEPi (name, implicit, dom, cod, sp) -> C_Vuna_dResult_dErr ("typed codegen: unexpected dependent function type (use --dt)")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 548 3 ("case pattern match failure"))
and v_Vuna_dTypedCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dPair_dPair (pat, body)) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenPat pat) (fun p -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_dpatVars pat) env) body) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (p) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 642 1 ("no matching clause for Vuna.TypedCodegen.genAlt")
and v_Vuna_dTypedCodegen_dgenLetBinds = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, binds, body, false) -> v_Vuna_dTypedCodegen_dgenBinds decls env binds body
  | (decls, env, binds, body, true) -> v_Vuna_dTypedCodegen_dgenRecBinds decls env binds body
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 652 1 ("no matching clause for Vuna.TypedCodegen.genLetBinds")
and v_Vuna_dTypedCodegen_dgenRecBinds = fun decls env binds body -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenRecDefs decls (v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_drecBindNames binds) env) binds) (fun defs -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_drecBindNames binds) env) body) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("let rec ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " defs) in (let vuna_cat2' = (" in ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
and v_Vuna_dTypedCodegen_dgenRecDefs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, []) -> C_Vuna_dResult_dOk ([])
  | (decls, env, (C_Vuna_dPair_dPair (C_Vuna_dAst_dPVar (name, _), value)) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env value) (fun v -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenRecDefs decls env rest) (fun tail -> C_Vuna_dResult_dOk (((let vuna_cat0' = (v_Vuna_dTypedCodegen_dsanitizeName name) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (v) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: (tail))))
  | (decls, env, (C_Vuna_dPair_dPair (_, _)) :: (_)) -> C_Vuna_dResult_dErr ("recursive let bindings must be simple names")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 665 1 ("no matching clause for Vuna.TypedCodegen.genRecDefs")
and v_Vuna_dTypedCodegen_dgenBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], body) -> v_Vuna_dTypedCodegen_dgenExpr decls env body
  | (decls, env, (C_Vuna_dPair_dPair (pat, value)) :: (rest), body) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenPat pat) (fun p -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env value) (fun v -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenBinds decls (v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_dpatVars pat) env) rest body) (fun r -> if v_Vuna_dTypedCodegen_disIrrefutable pat then C_Vuna_dResult_dOk ((let vuna_cat0' = ("let ") in (let vuna_cat1' = (p) in (let vuna_cat2' = (" = ") in (let vuna_cat3' = (v) in (let vuna_cat4' = (" in ") in (let vuna_cat5' = (r) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))) else C_Vuna_dResult_dOk ((let vuna_cat0' = ("(match ") in (let vuna_cat1' = (v) in (let vuna_cat2' = (" with\n  | ") in (let vuna_cat3' = (p) in (let vuna_cat4' = (" -> ") in (let vuna_cat5' = (r) in (let vuna_cat6' = ("\n  | _ -> vuna_fail ") in (let vuna_cat7' = (v_Vuna_dTypedCodegen_docamlString (v_Vuna_dBase_dspanFile (v_Vuna_dAst_dpatSpan pat))) in (let vuna_cat8' = (" ") in (let vuna_cat9' = (bi_str_from_int (v_Vuna_dBase_dspanStartLine (v_Vuna_dAst_dpatSpan pat))) in (let vuna_cat10' = (" ") in (let vuna_cat11' = (bi_str_from_int (v_Vuna_dBase_dspanStartCol (v_Vuna_dAst_dpatSpan pat))) in (let vuna_cat12' = (" (\"let pattern match failure\"))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'; vuna_cat11'; vuna_cat12'])))))))))))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 673 1 ("no matching clause for Vuna.TypedCodegen.genBinds")

let v_Vuna_dTypedCodegen_dgenClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dPair_dPair (pats, body)) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult v_Vuna_dTypedCodegen_dgenPat pats) (fun ps -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dList_dappend (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats) env) body) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("  | (") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " ps) in (let vuna_cat2' = (") -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 682 1 ("no matching clause for Vuna.TypedCodegen.genClause")

let v_Vuna_dTypedCodegen_dgenFunction = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("typed codegen: unknown function ") ^ (name)))
  | C_Vuna_dMaybe_dJust (arity) -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> C_Vuna_dResult_dErr ((("typed codegen: no clauses for ") ^ (name)))
  | (C_Vuna_dPair_dPair (pats, body)) :: ([]) -> if v_vuna_ueq_uint arity 0 then if v_Vuna_dTypedCodegen_disPureZeroArg decls name then v_Vuna_dTypedCodegen_dgenExpr decls [] body else v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls [] body) (fun b -> C_Vuna_dResult_dOk ((("fun () -> ") ^ (b)))) else if v_Vuna_dTypedCodegen_dallVarPatterns pats then v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats) body) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dList_dmap v_Vuna_dTypedCodegen_dpatParam pats)) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))) else v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenClause decls []) (v_Vuna_dAst_dclausesFor decls name)) (fun arms -> (let params = v_Vuna_dTypedCodegen_dgenParams arity in (let matched = if v_vuna_ueq_uint arity 1 then "a0" else (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " params) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in C_Vuna_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " params) in (let vuna_cat2' = (" -> match ") in (let vuna_cat3' = (matched) in (let vuna_cat4' = (" with\n") in (let vuna_cat5' = (v_Vuna_dTypedCodegen_djoinWith "\n" (v_Vuna_dList_dappend arms ((v_Vuna_dTypedCodegen_dgenCatchAll (v_Vuna_dTypedCodegen_dfunSpan decls name) ((("no matching clause for ") ^ (name)))) :: ([])))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))))
  | (first) :: (rest) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenClause decls []) (v_Vuna_dAst_dclausesFor decls name)) (fun arms -> (let params = v_Vuna_dTypedCodegen_dgenParams arity in (let matched = if v_vuna_ueq_uint arity 1 then "a0" else (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " params) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in C_Vuna_dResult_dOk ((let vuna_cat0' = ("fun ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " params) in (let vuna_cat2' = (" -> match ") in (let vuna_cat3' = (matched) in (let vuna_cat4' = (" with\n") in (let vuna_cat5' = (v_Vuna_dTypedCodegen_djoinWith "\n" (v_Vuna_dList_dappend arms ((v_Vuna_dTypedCodegen_dgenCatchAll (v_Vuna_dTypedCodegen_dfunSpan decls name) ((("no matching clause for ") ^ (name)))) :: ([])))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 721 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 718 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenGroupDef = fun decls name -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenFunction decls name) (fun body -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dvalueName name) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (body) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))

let v_Vuna_dTypedCodegen_dgenGroup = fun decls group -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenGroupDef decls) group) (fun defs -> C_Vuna_dResult_dOk (((if v_Vuna_dTypedCodegen_dgroupNeedsRec decls group then "let rec " else "let ") ^ (v_Vuna_dTypedCodegen_djoinWith "\nand " defs))))

let v_Vuna_dTypedCodegen_dgenTopNames = fun decls names -> (match names with
  | [] -> C_Vuna_dResult_dErr ("typed codegen: no definitions")
  | _ -> (let adj = v_Vuna_dList_dmap (fun n -> C_Vuna_dPair_dPair (n, v_Vuna_dTypedCodegen_dfilterNames (fun r -> v_Vuna_dList_dmemName r names) (v_Vuna_dTypedCodegen_dgenFunctionRefs decls n))) names in (let revAdj = v_Vuna_dTypedCodegen_dreverseAdj names adj in (match v_Vuna_dTypedCodegen_dpostOrder adj names [] [] with
  | C_Vuna_dPair_dPair (_, order) -> (let comps = v_Vuna_dTypedCodegen_dcollectComps revAdj order [] [] in (let groups = v_Vuna_dTypedCodegen_dgroupsFromComps comps names in v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dorderGroups adj groups) (fun ordered -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenGroup decls) ordered) (fun parts -> C_Vuna_dResult_dOk (((v_Vuna_dTypedCodegen_djoinWith "\n\n" parts) ^ ("\n")))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 939 11 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 932 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenTop = fun decls -> v_Vuna_dTypedCodegen_dgenTopNames decls (v_Vuna_dTypedCodegen_dfunctionNames decls)

let v_Vuna_dTypedCodegen_dtypedMainSuffix = fun decls showMain printResult -> if printResult then (let vuna_cat0' = ("let () = print_endline (") in (let vuna_cat1' = (showMain) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat4' = ("))\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat2' = (")\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypedCodegen_disIOType = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dlastName n) "IO"
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1136 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dioResultTy = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (n, args) -> (match args with
  | (a) :: ([]) -> C_Vuna_dMaybe_dJust (a)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1143 7 ("case pattern match failure"))
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1141 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dioCtorOf = fun decls -> (match decls with
  | [] -> C_Vuna_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (n, params, ctors, derivings, sp) -> if v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dlastName n) "IO" then (match ctors with
  | (c) :: (cs) -> C_Vuna_dMaybe_dJust (v_Vuna_dAst_dctorName c)
  | [] -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1155 13 ("case pattern match failure")) else v_Vuna_dTypedCodegen_dioCtorOf rest
  | _ -> v_Vuna_dTypedCodegen_dioCtorOf rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1152 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1149 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dioRunExpr = fun decls ctor -> (let vuna_cat0' = ("match ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat2' = (" with ") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_dctorNameOf ctor) in (let vuna_cat4' = (" __iof -> __iof 0") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))

let rec v_Vuna_dTypedCodegen_dioTypeNameOf = fun decls -> (match decls with
  | [] -> C_Vuna_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (n, params, ctors, derivings, sp) -> if v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dlastName n) "IO" then C_Vuna_dMaybe_dJust (n) else v_Vuna_dTypedCodegen_dioTypeNameOf rest
  | _ -> v_Vuna_dTypedCodegen_dioTypeNameOf rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1168 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1165 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dioOwnerModule = fun decls -> (match v_Vuna_dTypedCodegen_dioTypeNameOf decls with
  | C_Vuna_dMaybe_dNothing -> ""
  | C_Vuna_dMaybe_dJust (n) -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot n) with
  | C_Vuna_dPair_dPair (revPrefix, base) -> v_Vuna_dBase_djoinDots revPrefix
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1177 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1174 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dioExecSuffix = fun decls ctor -> (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dioRunExpr decls ctor) in (let vuna_cat2' = (")\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypedCodegen_dioExecSuffixSplit = fun decls ctor -> (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dsanitizeName (v_Vuna_dTypedCodegen_dioOwnerModule decls)) in (let vuna_cat2' = (".__vuna_run_io (") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in (let vuna_cat4' = ("))\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))

let v_Vuna_dTypedCodegen_dinjectIOHelperOne = fun target ctorN typeN helperMl helperMli f -> if v_vuna_ueq_ustr (v_Vuna_dSplit_dsplitName f) (((target) ^ (".ml"))) then C_Vuna_dSplit_dSplitFile (v_Vuna_dSplit_dsplitName f, ((v_Vuna_dSplit_dsplitText f) ^ (helperMl))) else if v_vuna_ueq_ustr (v_Vuna_dSplit_dsplitName f) (((target) ^ (".mli"))) then C_Vuna_dSplit_dSplitFile (v_Vuna_dSplit_dsplitName f, ((v_Vuna_dSplit_dsplitText f) ^ (helperMli))) else f

let v_Vuna_dTypedCodegen_dinjectIOHelper = fun decls files -> (match v_Vuna_dTypedCodegen_dioTypeNameOf decls with
  | C_Vuna_dMaybe_dNothing -> files
  | C_Vuna_dMaybe_dJust (tyName) -> (match v_Vuna_dTypedCodegen_dioCtorOf decls with
  | C_Vuna_dMaybe_dNothing -> files
  | C_Vuna_dMaybe_dJust (ctor) -> (let target = v_Vuna_dTypedCodegen_dsanitizeName (v_Vuna_dTypedCodegen_dioOwnerModule decls) in let ctorN = v_Vuna_dTypedCodegen_dctorNameOf ctor in let typeN = v_Vuna_dTypedCodegen_dtypeNameOf tyName in let helperMl = (let vuna_cat0' = ("\nlet __vuna_run_io (") in (let vuna_cat1' = (ctorN) in (let vuna_cat2' = (" f) = f 0\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in let helperMli = (let vuna_cat0' = ("\nval __vuna_run_io : ('a) ") in (let vuna_cat1' = (typeN) in (let vuna_cat2' = (" -> ('a)\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in v_Vuna_dList_dmap (v_Vuna_dTypedCodegen_dinjectIOHelperOne target ctorN typeN helperMl helperMli) files)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1201 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1198 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dioPermSuffix = fun decls ctor showResult printResult -> if printResult then (let vuna_cat0' = ("let () = let __io_r = (") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dioRunExpr decls ctor) in (let vuna_cat2' = (") in print_endline (") in (let vuna_cat3' = (showResult) in (let vuna_cat4' = (" __io_r)\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else v_Vuna_dTypedCodegen_dioExecSuffix decls ctor

let v_Vuna_dTypedCodegen_dmainSuffix = fun decls globals printResult exec -> (match v_Vuna_dTypecheck_dlookupScheme "main" globals with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("typed codegen: no main definition")
  | C_Vuna_dMaybe_dJust (C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dResult_dErr ("typed codegen: main must be zero-arity")
  | _ -> if v_Vuna_dTypedCodegen_disIOType ty then (match v_Vuna_dTypedCodegen_dioCtorOf decls with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("typed codegen: IO type is not defined in this program")
  | C_Vuna_dMaybe_dJust (ctor) -> if exec then C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dioExecSuffix decls ctor) else (match v_Vuna_dTypedCodegen_dioResultTy ty with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("typed codegen: IO type must have one argument")
  | C_Vuna_dMaybe_dJust (resultTy) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dshowForTy decls resultTy) (fun showResult -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dioPermSuffix decls ctor showResult printResult))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1229 19 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1224 13 ("case pattern match failure")) else if exec then C_Vuna_dResult_dErr ("typed codegen: executable main must have type IO a (use Vuna.IO)") else v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dshowForTy decls ty) (fun showMain -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dtypedMainSuffix decls showMain printResult))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1220 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1217 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenerateProgramTypedMode = fun decls globals printResult exec -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmainSuffix decls globals printResult exec) (fun suffix -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenTypeDecls decls) (fun types -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenShowDecls decls) (fun shows -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenTop decls) (fun tops -> (let core = (let vuna_cat0' = (types) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (shows) in (let vuna_cat3' = ("\n") in (let vuna_cat4' = (tops) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) in C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dformatOutput ((let vuna_cat0' = (v_Vuna_dTypedCodegen_druntimeForBody (((core) ^ (suffix)))) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (core) in (let vuna_cat3' = (suffix) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))))))

let v_Vuna_dTypedCodegen_dgenerateProgramTyped = fun decls globals printResult -> v_Vuna_dTypedCodegen_dgenerateProgramTypedMode decls globals printResult false

let v_Vuna_dTypedCodegen_dgenerateProgramTypedExec = fun decls globals -> v_Vuna_dTypedCodegen_dgenerateProgramTypedMode decls globals false true

let v_Vuna_dTypedCodegen_dctxModules = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> modules
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1265 1 ("no matching clause for Vuna.TypedCodegen.ctxModules")

let v_Vuna_dTypedCodegen_dctxEntryDecls = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> entryDecls
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1267 1 ("no matching clause for Vuna.TypedCodegen.ctxEntryDecls")

let v_Vuna_dTypedCodegen_dctxElabDecls = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> elabDecls
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1269 1 ("no matching clause for Vuna.TypedCodegen.ctxElabDecls")

let v_Vuna_dTypedCodegen_dctxGlobals = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> globals
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1271 1 ("no matching clause for Vuna.TypedCodegen.ctxGlobals")

let v_Vuna_dTypedCodegen_dctxOwners = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> owners
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1273 1 ("no matching clause for Vuna.TypedCodegen.ctxOwners")

let v_Vuna_dTypedCodegen_dctxEntryNames = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> entryNames
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1275 1 ("no matching clause for Vuna.TypedCodegen.ctxEntryNames")

let v_Vuna_dTypedCodegen_dctxDefinedNames = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> definedNames
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1277 1 ("no matching clause for Vuna.TypedCodegen.ctxDefinedNames")

let v_Vuna_dTypedCodegen_dctxRuntimeSafe = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> runtimeSafe
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1279 1 ("no matching clause for Vuna.TypedCodegen.ctxRuntimeSafe")

let v_Vuna_dTypedCodegen_dctxRoutedFuns = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> routedFuns
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1281 1 ("no matching clause for Vuna.TypedCodegen.ctxRoutedFuns")

let v_Vuna_dTypedCodegen_dctxRoutedDatas = fun a0 -> match a0 with
  | (C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas)) -> routedDatas
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1283 1 ("no matching clause for Vuna.TypedCodegen.ctxRoutedDatas")

let v_Vuna_dTypedCodegen_dsplitPrefixOf = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dPair_dPair (rev, base) -> v_Vuna_dBase_djoinDots rev
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1286 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disBuiltinTypeCon = fun name -> (if ((if ((if (v_vuna_ueq_ustr name "Int") then true else (v_vuna_ueq_ustr name "String"))) then true else (v_vuna_ueq_ustr name "Bool"))) then true else (v_vuna_ueq_ustr name "List"))

let rec v_Vuna_dTypedCodegen_druntimeTyOk = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> true
  | C_Vuna_dTypecheck_dTCon (name, args) -> (if (v_Vuna_dTypedCodegen_disBuiltinTypeCon name) then (v_Vuna_dTypedCodegen_dallRuntimeTyOk args) else false)
  | C_Vuna_dTypecheck_dTFun (a, b) -> (if (v_Vuna_dTypedCodegen_druntimeTyOk a) then (v_Vuna_dTypedCodegen_druntimeTyOk b) else false)
  | C_Vuna_dTypecheck_dTApp (head, args) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1292 3 ("case pattern match failure"))
and v_Vuna_dTypedCodegen_dallRuntimeTyOk = fun a0 -> match a0 with
  | ([]) -> true
  | ((t) :: (rest)) -> (if (v_Vuna_dTypedCodegen_druntimeTyOk t) then (v_Vuna_dTypedCodegen_dallRuntimeTyOk rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1298 1 ("no matching clause for Vuna.TypedCodegen.allRuntimeTyOk")

let v_Vuna_dTypedCodegen_druntimeSchemeOk = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> (match cons with
  | [] -> v_Vuna_dTypedCodegen_druntimeTyOk ty
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1303 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1302 1 ("no matching clause for Vuna.TypedCodegen.runtimeSchemeOk")

let rec v_Vuna_dTypedCodegen_drefsAllSafe = fun a0 a1 -> match (a0, a1) with
  | (safe, []) -> true
  | (safe, (r) :: (rest)) -> (if (v_Vuna_dList_dmemName r safe) then (v_Vuna_dTypedCodegen_drefsAllSafe safe rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1307 1 ("no matching clause for Vuna.TypedCodegen.refsAllSafe")

let v_Vuna_dTypedCodegen_ddefinedRefs = fun ctx name -> v_Vuna_dList_dfilter (fun r -> v_Vuna_dList_dmemName r (v_Vuna_dTypedCodegen_dctxDefinedNames ctx)) (v_Vuna_dTypedCodegen_dgenFunctionRefs (v_Vuna_dTypedCodegen_dctxElabDecls ctx) name)

let rec v_Vuna_dTypedCodegen_druntimeSafeLoop = fun ctx safe -> (let safe2 = v_Vuna_dList_dfilter (fun n -> v_Vuna_dTypedCodegen_drefsAllSafe safe (v_Vuna_dTypedCodegen_ddefinedRefs ctx n)) safe in if v_vuna_ueq_uint (v_Vuna_dList_dlength safe2) (v_Vuna_dList_dlength safe) then safe else v_Vuna_dTypedCodegen_druntimeSafeLoop ctx safe2)

let v_Vuna_dTypedCodegen_dlookupSchemeDefault = fun globals name -> (match v_Vuna_dTypecheck_dlookupScheme name globals with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dTypecheck_dScheme ([], [], C_Vuna_dTypecheck_dTCon ("Int", []))
  | C_Vuna_dMaybe_dJust (scheme) -> scheme
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1321 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_druntimeSafeOf = fun ctx candidates -> v_Vuna_dTypedCodegen_druntimeSafeLoop ctx (v_Vuna_dList_dfilter (fun n -> v_Vuna_dTypedCodegen_druntimeSchemeOk (v_Vuna_dTypedCodegen_dlookupSchemeDefault (v_Vuna_dTypedCodegen_dctxGlobals ctx) n)) candidates)

let v_Vuna_dTypedCodegen_ddeclSplitName = fun d -> (match d with
  | C_Vuna_dAst_dDData (n, ps, cs, ds, sp) -> n
  | C_Vuna_dAst_dDRecord (n, ps, fs, ds, sp) -> n
  | C_Vuna_dAst_dDFun (n, ps, b, sp) -> n
  | C_Vuna_dAst_dDSig (n, ty, sp) -> n
  | C_Vuna_dAst_dDTrait (n, ps, ms, sp) -> n
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> (match iname with
  | C_Vuna_dMaybe_dJust (n) -> n
  | C_Vuna_dMaybe_dNothing -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1349 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1342 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_drouteData = fun ctx route -> (let names = v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf (v_Vuna_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Vuna_dPair_dsecondOf p) route) (v_Vuna_dTypedCodegen_dctxRoutedDatas ctx))) in v_Vuna_dList_dfilter (fun d -> (match d with
  | C_Vuna_dAst_dDData (n, ps, cs, ds, sp) -> v_Vuna_dList_dmemName n names
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1361 20 ("case pattern match failure"))) (v_Vuna_dTypedCodegen_dctxElabDecls ctx))

let v_Vuna_dTypedCodegen_drouteFunNames = fun ctx route -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf (v_Vuna_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Vuna_dPair_dsecondOf p) route) (v_Vuna_dTypedCodegen_dctxRoutedFuns ctx)))

let v_Vuna_dTypedCodegen_dimportNameOf = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1382 1 ("no matching clause for Vuna.TypedCodegen.importNameOf")

let rec v_Vuna_dTypedCodegen_dfindModuleByName = fun modules name -> (match modules with
  | [] -> C_Vuna_dMaybe_dNothing
  | (m) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dLoader_dmoduleNameOf m) name then C_Vuna_dMaybe_dJust (m) else v_Vuna_dTypedCodegen_dfindModuleByName rest name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1385 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dtopoDeps = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (all, [], visited, order) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (visited, order))
  | (all, (imp) :: (rest), visited, order) -> (match v_Vuna_dTypedCodegen_dfindModuleByName all (v_Vuna_dTypedCodegen_dimportNameOf imp) with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("split mode: imported module ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dimportNameOf imp) in (let vuna_cat2' = (" is not loaded") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dMaybe_dJust (dep) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dtopoVisit all dep visited order) (fun p -> v_Vuna_dTypedCodegen_dtopoDeps all rest (v_Vuna_dPair_dfirstOf p) (v_Vuna_dPair_dsecondOf p))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1400 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1397 1 ("no matching clause for Vuna.TypedCodegen.topoDeps")
and v_Vuna_dTypedCodegen_dtopoVisit = fun all m visited order -> if v_Vuna_dList_dmemName (v_Vuna_dLoader_dmoduleNameOf m) visited then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (visited, order)) else v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dtopoDeps all (v_Vuna_dLoader_dmoduleImportsOf m) ((v_Vuna_dLoader_dmoduleNameOf m) :: (visited)) order) (fun p -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (v_Vuna_dPair_dfirstOf p, v_Vuna_dList_dappend (v_Vuna_dPair_dsecondOf p) ((m) :: ([])))))

let rec v_Vuna_dTypedCodegen_dtopoAll = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (all, [], visited, order) -> C_Vuna_dResult_dOk (order)
  | (all, (m) :: (rest), visited, order) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dtopoVisit all m visited order) (fun p -> v_Vuna_dTypedCodegen_dtopoAll all rest (v_Vuna_dPair_dfirstOf p) (v_Vuna_dPair_dsecondOf p))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1391 1 ("no matching clause for Vuna.TypedCodegen.topoAll")

let v_Vuna_dTypedCodegen_dtopoOrder = fun modules -> v_Vuna_dTypedCodegen_dtopoAll modules modules [] []

let v_Vuna_dTypedCodegen_dmoduleOwnNames = fun m -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dappend (v_Vuna_dAst_dtopNames (v_Vuna_dLoader_dmoduleDeclsOf m)) (v_Vuna_dList_dappend (v_Vuna_dAst_dtypeNamesOf (v_Vuna_dLoader_dmoduleDeclsOf m)) (v_Vuna_dAst_dctorsOf (v_Vuna_dLoader_dmoduleDeclsOf m))))

let rec v_Vuna_dTypedCodegen_drouteModuleIn = fun modules name -> (match modules with
  | [] -> "#unknown"
  | (m) :: (rest) -> if v_Vuna_dList_dmemName name (v_Vuna_dTypedCodegen_dmoduleOwnNames m) then v_Vuna_dLoader_dmoduleNameOf m else v_Vuna_dTypedCodegen_drouteModuleIn rest name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1328 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_drouteModuleOf = fun ctx name -> v_Vuna_dTypedCodegen_drouteModuleIn (v_Vuna_dTypedCodegen_dctxModules ctx) name

let v_Vuna_dTypedCodegen_drouteOf = fun ctx name -> (match v_Vuna_dList_dlookupPair name (v_Vuna_dTypedCodegen_dctxOwners ctx) with
  | C_Vuna_dMaybe_dJust (owner) -> if v_vuna_ueq_ustr owner "" then if v_Vuna_dList_dmemName name (v_Vuna_dTypedCodegen_dctxRuntimeSafe ctx) then "#runtime" else "#main" else owner
  | C_Vuna_dMaybe_dNothing -> if v_Vuna_dList_dmemName name (v_Vuna_dTypedCodegen_dctxEntryNames ctx) then "#entry" else v_Vuna_dTypedCodegen_drouteModuleOf ctx name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1333 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_drouteDataTable = fun ctx decls -> v_Vuna_dList_dconcatMap (fun d -> (match d with
  | C_Vuna_dAst_dDData (n, ps, cs, ds, sp) -> (C_Vuna_dPair_dPair (n, v_Vuna_dTypedCodegen_drouteOf ctx n)) :: ([])
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1354 20 ("case pattern match failure"))) decls

let v_Vuna_dTypedCodegen_drouteFunTable = fun ctx decls -> v_Vuna_dList_dconcatMap (fun d -> (match d with
  | C_Vuna_dAst_dDFun (n, ps, b, sp) -> (C_Vuna_dPair_dPair (n, v_Vuna_dTypedCodegen_drouteOf ctx n)) :: ([])
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1367 20 ("case pattern match failure"))) decls

let v_Vuna_dTypedCodegen_dcheckRoutes = fun ctx -> (match v_Vuna_dList_dfilter (fun d -> v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_drouteOf ctx (v_Vuna_dTypedCodegen_ddeclSplitName d)) "#unknown") (v_Vuna_dTypedCodegen_dctxElabDecls ctx) with
  | [] -> C_Vuna_dResult_dOk (0)
  | (d) :: (rest) -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("split mode: cannot assign declaration ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_ddeclSplitName d) in (let vuna_cat2' = (" to a module") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1376 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_docamlModName = fun m -> v_Vuna_dTypedCodegen_dsanitizeName (v_Vuna_dLoader_dmoduleNameOf m)

let v_Vuna_dTypedCodegen_dentryEq = fun a b -> (if ((if ((if (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryKind a) (v_Vuna_dLoader_dentryKind b)) then (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryPublic a) (v_Vuna_dLoader_dentryPublic b)) else false)) then (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryTarget a) (v_Vuna_dLoader_dentryTarget b)) else false)) then (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryParent a) (v_Vuna_dLoader_dentryParent b)) else false)

let rec v_Vuna_dTypedCodegen_dentryMem = fun a0 a1 -> match (a0, a1) with
  | (e, []) -> false
  | (e, (x) :: (rest)) -> if v_Vuna_dTypedCodegen_dentryEq e x then true else v_Vuna_dTypedCodegen_dentryMem e rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1423 1 ("no matching clause for Vuna.TypedCodegen.entryMem")

let rec v_Vuna_dTypedCodegen_dentriesSubset = fun a0 a1 -> match (a0, a1) with
  | ([], supers) -> true
  | ((e) :: (rest), supers) -> (if (v_Vuna_dTypedCodegen_dentryMem e supers) then (v_Vuna_dTypedCodegen_dentriesSubset rest supers) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1427 1 ("no matching clause for Vuna.TypedCodegen.entriesSubset")

let v_Vuna_dTypedCodegen_dentriesNonEmpty = fun a0 -> match a0 with
  | ([]) -> false
  | ((e) :: (rest)) -> true
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1431 1 ("no matching clause for Vuna.TypedCodegen.entriesNonEmpty")

let rec v_Vuna_dTypedCodegen_dimportsHave = fun earlier imps name -> (match imps with
  | [] -> false
  | (imp) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dimportNameOf imp) name then true else v_Vuna_dTypedCodegen_dimportsHave earlier rest name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1436 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_ddirectImportsOf = fun earlier imps -> v_Vuna_dList_dfilter (fun m -> v_Vuna_dTypedCodegen_dimportsHave earlier imps (v_Vuna_dLoader_dmoduleNameOf m)) earlier

let v_Vuna_dTypedCodegen_dcoversModule = fun x y -> (if (v_Vuna_dTypedCodegen_dentriesNonEmpty (v_Vuna_dLoader_dmoduleExportsOf x)) then (v_Vuna_dTypedCodegen_dentriesSubset (v_Vuna_dLoader_dmoduleExportsOf x) (v_Vuna_dLoader_dmoduleExportsOf y)) else false)

let rec v_Vuna_dTypedCodegen_dcoveredBy = fun kept x -> (match kept with
  | [] -> false
  | (z) :: (rest) -> if v_Vuna_dTypedCodegen_dcoversModule x z then true else v_Vuna_dTypedCodegen_dcoveredBy rest x
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1447 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dmaximalIncludesGo = fun a0 a1 -> match (a0, a1) with
  | ([], kept) -> kept
  | ((x) :: (rest), kept) -> if v_Vuna_dTypedCodegen_dcoveredBy kept x then v_Vuna_dTypedCodegen_dmaximalIncludesGo rest kept else v_Vuna_dTypedCodegen_dmaximalIncludesGo rest ((x) :: (v_Vuna_dList_dfilter (fun z -> v_Vuna_dBool_dnot (v_Vuna_dTypedCodegen_dcoversModule z x)) kept))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1453 1 ("no matching clause for Vuna.TypedCodegen.maximalIncludesGo")

let v_Vuna_dTypedCodegen_dmaximalIncludes = fun candidates -> v_Vuna_dList_dreverse (v_Vuna_dTypedCodegen_dmaximalIncludesGo candidates [])

let v_Vuna_dTypedCodegen_dincludeModulesOf = fun m earlier -> (let exports = v_Vuna_dLoader_dmoduleExportsOf m in let directs = v_Vuna_dTypedCodegen_ddirectImportsOf earlier (v_Vuna_dLoader_dmoduleImportsOf m) in let candidates = v_Vuna_dList_dfilter (fun x -> (if (v_Vuna_dTypedCodegen_dentriesNonEmpty (v_Vuna_dLoader_dmoduleExportsOf x)) then (v_Vuna_dTypedCodegen_dentriesSubset (v_Vuna_dLoader_dmoduleExportsOf x) exports) else false)) directs in v_Vuna_dTypedCodegen_dmaximalIncludes candidates)

let rec v_Vuna_dTypedCodegen_dcoveredByInclude = fun e includes -> (match includes with
  | [] -> false
  | (x) :: (rest) -> if v_Vuna_dTypedCodegen_dentryMem e (v_Vuna_dLoader_dmoduleExportsOf x) then true else v_Vuna_dTypedCodegen_dcoveredByInclude e rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1466 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dentryOwnedBy = fun m e -> (if (v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dsplitPrefixOf (v_Vuna_dLoader_dentryTarget e)) (v_Vuna_dLoader_dmoduleNameOf m)) then true else (v_Vuna_dList_dmemName (v_Vuna_dLoader_dentryTarget e) (v_Vuna_dTypedCodegen_dmoduleOwnNames m)))

let v_Vuna_dTypedCodegen_dcheckForeignExports = fun m includes -> (let foreign = v_Vuna_dList_dfilter (fun e -> v_Vuna_dBool_dnot (v_Vuna_dTypedCodegen_dentryOwnedBy m e)) (v_Vuna_dLoader_dmoduleExportsOf m) in (match v_Vuna_dList_dfilter (fun e -> v_Vuna_dBool_dnot (v_Vuna_dTypedCodegen_dcoveredByInclude e includes)) foreign with
  | [] -> C_Vuna_dResult_dOk (0)
  | (e) :: (rest) -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("split mode: selective re-export of \"") in (let vuna_cat1' = (v_Vuna_dLoader_dentryPublic e) in (let vuna_cat2' = ("\" from module ") in (let vuna_cat3' = (v_Vuna_dLoader_dmoduleNameOf m) in (let vuna_cat4' = (" is not supported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1476 6 ("case pattern match failure")))

let v_Vuna_dTypedCodegen_dopenHeader = fun earlier -> (("open Vuna_runtime\n") ^ (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dList_dmap (fun m -> (let vuna_cat0' = ("open ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_docamlModName m) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) earlier)))

let v_Vuna_dTypedCodegen_dincludesIn = fun earlier includes -> v_Vuna_dList_dfilter (fun m -> v_Vuna_dList_dmemName (v_Vuna_dLoader_dmoduleNameOf m) (v_Vuna_dList_dmap v_Vuna_dLoader_dmoduleNameOf includes)) earlier

let v_Vuna_dTypedCodegen_dmlIncludeText = fun earlier includes -> v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dList_dmap (fun m -> (let vuna_cat0' = ("include ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_docamlModName m) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dTypedCodegen_dincludesIn earlier includes))

let v_Vuna_dTypedCodegen_dmliIncludeText = fun earlier includes -> v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dList_dmap (fun m -> (let vuna_cat0' = ("include module type of struct include ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_docamlModName m) in (let vuna_cat2' = (" end\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dTypedCodegen_dincludesIn earlier includes))

let v_Vuna_dTypedCodegen_dbuiltinTyArgs = fun a0 a1 -> match (a0, a1) with
  | ([], base) -> C_Vuna_dResult_dOk (base)
  | (args, base) -> C_Vuna_dResult_dErr ("split mode: builtin type cannot be applied")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1498 1 ("no matching clause for Vuna.TypedCodegen.builtinTyArgs")

let rec v_Vuna_dTypedCodegen_drenderTy = fun ctx ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> C_Vuna_dResult_dOk ((("'a") ^ (bi_str_from_int i)))
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_drenderTy ctx a) (fun ta -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_drenderTy ctx b) (fun tb -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") -> (") in (let vuna_cat3' = (tb) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dTypecheck_dTApp (head, args) -> C_Vuna_dResult_dErr ("split mode: unsupported constraint (type application) in exported signature")
  | C_Vuna_dTypecheck_dTCon (name, args) -> if v_vuna_ueq_ustr name "Int" then v_Vuna_dTypedCodegen_dbuiltinTyArgs args "int" else if v_vuna_ueq_ustr name "String" then v_Vuna_dTypedCodegen_dbuiltinTyArgs args "string" else if v_Vuna_dTypedCodegen_disBoolName name then v_Vuna_dTypedCodegen_dbuiltinTyArgs args "bool" else if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_drenderTy ctx a) (fun ta -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(") in (let vuna_cat1' = (ta) in (let vuna_cat2' = (") list") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dResult_dErr ("split mode: invalid List type in exported signature")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1514 9 ("case pattern match failure")) else v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_drenderTy ctx) args) (fun ts -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dappType ts (v_Vuna_dTypedCodegen_dtypeNameOf name)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1503 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dtyVarsIn = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: ([])
  | C_Vuna_dTypecheck_dTCon (name, args) -> v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dtyVarsIn args
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_dtyVarsIn a) (v_Vuna_dTypedCodegen_dtyVarsIn b)
  | C_Vuna_dTypecheck_dTApp (head, args) -> v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_dtyVarsIn head) (v_Vuna_dList_dconcatMap v_Vuna_dTypedCodegen_dtyVarsIn args)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1522 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dmemIntList = fun x xs -> (match xs with
  | [] -> false
  | (y) :: (rest) -> if v_vuna_ueq_ugeneric x y then true else v_Vuna_dTypedCodegen_dmemIntList x rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1529 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dallVarsBound = fun a0 a1 -> match (a0, a1) with
  | (qs, []) -> true
  | (qs, (v) :: (rest)) -> (if (v_Vuna_dTypedCodegen_dmemIntList v qs) then (v_Vuna_dTypedCodegen_dallVarsBound qs rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1533 1 ("no matching clause for Vuna.TypedCodegen.allVarsBound")

let v_Vuna_dTypedCodegen_drenderValueType = fun ctx name -> (match v_Vuna_dTypecheck_dlookupScheme name (v_Vuna_dTypedCodegen_dctxGlobals ctx) with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dNothing)
  | C_Vuna_dMaybe_dJust (C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> (match cons with
  | [] -> if v_Vuna_dTypedCodegen_dallVarsBound qs (v_Vuna_dTypedCodegen_dtyVarsIn ty) then (match v_Vuna_dAst_dfunArity name (v_Vuna_dTypedCodegen_dctxElabDecls ctx) with
  | C_Vuna_dMaybe_dJust (0) -> if v_Vuna_dTypedCodegen_disPureZeroArg (v_Vuna_dTypedCodegen_dctxElabDecls ctx) name then (match qs with
  | [] -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_drenderTy ctx ty) (fun t -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dJust (t)))
  | _ -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("split mode: polymorphic value \"") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\" is not supported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1548 19 ("case pattern match failure")) else v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_drenderTy ctx ty) (fun t -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dJust ((("unit -> ") ^ (t)))))
  | _ -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_drenderTy ctx ty) (fun t -> C_Vuna_dResult_dOk (C_Vuna_dMaybe_dJust (t)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1545 13 ("case pattern match failure")) else C_Vuna_dResult_dErr ((let vuna_cat0' = ("split mode: exported value \"") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\" has unbound type variables") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("split mode: unsupported constraint (dictionary parameter) in exported value \"") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1542 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1539 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dshowValType = fun params name -> (match params with
  | [] -> ((v_Vuna_dTypedCodegen_dtypeNameOf name) ^ (" -> string"))
  | _ -> v_Vuna_dTypedCodegen_dshowAnnotation params name
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1557 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfindExportByTarget = fun kind target exports -> (match exports with
  | [] -> C_Vuna_dMaybe_dNothing
  | (e) :: (rest) -> if (if (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryKind e) kind) then (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryTarget e) target) else false) then C_Vuna_dMaybe_dJust (e) else v_Vuna_dTypedCodegen_dfindExportByTarget kind target rest
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1562 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dctorExportsOf = fun target exports -> v_Vuna_dList_dfilter (fun e -> (if (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryKind e) "ctor") then (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryParent e) target) else false)) exports

let v_Vuna_dTypedCodegen_dmliTypePart = fun ctx exports d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> (match v_Vuna_dTypedCodegen_dctorExportsOf name exports with
  | [] -> C_Vuna_dResult_dOk (((v_Vuna_dTypedCodegen_ddataPrefix params) ^ (v_Vuna_dTypedCodegen_dtypeNameOf name)))
  | ctorEntries -> if v_vuna_ueq_uint (v_Vuna_dList_dlength ctorEntries) (v_Vuna_dList_dlength ctors) then v_Vuna_dTypedCodegen_dgenData (v_Vuna_dTypedCodegen_dctxElabDecls ctx) d else C_Vuna_dResult_dErr ((let vuna_cat0' = ("split mode: partial constructor export of type ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" is not supported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1572 7 ("case pattern match failure"))
  | _ -> C_Vuna_dResult_dErr ("split mode: invalid type declaration")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1570 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenMliTypes = fun ctx exports datas -> (match v_Vuna_dTypedCodegen_dnonSpecialData datas with
  | [] -> C_Vuna_dResult_dOk ("")
  | ds -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dmliTypePart ctx exports) ds) (fun parts -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("type ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1580 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dconcatMapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dResult_dOk ([])
  | (f, (x) :: (rest)) -> v_Vuna_dResult_dandThen (f x) (fun ys -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dconcatMapResult f rest) (fun zs -> C_Vuna_dResult_dOk (v_Vuna_dList_dappend ys zs)))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1586 1 ("no matching clause for Vuna.TypedCodegen.concatMapResult")

let v_Vuna_dTypedCodegen_dexportValLine = fun ctx m e -> if (if (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryKind e) "val") then (v_Vuna_dTypedCodegen_dentryOwnedBy m e) else false) then (match v_Vuna_dTypedCodegen_drenderValueType ctx (v_Vuna_dLoader_dentryTarget e) with
  | C_Vuna_dResult_dErr (err) -> C_Vuna_dResult_dErr (err)
  | C_Vuna_dResult_dOk (C_Vuna_dMaybe_dNothing) -> C_Vuna_dResult_dOk ([])
  | C_Vuna_dResult_dOk (C_Vuna_dMaybe_dJust (ty)) -> C_Vuna_dResult_dOk (((let vuna_cat0' = ("val ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dvalueName (v_Vuna_dLoader_dentryTarget e)) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (ty) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: ([]))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1593 5 ("case pattern match failure")) else C_Vuna_dResult_dOk ([])

let v_Vuna_dTypedCodegen_dgeneratedValLine = fun ctx name -> (match v_Vuna_dTypedCodegen_drenderValueType ctx name with
  | C_Vuna_dResult_dErr (err) -> C_Vuna_dResult_dErr (err)
  | C_Vuna_dResult_dOk (C_Vuna_dMaybe_dNothing) -> C_Vuna_dResult_dOk ([])
  | C_Vuna_dResult_dOk (C_Vuna_dMaybe_dJust (ty)) -> C_Vuna_dResult_dOk (((let vuna_cat0' = ("val ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dvalueName name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (ty) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: ([]))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1600 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dshowValLine = fun ctx d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> C_Vuna_dResult_dOk (((let vuna_cat0' = ("val ") in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dTypedCodegen_dshowValType params name) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: ([]))
  | _ -> C_Vuna_dResult_dOk ([])
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1606 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_downersOfPart = fun ctx part -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf (v_Vuna_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Vuna_dPair_dsecondOf p) part) (v_Vuna_dTypedCodegen_dctxOwners ctx)))

let v_Vuna_dTypedCodegen_dgenMliVals = fun ctx m datas -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dconcatMapResult (v_Vuna_dTypedCodegen_dexportValLine ctx m) (v_Vuna_dLoader_dmoduleExportsOf m)) (fun exported -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dconcatMapResult (v_Vuna_dTypedCodegen_dgeneratedValLine ctx) (v_Vuna_dTypedCodegen_downersOfPart ctx (v_Vuna_dLoader_dmoduleNameOf m))) (fun generated -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dconcatMapResult (v_Vuna_dTypedCodegen_dshowValLine ctx) (v_Vuna_dTypedCodegen_dnonSpecialData datas)) (fun shows -> C_Vuna_dResult_dOk (v_Vuna_dList_dappend exported (v_Vuna_dList_dappend generated shows)))))

let v_Vuna_dTypedCodegen_dgenModuleTops = fun ctx names -> (match names with
  | [] -> C_Vuna_dResult_dOk ("")
  | _ -> v_Vuna_dTypedCodegen_dgenTopNames (v_Vuna_dTypedCodegen_dctxElabDecls ctx) names
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1623 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dsplitModuleMl = fun ctx earlier m -> (let part = v_Vuna_dLoader_dmoduleNameOf m in let datas = v_Vuna_dTypedCodegen_drouteData ctx part in let names = v_Vuna_dTypedCodegen_drouteFunNames ctx part in let includes = v_Vuna_dTypedCodegen_dincludeModulesOf m earlier in v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dcheckForeignExports m includes) (fun ok -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenTypeDeclsOf (v_Vuna_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dTypedCodegen_dnonSpecialData datas)) (fun types -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenShowDeclsOf (v_Vuna_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dTypedCodegen_dnonSpecialData datas)) (fun shows -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenModuleTops ctx names) (fun tops -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dopenHeader earlier) in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dmlIncludeText earlier includes) in (let vuna_cat2' = (types) in (let vuna_cat3' = (shows) in (let vuna_cat4' = (tops) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))))))

let v_Vuna_dTypedCodegen_dsplitModuleMli = fun ctx earlier m -> (let datas = v_Vuna_dTypedCodegen_drouteData ctx (v_Vuna_dLoader_dmoduleNameOf m) in let exports = v_Vuna_dLoader_dmoduleExportsOf m in let includes = v_Vuna_dTypedCodegen_dincludeModulesOf m earlier in v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenMliTypes ctx exports datas) (fun types -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenMliVals ctx m datas) (fun vals -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dopenHeader earlier) in (let vuna_cat1' = (v_Vuna_dTypedCodegen_dmliIncludeText earlier includes) in (let vuna_cat2' = (types) in (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith "" vals) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))))

let rec v_Vuna_dTypedCodegen_dsplitModuleFilesGo = fun ctx ordered earlier -> (match ordered with
  | [] -> C_Vuna_dResult_dOk ([])
  | (m) :: (rest) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dsplitModuleMli ctx earlier m) (fun mli -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dsplitModuleMl ctx earlier m) (fun ml -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dsplitModuleFilesGo ctx rest (v_Vuna_dList_dappend earlier ((m) :: ([])))) (fun more -> C_Vuna_dResult_dOk ((C_Vuna_dSplit_dSplitFile (((v_Vuna_dTypedCodegen_docamlModName m) ^ (".mli")), mli)) :: ((C_Vuna_dSplit_dSplitFile (((v_Vuna_dTypedCodegen_docamlModName m) ^ (".ml")), ml)) :: (more))))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1649 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dsplitModuleFiles = fun ctx ordered -> v_Vuna_dTypedCodegen_dsplitModuleFilesGo ctx ordered []

let v_Vuna_dTypedCodegen_dsplitRuntimeFile = fun ctx -> (match v_Vuna_dTypedCodegen_drouteFunNames ctx "#runtime" with
  | [] -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_druntimeCodeTyped ())
  | names -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenTopNames (v_Vuna_dTypedCodegen_dctxElabDecls ctx) names) (fun tops -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_druntimeCodeTyped ()) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (tops) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1659 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dsplitMainSuffix = fun ctx -> (match v_Vuna_dTypecheck_dlookupScheme "main" (v_Vuna_dTypedCodegen_dctxGlobals ctx) with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("typed codegen: no main definition")
  | C_Vuna_dMaybe_dJust (C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dResult_dErr ("typed codegen: main must be zero-arity")
  | _ -> if v_Vuna_dTypedCodegen_disIOType ty then (match v_Vuna_dTypedCodegen_dioCtorOf (v_Vuna_dTypedCodegen_dctxElabDecls ctx) with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("typed codegen: IO type is not defined in this program")
  | C_Vuna_dMaybe_dJust (ctor) -> C_Vuna_dResult_dOk (v_Vuna_dTypedCodegen_dioExecSuffixSplit (v_Vuna_dTypedCodegen_dctxElabDecls ctx) ctor)
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1673 13 ("case pattern match failure")) else C_Vuna_dResult_dErr ("typed codegen: executable main must have type IO a (use Vuna.IO)")
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1669 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/TypedCodegen.vuna" 1666 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dsplitMainFile = fun ctx ordered -> (let entryData = v_Vuna_dTypedCodegen_drouteData ctx "#entry" in let mainNames = v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_drouteFunNames ctx "#entry") (v_Vuna_dTypedCodegen_drouteFunNames ctx "#main") in v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenTypeDeclsOf (v_Vuna_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dTypedCodegen_dnonSpecialData entryData)) (fun types -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenShowDeclsOf (v_Vuna_dTypedCodegen_dctxElabDecls ctx) (v_Vuna_dTypedCodegen_dnonSpecialData entryData)) (fun shows -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenModuleTops ctx mainNames) (fun tops -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dsplitMainSuffix ctx) (fun suffix -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dopenHeader ordered) in (let vuna_cat1' = (types) in (let vuna_cat2' = (shows) in (let vuna_cat3' = (tops) in (let vuna_cat4' = (suffix) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))))))

let v_Vuna_dTypedCodegen_dgenerateSplitProgram = fun modules entryDecls elabDecls globals owners -> (let entryNames = v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dappend (v_Vuna_dAst_dtopNames entryDecls) (v_Vuna_dList_dappend (v_Vuna_dAst_dtypeNamesOf entryDecls) (v_Vuna_dAst_dctorsOf entryDecls))) in let definedNames = v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dappend (v_Vuna_dTypedCodegen_dfunctionNames elabDecls) (v_Vuna_dList_dappend (v_Vuna_dAst_dctorsOf elabDecls) (v_Vuna_dAst_dtypeNamesOf elabDecls))) in let runtimeCandidates = v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf (v_Vuna_dList_dfilter (fun p -> v_vuna_ueq_ustr (v_Vuna_dPair_dsecondOf p) "") owners)) in let baseCtx = C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, [], [], []) in let runtimeSafe = v_Vuna_dTypedCodegen_druntimeSafeOf baseCtx runtimeCandidates in let routeCtx = C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, [], []) in let routedFuns = v_Vuna_dTypedCodegen_drouteFunTable routeCtx elabDecls in let routedDatas = v_Vuna_dTypedCodegen_drouteDataTable routeCtx elabDecls in let ctx = C_Vuna_dTypedCodegen_dSplitCtx (modules, entryDecls, elabDecls, globals, owners, entryNames, definedNames, runtimeSafe, routedFuns, routedDatas) in v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dcheckRoutes ctx) (fun ok -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dtopoOrder modules) (fun ordered -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dsplitRuntimeFile ctx) (fun runtimeText -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dsplitModuleFiles ctx ordered) (fun moduleFiles -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dsplitMainFile ctx ordered) (fun mainText -> (let files = v_Vuna_dTypedCodegen_dinjectIOHelper (v_Vuna_dTypedCodegen_dctxElabDecls ctx) moduleFiles in C_Vuna_dResult_dOk ((C_Vuna_dSplit_dSplitFile ("Vuna_runtime.ml", runtimeText)) :: (v_Vuna_dList_dappend files ((C_Vuna_dSplit_dSplitFile ("Main.ml", mainText)) :: ([])))))))))))
