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
type   t_Vuna_dEval_dValue =
    C_Vuna_dEval_dVInt of (int)
  | C_Vuna_dEval_dVStr of (string)
  | C_Vuna_dEval_dVCon of (string) * ((t_Vuna_dEval_dValue) list)
  | C_Vuna_dEval_dVFun of (string) * ((t_Vuna_dEval_dValue) list)
  | C_Vuna_dEval_dVLam of ((string) list) * (t_Vuna_dAst_dExpr) * (((string, t_Vuna_dEval_dValue) t_Vuna_dPair_dPair) list)
  | C_Vuna_dEval_dVBuiltin of (string) * ((t_Vuna_dEval_dValue) list)
let rec show_Vuna_dEval_dValue v =
  match v with
  | C_Vuna_dEval_dVInt f0 -> show_ctor "VInt" [(string_of_int) f0]
  | C_Vuna_dEval_dVStr f0 -> show_ctor "VStr" [(show_vstring) f0]
  | C_Vuna_dEval_dVCon (f0, f1) -> show_ctor "VCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dEval_dVFun (f0, f1) -> show_ctor "VFun" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dEval_dVLam (f0, f1, f2) -> show_ctor "VLam" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dAst_dExpr) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dEval_dValue)) x ^ " " ^ go xs ^ ")" in go v)) f2]
  | C_Vuna_dEval_dVBuiltin (f0, f1) -> show_ctor "VBuiltin" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
let v_Vuna_dEval_dnoLocSpan = C_Vuna_dBase_dSpan ("", 0, 0, 0, 0)

let v_Vuna_dEval_derrAt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec), msg) -> if v_vuna_ueq_uint sl 0 then C_Vuna_dResult_dErr (msg) else C_Vuna_dResult_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc (C_Vuna_dBase_dSpan (f, sl, sc, el, ec))) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (msg) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 20 1 ("no matching clause for Vuna.Eval.errAt")

let v_Vuna_dEval_dexpectBoolValue = fun sp v -> (match v with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dResult_dOk (v)
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dResult_dOk (v)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 81 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dany = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> false
  | (f, (x) :: (rest)) -> if f x then true else v_Vuna_dEval_dany f rest
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 114 1 ("no matching clause for Vuna.Eval.any")

let v_Vuna_dEval_dpairSecond = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (_, v)) -> v
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 117 1 ("no matching clause for Vuna.Eval.pairSecond")

let rec v_Vuna_dEval_dpatNames = fun a0 -> match a0 with
  | (C_Vuna_dAst_dPVar (n, _)) -> (n) :: ([])
  | (C_Vuna_dAst_dPCon (_, ps, _)) -> v_Vuna_dList_dconcatMap v_Vuna_dEval_dpatNames ps
  | (_) -> []
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 122 1 ("no matching clause for Vuna.Eval.patNames")

let rec v_Vuna_dEval_dbindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dPair_dPair (pat, _)) :: (rest)) -> v_Vuna_dList_dappend (v_Vuna_dEval_dpatNames pat) (v_Vuna_dEval_dbindNames rest)
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 119 1 ("no matching clause for Vuna.Eval.bindNames")

