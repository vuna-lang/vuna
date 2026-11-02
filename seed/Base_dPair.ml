open Vuna_runtime
open Vuna_builtins
type ('a0, 'a1) t_Base_dPair_dPair = C_Base_dPair_dPair_Base_dPair_dPair of ('a0) * ('a1)

let v_Base_dPair_dfirstOf = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dPair_dsecondOf = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))
