open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
type 'a0 t_Dict_uBase_dEq_dEq = C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

let v_Eq_uBase_dBool_dBool = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun mc0 mc1 -> (if mc0 then (if mc1 then true else false) else (if mc1 then false else true))), (fun mc0 mc1 -> (if mc0 then (if mc1 then false else true) else (if mc1 then true else false)))))

let v_Base_dEq_deq = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq (dtb__0, dtb__1) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEq_dneq = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq (dtb__2, dtb__3) -> ((dtb__3 x0) x1)
  | _ -> failwith "DT: impossible branch"
))