let rec v_Vuna_dEval_dexprUsesAny = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dAst_dEVar (n, _), names) -> v_Vuna_dList_dmemName n names
  | (C_Vuna_dAst_dEApp (f, args, _), names) -> (if (v_Vuna_dEval_dexprUsesAny f names) then true else (v_Vuna_dEval_dany (fun a -> v_Vuna_dEval_dexprUsesAny a names) args))
  | (C_Vuna_dAst_dELam (_, body, _), names) -> v_Vuna_dEval_dexprUsesAny body names
  | (C_Vuna_dAst_dELet (binds, body, _, _), names) -> (if (v_Vuna_dEval_dany (fun b -> v_Vuna_dEval_dexprUsesAny (v_Vuna_dEval_dpairSecond b) names) binds) then true else (v_Vuna_dEval_dexprUsesAny body names))
  | (C_Vuna_dAst_dECase (s, alts, _), names) -> (if (v_Vuna_dEval_dexprUsesAny s names) then true else (v_Vuna_dEval_dany (fun a -> v_Vuna_dEval_dexprUsesAny (v_Vuna_dEval_dpairSecond a) names) alts))
  | (C_Vuna_dAst_dEIf (c, t, e, _), names) -> (if ((if (v_Vuna_dEval_dexprUsesAny c names) then true else (v_Vuna_dEval_dexprUsesAny t names))) then true else (v_Vuna_dEval_dexprUsesAny e names))
  | (_, names) -> false
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 126 1 ("no matching clause for Vuna.Eval.exprUsesAny")

let v_Vuna_dEval_drecursiveBindings = fun a0 -> match a0 with
  | ([]) -> false
  | (binds) -> (let names = v_Vuna_dEval_dbindNames binds in v_Vuna_dEval_dany (fun b -> v_Vuna_dEval_dexprUsesAny (v_Vuna_dEval_dpairSecond b) names) binds)
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 136 1 ("no matching clause for Vuna.Eval.recursiveBindings")

let v_Vuna_dEval_dapplyCtor = fun decls name args arg sp -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown constructor: ") ^ (name)))
  | C_Vuna_dMaybe_dJust (arity) -> if v_vuna_uge_uint (v_Vuna_dList_dlength args) arity then v_Vuna_dEval_derrAt sp ((let vuna_cat0' = ("constructor ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" cannot take more arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon (name, v_Vuna_dList_dappend args ((arg) :: ([]))))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 188 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dmatchPatterns = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> C_Vuna_dMaybe_dJust ([])
  | ((p) :: (ps), (v) :: (vs)) -> (match v_Vuna_dEval_dmatchPattern p v with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (bs) -> (match v_Vuna_dEval_dmatchPatterns ps vs with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (bs2) -> C_Vuna_dMaybe_dJust (v_Vuna_dList_dappend bs bs2)
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 220 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 217 3 ("case pattern match failure"))
  | (_, _) -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 215 1 ("no matching clause for Vuna.Eval.matchPatterns")
and v_Vuna_dEval_dmatchPattern = fun p v -> (match p with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dMaybe_dJust ([])
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dMaybe_dJust ((C_Vuna_dPair_dPair (name, v)) :: ([]))
  | C_Vuna_dAst_dPInt (n, _) -> (match v with
  | C_Vuna_dEval_dVInt (m) -> if v_vuna_ueq_uint n m then C_Vuna_dMaybe_dJust ([]) else C_Vuna_dMaybe_dNothing
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 230 7 ("case pattern match failure"))
  | C_Vuna_dAst_dPStr (s, _) -> (match v with
  | C_Vuna_dEval_dVStr (t) -> if v_vuna_ueq_ustr s t then C_Vuna_dMaybe_dJust ([]) else C_Vuna_dMaybe_dNothing
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 234 7 ("case pattern match failure"))
  | C_Vuna_dAst_dPCon (name, pats, _) -> (match v with
  | C_Vuna_dEval_dVCon (vname, vargs) -> if (if (v_vuna_ueq_ustr name vname) then (v_vuna_ueq_uint (v_Vuna_dList_dlength pats) (v_Vuna_dList_dlength vargs)) else false) then v_Vuna_dEval_dmatchPatterns pats vargs else C_Vuna_dMaybe_dNothing
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 238 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 226 3 ("case pattern match failure"))

let v_Vuna_dEval_dintArg = fun sp v -> (match v with
  | C_Vuna_dEval_dVInt (n) -> C_Vuna_dResult_dOk (n)
  | _ -> v_Vuna_dEval_derrAt sp "expected an Int argument"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 246 3 ("case pattern match failure"))

let v_Vuna_dEval_dstringArg = fun sp v -> (match v with
  | C_Vuna_dEval_dVStr (s) -> C_Vuna_dResult_dOk (s)
  | _ -> v_Vuna_dEval_derrAt sp "expected a String argument"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 251 3 ("case pattern match failure"))

let v_Vuna_dEval_dvbool = fun b -> if b then C_Vuna_dEval_dVCon ("True", []) else C_Vuna_dEval_dVCon ("False", [])

let rec v_Vuna_dEval_dcharsToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((c) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVInt (c)) :: ((v_Vuna_dEval_dcharsToValue rest) :: ([])))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 257 1 ("no matching clause for Vuna.Eval.charsToValue")

let v_Vuna_dEval_dstringToValue = fun s -> v_Vuna_dEval_dcharsToValue (bi_str_unpack s)

let rec v_Vuna_dEval_dstrListToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((s) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVStr (s)) :: ((v_Vuna_dEval_dstrListToValue rest) :: ([])))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 262 1 ("no matching clause for Vuna.Eval.strListToValue")

let rec v_Vuna_dEval_dvalueToChars = fun sp v -> (match v with
  | C_Vuna_dEval_dVCon ("Nil", []) -> C_Vuna_dResult_dOk ([])
  | C_Vuna_dEval_dVCon ("Cons", (head) :: ((tail) :: ([]))) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dintArg sp head) (fun n -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dvalueToChars sp tail) (fun rest -> C_Vuna_dResult_dOk ((n) :: (rest))))
  | _ -> v_Vuna_dEval_derrAt sp "strPack expects a List Int"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 266 3 ("case pattern match failure"))

