open Vuna_runtime
type 'a0 t_Dict_uBase_dData_dFloat_dFromFloat = C_Dict_uBase_dData_dFloat_dFromFloat_FromFloat of ((float) -> 'a0)

# 22 "Base/Data/Float.vuna"
let v_FromFloat_uFloat = (C_Dict_uBase_dData_dFloat_dFromFloat_FromFloat ((fun x -> x)))

# 25 "Base/Data/Float.vuna"
let v_Eq_uFloat = (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 29 "Base/Data/Float.vuna"
let v_Ord_uFloat = (Base_dTrait_dOrd.C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 36 "Base/Data/Float.vuna"
let v_Num_uFloat = (Base_dTrait_dNum.C_Dict_uBase_dTrait_dNum_dNum_Num ((fun x y -> (x +. y)), (fun x y -> (x -. y)), (fun x y -> (x *. y)), (fun x y -> (x /. y))))

# 43 "Base/Data/Float.vuna"
let v_Neg_uFloat = (Base_dTrait_dNeg.C_Dict_uBase_dTrait_dNeg_dNeg_Neg ((fun x -> (0.0 -. x))))

# 19 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dfromFloat = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dData_dFloat_dFromFloat_FromFloat (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dabs = (fun _uarity0 -> (abs_float _uarity0))

# 55 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dsqrt = (fun _uarity0 -> (sqrt _uarity0))

# 59 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dintToFloat = (fun _uarity0 -> (float_of_int _uarity0))

# 63 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dfloatToInt = (fun _uarity0 -> (int_of_float _uarity0))

# 71 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dnormStep = (fun p _u -> ((fun e -> ((fun m -> (if (m >= 10.0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (e + 1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (m /. 10.0) } else (if (m < 1.0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (e - 1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (m *. 10.0) } else p))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))

# 79 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_ddigStep = (fun p _u -> ((fun m -> ((fun ds -> ((fun d -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((m -. (v_Base_dData_dFloat_dintToFloat d)) *. 10.0); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend ds) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (d, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }) (v_Base_dData_dFloat_dfloatToInt m))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))

# 88 "Base/Data/Float.vuna"
let rec v_Base_dData_dFloat_dcarryRev = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> (if (dtb__1 = 9) then (match (v_Base_dData_dFloat_dcarryRev dtb__2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, dtb__3))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((dtb__1 + 1), dtb__2)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 99 "Base/Data/Float.vuna"
let rec v_Base_dData_dFloat_dtrimZerosRev = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (if (dtb__4 = 0) then (v_Base_dData_dFloat_dtrimZerosRev dtb__5) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 104 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dtrimZeros = (fun ds -> (match (Base_dData_dList.v_Base_dData_dList_dreverse (v_Base_dData_dFloat_dtrimZerosRev (Base_dData_dList.v_Base_dData_dList_dreverse ds))) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | dtb__6 -> dtb__6
))

# 111 "Base/Data/Float.vuna"
let rec v_Base_dData_dFloat_ddsLen = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (1 + (v_Base_dData_dFloat_ddsLen dtb__8))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 116 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_ddigitsText = (fun ds -> (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : string) (d : int) -> (acc ^ (bi_strFromInt d)))) "") ds))

# 120 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dzerosText = (fun n -> (v_Base_dData_dFloat_ddigitsText ((Base_dData_dList.v_Base_dData_dList_dmap (fun (_u : int) -> 0)) ((Base_dData_dList.v_Base_dData_dList_drange 0) n))))

# 124 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dexpSuffix = (fun e -> ((fun n -> ((fun sign -> (sign ^ (if (n < 10) then ("0" ^ (bi_strFromInt n)) else (bi_strFromInt n)))) (if (e < 0) then "-" else "+"))) (if (e < 0) then (0 - e) else e)))

# 132 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dexpForm = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "0e+00"
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [(bi_strFromInt dtb__9); "e"; (v_Base_dData_dFloat_dexpSuffix mc0)])
  | _ -> (String.concat "" [(bi_strFromInt dtb__9); "."; (v_Base_dData_dFloat_ddigitsText dtb__10); "e"; (v_Base_dData_dFloat_dexpSuffix mc0)])
)
  | _ -> failwith "DT: impossible branch"
))

# 140 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dfixedForm = (fun e ds -> (if (e >= 0) then ((fun intLen -> ((fun len -> (if (len <= intLen) then (String.concat "" [(v_Base_dData_dFloat_ddigitsText ds); (v_Base_dData_dFloat_dzerosText (intLen - len)); "."]) else (String.concat "" [(v_Base_dData_dFloat_ddigitsText ((Base_dData_dList.v_Base_dData_dList_dtake intLen) ds)); "."; (v_Base_dData_dFloat_ddigitsText ((Base_dData_dList.v_Base_dData_dList_ddrop intLen) ds))]))) (v_Base_dData_dFloat_ddsLen ds))) (e + 1)) else (String.concat "" ["0."; (v_Base_dData_dFloat_dzerosText ((0 - e) - 1)); (v_Base_dData_dFloat_ddigitsText ds)])))

# 151 "Base/Data/Float.vuna"
let v_Base_dData_dFloat_dfloatRender = (fun x -> (if (x <> x) then "nan" else ((fun inf -> (if (x = inf) then "inf" else (if (x = (0.0 -. inf)) then "-inf" else (if (x = 0.0) then (if ((1.0 /. x) < 0.0) then "-0." else "0.") else ((fun neg -> ((fun a -> ((fun p -> ((fun e0 -> ((fun m0 -> ((fun dp -> ((fun d13 -> ((fun raw -> ((fun ed -> ((fun e -> ((fun ds -> ((fun body -> (if neg then ("-" ^ body) else body)) (if (if (e < (0 - 4)) then true else (e >= 12)) then ((v_Base_dData_dFloat_dexpForm e) ds) else ((v_Base_dData_dFloat_dfixedForm e) ds)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf ed))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ed))) (if (d13 >= 5) then (match (v_Base_dData_dFloat_dcarryRev (Base_dData_dList.v_Base_dData_dList_dreverse raw)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__11) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = e0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Base_dData_dFloat_dtrimZeros (Base_dData_dList.v_Base_dData_dList_dreverse dtb__11)) }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (e0 + 1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Base_dData_dFloat_dtrimZeros (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (1, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (_u : int) -> 0)) ((Base_dData_dList.v_Base_dData_dList_drange 0) 11))))) }
  | _ -> failwith "DT: impossible branch"
) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = e0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Base_dData_dFloat_dtrimZeros raw) }))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dp))) (v_Base_dData_dFloat_dfloatToInt (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dp)))) (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (q : (float, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) (i : int) -> ((v_Base_dData_dFloat_ddigStep q) i))) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = m0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }) ((Base_dData_dList.v_Base_dData_dList_drange 0) 12)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (q : (int, float) Base_dData_dPair.t_Base_dData_dPair_dPair) (i : int) -> ((v_Base_dData_dFloat_dnormStep q) i))) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = 0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = a }) ((Base_dData_dList.v_Base_dData_dList_drange 0) 700)))) (if neg then (0.0 -. x) else x))) (x < 0.0)))))) (1.0 /. 0.0))))

# 46 "Base/Data/Float.vuna"
let v_Show_uFloat = (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun x -> (v_Base_dData_dFloat_dfloatRender x))))
