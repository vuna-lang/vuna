open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
type   'p0 t_Base_dResult_dResult =
    C_Base_dResult_dOk of ('p0)
  | C_Base_dResult_dErr of (string)
let show_Base_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Base_dResult_dResult -> string = fun s0 v -> match v with
  | C_Base_dResult_dOk f0 -> show_ctor "Ok" [(s0) f0]
  | C_Base_dResult_dErr f0 -> show_ctor "Err" [(show_vstring) f0]
let rec v_Base_dResult_dtraverse = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Base_dResult_dOk ([])
  | (f, (x) :: (xs)) -> (match f x with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (y) -> (match v_Base_dResult_dtraverse f xs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (ys) -> C_Base_dResult_dOk ((y) :: (ys))
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 16 11 ("case pattern match failure"))
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 14 24 ("case pattern match failure"))
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 13 1 ("no matching clause for Base.Result.traverse")

let v_Base_dResult_dandThen = fun r f -> (match r with
  | C_Base_dResult_dOk (x) -> f x
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 21 15 ("case pattern match failure"))

let v_Base_dResult_dstep = fun r k -> (match r with
  | C_Base_dResult_dOk (C_Base_dPair_dPair (x, st)) -> k x st
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 26 12 ("case pattern match failure"))

let v_Base_dResult_dmapResult = fun f r -> (match r with
  | C_Base_dResult_dOk (x) -> C_Base_dResult_dOk (f x)
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 31 17 ("case pattern match failure"))

let v_Base_dResult_dmapError = fun f r -> (match r with
  | C_Base_dResult_dOk (x) -> C_Base_dResult_dOk (x)
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (f e)
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 36 16 ("case pattern match failure"))

let v_Base_dResult_dwithDefault = fun d r -> (match r with
  | C_Base_dResult_dOk (x) -> x
  | C_Base_dResult_dErr (e) -> d
  | _ -> vuna_fail "base/lib/Base/Result.vuna" 41 19 ("case pattern match failure"))

let v_vuna_ueq_uBase_uResult_uResult = fun x y -> (match x with
  | C_Base_dResult_dOk (v0) -> (match y with
  | C_Base_dResult_dOk (w0) -> v_vuna_ueq_ugeneric v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 442 24 ("case pattern match failure"))
  | C_Base_dResult_dErr (v0) -> (match y with
  | C_Base_dResult_dErr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 445 25 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 441 34 ("case pattern match failure"))

let v_vuna_uneq_uBase_uResult_uResult = fun x y -> if v_vuna_ueq_uBase_uResult_uResult x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