let v_Vuna_dEval_dint2 = fun sp args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dintArg sp a) (fun x -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dintArg sp b) (fun y -> f x y))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 273 3 ("case pattern match failure"))

let v_Vuna_dEval_dstr2 = fun sp args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun x -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp b) (fun y -> f x y))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 278 3 ("case pattern match failure"))

let v_Vuna_dEval_ddivideBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dintArg sp a) (fun x -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dintArg sp b) (fun y -> if v_vuna_ueq_uint y 0 then v_Vuna_dEval_derrAt sp "division by zero" else C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_div x y))))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for /"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 283 3 ("case pattern match failure"))

let v_Vuna_dEval_dboolEqValue = fun a b -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> true
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 293 7 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon ("False", []) -> (match b with
  | C_Vuna_dEval_dVCon ("False", []) -> true
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 297 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 291 3 ("case pattern match failure"))

let v_Vuna_dEval_deqBuiltin = fun sp args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ueq_uint a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ueq_ustr a b))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for =="
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 303 3 ("case pattern match failure"))

let v_Vuna_dEval_dneqBuiltin = fun sp args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_uneq_uint a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_uneq_ustr a b))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for /="
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 309 3 ("case pattern match failure"))

let v_Vuna_dEval_dandBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 319 11 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 317 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for &&"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 315 3 ("case pattern match failure"))

let v_Vuna_dEval_dorBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 333 11 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 330 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for ||"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 328 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dstrCmpChars = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> 0
  | ([], (y) :: (ys)) -> bi_sub 0 1
  | ((x) :: (xs), []) -> 1
  | ((x) :: (xs), (y) :: (ys)) -> if v_vuna_ult_ugeneric x y then bi_sub 0 1 else if v_vuna_ugt_ugeneric x y then 1 else v_Vuna_dEval_dstrCmpChars xs ys
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 340 1 ("no matching clause for Vuna.Eval.strCmpChars")

