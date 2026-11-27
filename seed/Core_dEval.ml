open Vuna_runtime
# 21 "Vuna/Compiler/Core/Eval.vuna"
let rec v_lookupEnv = (fun (dtb_u_u1 : int) (dtb_u_u2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (if (dtb_u_u1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3)) else ((v_lookupEnv (dtb_u_u1 - 1)) dtb_u_u4))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Core/Eval.vuna"
let v_evalFuelMax = 1000000

# 68 "Vuna/Compiler/Core/Eval.vuna"
let v_evalAlt = (fun (dtb_u_u5 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u6 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u6 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u7; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u8; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u9 } -> { Core_dTerm.f_VCaseAlt_vCaseAltName = dtb_u_u7; Core_dTerm.f_VCaseAlt_vCaseAltBinders = (Core_dTerm.v_binderPairs dtb_u_u8); Core_dTerm.f_VCaseAlt_vCaseAltClosure = { Core_dTerm.f_Closure_closureEnv = dtb_u_u5; Core_dTerm.f_Closure_closureBody = dtb_u_u9 } }
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Core/Eval.vuna"
let[@tail_mod_cons] rec v_evalAlts = (fun (dtb_u_u10 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u11 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u11 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u13) -> (B_dData_dList.C_List__x58__x58_ (((v_evalAlt dtb_u_u10) dtb_u_u12), ((v_evalAlts dtb_u_u10) dtb_u_u13)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Core/Eval.vuna"
let v_catchAllEnv = (fun (dtb_u_u14 : Core_dTerm.t_VCaseAlt) (dtb_u_u15 : Core_dTerm.t_Value) (dtb_u_u16 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match (dtb_u_u14).Core_dTerm.f_VCaseAlt_vCaseAltBinders with
  | B_dData_dList.C_List_Nil -> dtb_u_u16
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u16))
))

# 131 "Vuna/Compiler/Core/Eval.vuna"
let v_evalIf = (fun (dtb_u_u17 : Core_dTerm.t_Value) (dtb_u_u18 : Core_dTerm.t_Value) (dtb_u_u19 : Core_dTerm.t_Value) -> (match dtb_u_u17 with
  | Core_dTerm.C_Value_VBool (dtb_u_u20) -> (if dtb_u_u20 then dtb_u_u18 else dtb_u_u19)
  | _ -> (Core_dTerm.C_Value_VIf (dtb_u_u17, dtb_u_u18, dtb_u_u19))
))

# 135 "Vuna/Compiler/Core/Eval.vuna"
let v_spineAppend = (fun (dtb_u_u21 : Core_dTerm.t_Neutral) (dtb_u_u22 : Core_dTerm.t_Value) -> (match dtb_u_u21 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u23, dtb_u_u24) -> (Core_dTerm.C_Neutral_NGlobal (dtb_u_u23, ((B_dData_dList.v_append dtb_u_u24) (B_dData_dList.C_List__x58__x58_ (dtb_u_u22, B_dData_dList.C_List_Nil)))))
  | Core_dTerm.C_Neutral_NVar (dtb_u_u25, dtb_u_u26, dtb_u_u27) -> (Core_dTerm.C_Neutral_NVar (dtb_u_u25, dtb_u_u26, ((B_dData_dList.v_append dtb_u_u27) (B_dData_dList.C_List__x58__x58_ (dtb_u_u22, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Core/Eval.vuna"
let v_asInt = (fun (dtb_u_u28 : Core_dTerm.t_Value) -> (match dtb_u_u28 with
  | Core_dTerm.C_Value_VInt (dtb_u_u29) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u29))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 227 "Vuna/Compiler/Core/Eval.vuna"
let v_natMax = 4611686018427387903

# 230 "Vuna/Compiler/Core/Eval.vuna"
let v_natClamp = (fun (dtb_u_u30 : int) -> (if (dtb_u_u30 <= 0) then 0 else (if (dtb_u_u30 >= v_natMax) then v_natMax else dtb_u_u30)))

# 233 "Vuna/Compiler/Core/Eval.vuna"
let v_natSatAdd = (fun (dtb_u_u31 : int) (dtb_u_u32 : int) -> (if (dtb_u_u31 > (v_natMax - dtb_u_u32)) then v_natMax else (dtb_u_u31 + dtb_u_u32)))

# 236 "Vuna/Compiler/Core/Eval.vuna"
let v_natSatMul = (fun (dtb_u_u33 : int) (dtb_u_u34 : int) -> (if (if (dtb_u_u33 <= 0) then true else (dtb_u_u34 <= 0)) then 0 else (if (dtb_u_u33 > (if dtb_u_u34 = 0 then failwith "division by zero" else v_natMax / dtb_u_u34)) then v_natMax else (dtb_u_u33 * dtb_u_u34))))

# 239 "Vuna/Compiler/Core/Eval.vuna"
let v_natTruncSub = (fun (dtb_u_u35 : int) (dtb_u_u36 : int) -> (if (dtb_u_u35 <= dtb_u_u36) then 0 else (dtb_u_u35 - dtb_u_u36)))

# 242 "Vuna/Compiler/Core/Eval.vuna"
let rec v_natValueGo = (fun (dtb_u_u37 : int) (dtb_u_u38 : Core_dTerm.t_Value) -> (if (dtb_u_u37 <= 0) then dtb_u_u38 else ((v_natValueGo (dtb_u_u37 - 1)) (Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ (dtb_u_u38, B_dData_dList.C_List_Nil)))))))

# 245 "Vuna/Compiler/Core/Eval.vuna"
let v_natValue = (fun (dtb_u_u39 : int) -> ((v_natValueGo (v_natClamp dtb_u_u39)) (Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 251 "Vuna/Compiler/Core/Eval.vuna"
let v_natChainLimit = 65536

# 255 "Vuna/Compiler/Core/Eval.vuna"
let v_natValueMaybe = (fun (dtb_u_u40 : int) -> (if ((v_natClamp dtb_u_u40) > v_natChainLimit) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_natValue (v_natClamp dtb_u_u40))))))

# 258 "Vuna/Compiler/Core/Eval.vuna"
let rec v_natValueToInt = (fun (dtb_u_u41 : Core_dTerm.t_Value) -> (match dtb_u_u41 with
  | Core_dTerm.C_Value_VCon (dtb_u_u42, dtb_u_u43) -> ((v_natCtorInt dtb_u_u42) dtb_u_u43)
  | Core_dTerm.C_Value_VInt (dtb_u_u44) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u44))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 263 "Vuna/Compiler/Core/Eval.vuna"
and v_natCtorInt = (fun (dtb_u_u45 : string) (dtb_u_u46 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u45 = Base_dIntrinsics.v_natZeroCtor) then (match dtb_u_u46 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u45 = Base_dIntrinsics.v_natSuccCtor) then (let dtb_u_u47 = dtb_u_u46 in (match dtb_u_u47 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u48, dtb_u_u49) -> (match dtb_u_u49 with
  | B_dData_dList.C_List_Nil -> (match (v_natValueToInt dtb_u_u48) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u50) -> (B_dData_dMaybe.C_Maybe_Just (((v_natSatAdd dtb_u_u50) 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 279 "Vuna/Compiler/Core/Eval.vuna"
let v_asNat = (fun (dtb_u_u51 : Core_dTerm.t_Value) -> (v_natValueToInt dtb_u_u51))

# 334 "Vuna/Compiler/Core/Eval.vuna"
let rec v_floatMantissaGo = (fun (dtb_u_u52 : int B_dData_dList.t_List) (dtb_u_u53 : bool) (dtb_u_u54 : int) (dtb_u_u55 : int) (dtb_u_u56 : int) (dtb_u_u57 : bool) (dtb_u_u58 : int) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u59, dtb_u_u60) -> (if (dtb_u_u59 = 46) then (((((((v_floatMantissaGo dtb_u_u60) false) dtb_u_u54) dtb_u_u55) dtb_u_u56) dtb_u_u57) dtb_u_u58) else (if (if (dtb_u_u59 >= 48) then (dtb_u_u59 <= 57) else false) then (if (if (B_dData_dBool.v_not dtb_u_u57) then (dtb_u_u59 = 48) else false) then (if dtb_u_u53 then (((((((v_floatMantissaGo dtb_u_u60) true) dtb_u_u54) dtb_u_u55) dtb_u_u56) false) dtb_u_u58) else (((((((v_floatMantissaGo dtb_u_u60) false) dtb_u_u54) (dtb_u_u55 + 1)) dtb_u_u56) false) dtb_u_u58)) else (if (dtb_u_u56 < 18) then (if dtb_u_u53 then (((((((v_floatMantissaGo dtb_u_u60) true) ((dtb_u_u54 * 10) + (dtb_u_u59 - 48))) dtb_u_u55) (dtb_u_u56 + 1)) true) dtb_u_u58) else (((((((v_floatMantissaGo dtb_u_u60) false) ((dtb_u_u54 * 10) + (dtb_u_u59 - 48))) (dtb_u_u55 + 1)) (dtb_u_u56 + 1)) true) dtb_u_u58)) else (if dtb_u_u53 then (((((((v_floatMantissaGo dtb_u_u60) true) dtb_u_u54) dtb_u_u55) dtb_u_u56) true) (dtb_u_u58 + 1)) else (((((((v_floatMantissaGo dtb_u_u60) false) dtb_u_u54) (dtb_u_u55 + 1)) dtb_u_u56) true) (dtb_u_u58 + 1))))) else (((((((v_floatMantissaGo dtb_u_u60) dtb_u_u53) dtb_u_u54) dtb_u_u55) dtb_u_u56) dtb_u_u57) dtb_u_u58)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u54; B_dData_dPair.f_Pair_second = (dtb_u_u55 - dtb_u_u58) }
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Core/Eval.vuna"
let v_floatMantissaOf = (fun (dtb_u_u61 : int B_dData_dList.t_List) -> (((((((v_floatMantissaGo dtb_u_u61) true) 0) 0) 0) false) 0))

# 368 "Vuna/Compiler/Core/Eval.vuna"
let rec v_charsAre = (fun (dtb_u_u62 : int B_dData_dList.t_List) (dtb_u_u63 : int B_dData_dList.t_List) -> (match dtb_u_u62 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (match dtb_u_u63 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (if (dtb_u_u64 = dtb_u_u66) then ((v_charsAre dtb_u_u65) dtb_u_u67) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u63 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Core/Eval.vuna"
let rec v_digitsOfChars = (fun (dtb_u_u68 : int B_dData_dList.t_List) (dtb_u_u69 : int) -> (match dtb_u_u68 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u70, dtb_u_u71) -> (if (if (dtb_u_u70 >= 48) then (dtb_u_u70 <= 57) else false) then ((v_digitsOfChars dtb_u_u71) ((dtb_u_u69 * 10) + (dtb_u_u70 - 48))) else ((v_digitsOfChars dtb_u_u71) dtb_u_u69))
  | B_dData_dList.C_List_Nil -> dtb_u_u69
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Core/Eval.vuna"
let v_expOfChars = (fun (dtb_u_u72 : int B_dData_dList.t_List) -> (match dtb_u_u72 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u73, dtb_u_u74) -> (if (dtb_u_u73 = 45) then (0 - ((v_digitsOfChars dtb_u_u74) 0)) else (if (dtb_u_u73 = 43) then ((v_digitsOfChars dtb_u_u74) 0) else ((v_digitsOfChars dtb_u_u72) 0)))
  | _ -> ((v_digitsOfChars dtb_u_u72) 0)
))

# 318 "Vuna/Compiler/Core/Eval.vuna"
let rec v_floatSplitExpGo = (fun (dtb_u_u75 : int B_dData_dList.t_List) (dtb_u_u76 : int B_dData_dList.t_List) -> (match dtb_u_u75 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u78) -> (if (if (dtb_u_u77 = 101) then true else (dtb_u_u77 = 69)) then { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u76); B_dData_dPair.f_Pair_second = (v_expOfChars dtb_u_u78) } else ((v_floatSplitExpGo dtb_u_u78) (B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u76))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u76); B_dData_dPair.f_Pair_second = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Core/Eval.vuna"
let v_floatSplitExp = (fun (dtb_u_u79 : int B_dData_dList.t_List) -> ((v_floatSplitExpGo dtb_u_u79) B_dData_dList.C_List_Nil))

# 380 "Vuna/Compiler/Core/Eval.vuna"
let rec v_pow10Of = (fun (dtb_u_u80 : int) -> (if (dtb_u_u80 <= 0) then 1 else (if (dtb_u_u80 > 18) then 1000000000000000000 else ((v_pow10Of (dtb_u_u80 - 1)) * 10))))

# 358 "Vuna/Compiler/Core/Eval.vuna"
let rec v_pow10Float = (fun (dtb_u_u81 : int) -> (if (dtb_u_u81 <= 0) then 1.0 else (if (dtb_u_u81 <= 18) then (float_of_int (v_pow10Of dtb_u_u81)) else ((float_of_int (v_pow10Of 18)) *. (v_pow10Float (dtb_u_u81 - 18))))))

# 364 "Vuna/Compiler/Core/Eval.vuna"
let v_scaleFloatPow10 = (fun (dtb_u_u82 : int) (dtb_u_u83 : float) -> (if (dtb_u_u82 = 0) then dtb_u_u83 else (if (dtb_u_u82 > 0) then (dtb_u_u83 *. (v_pow10Float dtb_u_u82)) else (dtb_u_u83 /. (v_pow10Float (0 - dtb_u_u82))))))

# 299 "Vuna/Compiler/Core/Eval.vuna"
let v_floatMagOfChars = (fun (dtb_u_u84 : int B_dData_dList.t_List) -> (if ((v_charsAre dtb_u_u84) (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (97, (B_dData_dList.C_List__x58__x58_ (110, B_dData_dList.C_List_Nil))))))) then (0.0 /. 0.0) else (if ((v_charsAre dtb_u_u84) (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (102, (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (116, (B_dData_dList.C_List__x58__x58_ (121, B_dData_dList.C_List_Nil))))))))))))))))) then (1.0 /. 0.0) else (if ((v_charsAre dtb_u_u84) (B_dData_dList.C_List__x58__x58_ (105, (B_dData_dList.C_List__x58__x58_ (110, (B_dData_dList.C_List__x58__x58_ (102, B_dData_dList.C_List_Nil))))))) then (1.0 /. 0.0) else (let dtb_u_u85 = (v_floatSplitExp dtb_u_u84) in (let dtb_u_u86 = (v_floatMantissaOf (B_dData_dPair.v_firstOf dtb_u_u85)) in (let dtb_u_u87 = ((B_dData_dPair.v_secondOf dtb_u_u85) - (B_dData_dPair.v_secondOf dtb_u_u86)) in ((v_scaleFloatPow10 dtb_u_u87) (float_of_int (B_dData_dPair.v_firstOf dtb_u_u86))))))))))

# 291 "Vuna/Compiler/Core/Eval.vuna"
let v_floatOfRaw = (fun (dtb_u_u88 : string) -> (let dtb_u_u89 = (B_dData_dList.dtp_unpack dtb_u_u88) in (match dtb_u_u89 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u91) -> (if (dtb_u_u90 = 45) then ((0.0 -. 1.0) *. (v_floatMagOfChars dtb_u_u91)) else (if (dtb_u_u90 = 43) then (v_floatMagOfChars dtb_u_u91) else (v_floatMagOfChars dtb_u_u89)))
  | _ -> (v_floatMagOfChars dtb_u_u89)
)))

# 384 "Vuna/Compiler/Core/Eval.vuna"
let v_showFloatOf = (fun (dtb_u_u92 : float) -> (B_dData_dFloat.v_floatRender dtb_u_u92))

# 388 "Vuna/Compiler/Core/Eval.vuna"
let v_showFloatRaw = (fun (dtb_u_u93 : string) -> (v_showFloatOf (v_floatOfRaw dtb_u_u93)))

# 391 "Vuna/Compiler/Core/Eval.vuna"
let v_asFloat = (fun (dtb_u_u94 : Core_dTerm.t_Value) -> (match dtb_u_u94 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u95) -> (B_dData_dMaybe.C_Maybe_Just ((v_floatOfRaw dtb_u_u95)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 395 "Vuna/Compiler/Core/Eval.vuna"
let v_floatPrim1 = (fun (dtb_u_u96 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u97 : (float) -> float) -> (match dtb_u_u96 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (match dtb_u_u99 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb_u_u98) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u100) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VFloat ((v_showFloatOf (dtb_u_u97 dtb_u_u100))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 402 "Vuna/Compiler/Core/Eval.vuna"
let v_floatPrim2 = (fun (dtb_u_u101 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u102 : (float) -> (float) -> float) -> (match dtb_u_u101 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u103, dtb_u_u104) -> (match dtb_u_u104 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (match dtb_u_u106 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb_u_u103) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> (match (v_asFloat dtb_u_u105) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u108) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VFloat ((v_showFloatOf ((dtb_u_u102 dtb_u_u107) dtb_u_u108))))))
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

# 412 "Vuna/Compiler/Core/Eval.vuna"
let v_floatBool2 = (fun (dtb_u_u109 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u110 : (float) -> (float) -> bool) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u111, dtb_u_u112) -> (match dtb_u_u112 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u113, dtb_u_u114) -> (match dtb_u_u114 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb_u_u111) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u115) -> (match (v_asFloat dtb_u_u113) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u116) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool (((dtb_u_u110 dtb_u_u115) dtb_u_u116)))))
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

# 422 "Vuna/Compiler/Core/Eval.vuna"
let v_asStr = (fun (dtb_u_u117 : Core_dTerm.t_Value) -> (match dtb_u_u117 with
  | Core_dTerm.C_Value_VStr (dtb_u_u118) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u118))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 426 "Vuna/Compiler/Core/Eval.vuna"
let v_asBool = (fun (dtb_u_u119 : Core_dTerm.t_Value) -> (match dtb_u_u119 with
  | Core_dTerm.C_Value_VBool (dtb_u_u120) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u120))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 430 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim2 = (fun (dtb_u_u121 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u122 : (int) -> (int) -> Core_dTerm.t_Value) -> (match dtb_u_u121 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u123, dtb_u_u124) -> (match dtb_u_u124 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u125, dtb_u_u126) -> (match dtb_u_u126 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb_u_u123) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u127) -> (match (v_asInt dtb_u_u125) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u128) -> (B_dData_dMaybe.C_Maybe_Just (((dtb_u_u122 dtb_u_u127) dtb_u_u128)))
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

# 443 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim2Div = (fun (dtb_u_u129 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u129 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u130, dtb_u_u131) -> (match dtb_u_u131 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u132, dtb_u_u133) -> (match dtb_u_u133 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb_u_u130) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u134) -> (match (v_asInt dtb_u_u132) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u135) -> (if (dtb_u_u135 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt ((if dtb_u_u135 = 0 then failwith "division by zero" else dtb_u_u134 / dtb_u_u135))))))
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

# 453 "Vuna/Compiler/Core/Eval.vuna"
let v_boolPrim2 = (fun (dtb_u_u136 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u137 : (bool) -> (bool) -> Core_dTerm.t_Value) -> (match dtb_u_u136 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u138, dtb_u_u139) -> (match dtb_u_u139 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u140, dtb_u_u141) -> (match dtb_u_u141 with
  | B_dData_dList.C_List_Nil -> (match (v_asBool dtb_u_u138) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u142) -> (match (v_asBool dtb_u_u140) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u143) -> (B_dData_dMaybe.C_Maybe_Just (((dtb_u_u137 dtb_u_u142) dtb_u_u143)))
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

# 464 "Vuna/Compiler/Core/Eval.vuna"
let v_primConst = (fun (dtb_u_u144 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u145 : Core_dTerm.t_Value) -> (match dtb_u_u144 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u145))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 468 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim2 = (fun (dtb_u_u146 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u147 : (string) -> (string) -> Core_dTerm.t_Value) -> (match dtb_u_u146 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u148, dtb_u_u149) -> (match dtb_u_u149 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u150, dtb_u_u151) -> (match dtb_u_u151 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb_u_u148) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u152) -> (match (v_asStr dtb_u_u150) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u153) -> (B_dData_dMaybe.C_Maybe_Just (((dtb_u_u147 dtb_u_u152) dtb_u_u153)))
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

# 478 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim1 = (fun (dtb_u_u154 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u155 : (int) -> Core_dTerm.t_Value) -> (match dtb_u_u154 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u156, dtb_u_u157) -> (match dtb_u_u157 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb_u_u156) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u158) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u155 dtb_u_u158)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 485 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim1 = (fun (dtb_u_u159 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u160 : (int) -> Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match dtb_u_u159 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u162) -> (match dtb_u_u162 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb_u_u161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u163) -> (dtb_u_u160 dtb_u_u163)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 492 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim2 = (fun (dtb_u_u164 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u165 : (int) -> (int) -> Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match dtb_u_u164 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u166, dtb_u_u167) -> (match dtb_u_u167 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u168, dtb_u_u169) -> (match dtb_u_u169 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb_u_u166) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u170) -> (match (v_asNat dtb_u_u168) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u171) -> ((dtb_u_u165 dtb_u_u170) dtb_u_u171)
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

# 502 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim2Div = (fun (dtb_u_u172 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u172 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u173, dtb_u_u174) -> (match dtb_u_u174 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u175, dtb_u_u176) -> (match dtb_u_u176 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb_u_u173) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u177) -> (match (v_asNat dtb_u_u175) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u178) -> (if (dtb_u_u178 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (v_natValueMaybe (if dtb_u_u178 = 0 then failwith "division by zero" else dtb_u_u177 / dtb_u_u178)))
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

# 512 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim1 = (fun (dtb_u_u179 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u180 : (string) -> Core_dTerm.t_Value) -> (match dtb_u_u179 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u182) -> (match dtb_u_u182 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb_u_u181) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u183) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u180 dtb_u_u183)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 520 "Vuna/Compiler/Core/Eval.vuna"
let v_strEq = (fun (dtb_u_u184 : string) (dtb_u_u185 : string) -> (dtb_u_u184 = dtb_u_u185))

# 538 "Vuna/Compiler/Core/Eval.vuna"
let v_cmpInt = (fun (dtb_u_u186 : int) (dtb_u_u187 : int) -> (if (dtb_u_u186 = dtb_u_u187) then 0 else (if (dtb_u_u186 < dtb_u_u187) then (0 - 1) else 1)))

# 523 "Vuna/Compiler/Core/Eval.vuna"
let v_genericCmp = (fun (dtb_u_u188 : Core_dTerm.t_Value) (dtb_u_u189 : Core_dTerm.t_Value) -> (match dtb_u_u188 with
  | Core_dTerm.C_Value_VBool (dtb_u_u190) -> (match dtb_u_u189 with
  | Core_dTerm.C_Value_VBool (dtb_u_u191) -> (B_dData_dMaybe.C_Maybe_Just ((if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb_u_u190) dtb_u_u191) then 0 else (if dtb_u_u190 then 1 else (0 - 1)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VStr (dtb_u_u192) -> (match dtb_u_u189 with
  | Core_dTerm.C_Value_VStr (dtb_u_u193) -> (B_dData_dMaybe.C_Maybe_Just ((if (dtb_u_u192 = dtb_u_u193) then 0 else (if (dtb_u_u192 < dtb_u_u193) then (0 - 1) else 1))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VInt (dtb_u_u194) -> (match dtb_u_u189 with
  | Core_dTerm.C_Value_VInt (dtb_u_u195) -> (B_dData_dMaybe.C_Maybe_Just (((v_cmpInt dtb_u_u194) dtb_u_u195)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 541 "Vuna/Compiler/Core/Eval.vuna"
let v_genericPrim2 = (fun (dtb_u_u196 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u197 : (int) -> bool) -> (match dtb_u_u196 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u198, dtb_u_u199) -> (match dtb_u_u199 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u200, dtb_u_u201) -> (match dtb_u_u201 with
  | B_dData_dList.C_List_Nil -> (match ((v_genericCmp dtb_u_u198) dtb_u_u200) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u202) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool ((dtb_u_u197 dtb_u_u202)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 548 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim3 = (fun (dtb_u_u203 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u204 : (string) -> (string) -> (string) -> Core_dTerm.t_Value) -> (match dtb_u_u203 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u205, dtb_u_u206) -> (match dtb_u_u206 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u207, dtb_u_u208) -> (match dtb_u_u208 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u209, dtb_u_u210) -> (match dtb_u_u210 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb_u_u205) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u211) -> (match (v_asStr dtb_u_u207) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u212) -> (match (v_asStr dtb_u_u209) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u213) -> (B_dData_dMaybe.C_Maybe_Just ((((dtb_u_u204 dtb_u_u211) dtb_u_u212) dtb_u_u213)))
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

# 565 "Vuna/Compiler/Core/Eval.vuna"
let rec v_valueEqFuel = (fun (dtb_u_u214 : int) (dtb_u_u215 : Core_dTerm.t_Value) (dtb_u_u216 : Core_dTerm.t_Value) -> (if (dtb_u_u214 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u215 with
  | Core_dTerm.C_Value_VType (dtb_u_u217) -> (match dtb_u_u216 with
  | Core_dTerm.C_Value_VType (dtb_u_u218) -> (B_dData_dMaybe.C_Maybe_Just (((Core_dTerm.v_levelEq dtb_u_u217) dtb_u_u218)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VInt (dtb_u_u219) -> (match dtb_u_u216 with
  | Core_dTerm.C_Value_VInt (dtb_u_u220) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u219 = dtb_u_u220)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VStr (dtb_u_u221) -> (match dtb_u_u216 with
  | Core_dTerm.C_Value_VStr (dtb_u_u222) -> (B_dData_dMaybe.C_Maybe_Just (((v_strEq dtb_u_u221) dtb_u_u222)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VFloat (dtb_u_u223) -> (match dtb_u_u216 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u224) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u223 = dtb_u_u224)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VBool (dtb_u_u225) -> (match dtb_u_u216 with
  | Core_dTerm.C_Value_VBool (dtb_u_u226) -> (B_dData_dMaybe.C_Maybe_Just ((((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb_u_u225) dtb_u_u226)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VCon (dtb_u_u227, dtb_u_u228) -> (match dtb_u_u216 with
  | Core_dTerm.C_Value_VCon (dtb_u_u229, dtb_u_u230) -> (if (dtb_u_u227 = dtb_u_u229) then (((v_valueListEqFuel (dtb_u_u214 - 1)) dtb_u_u228) dtb_u_u230) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u231) -> (match dtb_u_u216 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u232) -> (((v_neutralEqFuel (dtb_u_u214 - 1)) dtb_u_u231) dtb_u_u232)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 601 "Vuna/Compiler/Core/Eval.vuna"
and v_neutralEqFuel = (fun (dtb_u_u233 : int) (dtb_u_u234 : Core_dTerm.t_Neutral) (dtb_u_u235 : Core_dTerm.t_Neutral) -> (match dtb_u_u234 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u236, dtb_u_u237, dtb_u_u238) -> (match dtb_u_u235 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u239, dtb_u_u240, dtb_u_u241) -> (if (if (dtb_u_u236 = dtb_u_u239) then (dtb_u_u237 = dtb_u_u240) else false) then (((v_valueListEqFuel (dtb_u_u233 - 1)) dtb_u_u238) dtb_u_u241) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u242, dtb_u_u243) -> (match dtb_u_u235 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u244, dtb_u_u245) -> (if (dtb_u_u242 = dtb_u_u244) then (((v_valueListEqFuel (dtb_u_u233 - 1)) dtb_u_u243) dtb_u_u245) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))
# 612 "Vuna/Compiler/Core/Eval.vuna"
and v_valueListEqFuel = (fun (dtb_u_u246 : int) (dtb_u_u247 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u248 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u247 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u249, dtb_u_u250) -> (match dtb_u_u248 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u251, dtb_u_u252) -> (let dtb_u_u253 = (((v_valueEqFuel dtb_u_u246) dtb_u_u249) dtb_u_u251) in (match dtb_u_u253 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> (if dtb_u_u254 then (((v_valueListEqFuel dtb_u_u246) dtb_u_u250) dtb_u_u252) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u248 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (true))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Core/Eval.vuna"
let rec v_isHostLabel = (fun (dtb_u_u255 : Core_dTerm.t_Value) -> (match dtb_u_u255 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u256) -> (match dtb_u_u256 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u257, dtb_u_u258) -> (match dtb_u_u258 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u259, dtb_u_u260) -> (match dtb_u_u260 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u261, dtb_u_u262) -> (if (dtb_u_u257 = Base_dIntrinsics.v_effNamedName) then (v_isHostLabel dtb_u_u261) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (dtb_u_u257 = Base_dIntrinsics.v_effHostOpName)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 828 "Vuna/Compiler/Core/Eval.vuna"
let rec v_strHashChars = (fun (dtb_u_u263 : int B_dData_dList.t_List) (dtb_u_u264 : int) -> (match dtb_u_u263 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u265, dtb_u_u266) -> ((v_strHashChars dtb_u_u266) (((dtb_u_u264 * 33) + dtb_u_u265) - ((if 1024 = 0 then failwith "division by zero" else ((dtb_u_u264 * 33) + dtb_u_u265) / 1024) * 1024)))
  | B_dData_dList.C_List_Nil -> dtb_u_u264
  | _ -> failwith "DT: impossible branch"
))

# 825 "Vuna/Compiler/Core/Eval.vuna"
let v_strHashOf = (fun (dtb_u_u267 : string) -> ((v_strHashChars (B_dData_dList.dtp_unpack dtb_u_u267)) 0))

# 846 "Vuna/Compiler/Core/Eval.vuna"
let rec v_nthByte = (fun (dtb_u_u268 : int B_dData_dList.t_List) (dtb_u_u269 : int) -> (match dtb_u_u268 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u270, dtb_u_u271) -> (if (dtb_u_u269 <= 0) then dtb_u_u270 else ((v_nthByte dtb_u_u271) (dtb_u_u269 - 1)))
  | B_dData_dList.C_List_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 843 "Vuna/Compiler/Core/Eval.vuna"
let v_strAtBytes = (fun (dtb_u_u272 : string) (dtb_u_u273 : int) -> (if (if (dtb_u_u273 < 0) then true else (dtb_u_u273 >= (String.length dtb_u_u272))) then (0 - 1) else ((v_nthByte (B_dData_dList.dtp_unpack dtb_u_u272)) dtb_u_u273)))

# 833 "Vuna/Compiler/Core/Eval.vuna"
let v_atPrim = (fun (dtb_u_u274 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u274 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u275, dtb_u_u276) -> (match dtb_u_u276 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u277, dtb_u_u278) -> (match dtb_u_u278 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb_u_u275) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u279) -> (match (v_asInt dtb_u_u277) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u280) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (((v_strAtBytes dtb_u_u279) dtb_u_u280)))))
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

# 873 "Vuna/Compiler/Core/Eval.vuna"
let[@tail_mod_cons] rec v_takeBytes = (fun (dtb_u_u281 : int) (dtb_u_u282 : int B_dData_dList.t_List) -> (if (dtb_u_u281 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u282 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u283, dtb_u_u284) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u283, ((v_takeBytes (dtb_u_u281 - 1)) dtb_u_u284)))
  | _ -> failwith "DT: impossible branch"
)))

# 882 "Vuna/Compiler/Core/Eval.vuna"
let rec v_dropBytes = (fun (dtb_u_u285 : int) (dtb_u_u286 : int B_dData_dList.t_List) -> (if (dtb_u_u285 <= 0) then dtb_u_u286 else (match dtb_u_u286 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u287, dtb_u_u288) -> ((v_dropBytes (dtb_u_u285 - 1)) dtb_u_u288)
  | _ -> failwith "DT: impossible branch"
)))

# 865 "Vuna/Compiler/Core/Eval.vuna"
let v_substringBytes = (fun (dtb_u_u289 : int) (dtb_u_u290 : int) (dtb_u_u291 : string) -> (let dtb_u_u292 = (String.length dtb_u_u291) in (let dtb_u_u293 = (if (dtb_u_u289 < 0) then 0 else (if (dtb_u_u289 > dtb_u_u292) then dtb_u_u292 else dtb_u_u289)) in (let dtb_u_u294 = (if (dtb_u_u290 < 0) then 0 else (if ((dtb_u_u293 + dtb_u_u290) > dtb_u_u292) then (dtb_u_u292 - dtb_u_u293) else dtb_u_u290)) in (B_dData_dList.dtp_pack ((v_takeBytes dtb_u_u294) ((v_dropBytes dtb_u_u293) (B_dData_dList.dtp_unpack dtb_u_u291))))))))

# 852 "Vuna/Compiler/Core/Eval.vuna"
let v_substringPrim = (fun (dtb_u_u295 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u295 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u296, dtb_u_u297) -> (match dtb_u_u297 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u298, dtb_u_u299) -> (match dtb_u_u299 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u300, dtb_u_u301) -> (match dtb_u_u301 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb_u_u296) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u302) -> (match (v_asInt dtb_u_u298) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u303) -> (match (v_asStr dtb_u_u300) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u304) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VStr ((((v_substringBytes dtb_u_u302) dtb_u_u303) dtb_u_u304)))))
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

# 900 "Vuna/Compiler/Core/Eval.vuna"
let rec v_argAt = (fun (dtb_u_u305 : int) (dtb_u_u306 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u306 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u307, dtb_u_u308) -> (if (dtb_u_u305 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u307)) else ((v_argAt (dtb_u_u305 - 1)) dtb_u_u308))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 905 "Vuna/Compiler/Core/Eval.vuna"
let v_evalProjFuel = (fun (dtb_u_u309 : int) (dtb_u_u310 : Core_dTerm.t_Value) (dtb_u_u311 : string) (dtb_u_u312 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u313 : int) (dtb_u_u314 : int) -> (if (dtb_u_u309 <= 0) then (Core_dTerm.C_Value_VProj (dtb_u_u310, dtb_u_u311, dtb_u_u312, dtb_u_u313, dtb_u_u314)) else (match dtb_u_u310 with
  | Core_dTerm.C_Value_VCon (dtb_u_u315, dtb_u_u316) -> (match ((v_argAt dtb_u_u313) dtb_u_u316) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u317) -> dtb_u_u317
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (dtb_u_u310, dtb_u_u311, dtb_u_u312, dtb_u_u313, dtb_u_u314))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VProj (dtb_u_u310, dtb_u_u311, dtb_u_u312, dtb_u_u313, dtb_u_u314))
)))

# 37 "Vuna/Compiler/Core/Eval.vuna"
let rec v_evalFuel = (fun (dtb_u_u318 : int) (dtb_u_u319 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u320 : Core_dTerm.t_Term) -> (if (dtb_u_u318 <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match dtb_u_u320 with
  | Core_dTerm.C_Term_TVar (dtb_u_u321, dtb_u_u322, dtb_u_u323) -> (match ((v_lookupEnv dtb_u_u322) dtb_u_u319) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u324) -> dtb_u_u324
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u321, dtb_u_u322, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TMeta (dtb_u_u325) -> (Core_dTerm.C_Value_VMeta (dtb_u_u325, B_dData_dList.C_List_Nil))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u326) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u326, B_dData_dList.C_List_Nil))))
  | Core_dTerm.C_Term_TType (dtb_u_u327) -> (Core_dTerm.C_Value_VType (dtb_u_u327))
  | Core_dTerm.C_Term_TPi (dtb_u_u328, dtb_u_u329, dtb_u_u330, dtb_u_u331, dtb_u_u332) -> (Core_dTerm.C_Value_VPi (dtb_u_u328, dtb_u_u329, dtb_u_u330, (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u331), { Core_dTerm.f_Closure_closureEnv = dtb_u_u319; Core_dTerm.f_Closure_closureBody = dtb_u_u332 }))
  | Core_dTerm.C_Term_TLam (dtb_u_u333, dtb_u_u334, dtb_u_u335, dtb_u_u336, dtb_u_u337) -> (Core_dTerm.C_Value_VLam (dtb_u_u333, dtb_u_u334, { Core_dTerm.f_Closure_closureEnv = dtb_u_u319; Core_dTerm.f_Closure_closureBody = dtb_u_u337 }))
  | Core_dTerm.C_Term_TApp (dtb_u_u338, dtb_u_u339, dtb_u_u340) -> (((v_applyValueFuel (dtb_u_u318 - 1)) (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u338)) (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u339))
  | Core_dTerm.C_Term_TCon (dtb_u_u341, dtb_u_u342) -> (Core_dTerm.C_Value_VCon (dtb_u_u341, (((v_evalArgTermsFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u342)))
  | Core_dTerm.C_Term_TMk (dtb_u_u343, dtb_u_u344) -> (Core_dTerm.C_Value_VCon (dtb_u_u343, (((v_evalArgTermsFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u344)))
  | Core_dTerm.C_Term_TRecord (dtb_u_u345, dtb_u_u346) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u345, (((v_evalArgTermsFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u346)))))
  | Core_dTerm.C_Term_TCase (dtb_u_u347, dtb_u_u348) -> (((v_evalCaseFuel (dtb_u_u318 - 1)) (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u347)) ((v_evalAlts dtb_u_u319) dtb_u_u348))
  | Core_dTerm.C_Term_TProj (dtb_u_u349, dtb_u_u350, dtb_u_u351, dtb_u_u352, dtb_u_u353) -> ((((((v_evalProjFuel (dtb_u_u318 - 1)) (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u349)) dtb_u_u350) dtb_u_u351) dtb_u_u352) dtb_u_u353)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u354, dtb_u_u355, dtb_u_u356, dtb_u_u357, dtb_u_u358) -> (((v_evalCaseFuel (dtb_u_u318 - 1)) (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u354)) (B_dData_dList.C_List__x58__x58_ (((v_evalAlt dtb_u_u319) { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u355; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb_u_u356); Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u358 }), B_dData_dList.C_List_Nil)))
  | Core_dTerm.C_Term_TInt (dtb_u_u359) -> (Core_dTerm.C_Value_VInt (dtb_u_u359))
  | Core_dTerm.C_Term_TStr (dtb_u_u360) -> (Core_dTerm.C_Value_VStr (dtb_u_u360))
  | Core_dTerm.C_Term_TFloat (dtb_u_u361) -> (Core_dTerm.C_Value_VFloat ((v_showFloatRaw dtb_u_u361)))
  | Core_dTerm.C_Term_TBool (dtb_u_u362) -> (Core_dTerm.C_Value_VBool (dtb_u_u362))
  | Core_dTerm.C_Term_TIf (dtb_u_u363, dtb_u_u364, dtb_u_u365) -> (((v_evalIf (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u363)) (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u364)) (((v_evalFuel (dtb_u_u318 - 1)) dtb_u_u319) dtb_u_u365))
  | _ -> failwith "DT: impossible branch"
)))
# 80 "Vuna/Compiler/Core/Eval.vuna"
and v_evalArgTermsFuel = (fun (dtb_u_u366 : int) (dtb_u_u367 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u368 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u366 <= 0) then B_dData_dList.C_List_Nil else (let dtb_u_u369 = dtb_u_u368 in (match dtb_u_u369 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u370, dtb_u_u371) -> (match dtb_u_u370 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u372; B_dData_dPair.f_Pair_second = dtb_u_u373 } -> (B_dData_dList.C_List__x58__x58_ ((((v_evalFuel v_evalFuelMax) dtb_u_u367) dtb_u_u372), (((v_evalArgTermsFuel (dtb_u_u366 - 1)) dtb_u_u367) dtb_u_u371)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
# 94 "Vuna/Compiler/Core/Eval.vuna"
and v_evalCaseFuel = (fun (dtb_u_u374 : int) (dtb_u_u375 : Core_dTerm.t_Value) (dtb_u_u376 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (dtb_u_u374 <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match dtb_u_u375 with
  | Core_dTerm.C_Value_VCon (dtb_u_u377, dtb_u_u378) -> ((((v_applyCaseAltFuel (dtb_u_u374 - 1)) dtb_u_u377) dtb_u_u378) dtb_u_u376)
  | _ -> (Core_dTerm.C_Value_VCase (dtb_u_u375, dtb_u_u376))
)))
# 106 "Vuna/Compiler/Core/Eval.vuna"
and v_applyCaseAltFuel = (fun (dtb_u_u379 : int) (dtb_u_u380 : string) (dtb_u_u381 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u382 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (dtb_u_u379 <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match dtb_u_u382 with
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Value_VCase ((Core_dTerm.C_Value_VCon (dtb_u_u380, dtb_u_u381)), B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u383, dtb_u_u384) -> (if ((dtb_u_u383).Core_dTerm.f_VCaseAlt_vCaseAltName = dtb_u_u380) then (match (dtb_u_u383).Core_dTerm.f_VCaseAlt_vCaseAltClosure with
  | { Core_dTerm.f_Closure_closureEnv = dtb_u_u385; Core_dTerm.f_Closure_closureBody = dtb_u_u386 } -> (((v_evalFuel v_evalFuelMax) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u381)) dtb_u_u385)) dtb_u_u386)
  | _ -> failwith "DT: impossible branch"
) else (if ((dtb_u_u383).Core_dTerm.f_VCaseAlt_vCaseAltName = "") then (match (dtb_u_u383).Core_dTerm.f_VCaseAlt_vCaseAltClosure with
  | { Core_dTerm.f_Closure_closureEnv = dtb_u_u387; Core_dTerm.f_Closure_closureBody = dtb_u_u388 } -> (((v_evalFuel v_evalFuelMax) (((v_catchAllEnv dtb_u_u383) (Core_dTerm.C_Value_VCon (dtb_u_u380, dtb_u_u381))) dtb_u_u387)) dtb_u_u388)
  | _ -> failwith "DT: impossible branch"
) else ((((v_applyCaseAltFuel (dtb_u_u379 - 1)) dtb_u_u380) dtb_u_u381) dtb_u_u384)))
  | _ -> failwith "DT: impossible branch"
)))
# 142 "Vuna/Compiler/Core/Eval.vuna"
and v_applyValueFuel = (fun (dtb_u_u389 : int) (dtb_u_u390 : Core_dTerm.t_Value) (dtb_u_u391 : Core_dTerm.t_Value) -> (if (dtb_u_u389 <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (let dtb_u_u392 = dtb_u_u390 in (match dtb_u_u392 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u393, dtb_u_u394) -> (Core_dTerm.C_Value_VMeta (dtb_u_u393, ((B_dData_dList.v_append dtb_u_u394) (B_dData_dList.C_List__x58__x58_ (dtb_u_u391, B_dData_dList.C_List_Nil)))))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u395) -> (match dtb_u_u395 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u396, dtb_u_u397) -> (match dtb_u_u397 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u398, dtb_u_u399) -> (match dtb_u_u399 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u396 = Base_dIntrinsics.v_primEraseName) then (((v_applyValueFuel (dtb_u_u389 - 1)) dtb_u_u398) dtb_u_u391) else (Core_dTerm.C_Value_VNeutral (((v_spineAppend (Core_dTerm.C_Neutral_NGlobal (dtb_u_u396, (B_dData_dList.C_List__x58__x58_ (dtb_u_u398, B_dData_dList.C_List_Nil))))) dtb_u_u391))))
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb_u_u395) dtb_u_u391)))
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u396 = Base_dIntrinsics.v_primEraseName) then dtb_u_u391 else (Core_dTerm.C_Value_VNeutral (((v_spineAppend (Core_dTerm.C_Neutral_NGlobal (dtb_u_u396, B_dData_dList.C_List_Nil))) dtb_u_u391))))
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb_u_u395) dtb_u_u391)))
)
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb_u_u395) dtb_u_u391)))
)
  | Core_dTerm.C_Value_VLam (dtb_u_u400, dtb_u_u401, dtb_u_u402) -> (match dtb_u_u402 with
  | { Core_dTerm.f_Closure_closureEnv = dtb_u_u403; Core_dTerm.f_Closure_closureBody = dtb_u_u404 } -> (((v_evalFuel (dtb_u_u389 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u391, dtb_u_u403))) dtb_u_u404)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VApp (dtb_u_u390, dtb_u_u391))
))))

# 25 "Vuna/Compiler/Core/Eval.vuna"
let v_eval = (fun (dtb_u_u405 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u406 : Core_dTerm.t_Term) -> (let dtb_u_u407 = (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.reduce") 1) in (((v_evalFuel v_evalFuelMax) dtb_u_u405) dtb_u_u406)))

# 77 "Vuna/Compiler/Core/Eval.vuna"
let v_evalArgTerms = (fun (dtb_u_u408 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u409 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_evalArgTermsFuel ((B_dData_dList.v_length dtb_u_u409) + 1)) dtb_u_u408) dtb_u_u409))

# 91 "Vuna/Compiler/Core/Eval.vuna"
let v_evalCase = (fun (dtb_u_u410 : Core_dTerm.t_Value) (dtb_u_u411 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (((v_evalCaseFuel ((B_dData_dList.v_length dtb_u_u411) + 1)) dtb_u_u410) dtb_u_u411))

# 103 "Vuna/Compiler/Core/Eval.vuna"
let v_applyCaseAlt = (fun (dtb_u_u412 : string) (dtb_u_u413 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u414 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((v_applyCaseAltFuel ((B_dData_dList.v_length dtb_u_u414) + 1)) dtb_u_u412) dtb_u_u413) dtb_u_u414))

# 139 "Vuna/Compiler/Core/Eval.vuna"
let v_applyValue = (fun (dtb_u_u415 : Core_dTerm.t_Value) (dtb_u_u416 : Core_dTerm.t_Value) -> (((v_applyValueFuel 128) dtb_u_u415) dtb_u_u416))

# 157 "Vuna/Compiler/Core/Eval.vuna"
let v_applyClosure = (fun (dtb_u_u417 : Core_dTerm.t_Closure) (dtb_u_u418 : Core_dTerm.t_Value) -> (match dtb_u_u417 with
  | { Core_dTerm.f_Closure_closureEnv = dtb_u_u419; Core_dTerm.f_Closure_closureBody = dtb_u_u420 } -> ((v_eval (B_dData_dList.C_List__x58__x58_ (dtb_u_u418, dtb_u_u419))) dtb_u_u420)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Core/Eval.vuna"
let rec v_applySpine = (fun (dtb_u_u421 : Core_dTerm.t_Value) (dtb_u_u422 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u422 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u423, dtb_u_u424) -> ((v_applySpine ((v_applyValue dtb_u_u421) dtb_u_u423)) dtb_u_u424)
  | B_dData_dList.C_List_Nil -> dtb_u_u421
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Core/Eval.vuna"
let v_obsReduce = (fun (dtb_u_u425 : string) (dtb_u_u426 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u425 = Base_dIntrinsics.v_obsLevelIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsCounterIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsMarkIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsSpanBeginIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsSpanEndIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsSampleStartIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsSampleStopIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsSpanIntrinsicName) then (let dtb_u_u427 = dtb_u_u426 in (match dtb_u_u427 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u428, dtb_u_u429) -> (match dtb_u_u429 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u430, dtb_u_u431) -> (match dtb_u_u431 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u432, dtb_u_u433) -> (B_dData_dMaybe.C_Maybe_Just (((v_applyValue dtb_u_u432) (Core_dTerm.C_Value_VInt (0)))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)) else (if (dtb_u_u425 = Base_dIntrinsics.v_obsSpanLabIntrinsicName) then (let dtb_u_u434 = dtb_u_u426 in (match dtb_u_u434 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u435, dtb_u_u436) -> (match dtb_u_u436 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u437, dtb_u_u438) -> (match dtb_u_u438 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u439, dtb_u_u440) -> (match dtb_u_u440 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u441, dtb_u_u442) -> (B_dData_dMaybe.C_Maybe_Just (((v_applyValue dtb_u_u441) (Core_dTerm.C_Value_VInt (0)))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)) else B_dData_dMaybe.C_Maybe_Nothing))))))))))

# 169 "Vuna/Compiler/Core/Eval.vuna"
let rec v_force = (fun (dtb_u_u443 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u444 : Core_dTerm.t_Sols) (dtb_u_u445 : int) (dtb_u_u446 : Core_dTerm.t_Value) -> (if (dtb_u_u445 <= 0) then dtb_u_u446 else (match dtb_u_u446 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u447, dtb_u_u448) -> (match ((Core_dTerm.v_solsLookup dtb_u_u447) dtb_u_u444) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u449) -> ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) ((v_applySpine dtb_u_u449) dtb_u_u448))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u446
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VProj (dtb_u_u450, dtb_u_u451, dtb_u_u452, dtb_u_u453, dtb_u_u454) -> (let dtb_u_u455 = ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) dtb_u_u450) in (match dtb_u_u455 with
  | Core_dTerm.C_Value_VCon (dtb_u_u456, dtb_u_u457) -> (match ((v_argAt dtb_u_u453) dtb_u_u457) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u458) -> ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) dtb_u_u458)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (dtb_u_u455, dtb_u_u451, dtb_u_u452, dtb_u_u453, dtb_u_u454))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VProj (dtb_u_u455, dtb_u_u451, dtb_u_u452, dtb_u_u453, dtb_u_u454))
))
  | Core_dTerm.C_Value_VCase (dtb_u_u459, dtb_u_u460) -> (let dtb_u_u461 = ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) dtb_u_u459) in (match dtb_u_u461 with
  | Core_dTerm.C_Value_VCon (dtb_u_u462, dtb_u_u463) -> (match dtb_u_u460 with
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Value_VCase (dtb_u_u461, B_dData_dList.C_List_Nil))
  | _ -> ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) (((v_applyCaseAlt dtb_u_u462) dtb_u_u463) dtb_u_u460))
)
  | _ -> (Core_dTerm.C_Value_VCase (dtb_u_u461, dtb_u_u460))
))
  | Core_dTerm.C_Value_VApp (dtb_u_u464, dtb_u_u465) -> (let dtb_u_u466 = ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) dtb_u_u464) in (match dtb_u_u466 with
  | Core_dTerm.C_Value_VLam (dtb_u_u467, dtb_u_u468, dtb_u_u469) -> ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) ((v_applyClosure dtb_u_u469) dtb_u_u465))
  | Core_dTerm.C_Value_VMeta (dtb_u_u470, dtb_u_u471) -> ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) (Core_dTerm.C_Value_VMeta (dtb_u_u470, ((B_dData_dList.v_append dtb_u_u471) (B_dData_dList.C_List__x58__x58_ (dtb_u_u465, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u472) -> ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb_u_u472) dtb_u_u465))))
  | _ -> (Core_dTerm.C_Value_VApp (dtb_u_u466, dtb_u_u465))
))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u473) -> (match dtb_u_u473 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u474, dtb_u_u475) -> (match ((Core_dTerm.v_defLookup dtb_u_u474) dtb_u_u443) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u476) -> (let dtb_u_u477 = (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.delta") 1) in ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) ((v_applySpine ((v_eval B_dData_dList.C_List_Nil) dtb_u_u476)) dtb_u_u475)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_primReduce dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) dtb_u_u474) dtb_u_u475) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u478) -> ((((v_force dtb_u_u443) dtb_u_u444) (dtb_u_u445 - 1)) dtb_u_u478)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u446
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u446
)
  | _ -> dtb_u_u446
)))
# 643 "Vuna/Compiler/Core/Eval.vuna"
and v_rowRemReduce = (fun (dtb_u_u479 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u480 : Core_dTerm.t_Sols) (dtb_u_u481 : int) (dtb_u_u482 : Core_dTerm.t_Value) (dtb_u_u483 : Core_dTerm.t_Value) -> (if (dtb_u_u481 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (v_isHostLabel dtb_u_u482) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u484 = ((((v_force dtb_u_u479) dtb_u_u480) (dtb_u_u481 - 1)) dtb_u_u483) in (match dtb_u_u484 with
  | Core_dTerm.C_Value_VCon (dtb_u_u485, dtb_u_u486) -> (match dtb_u_u486 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u487, dtb_u_u488) -> (match dtb_u_u488 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u489, dtb_u_u490) -> (if (dtb_u_u485 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u491 = (((v_valueEqFuel (dtb_u_u481 - 1)) dtb_u_u482) dtb_u_u487) in (match dtb_u_u491 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u492) -> (if dtb_u_u492 then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u489)) else (match (((((v_rowRemReduce dtb_u_u479) dtb_u_u480) (dtb_u_u481 - 1)) dtb_u_u482) dtb_u_u489) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u493) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb_u_u485, (B_dData_dList.C_List__x58__x58_ (dtb_u_u487, (B_dData_dList.C_List__x58__x58_ (dtb_u_u493, B_dData_dList.C_List_Nil))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (if (dtb_u_u485 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)))) else B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> (if (dtb_u_u485 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)))) else B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))))
