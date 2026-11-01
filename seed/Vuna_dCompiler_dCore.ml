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
type   t_Vuna_dCompiler_dCore_dRig =
    C_Vuna_dCompiler_dCore_dRig0
  | C_Vuna_dCompiler_dCore_dRig1
  | C_Vuna_dCompiler_dCore_dRigOmega
and   t_Vuna_dCompiler_dCore_dLevel =
    C_Vuna_dCompiler_dCore_dMkLevel of (int)
and   t_Vuna_dCompiler_dCore_dTerm =
    C_Vuna_dCompiler_dCore_dTVar of (string) * (int)
  | C_Vuna_dCompiler_dCore_dTMeta of (int)
  | C_Vuna_dCompiler_dCore_dTGlobal of (string)
  | C_Vuna_dCompiler_dCore_dTType of (t_Vuna_dCompiler_dCore_dLevel)
  | C_Vuna_dCompiler_dCore_dTPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
  | C_Vuna_dCompiler_dCore_dTLam of (string) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dTerm)
  | C_Vuna_dCompiler_dCore_dTApp of (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dRig)
  | C_Vuna_dCompiler_dCore_dTCon of (string) * (((t_Vuna_dCompiler_dCore_dTerm, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list)
  | C_Vuna_dCompiler_dCore_dTCase of (t_Vuna_dCompiler_dCore_dTerm) * ((t_Vuna_dCompiler_dCore_dCaseAlt) list)
  | C_Vuna_dCompiler_dCore_dTInt of (int)
  | C_Vuna_dCompiler_dCore_dTStr of (string)
  | C_Vuna_dCompiler_dCore_dTBool of (bool)
  | C_Vuna_dCompiler_dCore_dTIf of (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dCore_dCaseAlt =
    C_Vuna_dCompiler_dCore_dCaseAlt of (string) * (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dCore_dClosure =
    C_Vuna_dCompiler_dCore_dClos of ((t_Vuna_dCompiler_dCore_dValue) list) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dCore_dNeutral =
    C_Vuna_dCompiler_dCore_dNVar of (string) * (int) * ((t_Vuna_dCompiler_dCore_dValue) list)
  | C_Vuna_dCompiler_dCore_dNGlobal of (string) * ((t_Vuna_dCompiler_dCore_dValue) list)
and   t_Vuna_dCompiler_dCore_dValue =
    C_Vuna_dCompiler_dCore_dVType of (t_Vuna_dCompiler_dCore_dLevel)
  | C_Vuna_dCompiler_dCore_dVPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dClosure)
  | C_Vuna_dCompiler_dCore_dVLam of (string) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dClosure)
  | C_Vuna_dCompiler_dCore_dVNeutral of (t_Vuna_dCompiler_dCore_dNeutral)
  | C_Vuna_dCompiler_dCore_dVMeta of (int) * ((t_Vuna_dCompiler_dCore_dValue) list)
  | C_Vuna_dCompiler_dCore_dVCon of (string) * ((t_Vuna_dCompiler_dCore_dValue) list)
  | C_Vuna_dCompiler_dCore_dVCase of (t_Vuna_dCompiler_dCore_dValue) * ((t_Vuna_dCompiler_dCore_dVCaseAlt) list)
  | C_Vuna_dCompiler_dCore_dVInt of (int)
  | C_Vuna_dCompiler_dCore_dVStr of (string)
  | C_Vuna_dCompiler_dCore_dVBool of (bool)
  | C_Vuna_dCompiler_dCore_dVIf of (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dValue)
and   t_Vuna_dCompiler_dCore_dVCaseAlt =
    C_Vuna_dCompiler_dCore_dVCaseAlt of (string) * (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCore_dClosure)
let rec show_Vuna_dCompiler_dCore_dRig v =
  match v with
  | C_Vuna_dCompiler_dCore_dRig0 -> "Rig0"
  | C_Vuna_dCompiler_dCore_dRig1 -> "Rig1"
  | C_Vuna_dCompiler_dCore_dRigOmega -> "RigOmega"
and show_Vuna_dCompiler_dCore_dLevel v =
  match v with
  | C_Vuna_dCompiler_dCore_dMkLevel f0 -> show_ctor "MkLevel" [(string_of_int) f0]
and show_Vuna_dCompiler_dCore_dTerm v =
  match v with
  | C_Vuna_dCompiler_dCore_dTVar (f0, f1) -> show_ctor "TVar" [(show_vstring) f0; (string_of_int) f1]
  | C_Vuna_dCompiler_dCore_dTMeta f0 -> show_ctor "TMeta" [(string_of_int) f0]
  | C_Vuna_dCompiler_dCore_dTGlobal f0 -> show_ctor "TGlobal" [(show_vstring) f0]
  | C_Vuna_dCompiler_dCore_dTType f0 -> show_ctor "TType" [(show_Vuna_dCompiler_dCore_dLevel) f0]
  | C_Vuna_dCompiler_dCore_dTPi (f0, f1, f2, f3, f4) -> show_ctor "TPi" [(show_vstring) f0; (show_vbool) f1; (show_Vuna_dCompiler_dCore_dRig) f2; (show_Vuna_dCompiler_dCore_dTerm) f3; (show_Vuna_dCompiler_dCore_dTerm) f4]
  | C_Vuna_dCompiler_dCore_dTLam (f0, f1, f2) -> show_ctor "TLam" [(show_vstring) f0; (show_Vuna_dCompiler_dCore_dRig) f1; (show_Vuna_dCompiler_dCore_dTerm) f2]
  | C_Vuna_dCompiler_dCore_dTApp (f0, f1, f2) -> show_ctor "TApp" [(show_Vuna_dCompiler_dCore_dTerm) f0; (show_Vuna_dCompiler_dCore_dTerm) f1; (show_Vuna_dCompiler_dCore_dRig) f2]
  | C_Vuna_dCompiler_dCore_dTCon (f0, f1) -> show_ctor "TCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_Vuna_dCompiler_dCore_dTerm show_Vuna_dCompiler_dCore_dRig)) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dCompiler_dCore_dTCase (f0, f1) -> show_ctor "TCase" [(show_Vuna_dCompiler_dCore_dTerm) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dCaseAlt) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dCompiler_dCore_dTInt f0 -> show_ctor "TInt" [(string_of_int) f0]
  | C_Vuna_dCompiler_dCore_dTStr f0 -> show_ctor "TStr" [(show_vstring) f0]
  | C_Vuna_dCompiler_dCore_dTBool f0 -> show_ctor "TBool" [(show_vbool) f0]
  | C_Vuna_dCompiler_dCore_dTIf (f0, f1, f2) -> show_ctor "TIf" [(show_Vuna_dCompiler_dCore_dTerm) f0; (show_Vuna_dCompiler_dCore_dTerm) f1; (show_Vuna_dCompiler_dCore_dTerm) f2]
and show_Vuna_dCompiler_dCore_dCaseAlt v =
  match v with
  | C_Vuna_dCompiler_dCore_dCaseAlt (f0, f1, f2) -> show_ctor "CaseAlt" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dRig)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dCompiler_dCore_dTerm) f2]
and show_Vuna_dCompiler_dCore_dClosure v =
  match v with
  | C_Vuna_dCompiler_dCore_dClos (f0, f1) -> show_ctor "Clos" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dCompiler_dCore_dTerm) f1]
and show_Vuna_dCompiler_dCore_dNeutral v =
  match v with
  | C_Vuna_dCompiler_dCore_dNVar (f0, f1, f2) -> show_ctor "NVar" [(show_vstring) f0; (string_of_int) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f2]
  | C_Vuna_dCompiler_dCore_dNGlobal (f0, f1) -> show_ctor "NGlobal" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
