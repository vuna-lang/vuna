open Vuna_runtime
# 21 "Vuna/Compiler/Core/Eval.vuna"
let rec v_lookupEnv = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__0)) else ((v_lookupEnv (mc0 - 1)) dtb__1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Core/Eval.vuna"
let v_evalFuelMax = 1000000

# 68 "Vuna/Compiler/Core/Eval.vuna"
let v_evalAlt = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : Core_dTerm.t_CaseAlt) -> (match mc1 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__2; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__3; Core_dTerm.f_CaseAlt_caseAltBody = dtb__4 } -> { Core_dTerm.f_VCaseAlt_vCaseAltName = dtb__2; Core_dTerm.f_VCaseAlt_vCaseAltBinders = (Core_dTerm.v_binderPairs dtb__3); Core_dTerm.f_VCaseAlt_vCaseAltClosure = { Core_dTerm.f_Closure_closureEnv = mc0; Core_dTerm.f_Closure_closureBody = dtb__4 } }
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Core/Eval.vuna"
let[@tail_mod_cons] rec v_evalAlts = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (B_dData_dList.C_List__x58__x58_ (((v_evalAlt mc0) dtb__5), ((v_evalAlts mc0) dtb__6)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Core/Eval.vuna"
let v_catchAllEnv = (fun (alt : Core_dTerm.t_VCaseAlt) (scrut : Core_dTerm.t_Value) (env : Core_dTerm.t_Value B_dData_dList.t_List) -> (match (alt).Core_dTerm.f_VCaseAlt_vCaseAltBinders with
  | B_dData_dList.C_List_Nil -> env
  | _ -> (B_dData_dList.C_List__x58__x58_ (scrut, env))
))

# 131 "Vuna/Compiler/Core/Eval.vuna"
let v_evalIf = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VBool (dtb__7) -> (if dtb__7 then mc1 else mc2)
  | _ -> (Core_dTerm.C_Value_VIf (mc0, mc1, mc2))
))

# 135 "Vuna/Compiler/Core/Eval.vuna"
let v_spineAppend = (fun (mc0 : Core_dTerm.t_Neutral) (mc1 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__8, dtb__9) -> (Core_dTerm.C_Neutral_NGlobal (dtb__8, ((B_dData_dList.v_append dtb__9) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil)))))
  | Core_dTerm.C_Neutral_NVar (dtb__10, dtb__11, dtb__12) -> (Core_dTerm.C_Neutral_NVar (dtb__10, dtb__11, ((B_dData_dList.v_append dtb__12) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Core/Eval.vuna"
let v_asInt = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VInt (dtb__13) -> (B_dData_dMaybe.C_Maybe_Just (dtb__13))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 227 "Vuna/Compiler/Core/Eval.vuna"
let v_natMax = 4611686018427387903

# 230 "Vuna/Compiler/Core/Eval.vuna"
let v_natClamp = (fun (n : int) -> (if (n <= 0) then 0 else (if (n >= v_natMax) then v_natMax else n)))

# 233 "Vuna/Compiler/Core/Eval.vuna"
let v_natSatAdd = (fun (a : int) (b : int) -> (if (a > (v_natMax - b)) then v_natMax else (a + b)))

# 236 "Vuna/Compiler/Core/Eval.vuna"
let v_natSatMul = (fun (a : int) (b : int) -> (if (if (a <= 0) then true else (b <= 0)) then 0 else (if (a > (if b = 0 then failwith "division by zero" else v_natMax / b)) then v_natMax else (a * b))))

# 239 "Vuna/Compiler/Core/Eval.vuna"
let v_natTruncSub = (fun (a : int) (b : int) -> (if (a <= b) then 0 else (a - b)))

# 242 "Vuna/Compiler/Core/Eval.vuna"
let rec v_natValueGo = (fun (n : int) (acc : Core_dTerm.t_Value) -> (if (n <= 0) then acc else ((v_natValueGo (n - 1)) (Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ (acc, B_dData_dList.C_List_Nil)))))))

# 245 "Vuna/Compiler/Core/Eval.vuna"
let v_natValue = (fun (n : int) -> ((v_natValueGo (v_natClamp n)) (Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 251 "Vuna/Compiler/Core/Eval.vuna"
let v_natChainLimit = 65536

# 255 "Vuna/Compiler/Core/Eval.vuna"
let v_natValueMaybe = (fun (n : int) -> (if ((v_natClamp n) > v_natChainLimit) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_natValue (v_natClamp n))))))

# 258 "Vuna/Compiler/Core/Eval.vuna"
let rec v_natValueToInt = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__14, dtb__15) -> ((v_natCtorInt dtb__14) dtb__15)
  | Core_dTerm.C_Value_VInt (dtb__16) -> (B_dData_dMaybe.C_Maybe_Just (dtb__16))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 263 "Vuna/Compiler/Core/Eval.vuna"
and v_natCtorInt = (fun (c : string) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (c = Base_dIntrinsics.v_natZeroCtor) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut2 = args in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | B_dData_dList.C_List_Nil -> (match (v_natValueToInt dtb__17) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> (B_dData_dMaybe.C_Maybe_Just (((v_natSatAdd dtb__19) 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 279 "Vuna/Compiler/Core/Eval.vuna"
let v_asNat = (fun (v : Core_dTerm.t_Value) -> (v_natValueToInt v))

# 335 "Vuna/Compiler/Core/Eval.vuna"
let rec v_floatMantissaGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : bool) (mc2 : int) (mc3 : int) (mc4 : int) (mc5 : bool) (mc6 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if (dtb__20 = 46) then (((((((v_floatMantissaGo dtb__21) false) mc2) mc3) mc4) mc5) mc6) else (if (if (dtb__20 >= 48) then (dtb__20 <= 57) else false) then (if (if (B_dData_dBool.v_not mc5) then (dtb__20 = 48) else false) then (if mc1 then (((((((v_floatMantissaGo dtb__21) true) mc2) mc3) mc4) false) mc6) else (((((((v_floatMantissaGo dtb__21) false) mc2) (mc3 + 1)) mc4) false) mc6)) else (if (mc4 < 18) then (if mc1 then (((((((v_floatMantissaGo dtb__21) true) ((mc2 * 10) + (dtb__20 - 48))) mc3) (mc4 + 1)) true) mc6) else (((((((v_floatMantissaGo dtb__21) false) ((mc2 * 10) + (dtb__20 - 48))) (mc3 + 1)) (mc4 + 1)) true) mc6)) else (if mc1 then (((((((v_floatMantissaGo dtb__21) true) mc2) mc3) mc4) true) (mc6 + 1)) else (((((((v_floatMantissaGo dtb__21) false) mc2) (mc3 + 1)) mc4) true) (mc6 + 1))))) else (((((((v_floatMantissaGo dtb__21) mc1) mc2) mc3) mc4) mc5) mc6)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (mc3 - mc6) }
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Core/Eval.vuna"
let v_floatMantissaOf = (fun (cs : int B_dData_dList.t_List) -> (((((((v_floatMantissaGo cs) true) 0) 0) 0) false) 0))

# 370 "Vuna/Compiler/Core/Eval.vuna"
let rec v_charsAre = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (if (dtb__22 = dtb__24) then ((v_charsAre dtb__23) dtb__25) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Core/Eval.vuna"
let rec v_digitsOfChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (if (if (dtb__26 >= 48) then (dtb__26 <= 57) else false) then ((v_digitsOfChars dtb__27) ((mc1 * 10) + (dtb__26 - 48))) else ((v_digitsOfChars dtb__27) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Core/Eval.vuna"
let v_expOfChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (if (dtb__28 = 45) then (0 - ((v_digitsOfChars dtb__29) 0)) else (if (dtb__28 = 43) then ((v_digitsOfChars dtb__29) 0) else ((v_digitsOfChars mc0) 0)))
  | _ -> ((v_digitsOfChars mc0) 0)
))

# 319 "Vuna/Compiler/Core/Eval.vuna"
let rec v_floatSplitExpGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (if (if (dtb__30 = 101) then true else (dtb__30 = 69)) then { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = (v_expOfChars dtb__31) } else ((v_floatSplitExpGo dtb__31) (B_dData_dList.C_List__x58__x58_ (dtb__30, mc1))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Core/Eval.vuna"
let v_floatSplitExp = (fun (cs : int B_dData_dList.t_List) -> ((v_floatSplitExpGo cs) B_dData_dList.C_List_Nil))

# 382 "Vuna/Compiler/Core/Eval.vuna"
let rec v_pow10Of = (fun (n : int) -> (if (n <= 0) then 1 else (if (n > 18) then 1000000000000000000 else ((v_pow10Of (n - 1)) * 10))))

# 360 "Vuna/Compiler/Core/Eval.vuna"
let rec v_pow10Float = (fun (n : int) -> (if (n <= 0) then 1.0 else (if (n <= 18) then (float_of_int (v_pow10Of n)) else ((float_of_int (v_pow10Of 18)) *. (v_pow10Float (n - 18))))))

# 366 "Vuna/Compiler/Core/Eval.vuna"
let v_scaleFloatPow10 = (fun (k : int) (x : float) -> (if (k = 0) then x else (if (k > 0) then (x *. (v_pow10Float k)) else (x /. (v_pow10Float (0 - k))))))

# 300 "Vuna/Compiler/Core/Eval.vuna"
let v_floatMagOfChars = (fun (cs : int B_dData_dList.t_List) -> (if ((v_charsAre cs) (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (97, (B_dData_dList.C_List__x58__x58_ (110, B_dData_dList.C_List_Nil))))))) then (0.0 /. 0.0) else (if ((v_charsAre cs) (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (102, (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (116, (B_dData_dList.C_List__x58__x58_ (121, B_dData_dList.C_List_Nil))))))))))))))))) then (1.0 /. 0.0) else (if ((v_charsAre cs) (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (102, B_dData_dList.C_List_Nil))))))) then (1.0 /. 0.0) else (let p = (v_floatSplitExp cs) in (let q = (v_floatMantissaOf (B_dData_dPair.v_firstOf p)) in (let k = ((B_dData_dPair.v_secondOf p) - (B_dData_dPair.v_secondOf q)) in ((v_scaleFloatPow10 k) (float_of_int (B_dData_dPair.v_firstOf q))))))))))