# 668 "Vuna/Compiler/Core/Eval.vuna"
and v_appendReduce = (fun (dtb_u_u494 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u495 : Core_dTerm.t_Sols) (dtb_u_u496 : int) (dtb_u_u497 : Core_dTerm.t_Value) (dtb_u_u498 : Core_dTerm.t_Value) -> (if (dtb_u_u496 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((v_force dtb_u_u494) dtb_u_u495) (dtb_u_u496 - 1)) dtb_u_u497) with
  | Core_dTerm.C_Value_VCon (dtb_u_u499, dtb_u_u500) -> (if (dtb_u_u499 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (((((v_force dtb_u_u494) dtb_u_u495) (dtb_u_u496 - 1)) dtb_u_u498))) else (if (dtb_u_u499 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u501 = dtb_u_u500 in (match dtb_u_u501 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u502, dtb_u_u503) -> (match dtb_u_u503 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u504, dtb_u_u505) -> (match ((((v_force dtb_u_u494) dtb_u_u495) (dtb_u_u496 - 1)) dtb_u_u498) with
  | Core_dTerm.C_Value_VCon (dtb_u_u506, dtb_u_u507) -> (if (dtb_u_u506 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb_u_u499, (B_dData_dList.C_List__x58__x58_ (dtb_u_u502, (B_dData_dList.C_List__x58__x58_ (dtb_u_u504, B_dData_dList.C_List_Nil)))))))) else (match (((((v_appendReduce dtb_u_u494) dtb_u_u495) (dtb_u_u496 - 1)) dtb_u_u504) dtb_u_u498) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u508) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb_u_u499, (B_dData_dList.C_List__x58__x58_ (dtb_u_u502, (B_dData_dList.C_List__x58__x58_ (dtb_u_u508, B_dData_dList.C_List_Nil))))))))
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
# 694 "Vuna/Compiler/Core/Eval.vuna"
and v_primReduce = (fun (dtb_u_u509 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u510 : Core_dTerm.t_Sols) (dtb_u_u511 : int) (dtb_u_u512 : string) (dtb_u_u513 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u511 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u512 = Base_dIntrinsics.v_effRowRemName) then (let dtb_u_u514 = dtb_u_u513 in (match dtb_u_u514 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u515, dtb_u_u516) -> (match dtb_u_u516 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u517, dtb_u_u518) -> (((((v_rowRemReduce dtb_u_u509) dtb_u_u510) (dtb_u_u511 - 1)) dtb_u_u515) dtb_u_u517)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (dtb_u_u512 = Base_dIntrinsics.v_effRowAppendName) then (let dtb_u_u519 = dtb_u_u513 in (match dtb_u_u519 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u520, dtb_u_u521) -> (match dtb_u_u521 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u522, dtb_u_u523) -> (((((v_appendReduce dtb_u_u509) dtb_u_u510) (dtb_u_u511 - 1)) dtb_u_u520) dtb_u_u522)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (match (Base_dIntrinsics.v_findIntrinsic dtb_u_u512) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u524) -> (match (dtb_u_u524).Base_dIntrinsics.f_Intrinsic_intrinsicOp with
  | Base_dIntrinsics.C_IntrinsicOp_OpAdd -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u525 : int) (dtb_u_u526 : int) -> (Core_dTerm.C_Value_VInt ((dtb_u_u525 + dtb_u_u526)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpSub -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u527 : int) (dtb_u_u528 : int) -> (Core_dTerm.C_Value_VInt ((dtb_u_u527 - dtb_u_u528)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpMul -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u529 : int) (dtb_u_u530 : int) -> (Core_dTerm.C_Value_VInt ((dtb_u_u529 * dtb_u_u530)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpDiv -> (v_intPrim2Div dtb_u_u513)
  | Base_dIntrinsics.C_IntrinsicOp_OpEqInt -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u531 : int) (dtb_u_u532 : int) -> (Core_dTerm.C_Value_VBool ((dtb_u_u531 = dtb_u_u532)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNeqInt -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u533 : int) (dtb_u_u534 : int) -> (Core_dTerm.C_Value_VBool ((B_dData_dBool.v_not (dtb_u_u533 = dtb_u_u534))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpLtInt -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u535 : int) (dtb_u_u536 : int) -> (Core_dTerm.C_Value_VBool ((dtb_u_u535 < dtb_u_u536)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpLeInt -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u537 : int) (dtb_u_u538 : int) -> (Core_dTerm.C_Value_VBool ((dtb_u_u537 <= dtb_u_u538)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpGtInt -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u539 : int) (dtb_u_u540 : int) -> (Core_dTerm.C_Value_VBool ((dtb_u_u539 > dtb_u_u540)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpGeInt -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u541 : int) (dtb_u_u542 : int) -> (Core_dTerm.C_Value_VBool ((dtb_u_u541 >= dtb_u_u542)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpEqStr -> ((v_strPrim2 dtb_u_u513) (fun (dtb_u_u543 : string) (dtb_u_u544 : string) -> (Core_dTerm.C_Value_VBool (((v_strEq dtb_u_u543) dtb_u_u544)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNeqStr -> ((v_strPrim2 dtb_u_u513) (fun (dtb_u_u545 : string) (dtb_u_u546 : string) -> (Core_dTerm.C_Value_VBool ((B_dData_dBool.v_not ((v_strEq dtb_u_u545) dtb_u_u546))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpLtValue -> ((v_genericPrim2 dtb_u_u513) (fun (dtb_u_u547 : int) -> (dtb_u_u547 < 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpLeValue -> ((v_genericPrim2 dtb_u_u513) (fun (dtb_u_u548 : int) -> (dtb_u_u548 <= 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGtValue -> ((v_genericPrim2 dtb_u_u513) (fun (dtb_u_u549 : int) -> (dtb_u_u549 > 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGeValue -> ((v_genericPrim2 dtb_u_u513) (fun (dtb_u_u550 : int) -> (dtb_u_u550 >= 0)))
  | Base_dIntrinsics.C_IntrinsicOp_OpConcat -> ((v_strPrim2 dtb_u_u513) (fun (dtb_u_u551 : string) (dtb_u_u552 : string) -> (Core_dTerm.C_Value_VStr ((dtb_u_u551 ^ dtb_u_u552)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpAnd -> ((v_boolPrim2 dtb_u_u513) (fun (dtb_u_u553 : bool) (dtb_u_u554 : bool) -> (Core_dTerm.C_Value_VBool ((if dtb_u_u553 then dtb_u_u554 else false)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpOr -> ((v_boolPrim2 dtb_u_u513) (fun (dtb_u_u555 : bool) (dtb_u_u556 : bool) -> (Core_dTerm.C_Value_VBool ((if dtb_u_u555 then true else dtb_u_u556)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrFromInt -> ((v_intPrim1 dtb_u_u513) (fun (dtb_u_u557 : int) -> (Core_dTerm.C_Value_VStr ((string_of_int dtb_u_u557)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrLength -> ((v_strPrim1 dtb_u_u513) (fun (dtb_u_u558 : string) -> (Core_dTerm.C_Value_VInt ((String.length dtb_u_u558)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrHash -> ((v_strPrim1 dtb_u_u513) (fun (dtb_u_u559 : string) -> (Core_dTerm.C_Value_VInt ((v_strHashOf dtb_u_u559)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrDispatchId -> ((v_strPrim1 dtb_u_u513) (fun (dtb_u_u560 : string) -> (Core_dTerm.C_Value_VInt ((Base_dIntrinsics.v_dispatchIdOf dtb_u_u560)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrAt -> (v_atPrim dtb_u_u513)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrSubstring -> (v_substringPrim dtb_u_u513)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrShow -> ((v_strPrim1 dtb_u_u513) (fun (dtb_u_u561 : string) -> (Core_dTerm.C_Value_VStr ((Core_dTerm.v_showCoreString dtb_u_u561)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatAdd -> ((v_natPrim2 dtb_u_u513) (fun (dtb_u_u562 : int) (dtb_u_u563 : int) -> (v_natValueMaybe ((v_natSatAdd dtb_u_u562) dtb_u_u563))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatSub -> ((v_natPrim2 dtb_u_u513) (fun (dtb_u_u564 : int) (dtb_u_u565 : int) -> (v_natValueMaybe ((v_natTruncSub dtb_u_u564) dtb_u_u565))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatMul -> ((v_natPrim2 dtb_u_u513) (fun (dtb_u_u566 : int) (dtb_u_u567 : int) -> (v_natValueMaybe ((v_natSatMul dtb_u_u566) dtb_u_u567))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatDiv -> (v_natPrim2Div dtb_u_u513)
  | Base_dIntrinsics.C_IntrinsicOp_OpNatToInt -> ((v_natPrim1 dtb_u_u513) (fun (dtb_u_u568 : int) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (dtb_u_u568))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatFromInt -> (let dtb_u_u569 = dtb_u_u513 in (match dtb_u_u569 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u570, dtb_u_u571) -> (match dtb_u_u570 with
  | Core_dTerm.C_Value_VInt (dtb_u_u572) -> (match dtb_u_u571 with
  | B_dData_dList.C_List_Nil -> (v_natValueMaybe dtb_u_u572)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpAddF -> ((v_floatPrim2 dtb_u_u513) (fun (dtb_u_u573 : float) (dtb_u_u574 : float) -> (dtb_u_u573 +. dtb_u_u574)))
  | Base_dIntrinsics.C_IntrinsicOp_OpSubF -> ((v_floatPrim2 dtb_u_u513) (fun (dtb_u_u575 : float) (dtb_u_u576 : float) -> (dtb_u_u575 -. dtb_u_u576)))
  | Base_dIntrinsics.C_IntrinsicOp_OpMulF -> ((v_floatPrim2 dtb_u_u513) (fun (dtb_u_u577 : float) (dtb_u_u578 : float) -> (dtb_u_u577 *. dtb_u_u578)))
  | Base_dIntrinsics.C_IntrinsicOp_OpDivF -> ((v_floatPrim2 dtb_u_u513) (fun (dtb_u_u579 : float) (dtb_u_u580 : float) -> (dtb_u_u579 /. dtb_u_u580)))
  | Base_dIntrinsics.C_IntrinsicOp_OpEqF -> ((v_floatBool2 dtb_u_u513) (fun (dtb_u_u581 : float) (dtb_u_u582 : float) -> (dtb_u_u581 = dtb_u_u582)))
  | Base_dIntrinsics.C_IntrinsicOp_OpNeqF -> ((v_floatBool2 dtb_u_u513) (fun (dtb_u_u583 : float) (dtb_u_u584 : float) -> (dtb_u_u583 <> dtb_u_u584)))
  | Base_dIntrinsics.C_IntrinsicOp_OpLtF -> ((v_floatBool2 dtb_u_u513) (fun (dtb_u_u585 : float) (dtb_u_u586 : float) -> (dtb_u_u585 < dtb_u_u586)))
  | Base_dIntrinsics.C_IntrinsicOp_OpLeF -> ((v_floatBool2 dtb_u_u513) (fun (dtb_u_u587 : float) (dtb_u_u588 : float) -> (dtb_u_u587 <= dtb_u_u588)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGtF -> ((v_floatBool2 dtb_u_u513) (fun (dtb_u_u589 : float) (dtb_u_u590 : float) -> (dtb_u_u589 > dtb_u_u590)))
  | Base_dIntrinsics.C_IntrinsicOp_OpGeF -> ((v_floatBool2 dtb_u_u513) (fun (dtb_u_u591 : float) (dtb_u_u592 : float) -> (dtb_u_u591 >= dtb_u_u592)))
  | Base_dIntrinsics.C_IntrinsicOp_OpFloatAbs -> ((v_floatPrim1 dtb_u_u513) abs_float)
  | Base_dIntrinsics.C_IntrinsicOp_OpFloatSqrt -> ((v_floatPrim1 dtb_u_u513) sqrt)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrFromFloat -> (let dtb_u_u593 = dtb_u_u513 in (match dtb_u_u593 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u594, dtb_u_u595) -> (match dtb_u_u594 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u596) -> (match dtb_u_u595 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VStr ((v_showFloatRaw dtb_u_u596)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpFloatFromInt -> ((v_intPrim1 dtb_u_u513) (fun (dtb_u_u597 : int) -> (Core_dTerm.C_Value_VFloat ((v_showFloatOf (float_of_int dtb_u_u597))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpIntFromFloat -> (let dtb_u_u598 = dtb_u_u513 in (match dtb_u_u598 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u599, dtb_u_u600) -> (match dtb_u_u599 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u601) -> (match dtb_u_u600 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt ((int_of_float (v_floatOfRaw dtb_u_u601))))))
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
  | Base_dIntrinsics.C_IntrinsicOp_OpIdentity -> (let dtb_u_u602 = dtb_u_u513 in (match dtb_u_u602 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u603, dtb_u_u604) -> (match dtb_u_u604 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u603))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitAnd -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u605 : int) (dtb_u_u606 : int) -> (Core_dTerm.C_Value_VInt ((dtb_u_u605 land dtb_u_u606)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitOr -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u607 : int) (dtb_u_u608 : int) -> (Core_dTerm.C_Value_VInt ((dtb_u_u607 lor dtb_u_u608)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitXor -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u609 : int) (dtb_u_u610 : int) -> (Core_dTerm.C_Value_VInt ((dtb_u_u609 lxor dtb_u_u610)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitNot -> ((v_intPrim1 dtb_u_u513) (fun (dtb_u_u611 : int) -> (Core_dTerm.C_Value_VInt ((lnot dtb_u_u611)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitShl -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u612 : int) (dtb_u_u613 : int) -> (Core_dTerm.C_Value_VInt ((if dtb_u_u613 < 0 || dtb_u_u613 >= 63 then 0 else dtb_u_u612 lsl dtb_u_u613)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpBitShr -> ((v_intPrim2 dtb_u_u513) (fun (dtb_u_u614 : int) (dtb_u_u615 : int) -> (Core_dTerm.C_Value_VInt ((if dtb_u_u615 < 0 || dtb_u_u615 >= 63 then 0 else dtb_u_u614 lsr dtb_u_u615)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNone -> (match ((v_obsReduce dtb_u_u512) dtb_u_u513) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u616) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u616))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u512 = Base_dIntrinsics.v_logOnIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool (false)))) else (if (dtb_u_u512 = Base_dIntrinsics.v_logEmitIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 627 "Vuna/Compiler/Core/Eval.vuna"
let v_forceLabelArgs = (fun (dtb_u_u617 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u618 : Core_dTerm.t_Sols) (dtb_u_u619 : int) (dtb_u_u620 : Core_dTerm.t_Value) -> (let dtb_u_u621 = ((((v_force dtb_u_u617) dtb_u_u618) dtb_u_u619) dtb_u_u620) in (match dtb_u_u621 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u622) -> (match dtb_u_u622 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u623, dtb_u_u624, dtb_u_u625) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u623, dtb_u_u624, ((B_dData_dList.v_map (fun (dtb_u_u626 : Core_dTerm.t_Value) -> ((((v_force dtb_u_u617) dtb_u_u618) dtb_u_u619) dtb_u_u626))) dtb_u_u625)))))
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u627, dtb_u_u628) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u627, ((B_dData_dList.v_map (fun (dtb_u_u629 : Core_dTerm.t_Value) -> ((((v_force dtb_u_u617) dtb_u_u618) dtb_u_u619) dtb_u_u629))) dtb_u_u628)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u621
)))

# 917 "Vuna/Compiler/Core/Eval.vuna"
let rec v_normalizeFuel = (fun (dtb_u_u630 : int) (dtb_u_u631 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u632 : Core_dTerm.t_Sols) (dtb_u_u633 : int) (dtb_u_u634 : Core_dTerm.t_Value) -> (if (dtb_u_u630 <= 0) then dtb_u_u634 else (if (dtb_u_u633 <= 0) then dtb_u_u634 else (match ((((v_force dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u634) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u635) -> (((((v_normalizeNeutralFuel (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u635)
  | Core_dTerm.C_Value_VCon (dtb_u_u636, dtb_u_u637) -> (Core_dTerm.C_Value_VCon (dtb_u_u636, ((B_dData_dList.v_map ((((v_normalizeFuel (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633)) dtb_u_u637)))
  | Core_dTerm.C_Value_VApp (dtb_u_u638, dtb_u_u639) -> (Core_dTerm.C_Value_VApp ((((((v_normalizeFuel (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u638), (((((v_normalizeFuel (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u639)))
  | Core_dTerm.C_Value_VIf (dtb_u_u640, dtb_u_u641, dtb_u_u642) -> (((((((v_normalizeIfFuel (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u640) dtb_u_u641) dtb_u_u642)
  | Core_dTerm.C_Value_VCase (dtb_u_u643, dtb_u_u644) -> ((((((v_normalizeCaseFuel (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u643) dtb_u_u644)
  | Core_dTerm.C_Value_VProj (dtb_u_u645, dtb_u_u646, dtb_u_u647, dtb_u_u648, dtb_u_u649) -> (((((((((v_normalizeProjFuel (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u645) dtb_u_u646) dtb_u_u647) dtb_u_u648) dtb_u_u649)
  | dtb_u_u650 -> dtb_u_u650
))))
# 937 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeCaseFuel = (fun (dtb_u_u651 : int) (dtb_u_u652 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u653 : Core_dTerm.t_Sols) (dtb_u_u654 : int) (dtb_u_u655 : Core_dTerm.t_Value) (dtb_u_u656 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (dtb_u_u651 <= 0) then (Core_dTerm.C_Value_VCase (dtb_u_u655, dtb_u_u656)) else (if (dtb_u_u654 <= 0) then (Core_dTerm.C_Value_VCase (dtb_u_u655, dtb_u_u656)) else (match (((((v_normalizeFuel (dtb_u_u651 - 1)) dtb_u_u652) dtb_u_u653) (dtb_u_u654 - 1)) dtb_u_u655) with
  | Core_dTerm.C_Value_VCon (dtb_u_u657, dtb_u_u658) -> (((((v_normalizeFuel (dtb_u_u651 - 1)) dtb_u_u652) dtb_u_u653) (dtb_u_u654 - 1)) (((v_applyCaseAlt dtb_u_u657) dtb_u_u658) dtb_u_u656))
  | dtb_u_u659 -> (Core_dTerm.C_Value_VCase (dtb_u_u659, dtb_u_u656))
))))
# 949 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeProjFuel = (fun (dtb_u_u660 : int) (dtb_u_u661 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u662 : Core_dTerm.t_Sols) (dtb_u_u663 : int) (dtb_u_u664 : Core_dTerm.t_Value) (dtb_u_u665 : string) (dtb_u_u666 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u667 : int) (dtb_u_u668 : int) -> (if (dtb_u_u660 <= 0) then (Core_dTerm.C_Value_VProj (dtb_u_u664, dtb_u_u665, dtb_u_u666, dtb_u_u667, dtb_u_u668)) else (if (dtb_u_u663 <= 0) then (Core_dTerm.C_Value_VProj (dtb_u_u664, dtb_u_u665, dtb_u_u666, dtb_u_u667, dtb_u_u668)) else (match (((((v_normalizeFuel (dtb_u_u660 - 1)) dtb_u_u661) dtb_u_u662) (dtb_u_u663 - 1)) dtb_u_u664) with
  | Core_dTerm.C_Value_VCon (dtb_u_u669, dtb_u_u670) -> (match ((v_argAt dtb_u_u667) dtb_u_u670) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u671) -> (((((v_normalizeFuel (dtb_u_u660 - 1)) dtb_u_u661) dtb_u_u662) (dtb_u_u663 - 1)) dtb_u_u671)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (dtb_u_u664, dtb_u_u665, dtb_u_u666, dtb_u_u667, dtb_u_u668))
  | _ -> failwith "DT: impossible branch"
)
  | dtb_u_u672 -> (Core_dTerm.C_Value_VProj (dtb_u_u672, dtb_u_u665, dtb_u_u666, dtb_u_u667, dtb_u_u668))
))))
# 963 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeNeutralFuel = (fun (dtb_u_u673 : int) (dtb_u_u674 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u675 : Core_dTerm.t_Sols) (dtb_u_u676 : int) (dtb_u_u677 : Core_dTerm.t_Neutral) -> (if (dtb_u_u673 <= 0) then (Core_dTerm.C_Value_VNeutral (dtb_u_u677)) else (if (dtb_u_u676 <= 0) then (Core_dTerm.C_Value_VNeutral (dtb_u_u677)) else (match dtb_u_u677 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u678, dtb_u_u679, dtb_u_u680) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u678, dtb_u_u679, ((B_dData_dList.v_map ((((v_normalizeFuel (dtb_u_u673 - 1)) dtb_u_u674) dtb_u_u675) dtb_u_u676)) dtb_u_u680)))))
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u681, dtb_u_u682) -> (let dtb_u_u683 = ((B_dData_dList.v_map ((((v_normalizeFuel (dtb_u_u673 - 1)) dtb_u_u674) dtb_u_u675) dtb_u_u676)) dtb_u_u682) in (match ((Core_dTerm.v_defLookup dtb_u_u681) dtb_u_u674) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u684) -> (((((v_normalizeFuel (dtb_u_u673 - 1)) dtb_u_u674) dtb_u_u675) (dtb_u_u676 - 1)) ((v_applySpine ((v_eval B_dData_dList.C_List_Nil) dtb_u_u684)) dtb_u_u683))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_primReduce dtb_u_u674) dtb_u_u675) (dtb_u_u676 - 1)) dtb_u_u681) dtb_u_u683) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u685) -> (((((v_normalizeFuel (dtb_u_u673 - 1)) dtb_u_u674) dtb_u_u675) (dtb_u_u676 - 1)) dtb_u_u685)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u681, dtb_u_u683))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
# 982 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeIfFuel = (fun (dtb_u_u686 : int) (dtb_u_u687 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u688 : Core_dTerm.t_Sols) (dtb_u_u689 : int) (dtb_u_u690 : Core_dTerm.t_Value) (dtb_u_u691 : Core_dTerm.t_Value) (dtb_u_u692 : Core_dTerm.t_Value) -> (if (dtb_u_u686 <= 0) then (Core_dTerm.C_Value_VIf (dtb_u_u690, dtb_u_u691, dtb_u_u692)) else (if (dtb_u_u689 <= 0) then (Core_dTerm.C_Value_VIf (dtb_u_u690, dtb_u_u691, dtb_u_u692)) else (match (((((v_normalizeFuel (dtb_u_u686 - 1)) dtb_u_u687) dtb_u_u688) (dtb_u_u689 - 1)) dtb_u_u690) with
  | Core_dTerm.C_Value_VBool (dtb_u_u693) -> (((((v_normalizeFuel (dtb_u_u686 - 1)) dtb_u_u687) dtb_u_u688) (dtb_u_u689 - 1)) (if dtb_u_u693 then dtb_u_u691 else dtb_u_u692))
  | dtb_u_u694 -> (Core_dTerm.C_Value_VIf (dtb_u_u694, dtb_u_u691, dtb_u_u692))
))))

# 1001 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteFuelBound = 262144

# 1063 "Vuna/Compiler/Core/Eval.vuna"
let v_applyClosureBinder = (fun (dtb_u_u695 : Core_dTerm.t_Closure) (dtb_u_u696 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u695 with
  | { Core_dTerm.f_Closure_closureEnv = dtb_u_u697; Core_dTerm.f_Closure_closureBody = dtb_u_u698 } -> ((v_eval ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u696)) dtb_u_u697)) dtb_u_u698)
  | _ -> failwith "DT: impossible branch"
))

# 1066 "Vuna/Compiler/Core/Eval.vuna"
let v_freshVar = (fun (dtb_u_u699 : string) (dtb_u_u700 : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u699, dtb_u_u700, B_dData_dList.C_List_Nil)))))

# 1057 "Vuna/Compiler/Core/Eval.vuna"
let[@tail_mod_cons] rec v_argValsAt = (fun (dtb_u_u701 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u702 : int) (dtb_u_u703 : int) -> (match dtb_u_u701 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u704, dtb_u_u705) -> (match dtb_u_u704 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u706; B_dData_dPair.f_Pair_second = dtb_u_u707 } -> (B_dData_dList.C_List__x58__x58_ (((v_freshVar dtb_u_u706) (dtb_u_u702 + dtb_u_u703)), (((v_argValsAt dtb_u_u705) dtb_u_u702) (dtb_u_u703 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1091 "Vuna/Compiler/Core/Eval.vuna"
let v_varIndexM = (fun (dtb_u_u708 : int) (dtb_u_u709 : int) -> (if (dtb_u_u709 < dtb_u_u708) then (B_dData_dMaybe.C_Maybe_Just (((dtb_u_u708 - dtb_u_u709) - 1))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1094 "Vuna/Compiler/Core/Eval.vuna"
let rec v_applyTermSpine = (fun (dtb_u_u710 : Core_dTerm.t_Term) (dtb_u_u711 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u711 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u712, dtb_u_u713) -> ((v_applyTermSpine (Core_dTerm.C_Term_TApp (dtb_u_u710, dtb_u_u712, Core_dTerm.C_Rig_RigOmega))) dtb_u_u713)
  | B_dData_dList.C_List_Nil -> dtb_u_u710
  | _ -> failwith "DT: impossible branch"
))

# 1007 "Vuna/Compiler/Core/Eval.vuna"
let rec v_quoteFuel = (fun (dtb_u_u714 : int) (dtb_u_u715 : int) (dtb_u_u716 : Core_dTerm.t_Value) -> (if (dtb_u_u714 <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (match dtb_u_u716 with
  | Core_dTerm.C_Value_VType (dtb_u_u717) -> (Core_dTerm.C_Term_TType (dtb_u_u717))
  | Core_dTerm.C_Value_VPi (dtb_u_u718, dtb_u_u719, dtb_u_u720, dtb_u_u721, dtb_u_u722) -> (Core_dTerm.C_Term_TPi (dtb_u_u718, dtb_u_u719, dtb_u_u720, (((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u721), (((v_quoteFuel (dtb_u_u714 - 1)) (dtb_u_u715 + 1)) ((v_applyClosure dtb_u_u722) ((v_freshVar dtb_u_u718) dtb_u_u715)))))
  | Core_dTerm.C_Value_VLam (dtb_u_u723, dtb_u_u724, dtb_u_u725) -> (Core_dTerm.C_Term_TLam (dtb_u_u723, dtb_u_u724, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_quoteFuel (dtb_u_u714 - 1)) (dtb_u_u715 + 1)) ((v_applyClosure dtb_u_u725) ((v_freshVar dtb_u_u723) dtb_u_u715)))))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u726) -> (((v_quoteNeutralFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u726)
  | Core_dTerm.C_Value_VMeta (dtb_u_u727, dtb_u_u728) -> ((v_applyTermSpine (Core_dTerm.C_Term_TMeta (dtb_u_u727))) ((B_dData_dList.v_map (fun (dtb_u_u729 : Core_dTerm.t_Value) -> (((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u729))) dtb_u_u728))
  | Core_dTerm.C_Value_VCon (dtb_u_u730, dtb_u_u731) -> (Core_dTerm.C_Term_TCon (dtb_u_u730, (((v_quoteArgValuesFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u731)))
  | Core_dTerm.C_Value_VApp (dtb_u_u732, dtb_u_u733) -> (Core_dTerm.C_Term_TApp ((((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u732), (((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u733), Core_dTerm.C_Rig_RigOmega))
  | Core_dTerm.C_Value_VCase (dtb_u_u734, dtb_u_u735) -> (Core_dTerm.C_Term_TCase ((((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u734), ((B_dData_dList.v_map (fun (dtb_u_u736 : Core_dTerm.t_VCaseAlt) -> (((v_quoteCaseAltFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u736))) dtb_u_u735)))
  | Core_dTerm.C_Value_VProj (dtb_u_u737, dtb_u_u738, dtb_u_u739, dtb_u_u740, dtb_u_u741) -> (Core_dTerm.C_Term_TProj ((((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u737), dtb_u_u738, dtb_u_u739, dtb_u_u740, dtb_u_u741))
  | Core_dTerm.C_Value_VInt (dtb_u_u742) -> (Core_dTerm.C_Term_TInt (dtb_u_u742))
  | Core_dTerm.C_Value_VStr (dtb_u_u743) -> (Core_dTerm.C_Term_TStr (dtb_u_u743))
  | Core_dTerm.C_Value_VFloat (dtb_u_u744) -> (Core_dTerm.C_Term_TFloat (dtb_u_u744))
  | Core_dTerm.C_Value_VBool (dtb_u_u745) -> (Core_dTerm.C_Term_TBool (dtb_u_u745))
  | Core_dTerm.C_Value_VIf (dtb_u_u746, dtb_u_u747, dtb_u_u748) -> (Core_dTerm.C_Term_TIf ((((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u746), (((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u747), (((v_quoteFuel (dtb_u_u714 - 1)) dtb_u_u715) dtb_u_u748)))
  | _ -> failwith "DT: impossible branch"
)))
# 1032 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteCaseAltFuel = (fun (dtb_u_u749 : int) (dtb_u_u750 : int) (dtb_u_u751 : Core_dTerm.t_VCaseAlt) -> (if (dtb_u_u749 <= 0) then { Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = B_dData_dList.C_List_Nil; Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) } else (match dtb_u_u751 with
  | { Core_dTerm.f_VCaseAlt_vCaseAltName = dtb_u_u752; Core_dTerm.f_VCaseAlt_vCaseAltBinders = dtb_u_u753; Core_dTerm.f_VCaseAlt_vCaseAltClosure = dtb_u_u754 } -> (let dtb_u_u755 = (B_dData_dList.v_length dtb_u_u753) in (let dtb_u_u756 = (((v_argValsAt dtb_u_u753) dtb_u_u750) 0) in (let dtb_u_u757 = (((v_quoteFuel (dtb_u_u749 - 1)) (dtb_u_u750 + dtb_u_u755)) ((v_applyClosureBinder dtb_u_u754) dtb_u_u756)) in { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u752; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb_u_u753); Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u757 })))
  | _ -> failwith "DT: impossible branch"
)))
# 1048 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteArgValuesFuel = (fun (dtb_u_u758 : int) (dtb_u_u759 : int) (dtb_u_u760 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u758 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u760 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u761, dtb_u_u762) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_quoteFuel (dtb_u_u758 - 1)) dtb_u_u759) dtb_u_u761); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (((v_quoteArgValuesFuel (dtb_u_u758 - 1)) dtb_u_u759) dtb_u_u762)))
  | _ -> failwith "DT: impossible branch"
)))
# 1072 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteNeutralFuel = (fun (dtb_u_u763 : int) (dtb_u_u764 : int) (dtb_u_u765 : Core_dTerm.t_Neutral) -> (if (dtb_u_u763 <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (match dtb_u_u765 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u766, dtb_u_u767, dtb_u_u768) -> (let dtb_u_u769 = (match ((v_varIndexM dtb_u_u764) dtb_u_u767) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u771) -> dtb_u_u771
  | B_dData_dMaybe.C_Maybe_Nothing -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
) in ((v_applyTermSpine (Core_dTerm.C_Term_TVar (dtb_u_u766, dtb_u_u769, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) ((B_dData_dList.v_map (fun (dtb_u_u770 : Core_dTerm.t_Value) -> (((v_quoteFuel (dtb_u_u763 - 1)) dtb_u_u764) dtb_u_u770))) dtb_u_u768)))
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u772, dtb_u_u773) -> ((v_applyTermSpine (Core_dTerm.C_Term_TGlobal (dtb_u_u772))) ((B_dData_dList.v_map (fun (dtb_u_u774 : Core_dTerm.t_Value) -> (((v_quoteFuel (dtb_u_u763 - 1)) dtb_u_u764) dtb_u_u774))) dtb_u_u773))
  | _ -> failwith "DT: impossible branch"
)))

# 1004 "Vuna/Compiler/Core/Eval.vuna"
let v_quote = (fun (dtb_u_u775 : int) (dtb_u_u776 : Core_dTerm.t_Value) -> (((v_quoteFuel v_quoteFuelBound) dtb_u_u775) dtb_u_u776))

# 1029 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteCaseAlt = (fun (dtb_u_u777 : int) (dtb_u_u778 : Core_dTerm.t_VCaseAlt) -> (((v_quoteCaseAltFuel v_quoteFuelBound) dtb_u_u777) dtb_u_u778))

# 1045 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteArgValues = (fun (dtb_u_u779 : int) (dtb_u_u780 : Core_dTerm.t_Value B_dData_dList.t_List) -> (((v_quoteArgValuesFuel v_quoteFuelBound) dtb_u_u779) dtb_u_u780))

# 1069 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteNeutral = (fun (dtb_u_u781 : int) (dtb_u_u782 : Core_dTerm.t_Neutral) -> (((v_quoteNeutralFuel v_quoteFuelBound) dtb_u_u781) dtb_u_u782))

# 1102 "Vuna/Compiler/Core/Eval.vuna"
let rec v_substSolvedMetas = (fun (dtb_u_u783 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u784 : Core_dTerm.t_Term) -> (match dtb_u_u784 with
  | Core_dTerm.C_Term_TIf (dtb_u_u785, dtb_u_u786, dtb_u_u787) -> (Core_dTerm.C_Term_TIf (((v_substSolvedMetas dtb_u_u783) dtb_u_u785), ((v_substSolvedMetas dtb_u_u783) dtb_u_u786), ((v_substSolvedMetas dtb_u_u783) dtb_u_u787)))
  | Core_dTerm.C_Term_TCase (dtb_u_u788, dtb_u_u789) -> (Core_dTerm.C_Term_TCase (((v_substSolvedMetas dtb_u_u783) dtb_u_u788), ((B_dData_dList.v_map (v_substSolvedAlt dtb_u_u783)) dtb_u_u789)))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u790, dtb_u_u791, dtb_u_u792, dtb_u_u793, dtb_u_u794) -> (Core_dTerm.C_Term_TRecUpd (((v_substSolvedMetas dtb_u_u783) dtb_u_u790), dtb_u_u791, dtb_u_u792, dtb_u_u793, ((v_substSolvedMetas dtb_u_u783) dtb_u_u794)))
  | Core_dTerm.C_Term_TProj (dtb_u_u795, dtb_u_u796, dtb_u_u797, dtb_u_u798, dtb_u_u799) -> (Core_dTerm.C_Term_TProj (((v_substSolvedMetas dtb_u_u783) dtb_u_u795), dtb_u_u796, dtb_u_u797, dtb_u_u798, dtb_u_u799))
  | Core_dTerm.C_Term_TRecord (dtb_u_u800, dtb_u_u801) -> (Core_dTerm.C_Term_TRecord (dtb_u_u800, ((B_dData_dList.v_map (fun (dtb_u_u802 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((v_substSolvedMetas dtb_u_u783) (B_dData_dPair.v_firstOf dtb_u_u802)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u802) })) dtb_u_u801)))
  | Core_dTerm.C_Term_TMk (dtb_u_u803, dtb_u_u804) -> (Core_dTerm.C_Term_TMk (dtb_u_u803, ((B_dData_dList.v_map (fun (dtb_u_u805 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((v_substSolvedMetas dtb_u_u783) (B_dData_dPair.v_firstOf dtb_u_u805)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u805) })) dtb_u_u804)))
  | Core_dTerm.C_Term_TCon (dtb_u_u806, dtb_u_u807) -> (Core_dTerm.C_Term_TCon (dtb_u_u806, ((B_dData_dList.v_map (fun (dtb_u_u808 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((v_substSolvedMetas dtb_u_u783) (B_dData_dPair.v_firstOf dtb_u_u808)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u808) })) dtb_u_u807)))
  | Core_dTerm.C_Term_TApp (dtb_u_u809, dtb_u_u810, dtb_u_u811) -> (Core_dTerm.C_Term_TApp (((v_substSolvedMetas dtb_u_u783) dtb_u_u809), ((v_substSolvedMetas dtb_u_u783) dtb_u_u810), dtb_u_u811))
  | Core_dTerm.C_Term_TLam (dtb_u_u812, dtb_u_u813, dtb_u_u814, dtb_u_u815, dtb_u_u816) -> (let dtb_u_u817 = (let dtb_u_u818 = dtb_u_u814 in (match dtb_u_u818 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u819) -> (match dtb_u_u819 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u820; B_dData_dPair.f_Pair_second = dtb_u_u821 } -> (match dtb_u_u821 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u822; B_dData_dPair.f_Pair_second = dtb_u_u823 } -> (let dtb_u_u824 = (match dtb_u_u822 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u827) -> (B_dData_dMaybe.C_Maybe_Just (((v_substSolvedMetas dtb_u_u783) dtb_u_u827)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u825 = (match dtb_u_u823 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u826) -> (B_dData_dMaybe.C_Maybe_Just (((v_substSolvedMetas dtb_u_u783) dtb_u_u826)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u820; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u824; B_dData_dPair.f_Pair_second = dtb_u_u825 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u812, dtb_u_u813, dtb_u_u817, dtb_u_u815, ((v_substSolvedMetas dtb_u_u783) dtb_u_u816))))
  | Core_dTerm.C_Term_TPi (dtb_u_u828, dtb_u_u829, dtb_u_u830, dtb_u_u831, dtb_u_u832) -> (Core_dTerm.C_Term_TPi (dtb_u_u828, dtb_u_u829, dtb_u_u830, ((v_substSolvedMetas dtb_u_u783) dtb_u_u831), ((v_substSolvedMetas dtb_u_u783) dtb_u_u832)))
  | Core_dTerm.C_Term_TMeta (dtb_u_u833) -> (match ((Core_dTerm.v_metaLookupList dtb_u_u833) dtb_u_u783) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u834) -> (let dtb_u_u835 = ((v_quote 0) dtb_u_u834) in (if ((Core_dTerm.v_hasFreeTermVar 0) dtb_u_u835) then dtb_u_u784 else dtb_u_u835))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u784
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u784
))
# 1145 "Vuna/Compiler/Core/Eval.vuna"
and v_substSolvedAlt = (fun (dtb_u_u836 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u837 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u837 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u838; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u839; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u840 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u838; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u839; Core_dTerm.f_CaseAlt_caseAltBody = ((v_substSolvedMetas dtb_u_u836) dtb_u_u840) }
  | _ -> failwith "DT: impossible branch"
))

# 1158 "Vuna/Compiler/Core/Eval.vuna"
let rec v_substSolvedMetasAtGo = (fun (dtb_u_u841 : int) (dtb_u_u842 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u843 : Core_dTerm.t_Term) -> (match dtb_u_u843 with
  | Core_dTerm.C_Term_TIf (dtb_u_u844, dtb_u_u845, dtb_u_u846) -> (Core_dTerm.C_Term_TIf ((((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u844), (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u845), (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u846)))
  | Core_dTerm.C_Term_TCase (dtb_u_u847, dtb_u_u848) -> (Core_dTerm.C_Term_TCase ((((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u847), ((B_dData_dList.v_map ((v_substSolvedAltAt dtb_u_u841) dtb_u_u842)) dtb_u_u848)))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u849, dtb_u_u850, dtb_u_u851, dtb_u_u852, dtb_u_u853) -> (Core_dTerm.C_Term_TRecUpd ((((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u849), dtb_u_u850, dtb_u_u851, dtb_u_u852, (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u853)))
  | Core_dTerm.C_Term_TProj (dtb_u_u854, dtb_u_u855, dtb_u_u856, dtb_u_u857, dtb_u_u858) -> (Core_dTerm.C_Term_TProj ((((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u854), dtb_u_u855, dtb_u_u856, dtb_u_u857, dtb_u_u858))
  | Core_dTerm.C_Term_TRecord (dtb_u_u859, dtb_u_u860) -> (Core_dTerm.C_Term_TRecord (dtb_u_u859, ((B_dData_dList.v_map (fun (dtb_u_u861 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) (B_dData_dPair.v_firstOf dtb_u_u861)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u861) })) dtb_u_u860)))
  | Core_dTerm.C_Term_TMk (dtb_u_u862, dtb_u_u863) -> (Core_dTerm.C_Term_TMk (dtb_u_u862, ((B_dData_dList.v_map (fun (dtb_u_u864 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) (B_dData_dPair.v_firstOf dtb_u_u864)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u864) })) dtb_u_u863)))
  | Core_dTerm.C_Term_TCon (dtb_u_u865, dtb_u_u866) -> (Core_dTerm.C_Term_TCon (dtb_u_u865, ((B_dData_dList.v_map (fun (dtb_u_u867 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) (B_dData_dPair.v_firstOf dtb_u_u867)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u867) })) dtb_u_u866)))
  | Core_dTerm.C_Term_TApp (dtb_u_u868, dtb_u_u869, dtb_u_u870) -> (Core_dTerm.C_Term_TApp ((((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u868), (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u869), dtb_u_u870))
  | Core_dTerm.C_Term_TLam (dtb_u_u871, dtb_u_u872, dtb_u_u873, dtb_u_u874, dtb_u_u875) -> (let dtb_u_u876 = (let dtb_u_u877 = dtb_u_u873 in (match dtb_u_u877 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u878) -> (match dtb_u_u878 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u879; B_dData_dPair.f_Pair_second = dtb_u_u880 } -> (match dtb_u_u880 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u881; B_dData_dPair.f_Pair_second = dtb_u_u882 } -> (let dtb_u_u883 = (match dtb_u_u881 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u886) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u886)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u884 = (match dtb_u_u882 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u885) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u885)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u879; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u883; B_dData_dPair.f_Pair_second = dtb_u_u884 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u871, dtb_u_u872, dtb_u_u876, dtb_u_u874, (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u875))))
  | Core_dTerm.C_Term_TPi (dtb_u_u887, dtb_u_u888, dtb_u_u889, dtb_u_u890, dtb_u_u891) -> (Core_dTerm.C_Term_TPi (dtb_u_u887, dtb_u_u888, dtb_u_u889, (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u890), (((v_substSolvedMetasAtGo dtb_u_u841) dtb_u_u842) dtb_u_u891)))
  | Core_dTerm.C_Term_TMeta (dtb_u_u892) -> (match ((Core_dTerm.v_metaLookupList dtb_u_u892) dtb_u_u842) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u893) -> ((v_quote dtb_u_u841) dtb_u_u893)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u843
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u843
))
# 1203 "Vuna/Compiler/Core/Eval.vuna"
and v_substSolvedAltAt = (fun (dtb_u_u894 : int) (dtb_u_u895 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u896 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u896 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u897; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u898; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u899 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u897; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u898; Core_dTerm.f_CaseAlt_caseAltBody = (((v_substSolvedMetasAtGo dtb_u_u894) dtb_u_u895) dtb_u_u899) }
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAt = (fun (dtb_u_u900 : int) (dtb_u_u901 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u902 : Core_dTerm.t_Term) -> (match dtb_u_u901 with
  | B_dData_dList.C_List_Nil -> dtb_u_u902
  | _ -> (((v_substSolvedMetasAtGo dtb_u_u900) dtb_u_u901) dtb_u_u902)
))

# 1206 "Vuna/Compiler/Core/Eval.vuna"
let v_isNilList = (fun dtb_u_u904 -> (match dtb_u_u904 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 1212 "Vuna/Compiler/Core/Eval.vuna"
let v_showValueAt = (fun (dtb_u_u905 : int) (dtb_u_u906 : Core_dTerm.t_Value) -> (match dtb_u_u906 with
  | Core_dTerm.C_Value_VType (dtb_u_u907) -> (if ((Core_dTerm.v_levelToInt dtb_u_u907) = 0) then "Type" else ("Type " ^ (string_of_int (Core_dTerm.v_levelToInt dtb_u_u907))))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u908) -> (match dtb_u_u908 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u909, dtb_u_u910) -> (if (v_isNilList dtb_u_u910) then dtb_u_u909 else (Core_dTerm.v_showTerm ((v_quote dtb_u_u905) dtb_u_u906)))
  | Core_dTerm.C_Neutral_NVar (dtb_u_u911, dtb_u_u912, dtb_u_u913) -> (if (v_isNilList dtb_u_u913) then dtb_u_u911 else (Core_dTerm.v_showTerm ((v_quote dtb_u_u905) dtb_u_u906)))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VMeta (dtb_u_u914, dtb_u_u915) -> (if (v_isNilList dtb_u_u915) then ("?" ^ (string_of_int dtb_u_u914)) else (Core_dTerm.v_showTerm ((v_quote dtb_u_u905) dtb_u_u906)))
  | Core_dTerm.C_Value_VCon (dtb_u_u916, dtb_u_u917) -> (match ((v_natCtorInt dtb_u_u916) dtb_u_u917) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u918) -> (string_of_int dtb_u_u918)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.v_showTerm ((v_quote dtb_u_u905) dtb_u_u906))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.v_showTerm ((v_quote dtb_u_u905) dtb_u_u906))
))

# 1230 "Vuna/Compiler/Core/Eval.vuna"
let v_showValue = (fun (dtb_u_u919 : Core_dTerm.t_Value) -> ((v_showValueAt 0) dtb_u_u919))

# 1236 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeFuelBound = 262144

# 1239 "Vuna/Compiler/Core/Eval.vuna"
let v_normalize = (fun (dtb_u_u920 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u921 : Core_dTerm.t_Sols) (dtb_u_u922 : int) (dtb_u_u923 : Core_dTerm.t_Value) -> (((((v_normalizeFuel dtb_u_u922) dtb_u_u920) dtb_u_u921) dtb_u_u922) dtb_u_u923))

# 1242 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeCase = (fun (dtb_u_u924 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u925 : Core_dTerm.t_Sols) (dtb_u_u926 : int) (dtb_u_u927 : Core_dTerm.t_Value) (dtb_u_u928 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((((v_normalizeCaseFuel dtb_u_u926) dtb_u_u924) dtb_u_u925) dtb_u_u926) dtb_u_u927) dtb_u_u928))

# 1245 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeNeutral = (fun (dtb_u_u929 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u930 : Core_dTerm.t_Sols) (dtb_u_u931 : int) (dtb_u_u932 : Core_dTerm.t_Neutral) -> (((((v_normalizeNeutralFuel dtb_u_u931) dtb_u_u929) dtb_u_u930) dtb_u_u931) dtb_u_u932))

# 1248 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeIf = (fun (dtb_u_u933 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u934 : Core_dTerm.t_Sols) (dtb_u_u935 : int) (dtb_u_u936 : Core_dTerm.t_Value) (dtb_u_u937 : Core_dTerm.t_Value) (dtb_u_u938 : Core_dTerm.t_Value) -> (((((((v_normalizeIfFuel dtb_u_u935) dtb_u_u933) dtb_u_u934) dtb_u_u935) dtb_u_u936) dtb_u_u937) dtb_u_u938))

# 1269 "Vuna/Compiler/Core/Eval.vuna"
let v_substFuelMax = 1000000

# 1263 "Vuna/Compiler/Core/Eval.vuna"
let v_substFuelFor = (fun (dtb_u_u939 : Core_dTerm.t_Term) -> (let dtb_u_u940 = (128 + (4 * (Core_dTerm.v_termSize dtb_u_u939))) in (if (dtb_u_u940 > v_substFuelMax) then v_substFuelMax else dtb_u_u940)))

# 1272 "Vuna/Compiler/Core/Eval.vuna"
let rec v_substSolvedMetasAtTblFuel = (fun (dtb_u_u941 : int) (dtb_u_u942 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u943 : int) (dtb_u_u944 : Core_dTerm.t_Term) -> (if (dtb_u_u941 <= 0) then dtb_u_u944 else (match dtb_u_u944 with
  | Core_dTerm.C_Term_TMeta (dtb_u_u945) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u945) dtb_u_u942) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u944
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u946) -> (let dtb_u_u947 = ((v_quote dtb_u_u943) dtb_u_u946) in (if (Core_dTerm.v_hasNegativeVar dtb_u_u947) then dtb_u_u944 else ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u947)))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb_u_u948, dtb_u_u949, dtb_u_u950, dtb_u_u951, dtb_u_u952) -> (Core_dTerm.C_Term_TPi (dtb_u_u948, dtb_u_u949, dtb_u_u950, ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u951), ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) (dtb_u_u943 + 1)) dtb_u_u952)))
  | Core_dTerm.C_Term_TLam (dtb_u_u953, dtb_u_u954, dtb_u_u955, dtb_u_u956, dtb_u_u957) -> (let dtb_u_u958 = (let dtb_u_u959 = dtb_u_u955 in (match dtb_u_u959 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u960) -> (match dtb_u_u960 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u961; B_dData_dPair.f_Pair_second = dtb_u_u962 } -> (match dtb_u_u962 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u963; B_dData_dPair.f_Pair_second = dtb_u_u964 } -> (let dtb_u_u965 = (match dtb_u_u963 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u968) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u968)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u966 = (match dtb_u_u964 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u967) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) (dtb_u_u943 + 1)) dtb_u_u967)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u961; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u965; B_dData_dPair.f_Pair_second = dtb_u_u966 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u953, dtb_u_u954, dtb_u_u958, dtb_u_u956, ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) (dtb_u_u943 + 1)) dtb_u_u957))))
  | Core_dTerm.C_Term_TApp (dtb_u_u969, dtb_u_u970, dtb_u_u971) -> (Core_dTerm.C_Term_TApp (((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u969), ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u970), dtb_u_u971))
  | Core_dTerm.C_Term_TCon (dtb_u_u972, dtb_u_u973) -> (Core_dTerm.C_Term_TCon (dtb_u_u972, ((B_dData_dList.v_map (fun (dtb_u_u974 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) (B_dData_dPair.v_firstOf dtb_u_u974)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u974) })) dtb_u_u973)))
  | Core_dTerm.C_Term_TCase (dtb_u_u975, dtb_u_u976) -> (Core_dTerm.C_Term_TCase (((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u975), ((B_dData_dList.v_map (((v_substSolvedAltAtTbl (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943)) dtb_u_u976)))
  | Core_dTerm.C_Term_TIf (dtb_u_u977, dtb_u_u978, dtb_u_u979) -> (Core_dTerm.C_Term_TIf (((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u977), ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u978), ((((v_substSolvedMetasAtTblFuel (dtb_u_u941 - 1)) dtb_u_u942) dtb_u_u943) dtb_u_u979)))
  | _ -> dtb_u_u944
)))
# 1310 "Vuna/Compiler/Core/Eval.vuna"
and v_substSolvedAltAtTbl = (fun (dtb_u_u980 : int) (dtb_u_u981 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u982 : int) (dtb_u_u983 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u983 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u984; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u985; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u986 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u984; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u985; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substSolvedMetasAtTblFuel dtb_u_u980) dtb_u_u981) (dtb_u_u982 + (B_dData_dList.v_length dtb_u_u985))) dtb_u_u986) }
  | _ -> failwith "DT: impossible branch"
))

# 1258 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAtTbl = (fun (dtb_u_u987 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u988 : int) (dtb_u_u989 : Core_dTerm.t_Term) -> ((((v_substSolvedMetasAtTblFuel (v_substFuelFor dtb_u_u989)) dtb_u_u987) dtb_u_u988) dtb_u_u989))
