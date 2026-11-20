open Vuna_runtime
type 'a0 t_FromFloat = C_FromFloat_FromFloat of ((float) -> 'a0)

# 22 "Base/Data/Float.vuna"
let v_FromFloat_uFloat = (C_FromFloat_FromFloat ((fun x -> x)))

# 25 "Base/Data/Float.vuna"
let v_Eq_uFloat = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 29 "Base/Data/Float.vuna"
let v_Ord_uFloat = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 36 "Base/Data/Float.vuna"
let v_Num_uFloat = (B_dTrait_dNum.C_Num_Num ((fun x y -> (x +. y)), (fun x y -> (x -. y)), (fun x y -> (x *. y)), (fun x y -> (x /. y))))

# 43 "Base/Data/Float.vuna"
let v_Neg_uFloat = (B_dTrait_dNeg.C_Neg_Neg ((fun x -> (0.0 -. x))))

# 19 "Base/Data/Float.vuna"
let v_fromFloat = (fun _ud (x0 : float) -> (match _ud with
  | C_FromFloat_FromFloat (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Base/Data/Float.vuna"
let v_abs = abs_float

# 55 "Base/Data/Float.vuna"
let v_sqrt = sqrt

# 59 "Base/Data/Float.vuna"
let v_intToFloat = float_of_int

# 63 "Base/Data/Float.vuna"
let v_floatToInt = int_of_float

# 71 "Base/Data/Float.vuna"
let v_normStep = (fun (p : (int, float) B_dData_dPair.t_Pair) (_u : int) -> ((fun e -> ((fun m -> (if (m >= 10.0) then { B_dData_dPair.f_Pair_first = (e + 1); B_dData_dPair.f_Pair_second = (m /. 10.0) } else (if (m < 1.0) then { B_dData_dPair.f_Pair_first = (e - 1); B_dData_dPair.f_Pair_second = (m *. 10.0) } else p))) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p)))

# 79 "Base/Data/Float.vuna"
let v_digStep = (fun (p : (float, int B_dData_dList.t_List) B_dData_dPair.t_Pair) (_u : int) -> ((fun m -> ((fun ds -> ((fun d -> { B_dData_dPair.f_Pair_first = ((m -. (v_intToFloat d)) *. 10.0); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ds) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil))) }) (v_floatToInt m))) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p)))

# 88 "Base/Data/Float.vuna"
let rec v_carryRev = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (if (dtb__1 = 9) then (match (v_carryRev dtb__2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (0, dtb__3))))
  | _ -> failwith "DT: impossible branch"
) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((dtb__1 + 1), dtb__2)))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 99 "Base/Data/Float.vuna"
let rec v_trimZerosRev = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (if (dtb__4 = 0) then (v_trimZerosRev dtb__5) else (B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 104 "Base/Data/Float.vuna"
let v_trimZeros = (fun (ds : int B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse (v_trimZerosRev (B_dData_dList.v_reverse ds))) with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))
  | dtb__6 -> dtb__6
))

# 111 "Base/Data/Float.vuna"
let rec v_dsLen = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (1 + (v_dsLen dtb__8))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 116 "Base/Data/Float.vuna"
let v_digitsText = (fun (ds : int B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (acc : string) (d : int) -> (acc ^ (bi_strFromInt d)))) "") ds))

# 120 "Base/Data/Float.vuna"
let v_zerosText = (fun (n : int) -> (v_digitsText ((B_dData_dList.v_map (fun (_u : int) -> 0)) ((B_dData_dList.v_range 0) n))))

# 124 "Base/Data/Float.vuna"
let v_expSuffix = (fun (e : int) -> ((fun n -> ((fun sign -> (sign ^ (if (n < 10) then ("0" ^ (bi_strFromInt n)) else (bi_strFromInt n)))) (if (e < 0) then "-" else "+"))) (if (e < 0) then (0 - e) else e)))

# 132 "Base/Data/Float.vuna"
let v_expForm = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> "0e+00"
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [(bi_strFromInt dtb__9); "e"; (v_expSuffix mc0)])
  | _ -> (String.concat "" [(bi_strFromInt dtb__9); "."; (v_digitsText dtb__10); "e"; (v_expSuffix mc0)])
)
  | _ -> failwith "DT: impossible branch"
))

# 140 "Base/Data/Float.vuna"
let v_fixedForm = (fun (e : int) (ds : int B_dData_dList.t_List) -> (if (e >= 0) then ((fun intLen -> ((fun len -> (if (len <= intLen) then (String.concat "" [(v_digitsText ds); (v_zerosText (intLen - len)); "."]) else (String.concat "" [(v_digitsText ((B_dData_dList.v_take intLen) ds)); "."; (v_digitsText ((B_dData_dList.v_drop intLen) ds))]))) (v_dsLen ds))) (e + 1)) else (String.concat "" ["0."; (v_zerosText ((0 - e) - 1)); (v_digitsText ds)])))

# 151 "Base/Data/Float.vuna"
let v_floatRender = (fun (x : float) -> (if (x <> x) then "nan" else ((fun inf -> (if (x = inf) then "inf" else (if (x = (0.0 -. inf)) then "-inf" else (if (x = 0.0) then (if ((1.0 /. x) < 0.0) then "-0." else "0.") else ((fun neg -> ((fun a -> ((fun p -> ((fun e0 -> ((fun m0 -> ((fun dp -> ((fun d13 -> ((fun raw -> ((fun ed -> ((fun e -> ((fun ds -> ((fun body -> (if neg then ("-" ^ body) else body)) (if (if (e < (0 - 4)) then true else (e >= 12)) then ((v_expForm e) ds) else ((v_fixedForm e) ds)))) (B_dData_dPair.v_secondOf ed))) (B_dData_dPair.v_firstOf ed))) (if (d13 >= 5) then (match (v_carryRev (B_dData_dList.v_reverse raw)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> { B_dData_dPair.f_Pair_first = e0; B_dData_dPair.f_Pair_second = (v_trimZeros (B_dData_dList.v_reverse dtb__11)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (e0 + 1); B_dData_dPair.f_Pair_second = (v_trimZeros (B_dData_dList.C_List__x58__x58_ (1, ((B_dData_dList.v_map (fun (_u : int) -> 0)) ((B_dData_dList.v_range 0) 11))))) }
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = e0; B_dData_dPair.f_Pair_second = (v_trimZeros raw) }))) (B_dData_dPair.v_secondOf dp))) (v_floatToInt (B_dData_dPair.v_firstOf dp)))) (((B_dData_dList.v_foldl (fun (q : (float, int B_dData_dList.t_List) B_dData_dPair.t_Pair) (i : int) -> ((v_digStep q) i))) { B_dData_dPair.f_Pair_first = m0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) ((B_dData_dList.v_range 0) 12)))) (B_dData_dPair.v_secondOf p))) (B_dData_dPair.v_firstOf p))) (((B_dData_dList.v_foldl (fun (q : (int, float) B_dData_dPair.t_Pair) (i : int) -> ((v_normStep q) i))) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = a }) ((B_dData_dList.v_range 0) 700)))) (if neg then (0.0 -. x) else x))) (x < 0.0)))))) (1.0 /. 0.0))))

# 46 "Base/Data/Float.vuna"
let v_Show_uFloat = (B_dTrait_dShow.C_Show_Show ((fun x -> (v_floatRender x))))
