open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
let show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string = fun s0 v -> match v with
  | C_Vuna_dMaybe_dNothing -> "Nothing"
  | C_Vuna_dMaybe_dJust f0 -> show_ctor "Just" [(s0) f0]
let v_Vuna_dMaybe_dfromMaybe = fun d m -> (match m with
  | C_Vuna_dMaybe_dNothing -> d
  | C_Vuna_dMaybe_dJust (x) -> x
  | _ -> vuna_fail "stdlib/lib/Vuna/Maybe.vuna" 16 3 ("case pattern match failure"))

let v_Vuna_dMaybe_disJust = fun m -> (match m with
  | C_Vuna_dMaybe_dNothing -> false
  | C_Vuna_dMaybe_dJust (_) -> true
  | _ -> vuna_fail "stdlib/lib/Vuna/Maybe.vuna" 22 3 ("case pattern match failure"))

let v_Vuna_dMaybe_disNothing = fun m -> (match m with
  | C_Vuna_dMaybe_dNothing -> true
  | C_Vuna_dMaybe_dJust (_) -> false
  | _ -> vuna_fail "stdlib/lib/Vuna/Maybe.vuna" 28 3 ("case pattern match failure"))

let v_Vuna_dMaybe_dmaybe = fun d f m -> (match m with
  | C_Vuna_dMaybe_dNothing -> d
  | C_Vuna_dMaybe_dJust (x) -> f x
  | _ -> vuna_fail "stdlib/lib/Vuna/Maybe.vuna" 34 3 ("case pattern match failure"))

let v_Vuna_dMaybe_dmapJust = fun f m -> (match m with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (x) -> C_Vuna_dMaybe_dJust (f x)
  | _ -> vuna_fail "stdlib/lib/Vuna/Maybe.vuna" 40 3 ("case pattern match failure"))

let v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap = fun f m -> (match m with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (x) -> C_Vuna_dMaybe_dJust (f x)
  | _ -> vuna_fail "stdlib/lib/Vuna/Maybe.vuna" 48 5 ("case pattern match failure"))

let v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure = fun x -> C_Vuna_dMaybe_dJust (x)

let v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind = fun m f -> (match m with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust (x) -> f x
  | _ -> vuna_fail "stdlib/lib/Vuna/Maybe.vuna" 54 5 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uMaybe_uMaybe = fun x y -> (match x with
  | C_Vuna_dMaybe_dNothing -> (match y with
  | C_Vuna_dMaybe_dNothing -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 523 25 ("case pattern match failure"))
  | C_Vuna_dMaybe_dJust (v0) -> (match y with
  | C_Vuna_dMaybe_dJust (w0) -> v_vuna_ueq_ugeneric v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 526 25 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 522 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uMaybe_uMaybe = fun x y -> if v_vuna_ueq_uVuna_uMaybe_uMaybe x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