let rec v_Vuna_dEval_dvalueCompare = fun a b -> (match a with
  | C_Vuna_dEval_dVInt (x) -> (match b with
  | C_Vuna_dEval_dVInt (y) -> if v_vuna_ult_uint x y then bi_sub 0 1 else if v_vuna_ueq_uint x y then 0 else 1
  | _ -> bi_sub 0 1
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 352 7 ("case pattern match failure"))
  | C_Vuna_dEval_dVStr (x) -> (match b with
  | C_Vuna_dEval_dVStr (y) -> v_Vuna_dEval_dstrCmpChars (bi_str_unpack x) (bi_str_unpack y)
  | C_Vuna_dEval_dVInt (y) -> 1
  | _ -> bi_sub 0 1
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 356 7 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon (n, xs) -> (match b with
  | C_Vuna_dEval_dVCon (m, ys) -> v_Vuna_dEval_dconCmp n xs m ys
  | _ -> 1
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 361 7 ("case pattern match failure"))
  | _ -> 0
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 350 3 ("case pattern match failure"))
and v_Vuna_dEval_dconCmp = fun n xs m ys -> (match v_Vuna_dEval_dstrCmpChars (bi_str_unpack n) (bi_str_unpack m) with
  | 0 -> v_Vuna_dEval_dlistCmp xs ys
  | r -> r
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 367 3 ("case pattern match failure"))
and v_Vuna_dEval_dlistCmp = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> 0
  | ([], (y) :: (ys)) -> bi_sub 0 1
  | ((x) :: (xs), []) -> 1
  | ((x) :: (xs), (y) :: (ys)) -> (match v_Vuna_dEval_dvalueCompare x y with
  | 0 -> v_Vuna_dEval_dlistCmp xs ys
  | r -> r
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 378 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 371 1 ("no matching clause for Vuna.Eval.listCmp")

let v_Vuna_dEval_dgenericEq = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ueq_uint (v_Vuna_dEval_dvalueCompare a b) 0))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for generic equality"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 383 3 ("case pattern match failure"))

let v_Vuna_dEval_dgenericCmp = fun sp args mode -> (match args with
  | (a) :: ((b) :: ([])) -> (let r = v_Vuna_dEval_dvalueCompare a b in if v_vuna_ueq_uint mode 0 then C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ult_uint r 0)) else if v_vuna_ueq_uint mode 1 then C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ule_uint r 0)) else if v_vuna_ueq_uint mode 2 then C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ugt_uint r 0)) else C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_uge_uint r 0)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for generic comparison"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 388 3 ("case pattern match failure"))

let v_Vuna_dEval_ddisplayName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dPair_dPair (revPrefix, base) -> base
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 509 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dshowStringChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 34 then (("\\\"") ^ (v_Vuna_dEval_dshowStringChars rest)) else if v_vuna_ueq_uint c 92 then (("\\\\") ^ (v_Vuna_dEval_dshowStringChars rest)) else if v_vuna_ueq_uint c 10 then (("\\n") ^ (v_Vuna_dEval_dshowStringChars rest)) else if v_vuna_ueq_uint c 9 then (("\\t") ^ (v_Vuna_dEval_dshowStringChars rest)) else if v_vuna_ueq_uint c 13 then (("\\r") ^ (v_Vuna_dEval_dshowStringChars rest)) else ((bi_str_pack ((c) :: ([]))) ^ (v_Vuna_dEval_dshowStringChars rest))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 528 1 ("no matching clause for Vuna.Eval.showStringChars")

