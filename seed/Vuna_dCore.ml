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
type   t_Vuna_dCore_dTerm =
    C_Vuna_dCore_dTVar of (string) * (int)
  | C_Vuna_dCore_dTMeta of (int)
  | C_Vuna_dCore_dTGlobal of (string)
  | C_Vuna_dCore_dTType of (int)
  | C_Vuna_dCore_dTPi of (string) * (bool) * (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm)
  | C_Vuna_dCore_dTLam of (string) * (bool) * (t_Vuna_dCore_dTerm)
  | C_Vuna_dCore_dTApp of (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm) * (bool)
  | C_Vuna_dCore_dTInt of (int)
  | C_Vuna_dCore_dTStr of (string)
  | C_Vuna_dCore_dTBool of (bool)
  | C_Vuna_dCore_dTIf of (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm)
and   t_Vuna_dCore_dClosure =
    C_Vuna_dCore_dClos of ((t_Vuna_dCore_dValue) list) * (t_Vuna_dCore_dTerm)
and   t_Vuna_dCore_dNeutral =
    C_Vuna_dCore_dNVar of (string) * (int) * ((t_Vuna_dCore_dValue) list)
  | C_Vuna_dCore_dNGlobal of (string) * ((t_Vuna_dCore_dValue) list)
and   t_Vuna_dCore_dValue =
    C_Vuna_dCore_dVType of (int)
  | C_Vuna_dCore_dVPi of (string) * (bool) * (t_Vuna_dCore_dValue) * (t_Vuna_dCore_dClosure)
  | C_Vuna_dCore_dVLam of (string) * (bool) * (t_Vuna_dCore_dClosure)
  | C_Vuna_dCore_dVNeutral of (t_Vuna_dCore_dNeutral)
  | C_Vuna_dCore_dVMeta of (int) * ((t_Vuna_dCore_dValue) list)
  | C_Vuna_dCore_dVInt of (int)
  | C_Vuna_dCore_dVStr of (string)
  | C_Vuna_dCore_dVBool of (bool)
  | C_Vuna_dCore_dVIf of (t_Vuna_dCore_dValue) * (t_Vuna_dCore_dValue) * (t_Vuna_dCore_dValue)
let rec show_Vuna_dCore_dTerm v =
  match v with
  | C_Vuna_dCore_dTVar (f0, f1) -> show_ctor "TVar" [(show_vstring) f0; (string_of_int) f1]
  | C_Vuna_dCore_dTMeta f0 -> show_ctor "TMeta" [(string_of_int) f0]
  | C_Vuna_dCore_dTGlobal f0 -> show_ctor "TGlobal" [(show_vstring) f0]
  | C_Vuna_dCore_dTType f0 -> show_ctor "TType" [(string_of_int) f0]
  | C_Vuna_dCore_dTPi (f0, f1, f2, f3) -> show_ctor "TPi" [(show_vstring) f0; (show_vbool) f1; (show_Vuna_dCore_dTerm) f2; (show_Vuna_dCore_dTerm) f3]
  | C_Vuna_dCore_dTLam (f0, f1, f2) -> show_ctor "TLam" [(show_vstring) f0; (show_vbool) f1; (show_Vuna_dCore_dTerm) f2]
  | C_Vuna_dCore_dTApp (f0, f1, f2) -> show_ctor "TApp" [(show_Vuna_dCore_dTerm) f0; (show_Vuna_dCore_dTerm) f1; (show_vbool) f2]
  | C_Vuna_dCore_dTInt f0 -> show_ctor "TInt" [(string_of_int) f0]
  | C_Vuna_dCore_dTStr f0 -> show_ctor "TStr" [(show_vstring) f0]
  | C_Vuna_dCore_dTBool f0 -> show_ctor "TBool" [(show_vbool) f0]
  | C_Vuna_dCore_dTIf (f0, f1, f2) -> show_ctor "TIf" [(show_Vuna_dCore_dTerm) f0; (show_Vuna_dCore_dTerm) f1; (show_Vuna_dCore_dTerm) f2]
and show_Vuna_dCore_dClosure v =
  match v with
  | C_Vuna_dCore_dClos (f0, f1) -> show_ctor "Clos" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dCore_dTerm) f1]
and show_Vuna_dCore_dNeutral v =
  match v with
  | C_Vuna_dCore_dNVar (f0, f1, f2) -> show_ctor "NVar" [(show_vstring) f0; (string_of_int) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f2]
  | C_Vuna_dCore_dNGlobal (f0, f1) -> show_ctor "NGlobal" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
and show_Vuna_dCore_dValue v =
  match v with
  | C_Vuna_dCore_dVType f0 -> show_ctor "VType" [(string_of_int) f0]
  | C_Vuna_dCore_dVPi (f0, f1, f2, f3) -> show_ctor "VPi" [(show_vstring) f0; (show_vbool) f1; (show_Vuna_dCore_dValue) f2; (show_Vuna_dCore_dClosure) f3]
  | C_Vuna_dCore_dVLam (f0, f1, f2) -> show_ctor "VLam" [(show_vstring) f0; (show_vbool) f1; (show_Vuna_dCore_dClosure) f2]
  | C_Vuna_dCore_dVNeutral f0 -> show_ctor "VNeutral" [(show_Vuna_dCore_dNeutral) f0]
  | C_Vuna_dCore_dVMeta (f0, f1) -> show_ctor "VMeta" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dCore_dVInt f0 -> show_ctor "VInt" [(string_of_int) f0]
  | C_Vuna_dCore_dVStr f0 -> show_ctor "VStr" [(show_vstring) f0]
  | C_Vuna_dCore_dVBool f0 -> show_ctor "VBool" [(show_vbool) f0]
  | C_Vuna_dCore_dVIf (f0, f1, f2) -> show_ctor "VIf" [(show_Vuna_dCore_dValue) f0; (show_Vuna_dCore_dValue) f1; (show_Vuna_dCore_dValue) f2]