# 292 "Vuna/Compiler/Core/Eval.vuna"
let v_floatOfRaw = (fun (raw : string) -> (let nd_uscrut1 = (B_dData_dList.dtp_unpack raw) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = 45) then ((0.0 -. 1.0) *. (v_floatMagOfChars dtb__33)) else (if (dtb__32 = 43) then (v_floatMagOfChars dtb__33) else (v_floatMagOfChars nd_uscrut1)))
  | _ -> (v_floatMagOfChars nd_uscrut1)
)))

# 387 "Vuna/Compiler/Core/Eval.vuna"
let v_showFloatOf = (fun (x : float) -> (B_dData_dFloat.v_floatRender x))

# 390 "Vuna/Compiler/Core/Eval.vuna"
let v_asFloat = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VFloat (dtb__34) -> (B_dData_dMaybe.C_Maybe_Just (dtb__34))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 394 "Vuna/Compiler/Core/Eval.vuna"
let v_floatPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (float) -> float) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (match dtb__36 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb__35) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VFloat ((mc1 dtb__37)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 401 "Vuna/Compiler/Core/Eval.vuna"
let v_floatPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (float) -> (float) -> float) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb__38) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (match (v_asFloat dtb__40) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VFloat (((mc1 dtb__42) dtb__43)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 411 "Vuna/Compiler/Core/Eval.vuna"
let v_floatBool2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (float) -> (float) -> bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb__44) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> (match (v_asFloat dtb__46) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool (((mc1 dtb__48) dtb__49)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 421 "Vuna/Compiler/Core/Eval.vuna"
let v_asStr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VStr (dtb__50) -> (B_dData_dMaybe.C_Maybe_Just (dtb__50))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 425 "Vuna/Compiler/Core/Eval.vuna"
let v_asBool = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VBool (dtb__51) -> (B_dData_dMaybe.C_Maybe_Just (dtb__51))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 429 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> (int) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__52) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (match (v_asInt dtb__54) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dMaybe.C_Maybe_Just (((mc1 dtb__56) dtb__57)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 442 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim2Div = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (match dtb__59 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (match dtb__61 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__58) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> (match (v_asInt dtb__60) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> (if (dtb__63 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt ((if dtb__63 = 0 then failwith "division by zero" else dtb__62 / dtb__63))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 452 "Vuna/Compiler/Core/Eval.vuna"
let v_boolPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (bool) -> (bool) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__67 with
  | B_dData_dList.C_List_Nil -> (match (v_asBool dtb__64) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (match (v_asBool dtb__66) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (B_dData_dMaybe.C_Maybe_Just (((mc1 dtb__68) dtb__69)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 463 "Vuna/Compiler/Core/Eval.vuna"
let v_primConst = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (mc1))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 467 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (string) -> (string) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__71 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__73 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__70) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (match (v_asStr dtb__72) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (B_dData_dMaybe.C_Maybe_Just (((mc1 dtb__74) dtb__75)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 477 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__76) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (B_dData_dMaybe.C_Maybe_Just ((mc1 dtb__78)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 484 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__80 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb__79) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> (mc1 dtb__81)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 491 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> (int) -> Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__83 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match dtb__85 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb__82) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (match (v_asNat dtb__84) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> ((mc1 dtb__86) dtb__87)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 501 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim2Div = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (match dtb__89 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__91 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb__88) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (match (v_asNat dtb__90) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (if (dtb__93 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (v_natValueMaybe (if dtb__93 = 0 then failwith "division by zero" else dtb__92 / dtb__93)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 511 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (string) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__95 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__94) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__96) -> (B_dData_dMaybe.C_Maybe_Just ((mc1 dtb__96)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 519 "Vuna/Compiler/Core/Eval.vuna"
let v_strEq = (fun (a : string) (b : string) -> (a = b))

# 537 "Vuna/Compiler/Core/Eval.vuna"
let v_cmpInt = (fun (a : int) (b : int) -> (if (a = b) then 0 else (if (a < b) then (0 - 1) else 1)))

# 522 "Vuna/Compiler/Core/Eval.vuna"
let v_genericCmp = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VBool (dtb__97) -> (match mc1 with
  | Core_dTerm.C_Value_VBool (dtb__98) -> (B_dData_dMaybe.C_Maybe_Just ((if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb__97) dtb__98) then 0 else (if dtb__97 then 1 else (0 - 1)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VStr (dtb__99) -> (match mc1 with
  | Core_dTerm.C_Value_VStr (dtb__100) -> (B_dData_dMaybe.C_Maybe_Just ((if (dtb__99 = dtb__100) then 0 else (if (dtb__99 < dtb__100) then (0 - 1) else 1))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VInt (dtb__101) -> (match mc1 with
  | Core_dTerm.C_Value_VInt (dtb__102) -> (B_dData_dMaybe.C_Maybe_Just (((v_cmpInt dtb__101) dtb__102)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 540 "Vuna/Compiler/Core/Eval.vuna"
let v_genericPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (match dtb__104 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__106 with
  | B_dData_dList.C_List_Nil -> (match ((v_genericCmp dtb__103) dtb__105) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool ((mc1 dtb__107)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 547 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim3 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (string) -> (string) -> (string) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (match dtb__109 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match dtb__111 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (match dtb__113 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__108) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (match (v_asStr dtb__110) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> (match (v_asStr dtb__112) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (B_dData_dMaybe.C_Maybe_Just ((((mc1 dtb__114) dtb__115) dtb__116)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 564 "Vuna/Compiler/Core/Eval.vuna"
let rec v_valueEqFuel = (fun (fuel : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match a with
  | Core_dTerm.C_Value_VType (dtb__117) -> (match b with
  | Core_dTerm.C_Value_VType (dtb__118) -> (B_dData_dMaybe.C_Maybe_Just (((Core_dTerm.v_levelEq dtb__117) dtb__118)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VInt (dtb__119) -> (match b with
  | Core_dTerm.C_Value_VInt (dtb__120) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__119 = dtb__120)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VStr (dtb__121) -> (match b with
  | Core_dTerm.C_Value_VStr (dtb__122) -> (B_dData_dMaybe.C_Maybe_Just (((v_strEq dtb__121) dtb__122)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VFloat (dtb__123) -> (match b with
  | Core_dTerm.C_Value_VFloat (dtb__124) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__123 = dtb__124)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VBool (dtb__125) -> (match b with
  | Core_dTerm.C_Value_VBool (dtb__126) -> (B_dData_dMaybe.C_Maybe_Just ((((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb__125) dtb__126)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VCon (dtb__127, dtb__128) -> (match b with
  | Core_dTerm.C_Value_VCon (dtb__129, dtb__130) -> (if (dtb__127 = dtb__129) then (((v_valueListEqFuel (fuel - 1)) dtb__128) dtb__130) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VNeutral (dtb__131) -> (match b with
  | Core_dTerm.C_Value_VNeutral (dtb__132) -> (((v_neutralEqFuel (fuel - 1)) dtb__131) dtb__132)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 600 "Vuna/Compiler/Core/Eval.vuna"
and v_neutralEqFuel = (fun (mc0 : int) (mc1 : Core_dTerm.t_Neutral) (mc2 : Core_dTerm.t_Neutral) -> (match mc1 with
  | Core_dTerm.C_Neutral_NVar (dtb__133, dtb__134, dtb__135) -> (match mc2 with
  | Core_dTerm.C_Neutral_NVar (dtb__136, dtb__137, dtb__138) -> (if (if (dtb__133 = dtb__136) then (dtb__134 = dtb__137) else false) then (((v_valueListEqFuel (mc0 - 1)) dtb__135) dtb__138) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__139, dtb__140) -> (match mc2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__141, dtb__142) -> (if (dtb__139 = dtb__141) then (((v_valueListEqFuel (mc0 - 1)) dtb__140) dtb__142) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))
# 611 "Vuna/Compiler/Core/Eval.vuna"
and v_valueListEqFuel = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (let nd_uscrut9 = (((v_valueEqFuel mc0) dtb__143) dtb__145) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (if dtb__147 then (((v_valueListEqFuel mc0) dtb__144) dtb__146) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | B_dData_dList.C_List_Nil -> (match mc2 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (true))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Core/Eval.vuna"
let rec v_isHostLabel = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__148) -> (match dtb__148 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__149, dtb__150) -> (match dtb__150 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (match dtb__152 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (if (dtb__149 = Base_dIntrinsics.v_effNamedName) then (v_isHostLabel dtb__153) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (dtb__149 = Base_dIntrinsics.v_effHostOpName)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 827 "Vuna/Compiler/Core/Eval.vuna"
let rec v_strHashChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> ((v_strHashChars dtb__156) (((mc1 * 33) + dtb__155) - ((if 1024 = 0 then failwith "division by zero" else ((mc1 * 33) + dtb__155) / 1024) * 1024)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 824 "Vuna/Compiler/Core/Eval.vuna"
let v_strHashOf = (fun (s : string) -> ((v_strHashChars (B_dData_dList.dtp_unpack s)) 0))

# 845 "Vuna/Compiler/Core/Eval.vuna"
let rec v_nthByte = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (if (mc1 <= 0) then dtb__157 else ((v_nthByte dtb__158) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 842 "Vuna/Compiler/Core/Eval.vuna"
let v_strAtBytes = (fun (s : string) (i : int) -> (if (if (i < 0) then true else (i >= (String.length s))) then (0 - 1) else ((v_nthByte (B_dData_dList.dtp_unpack s)) i)))

# 832 "Vuna/Compiler/Core/Eval.vuna"
let v_atPrim = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match dtb__160 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__162 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__159) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> (match (v_asInt dtb__161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (((v_strAtBytes dtb__163) dtb__164)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 872 "Vuna/Compiler/Core/Eval.vuna"
let[@tail_mod_cons] rec v_takeBytes = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (B_dData_dList.C_List__x58__x58_ (dtb__165, ((v_takeBytes (n - 1)) dtb__166)))
  | _ -> failwith "DT: impossible branch"
)))

# 881 "Vuna/Compiler/Core/Eval.vuna"
let rec v_dropBytes = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> ((v_dropBytes (n - 1)) dtb__168)
  | _ -> failwith "DT: impossible branch"
)))

# 864 "Vuna/Compiler/Core/Eval.vuna"
let v_substringBytes = (fun (start : int) (len : int) (s : string) -> (let n = (String.length s) in (let st = (if (start < 0) then 0 else (if (start > n) then n else start)) in (let ln = (if (len < 0) then 0 else (if ((st + len) > n) then (n - st) else len)) in (B_dData_dList.dtp_pack ((v_takeBytes ln) ((v_dropBytes st) (B_dData_dList.dtp_unpack s))))))))

# 851 "Vuna/Compiler/Core/Eval.vuna"
let v_substringPrim = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (match dtb__170 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (match dtb__172 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__169) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> (match (v_asInt dtb__171) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__176) -> (match (v_asStr dtb__173) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__177) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VStr ((((v_substringBytes dtb__175) dtb__176) dtb__177)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 899 "Vuna/Compiler/Core/Eval.vuna"
let rec v_argAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__178)) else ((v_argAt (mc0 - 1)) dtb__179))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 904 "Vuna/Compiler/Core/Eval.vuna"
let v_evalProjFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VProj (v, c, tele, i, fi)) else (match v with
  | Core_dTerm.C_Value_VCon (dtb__180, dtb__181) -> (match ((v_argAt i) dtb__181) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> dtb__182
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (v, c, tele, i, fi))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VProj (v, c, tele, i, fi))
)))

# 37 "Vuna/Compiler/Core/Eval.vuna"
let rec v_evalFuel = (fun (fuel : int) (env : Core_dTerm.t_Value B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match t with
  | Core_dTerm.C_Term_TVar (dtb__183, dtb__184, dtb__185) -> (match ((v_lookupEnv dtb__184) env) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> dtb__186
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__183, dtb__184, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TMeta (dtb__187) -> (Core_dTerm.C_Value_VMeta (dtb__187, B_dData_dList.C_List_Nil))
  | Core_dTerm.C_Term_TGlobal (dtb__188) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__188, B_dData_dList.C_List_Nil))))
  | Core_dTerm.C_Term_TType (dtb__189) -> (Core_dTerm.C_Value_VType (dtb__189))
  | Core_dTerm.C_Term_TPi (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> (Core_dTerm.C_Value_VPi (dtb__190, dtb__191, dtb__192, (((v_evalFuel (fuel - 1)) env) dtb__193), { Core_dTerm.f_Closure_closureEnv = env; Core_dTerm.f_Closure_closureBody = dtb__194 }))
  | Core_dTerm.C_Term_TLam (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> (Core_dTerm.C_Value_VLam (dtb__195, dtb__196, { Core_dTerm.f_Closure_closureEnv = env; Core_dTerm.f_Closure_closureBody = dtb__199 }))
  | Core_dTerm.C_Term_TApp (dtb__200, dtb__201, dtb__202) -> (((v_applyValueFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__200)) (((v_evalFuel (fuel - 1)) env) dtb__201))
  | Core_dTerm.C_Term_TCon (dtb__203, dtb__204) -> (Core_dTerm.C_Value_VCon (dtb__203, (((v_evalArgTermsFuel (fuel - 1)) env) dtb__204)))
  | Core_dTerm.C_Term_TMk (dtb__205, dtb__206) -> (Core_dTerm.C_Value_VCon (dtb__205, (((v_evalArgTermsFuel (fuel - 1)) env) dtb__206)))
  | Core_dTerm.C_Term_TRecord (dtb__207, dtb__208) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__207, (((v_evalArgTermsFuel (fuel - 1)) env) dtb__208)))))
  | Core_dTerm.C_Term_TCase (dtb__209, dtb__210) -> (((v_evalCaseFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__209)) ((v_evalAlts env) dtb__210))
  | Core_dTerm.C_Term_TProj (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215) -> ((((((v_evalProjFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__211)) dtb__212) dtb__213) dtb__214) dtb__215)
  | Core_dTerm.C_Term_TRecUpd (dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> (((v_evalCaseFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__216)) (B_dData_dList.C_List__x58__x58_ (((v_evalAlt env) { Core_dTerm.f_CaseAlt_caseAltName = dtb__217; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__218); Core_dTerm.f_CaseAlt_caseAltBody = dtb__220 }), B_dData_dList.C_List_Nil)))
  | Core_dTerm.C_Term_TInt (dtb__221) -> (Core_dTerm.C_Value_VInt (dtb__221))
  | Core_dTerm.C_Term_TStr (dtb__222) -> (Core_dTerm.C_Value_VStr (dtb__222))
  | Core_dTerm.C_Term_TFloat (dtb__223) -> (Core_dTerm.C_Value_VFloat ((v_floatOfRaw dtb__223)))
  | Core_dTerm.C_Term_TBool (dtb__224) -> (Core_dTerm.C_Value_VBool (dtb__224))
  | Core_dTerm.C_Term_TIf (dtb__225, dtb__226, dtb__227) -> (((v_evalIf (((v_evalFuel (fuel - 1)) env) dtb__225)) (((v_evalFuel (fuel - 1)) env) dtb__226)) (((v_evalFuel (fuel - 1)) env) dtb__227))
  | _ -> failwith "DT: impossible branch"
)))
# 80 "Vuna/Compiler/Core/Eval.vuna"
and v_evalArgTermsFuel = (fun (fuel : int) (env : Core_dTerm.t_Value B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match dtb__228 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (B_dData_dList.C_List__x58__x58_ ((((v_evalFuel v_evalFuelMax) env) dtb__230), (((v_evalArgTermsFuel (fuel - 1)) env) dtb__229)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
# 94 "Vuna/Compiler/Core/Eval.vuna"
and v_evalCaseFuel = (fun (fuel : int) (scrut : Core_dTerm.t_Value) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match scrut with
  | Core_dTerm.C_Value_VCon (dtb__232, dtb__233) -> ((((v_applyCaseAltFuel (fuel - 1)) dtb__232) dtb__233) alts)
  | _ -> (Core_dTerm.C_Value_VCase (scrut, alts))
)))
# 106 "Vuna/Compiler/Core/Eval.vuna"
and v_applyCaseAltFuel = (fun (fuel : int) (c : string) (args : Core_dTerm.t_Value B_dData_dList.t_List) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match alts with
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Value_VCase ((Core_dTerm.C_Value_VCon (c, args)), B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (if ((dtb__234).Core_dTerm.f_VCaseAlt_vCaseAltName = c) then (match (dtb__234).Core_dTerm.f_VCaseAlt_vCaseAltClosure with
  | { Core_dTerm.f_Closure_closureEnv = dtb__236; Core_dTerm.f_Closure_closureBody = dtb__237 } -> (((v_evalFuel v_evalFuelMax) ((B_dData_dList.v_append (B_dData_dList.v_reverse args)) dtb__236)) dtb__237)
  | _ -> failwith "DT: impossible branch"
) else (if ((dtb__234).Core_dTerm.f_VCaseAlt_vCaseAltName = "") then (match (dtb__234).Core_dTerm.f_VCaseAlt_vCaseAltClosure with
  | { Core_dTerm.f_Closure_closureEnv = dtb__238; Core_dTerm.f_Closure_closureBody = dtb__239 } -> (((v_evalFuel v_evalFuelMax) (((v_catchAllEnv dtb__234) (Core_dTerm.C_Value_VCon (c, args))) dtb__238)) dtb__239)
  | _ -> failwith "DT: impossible branch"
) else ((((v_applyCaseAltFuel (fuel - 1)) c) args) dtb__235)))
  | _ -> failwith "DT: impossible branch"
)))
# 142 "Vuna/Compiler/Core/Eval.vuna"
and v_applyValueFuel = (fun (fuel : int) (f : Core_dTerm.t_Value) (a : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (let nd_uscrut3 = f in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VMeta (dtb__240, dtb__241) -> (Core_dTerm.C_Value_VMeta (dtb__240, ((B_dData_dList.v_append dtb__241) (B_dData_dList.C_List__x58__x58_ (a, B_dData_dList.C_List_Nil)))))
  | Core_dTerm.C_Value_VNeutral (dtb__242) -> (match dtb__242 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__243, dtb__244) -> (match dtb__244 with
  | B_dData_dList.C_List__x58__x58_ (dtb__245, dtb__246) -> (match dtb__246 with
  | B_dData_dList.C_List_Nil -> (if (dtb__243 = Base_dIntrinsics.v_primEraseName) then (((v_applyValueFuel (fuel - 1)) dtb__245) a) else (Core_dTerm.C_Value_VNeutral (((v_spineAppend (Core_dTerm.C_Neutral_NGlobal (dtb__243, (B_dData_dList.C_List__x58__x58_ (dtb__245, B_dData_dList.C_List_Nil))))) a))))
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__242) a)))
)
  | B_dData_dList.C_List_Nil -> (if (dtb__243 = Base_dIntrinsics.v_primEraseName) then a else (Core_dTerm.C_Value_VNeutral (((v_spineAppend (Core_dTerm.C_Neutral_NGlobal (dtb__243, B_dData_dList.C_List_Nil))) a))))
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__242) a)))
)
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__242) a)))
)
  | Core_dTerm.C_Value_VLam (dtb__247, dtb__248, dtb__249) -> (match dtb__249 with
  | { Core_dTerm.f_Closure_closureEnv = dtb__250; Core_dTerm.f_Closure_closureBody = dtb__251 } -> (((v_evalFuel (fuel - 1)) (B_dData_dList.C_List__x58__x58_ (a, dtb__250))) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VApp (f, a))
))))

# 25 "Vuna/Compiler/Core/Eval.vuna"
let v_eval = (fun (env : Core_dTerm.t_Value B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (let _u = (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.reduce") 1) in (((v_evalFuel v_evalFuelMax) env) t)))

# 77 "Vuna/Compiler/Core/Eval.vuna"
let v_evalArgTerms = (fun (env : Core_dTerm.t_Value B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_evalArgTermsFuel ((B_dData_dList.v_length args) + 1)) env) args))

# 91 "Vuna/Compiler/Core/Eval.vuna"
let v_evalCase = (fun (scrut : Core_dTerm.t_Value) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (((v_evalCaseFuel ((B_dData_dList.v_length alts) + 1)) scrut) alts))

# 103 "Vuna/Compiler/Core/Eval.vuna"
let v_applyCaseAlt = (fun (c : string) (args : Core_dTerm.t_Value B_dData_dList.t_List) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((v_applyCaseAltFuel ((B_dData_dList.v_length alts) + 1)) c) args) alts))

# 139 "Vuna/Compiler/Core/Eval.vuna"
let v_applyValue = (fun (f : Core_dTerm.t_Value) (a : Core_dTerm.t_Value) -> (((v_applyValueFuel 128) f) a))

# 157 "Vuna/Compiler/Core/Eval.vuna"
let v_applyClosure = (fun (mc0 : Core_dTerm.t_Closure) (mc1 : Core_dTerm.t_Value) -> (match mc0 with
  | { Core_dTerm.f_Closure_closureEnv = dtb__252; Core_dTerm.f_Closure_closureBody = dtb__253 } -> ((v_eval (B_dData_dList.C_List__x58__x58_ (mc1, dtb__252))) dtb__253)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Core/Eval.vuna"
let rec v_applySpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> ((v_applySpine ((v_applyValue mc0) dtb__254)) dtb__255)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 796 "Vuna/Compiler/Core/Eval.vuna"
let v_obsReduce = (fun (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (g = Base_dIntrinsics.v_obsLevelIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsCounterIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsMarkIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSpanBeginIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSpanEndIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSampleStartIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSampleStopIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSpanIntrinsicName) then (let nd_uscrut2 = sp in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (match dtb__257 with
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (match dtb__259 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (B_dData_dMaybe.C_Maybe_Just (((v_applyValue dtb__260) (Core_dTerm.C_Value_VInt (0)))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)) else (if (g = Base_dIntrinsics.v_obsSpanLabIntrinsicName) then (let nd_uscrut2 = sp in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match dtb__263 with
  | B_dData_dList.C_List__x58__x58_ (dtb__264, dtb__265) -> (match dtb__265 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (match dtb__267 with
  | B_dData_dList.C_List__x58__x58_ (dtb__268, dtb__269) -> (B_dData_dMaybe.C_Maybe_Just (((v_applyValue dtb__268) (Core_dTerm.C_Value_VInt (0)))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)) else B_dData_dMaybe.C_Maybe_Nothing))))))))))

# 169 "Vuna/Compiler/Core/Eval.vuna"
let rec v_force = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then v else (match v with
  | Core_dTerm.C_Value_VMeta (dtb__270, dtb__271) -> (match ((Core_dTerm.v_solsLookup dtb__270) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> ((((v_force defs) sols) (fuel - 1)) ((v_applySpine dtb__272) dtb__271))
  | B_dData_dMaybe.C_Maybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VProj (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (let b2 = ((((v_force defs) sols) (fuel - 1)) dtb__273) in (match b2 with
  | Core_dTerm.C_Value_VCon (dtb__278, dtb__279) -> (match ((v_argAt dtb__276) dtb__279) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__280) -> ((((v_force defs) sols) (fuel - 1)) dtb__280)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (b2, dtb__274, dtb__275, dtb__276, dtb__277))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VProj (b2, dtb__274, dtb__275, dtb__276, dtb__277))
))
  | Core_dTerm.C_Value_VCase (dtb__281, dtb__282) -> (let s2 = ((((v_force defs) sols) (fuel - 1)) dtb__281) in (match s2 with
  | Core_dTerm.C_Value_VCon (dtb__283, dtb__284) -> (match dtb__282 with
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Value_VCase (s2, B_dData_dList.C_List_Nil))
  | _ -> ((((v_force defs) sols) (fuel - 1)) (((v_applyCaseAlt dtb__283) dtb__284) dtb__282))
)
  | _ -> (Core_dTerm.C_Value_VCase (s2, dtb__282))
))
  | Core_dTerm.C_Value_VApp (dtb__285, dtb__286) -> (let f2 = ((((v_force defs) sols) (fuel - 1)) dtb__285) in (match f2 with
  | Core_dTerm.C_Value_VLam (dtb__287, dtb__288, dtb__289) -> ((((v_force defs) sols) (fuel - 1)) ((v_applyClosure dtb__289) dtb__286))
  | Core_dTerm.C_Value_VMeta (dtb__290, dtb__291) -> ((((v_force defs) sols) (fuel - 1)) (Core_dTerm.C_Value_VMeta (dtb__290, ((B_dData_dList.v_append dtb__291) (B_dData_dList.C_List__x58__x58_ (dtb__286, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__292) -> ((((v_force defs) sols) (fuel - 1)) (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__292) dtb__286))))
  | _ -> (Core_dTerm.C_Value_VApp (f2, dtb__286))
))
  | Core_dTerm.C_Value_VNeutral (dtb__293) -> (match dtb__293 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__294, dtb__295) -> (match ((Core_dTerm.v_defLookup dtb__294) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__296) -> (let _u = (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.delta") 1) in ((((v_force defs) sols) (fuel - 1)) ((v_applySpine ((v_eval B_dData_dList.C_List_Nil) dtb__296)) dtb__295)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_primReduce defs) sols) (fuel - 1)) dtb__294) dtb__295) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> ((((v_force defs) sols) (fuel - 1)) dtb__297)
  | B_dData_dMaybe.C_Maybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
)))
# 642 "Vuna/Compiler/Core/Eval.vuna"
and v_rowRemReduce = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (e : Core_dTerm.t_Value) (r : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (v_isHostLabel e) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut5 = ((((v_force defs) sols) (fuel - 1)) r) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VCon (dtb__298, dtb__299) -> (match dtb__299 with
  | B_dData_dList.C_List__x58__x58_ (dtb__300, dtb__301) -> (match dtb__301 with
  | B_dData_dList.C_List__x58__x58_ (dtb__302, dtb__303) -> (if (dtb__298 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut14 = (((v_valueEqFuel (fuel - 1)) e) dtb__300) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (if dtb__304 then (B_dData_dMaybe.C_Maybe_Just (dtb__302)) else (match (((((v_rowRemReduce defs) sols) (fuel - 1)) e) dtb__302) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__305) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb__298, (B_dData_dList.C_List__x58__x58_ (dtb__300, (B_dData_dList.C_List__x58__x58_ (dtb__305, B_dData_dList.C_List_Nil))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (if (dtb__298 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)))) else B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> (if (dtb__298 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)))) else B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))))
# 667 "Vuna/Compiler/Core/Eval.vuna"
and v_appendReduce = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((v_force defs) sols) (fuel - 1)) a) with
  | Core_dTerm.C_Value_VCon (dtb__306, dtb__307) -> (if (dtb__306 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (((((v_force defs) sols) (fuel - 1)) b))) else (if (dtb__306 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut7 = dtb__307 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__308, dtb__309) -> (match dtb__309 with
  | B_dData_dList.C_List__x58__x58_ (dtb__310, dtb__311) -> (match ((((v_force defs) sols) (fuel - 1)) b) with
  | Core_dTerm.C_Value_VCon (dtb__312, dtb__313) -> (if (dtb__312 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb__306, (B_dData_dList.C_List__x58__x58_ (dtb__308, (B_dData_dList.C_List__x58__x58_ (dtb__310, B_dData_dList.C_List_Nil)))))))) else (match (((((v_appendReduce defs) sols) (fuel - 1)) dtb__310) b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__314) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb__306, (B_dData_dList.C_List__x58__x58_ (dtb__308, (B_dData_dList.C_List__x58__x58_ (dtb__314, B_dData_dList.C_List_Nil))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 693 "Vuna/Compiler/Core/Eval.vuna"
and v_primReduce = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (g = Base_dIntrinsics.v_effRowRemName) then (let nd_uscrut5 = sp in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__315, dtb__316) -> (match dtb__316 with
  | B_dData_dList.C_List__x58__x58_ (dtb__317, dtb__318) -> (((((v_rowRemReduce defs) sols) (fuel - 1)) dtb__315) dtb__317)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (g = Base_dIntrinsics.v_effRowAppendName) then (let nd_uscrut5 = sp in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__319, dtb__320) -> (match dtb__320 with
  | B_dData_dList.C_List__x58__x58_ (dtb__321, dtb__322) -> (((((v_appendReduce defs) sols) (fuel - 1)) dtb__319) dtb__321)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (match (Base_dIntrinsics.v_findIntrinsic g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__323) -> (match (dtb__323).Base_dIntrinsics.f_Intrinsic_intrinsicOp with
  | Base_dIntrinsics.C_IntrinsicOp_OpAdd -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VInt ((a + b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpSub -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VInt ((a - b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpMul -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VInt ((a * b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpDiv -> (v_intPrim2Div sp)
  | Base_dIntrinsics.C_IntrinsicOp_OpEqInt -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VBool ((a = b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNeqInt -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VBool ((B_dData_dBool.v_not (a = b))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpLtInt -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VBool ((a < b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpLeInt -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VBool ((a <= b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpGtInt -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VBool ((a > b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpGeInt -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VBool ((a >= b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpEqStr -> ((v_strPrim2 sp) (fun (a : string) (b : string) -> (Core_dTerm.C_Value_VBool (((v_strEq a) b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNeqStr -> ((v_strPrim2 sp) (fun (a : string) (b : string) -> (Core_dTerm.C_Value_VBool ((B_dData_dBool.v_not ((v_strEq a) b))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpLtValue -> ((v_genericPrim2 sp) (fun (o : int) -> (o < 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpLeValue -> ((v_genericPrim2 sp) (fun (o : int) -> (o <= 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGtValue -> ((v_genericPrim2 sp) (fun (o : int) -> (o > 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGeValue -> ((v_genericPrim2 sp) (fun (o : int) -> (o >= 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpConcat -> ((v_strPrim2 sp) (fun (a : string) (b : string) -> (Core_dTerm.C_Value_VStr ((a ^ b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpAnd -> ((v_boolPrim2 sp) (fun (a : bool) (b : bool) -> (Core_dTerm.C_Value_VBool ((if a then b else false)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpOr -> ((v_boolPrim2 sp) (fun (a : bool) (b : bool) -> (Core_dTerm.C_Value_VBool ((if a then true else b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrFromInt -> ((v_intPrim1 sp) (fun (n : int) -> (Core_dTerm.C_Value_VStr ((string_of_int n)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrLength -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VInt ((String.length s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrHash -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VInt ((v_strHashOf s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrDispatchId -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VInt ((Base_dIntrinsics.v_dispatchIdOf s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrAt -> (v_atPrim sp)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrSubstring -> (v_substringPrim sp)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrShow -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VStr ((Core_dTerm.v_showCoreString s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatAdd -> ((v_natPrim2 sp) (fun (a : int) (b : int) -> (v_natValueMaybe ((v_natSatAdd a) b))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatSub -> ((v_natPrim2 sp) (fun (a : int) (b : int) -> (v_natValueMaybe ((v_natTruncSub a) b))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatMul -> ((v_natPrim2 sp) (fun (a : int) (b : int) -> (v_natValueMaybe ((v_natSatMul a) b))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatDiv -> (v_natPrim2Div sp)
  | Base_dIntrinsics.C_IntrinsicOp_OpNatToInt -> ((v_natPrim1 sp) (fun (n : int) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (n))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatFromInt -> (let nd_uscrut7 = sp in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__324, dtb__325) -> (match dtb__324 with
  | Core_dTerm.C_Value_VInt (dtb__326) -> (match dtb__325 with
  | B_dData_dList.C_List_Nil -> (v_natValueMaybe dtb__326)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpAddF -> ((v_floatPrim2 sp) (fun (a : float) (b : float) -> (a +. b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpSubF -> ((v_floatPrim2 sp) (fun (a : float) (b : float) -> (a -. b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpMulF -> ((v_floatPrim2 sp) (fun (a : float) (b : float) -> (a *. b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpDivF -> ((v_floatPrim2 sp) (fun (a : float) (b : float) -> (a /. b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpEqF -> ((v_floatBool2 sp) (fun (a : float) (b : float) -> (a = b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpNeqF -> ((v_floatBool2 sp) (fun (a : float) (b : float) -> (a <> b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpLtF -> ((v_floatBool2 sp) (fun (a : float) (b : float) -> (a < b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpLeF -> ((v_floatBool2 sp) (fun (a : float) (b : float) -> (a <= b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGtF -> ((v_floatBool2 sp) (fun (a : float) (b : float) -> (a > b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGeF -> ((v_floatBool2 sp) (fun (a : float) (b : float) -> (a >= b)))
  | Base_dIntrinsics.C_IntrinsicOp_OpFloatAbs -> ((v_floatPrim1 sp) abs_float)
  | Base_dIntrinsics.C_IntrinsicOp_OpFloatSqrt -> ((v_floatPrim1 sp) sqrt)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrFromFloat -> (let nd_uscrut7 = sp in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__327, dtb__328) -> (match dtb__327 with
  | Core_dTerm.C_Value_VFloat (dtb__329) -> (match dtb__328 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VStr ((v_showFloatOf dtb__329)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpFloatFromInt -> ((v_intPrim1 sp) (fun (n : int) -> (Core_dTerm.C_Value_VFloat ((float_of_int n)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpIntFromFloat -> (let nd_uscrut7 = sp in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__330, dtb__331) -> (match dtb__330 with
  | Core_dTerm.C_Value_VFloat (dtb__332) -> (match dtb__331 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt ((int_of_float dtb__332)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrUnpack -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dIntrinsics.C_IntrinsicOp_OpStrPack -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dIntrinsics.C_IntrinsicOp_OpStrConcatMany -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dIntrinsics.C_IntrinsicOp_OpStrSubstTemplate -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dIntrinsics.C_IntrinsicOp_OpIdentity -> (let nd_uscrut7 = sp in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__333, dtb__334) -> (match dtb__334 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__333))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitAnd -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VInt ((a land b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitOr -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VInt ((a lor b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitXor -> ((v_intPrim2 sp) (fun (a : int) (b : int) -> (Core_dTerm.C_Value_VInt ((a lxor b)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitNot -> ((v_intPrim1 sp) (fun (a : int) -> (Core_dTerm.C_Value_VInt ((lnot a)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitShl -> ((v_intPrim2 sp) (fun (a : int) (n : int) -> (Core_dTerm.C_Value_VInt ((if n < 0 || n >= 63 then 0 else a lsl n)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitShr -> ((v_intPrim2 sp) (fun (a : int) (n : int) -> (Core_dTerm.C_Value_VInt ((if n < 0 || n >= 63 then 0 else a lsr n)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNone -> (match ((v_obsReduce g) sp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__335) -> (B_dData_dMaybe.C_Maybe_Just (dtb__335))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (g = Base_dIntrinsics.v_logOnIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool (false)))) else (if (g = Base_dIntrinsics.v_logEmitIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 626 "Vuna/Compiler/Core/Eval.vuna"
let v_forceLabelArgs = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (v : Core_dTerm.t_Value) -> (let nd_uscrut4 = ((((v_force defs) sols) fuel) v) in (match nd_uscrut4 with
  | Core_dTerm.C_Value_VNeutral (dtb__336) -> (match dtb__336 with
  | Core_dTerm.C_Neutral_NVar (dtb__337, dtb__338, dtb__339) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__337, dtb__338, ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> ((((v_force defs) sols) fuel) a))) dtb__339)))))
  | Core_dTerm.C_Neutral_NGlobal (dtb__340, dtb__341) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__340, ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> ((((v_force defs) sols) fuel) a))) dtb__341)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> nd_uscrut4
)))

# 916 "Vuna/Compiler/Core/Eval.vuna"
let rec v_normalizeFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then v else (if (evalFuel <= 0) then v else (match ((((v_force defs) sols) evalFuel) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__342) -> (((((v_normalizeNeutralFuel (fuel - 1)) defs) sols) evalFuel) dtb__342)
  | Core_dTerm.C_Value_VCon (dtb__343, dtb__344) -> (Core_dTerm.C_Value_VCon (dtb__343, ((B_dData_dList.v_map ((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__344)))
  | Core_dTerm.C_Value_VApp (dtb__345, dtb__346) -> (Core_dTerm.C_Value_VApp ((((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel) dtb__345), (((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel) dtb__346)))
  | Core_dTerm.C_Value_VIf (dtb__347, dtb__348, dtb__349) -> (((((((v_normalizeIfFuel (fuel - 1)) defs) sols) evalFuel) dtb__347) dtb__348) dtb__349)
  | Core_dTerm.C_Value_VCase (dtb__350, dtb__351) -> ((((((v_normalizeCaseFuel (fuel - 1)) defs) sols) evalFuel) dtb__350) dtb__351)
  | Core_dTerm.C_Value_VProj (dtb__352, dtb__353, dtb__354, dtb__355, dtb__356) -> (((((((((v_normalizeProjFuel (fuel - 1)) defs) sols) evalFuel) dtb__352) dtb__353) dtb__354) dtb__355) dtb__356)
  | dtb__357 -> dtb__357
))))
# 936 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeCaseFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (scrut : Core_dTerm.t_Value) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VCase (scrut, alts)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VCase (scrut, alts)) else (match (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) scrut) with
  | Core_dTerm.C_Value_VCon (dtb__358, dtb__359) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (((v_applyCaseAlt dtb__358) dtb__359) alts))
  | dtb__360 -> (Core_dTerm.C_Value_VCase (dtb__360, alts))
))))
# 948 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeProjFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (v : Core_dTerm.t_Value) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VProj (v, c, tele, i, fi)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VProj (v, c, tele, i, fi)) else (match (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) v) with
  | Core_dTerm.C_Value_VCon (dtb__361, dtb__362) -> (match ((v_argAt i) dtb__362) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__363)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (v, c, tele, i, fi))
  | _ -> failwith "DT: impossible branch"
)
  | dtb__364 -> (Core_dTerm.C_Value_VProj (dtb__364, c, tele, i, fi))
))))
# 962 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeNeutralFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (n : Core_dTerm.t_Neutral) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VNeutral (n)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VNeutral (n)) else (match n with
  | Core_dTerm.C_Neutral_NVar (dtb__365, dtb__366, dtb__367) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__365, dtb__366, ((B_dData_dList.v_map ((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__367)))))
  | Core_dTerm.C_Neutral_NGlobal (dtb__368, dtb__369) -> (let sp2 = ((B_dData_dList.v_map ((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__369) in (match ((Core_dTerm.v_defLookup dtb__368) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__370) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) ((v_applySpine ((v_eval B_dData_dList.C_List_Nil) dtb__370)) sp2))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_primReduce defs) sols) (evalFuel - 1)) dtb__368) sp2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__371) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__371)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__368, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
# 981 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeIfFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (c : Core_dTerm.t_Value) (th : Core_dTerm.t_Value) (el : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VIf (c, th, el)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VIf (c, th, el)) else (match (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) c) with
  | Core_dTerm.C_Value_VBool (dtb__372) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (if dtb__372 then th else el))
  | dtb__373 -> (Core_dTerm.C_Value_VIf (dtb__373, th, el))
))))

# 1000 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteFuelBound = 262144

# 1062 "Vuna/Compiler/Core/Eval.vuna"
let v_applyClosureBinder = (fun (mc0 : Core_dTerm.t_Closure) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | { Core_dTerm.f_Closure_closureEnv = dtb__374; Core_dTerm.f_Closure_closureBody = dtb__375 } -> ((v_eval ((B_dData_dList.v_append (B_dData_dList.v_reverse mc1)) dtb__374)) dtb__375)
  | _ -> failwith "DT: impossible branch"
))

# 1065 "Vuna/Compiler/Core/Eval.vuna"
let v_freshVar = (fun (name : string) (level : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil)))))

# 1056 "Vuna/Compiler/Core/Eval.vuna"
let[@tail_mod_cons] rec v_argValsAt = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__376, dtb__377) -> (match dtb__376 with
  | { B_dData_dPair.f_Pair_first = dtb__378; B_dData_dPair.f_Pair_second = dtb__379 } -> (B_dData_dList.C_List__x58__x58_ (((v_freshVar dtb__378) (mc1 + mc2)), (((v_argValsAt dtb__377) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1090 "Vuna/Compiler/Core/Eval.vuna"
let v_varIndexM = (fun (depth : int) (level : int) -> (if (level < depth) then (B_dData_dMaybe.C_Maybe_Just (((depth - level) - 1))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1093 "Vuna/Compiler/Core/Eval.vuna"
let rec v_applyTermSpine = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__380, dtb__381) -> ((v_applyTermSpine (Core_dTerm.C_Term_TApp (mc0, dtb__380, Core_dTerm.C_Rig_RigOmega))) dtb__381)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1006 "Vuna/Compiler/Core/Eval.vuna"
let rec v_quoteFuel = (fun (fuel : int) (depth : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (match v with
  | Core_dTerm.C_Value_VType (dtb__382) -> (Core_dTerm.C_Term_TType (dtb__382))
  | Core_dTerm.C_Value_VPi (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387) -> (Core_dTerm.C_Term_TPi (dtb__383, dtb__384, dtb__385, (((v_quoteFuel (fuel - 1)) depth) dtb__386), (((v_quoteFuel (fuel - 1)) (depth + 1)) ((v_applyClosure dtb__387) ((v_freshVar dtb__383) depth)))))
  | Core_dTerm.C_Value_VLam (dtb__388, dtb__389, dtb__390) -> (Core_dTerm.C_Term_TLam (dtb__388, dtb__389, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_quoteFuel (fuel - 1)) (depth + 1)) ((v_applyClosure dtb__390) ((v_freshVar dtb__388) depth)))))
  | Core_dTerm.C_Value_VNeutral (dtb__391) -> (((v_quoteNeutralFuel (fuel - 1)) depth) dtb__391)
  | Core_dTerm.C_Value_VMeta (dtb__392, dtb__393) -> ((v_applyTermSpine (Core_dTerm.C_Term_TMeta (dtb__392))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> (((v_quoteFuel (fuel - 1)) depth) a))) dtb__393))
  | Core_dTerm.C_Value_VCon (dtb__394, dtb__395) -> (Core_dTerm.C_Term_TCon (dtb__394, (((v_quoteArgValuesFuel (fuel - 1)) depth) dtb__395)))
  | Core_dTerm.C_Value_VApp (dtb__396, dtb__397) -> (Core_dTerm.C_Term_TApp ((((v_quoteFuel (fuel - 1)) depth) dtb__396), (((v_quoteFuel (fuel - 1)) depth) dtb__397), Core_dTerm.C_Rig_RigOmega))
  | Core_dTerm.C_Value_VCase (dtb__398, dtb__399) -> (Core_dTerm.C_Term_TCase ((((v_quoteFuel (fuel - 1)) depth) dtb__398), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_VCaseAlt) -> (((v_quoteCaseAltFuel (fuel - 1)) depth) alt))) dtb__399)))
  | Core_dTerm.C_Value_VProj (dtb__400, dtb__401, dtb__402, dtb__403, dtb__404) -> (Core_dTerm.C_Term_TProj ((((v_quoteFuel (fuel - 1)) depth) dtb__400), dtb__401, dtb__402, dtb__403, dtb__404))
  | Core_dTerm.C_Value_VInt (dtb__405) -> (Core_dTerm.C_Term_TInt (dtb__405))
  | Core_dTerm.C_Value_VStr (dtb__406) -> (Core_dTerm.C_Term_TStr (dtb__406))
  | Core_dTerm.C_Value_VFloat (dtb__407) -> (Core_dTerm.C_Term_TFloat ((v_showFloatOf dtb__407)))
  | Core_dTerm.C_Value_VBool (dtb__408) -> (Core_dTerm.C_Term_TBool (dtb__408))
  | Core_dTerm.C_Value_VIf (dtb__409, dtb__410, dtb__411) -> (Core_dTerm.C_Term_TIf ((((v_quoteFuel (fuel - 1)) depth) dtb__409), (((v_quoteFuel (fuel - 1)) depth) dtb__410), (((v_quoteFuel (fuel - 1)) depth) dtb__411)))
  | _ -> failwith "DT: impossible branch"
)))
# 1031 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteCaseAltFuel = (fun (fuel : int) (depth : int) (alt0 : Core_dTerm.t_VCaseAlt) -> (if (fuel <= 0) then { Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = B_dData_dList.C_List_Nil; Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) } else (match alt0 with
  | { Core_dTerm.f_VCaseAlt_vCaseAltName = dtb__412; Core_dTerm.f_VCaseAlt_vCaseAltBinders = dtb__413; Core_dTerm.f_VCaseAlt_vCaseAltClosure = dtb__414 } -> (let n = (B_dData_dList.v_length dtb__413) in (let argVals = (((v_argValsAt dtb__413) depth) 0) in (let body = (((v_quoteFuel (fuel - 1)) (depth + n)) ((v_applyClosureBinder dtb__414) argVals)) in { Core_dTerm.f_CaseAlt_caseAltName = dtb__412; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__413); Core_dTerm.f_CaseAlt_caseAltBody = body })))
  | _ -> failwith "DT: impossible branch"
)))
# 1047 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteArgValuesFuel = (fun (fuel : int) (depth : int) (vs : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match vs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__415, dtb__416) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_quoteFuel (fuel - 1)) depth) dtb__415); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (((v_quoteArgValuesFuel (fuel - 1)) depth) dtb__416)))
  | _ -> failwith "DT: impossible branch"
)))
# 1071 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteNeutralFuel = (fun (fuel : int) (depth : int) (n : Core_dTerm.t_Neutral) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (match n with
  | Core_dTerm.C_Neutral_NVar (dtb__417, dtb__418, dtb__419) -> (let idx = (match ((v_varIndexM depth) dtb__418) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__420) -> dtb__420
  | B_dData_dMaybe.C_Maybe_Nothing -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
) in ((v_applyTermSpine (Core_dTerm.C_Term_TVar (dtb__417, idx, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> (((v_quoteFuel (fuel - 1)) depth) a))) dtb__419)))
  | Core_dTerm.C_Neutral_NGlobal (dtb__421, dtb__422) -> ((v_applyTermSpine (Core_dTerm.C_Term_TGlobal (dtb__421))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> (((v_quoteFuel (fuel - 1)) depth) a))) dtb__422))
  | _ -> failwith "DT: impossible branch"
)))

# 1003 "Vuna/Compiler/Core/Eval.vuna"
let v_quote = (fun (depth : int) (v : Core_dTerm.t_Value) -> (((v_quoteFuel v_quoteFuelBound) depth) v))

# 1028 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteCaseAlt = (fun (depth : int) (alt : Core_dTerm.t_VCaseAlt) -> (((v_quoteCaseAltFuel v_quoteFuelBound) depth) alt))

# 1044 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteArgValues = (fun (depth : int) (vs : Core_dTerm.t_Value B_dData_dList.t_List) -> (((v_quoteArgValuesFuel v_quoteFuelBound) depth) vs))

# 1068 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteNeutral = (fun (depth : int) (n : Core_dTerm.t_Neutral) -> (((v_quoteNeutralFuel v_quoteFuelBound) depth) n))

# 1106 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteSolvedAt = (fun (depth : int) (v : Core_dTerm.t_Value) -> (let q = ((v_quote depth) v) in (if (Core_dTerm.v_hasNegativeVar q) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (q)))))

# 1116 "Vuna/Compiler/Core/Eval.vuna"
let v_closedSolved = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (_u : int) (m : int) -> (match ((Core_dTerm.v_metaLookupList m) sols) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__423) -> (let q = ((v_quote 0) dtb__423) in (if (if (Core_dTerm.v_hasNegativeVar q) then true else ((Core_dTerm.v_hasFreeTermVar 0) q)) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (q))))
  | _ -> failwith "DT: impossible branch"
))

# 1113 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetas = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((Core_dTerm.v_substMetas (v_closedSolved sols)) 0) t))

# 1133 "Vuna/Compiler/Core/Eval.vuna"
let v_atSolved = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (depth : int) (m : int) -> (match ((Core_dTerm.v_metaLookupList m) sols) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__424) -> ((v_quoteSolvedAt depth) dtb__424)
  | _ -> failwith "DT: impossible branch"
))

# 1126 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAt = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> (((Core_dTerm.v_substMetas (v_atSolved mc1)) mc0) mc2)
))

# 1130 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAtGo = (fun (depth : int) (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((Core_dTerm.v_substMetas (v_atSolved sols)) depth) t))

# 1139 "Vuna/Compiler/Core/Eval.vuna"
let v_isNilList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 1145 "Vuna/Compiler/Core/Eval.vuna"
let v_showValueAt = (fun (depth : int) (v : Core_dTerm.t_Value) -> (match v with
  | Core_dTerm.C_Value_VType (dtb__425) -> (if ((Core_dTerm.v_levelToInt dtb__425) = 0) then "Type" else ("Type " ^ (string_of_int (Core_dTerm.v_levelToInt dtb__425))))
  | Core_dTerm.C_Value_VNeutral (dtb__426) -> (match dtb__426 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__427, dtb__428) -> (if (v_isNilList dtb__428) then dtb__427 else (Core_dTerm.v_showTerm ((v_quote depth) v)))
  | Core_dTerm.C_Neutral_NVar (dtb__429, dtb__430, dtb__431) -> (if (v_isNilList dtb__431) then dtb__429 else (Core_dTerm.v_showTerm ((v_quote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VMeta (dtb__432, dtb__433) -> (if (v_isNilList dtb__433) then ("?" ^ (string_of_int dtb__432)) else (Core_dTerm.v_showTerm ((v_quote depth) v)))
  | Core_dTerm.C_Value_VCon (dtb__434, dtb__435) -> (match ((v_natCtorInt dtb__434) dtb__435) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__436) -> (string_of_int dtb__436)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.v_showTerm ((v_quote depth) v))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.v_showTerm ((v_quote depth) v))
))

# 1163 "Vuna/Compiler/Core/Eval.vuna"
let v_showValue = (fun (v : Core_dTerm.t_Value) -> ((v_showValueAt 0) v))

# 1169 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeFuelBound = 262144

# 1172 "Vuna/Compiler/Core/Eval.vuna"
let v_normalize = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) -> (((((v_normalizeFuel a3) a1) a2) a3) a4))

# 1175 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((((v_normalizeCaseFuel a3) a1) a2) a3) a4) a5))

# 1178 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeNeutral = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Neutral) -> (((((v_normalizeNeutralFuel a3) a1) a2) a3) a4))

# 1181 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeIf = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) (a6 : Core_dTerm.t_Value) -> (((((((v_normalizeIfFuel a3) a1) a2) a3) a4) a5) a6))

# 1196 "Vuna/Compiler/Core/Eval.vuna"
let v_tblSolved = (fun (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (depth : int) (m : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) m) sols) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__437) -> ((v_quoteSolvedAt depth) dtb__437)
  | _ -> failwith "DT: impossible branch"
))

# 1189 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAtTbl = (fun (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (depth : int) (t : Core_dTerm.t_Term) -> (((Core_dTerm.v_substMetas (v_tblSolved sols)) depth) t))

# 1193 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAtTblFuel = (fun (fuel : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (depth : int) (t : Core_dTerm.t_Term) -> ((((Core_dTerm.v_substMetasFuel fuel) (v_tblSolved sols)) depth) t))