and show_Vuna_dCompiler_dCore_dValue v =
  match v with
  | C_Vuna_dCompiler_dCore_dVType f0 -> show_ctor "VType" [(show_Vuna_dCompiler_dCore_dLevel) f0]
  | C_Vuna_dCompiler_dCore_dVPi (f0, f1, f2, f3, f4) -> show_ctor "VPi" [(show_vstring) f0; (show_vbool) f1; (show_Vuna_dCompiler_dCore_dRig) f2; (show_Vuna_dCompiler_dCore_dValue) f3; (show_Vuna_dCompiler_dCore_dClosure) f4]
  | C_Vuna_dCompiler_dCore_dVLam (f0, f1, f2) -> show_ctor "VLam" [(show_vstring) f0; (show_Vuna_dCompiler_dCore_dRig) f1; (show_Vuna_dCompiler_dCore_dClosure) f2]
  | C_Vuna_dCompiler_dCore_dVNeutral f0 -> show_ctor "VNeutral" [(show_Vuna_dCompiler_dCore_dNeutral) f0]
  | C_Vuna_dCompiler_dCore_dVMeta (f0, f1) -> show_ctor "VMeta" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dCompiler_dCore_dVCon (f0, f1) -> show_ctor "VCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dCompiler_dCore_dVCase (f0, f1) -> show_ctor "VCase" [(show_Vuna_dCompiler_dCore_dValue) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dVCaseAlt) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dCompiler_dCore_dVInt f0 -> show_ctor "VInt" [(string_of_int) f0]
  | C_Vuna_dCompiler_dCore_dVStr f0 -> show_ctor "VStr" [(show_vstring) f0]
  | C_Vuna_dCompiler_dCore_dVBool f0 -> show_ctor "VBool" [(show_vbool) f0]
  | C_Vuna_dCompiler_dCore_dVIf (f0, f1, f2) -> show_ctor "VIf" [(show_Vuna_dCompiler_dCore_dValue) f0; (show_Vuna_dCompiler_dCore_dValue) f1; (show_Vuna_dCompiler_dCore_dValue) f2]
and show_Vuna_dCompiler_dCore_dVCaseAlt v =
  match v with
  | C_Vuna_dCompiler_dCore_dVCaseAlt (f0, f1, f2) -> show_ctor "VCaseAlt" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dRig)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dCompiler_dCore_dClosure) f2]
let v_Vuna_dCompiler_dCore_drigIsErased = fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dRig0 -> true
  | C_Vuna_dCompiler_dCore_dRig1 -> false
  | C_Vuna_dCompiler_dCore_dRigOmega -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 35 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_drigIsLinear = fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dRig1 -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 41 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_drigIsOmega = fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dRigOmega -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 46 16 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_drigOfBinder = fun implicit isTypeDom -> if implicit then C_Vuna_dCompiler_dCore_dRig0 else if isTypeDom then C_Vuna_dCompiler_dCore_dRig0 else C_Vuna_dCompiler_dCore_dRig1

let v_Vuna_dCompiler_dCore_dlevelZero = C_Vuna_dCompiler_dCore_dMkLevel (0)

let v_Vuna_dCompiler_dCore_dlevelSucc = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dMkLevel (n)) -> C_Vuna_dCompiler_dCore_dMkLevel (bi_add n 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 65 1 ("no matching clause for Vuna.Compiler.Core.levelSucc")

let v_Vuna_dCompiler_dCore_dlevelMax = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dCore_dMkLevel (a), C_Vuna_dCompiler_dCore_dMkLevel (b)) -> C_Vuna_dCompiler_dCore_dMkLevel (if v_vuna_uge_uint a b then a else b)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 68 1 ("no matching clause for Vuna.Compiler.Core.levelMax")

let v_Vuna_dCompiler_dCore_dlevelToInt = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dMkLevel (n)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 71 1 ("no matching clause for Vuna.Compiler.Core.levelToInt")

let v_Vuna_dCompiler_dCore_dlevelOfInt = fun n -> C_Vuna_dCompiler_dCore_dMkLevel (n)

let v_Vuna_dCompiler_dCore_dlevelEq = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dCore_dMkLevel (a), C_Vuna_dCompiler_dCore_dMkLevel (b)) -> v_vuna_ueq_uint a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 78 1 ("no matching clause for Vuna.Compiler.Core.levelEq")

let v_Vuna_dCompiler_dCore_dlevelLt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dCore_dMkLevel (a), C_Vuna_dCompiler_dCore_dMkLevel (b)) -> v_vuna_ult_uint a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 81 1 ("no matching clause for Vuna.Compiler.Core.levelLt")

let v_Vuna_dCompiler_dCore_dcaseAltName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dCaseAlt (name, binders, body)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 105 1 ("no matching clause for Vuna.Compiler.Core.caseAltName")

let v_Vuna_dCompiler_dCore_dcaseAltBinders = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dCaseAlt (name, binders, body)) -> binders
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 107 1 ("no matching clause for Vuna.Compiler.Core.caseAltBinders")

let v_Vuna_dCompiler_dCore_dcaseAltBody = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dCaseAlt (name, binders, body)) -> body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 109 1 ("no matching clause for Vuna.Compiler.Core.caseAltBody")

let v_Vuna_dCompiler_dCore_dvCaseAltName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dVCaseAlt (name, binders, clo)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 137 1 ("no matching clause for Vuna.Compiler.Core.vCaseAltName")

let v_Vuna_dCompiler_dCore_dvCaseAltBinders = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dVCaseAlt (name, binders, clo)) -> binders
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 139 1 ("no matching clause for Vuna.Compiler.Core.vCaseAltBinders")

let v_Vuna_dCompiler_dCore_dvCaseAltClosure = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCore_dVCaseAlt (name, binders, clo)) -> clo
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 141 1 ("no matching clause for Vuna.Compiler.Core.vCaseAltClosure")

let v_Vuna_dCompiler_dCore_ddefaultFuel = 512

