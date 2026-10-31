open Vuna_runtime
open Vuna_dPair
let v_Vuna_dBool_dnot = fun b -> if b then false else true

let v_Vuna_dBool_dand = fun a b -> if a then b else false

let v_Vuna_dBool_dor = fun a b -> if a then true else b

let v_Vuna_dBool_dxor = fun a b -> if a then v_Vuna_dBool_dnot b else b

let v_Vuna_dBool_dbool = fun ifFalse ifTrue b -> if b then ifTrue else ifFalse

let v_vuna_ushow_uVuna_uBool_uBool = fun x -> (match x with
  | false -> "False"
  | true -> "True"
  | _ -> vuna_fail "<generated>" 451 30 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uBool_uBool = fun x y -> (match x with
  | false -> (match y with
  | false -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 457 12 ("case pattern match failure"))
  | true -> (match y with
  | true -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 460 11 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 456 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uBool_uBool = fun x y -> if v_vuna_ueq_uVuna_uBool_uBool x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