let v_Vuna_dCore_ddefaultFuel = 512

let rec v_Vuna_dCore_dlookupEnv = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dMaybe_dNothing
  | (i, (v) :: (rest)) -> if v_vuna_ule_uint i 0 then C_Vuna_dMaybe_dJust (v) else v_Vuna_dCore_dlookupEnv (bi_sub i 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 57 1 ("no matching clause for Vuna.Core.lookupEnv")

let v_Vuna_dCore_devalIf = fun c th el -> (match c with
  | C_Vuna_dCore_dVBool (b) -> if b then th else el
  | _ -> C_Vuna_dCore_dVIf (c, th, el)
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 80 3 ("case pattern match failure"))

let v_Vuna_dCore_dspineAppend = fun n a -> (match n with
  | C_Vuna_dCore_dNVar (name, level, sp) -> C_Vuna_dCore_dNVar (name, level, v_Vuna_dList_dappend sp ((a) :: ([])))
  | C_Vuna_dCore_dNGlobal (g, sp) -> C_Vuna_dCore_dNGlobal (g, v_Vuna_dList_dappend sp ((a) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 86 3 ("case pattern match failure"))

let rec v_Vuna_dCore_deval = fun env t -> (match t with
  | C_Vuna_dCore_dTVar (name, i) -> (match v_Vuna_dCore_dlookupEnv i env with
  | C_Vuna_dMaybe_dJust (v) -> v
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNVar (name, i, []))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 64 7 ("case pattern match failure"))
  | C_Vuna_dCore_dTMeta (m) -> C_Vuna_dCore_dVMeta (m, [])
  | C_Vuna_dCore_dTGlobal (g) -> C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNGlobal (g, []))
  | C_Vuna_dCore_dTType (n) -> C_Vuna_dCore_dVType (n)
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> C_Vuna_dCore_dVPi (name, implicit, v_Vuna_dCore_deval env dom, C_Vuna_dCore_dClos (env, cod))
  | C_Vuna_dCore_dTLam (name, erased, body) -> C_Vuna_dCore_dVLam (name, erased, C_Vuna_dCore_dClos (env, body))
  | C_Vuna_dCore_dTApp (f, a, erased) -> v_Vuna_dCore_dapplyValue (v_Vuna_dCore_deval env f) (v_Vuna_dCore_deval env a)
  | C_Vuna_dCore_dTInt (n) -> C_Vuna_dCore_dVInt (n)
  | C_Vuna_dCore_dTStr (s) -> C_Vuna_dCore_dVStr (s)
  | C_Vuna_dCore_dTBool (b) -> C_Vuna_dCore_dVBool (b)
  | C_Vuna_dCore_dTIf (c, th, el) -> v_Vuna_dCore_devalIf (v_Vuna_dCore_deval env c) (v_Vuna_dCore_deval env th) (v_Vuna_dCore_deval env el)
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 62 3 ("case pattern match failure"))
and v_Vuna_dCore_dapplyValue = fun f a -> (match f with
  | C_Vuna_dCore_dVLam (name, erased, C_Vuna_dCore_dClos (env, body)) -> v_Vuna_dCore_deval ((a) :: (env)) body
  | C_Vuna_dCore_dVNeutral (n) -> C_Vuna_dCore_dVNeutral (v_Vuna_dCore_dspineAppend n a)
  | C_Vuna_dCore_dVMeta (m, sp) -> C_Vuna_dCore_dVMeta (m, v_Vuna_dList_dappend sp ((a) :: ([])))
  | _ -> f
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 92 3 ("case pattern match failure"))

let v_Vuna_dCore_dapplyClosure = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCore_dClos (env, body), v) -> v_Vuna_dCore_deval ((v) :: (env)) body
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 99 1 ("no matching clause for Vuna.Core.applyClosure")

let rec v_Vuna_dCore_dapplySpine = fun a0 a1 -> match (a0, a1) with
  | (v, []) -> v
  | (v, (a) :: (rest)) -> v_Vuna_dCore_dapplySpine (v_Vuna_dCore_dapplyValue v a) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 102 1 ("no matching clause for Vuna.Core.applySpine")

let rec v_Vuna_dCore_dmetaLookup = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dMaybe_dNothing
  | (i, (C_Vuna_dPair_dPair (j, t)) :: (rest)) -> if v_vuna_ueq_uint i j then C_Vuna_dMaybe_dJust (t) else v_Vuna_dCore_dmetaLookup i rest
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 110 1 ("no matching clause for Vuna.Core.metaLookup")

let rec v_Vuna_dCore_ddefLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dMaybe_dNothing
  | (name, (C_Vuna_dPair_dPair (n, t)) :: (rest)) -> if v_vuna_ueq_ustr name n then C_Vuna_dMaybe_dJust (t) else v_Vuna_dCore_ddefLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 114 1 ("no matching clause for Vuna.Core.defLookup")

