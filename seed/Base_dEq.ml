open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
type 'a0 t_Dict_uBase_dEq_dEq = C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

let v_Eq_uInt = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x -> (fun y -> ((bi_eq_int x) y))), (fun x -> (fun y -> ((bi_neq_int x) y)))))

let v_Eq_uString = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x -> (fun y -> ((bi_eq_str x) y))), (fun x -> (fun y -> ((bi_neq_str x) y)))))

let v_Eq_uBase_dBool_dBool = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x -> (fun y -> (if (if x then y else false) then true else (if (v_Base_dBool_dnot x) then (v_Base_dBool_dnot y) else false)))), (fun x -> (fun y -> (if (if x then (v_Base_dBool_dnot y) else false) then true else (if (v_Base_dBool_dnot x) then y else false))))))

let v_Base_dEq_deq = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq (dtb__0, dtb__1) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dEq_dneq = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq (dtb__2, dtb__3) -> ((dtb__3 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))
