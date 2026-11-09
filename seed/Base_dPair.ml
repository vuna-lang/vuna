open Vuna_runtime
type ('a0, 'a1) t_Base_dPair_dPair = C_Base_dPair_dPair_Pair of ('a0) * ('a1)

let v_Show_uBase_dPair_dPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun p -> (match p with
  | C_Base_dPair_dPair_Pair (dtb__0, dtb__1) -> (String.concat "" ["("; ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__0); ", "; ((Base_dShow.v_Base_dShow_dshow _uctx1) dtb__1); ")"])
  | _ -> failwith "DT: impossible branch"
)))))

let v_Base_dPair_dfirstOf = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Pair (dtb__2, dtb__3) -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dPair_dsecondOf = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Pair (dtb__4, dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))
