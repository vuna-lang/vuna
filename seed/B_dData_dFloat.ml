open Vuna_runtime
type 'a0 t_FromFloat = C_FromFloat_FromFloat of ((float) -> 'a0)

# 23 "Base/Data/Float.vuna"
let v_FromFloat_u70c61bb9501ecaf2_uFloat = (C_FromFloat_FromFloat ((fun x -> x)))

# 26 "Base/Data/Float.vuna"
let v_Eq_u018fc178ff3df1b4_uFloat = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 30 "Base/Data/Float.vuna"
let v_Ord_u5afb3bbeddafcb50_uFloat = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 37 "Base/Data/Float.vuna"
let v_Num_ub27c21f837ed69cc_uFloat = (B_dTrait_dNum.C_Num_Num ((fun x y -> (x +. y)), (fun x y -> (x -. y)), (fun x y -> (x *. y)), (fun x y -> (x /. y))))

# 44 "Base/Data/Float.vuna"
let v_Neg_uc22890dadc3767a7_uFloat = (B_dTrait_dNeg.C_Neg_Neg ((fun x -> (0.0 -. x))))

# 20 "Base/Data/Float.vuna"
let v_fromFloat = (fun _ud (x0 : float) -> (match _ud with
  | C_FromFloat_FromFloat (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Data/Float.vuna"
let v_abs = abs_float

# 56 "Base/Data/Float.vuna"
let v_sqrt = sqrt

# 60 "Base/Data/Float.vuna"
let v_intToFloat = float_of_int

# 65 "Base/Data/Float.vuna"
let v_floatToIntTrunc = int_of_float

# 69 "Base/Data/Float.vuna"
let v_floatToIntSat = (fun (x : float) -> (if (x <> x) then 0 else (if (x >= 4611686018427387903.0) then 4611686018427387903 else (if (x < (0.0 -. 4611686018427387903.0)) then ((0 - 4611686018427387903) - 1) else (v_floatToIntTrunc x)))))

# 78 "Base/Data/Float.vuna"
let v_floatToIntMaybe = (fun (x : float) -> (if (x <> x) then B_dData_dMaybe.C_Maybe_Nothing else (if (x >= 4611686018427387903.0) then B_dData_dMaybe.C_Maybe_Nothing else (if (x < (0.0 -. 4611686018427387903.0)) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_floatToIntTrunc x)))))))

# 87 "Base/Data/Float.vuna"
let v_floatToNat = (fun (x : float) -> (bi_natFromInt (v_floatToIntSat x)))

# 91 "Base/Data/Float.vuna"
let v_floatToNatMaybe = (fun (x : float) -> (if (x < 0.0) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_floatToIntMaybe x) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> (B_dData_dMaybe.C_Maybe_Just ((bi_natFromInt dtb__1)))
  | _ -> failwith "DT: impossible branch"
)))

# 101 "Base/Data/Float.vuna"
let v_isNaN = (fun (x : float) -> (x <> x))

# 105 "Base/Data/Float.vuna"
let v_isInfinite = (fun (x : float) -> ((v_abs x) = (1.0 /. 0.0)))

# 109 "Base/Data/Float.vuna"
let v_isFinite = (fun (x : float) -> (if (B_dData_dBool.v_not (v_isNaN x)) then (B_dData_dBool.v_not (v_isInfinite x)) else false))

# 116 "Base/Data/Float.vuna"
let v__uintegralLimit = 4503599627370496.0

# 120 "Base/Data/Float.vuna"
let v__unegZero = ((0.0 -. 1.0) *. 0.0)

# 124 "Base/Data/Float.vuna"
let v__ukeepZeroSign = (fun (x : float) (y : float) -> (if (if (y = 0.0) then ((1.0 /. x) < 0.0) else false) then v__unegZero else y))

