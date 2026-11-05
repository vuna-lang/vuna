open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
let v_Base_dNat_dplus = (fun _uarity0 _uarity1 -> (bi_natAdd _uarity0 _uarity1))

let v_Base_dNat_dminus = (fun _uarity0 _uarity1 -> (bi_natSub _uarity0 _uarity1))

let v_Base_dNat_dmult = (fun _uarity0 _uarity1 -> (bi_natMul _uarity0 _uarity1))

let v_Base_dNat_ddiv = (fun _uarity0 _uarity1 -> (bi_natDiv _uarity0 _uarity1))

let v_Base_dNat_dtoInt = (fun _uarity0 -> _uarity0)

let v_Eq_uBase_dNat_dNat = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x y -> ((v_Base_dNat_dtoInt x) = (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) <> (v_Base_dNat_dtoInt y)))))

let v_Ord_uBase_dNat_dNat = (C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x y -> ((v_Base_dNat_dtoInt x) < (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) <= (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) > (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) >= (v_Base_dNat_dtoInt y)))))

let v_Show_uBase_dNat_dNat = (C_Dict_uBase_dShow_dShow_MkDict_uBase_dShow_dShow ((fun n -> (bi_strFromInt (v_Base_dNat_dtoInt n)))))

let v_Base_dNat_dfromInt = (fun _uarity0 -> (bi_natFromInt _uarity0))

let v_Base_dNat_dfromIntMaybe = (fun n -> (if (n < 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dNat_dfromInt n)))))

let v_Base_dNat_dpred = (fun n -> ((v_Base_dNat_dminus n) 1))

let v_Base_dNat_disZero = (fun n -> ((v_Base_dNat_dtoInt n) = 0))