let v_Vuna_dCore_disPrimitiveName = fun g -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if (v_vuna_ueq_ustr g "+") then true else (v_vuna_ueq_ustr g "-"))) then true else (v_vuna_ueq_ustr g "*"))) then true else (v_vuna_ueq_ustr g "/"))) then true else (v_vuna_ueq_ustr g "=="))) then true else (v_vuna_ueq_ustr g "/="))) then true else (v_vuna_ueq_ustr g "<"))) then true else (v_vuna_ueq_ustr g "<="))) then true else (v_vuna_ueq_ustr g ">"))) then true else (v_vuna_ueq_ustr g ">="))) then true else (v_vuna_ueq_ustr g "++"))) then true else (v_vuna_ueq_ustr g "&&"))) then true else (v_vuna_ueq_ustr g "||"))

let v_Vuna_dCore_dasInt = fun v -> (match v with
  | C_Vuna_dCore_dVInt (n) -> C_Vuna_dMaybe_dJust (n)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 154 11 ("case pattern match failure"))

let v_Vuna_dCore_dasStr = fun v -> (match v with
  | C_Vuna_dCore_dVStr (s) -> C_Vuna_dMaybe_dJust (s)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 159 11 ("case pattern match failure"))

let v_Vuna_dCore_dasBool = fun v -> (match v with
  | C_Vuna_dCore_dVBool (b) -> C_Vuna_dMaybe_dJust (b)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 164 12 ("case pattern match failure"))

let v_Vuna_dCore_dintPrim2 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ((b) :: ([])), f) -> (match v_Vuna_dCore_dasInt a with
  | C_Vuna_dMaybe_dJust (x) -> (match v_Vuna_dCore_dasInt b with
  | C_Vuna_dMaybe_dJust (y) -> C_Vuna_dMaybe_dJust (f x y)
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 171 15 ("case pattern match failure"))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 170 3 ("case pattern match failure"))
  | (sp, f) -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 169 1 ("no matching clause for Vuna.Core.intPrim2")

let v_Vuna_dCore_dboolPrim2 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ((b) :: ([])), f) -> (match v_Vuna_dCore_dasBool a with
  | C_Vuna_dMaybe_dJust (x) -> (match v_Vuna_dCore_dasBool b with
  | C_Vuna_dMaybe_dJust (y) -> C_Vuna_dMaybe_dJust (f x y)
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 180 15 ("case pattern match failure"))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 179 3 ("case pattern match failure"))
  | (sp, f) -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 178 1 ("no matching clause for Vuna.Core.boolPrim2")

let v_Vuna_dCore_dstrPrim2 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ((b) :: ([])), f) -> (match v_Vuna_dCore_dasStr a with
  | C_Vuna_dMaybe_dJust (x) -> (match v_Vuna_dCore_dasStr b with
  | C_Vuna_dMaybe_dJust (y) -> C_Vuna_dMaybe_dJust (f x y)
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 189 15 ("case pattern match failure"))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 188 3 ("case pattern match failure"))
  | (sp, f) -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 187 1 ("no matching clause for Vuna.Core.strPrim2")

let v_Vuna_dCore_dnotBool = fun b -> if b then false else true

let v_Vuna_dCore_dprimReduce = fun g sp -> (match g with
  | "+" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVInt (bi_add a b))
  | "-" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVInt (bi_sub a b))
  | "*" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVInt (bi_mul a b))
  | "/" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> if v_vuna_ueq_uint b 0 then C_Vuna_dCore_dVInt (0) else C_Vuna_dCore_dVInt (bi_div a b))
  | "==" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVBool (v_vuna_ueq_uint a b))
  | "/=" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVBool (v_Vuna_dCore_dnotBool (v_vuna_ueq_uint a b)))
  | "<" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVBool (v_vuna_ult_uint a b))
  | "<=" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVBool (v_vuna_ule_uint a b))
  | ">" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVBool (v_vuna_ugt_uint a b))
  | ">=" -> v_Vuna_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCore_dVBool (v_vuna_uge_uint a b))
  | "++" -> v_Vuna_dCore_dstrPrim2 sp (fun a b -> C_Vuna_dCore_dVStr (((a) ^ (b))))
  | "&&" -> v_Vuna_dCore_dboolPrim2 sp (fun a b -> C_Vuna_dCore_dVBool ((if (a) then (b) else false)))
  | "||" -> v_Vuna_dCore_dboolPrim2 sp (fun a b -> C_Vuna_dCore_dVBool ((if (a) then true else (b))))
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 197 3 ("case pattern match failure"))

