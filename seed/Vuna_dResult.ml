open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type   'p0 t_Vuna_dResult_dResult =
    C_Vuna_dResult_dOk of ('p0)
  | C_Vuna_dResult_dErr of (string)
let show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string = fun s0 v -> match v with
  | C_Vuna_dResult_dOk f0 -> show_ctor "Ok" [(s0) f0]
  | C_Vuna_dResult_dErr f0 -> show_ctor "Err" [(show_vstring) f0]
let rec v_Vuna_dResult_dtraverse = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dResult_dOk ([])
  | (f, (x) :: (xs)) -> (match f x with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (y) -> (match v_Vuna_dResult_dtraverse f xs with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (ys) -> C_Vuna_dResult_dOk ((y) :: (ys))
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 19 7 ("case pattern match failure"))
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 16 3 ("case pattern match failure"))
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 14 1 ("no matching clause for Vuna.Result.traverse")

let v_Vuna_dResult_dandThen = fun r f -> (match r with
  | C_Vuna_dResult_dOk (x) -> f x
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 25 3 ("case pattern match failure"))

let v_Vuna_dResult_dstep = fun r k -> (match r with
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (x, st)) -> k x st
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 31 3 ("case pattern match failure"))

let v_Vuna_dResult_dmapResult = fun f r -> (match r with
  | C_Vuna_dResult_dOk (x) -> C_Vuna_dResult_dOk (f x)
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 37 3 ("case pattern match failure"))

let v_Vuna_dResult_dmapError = fun f r -> (match r with
  | C_Vuna_dResult_dOk (x) -> C_Vuna_dResult_dOk (x)
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (f e)
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 43 3 ("case pattern match failure"))

let v_Vuna_dResult_dwithDefault = fun d r -> (match r with
  | C_Vuna_dResult_dOk (x) -> x
  | C_Vuna_dResult_dErr (e) -> d
  | _ -> vuna_fail "stdlib/lib/Vuna/Result.vuna" 49 3 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uResult_uResult = fun x y -> (match x with
  | C_Vuna_dResult_dOk (v0) -> (match y with
  | C_Vuna_dResult_dOk (w0) -> v_vuna_ueq_ugeneric v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 448 24 ("case pattern match failure"))
  | C_Vuna_dResult_dErr (v0) -> (match y with
  | C_Vuna_dResult_dErr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 451 25 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 447 34 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uResult_uResult = fun x y -> if v_vuna_ueq_uVuna_uResult_uResult x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