let rec v_Vuna_dCompiler_dCore_dlookupEnv = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Base_dMaybe_dNothing
  | (i, (v) :: (rest)) -> if v_vuna_ule_uint i 0 then C_Base_dMaybe_dJust (v) else v_Vuna_dCompiler_dCore_dlookupEnv (bi_sub i 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 150 1 ("no matching clause for Vuna.Compiler.Core.lookupEnv")

let v_Vuna_dCompiler_dCore_devalAlt = fun a0 a1 -> match (a0, a1) with
  | (env, C_Vuna_dCompiler_dCore_dCaseAlt (name, binders, body)) -> C_Vuna_dCompiler_dCore_dVCaseAlt (name, binders, C_Vuna_dCompiler_dCore_dClos (env, body))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 172 1 ("no matching clause for Vuna.Compiler.Core.evalAlt")

let rec v_Vuna_dCompiler_dCore_devalAlts = fun a0 a1 -> match (a0, a1) with
  | (env, []) -> []
  | (env, (alt) :: (rest)) -> (v_Vuna_dCompiler_dCore_devalAlt env alt) :: (v_Vuna_dCompiler_dCore_devalAlts env rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 175 1 ("no matching clause for Vuna.Compiler.Core.evalAlts")

let v_Vuna_dCompiler_dCore_devalIf = fun c th el -> (match c with
  | C_Vuna_dCompiler_dCore_dVBool (b) -> if b then th else el
  | _ -> C_Vuna_dCompiler_dCore_dVIf (c, th, el)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 199 18 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_dspineAppend = fun n a -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, level, sp) -> C_Vuna_dCompiler_dCore_dNVar (name, level, v_Base_dList_dappend sp ((a) :: ([])))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> C_Vuna_dCompiler_dCore_dNGlobal (g, v_Base_dList_dappend sp ((a) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 204 19 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCore_deval = fun env t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> (match v_Vuna_dCompiler_dCore_dlookupEnv i env with
  | C_Base_dMaybe_dJust (v) -> v
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, i, []))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 155 18 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> C_Vuna_dCompiler_dCore_dVMeta (m, [])
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, []))
  | C_Vuna_dCompiler_dCore_dTType (l) -> C_Vuna_dCompiler_dCore_dVType (l)
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, v_Vuna_dCompiler_dCore_deval env dom, C_Vuna_dCompiler_dCore_dClos (env, cod))
  | C_Vuna_dCompiler_dCore_dTLam (name, rig, body) -> C_Vuna_dCompiler_dCore_dVLam (name, rig, C_Vuna_dCompiler_dCore_dClos (env, body))
  | C_Vuna_dCompiler_dCore_dTApp (f, a, rig) -> v_Vuna_dCompiler_dCore_dapplyValue (v_Vuna_dCompiler_dCore_deval env f) (v_Vuna_dCompiler_dCore_deval env a)
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> C_Vuna_dCompiler_dCore_dVCon (c, v_Vuna_dCompiler_dCore_devalArgTerms env args)
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> v_Vuna_dCompiler_dCore_devalCase (v_Vuna_dCompiler_dCore_deval env scrut) (v_Vuna_dCompiler_dCore_devalAlts env alts)
  | C_Vuna_dCompiler_dCore_dTInt (n) -> C_Vuna_dCompiler_dCore_dVInt (n)
  | C_Vuna_dCompiler_dCore_dTStr (s) -> C_Vuna_dCompiler_dCore_dVStr (s)
  | C_Vuna_dCompiler_dCore_dTBool (b) -> C_Vuna_dCompiler_dCore_dVBool (b)
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> v_Vuna_dCompiler_dCore_devalIf (v_Vuna_dCompiler_dCore_deval env c) (v_Vuna_dCompiler_dCore_deval env th) (v_Vuna_dCompiler_dCore_deval env el)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 154 14 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_devalArgTerms = fun a0 a1 -> match (a0, a1) with
  | (env, []) -> []
  | (env, (C_Base_dPair_dPair (a, rig)) :: (rest)) -> (v_Vuna_dCompiler_dCore_deval env a) :: (v_Vuna_dCompiler_dCore_devalArgTerms env rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 179 1 ("no matching clause for Vuna.Compiler.Core.evalArgTerms")
and v_Vuna_dCompiler_dCore_devalCase = fun scrut alts -> (match scrut with
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> v_Vuna_dCompiler_dCore_dapplyCaseAlt c args alts
  | _ -> C_Vuna_dCompiler_dCore_dVCase (scrut, alts)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 185 23 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dapplyCaseAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (c, args, []) -> C_Vuna_dCompiler_dCore_dVCase (C_Vuna_dCompiler_dCore_dVCon (c, args), [])
  | (c, args, (alt) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dCore_dvCaseAltName alt) c then (match v_Vuna_dCompiler_dCore_dvCaseAltClosure alt with
  | C_Vuna_dCompiler_dCore_dClos (env, body) -> v_Vuna_dCompiler_dCore_deval (v_Base_dList_dappend (v_Base_dList_dreverse args) env) body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 191 67 ("case pattern match failure")) else if v_vuna_ueq_ustr (v_Vuna_dCompiler_dCore_dvCaseAltName alt) "" then (match v_Vuna_dCompiler_dCore_dvCaseAltClosure alt with
  | C_Vuna_dCompiler_dCore_dClos (env, body) -> v_Vuna_dCompiler_dCore_deval env body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 193 37 ("case pattern match failure")) else v_Vuna_dCompiler_dCore_dapplyCaseAlt c args rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 190 1 ("no matching clause for Vuna.Compiler.Core.applyCaseAlt")
and v_Vuna_dCompiler_dCore_dapplyValue = fun f a -> (match f with
  | C_Vuna_dCompiler_dCore_dVLam (name, rig, C_Vuna_dCompiler_dCore_dClos (env, body)) -> v_Vuna_dCompiler_dCore_deval ((a) :: (env)) body
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> C_Vuna_dCompiler_dCore_dVNeutral (v_Vuna_dCompiler_dCore_dspineAppend n a)
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> C_Vuna_dCompiler_dCore_dVMeta (m, v_Base_dList_dappend sp ((a) :: ([])))
  | _ -> f
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 209 18 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_dapplyClosure = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dCore_dClos (env, body), v) -> v_Vuna_dCompiler_dCore_deval ((v) :: (env)) body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 216 1 ("no matching clause for Vuna.Compiler.Core.applyClosure")

let rec v_Vuna_dCompiler_dCore_dapplySpine = fun a0 a1 -> match (a0, a1) with
  | (v, []) -> v
  | (v, (a) :: (rest)) -> v_Vuna_dCompiler_dCore_dapplySpine (v_Vuna_dCompiler_dCore_dapplyValue v a) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 219 1 ("no matching clause for Vuna.Compiler.Core.applySpine")

let rec v_Vuna_dCompiler_dCore_dmetaLookup = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Base_dMaybe_dNothing
  | (i, (C_Base_dPair_dPair (j, t)) :: (rest)) -> if v_vuna_ueq_uint i j then C_Base_dMaybe_dJust (t) else v_Vuna_dCompiler_dCore_dmetaLookup i rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 226 1 ("no matching clause for Vuna.Compiler.Core.metaLookup")

let rec v_Vuna_dCompiler_dCore_ddefLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, t)) :: (rest)) -> if v_vuna_ueq_ustr name n then C_Base_dMaybe_dJust (t) else v_Vuna_dCompiler_dCore_ddefLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 230 1 ("no matching clause for Vuna.Compiler.Core.defLookup")

let v_Vuna_dCompiler_dCore_disPrimitiveName = fun g -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if (v_vuna_ueq_ustr g "+") then true else (v_vuna_ueq_ustr g "-"))) then true else (v_vuna_ueq_ustr g "*"))) then true else (v_vuna_ueq_ustr g "/"))) then true else (v_vuna_ueq_ustr g "=="))) then true else (v_vuna_ueq_ustr g "/="))) then true else (v_vuna_ueq_ustr g "<"))) then true else (v_vuna_ueq_ustr g "<="))) then true else (v_vuna_ueq_ustr g ">"))) then true else (v_vuna_ueq_ustr g ">="))) then true else (v_vuna_ueq_ustr g "++"))) then true else (v_vuna_ueq_ustr g "&&"))) then true else (v_vuna_ueq_ustr g "||"))) then true else (v_vuna_ueq_ustr g "bi_eq_int"))) then true else (v_vuna_ueq_ustr g "bi_neq_int"))) then true else (v_vuna_ueq_ustr g "bi_eq_str"))) then true else (v_vuna_ueq_ustr g "bi_neq_str"))) then true else (v_vuna_ueq_ustr g "strFromInt"))) then true else (v_vuna_ueq_ustr g "strLength"))

let v_Vuna_dCompiler_dCore_dasInt = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVInt (n) -> C_Base_dMaybe_dJust (n)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 286 11 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_dasStr = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVStr (s) -> C_Base_dMaybe_dJust (s)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 291 11 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_dasBool = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVBool (b) -> C_Base_dMaybe_dJust (b)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 296 12 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_dintPrim2 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ((b) :: ([])), f) -> (match v_Vuna_dCompiler_dCore_dasInt a with
  | C_Base_dMaybe_dJust (x) -> (match v_Vuna_dCompiler_dCore_dasInt b with
  | C_Base_dMaybe_dJust (y) -> C_Base_dMaybe_dJust (f x y)
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 302 13 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 301 23 ("case pattern match failure"))
  | (sp, f) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 301 1 ("no matching clause for Vuna.Compiler.Core.intPrim2")

let v_Vuna_dCompiler_dCore_dboolPrim2 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ((b) :: ([])), f) -> (match v_Vuna_dCompiler_dCore_dasBool a with
  | C_Base_dMaybe_dJust (x) -> (match v_Vuna_dCompiler_dCore_dasBool b with
  | C_Base_dMaybe_dJust (y) -> C_Base_dMaybe_dJust (f x y)
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 310 13 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 309 24 ("case pattern match failure"))
  | (sp, f) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 309 1 ("no matching clause for Vuna.Compiler.Core.boolPrim2")

let v_Vuna_dCompiler_dCore_dprimConst = fun a0 a1 -> match (a0, a1) with
  | ([], v) -> C_Base_dMaybe_dJust (v)
  | (sp, v) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 318 1 ("no matching clause for Vuna.Compiler.Core.primConst")

let v_Vuna_dCompiler_dCore_dstrPrim2 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ((b) :: ([])), f) -> (match v_Vuna_dCompiler_dCore_dasStr a with
  | C_Base_dMaybe_dJust (x) -> (match v_Vuna_dCompiler_dCore_dasStr b with
  | C_Base_dMaybe_dJust (y) -> C_Base_dMaybe_dJust (f x y)
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 323 13 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 322 23 ("case pattern match failure"))
  | (sp, f) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 322 1 ("no matching clause for Vuna.Compiler.Core.strPrim2")

let v_Vuna_dCompiler_dCore_dintPrim1 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ([]), f) -> (match v_Vuna_dCompiler_dCore_dasInt a with
  | C_Base_dMaybe_dJust (x) -> C_Base_dMaybe_dJust (f x)
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 330 20 ("case pattern match failure"))
  | (sp, f) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 330 1 ("no matching clause for Vuna.Compiler.Core.intPrim1")

