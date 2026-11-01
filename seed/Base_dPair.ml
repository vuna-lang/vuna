open Vuna_runtime
type   ('p0, 'p1) t_Base_dPair_dPair =
    C_Base_dPair_dPair of ('p0) * ('p1)
let show_Base_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Base_dPair_dPair -> string = fun s0 s1 v -> match v with
  | C_Base_dPair_dPair (f0, f1) -> show_ctor "Pair" [(s0) f0; (s1) f1]
let v_Base_dPair_dfirstOf = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (a, b)) -> a
  | _ -> vuna_fail "base/lib/Base/Pair.vuna" 8 1 ("no matching clause for Base.Pair.firstOf")

let v_Base_dPair_dsecondOf = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (a, b)) -> b
  | _ -> vuna_fail "base/lib/Base/Pair.vuna" 11 1 ("no matching clause for Base.Pair.secondOf")

let v_vuna_ueq_uBase_uPair_uPair = fun x y -> (match x with
  | C_Base_dPair_dPair (v0, v1) -> (match y with
  | C_Base_dPair_dPair (w0, w1) -> (if (v_vuna_ueq_ugeneric v0 w0) then (v_vuna_ueq_ugeneric v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 495 27 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 494 30 ("case pattern match failure"))

let v_vuna_uneq_uBase_uPair_uPair = fun x y -> if v_vuna_ueq_uBase_uPair_uPair x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
