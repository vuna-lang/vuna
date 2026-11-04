open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
let v_Eq_uInt = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

let v_Ord_uInt = (C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))