let v_Vuna_dCompiler_dCore_dstrPrim1 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ([]), f) -> (match v_Vuna_dCompiler_dCore_dasStr a with
  | C_Base_dMaybe_dJust (x) -> C_Base_dMaybe_dJust (f x)
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 336 20 ("case pattern match failure"))
  | (sp, f) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 336 1 ("no matching clause for Vuna.Compiler.Core.strPrim1")

let v_Vuna_dCompiler_dCore_dstrEq = fun a b -> v_vuna_ueq_ustr a b

let v_Vuna_dCompiler_dCore_dstrPrim3 = fun a0 a1 -> match (a0, a1) with
  | ((a) :: ((b) :: ((c) :: ([]))), f) -> (match v_Vuna_dCompiler_dCore_dasStr a with
  | C_Base_dMaybe_dJust (x) -> (match v_Vuna_dCompiler_dCore_dasStr b with
  | C_Base_dMaybe_dJust (y) -> (match v_Vuna_dCompiler_dCore_dasStr c with
  | C_Base_dMaybe_dJust (z) -> C_Base_dMaybe_dJust (f x y z)
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 348 15 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 347 13 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 346 26 ("case pattern match failure"))
  | (sp, f) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 346 1 ("no matching clause for Vuna.Compiler.Core.strPrim3")

let v_Vuna_dCompiler_dCore_dnotBool = fun b -> if b then false else true

let v_Vuna_dCompiler_dCore_dprimReduce = fun g sp -> (match g with
  | "+" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVInt (bi_add a b))
  | "-" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVInt (bi_sub a b))
  | "*" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVInt (bi_mul a b))
  | "/" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> if v_vuna_ueq_uint b 0 then C_Vuna_dCompiler_dCore_dVInt (0) else C_Vuna_dCompiler_dCore_dVInt (bi_div a b))
  | "==" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_vuna_ueq_uint a b))
  | "/=" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_Vuna_dCompiler_dCore_dnotBool (v_vuna_ueq_uint a b)))
  | "<" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_vuna_ult_uint a b))
  | "<=" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_vuna_ule_uint a b))
  | ">" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_vuna_ugt_uint a b))
  | ">=" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_vuna_uge_uint a b))
  | "++" -> v_Vuna_dCompiler_dCore_dstrPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVStr (((a) ^ (b))))
  | "True" -> v_Vuna_dCompiler_dCore_dprimConst sp (C_Vuna_dCompiler_dCore_dVBool (true))
  | "False" -> v_Vuna_dCompiler_dCore_dprimConst sp (C_Vuna_dCompiler_dCore_dVBool (false))
  | "&&" -> v_Vuna_dCompiler_dCore_dboolPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool ((if (a) then (b) else false)))
  | "||" -> v_Vuna_dCompiler_dCore_dboolPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool ((if (a) then true else (b))))
  | "bi_eq_int" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_vuna_ueq_uint a b))
  | "bi_neq_int" -> v_Vuna_dCompiler_dCore_dintPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_Vuna_dCompiler_dCore_dnotBool (v_vuna_ueq_uint a b)))
  | "bi_eq_str" -> v_Vuna_dCompiler_dCore_dstrPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_Vuna_dCompiler_dCore_dstrEq a b))
  | "bi_neq_str" -> v_Vuna_dCompiler_dCore_dstrPrim2 sp (fun a b -> C_Vuna_dCompiler_dCore_dVBool (v_Vuna_dCompiler_dCore_dnotBool (v_Vuna_dCompiler_dCore_dstrEq a b)))
  | "strFromInt" -> v_Vuna_dCompiler_dCore_dintPrim1 sp (fun n -> C_Vuna_dCompiler_dCore_dVStr (bi_str_from_int n))
  | "strLength" -> v_Vuna_dCompiler_dCore_dstrPrim1 sp (fun s -> C_Vuna_dCompiler_dCore_dVInt (bi_str_length s))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 356 19 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCore_dforce = fun defs sols fuel v -> if v_vuna_ule_uint fuel 0 then v else (match v with
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> (match v_Vuna_dCompiler_dCore_dmetaLookup m sols with
  | C_Base_dMaybe_dJust (t) -> v_Vuna_dCompiler_dCore_dforce defs sols (bi_sub fuel 1) (v_Vuna_dCompiler_dCore_dapplySpine t sp)
  | C_Base_dMaybe_dNothing -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 239 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> (let s2 = v_Vuna_dCompiler_dCore_dforce defs sols (bi_sub fuel 1) scrut in (match s2 with
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> (match alts with
  | [] -> C_Vuna_dCompiler_dCore_dVCase (s2, [])
  | _ -> v_Vuna_dCompiler_dCore_dforce defs sols (bi_sub fuel 1) (v_Vuna_dCompiler_dCore_dapplyCaseAlt c args alts)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 246 22 ("case pattern match failure"))
  | _ -> C_Vuna_dCompiler_dCore_dVCase (s2, alts)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 245 8 ("case pattern match failure")))
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> (match v_Vuna_dCompiler_dCore_ddefLookup g defs with
  | C_Base_dMaybe_dJust (body) -> v_Vuna_dCompiler_dCore_dforce defs sols (bi_sub fuel 1) (v_Vuna_dCompiler_dCore_dapplySpine (v_Vuna_dCompiler_dCore_deval [] body) sp)
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dCore_dprimReduce g sp with
  | C_Base_dMaybe_dJust (v2) -> v_Vuna_dCompiler_dCore_dforce defs sols (bi_sub fuel 1) v2
  | C_Base_dMaybe_dNothing -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 253 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 251 21 ("case pattern match failure"))
  | _ -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 250 17 ("case pattern match failure"))
  | _ -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 238 6 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCore_dnormalize = fun defs sols fuel v -> if v_vuna_ule_uint fuel 0 then v else (match v_Vuna_dCompiler_dCore_dforce defs sols fuel v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> v_Vuna_dCompiler_dCore_dnormalizeNeutral defs sols fuel n
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> v_Vuna_dCompiler_dCore_dnormalizeIf defs sols fuel c th el
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> v_Vuna_dCompiler_dCore_dnormalizeCase defs sols fuel scrut alts
  | other -> other
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 390 6 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dnormalizeCase = fun defs sols fuel scrut alts -> (match v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) scrut with
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) (v_Vuna_dCompiler_dCore_dapplyCaseAlt c args alts)
  | s2 -> C_Vuna_dCompiler_dCore_dVCase (s2, alts)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 399 43 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dnormalizeNeutral = fun defs sols fuel n -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, level, sp) -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, level, v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dnormalize defs sols fuel) sp))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> (let sp2 = v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dnormalize defs sols fuel) sp in (match v_Vuna_dCompiler_dCore_ddefLookup g defs with
  | C_Base_dMaybe_dJust (body) -> v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) (v_Vuna_dCompiler_dCore_dapplySpine (v_Vuna_dCompiler_dCore_deval [] body) sp2)
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dCore_dprimReduce g sp2 with
  | C_Base_dMaybe_dJust (v2) -> v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) v2
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, sp2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 411 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 409 8 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 404 37 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dnormalizeIf = fun defs sols fuel c th el -> (match v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) c with
  | C_Vuna_dCompiler_dCore_dVBool (b) -> v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) (if b then th else el)
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> C_Vuna_dCompiler_dCore_dVIf (C_Vuna_dCompiler_dCore_dVNeutral (n), v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) th, v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) el)
  | other -> C_Vuna_dCompiler_dCore_dVIf (other, v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) th, v_Vuna_dCompiler_dCore_dnormalize defs sols (bi_sub fuel 1) el)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 416 38 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCore_dapplyClosureBinder = fun a0 a1 -> match (a0, a1) with
  | (clo, []) -> C_Vuna_dCompiler_dCore_dVCon ("_alt", [])
  | (clo, (a) :: (rest)) -> (match clo with
  | C_Vuna_dCompiler_dCore_dClos (env, body) -> v_Vuna_dCompiler_dCore_dapplyClosureBinder (C_Vuna_dCompiler_dCore_dClos ((a) :: (env), body)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 462 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 461 1 ("no matching clause for Vuna.Compiler.Core.applyClosureBinder")

let v_Vuna_dCompiler_dCore_dfreshVar = fun name level -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, level, []))