let rec v_Vuna_dCore_dforce = fun defs sols fuel v -> if v_vuna_ule_uint fuel 0 then v else (match v with
  | C_Vuna_dCore_dVMeta (m, sp) -> (match v_Vuna_dCore_dmetaLookup m sols with
  | C_Vuna_dMaybe_dJust (t) -> v_Vuna_dCore_dforce defs sols (bi_sub fuel 1) (v_Vuna_dCore_dapplySpine (v_Vuna_dCore_deval [] t) sp)
  | C_Vuna_dMaybe_dNothing -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 127 9 ("case pattern match failure"))
  | C_Vuna_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCore_dNGlobal (g, sp) -> (match v_Vuna_dCore_ddefLookup g defs with
  | C_Vuna_dMaybe_dJust (body) -> v_Vuna_dCore_dforce defs sols (bi_sub fuel 1) (v_Vuna_dCore_dapplySpine (v_Vuna_dCore_deval [] body) sp)
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dCore_dprimReduce g sp with
  | C_Vuna_dMaybe_dJust (v2) -> v_Vuna_dCore_dforce defs sols (bi_sub fuel 1) v2
  | C_Vuna_dMaybe_dNothing -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 136 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 133 13 ("case pattern match failure"))
  | _ -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 131 9 ("case pattern match failure"))
  | _ -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 125 5 ("case pattern match failure"))

let rec v_Vuna_dCore_dnormalize = fun defs sols fuel v -> if v_vuna_ule_uint fuel 0 then v else (match v_Vuna_dCore_dforce defs sols fuel v with
  | C_Vuna_dCore_dVNeutral (n) -> v_Vuna_dCore_dnormalizeNeutral defs sols fuel n
  | C_Vuna_dCore_dVIf (c, th, el) -> v_Vuna_dCore_dnormalizeIf defs sols fuel c th el
  | other -> other
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 225 5 ("case pattern match failure"))
and v_Vuna_dCore_dnormalizeNeutral = fun defs sols fuel n -> (match n with
  | C_Vuna_dCore_dNVar (name, level, sp) -> C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNVar (name, level, v_Vuna_dList_dmap (v_Vuna_dCore_dnormalize defs sols fuel) sp))
  | C_Vuna_dCore_dNGlobal (g, sp) -> (let sp2 = v_Vuna_dList_dmap (v_Vuna_dCore_dnormalize defs sols fuel) sp in (match v_Vuna_dCore_ddefLookup g defs with
  | C_Vuna_dMaybe_dJust (body) -> v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) (v_Vuna_dCore_dapplySpine (v_Vuna_dCore_deval [] body) sp2)
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dCore_dprimReduce g sp2 with
  | C_Vuna_dMaybe_dJust (v2) -> v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) v2
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNGlobal (g, sp2))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 239 14 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 236 10 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 232 3 ("case pattern match failure"))
and v_Vuna_dCore_dnormalizeIf = fun defs sols fuel c th el -> (match v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) c with
  | C_Vuna_dCore_dVBool (b) -> v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) (if b then th else el)
  | C_Vuna_dCore_dVNeutral (n) -> C_Vuna_dCore_dVIf (C_Vuna_dCore_dVNeutral (n), v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) th, v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) el)
  | other -> C_Vuna_dCore_dVIf (other, v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) th, v_Vuna_dCore_dnormalize defs sols (bi_sub fuel 1) el)
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 245 3 ("case pattern match failure"))

let v_Vuna_dCore_dfreshVar = fun name level -> C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNVar (name, level, []))

let v_Vuna_dCore_dvarIndex = fun depth level -> if v_vuna_ult_uint level depth then bi_sub (bi_sub depth level) 1 else 0