let v_Vuna_dEval_dshowString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (v_Vuna_dEval_dshowStringChars (bi_str_unpack s)) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dEval_dcallBuiltin = fun name args sp -> (match name with
  | "+" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_add x y)))
  | "-" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_sub x y)))
  | "*" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_mul x y)))
  | "/" -> v_Vuna_dEval_ddivideBuiltin sp args
  | "==" -> v_Vuna_dEval_deqBuiltin sp args
  | "/=" -> v_Vuna_dEval_dneqBuiltin sp args
  | "<" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ult_uint x y)))
  | "<=" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ule_uint x y)))
  | ">" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ugt_uint x y)))
  | ">=" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_uge_uint x y)))
  | "bi_eq_generic" -> v_Vuna_dEval_dgenericEq sp args
  | "bi_neq_generic" -> (match v_Vuna_dEval_dgenericEq sp args with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (v) -> (match v with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("False", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon ("True", []))
  | _ -> C_Vuna_dResult_dErr ("bad bool")
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 413 17 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 411 7 ("case pattern match failure"))
  | "bi_lt_generic" -> v_Vuna_dEval_dgenericCmp sp args 0
  | "bi_le_generic" -> v_Vuna_dEval_dgenericCmp sp args 1
  | "bi_gt_generic" -> v_Vuna_dEval_dgenericCmp sp args 2
  | "bi_ge_generic" -> v_Vuna_dEval_dgenericCmp sp args 3
  | "bi_show_string" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVStr (v_Vuna_dEval_dshowString s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for bi_show_string"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 422 7 ("case pattern match failure"))
  | "bi_eq_int" -> v_Vuna_dEval_deqBuiltin sp args
  | "bi_neq_int" -> v_Vuna_dEval_dneqBuiltin sp args
  | "bi_lt_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ult_uint x y)))
  | "bi_le_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ule_uint x y)))
  | "bi_gt_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_ugt_uint x y)))
  | "bi_ge_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (v_vuna_uge_uint x y)))
  | "bi_eq_str" -> v_Vuna_dEval_deqBuiltin sp args
  | "bi_neq_str" -> v_Vuna_dEval_dneqBuiltin sp args
  | "bi_eq_bool" -> (match args with
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool false)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool false)
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for bi_eq_bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 434 7 ("case pattern match failure"))
  | "bi_neq_bool" -> (match args with
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool false)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool false)
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for bi_neq_bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 441 7 ("case pattern match failure"))
  | "&&" -> v_Vuna_dEval_dandBuiltin sp args
  | "||" -> v_Vuna_dEval_dorBuiltin sp args
  | "++" -> v_Vuna_dEval_dstr2 sp args (fun x y -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVStr (((x) ^ (y)))))
  | "strLength" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_str_length s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strLength"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 451 7 ("case pattern match failure"))
  | "strUnpack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (v_Vuna_dEval_dstringToValue s))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strUnpack"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 455 7 ("case pattern match failure"))
  | "strPack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dvalueToChars sp a) (fun cs -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVStr (bi_str_pack cs)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strPack"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 459 7 ("case pattern match failure"))
  | "strFromInt" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dintArg sp a) (fun n -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVStr (bi_str_from_int n)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strFromInt"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 463 7 ("case pattern match failure"))
  | "readFile" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVStr (bi_read_file s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for readFile"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 467 7 ("case pattern match failure"))
  | "writeFile" -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun path -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp b) (fun s -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_write_file path s))))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for writeFile"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 471 7 ("case pattern match failure"))
  | "print" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_print s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for print"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 477 7 ("case pattern match failure"))
  | "getArgs" -> C_Vuna_dResult_dOk (v_Vuna_dEval_dstrListToValue (bi_get_args ()))
  | "readLine" -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVStr (bi_read_line ()))
  | "readDir" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (v_Vuna_dEval_dstrListToValue (bi_read_dir s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for readDir"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 483 7 ("case pattern match failure"))
  | "isDirectory" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (bi_is_directory s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for isDirectory"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 487 7 ("case pattern match failure"))
  | "makeDir" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_make_dir s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for makeDir"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 491 7 ("case pattern match failure"))
  | "removeFile" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_remove_file s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for removeFile"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 495 7 ("case pattern match failure"))
  | "fileExists" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dResult_dOk (v_Vuna_dEval_dvbool (bi_file_exists s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for fileExists"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 499 7 ("case pattern match failure"))
  | "exit" -> (match args with
  | (a) :: ([]) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dintArg sp a) (fun n -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (bi_exit n)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for exit"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 503 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp ((("unknown builtin: ") ^ (name)))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 398 3 ("case pattern match failure"))

let v_Vuna_dEval_devalGlobalNonFun = fun decls name sp -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (arity) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVCon (name, []))
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dMaybe_dJust (arity) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dEval_dcallBuiltin name [] sp else C_Vuna_dResult_dOk (C_Vuna_dEval_dVBuiltin (name, []))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_derrAt sp ((("unbound variable: ") ^ (name)))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 47 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 44 3 ("case pattern match failure"))

let v_Vuna_dEval_dapplyBuiltin = fun decls name args arg sp -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown builtin: ") ^ (name)))
  | C_Vuna_dMaybe_dJust (arity) -> (let args2 = v_Vuna_dList_dappend args ((arg) :: ([])) in if v_vuna_ult_uint (v_Vuna_dList_dlength args2) arity then C_Vuna_dResult_dOk (C_Vuna_dEval_dVBuiltin (name, args2)) else if v_vuna_ueq_uint (v_Vuna_dList_dlength args2) arity then v_Vuna_dEval_dcallBuiltin name args2 sp else v_Vuna_dEval_derrAt sp ((("too many arguments for builtin ") ^ (name))))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 195 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dforceValue = fun decls v -> (match v with
  | C_Vuna_dEval_dVFun (name, []) -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dJust (0) -> v_Vuna_dEval_dcallFunction decls name [] v_Vuna_dEval_dnoLocSpan
  | _ -> C_Vuna_dResult_dOk (v)
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 26 7 ("case pattern match failure"))
  | _ -> C_Vuna_dResult_dOk (v)
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 24 3 ("case pattern match failure"))
and v_Vuna_dEval_devalVar = fun decls env name sp -> (match v_Vuna_dList_dlookupPair name env with
  | C_Vuna_dMaybe_dJust (v) -> v_Vuna_dEval_dforceValue decls v
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_devalGlobal decls name sp
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 32 3 ("case pattern match failure"))
and v_Vuna_dEval_devalGlobal = fun decls name sp -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dJust (arity) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dEval_dcallFunction decls name [] sp else C_Vuna_dResult_dOk (C_Vuna_dEval_dVFun (name, []))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_devalGlobalNonFun decls name sp
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 37 3 ("case pattern match failure"))
and v_Vuna_dEval_devalExpr = fun decls env expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> v_Vuna_dEval_devalVar decls env name sp
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVInt (n))
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVStr (s))
  | C_Vuna_dAst_dELam (params, body, _) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVLam (params, body, env))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dEval_devalApp decls env sp fn args
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dEval_devalLet decls env sp rec_u binds body
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dEval_devalCase decls env sp scrut alts
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dEval_devalIf decls env sp c t e
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 53 3 ("case pattern match failure"))
and v_Vuna_dEval_devalApp = fun decls env sp fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("&&", sp2) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalAndShort decls env sp2 a b
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 68 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar ("||", sp2) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalOrShort decls env sp2 a b
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 72 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 66 3 ("case pattern match failure"))
and v_Vuna_dEval_devalApply = fun decls env sp fn args -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env fn) (fun fv -> v_Vuna_dEval_dfoldApply decls env sp fv args)
and v_Vuna_dEval_devalAndShort = fun decls env sp a b -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dResult_dOk (av)
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun bv -> v_Vuna_dEval_dexpectBoolValue sp bv)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 88 5 ("case pattern match failure")))
and v_Vuna_dEval_devalOrShort = fun decls env sp a b -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dResult_dOk (av)
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun bv -> v_Vuna_dEval_dexpectBoolValue sp bv)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 96 5 ("case pattern match failure")))
and v_Vuna_dEval_dfoldApply = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, sp, fv, []) -> C_Vuna_dResult_dOk (fv)
  | (decls, env, sp, fv, (arg) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env arg) (fun av -> v_Vuna_dResult_dandThen (v_Vuna_dEval_dapplyValue decls sp fv av) (fun fv2 -> v_Vuna_dEval_dfoldApply decls env sp fv2 rest))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 102 1 ("no matching clause for Vuna.Eval.foldApply")