# 128 "Base/Data/Float.vuna"
let v_trunc = (fun (x : float) -> (if (x <> x) then x else (if ((v_abs x) >= v__uintegralLimit) then x else ((v__ukeepZeroSign x) (v_intToFloat (v_floatToIntTrunc x))))))

# 135 "Base/Data/Float.vuna"
let v_floor = (fun (x : float) -> (if (x <> x) then x else (if ((v_abs x) >= v__uintegralLimit) then x else (let t = (v_trunc x) in ((v__ukeepZeroSign x) (if (t > x) then (t -. 1.0) else t))))))

# 147 "Base/Data/Float.vuna"
let v_ceil = (fun (x : float) -> (if (x <> x) then x else (if ((v_abs x) >= v__uintegralLimit) then x else (let t = (v_trunc x) in ((v__ukeepZeroSign x) (if (t < x) then (t +. 1.0) else t))))))

# 159 "Base/Data/Float.vuna"
let v_round = (fun (x : float) -> (if (x <> x) then x else (if ((v_abs x) >= v__uintegralLimit) then x else (let t = (v_trunc x) in (let d = (x -. t) in ((v__ukeepZeroSign x) (if (d >= 0.5) then (t +. 1.0) else (if (d <= (0.0 -. 0.5)) then (t -. 1.0) else t))))))))

# 172 "Base/Data/Float.vuna"
let v_floorToInt = (fun (x : float) -> (v_floatToIntMaybe (v_floor x)))

# 176 "Base/Data/Float.vuna"
let v_ceilToInt = (fun (x : float) -> (v_floatToIntMaybe (v_ceil x)))

# 180 "Base/Data/Float.vuna"
let v_roundToInt = (fun (x : float) -> (v_floatToIntMaybe (v_round x)))

# 188 "Base/Data/Float.vuna"
let v_normStep = (fun (p : (int, float) B_dData_dPair.t_Pair) (_u : int) -> (let e = (B_dData_dPair.v_firstOf p) in (let m = (B_dData_dPair.v_secondOf p) in (if (m >= 10.0) then { B_dData_dPair.f_Pair_first = (e + 1); B_dData_dPair.f_Pair_second = (m /. 10.0) } else (if (m < 1.0) then { B_dData_dPair.f_Pair_first = (e - 1); B_dData_dPair.f_Pair_second = (m *. 10.0) } else p)))))

# 196 "Base/Data/Float.vuna"
let v_digStep = (fun (p : (float, int B_dData_dList.t_List) B_dData_dPair.t_Pair) (_u : int) -> (let m = (B_dData_dPair.v_firstOf p) in (let ds = (B_dData_dPair.v_secondOf p) in (let d = (v_floatToIntTrunc m) in { B_dData_dPair.f_Pair_first = ((m -. (v_intToFloat d)) *. 10.0); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ds) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil))) }))))

# 205 "Base/Data/Float.vuna"
let rec v_carryRev = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if (dtb__2 = 9) then (match (v_carryRev dtb__3) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (0, dtb__4))))
  | _ -> failwith "DT: impossible branch"
) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((dtb__2 + 1), dtb__3)))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 216 "Base/Data/Float.vuna"
let rec v_trimZerosRev = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if (dtb__5 = 0) then (v_trimZerosRev dtb__6) else (B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 221 "Base/Data/Float.vuna"
let v_trimZeros = (fun (ds : int B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse (v_trimZerosRev (B_dData_dList.v_reverse ds))) with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))
  | dtb__7 -> dtb__7
))

# 228 "Base/Data/Float.vuna"
let rec v_dsLen = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (1 + (v_dsLen dtb__9))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 233 "Base/Data/Float.vuna"
let v_digitsText = (fun (ds : int B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (acc : string) (d : int) -> (acc ^ (string_of_int d)))) "") ds))

# 237 "Base/Data/Float.vuna"
let v_zerosText = (fun (n : int) -> (v_digitsText ((B_dData_dList.v_map (fun (_u : int) -> 0)) ((B_dData_dList.v_range 0) n))))

