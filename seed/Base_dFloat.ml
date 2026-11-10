open Vuna_runtime
type 'a0 t_Dict_uBase_dFloat_dFromFloat = C_Dict_uBase_dFloat_dFromFloat_FromFloat of ((float) -> 'a0)

let v_FromFloat_uFloat = (C_Dict_uBase_dFloat_dFromFloat_FromFloat ((fun x -> x)))

let v_Eq_uFloat = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

let v_Ord_uFloat = (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

let v_Num_uFloat = (Base_dNum.C_Dict_uBase_dNum_dNum_Num ((fun x y -> (x +. y)), (fun x y -> (x -. y)), (fun x y -> (x *. y)), (fun x y -> (x /. y))))

let v_Show_uFloat = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun x -> (string_of_float x))))

let v_Base_dFloat_dfromFloat = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dFloat_dFromFloat_FromFloat (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dFloat_dabs = (fun _uarity0 -> (abs_float _uarity0))

let v_Base_dFloat_dsqrt = (fun _uarity0 -> (sqrt _uarity0))

let v_Base_dFloat_dintToFloat = (fun _uarity0 -> (float_of_int _uarity0))

let v_Base_dFloat_dfloatToInt = (fun _uarity0 -> (int_of_float _uarity0))