and v_Vuna_dEval_devalLet = fun decls env sp rec_u binds body -> if (if (rec_u) then (v_Vuna_dEval_drecursiveBindings binds) else false) then v_Vuna_dEval_derrAt sp "recursive let (where) bindings are only supported by the compiler (use --typecheck); the interpreter evaluates them sequentially" else v_Vuna_dResult_dandThen (v_Vuna_dEval_devalBindings decls env sp binds) (fun env2 -> v_Vuna_dEval_devalExpr decls env2 body)
and v_Vuna_dEval_devalBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, sp, []) -> C_Vuna_dResult_dOk (env)
  | (decls, env, sp, (C_Vuna_dPair_dPair (pat, valueExpr)) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env valueExpr) (fun v -> (match v_Vuna_dEval_dmatchPattern pat v with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_derrAt (v_Vuna_dAst_dpatSpan pat) "let pattern match failure"
  | C_Vuna_dMaybe_dJust (bs) -> v_Vuna_dEval_devalBindings decls (v_Vuna_dList_dappend bs env) sp rest
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 144 5 ("case pattern match failure")))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 141 1 ("no matching clause for Vuna.Eval.evalBindings")
and v_Vuna_dEval_devalCase = fun decls env sp scrut alts -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env scrut) (fun v -> v_Vuna_dEval_dchooseAlt decls env sp v alts)
and v_Vuna_dEval_dchooseAlt = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, sp, v, []) -> v_Vuna_dEval_derrAt sp "case pattern match failure"
  | (decls, env, sp, v, (C_Vuna_dPair_dPair (pat, body)) :: (rest)) -> (match v_Vuna_dEval_dmatchPattern pat v with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_dchooseAlt decls env sp v rest
  | C_Vuna_dMaybe_dJust (bs) -> v_Vuna_dEval_devalExpr decls (v_Vuna_dList_dappend bs env) body
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 153 3 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 151 1 ("no matching clause for Vuna.Eval.chooseAlt")
and v_Vuna_dEval_devalIf = fun decls env sp c t e -> v_Vuna_dResult_dandThen (v_Vuna_dEval_devalExpr decls env c) (fun cv -> (match cv with
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dEval_devalExpr decls env t
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dEval_devalExpr decls env e
  | _ -> v_Vuna_dEval_derrAt sp "if condition is not a Bool"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 159 5 ("case pattern match failure")))
and v_Vuna_dEval_dapplyValue = fun decls sp v arg -> (match v with
  | C_Vuna_dEval_dVFun (name, bound) -> v_Vuna_dEval_dapplyFun decls name bound arg sp
  | C_Vuna_dEval_dVLam (params, body, env) -> v_Vuna_dEval_dapplyLambda decls params body env arg
  | C_Vuna_dEval_dVCon (name, args) -> v_Vuna_dEval_dapplyCtor decls name args arg sp
  | C_Vuna_dEval_dVBuiltin (name, args) -> v_Vuna_dEval_dapplyBuiltin decls name args arg sp
  | _ -> v_Vuna_dEval_derrAt sp "cannot apply a non-function"
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 165 3 ("case pattern match failure"))
and v_Vuna_dEval_dapplyFun = fun decls name bound arg sp -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown function: ") ^ (name)))
  | C_Vuna_dMaybe_dJust (arity) -> (let bound2 = v_Vuna_dList_dappend bound ((arg) :: ([])) in if v_vuna_ult_uint (v_Vuna_dList_dlength bound2) arity then C_Vuna_dResult_dOk (C_Vuna_dEval_dVFun (name, bound2)) else if v_vuna_ueq_uint (v_Vuna_dList_dlength bound2) arity then v_Vuna_dEval_dcallFunction decls name bound2 sp else v_Vuna_dEval_derrAt sp ((("too many arguments for ") ^ (name))))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 173 3 ("case pattern match failure"))