let rec v_Vuna_dCompiler_dCore_dargValsAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], depth, i) -> []
  | ((C_Base_dPair_dPair (name, rig)) :: (rest), depth, i) -> (v_Vuna_dCompiler_dCore_dfreshVar name (bi_add depth i)) :: (v_Vuna_dCompiler_dCore_dargValsAt rest depth (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 455 1 ("no matching clause for Vuna.Compiler.Core.argValsAt")

let v_Vuna_dCompiler_dCore_dvarIndex = fun depth level -> if v_vuna_ult_uint level depth then bi_sub (bi_sub depth level) 1 else 0

let rec v_Vuna_dCompiler_dCore_dapplyTermSpine = fun a0 a1 -> match (a0, a1) with
  | (head, []) -> head
  | (head, (a) :: (rest)) -> v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTApp (head, a, C_Vuna_dCompiler_dCore_dRig1)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 476 1 ("no matching clause for Vuna.Compiler.Core.applyTermSpine")

let rec v_Vuna_dCompiler_dCore_dquote = fun depth v -> (match v with
  | C_Vuna_dCompiler_dCore_dVType (l) -> C_Vuna_dCompiler_dCore_dTType (l)
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, cod) -> C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, v_Vuna_dCompiler_dCore_dquote depth dom, v_Vuna_dCompiler_dCore_dquote (bi_add depth 1) (v_Vuna_dCompiler_dCore_dapplyClosure cod (v_Vuna_dCompiler_dCore_dfreshVar name depth)))
  | C_Vuna_dCompiler_dCore_dVLam (name, rig, clo) -> C_Vuna_dCompiler_dCore_dTLam (name, rig, v_Vuna_dCompiler_dCore_dquote (bi_add depth 1) (v_Vuna_dCompiler_dCore_dapplyClosure clo (v_Vuna_dCompiler_dCore_dfreshVar name depth)))
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> v_Vuna_dCompiler_dCore_dquoteNeutral depth n
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTMeta (m)) (v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquote depth) sp)
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> C_Vuna_dCompiler_dCore_dTCon (c, v_Vuna_dCompiler_dCore_dquoteArgValues depth args)
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> C_Vuna_dCompiler_dCore_dTCase (v_Vuna_dCompiler_dCore_dquote depth scrut, v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquoteCaseAlt depth) alts)
  | C_Vuna_dCompiler_dCore_dVInt (n) -> C_Vuna_dCompiler_dCore_dTInt (n)
  | C_Vuna_dCompiler_dCore_dVStr (s) -> C_Vuna_dCompiler_dCore_dTStr (s)
  | C_Vuna_dCompiler_dCore_dVBool (b) -> C_Vuna_dCompiler_dCore_dTBool (b)
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> C_Vuna_dCompiler_dCore_dTIf (v_Vuna_dCompiler_dCore_dquote depth c, v_Vuna_dCompiler_dCore_dquote depth th, v_Vuna_dCompiler_dCore_dquote depth el)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 426 17 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dquoteCaseAlt = fun a0 a1 -> match (a0, a1) with
  | (depth, C_Vuna_dCompiler_dCore_dVCaseAlt (name, binders, clo)) -> (let n = v_Base_dList_dlength binders in let argVals = v_Vuna_dCompiler_dCore_dargValsAt binders depth 0 in let body = v_Vuna_dCompiler_dCore_dquote (bi_add depth n) (v_Vuna_dCompiler_dCore_dapplyClosureBinder clo argVals) in C_Vuna_dCompiler_dCore_dCaseAlt (name, binders, body))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 443 1 ("no matching clause for Vuna.Compiler.Core.quoteCaseAlt")
