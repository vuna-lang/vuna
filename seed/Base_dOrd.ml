open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
type 'a0 t_Dict_uBase_dOrd_dOrd = C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

let v_Base_dOrd_dOrd_uBase_dOrd_dOrd_uInt = (C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x -> (fun y -> ((bi_lt_int x) y))), (fun x -> (fun y -> ((bi_le_int x) y))), (fun x -> (fun y -> ((bi_gt_int x) y))), (fun x -> (fun y -> ((bi_ge_int x) y)))))

let v_Base_dOrd_dOrd_uBase_dOrd_dOrd_uString = (C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x -> (fun y -> ((bi_lt_generic x) y))), (fun x -> (fun y -> ((bi_le_generic x) y))), (fun x -> (fun y -> ((bi_gt_generic x) y))), (fun x -> (fun y -> ((bi_ge_generic x) y)))))

let v_Base_dOrd_dOrd_uBase_dOrd_dOrd_uBase_dBool_dBool = (C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x -> (fun y -> ((bi_lt_generic x) y))), (fun x -> (fun y -> ((bi_le_generic x) y))), (fun x -> (fun y -> ((bi_gt_generic x) y))), (fun x -> (fun y -> ((bi_ge_generic x) y)))))

let v_Base_dOrd_dlt = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd (dtb__0, dtb__1, dtb__2, dtb__3) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dOrd_dle = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd (dtb__4, dtb__5, dtb__6, dtb__7) -> ((dtb__5 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dOrd_dgt = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd (dtb__8, dtb__9, dtb__10, dtb__11) -> ((dtb__10 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dOrd_dge = (fun _ud -> (fun x0 -> (fun x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd (dtb__12, dtb__13, dtb__14, dtb__15) -> ((dtb__15 x0) x1)
  | _ -> failwith "DT: impossible branch"
))))