and v_Vuna_dEval_dapplyLambda = fun decls params body env arg -> (match params with
  | [] -> v_Vuna_dEval_derrAt v_Vuna_dEval_dnoLocSpan "lambda has no parameters"
  | (p) :: ([]) -> v_Vuna_dEval_devalExpr decls ((C_Vuna_dPair_dPair (p, arg)) :: (env)) body
  | (p) :: (rest) -> C_Vuna_dResult_dOk (C_Vuna_dEval_dVLam (rest, body, (C_Vuna_dPair_dPair (p, arg)) :: (env)))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 182 3 ("case pattern match failure"))
and v_Vuna_dEval_dcallFunction = fun decls name args sp -> v_Vuna_dEval_dtryClauses decls name (v_Vuna_dAst_dclausesFor decls name) args sp
and v_Vuna_dEval_dtryClauses = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, name, [], args, sp) -> v_Vuna_dEval_derrAt sp ((("no matching clause for ") ^ (name)))
  | (decls, name, (C_Vuna_dPair_dPair (pats, body)) :: (rest), args, sp) -> if v_vuna_ueq_uint (v_Vuna_dList_dlength pats) (v_Vuna_dList_dlength args) then v_Vuna_dEval_dtryMatch decls name pats body rest args sp else v_Vuna_dEval_dtryClauses decls name rest args sp
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 205 1 ("no matching clause for Vuna.Eval.tryClauses")
and v_Vuna_dEval_dtryMatch = fun decls name pats body rest args sp -> (match v_Vuna_dEval_dmatchPatterns pats args with
  | C_Vuna_dMaybe_dJust (binds) -> v_Vuna_dEval_devalExpr decls binds body
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dEval_dtryClauses decls name rest args sp
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 211 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dshowValue = fun v -> (match v with
  | C_Vuna_dEval_dVInt (n) -> bi_str_from_int n
  | C_Vuna_dEval_dVStr (s) -> v_Vuna_dEval_dshowString s
  | C_Vuna_dEval_dVCon (name, []) -> v_Vuna_dEval_ddisplayName name
  | C_Vuna_dEval_dVCon (name, args) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dEval_ddisplayName name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dEval_dshowValues args) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dEval_dVFun (name, args) -> (let vuna_cat0' = ("<function ") in (let vuna_cat1' = (v_Vuna_dEval_ddisplayName name) in (let vuna_cat2' = (">") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dEval_dVLam (params, body, env) -> "<lambda>"
  | C_Vuna_dEval_dVBuiltin (name, args) -> (let vuna_cat0' = ("<builtin ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (">") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 513 3 ("case pattern match failure"))
and v_Vuna_dEval_dshowValues = fun a0 -> match a0 with
  | ([]) -> ""
  | ((v) :: ([])) -> v_Vuna_dEval_dshowValue v
  | ((v) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dEval_dshowValue v) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dEval_dshowValues rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 522 1 ("no matching clause for Vuna.Eval.showValues")

let v_Vuna_dEval_dinterpretMain = fun decls -> (match v_Vuna_dAst_dfunArity "main" decls with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("no `main` definition")
  | C_Vuna_dMaybe_dJust (arity) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dEval_dcallFunction decls "main" [] v_Vuna_dEval_dnoLocSpan else C_Vuna_dResult_dErr ("`main` must be a nullary definition")
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 538 3 ("case pattern match failure"))

let v_Vuna_dEval_drunDecls = fun decls -> (match v_Vuna_dEval_dinterpretMain decls with
  | C_Vuna_dResult_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dResult_dOk (v) -> v_Vuna_dEval_dshowValue v
  | _ -> vuna_fail "./lib/Vuna/Eval.vuna" 545 3 ("case pattern match failure"))