and v_Vuna_dCompiler_dCore_dquoteArgValues = fun a0 a1 -> match (a0, a1) with
  | (depth, []) -> []
  | (depth, (a) :: (rest)) -> (C_Base_dPair_dPair (v_Vuna_dCompiler_dCore_dquote depth a, C_Vuna_dCompiler_dCore_dRig1)) :: (v_Vuna_dCompiler_dCore_dquoteArgValues depth rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 451 1 ("no matching clause for Vuna.Compiler.Core.quoteArgValues")
and v_Vuna_dCompiler_dCore_dquoteNeutral = fun depth n -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, level, sp) -> v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTVar (name, v_Vuna_dCompiler_dCore_dvarIndex depth level)) (v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquote depth) sp)
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTGlobal (g)) (v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquote depth) sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 469 24 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCore_dsplitAtVals = fun a0 a1 -> match (a0, a1) with
  | (0, xs) -> C_Base_dPair_dPair ([], xs)
  | (n, []) -> C_Base_dPair_dPair ([], [])
  | (n, (x) :: (xs)) -> (match v_Vuna_dCompiler_dCore_dsplitAtVals (bi_sub n 1) xs with
  | C_Base_dPair_dPair (a, b) -> C_Base_dPair_dPair ((x) :: (a), b)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 603 27 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 601 1 ("no matching clause for Vuna.Compiler.Core.splitAtVals")

let rec v_Vuna_dCompiler_dCore_dhasFreeVar = fun depth t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> if v_vuna_uge_uint i depth then true else false
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> false
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> false
  | C_Vuna_dCompiler_dCore_dTType (l) -> false
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> (if (v_Vuna_dCompiler_dCore_dhasFreeVar depth dom) then true else (v_Vuna_dCompiler_dCore_dhasFreeVar (bi_add depth 1) cod))
  | C_Vuna_dCompiler_dCore_dTLam (name, rig, body) -> v_Vuna_dCompiler_dCore_dhasFreeVar (bi_add depth 1) body
  | C_Vuna_dCompiler_dCore_dTApp (f, a, rig) -> (if (v_Vuna_dCompiler_dCore_dhasFreeVar depth f) then true else (v_Vuna_dCompiler_dCore_dhasFreeVar depth a))
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> v_Vuna_dCompiler_dCore_dhasFreeVarArgs depth args
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> (if (v_Vuna_dCompiler_dCore_dhasFreeVar depth scrut) then true else (v_Vuna_dCompiler_dCore_dhasFreeVarAlts depth alts))
  | C_Vuna_dCompiler_dCore_dTInt (n) -> false
  | C_Vuna_dCompiler_dCore_dTStr (s) -> false
  | C_Vuna_dCompiler_dCore_dTBool (b) -> false
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> (if ((if (v_Vuna_dCompiler_dCore_dhasFreeVar depth c) then true else (v_Vuna_dCompiler_dCore_dhasFreeVar depth th))) then true else (v_Vuna_dCompiler_dCore_dhasFreeVar depth el))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 648 22 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dhasFreeVarArgs = fun a0 a1 -> match (a0, a1) with
  | (depth, []) -> false
  | (depth, (C_Base_dPair_dPair (a, rig)) :: (rest)) -> (if (v_Vuna_dCompiler_dCore_dhasFreeVar depth a) then true else (v_Vuna_dCompiler_dCore_dhasFreeVarArgs depth rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 664 1 ("no matching clause for Vuna.Compiler.Core.hasFreeVarArgs")
and v_Vuna_dCompiler_dCore_dhasFreeVarAlts = fun a0 a1 -> match (a0, a1) with
  | (depth, []) -> false
  | (depth, (alt) :: (rest)) -> (if (v_Vuna_dCompiler_dCore_dhasFreeVar (bi_add depth (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders alt))) (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) then true else (v_Vuna_dCompiler_dCore_dhasFreeVarAlts depth rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 668 1 ("no matching clause for Vuna.Compiler.Core.hasFreeVarAlts")

let rec v_Vuna_dCompiler_dCore_dhasMeta = fun m depth t -> (match t with
  | C_Vuna_dCompiler_dCore_dTMeta (j) -> v_vuna_ueq_uint m j
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> false
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> false
  | C_Vuna_dCompiler_dCore_dTType (l) -> false
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> (if (v_Vuna_dCompiler_dCore_dhasMeta m depth dom) then true else (v_Vuna_dCompiler_dCore_dhasMeta m (bi_add depth 1) cod))
  | C_Vuna_dCompiler_dCore_dTLam (name, rig, body) -> v_Vuna_dCompiler_dCore_dhasMeta m (bi_add depth 1) body
  | C_Vuna_dCompiler_dCore_dTApp (f, a, rig) -> (if (v_Vuna_dCompiler_dCore_dhasMeta m depth f) then true else (v_Vuna_dCompiler_dCore_dhasMeta m depth a))
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> v_Vuna_dCompiler_dCore_dhasMetaArgs m depth args
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> (if (v_Vuna_dCompiler_dCore_dhasMeta m depth scrut) then true else (v_Vuna_dCompiler_dCore_dhasMetaAlts m depth alts))
  | C_Vuna_dCompiler_dCore_dTInt (n) -> false
  | C_Vuna_dCompiler_dCore_dTStr (s) -> false
  | C_Vuna_dCompiler_dCore_dTBool (b) -> false
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> (if ((if (v_Vuna_dCompiler_dCore_dhasMeta m depth c) then true else (v_Vuna_dCompiler_dCore_dhasMeta m depth th))) then true else (v_Vuna_dCompiler_dCore_dhasMeta m depth el))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 673 21 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dhasMetaArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (m, depth, []) -> false
  | (m, depth, (C_Base_dPair_dPair (a, rig)) :: (rest)) -> (if (v_Vuna_dCompiler_dCore_dhasMeta m depth a) then true else (v_Vuna_dCompiler_dCore_dhasMetaArgs m depth rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 689 1 ("no matching clause for Vuna.Compiler.Core.hasMetaArgs")
and v_Vuna_dCompiler_dCore_dhasMetaAlts = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (m, depth, []) -> false
  | (m, depth, (alt) :: (rest)) -> (if (v_Vuna_dCompiler_dCore_dhasMeta m (bi_add depth (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders alt))) (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) then true else (v_Vuna_dCompiler_dCore_dhasMetaAlts m depth rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 693 1 ("no matching clause for Vuna.Compiler.Core.hasMetaAlts")

let rec v_Vuna_dCompiler_dCore_dshift = fun depth amount t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> if v_vuna_uge_uint i depth then C_Vuna_dCompiler_dCore_dTVar (name, bi_add i amount) else t
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> t
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> t
  | C_Vuna_dCompiler_dCore_dTType (l) -> t
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, v_Vuna_dCompiler_dCore_dshift depth amount dom, v_Vuna_dCompiler_dCore_dshift (bi_add depth 1) amount cod)
  | C_Vuna_dCompiler_dCore_dTLam (name, rig, body) -> C_Vuna_dCompiler_dCore_dTLam (name, rig, v_Vuna_dCompiler_dCore_dshift (bi_add depth 1) amount body)
  | C_Vuna_dCompiler_dCore_dTApp (f, a, rig) -> C_Vuna_dCompiler_dCore_dTApp (v_Vuna_dCompiler_dCore_dshift depth amount f, v_Vuna_dCompiler_dCore_dshift depth amount a, rig)
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> C_Vuna_dCompiler_dCore_dTCon (c, v_Vuna_dCompiler_dCore_dshiftArgs depth amount args)
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> C_Vuna_dCompiler_dCore_dTCase (v_Vuna_dCompiler_dCore_dshift depth amount scrut, v_Vuna_dCompiler_dCore_dshiftAlts depth amount alts)
  | C_Vuna_dCompiler_dCore_dTInt (n) -> t
  | C_Vuna_dCompiler_dCore_dTStr (s) -> t
  | C_Vuna_dCompiler_dCore_dTBool (b) -> t
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> C_Vuna_dCompiler_dCore_dTIf (v_Vuna_dCompiler_dCore_dshift depth amount c, v_Vuna_dCompiler_dCore_dshift depth amount th, v_Vuna_dCompiler_dCore_dshift depth amount el)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 702 24 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dshiftArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (depth, amount, []) -> []
  | (depth, amount, (C_Base_dPair_dPair (a, rig)) :: (rest)) -> (C_Base_dPair_dPair (v_Vuna_dCompiler_dCore_dshift depth amount a, rig)) :: (v_Vuna_dCompiler_dCore_dshiftArgs depth amount rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 719 1 ("no matching clause for Vuna.Compiler.Core.shiftArgs")
and v_Vuna_dCompiler_dCore_dshiftAlts = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (depth, amount, []) -> []
  | (depth, amount, (alt) :: (rest)) -> (v_Vuna_dCompiler_dCore_dshiftAlt depth amount alt) :: (v_Vuna_dCompiler_dCore_dshiftAlts depth amount rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 724 1 ("no matching clause for Vuna.Compiler.Core.shiftAlts")
and v_Vuna_dCompiler_dCore_dshiftAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (depth, amount, C_Vuna_dCompiler_dCore_dCaseAlt (name, binders, body)) -> C_Vuna_dCompiler_dCore_dCaseAlt (name, binders, v_Vuna_dCompiler_dCore_dshift (bi_add depth (v_Base_dList_dlength binders)) amount body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 728 1 ("no matching clause for Vuna.Compiler.Core.shiftAlt")

let v_Vuna_dCompiler_dCore_disTypeValue = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVType (l) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 735 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dCore_dtypeLevelOf = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVType (l) -> C_Base_dMaybe_dJust (l)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 740 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCore_dshowBinders = fun a0 -> match a0 with
  | ([]) -> ""
  | ((C_Base_dPair_dPair (n, rig)) :: (rest)) -> (let vuna_cat0' = (" ") in (let vuna_cat1' = (n) in (let vuna_cat2' = (v_Vuna_dCompiler_dCore_dshowBinders rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 781 1 ("no matching clause for Vuna.Compiler.Core.showBinders")

let rec v_Vuna_dCompiler_dCore_dshowCoreChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 34 then (("\\\"") ^ (v_Vuna_dCompiler_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 92 then (("\\\\") ^ (v_Vuna_dCompiler_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 10 then (("\\n") ^ (v_Vuna_dCompiler_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 9 then (("\\t") ^ (v_Vuna_dCompiler_dCore_dshowCoreChars rest)) else if v_vuna_ueq_uint c 13 then (("\\r") ^ (v_Vuna_dCompiler_dCore_dshowCoreChars rest)) else ((bi_str_pack ((c) :: ([]))) ^ (v_Vuna_dCompiler_dCore_dshowCoreChars rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 794 1 ("no matching clause for Vuna.Compiler.Core.showCoreChars")

let v_Vuna_dCompiler_dCore_dshowCoreString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowCoreChars (bi_str_unpack s)) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dCompiler_dCore_dshowTerm = fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> name
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> (("?") ^ (bi_str_from_int m))
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> g
  | C_Vuna_dCompiler_dCore_dTType (l) -> if v_vuna_ueq_uint (v_Vuna_dCompiler_dCore_dlevelToInt l) 0 then "Type" else (("Type ") ^ (bi_str_from_int (v_Vuna_dCompiler_dCore_dlevelToInt l)))
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> if v_vuna_ueq_ustr name "_" then (let vuna_cat0' = (v_Vuna_dCompiler_dCore_dshowTerm dom) in (let vuna_cat1' = (" -> ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCore_dshowTerm cod) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else if implicit then (let vuna_cat0' = ("{") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowTerm dom) in (let vuna_cat4' = ("} -> ") in (let vuna_cat5' = (v_Vuna_dCompiler_dCore_dshowTerm cod) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))) else (let vuna_cat0' = ("(") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" : ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowTerm dom) in (let vuna_cat4' = (") -> ") in (let vuna_cat5' = (v_Vuna_dCompiler_dCore_dshowTerm cod) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | C_Vuna_dCompiler_dCore_dTLam (name, rig, body) -> (let vuna_cat0' = ("\\") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" => ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowTerm body) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Vuna_dCompiler_dCore_dTApp (f, a, rig) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowTerm f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowTerm a) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (c) in (let vuna_cat2' = (v_Vuna_dCompiler_dCore_dshowArgTerms args) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> (let vuna_cat0' = ("case ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowTerm scrut) in (let vuna_cat2' = (" of ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowCoreAlts alts) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Vuna_dCompiler_dCore_dTInt (n) -> bi_str_from_int n
  | C_Vuna_dCompiler_dCore_dTStr (s) -> v_Vuna_dCompiler_dCore_dshowCoreString s
  | C_Vuna_dCompiler_dCore_dTBool (b) -> if b then "True" else "False"
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> (let vuna_cat0' = ("if ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowTerm c) in (let vuna_cat2' = (" then ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowTerm th) in (let vuna_cat4' = (" else ") in (let vuna_cat5' = (v_Vuna_dCompiler_dCore_dshowTerm el) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 748 14 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dshowArgTerms = fun a0 -> match a0 with
  | ([]) -> ""
  | ((C_Base_dPair_dPair (a, rig)) :: (rest)) -> (let vuna_cat0' = (" ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowTerm a) in (let vuna_cat2' = (v_Vuna_dCompiler_dCore_dshowArgTerms rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 767 1 ("no matching clause for Vuna.Compiler.Core.showArgTerms")
and v_Vuna_dCompiler_dCore_dshowCoreAlts = fun a0 -> match a0 with
  | ([]) -> ""
  | ((alt) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dCompiler_dCore_dcaseAltName alt) in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowBinders (v_Vuna_dCompiler_dCore_dcaseAltBinders alt)) in (let vuna_cat2' = (" => ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowTerm (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) in (let vuna_cat4' = (" | ") in (let vuna_cat5' = (v_Vuna_dCompiler_dCore_dshowCoreAlts rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 771 1 ("no matching clause for Vuna.Compiler.Core.showCoreAlts")

let v_Vuna_dCompiler_dCore_dshowValueAt = fun depth v -> v_Vuna_dCompiler_dCore_dshowTerm (v_Vuna_dCompiler_dCore_dquote depth v)

let v_Vuna_dCompiler_dCore_dmismatchAt = fun depth a b -> C_Base_dResult_dErr ((let vuna_cat0' = ("type mismatch: expected ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowValueAt depth a) in (let vuna_cat2' = (", got ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowValueAt depth b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))

let v_Vuna_dCompiler_dCore_dshowValue = fun v -> v_Vuna_dCompiler_dCore_dshowValueAt 0 v

let v_vuna_ushow_uVuna_uCompiler_uCore_uRig = fun x -> (match x with
  | C_Vuna_dCompiler_dCore_dRig0 -> "Rig0"
  | C_Vuna_dCompiler_dCore_dRig1 -> "Rig1"
  | C_Vuna_dCompiler_dCore_dRigOmega -> "RigOmega"
  | _ -> vuna_fail "<generated>" 47 38 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uCore_uRig = fun x y -> (match x with
  | C_Vuna_dCompiler_dCore_dRig0 -> (match y with
  | C_Vuna_dCompiler_dCore_dRig0 -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 54 30 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dRig1 -> (match y with
  | C_Vuna_dCompiler_dCore_dRig1 -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 57 30 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dRigOmega -> (match y with
  | C_Vuna_dCompiler_dCore_dRigOmega -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 60 34 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 53 38 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uCore_uRig = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uCore_uRig x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uCompiler_uCore_uLevel = fun x -> (match x with
  | C_Vuna_dCompiler_dCore_dMkLevel (v0) -> (let vuna_cat0' = ("(MkLevel ") in (let vuna_cat1' = (v_vuna_ushow_uint v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "<generated>" 68 40 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uCore_uLevel = fun x y -> (match x with
  | C_Vuna_dCompiler_dCore_dMkLevel (v0) -> (match y with
  | C_Vuna_dCompiler_dCore_dMkLevel (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 73 36 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 72 40 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCore_dconv = fun defs sols depth a b -> (let a2 = v_Vuna_dCompiler_dCore_dforce defs sols v_Vuna_dCompiler_dCore_ddefaultFuel a in let y2 = v_Vuna_dCompiler_dCore_dforce defs sols v_Vuna_dCompiler_dCore_ddefaultFuel b in (match a2 with
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> v_Vuna_dCompiler_dCore_dsolveMeta defs sols depth m sp y2
  | _ -> (match y2 with
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> v_Vuna_dCompiler_dCore_dsolveMeta defs sols depth m sp a2
  | _ -> v_Vuna_dCompiler_dCore_dconvBoth defs sols depth a2 y2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 490 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 488 6 ("case pattern match failure")))
and v_Vuna_dCompiler_dCore_dconvBoth = fun defs sols depth a b -> (match a with
  | C_Vuna_dCompiler_dCore_dVType (i) -> (match b with
  | C_Vuna_dCompiler_dCore_dVType (j) -> if v_vuna_ueq_uVuna_uCompiler_uCore_uLevel i j then C_Base_dResult_dOk (sols) else v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 496 14 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, cod) -> (match b with
  | C_Vuna_dCompiler_dCore_dVPi (name2, implicit2, rig2, dom2, cod2) -> if v_vuna_ueq_ubool implicit implicit2 then v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dconv defs sols depth dom dom2) (fun sols2 -> (let v = v_Vuna_dCompiler_dCore_dfreshVar name depth in v_Vuna_dCompiler_dCore_dconv defs sols2 (bi_add depth 1) (v_Vuna_dCompiler_dCore_dapplyClosure cod v) (v_Vuna_dCompiler_dCore_dapplyClosure cod2 v))) else v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 499 36 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVLam (name, rig, clo) -> (match b with
  | C_Vuna_dCompiler_dCore_dVLam (name2, rig2, clo2) -> (let v = v_Vuna_dCompiler_dCore_dfreshVar name depth in v_Vuna_dCompiler_dCore_dconv defs sols (bi_add depth 1) (v_Vuna_dCompiler_dCore_dapplyClosure clo v) (v_Vuna_dCompiler_dCore_dapplyClosure clo2 v))
  | _ -> v_Vuna_dCompiler_dCore_detaRight defs sols depth name clo b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 506 24 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match b with
  | C_Vuna_dCompiler_dCore_dVNeutral (n2) -> v_Vuna_dCompiler_dCore_dconvNeutral defs sols depth n n2 a b
  | C_Vuna_dCompiler_dCore_dVLam (name2, rig2, clo2) -> v_Vuna_dCompiler_dCore_detaLeft defs sols depth a name2 clo2
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 512 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVInt (n) -> (match b with
  | C_Vuna_dCompiler_dCore_dVInt (m) -> if v_vuna_ueq_uint n m then C_Base_dResult_dOk (sols) else v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 516 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVStr (s) -> (match b with
  | C_Vuna_dCompiler_dCore_dVStr (s2) -> if v_vuna_ueq_ustr s s2 then C_Base_dResult_dOk (sols) else v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 519 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVBool (x) -> (match b with
  | C_Vuna_dCompiler_dCore_dVBool (y) -> if v_vuna_ueq_ubool x y then C_Base_dResult_dOk (sols) else v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 522 14 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> (match b with
  | C_Vuna_dCompiler_dCore_dVCon (c2, args2) -> if v_vuna_ueq_ustr c c2 then v_Vuna_dCompiler_dCore_dconvValueLists defs sols depth args args2 else v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 525 18 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> (match b with
  | C_Vuna_dCompiler_dCore_dVCase (scrut2, alts2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dconv defs sols depth scrut scrut2) (fun sols2 -> v_Vuna_dCompiler_dCore_dconvCaseAlts defs sols2 depth alts alts2)
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 529 23 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> (match b with
  | C_Vuna_dCompiler_dCore_dVIf (c2, th2, el2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dconv defs sols depth c c2) (fun sols2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dconv defs sols2 depth th th2) (fun sols3 -> v_Vuna_dCompiler_dCore_dconv defs sols3 depth el el2))
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 534 18 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 495 32 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_detaLeft = fun defs sols depth a name clo -> (let v = v_Vuna_dCompiler_dCore_dfreshVar name depth in v_Vuna_dCompiler_dCore_dconv defs sols (bi_add depth 1) (v_Vuna_dCompiler_dCore_dapplyValue a v) (v_Vuna_dCompiler_dCore_dapplyClosure clo v))
and v_Vuna_dCompiler_dCore_detaRight = fun defs sols depth name clo b -> (let v = v_Vuna_dCompiler_dCore_dfreshVar name depth in v_Vuna_dCompiler_dCore_dconv defs sols (bi_add depth 1) (v_Vuna_dCompiler_dCore_dapplyClosure clo v) (v_Vuna_dCompiler_dCore_dapplyValue b v))
and v_Vuna_dCompiler_dCore_dconvNeutral = fun defs sols depth n1 n2 v1 v2 -> (match n1 with
  | C_Vuna_dCompiler_dCore_dNVar (name, level, sp) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dNVar (name2, level2, sp2) -> if v_vuna_ueq_uint level level2 then v_Vuna_dCompiler_dCore_dconvSpines defs sols depth sp sp2 v1 v2 else v_Vuna_dCompiler_dCore_dmismatchAt depth v1 v2
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth v1 v2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 553 25 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dNGlobal (g2, sp2) -> if v_vuna_ueq_ustr g g2 then v_Vuna_dCompiler_dCore_dconvSpines defs sols depth sp sp2 v1 v2 else v_Vuna_dCompiler_dCore_dmismatchAt depth v1 v2
  | _ -> v_Vuna_dCompiler_dCore_dmismatchAt depth v1 v2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 557 19 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 552 43 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dconvSpines = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (defs, sols, depth, [], [], v1, v2) -> C_Base_dResult_dOk (sols)
  | (defs, sols, depth, (a) :: (xs), (b) :: (ys), v1, v2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dconv defs sols depth a b) (fun sols2 -> v_Vuna_dCompiler_dCore_dconvSpines defs sols2 depth xs ys v1 v2)
  | (defs, sols, depth, _, _, v1, v2) -> v_Vuna_dCompiler_dCore_dmismatchAt depth v1 v2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 562 1 ("no matching clause for Vuna.Compiler.Core.convSpines")
and v_Vuna_dCompiler_dCore_dconvValueLists = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (defs, sols, depth, [], []) -> C_Base_dResult_dOk (sols)
  | (defs, sols, depth, (a) :: (xs), (b) :: (ys)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dconv defs sols depth a b) (fun sols2 -> v_Vuna_dCompiler_dCore_dconvValueLists defs sols2 depth xs ys)
  | (defs, sols, depth, _, _) -> C_Base_dResult_dErr ("type mismatch: constructor arguments differ in length")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 568 1 ("no matching clause for Vuna.Compiler.Core.convValueLists")
and v_Vuna_dCompiler_dCore_dconvCaseAlts = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (defs, sols, depth, [], []) -> C_Base_dResult_dOk (sols)
  | (defs, sols, depth, (a) :: (rest), (b) :: (rest2)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dCore_dvCaseAltName a) (v_Vuna_dCompiler_dCore_dvCaseAltName b) then if v_vuna_ueq_uint (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dvCaseAltBinders a)) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dvCaseAltBinders b)) then (match v_Vuna_dCompiler_dCore_dconvOneAlt defs sols depth a b with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (sols2) -> v_Vuna_dCompiler_dCore_dconvCaseAlts defs sols2 depth rest rest2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 576 163 ("case pattern match failure")) else C_Base_dResult_dErr ((let vuna_cat0' = ("type mismatch: case branch ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dvCaseAltName a) in (let vuna_cat2' = (" binds a different number of variables") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Base_dResult_dErr ((let vuna_cat0' = ("type mismatch: case branch ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dvCaseAltName a) in (let vuna_cat2' = (" vs ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dvCaseAltName b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | (defs, sols, depth, _, _) -> C_Base_dResult_dErr ("type mismatch: case branches differ in number")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 575 1 ("no matching clause for Vuna.Compiler.Core.convCaseAlts")
and v_Vuna_dCompiler_dCore_dconvOneAlt = fun defs sols depth a b -> (let bs = v_Vuna_dCompiler_dCore_dvCaseAltBinders a in let n = v_Base_dList_dlength bs in let args = v_Vuna_dCompiler_dCore_dargValsAt bs depth 0 in v_Vuna_dCompiler_dCore_dconv defs sols (bi_add depth n) (v_Vuna_dCompiler_dCore_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dvCaseAltClosure a) args) (v_Vuna_dCompiler_dCore_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dvCaseAltClosure b) args))
and v_Vuna_dCompiler_dCore_dsolveMeta = fun defs sols depth m sp rhs -> (match sp with
  | [] -> (match v_Vuna_dCompiler_dCore_dmetaLookup m sols with
  | C_Base_dMaybe_dJust (t) -> v_Vuna_dCompiler_dCore_dconv defs sols depth (v_Vuna_dCompiler_dCore_dapplySpine t []) rhs
  | C_Base_dMaybe_dNothing -> (let t = v_Vuna_dCompiler_dCore_dquote depth rhs in if v_Vuna_dCompiler_dCore_dhasMeta m 0 t then C_Base_dResult_dErr ((let vuna_cat0' = ("cannot solve metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (occurs check)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Base_dResult_dOk ((C_Base_dPair_dPair (m, rhs)) :: (sols)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 608 9 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dCore_dsolveMetaHo defs sols depth m sp rhs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 607 38 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dsolveMetaHo = fun defs sols depth m sp rhs -> (match rhs with
  | C_Vuna_dCompiler_dCore_dVMeta (n, sp2) -> (match v_Vuna_dCompiler_dCore_dmetaLookup n sols with
  | C_Base_dMaybe_dJust (t) -> v_Vuna_dCompiler_dCore_dconv defs sols depth (v_Vuna_dCompiler_dCore_dapplySpine (C_Vuna_dCompiler_dCore_dVMeta (m, sp)) []) (v_Vuna_dCompiler_dCore_dapplySpine t sp2)
  | C_Base_dMaybe_dNothing -> if v_vuna_ueq_uint m n then v_Vuna_dCompiler_dCore_dconvSpines defs sols depth sp sp2 (C_Vuna_dCompiler_dCore_dVMeta (m, sp)) rhs else v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dsolveMeta defs sols depth m [] (C_Vuna_dCompiler_dCore_dVMeta (n, []))) (fun sols2 -> v_Vuna_dCompiler_dCore_dconvSpines defs sols2 depth sp sp2 (C_Vuna_dCompiler_dCore_dVMeta (m, sp)) rhs)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 620 18 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, args) -> v_Vuna_dCompiler_dCore_dsolveMetaHead defs sols depth m sp (C_Vuna_dCompiler_dCore_dVNeutral (n)) (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, []))) args
  | C_Vuna_dCompiler_dCore_dNVar (name, level, args) -> v_Vuna_dCompiler_dCore_dsolveMetaHead defs sols depth m sp (C_Vuna_dCompiler_dCore_dVNeutral (n)) (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, level, []))) args
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("cannot solve higher-order metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 628 17 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("cannot solve higher-order metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 619 40 ("case pattern match failure"))
and v_Vuna_dCompiler_dCore_dsolveMetaHead = fun defs sols depth m sp whole headVal args -> if v_vuna_uge_uint (v_Base_dList_dlength args) (v_Base_dList_dlength sp) then (let extra = bi_sub (v_Base_dList_dlength args) (v_Base_dList_dlength sp) in (match v_Vuna_dCompiler_dCore_dsplitAtVals extra args with
  | C_Base_dPair_dPair (headArgs, tailArgs) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCore_dsolveMeta defs sols depth m [] (v_Vuna_dCompiler_dCore_dapplySpine headVal headArgs)) (fun sols2 -> v_Vuna_dCompiler_dCore_dconvSpines defs sols2 depth sp tailArgs (C_Vuna_dCompiler_dCore_dVMeta (m, sp)) whole)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Core.vuna" 640 6 ("case pattern match failure"))) else C_Base_dResult_dErr ((let vuna_cat0' = ("cannot solve higher-order metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_vuna_uneq_uVuna_uCompiler_uCore_uLevel = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uCore_uLevel x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