let rec v_Vuna_dCore_dapplyTermSpine = fun a0 a1 -> match (a0, a1) with
  | (head, []) -> head
  | (head, (a) :: (rest)) -> v_Vuna_dCore_dapplyTermSpine (C_Vuna_dCore_dTApp (head, a, false)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 284 1 ("no matching clause for Vuna.Core.applyTermSpine")

let rec v_Vuna_dCore_dquote = fun depth v -> (match v with
  | C_Vuna_dCore_dVType (n) -> C_Vuna_dCore_dTType (n)
  | C_Vuna_dCore_dVPi (name, implicit, dom, cod) -> C_Vuna_dCore_dTPi (name, implicit, v_Vuna_dCore_dquote depth dom, v_Vuna_dCore_dquote (bi_add depth 1) (v_Vuna_dCore_dapplyClosure cod (v_Vuna_dCore_dfreshVar name depth)))
  | C_Vuna_dCore_dVLam (name, erased, clo) -> C_Vuna_dCore_dTLam (name, erased, v_Vuna_dCore_dquote (bi_add depth 1) (v_Vuna_dCore_dapplyClosure clo (v_Vuna_dCore_dfreshVar name depth)))
  | C_Vuna_dCore_dVNeutral (n) -> v_Vuna_dCore_dquoteNeutral depth n
  | C_Vuna_dCore_dVMeta (m, sp) -> v_Vuna_dCore_dapplyTermSpine (C_Vuna_dCore_dTMeta (m)) (v_Vuna_dList_dmap (v_Vuna_dCore_dquote depth) sp)
  | C_Vuna_dCore_dVInt (n) -> C_Vuna_dCore_dTInt (n)
  | C_Vuna_dCore_dVStr (s) -> C_Vuna_dCore_dTStr (s)
  | C_Vuna_dCore_dVBool (b) -> C_Vuna_dCore_dTBool (b)
  | C_Vuna_dCore_dVIf (c, th, el) -> C_Vuna_dCore_dTIf (v_Vuna_dCore_dquote depth c, v_Vuna_dCore_dquote depth th, v_Vuna_dCore_dquote depth el)
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 258 3 ("case pattern match failure"))
and v_Vuna_dCore_dquoteNeutral = fun depth n -> (match n with
  | C_Vuna_dCore_dNVar (name, level, sp) -> v_Vuna_dCore_dapplyTermSpine (C_Vuna_dCore_dTVar (name, v_Vuna_dCore_dvarIndex depth level)) (v_Vuna_dList_dmap (v_Vuna_dCore_dquote depth) sp)
  | C_Vuna_dCore_dNGlobal (g, sp) -> v_Vuna_dCore_dapplyTermSpine (C_Vuna_dCore_dTGlobal (g)) (v_Vuna_dList_dmap (v_Vuna_dCore_dquote depth) sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 276 3 ("case pattern match failure"))

let rec v_Vuna_dCore_dhasFreeVar = fun depth t -> (match t with
  | C_Vuna_dCore_dTVar (name, i) -> if v_vuna_uge_uint i depth then true else false
  | C_Vuna_dCore_dTMeta (m) -> false
  | C_Vuna_dCore_dTGlobal (g) -> false
  | C_Vuna_dCore_dTType (n) -> false
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> (if (v_Vuna_dCore_dhasFreeVar depth dom) then true else (v_Vuna_dCore_dhasFreeVar (bi_add depth 1) cod))
  | C_Vuna_dCore_dTLam (name, erased, body) -> v_Vuna_dCore_dhasFreeVar (bi_add depth 1) body
  | C_Vuna_dCore_dTApp (f, a, erased) -> (if (v_Vuna_dCore_dhasFreeVar depth f) then true else (v_Vuna_dCore_dhasFreeVar depth a))
  | C_Vuna_dCore_dTInt (n) -> false
  | C_Vuna_dCore_dTStr (s) -> false
  | C_Vuna_dCore_dTBool (b) -> false
  | C_Vuna_dCore_dTIf (c, th, el) -> (if ((if (v_Vuna_dCore_dhasFreeVar depth c) then true else (v_Vuna_dCore_dhasFreeVar depth th))) then true else (v_Vuna_dCore_dhasFreeVar depth el))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 402 3 ("case pattern match failure"))

let rec v_Vuna_dCore_dhasMeta = fun m depth t -> (match t with
  | C_Vuna_dCore_dTMeta (j) -> v_vuna_ueq_uint m j
  | C_Vuna_dCore_dTVar (name, i) -> false
  | C_Vuna_dCore_dTGlobal (g) -> false
  | C_Vuna_dCore_dTType (n) -> false
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> (if (v_Vuna_dCore_dhasMeta m depth dom) then true else (v_Vuna_dCore_dhasMeta m (bi_add depth 1) cod))
  | C_Vuna_dCore_dTLam (name, erased, body) -> v_Vuna_dCore_dhasMeta m (bi_add depth 1) body
  | C_Vuna_dCore_dTApp (f, a, erased) -> (if (v_Vuna_dCore_dhasMeta m depth f) then true else (v_Vuna_dCore_dhasMeta m depth a))
  | C_Vuna_dCore_dTInt (n) -> false
  | C_Vuna_dCore_dTStr (s) -> false
  | C_Vuna_dCore_dTBool (b) -> false
  | C_Vuna_dCore_dTIf (c, th, el) -> (if ((if (v_Vuna_dCore_dhasMeta m depth c) then true else (v_Vuna_dCore_dhasMeta m depth th))) then true else (v_Vuna_dCore_dhasMeta m depth el))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 417 3 ("case pattern match failure"))

let rec v_Vuna_dCore_dshift = fun depth amount t -> (match t with
  | C_Vuna_dCore_dTVar (name, i) -> if v_vuna_uge_uint i depth then C_Vuna_dCore_dTVar (name, bi_add i amount) else t
  | C_Vuna_dCore_dTMeta (m) -> t
  | C_Vuna_dCore_dTGlobal (g) -> t
  | C_Vuna_dCore_dTType (n) -> t
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> C_Vuna_dCore_dTPi (name, implicit, v_Vuna_dCore_dshift depth amount dom, v_Vuna_dCore_dshift (bi_add depth 1) amount cod)
  | C_Vuna_dCore_dTLam (name, erased, body) -> C_Vuna_dCore_dTLam (name, erased, v_Vuna_dCore_dshift (bi_add depth 1) amount body)
  | C_Vuna_dCore_dTApp (f, a, erased) -> C_Vuna_dCore_dTApp (v_Vuna_dCore_dshift depth amount f, v_Vuna_dCore_dshift depth amount a, erased)
  | C_Vuna_dCore_dTInt (n) -> t
  | C_Vuna_dCore_dTStr (s) -> t
  | C_Vuna_dCore_dTBool (b) -> t
  | C_Vuna_dCore_dTIf (c, th, el) -> C_Vuna_dCore_dTIf (v_Vuna_dCore_dshift depth amount c, v_Vuna_dCore_dshift depth amount th, v_Vuna_dCore_dshift depth amount el)
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 437 3 ("case pattern match failure"))

let v_Vuna_dCore_disTypeValue = fun v -> (match v with
  | C_Vuna_dCore_dVType (n) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 456 3 ("case pattern match failure"))

let v_Vuna_dCore_dtypeLevelOf = fun v -> (match v with
  | C_Vuna_dCore_dVType (n) -> C_Vuna_dMaybe_dJust (n)
  | _ -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 462 3 ("case pattern match failure"))

let rec v_Vuna_dCore_dshowCoreChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 34 then (("\\\"") ^ (v_Vuna_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 92 then (("\\\\") ^ (v_Vuna_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 10 then (("\\n") ^ (v_Vuna_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 9 then (("\\t") ^ (v_Vuna_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 13 then (("\\r") ^ (v_Vuna_dCore_dshowCoreChars rest)) else ((bi_str_pack ((c) :: ([]))) ^ (v_Vuna_dCore_dshowCoreChars rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 498 1 ("no matching clause for Vuna.Core.showCoreChars")

let v_Vuna_dCore_dshowCoreString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (v_Vuna_dCore_dshowCoreChars (bi_str_unpack s)) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dCore_dshowTerm = fun t -> (match t with
  | C_Vuna_dCore_dTVar (name, i) -> name
  | C_Vuna_dCore_dTMeta (m) -> (("?") ^ (bi_str_from_int m))
  | C_Vuna_dCore_dTGlobal (g) -> g
  | C_Vuna_dCore_dTType (n) -> if v_vuna_ueq_uint n 0 then "Type" else (("Type ") ^ (bi_str_from_int n))
  | C_Vuna_dCore_dTPi (name, implicit, dom, cod) -> if v_vuna_ueq_ustr name "_" then (let vuna_cat0' = (v_Vuna_dCore_dshowTerm dom) in (let vuna_cat1' = (" -> ") in (let vuna_cat2' = (v_Vuna_dCore_dshowTerm cod) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else if implicit then (let vuna_cat0' = ("{") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dCore_dshowTerm dom) in (let vuna_cat4' = ("} -> ") in (let vuna_cat5' = (v_Vuna_dCore_dshowTerm cod) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))) else (let vuna_cat0' = ("(") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dCore_dshowTerm dom) in (let vuna_cat4' = (") -> ") in (let vuna_cat5' = (v_Vuna_dCore_dshowTerm cod) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | C_Vuna_dCore_dTLam (name, erased, body) -> (let vuna_cat0' = ("\\") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" => ") in (let vuna_cat3' = (v_Vuna_dCore_dshowTerm body) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Vuna_dCore_dTApp (f, a, erased) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCore_dshowTerm f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCore_dshowTerm a) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dCore_dTInt (n) -> bi_str_from_int n
  | C_Vuna_dCore_dTStr (s) -> v_Vuna_dCore_dshowCoreString s
  | C_Vuna_dCore_dTBool (b) -> if b then "True" else "False"
  | C_Vuna_dCore_dTIf (c, th, el) -> (let vuna_cat0' = ("if ") in (let vuna_cat1' = (v_Vuna_dCore_dshowTerm c) in (let vuna_cat2' = (" then ") in (let vuna_cat3' = (v_Vuna_dCore_dshowTerm th) in (let vuna_cat4' = (" else ") in (let vuna_cat5' = (v_Vuna_dCore_dshowTerm el) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 472 3 ("case pattern match failure"))

let v_Vuna_dCore_dshowValueAt = fun depth v -> v_Vuna_dCore_dshowTerm (v_Vuna_dCore_dquote depth v)

let v_Vuna_dCore_dmismatchAt = fun depth a b -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("type mismatch: expected ") in (let vuna_cat1' = (v_Vuna_dCore_dshowValueAt depth a) in (let vuna_cat2' = (", got ") in (let vuna_cat3' = (v_Vuna_dCore_dshowValueAt depth b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))

let rec v_Vuna_dCore_dconv = fun defs sols depth a b -> (let a2 = v_Vuna_dCore_dforce defs sols v_Vuna_dCore_ddefaultFuel a in let y2 = v_Vuna_dCore_dforce defs sols v_Vuna_dCore_ddefaultFuel b in (match a2 with
  | C_Vuna_dCore_dVMeta (m, sp) -> v_Vuna_dCore_dsolveMeta defs sols depth m sp y2
  | _ -> (match y2 with
  | C_Vuna_dCore_dVMeta (m, sp) -> v_Vuna_dCore_dsolveMeta defs sols depth m sp a2
  | _ -> v_Vuna_dCore_dconvBoth defs sols depth a2 y2
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 299 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 296 6 ("case pattern match failure")))
and v_Vuna_dCore_dconvBoth = fun defs sols depth a b -> (match a with
  | C_Vuna_dCore_dVType (i) -> (match b with
  | C_Vuna_dCore_dVType (j) -> if v_vuna_ueq_uint i j then C_Vuna_dResult_dOk (sols) else v_Vuna_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 307 7 ("case pattern match failure"))
  | C_Vuna_dCore_dVPi (name, implicit, dom, cod) -> (match b with
  | C_Vuna_dCore_dVPi (name2, implicit2, dom2, cod2) -> if v_vuna_ueq_ubool implicit implicit2 then v_Vuna_dResult_dandThen (v_Vuna_dCore_dconv defs sols depth dom dom2) (fun sols2 -> (let v = v_Vuna_dCore_dfreshVar name depth in v_Vuna_dCore_dconv defs sols2 (bi_add depth 1) (v_Vuna_dCore_dapplyClosure cod v) (v_Vuna_dCore_dapplyClosure cod2 v))) else v_Vuna_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 311 7 ("case pattern match failure"))
  | C_Vuna_dCore_dVLam (name, erased, clo) -> (match b with
  | C_Vuna_dCore_dVLam (name2, erased2, clo2) -> (let v = v_Vuna_dCore_dfreshVar name depth in v_Vuna_dCore_dconv defs sols (bi_add depth 1) (v_Vuna_dCore_dapplyClosure clo v) (v_Vuna_dCore_dapplyClosure clo2 v))
  | _ -> v_Vuna_dCore_detaRight defs sols depth name clo b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 320 7 ("case pattern match failure"))
  | C_Vuna_dCore_dVNeutral (n) -> (match b with
  | C_Vuna_dCore_dVNeutral (n2) -> v_Vuna_dCore_dconvNeutral defs sols depth n n2 a b
  | C_Vuna_dCore_dVLam (name2, erased2, clo2) -> v_Vuna_dCore_detaLeft defs sols depth a name2 clo2
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 326 7 ("case pattern match failure"))
  | C_Vuna_dCore_dVInt (n) -> (match b with
  | C_Vuna_dCore_dVInt (m) -> if v_vuna_ueq_uint n m then C_Vuna_dResult_dOk (sols) else v_Vuna_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 331 7 ("case pattern match failure"))
  | C_Vuna_dCore_dVStr (s) -> (match b with
  | C_Vuna_dCore_dVStr (s2) -> if v_vuna_ueq_ustr s s2 then C_Vuna_dResult_dOk (sols) else v_Vuna_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 335 7 ("case pattern match failure"))
  | C_Vuna_dCore_dVBool (x) -> (match b with
  | C_Vuna_dCore_dVBool (y) -> if v_vuna_ueq_ubool x y then C_Vuna_dResult_dOk (sols) else v_Vuna_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 339 7 ("case pattern match failure"))
  | C_Vuna_dCore_dVIf (c, th, el) -> (match b with
  | C_Vuna_dCore_dVIf (c2, th2, el2) -> v_Vuna_dResult_dandThen (v_Vuna_dCore_dconv defs sols depth c c2) (fun sols2 -> v_Vuna_dResult_dandThen (v_Vuna_dCore_dconv defs sols2 depth th th2) (fun sols3 -> v_Vuna_dCore_dconv defs sols3 depth el el2))
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 343 7 ("case pattern match failure"))
  | _ -> v_Vuna_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 305 3 ("case pattern match failure"))
and v_Vuna_dCore_detaLeft = fun defs sols depth a name clo -> (let v = v_Vuna_dCore_dfreshVar name depth in v_Vuna_dCore_dconv defs sols (bi_add depth 1) (v_Vuna_dCore_dapplyValue a v) (v_Vuna_dCore_dapplyClosure clo v))
and v_Vuna_dCore_detaRight = fun defs sols depth name clo b -> (let v = v_Vuna_dCore_dfreshVar name depth in v_Vuna_dCore_dconv defs sols (bi_add depth 1) (v_Vuna_dCore_dapplyClosure clo v) (v_Vuna_dCore_dapplyValue b v))
and v_Vuna_dCore_dconvNeutral = fun defs sols depth n1 n2 v1 v2 -> (match n1 with
  | C_Vuna_dCore_dNVar (name, level, sp) -> (match n2 with
  | C_Vuna_dCore_dNVar (name2, level2, sp2) -> if v_vuna_ueq_uint level level2 then v_Vuna_dCore_dconvSpines defs sols depth sp sp2 v1 v2 else v_Vuna_dCore_dmismatchAt depth v1 v2
  | _ -> v_Vuna_dCore_dmismatchAt depth v1 v2
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 363 7 ("case pattern match failure"))
  | C_Vuna_dCore_dNGlobal (g, sp) -> (match n2 with
  | C_Vuna_dCore_dNGlobal (g2, sp2) -> if v_vuna_ueq_ustr g g2 then v_Vuna_dCore_dconvSpines defs sols depth sp sp2 v1 v2 else v_Vuna_dCore_dmismatchAt depth v1 v2
  | _ -> v_Vuna_dCore_dmismatchAt depth v1 v2
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 368 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 361 3 ("case pattern match failure"))
and v_Vuna_dCore_dconvSpines = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (defs, sols, depth, [], [], v1, v2) -> C_Vuna_dResult_dOk (sols)
  | (defs, sols, depth, (a) :: (xs), (b) :: (ys), v1, v2) -> v_Vuna_dResult_dandThen (v_Vuna_dCore_dconv defs sols depth a b) (fun sols2 -> v_Vuna_dCore_dconvSpines defs sols2 depth xs ys v1 v2)
  | (defs, sols, depth, _, _, v1, v2) -> v_Vuna_dCore_dmismatchAt depth v1 v2
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 373 1 ("no matching clause for Vuna.Core.convSpines")
and v_Vuna_dCore_dsolveMeta = fun defs sols depth m sp rhs -> (match sp with
  | [] -> (match v_Vuna_dCore_dmetaLookup m sols with
  | C_Vuna_dMaybe_dJust (t) -> v_Vuna_dCore_dconv defs sols depth (v_Vuna_dCore_deval [] t) rhs
  | C_Vuna_dMaybe_dNothing -> (let t = v_Vuna_dCore_dquote depth rhs in if v_Vuna_dCore_dhasFreeVar 0 t then C_Vuna_dResult_dErr ((let vuna_cat0' = ("cannot solve metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (bound variables in solution; M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else if v_Vuna_dCore_dhasMeta m 0 t then C_Vuna_dResult_dErr ((let vuna_cat0' = ("cannot solve metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (occurs check)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Vuna_dResult_dOk ((C_Vuna_dPair_dPair (m, t)) :: (sols)))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 387 7 ("case pattern match failure"))
  | _ -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("cannot solve higher-order metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Core.vuna" 385 3 ("case pattern match failure"))

let v_Vuna_dCore_dshowValue = fun v -> v_Vuna_dCore_dshowValueAt 0 v

let rec v_vuna_ushow_uVuna_uCore_uTerm = fun x -> (match x with
  | C_Vuna_dCore_dTVar (v0, v1) -> (let vuna_cat0' = ("(TVar ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uint v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dCore_dTMeta (v0) -> (let vuna_cat0' = ("(TMeta ") in (let vuna_cat1' = (v_vuna_ushow_uint v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dCore_dTGlobal (v0) -> (let vuna_cat0' = ("(TGlobal ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dCore_dTType (v0) -> (let vuna_cat0' = ("(TType ") in (let vuna_cat1' = (v_vuna_ushow_uint v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dCore_dTPi (v0, v1, v2, v3) -> (let vuna_cat0' = ("(TPi ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ubool v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uVuna_uCore_uTerm v2) in (let vuna_cat6' = (" ") in (let vuna_cat7' = (v_vuna_ushow_uVuna_uCore_uTerm v3) in (let vuna_cat8' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | C_Vuna_dCore_dTLam (v0, v1, v2) -> (let vuna_cat0' = ("(TLam ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ubool v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uVuna_uCore_uTerm v2) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | C_Vuna_dCore_dTApp (v0, v1, v2) -> (let vuna_cat0' = ("(TApp ") in (let vuna_cat1' = (v_vuna_ushow_uVuna_uCore_uTerm v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uVuna_uCore_uTerm v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_ubool v2) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | C_Vuna_dCore_dTInt (v0) -> (let vuna_cat0' = ("(TInt ") in (let vuna_cat1' = (v_vuna_ushow_uint v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dCore_dTStr (v0) -> (let vuna_cat0' = ("(TStr ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dCore_dTBool (v0) -> (let vuna_cat0' = ("(TBool ") in (let vuna_cat1' = (v_vuna_ushow_ubool v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dCore_dTIf (v0, v1, v2) -> (let vuna_cat0' = ("(TIf ") in (let vuna_cat1' = (v_vuna_ushow_uVuna_uCore_uTerm v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uVuna_uCore_uTerm v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uVuna_uCore_uTerm v2) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | _ -> vuna_fail "<generated>" 33 30 ("case pattern match failure"))

let rec v_vuna_ueq_uVuna_uCore_uTerm = fun x y -> (match x with
  | C_Vuna_dCore_dTVar (v0, v1) -> (match y with
  | C_Vuna_dCore_dTVar (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uint v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 48 27 ("case pattern match failure"))
  | C_Vuna_dCore_dTMeta (v0) -> (match y with
  | C_Vuna_dCore_dTMeta (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 51 25 ("case pattern match failure"))
  | C_Vuna_dCore_dTGlobal (v0) -> (match y with
  | C_Vuna_dCore_dTGlobal (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 54 27 ("case pattern match failure"))
  | C_Vuna_dCore_dTType (v0) -> (match y with
  | C_Vuna_dCore_dTType (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 57 25 ("case pattern match failure"))
  | C_Vuna_dCore_dTPi (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCore_dTPi (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ubool v1 w1) else false)) then (v_vuna_ueq_uVuna_uCore_uTerm v2 w2) else false)) then (v_vuna_ueq_uVuna_uCore_uTerm v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 60 32 ("case pattern match failure"))
  | C_Vuna_dCore_dTLam (v0, v1, v2) -> (match y with
  | C_Vuna_dCore_dTLam (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ubool v1 w1) else false)) then (v_vuna_ueq_uVuna_uCore_uTerm v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 63 30 ("case pattern match failure"))
  | C_Vuna_dCore_dTApp (v0, v1, v2) -> (match y with
  | C_Vuna_dCore_dTApp (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uCore_uTerm v0 w0) then (v_vuna_ueq_uVuna_uCore_uTerm v1 w1) else false)) then (v_vuna_ueq_ubool v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 66 30 ("case pattern match failure"))
  | C_Vuna_dCore_dTInt (v0) -> (match y with
  | C_Vuna_dCore_dTInt (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 69 24 ("case pattern match failure"))
  | C_Vuna_dCore_dTStr (v0) -> (match y with
  | C_Vuna_dCore_dTStr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 72 24 ("case pattern match failure"))
  | C_Vuna_dCore_dTBool (v0) -> (match y with
  | C_Vuna_dCore_dTBool (w0) -> v_vuna_ueq_ubool v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 75 25 ("case pattern match failure"))
  | C_Vuna_dCore_dTIf (v0, v1, v2) -> (match y with
  | C_Vuna_dCore_dTIf (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uCore_uTerm v0 w0) then (v_vuna_ueq_uVuna_uCore_uTerm v1 w1) else false)) then (v_vuna_ueq_uVuna_uCore_uTerm v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 78 29 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 47 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCore_uTerm = fun x y -> if v_vuna_ueq_uVuna_uCore_uTerm x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
