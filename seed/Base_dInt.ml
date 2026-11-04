open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
let v_Eq_uInt = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x -> (fun y -> ((bi_eq_int x) y))), (fun x -> (fun y -> ((bi_neq_int x) y)))))

let v_Ord_uInt = (C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x -> (fun y -> ((bi_lt_int x) y))), (fun x -> (fun y -> ((bi_le_int x) y))), (fun x -> (fun y -> ((bi_gt_int x) y))), (fun x -> (fun y -> ((bi_ge_int x) y)))))