# 241 "Base/Data/Float.vuna"
let v_expSuffix = (fun (e : int) -> (let n = (if (e < 0) then (0 - e) else e) in (let sign = (if (e < 0) then "-" else "+") in (sign ^ (if (n < 10) then ("0" ^ (string_of_int n)) else (string_of_int n))))))

# 249 "Base/Data/Float.vuna"
let v_expForm = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> "0e+00"
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__11 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [(string_of_int dtb__10); "e"; (v_expSuffix mc0)])
  | _ -> (String.concat "" [(string_of_int dtb__10); "."; (v_digitsText dtb__11); "e"; (v_expSuffix mc0)])
)
  | _ -> failwith "DT: impossible branch"
))

# 257 "Base/Data/Float.vuna"
let v_fixedForm = (fun (e : int) (ds : int B_dData_dList.t_List) -> (if (e >= 0) then (let intLen = (e + 1) in (let len = (v_dsLen ds) in (if (len <= intLen) then (String.concat "" [(v_digitsText ds); (v_zerosText (intLen - len)); "."]) else (String.concat "" [(v_digitsText ((B_dData_dList.v_take intLen) ds)); "."; (v_digitsText ((B_dData_dList.v_drop intLen) ds))])))) else (String.concat "" ["0."; (v_zerosText ((0 - e) - 1)); (v_digitsText ds)])))

# 268 "Base/Data/Float.vuna"
let v_floatRender = (fun (x : float) -> (if (x <> x) then "nan" else (let inf = (1.0 /. 0.0) in (if (x = inf) then "inf" else (if (x = (0.0 -. inf)) then "-inf" else (if (x = 0.0) then (if ((1.0 /. x) < 0.0) then "-0." else "0.") else (let neg = (x < 0.0) in (let a = (if neg then (0.0 -. x) else x) in (let p = (((B_dData_dList.v_foldl (fun (q : (int, float) B_dData_dPair.t_Pair) (i : int) -> ((v_normStep q) i))) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = a }) ((B_dData_dList.v_range 0) 700)) in (let e0 = (B_dData_dPair.v_firstOf p) in (let m0 = (B_dData_dPair.v_secondOf p) in (let dp = (((B_dData_dList.v_foldl (fun (q : (float, int B_dData_dList.t_List) B_dData_dPair.t_Pair) (i : int) -> ((v_digStep q) i))) { B_dData_dPair.f_Pair_first = m0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) ((B_dData_dList.v_range 0) 12)) in (let d13 = (v_floatToIntTrunc (B_dData_dPair.v_firstOf dp)) in (let raw = (B_dData_dPair.v_secondOf dp) in (let ed = (if (d13 >= 5) then (match (v_carryRev (B_dData_dList.v_reverse raw)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> { B_dData_dPair.f_Pair_first = e0; B_dData_dPair.f_Pair_second = (v_trimZeros (B_dData_dList.v_reverse dtb__12)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (e0 + 1); B_dData_dPair.f_Pair_second = (v_trimZeros (B_dData_dList.C_List__x58__x58_ (1, ((B_dData_dList.v_map (fun (_u : int) -> 0)) ((B_dData_dList.v_range 0) 11))))) }
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = e0; B_dData_dPair.f_Pair_second = (v_trimZeros raw) }) in (let e = (B_dData_dPair.v_firstOf ed) in (let ds = (B_dData_dPair.v_secondOf ed) in (let body = (if (if (e < (0 - 4)) then true else (e >= 12)) then ((v_expForm e) ds) else ((v_fixedForm e) ds)) in (if neg then ("-" ^ body) else body)))))))))))))))))))

# 47 "Base/Data/Float.vuna"
let v_Show_u0077d73cf424e521_uFloat = (B_dTrait_dShow.C_Show_Show ((fun x -> (v_floatRender x))))
