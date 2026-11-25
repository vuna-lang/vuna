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
let rec v_evalAlts = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
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

# 248 "Vuna/Compiler/Core/Eval.vuna"
let rec v_natValueToInt = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__14, dtb__15) -> ((v_natCtorInt dtb__14) dtb__15)
  | Core_dTerm.C_Value_VInt (dtb__16) -> (B_dData_dMaybe.C_Maybe_Just (dtb__16))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 253 "Vuna/Compiler/Core/Eval.vuna"
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

# 269 "Vuna/Compiler/Core/Eval.vuna"
let v_asNat = (fun (v : Core_dTerm.t_Value) -> (v_natValueToInt v))

# 291 "Vuna/Compiler/Core/Eval.vuna"
let rec v_digitsOfChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if (if (dtb__20 >= 48) then (dtb__20 <= 57) else false) then ((v_digitsOfChars dtb__21) ((mc1 * 10) + (dtb__20 - 48))) else ((v_digitsOfChars dtb__21) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Core/Eval.vuna"
let v_digitsOf = (fun (s : string) -> ((v_digitsOfChars (B_dData_dList.dtp_unpack s)) 0))

# 298 "Vuna/Compiler/Core/Eval.vuna"
let rec v_pow10Of = (fun (n : int) -> (if (n <= 0) then 1 else (if (n > 18) then 1000000000000000000 else ((v_pow10Of (n - 1)) * 10))))

# 281 "Vuna/Compiler/Core/Eval.vuna"
let v_floatOfRaw = (fun (raw : string) -> (let nd_uscrut1 = ((Base_dSource.v_splitOnChar 46) raw) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> ((float_of_int (v_digitsOf (dtb__22 ^ dtb__24))) /. (float_of_int (v_pow10Of (bi_strLength dtb__24))))
  | _ -> (float_of_int (v_digitsOf raw))
)
  | _ -> (float_of_int (v_digitsOf raw))
)
  | _ -> (float_of_int (v_digitsOf raw))
)))

# 302 "Vuna/Compiler/Core/Eval.vuna"
let v_showFloatOf = (fun (x : float) -> (B_dData_dFloat.v_floatRender x))

# 306 "Vuna/Compiler/Core/Eval.vuna"
let v_showFloatRaw = (fun (raw : string) -> (v_showFloatOf (v_floatOfRaw raw)))

# 309 "Vuna/Compiler/Core/Eval.vuna"
let v_asFloat = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VFloat (dtb__26) -> (B_dData_dMaybe.C_Maybe_Just ((v_floatOfRaw dtb__26)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 313 "Vuna/Compiler/Core/Eval.vuna"
let v_floatPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (float) -> float) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__28 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb__27) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VFloat ((v_showFloatOf (mc1 dtb__29))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 320 "Vuna/Compiler/Core/Eval.vuna"
let v_floatPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (float) -> (float) -> float) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (match dtb__33 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb__30) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (match (v_asFloat dtb__32) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VFloat ((v_showFloatOf ((mc1 dtb__34) dtb__35))))))
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

# 330 "Vuna/Compiler/Core/Eval.vuna"
let v_floatBool2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (float) -> (float) -> bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | B_dData_dList.C_List_Nil -> (match (v_asFloat dtb__36) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (match (v_asFloat dtb__38) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool (((mc1 dtb__40) dtb__41)))))
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

# 340 "Vuna/Compiler/Core/Eval.vuna"
let v_asStr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VStr (dtb__42) -> (B_dData_dMaybe.C_Maybe_Just (dtb__42))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 344 "Vuna/Compiler/Core/Eval.vuna"
let v_asBool = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VBool (dtb__43) -> (B_dData_dMaybe.C_Maybe_Just (dtb__43))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 348 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> (int) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__44) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> (match (v_asInt dtb__46) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (B_dData_dMaybe.C_Maybe_Just (((mc1 dtb__48) dtb__49)))
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

# 361 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim2Div = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (match dtb__51 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__50) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> (match (v_asInt dtb__52) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (if (dtb__55 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt ((if dtb__55 = 0 then failwith "division by zero" else dtb__54 / dtb__55))))))
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

# 371 "Vuna/Compiler/Core/Eval.vuna"
let v_boolPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (bool) -> (bool) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (match dtb__59 with
  | B_dData_dList.C_List_Nil -> (match (v_asBool dtb__56) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (match (v_asBool dtb__58) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (B_dData_dMaybe.C_Maybe_Just (((mc1 dtb__60) dtb__61)))
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

# 382 "Vuna/Compiler/Core/Eval.vuna"
let v_primConst = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (mc1))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 386 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (string) -> (string) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__62) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match (v_asStr dtb__64) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (B_dData_dMaybe.C_Maybe_Just (((mc1 dtb__66) dtb__67)))
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

# 396 "Vuna/Compiler/Core/Eval.vuna"
let v_intPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (match dtb__69 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__68) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (B_dData_dMaybe.C_Maybe_Just ((mc1 dtb__70)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 403 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match dtb__72 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb__71) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (B_dData_dMaybe.C_Maybe_Just ((mc1 dtb__73)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 410 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> (int) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__75 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb__74) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (match (v_asNat dtb__76) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (B_dData_dMaybe.C_Maybe_Just (((mc1 dtb__78) dtb__79)))
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

# 420 "Vuna/Compiler/Core/Eval.vuna"
let v_natPrim2Div = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__83 with
  | B_dData_dList.C_List_Nil -> (match (v_asNat dtb__80) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> (match (v_asNat dtb__82) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> (if (dtb__85 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_natValue (if dtb__85 = 0 then failwith "division by zero" else dtb__84 / dtb__85)))))
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

# 430 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim1 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (string) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (match dtb__87 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__86) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (B_dData_dMaybe.C_Maybe_Just ((mc1 dtb__88)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 438 "Vuna/Compiler/Core/Eval.vuna"
let v_strEq = (fun (a : string) (b : string) -> (a = b))

# 456 "Vuna/Compiler/Core/Eval.vuna"
let v_cmpInt = (fun (a : int) (b : int) -> (if (a = b) then 0 else (if (a < b) then (0 - 1) else 1)))

# 441 "Vuna/Compiler/Core/Eval.vuna"
let v_genericCmp = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VBool (dtb__89) -> (match mc1 with
  | Core_dTerm.C_Value_VBool (dtb__90) -> (B_dData_dMaybe.C_Maybe_Just ((if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb__89) dtb__90) then 0 else (if dtb__89 then 1 else (0 - 1)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VStr (dtb__91) -> (match mc1 with
  | Core_dTerm.C_Value_VStr (dtb__92) -> (B_dData_dMaybe.C_Maybe_Just ((if (dtb__91 = dtb__92) then 0 else (if (dtb__91 < dtb__92) then (0 - 1) else 1))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VInt (dtb__93) -> (match mc1 with
  | Core_dTerm.C_Value_VInt (dtb__94) -> (B_dData_dMaybe.C_Maybe_Just (((v_cmpInt dtb__93) dtb__94)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 459 "Vuna/Compiler/Core/Eval.vuna"
let v_genericPrim2 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (int) -> bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match dtb__96 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (match dtb__98 with
  | B_dData_dList.C_List_Nil -> (match ((v_genericCmp dtb__95) dtb__97) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__99) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool ((mc1 dtb__99)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 466 "Vuna/Compiler/Core/Eval.vuna"
let v_strPrim3 = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : (string) -> (string) -> (string) -> Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__101 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match dtb__103 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (match dtb__105 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__100) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (match (v_asStr dtb__102) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (match (v_asStr dtb__104) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> (B_dData_dMaybe.C_Maybe_Just ((((mc1 dtb__106) dtb__107) dtb__108)))
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

# 483 "Vuna/Compiler/Core/Eval.vuna"
let rec v_valueEqFuel = (fun (fuel : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match a with
  | Core_dTerm.C_Value_VType (dtb__109) -> (match b with
  | Core_dTerm.C_Value_VType (dtb__110) -> (B_dData_dMaybe.C_Maybe_Just (((Core_dTerm.v_levelEq dtb__109) dtb__110)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VInt (dtb__111) -> (match b with
  | Core_dTerm.C_Value_VInt (dtb__112) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__111 = dtb__112)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VStr (dtb__113) -> (match b with
  | Core_dTerm.C_Value_VStr (dtb__114) -> (B_dData_dMaybe.C_Maybe_Just (((v_strEq dtb__113) dtb__114)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VFloat (dtb__115) -> (match b with
  | Core_dTerm.C_Value_VFloat (dtb__116) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__115 = dtb__116)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VBool (dtb__117) -> (match b with
  | Core_dTerm.C_Value_VBool (dtb__118) -> (B_dData_dMaybe.C_Maybe_Just ((((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb__117) dtb__118)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VCon (dtb__119, dtb__120) -> (match b with
  | Core_dTerm.C_Value_VCon (dtb__121, dtb__122) -> (if (dtb__119 = dtb__121) then (((v_valueListEqFuel (fuel - 1)) dtb__120) dtb__122) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Value_VNeutral (dtb__123) -> (match b with
  | Core_dTerm.C_Value_VNeutral (dtb__124) -> (((v_neutralEqFuel (fuel - 1)) dtb__123) dtb__124)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 519 "Vuna/Compiler/Core/Eval.vuna"
and v_neutralEqFuel = (fun (mc0 : int) (mc1 : Core_dTerm.t_Neutral) (mc2 : Core_dTerm.t_Neutral) -> (match mc1 with
  | Core_dTerm.C_Neutral_NVar (dtb__125, dtb__126, dtb__127) -> (match mc2 with
  | Core_dTerm.C_Neutral_NVar (dtb__128, dtb__129, dtb__130) -> (if (if (dtb__125 = dtb__128) then (dtb__126 = dtb__129) else false) then (((v_valueListEqFuel (mc0 - 1)) dtb__127) dtb__130) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__131, dtb__132) -> (match mc2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__133, dtb__134) -> (if (dtb__131 = dtb__133) then (((v_valueListEqFuel (mc0 - 1)) dtb__132) dtb__134) else (B_dData_dMaybe.C_Maybe_Just (false)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))
# 530 "Vuna/Compiler/Core/Eval.vuna"
and v_valueListEqFuel = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (let nd_uscrut9 = (((v_valueEqFuel mc0) dtb__135) dtb__137) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> (if dtb__139 then (((v_valueListEqFuel mc0) dtb__136) dtb__138) else (B_dData_dMaybe.C_Maybe_Just (false)))
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

# 733 "Vuna/Compiler/Core/Eval.vuna"
let rec v_strHashChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> ((v_strHashChars dtb__141) (((mc1 * 33) + dtb__140) - ((if 1024 = 0 then failwith "division by zero" else ((mc1 * 33) + dtb__140) / 1024) * 1024)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Core/Eval.vuna"
let v_strHashOf = (fun (s : string) -> ((v_strHashChars (B_dData_dList.dtp_unpack s)) 0))

# 751 "Vuna/Compiler/Core/Eval.vuna"
let rec v_nthByte = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if (mc1 <= 0) then dtb__142 else ((v_nthByte dtb__143) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Core/Eval.vuna"
let v_strAtBytes = (fun (s : string) (i : int) -> (if (if (i < 0) then true else (i >= (bi_strLength s))) then (0 - 1) else ((v_nthByte (B_dData_dList.dtp_unpack s)) i)))

# 738 "Vuna/Compiler/Core/Eval.vuna"
let v_atPrim = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (match dtb__147 with
  | B_dData_dList.C_List_Nil -> (match (v_asStr dtb__144) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match (v_asInt dtb__146) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (((v_strAtBytes dtb__148) dtb__149)))))
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

# 778 "Vuna/Compiler/Core/Eval.vuna"
let rec v_takeBytes = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (B_dData_dList.C_List__x58__x58_ (dtb__150, ((v_takeBytes (n - 1)) dtb__151)))
  | _ -> failwith "DT: impossible branch"
)))

# 787 "Vuna/Compiler/Core/Eval.vuna"
let rec v_dropBytes = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> ((v_dropBytes (n - 1)) dtb__153)
  | _ -> failwith "DT: impossible branch"
)))

# 770 "Vuna/Compiler/Core/Eval.vuna"
let v_substringBytes = (fun (start : int) (len : int) (s : string) -> (let n = (bi_strLength s) in (let st = (if (start < 0) then 0 else (if (start > n) then n else start)) in (let ln = (if (len < 0) then 0 else (if ((st + len) > n) then (n - st) else len)) in (B_dData_dList.dtp_pack ((v_takeBytes ln) ((v_dropBytes st) (B_dData_dList.dtp_unpack s))))))))

# 757 "Vuna/Compiler/Core/Eval.vuna"
let v_substringPrim = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (match dtb__155 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (match dtb__157 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (match dtb__159 with
  | B_dData_dList.C_List_Nil -> (match (v_asInt dtb__154) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (match (v_asInt dtb__156) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (match (v_asStr dtb__158) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VStr ((((v_substringBytes dtb__160) dtb__161) dtb__162)))))
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

# 805 "Vuna/Compiler/Core/Eval.vuna"
let rec v_argAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__163)) else ((v_argAt (mc0 - 1)) dtb__164))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 810 "Vuna/Compiler/Core/Eval.vuna"
let v_evalProjFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VProj (v, c, tele, i, fi)) else (match v with
  | Core_dTerm.C_Value_VCon (dtb__165, dtb__166) -> (match ((v_argAt i) dtb__166) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> dtb__167
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (v, c, tele, i, fi))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VProj (v, c, tele, i, fi))
)))

# 37 "Vuna/Compiler/Core/Eval.vuna"
let rec v_evalFuel = (fun (fuel : int) (env : Core_dTerm.t_Value B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match t with
  | Core_dTerm.C_Term_TVar (dtb__168, dtb__169, dtb__170) -> (match ((v_lookupEnv dtb__169) env) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> dtb__171
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__168, dtb__169, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TMeta (dtb__172) -> (Core_dTerm.C_Value_VMeta (dtb__172, B_dData_dList.C_List_Nil))
  | Core_dTerm.C_Term_TGlobal (dtb__173) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__173, B_dData_dList.C_List_Nil))))
  | Core_dTerm.C_Term_TType (dtb__174) -> (Core_dTerm.C_Value_VType (dtb__174))
  | Core_dTerm.C_Term_TPi (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (Core_dTerm.C_Value_VPi (dtb__175, dtb__176, dtb__177, (((v_evalFuel (fuel - 1)) env) dtb__178), { Core_dTerm.f_Closure_closureEnv = env; Core_dTerm.f_Closure_closureBody = dtb__179 }))
  | Core_dTerm.C_Term_TLam (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184) -> (Core_dTerm.C_Value_VLam (dtb__180, dtb__181, { Core_dTerm.f_Closure_closureEnv = env; Core_dTerm.f_Closure_closureBody = dtb__184 }))
  | Core_dTerm.C_Term_TApp (dtb__185, dtb__186, dtb__187) -> (((v_applyValueFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__185)) (((v_evalFuel (fuel - 1)) env) dtb__186))
  | Core_dTerm.C_Term_TCon (dtb__188, dtb__189) -> (Core_dTerm.C_Value_VCon (dtb__188, (((v_evalArgTermsFuel (fuel - 1)) env) dtb__189)))
  | Core_dTerm.C_Term_TMk (dtb__190, dtb__191) -> (Core_dTerm.C_Value_VCon (dtb__190, (((v_evalArgTermsFuel (fuel - 1)) env) dtb__191)))
  | Core_dTerm.C_Term_TRecord (dtb__192, dtb__193) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__192, (((v_evalArgTermsFuel (fuel - 1)) env) dtb__193)))))
  | Core_dTerm.C_Term_TCase (dtb__194, dtb__195) -> (((v_evalCaseFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__194)) ((v_evalAlts env) dtb__195))
  | Core_dTerm.C_Term_TProj (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200) -> ((((((v_evalProjFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__196)) dtb__197) dtb__198) dtb__199) dtb__200)
  | Core_dTerm.C_Term_TRecUpd (dtb__201, dtb__202, dtb__203, dtb__204, dtb__205) -> (((v_evalCaseFuel (fuel - 1)) (((v_evalFuel (fuel - 1)) env) dtb__201)) (B_dData_dList.C_List__x58__x58_ (((v_evalAlt env) { Core_dTerm.f_CaseAlt_caseAltName = dtb__202; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__203); Core_dTerm.f_CaseAlt_caseAltBody = dtb__205 }), B_dData_dList.C_List_Nil)))
  | Core_dTerm.C_Term_TInt (dtb__206) -> (Core_dTerm.C_Value_VInt (dtb__206))
  | Core_dTerm.C_Term_TStr (dtb__207) -> (Core_dTerm.C_Value_VStr (dtb__207))
  | Core_dTerm.C_Term_TFloat (dtb__208) -> (Core_dTerm.C_Value_VFloat ((v_showFloatRaw dtb__208)))
  | Core_dTerm.C_Term_TBool (dtb__209) -> (Core_dTerm.C_Value_VBool (dtb__209))
  | Core_dTerm.C_Term_TIf (dtb__210, dtb__211, dtb__212) -> (((v_evalIf (((v_evalFuel (fuel - 1)) env) dtb__210)) (((v_evalFuel (fuel - 1)) env) dtb__211)) (((v_evalFuel (fuel - 1)) env) dtb__212))
  | _ -> failwith "DT: impossible branch"
)))
# 80 "Vuna/Compiler/Core/Eval.vuna"
and v_evalArgTermsFuel = (fun (fuel : int) (env : Core_dTerm.t_Value B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__213 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> (B_dData_dList.C_List__x58__x58_ ((((v_evalFuel v_evalFuelMax) env) dtb__215), (((v_evalArgTermsFuel (fuel - 1)) env) dtb__214)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))
# 94 "Vuna/Compiler/Core/Eval.vuna"
and v_evalCaseFuel = (fun (fuel : int) (scrut : Core_dTerm.t_Value) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match scrut with
  | Core_dTerm.C_Value_VCon (dtb__217, dtb__218) -> ((((v_applyCaseAltFuel (fuel - 1)) dtb__217) dtb__218) alts)
  | _ -> (Core_dTerm.C_Value_VCase (scrut, alts))
)))
# 106 "Vuna/Compiler/Core/Eval.vuna"
and v_applyCaseAltFuel = (fun (fuel : int) (c : string) (args : Core_dTerm.t_Value B_dData_dList.t_List) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (match alts with
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Value_VCase ((Core_dTerm.C_Value_VCon (c, args)), B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (if ((dtb__219).Core_dTerm.f_VCaseAlt_vCaseAltName = c) then (match (dtb__219).Core_dTerm.f_VCaseAlt_vCaseAltClosure with
  | { Core_dTerm.f_Closure_closureEnv = dtb__221; Core_dTerm.f_Closure_closureBody = dtb__222 } -> (((v_evalFuel v_evalFuelMax) ((B_dData_dList.v_append (B_dData_dList.v_reverse args)) dtb__221)) dtb__222)
  | _ -> failwith "DT: impossible branch"
) else (if ((dtb__219).Core_dTerm.f_VCaseAlt_vCaseAltName = "") then (match (dtb__219).Core_dTerm.f_VCaseAlt_vCaseAltClosure with
  | { Core_dTerm.f_Closure_closureEnv = dtb__223; Core_dTerm.f_Closure_closureBody = dtb__224 } -> (((v_evalFuel v_evalFuelMax) (((v_catchAllEnv dtb__219) (Core_dTerm.C_Value_VCon (c, args))) dtb__223)) dtb__224)
  | _ -> failwith "DT: impossible branch"
) else ((((v_applyCaseAltFuel (fuel - 1)) c) args) dtb__220)))
  | _ -> failwith "DT: impossible branch"
)))
# 142 "Vuna/Compiler/Core/Eval.vuna"
and v_applyValueFuel = (fun (fuel : int) (f : Core_dTerm.t_Value) (a : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VType (Core_dTerm.v_levelZero)) else (let nd_uscrut3 = f in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VMeta (dtb__225, dtb__226) -> (Core_dTerm.C_Value_VMeta (dtb__225, ((B_dData_dList.v_append dtb__226) (B_dData_dList.C_List__x58__x58_ (a, B_dData_dList.C_List_Nil)))))
  | Core_dTerm.C_Value_VNeutral (dtb__227) -> (match dtb__227 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__228, dtb__229) -> (match dtb__229 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__231 with
  | B_dData_dList.C_List_Nil -> (if (dtb__228 = Base_dIntrinsics.v_primEraseName) then (((v_applyValueFuel (fuel - 1)) dtb__230) a) else (Core_dTerm.C_Value_VNeutral (((v_spineAppend (Core_dTerm.C_Neutral_NGlobal (dtb__228, (B_dData_dList.C_List__x58__x58_ (dtb__230, B_dData_dList.C_List_Nil))))) a))))
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__227) a)))
)
  | B_dData_dList.C_List_Nil -> (if (dtb__228 = Base_dIntrinsics.v_primEraseName) then a else (Core_dTerm.C_Value_VNeutral (((v_spineAppend (Core_dTerm.C_Neutral_NGlobal (dtb__228, B_dData_dList.C_List_Nil))) a))))
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__227) a)))
)
  | _ -> (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__227) a)))
)
  | Core_dTerm.C_Value_VLam (dtb__232, dtb__233, dtb__234) -> (match dtb__234 with
  | { Core_dTerm.f_Closure_closureEnv = dtb__235; Core_dTerm.f_Closure_closureBody = dtb__236 } -> (((v_evalFuel (fuel - 1)) (B_dData_dList.C_List__x58__x58_ (a, dtb__235))) dtb__236)
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
  | { Core_dTerm.f_Closure_closureEnv = dtb__237; Core_dTerm.f_Closure_closureBody = dtb__238 } -> ((v_eval (B_dData_dList.C_List__x58__x58_ (mc1, dtb__237))) dtb__238)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Core/Eval.vuna"
let rec v_applySpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> ((v_applySpine ((v_applyValue mc0) dtb__239)) dtb__240)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Core/Eval.vuna"
let v_obsReduce = (fun (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (g = Base_dIntrinsics.v_obsLevelIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsCounterIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsMarkIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSpanBeginIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSpanEndIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSampleStartIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSampleStopIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else (if (g = Base_dIntrinsics.v_obsSpanIntrinsicName) then (let nd_uscrut2 = sp in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (match dtb__242 with
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> (match dtb__244 with
  | B_dData_dList.C_List__x58__x58_ (dtb__245, dtb__246) -> (B_dData_dMaybe.C_Maybe_Just (((v_applyValue dtb__245) (Core_dTerm.C_Value_VInt (0)))))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0))))
)) else (if (g = Base_dIntrinsics.v_obsSpanLabIntrinsicName) then (let nd_uscrut2 = sp in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__247, dtb__248) -> (match dtb__248 with
  | B_dData_dList.C_List__x58__x58_ (dtb__249, dtb__250) -> (match dtb__250 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (match dtb__252 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> (B_dData_dMaybe.C_Maybe_Just (((v_applyValue dtb__253) (Core_dTerm.C_Value_VInt (0)))))
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
  | Core_dTerm.C_Value_VMeta (dtb__255, dtb__256) -> (match ((Core_dTerm.v_solsLookup dtb__255) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__257) -> ((((v_force defs) sols) (fuel - 1)) ((v_applySpine dtb__257) dtb__256))
  | B_dData_dMaybe.C_Maybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VProj (dtb__258, dtb__259, dtb__260, dtb__261, dtb__262) -> (let b2 = ((((v_force defs) sols) (fuel - 1)) dtb__258) in (match b2 with
  | Core_dTerm.C_Value_VCon (dtb__263, dtb__264) -> (match ((v_argAt dtb__261) dtb__264) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> ((((v_force defs) sols) (fuel - 1)) dtb__265)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (b2, dtb__259, dtb__260, dtb__261, dtb__262))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VProj (b2, dtb__259, dtb__260, dtb__261, dtb__262))
))
  | Core_dTerm.C_Value_VCase (dtb__266, dtb__267) -> (let s2 = ((((v_force defs) sols) (fuel - 1)) dtb__266) in (match s2 with
  | Core_dTerm.C_Value_VCon (dtb__268, dtb__269) -> (match dtb__267 with
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Value_VCase (s2, B_dData_dList.C_List_Nil))
  | _ -> ((((v_force defs) sols) (fuel - 1)) (((v_applyCaseAlt dtb__268) dtb__269) dtb__267))
)
  | _ -> (Core_dTerm.C_Value_VCase (s2, dtb__267))
))
  | Core_dTerm.C_Value_VApp (dtb__270, dtb__271) -> (let f2 = ((((v_force defs) sols) (fuel - 1)) dtb__270) in (match f2 with
  | Core_dTerm.C_Value_VLam (dtb__272, dtb__273, dtb__274) -> ((((v_force defs) sols) (fuel - 1)) ((v_applyClosure dtb__274) dtb__271))
  | Core_dTerm.C_Value_VMeta (dtb__275, dtb__276) -> ((((v_force defs) sols) (fuel - 1)) (Core_dTerm.C_Value_VMeta (dtb__275, ((B_dData_dList.v_append dtb__276) (B_dData_dList.C_List__x58__x58_ (dtb__271, B_dData_dList.C_List_Nil))))))
  | Core_dTerm.C_Value_VNeutral (dtb__277) -> ((((v_force defs) sols) (fuel - 1)) (Core_dTerm.C_Value_VNeutral (((v_spineAppend dtb__277) dtb__271))))
  | _ -> (Core_dTerm.C_Value_VApp (f2, dtb__271))
))
  | Core_dTerm.C_Value_VNeutral (dtb__278) -> (match dtb__278 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__279, dtb__280) -> (match ((Core_dTerm.v_defLookup dtb__279) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__281) -> (let _u = (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.delta") 1) in ((((v_force defs) sols) (fuel - 1)) ((v_applySpine ((v_eval B_dData_dList.C_List_Nil) dtb__281)) dtb__280)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_primReduce defs) sols) (fuel - 1)) dtb__279) dtb__280) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> ((((v_force defs) sols) (fuel - 1)) dtb__282)
  | B_dData_dMaybe.C_Maybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
)))
# 553 "Vuna/Compiler/Core/Eval.vuna"
and v_rowRemReduce = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (e : Core_dTerm.t_Value) (r : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut5 = ((((v_force defs) sols) (fuel - 1)) r) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VCon (dtb__283, dtb__284) -> (match dtb__284 with
  | B_dData_dList.C_List__x58__x58_ (dtb__285, dtb__286) -> (match dtb__286 with
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> (if (dtb__283 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut14 = (((v_valueEqFuel (fuel - 1)) e) dtb__285) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__289) -> (if dtb__289 then (B_dData_dMaybe.C_Maybe_Just (dtb__287)) else (match (((((v_rowRemReduce defs) sols) (fuel - 1)) e) dtb__287) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__290) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb__283, (B_dData_dList.C_List__x58__x58_ (dtb__285, (B_dData_dList.C_List__x58__x58_ (dtb__290, B_dData_dList.C_List_Nil))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (if (dtb__283 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)))) else B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> (if (dtb__283 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)))) else B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 576 "Vuna/Compiler/Core/Eval.vuna"
and v_appendReduce = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((v_force defs) sols) (fuel - 1)) a) with
  | Core_dTerm.C_Value_VCon (dtb__291, dtb__292) -> (if (dtb__291 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (((((v_force defs) sols) (fuel - 1)) b))) else (if (dtb__291 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut7 = dtb__292 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (match dtb__294 with
  | B_dData_dList.C_List__x58__x58_ (dtb__295, dtb__296) -> (match ((((v_force defs) sols) (fuel - 1)) b) with
  | Core_dTerm.C_Value_VCon (dtb__297, dtb__298) -> (if (dtb__297 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb__291, (B_dData_dList.C_List__x58__x58_ (dtb__293, (B_dData_dList.C_List__x58__x58_ (dtb__295, B_dData_dList.C_List_Nil)))))))) else (match (((((v_appendReduce defs) sols) (fuel - 1)) dtb__295) b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VCon (dtb__291, (B_dData_dList.C_List__x58__x58_ (dtb__293, (B_dData_dList.C_List__x58__x58_ (dtb__299, B_dData_dList.C_List_Nil))))))))
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
# 602 "Vuna/Compiler/Core/Eval.vuna"
and v_primReduce = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (g = Base_dIntrinsics.v_effRowRemName) then (let nd_uscrut5 = sp in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__300, dtb__301) -> (match dtb__301 with
  | B_dData_dList.C_List__x58__x58_ (dtb__302, dtb__303) -> (((((v_rowRemReduce defs) sols) (fuel - 1)) dtb__300) dtb__302)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (g = Base_dIntrinsics.v_effRowAppendName) then (let nd_uscrut5 = sp in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__304, dtb__305) -> (match dtb__305 with
  | B_dData_dList.C_List__x58__x58_ (dtb__306, dtb__307) -> (((((v_appendReduce defs) sols) (fuel - 1)) dtb__304) dtb__306)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (match (Base_dIntrinsics.v_findIntrinsic g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__308) -> (match (dtb__308).Base_dIntrinsics.f_Intrinsic_intrinsicOp with
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
  | Base_dIntrinsics.C_IntrinsicOp_OpStrFromInt -> ((v_intPrim1 sp) (fun (n : int) -> (Core_dTerm.C_Value_VStr ((bi_strFromInt n)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrLength -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VInt ((bi_strLength s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrHash -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VInt ((v_strHashOf s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrDispatchId -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VInt ((Base_dIntrinsics.v_dispatchIdOf s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpStrAt -> (v_atPrim sp)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrSubstring -> (v_substringPrim sp)
  | Base_dIntrinsics.C_IntrinsicOp_OpStrShow -> ((v_strPrim1 sp) (fun (s : string) -> (Core_dTerm.C_Value_VStr ((Core_dTerm.v_showCoreString s)))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatAdd -> ((v_natPrim2 sp) (fun (a : int) (b : int) -> (v_natValue ((v_natSatAdd a) b))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatSub -> ((v_natPrim2 sp) (fun (a : int) (b : int) -> (v_natValue ((v_natTruncSub a) b))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatMul -> ((v_natPrim2 sp) (fun (a : int) (b : int) -> (v_natValue ((v_natSatMul a) b))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatDiv -> (v_natPrim2Div sp)
  | Base_dIntrinsics.C_IntrinsicOp_OpNatToInt -> ((v_natPrim1 sp) (fun (n : int) -> (Core_dTerm.C_Value_VInt (n))))
  | Base_dIntrinsics.C_IntrinsicOp_OpNatFromInt -> ((v_intPrim1 sp) (fun (n : int) -> (v_natValue (v_natClamp n))))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (match dtb__309 with
  | Core_dTerm.C_Value_VFloat (dtb__311) -> (match dtb__310 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VStr ((v_showFloatRaw dtb__311)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dIntrinsics.C_IntrinsicOp_OpFloatFromInt -> ((v_intPrim1 sp) (fun (n : int) -> (Core_dTerm.C_Value_VFloat ((v_showFloatOf (float_of_int n))))))
  | Base_dIntrinsics.C_IntrinsicOp_OpIntFromFloat -> (let nd_uscrut7 = sp in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__312, dtb__313) -> (match dtb__312 with
  | Core_dTerm.C_Value_VFloat (dtb__314) -> (match dtb__313 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt ((int_of_float (v_floatOfRaw dtb__314))))))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__315, dtb__316) -> (match dtb__316 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__315))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__317) -> (B_dData_dMaybe.C_Maybe_Just (dtb__317))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (g = Base_dIntrinsics.v_logOnIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VBool (false)))) else (if (g = Base_dIntrinsics.v_logEmitIntrinsicName) then (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VInt (0)))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 545 "Vuna/Compiler/Core/Eval.vuna"
let v_forceLabelArgs = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (fuel : int) (v : Core_dTerm.t_Value) -> (let nd_uscrut4 = ((((v_force defs) sols) fuel) v) in (match nd_uscrut4 with
  | Core_dTerm.C_Value_VNeutral (dtb__318) -> (match dtb__318 with
  | Core_dTerm.C_Neutral_NVar (dtb__319, dtb__320, dtb__321) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__319, dtb__320, ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> ((((v_force defs) sols) fuel) a))) dtb__321)))))
  | Core_dTerm.C_Neutral_NGlobal (dtb__322, dtb__323) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__322, ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> ((((v_force defs) sols) fuel) a))) dtb__323)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> nd_uscrut4
)))

# 822 "Vuna/Compiler/Core/Eval.vuna"
let rec v_normalizeFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then v else (if (evalFuel <= 0) then v else (match ((((v_force defs) sols) evalFuel) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__324) -> (((((v_normalizeNeutralFuel (fuel - 1)) defs) sols) evalFuel) dtb__324)
  | Core_dTerm.C_Value_VCon (dtb__325, dtb__326) -> (Core_dTerm.C_Value_VCon (dtb__325, ((B_dData_dList.v_map ((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__326)))
  | Core_dTerm.C_Value_VApp (dtb__327, dtb__328) -> (Core_dTerm.C_Value_VApp ((((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel) dtb__327), (((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel) dtb__328)))
  | Core_dTerm.C_Value_VIf (dtb__329, dtb__330, dtb__331) -> (((((((v_normalizeIfFuel (fuel - 1)) defs) sols) evalFuel) dtb__329) dtb__330) dtb__331)
  | Core_dTerm.C_Value_VCase (dtb__332, dtb__333) -> ((((((v_normalizeCaseFuel (fuel - 1)) defs) sols) evalFuel) dtb__332) dtb__333)
  | Core_dTerm.C_Value_VProj (dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> (((((((((v_normalizeProjFuel (fuel - 1)) defs) sols) evalFuel) dtb__334) dtb__335) dtb__336) dtb__337) dtb__338)
  | dtb__339 -> dtb__339
))))
# 842 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeCaseFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (scrut : Core_dTerm.t_Value) (alts : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VCase (scrut, alts)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VCase (scrut, alts)) else (match (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) scrut) with
  | Core_dTerm.C_Value_VCon (dtb__340, dtb__341) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (((v_applyCaseAlt dtb__340) dtb__341) alts))
  | dtb__342 -> (Core_dTerm.C_Value_VCase (dtb__342, alts))
))))
# 854 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeProjFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (v : Core_dTerm.t_Value) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VProj (v, c, tele, i, fi)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VProj (v, c, tele, i, fi)) else (match (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) v) with
  | Core_dTerm.C_Value_VCon (dtb__343, dtb__344) -> (match ((v_argAt i) dtb__344) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__345) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__345)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj (v, c, tele, i, fi))
  | _ -> failwith "DT: impossible branch"
)
  | dtb__346 -> (Core_dTerm.C_Value_VProj (dtb__346, c, tele, i, fi))
))))
# 868 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeNeutralFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (n : Core_dTerm.t_Neutral) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VNeutral (n)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VNeutral (n)) else (match n with
  | Core_dTerm.C_Neutral_NVar (dtb__347, dtb__348, dtb__349) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__347, dtb__348, ((B_dData_dList.v_map ((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__349)))))
  | Core_dTerm.C_Neutral_NGlobal (dtb__350, dtb__351) -> (let sp2 = ((B_dData_dList.v_map ((((v_normalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__351) in (match ((Core_dTerm.v_defLookup dtb__350) defs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) ((v_applySpine ((v_eval B_dData_dList.C_List_Nil) dtb__352)) sp2))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_primReduce defs) sols) (evalFuel - 1)) dtb__350) sp2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__353) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__353)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__350, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
# 887 "Vuna/Compiler/Core/Eval.vuna"
and v_normalizeIfFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (evalFuel : int) (c : Core_dTerm.t_Value) (th : Core_dTerm.t_Value) (el : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Core_dTerm.C_Value_VIf (c, th, el)) else (if (evalFuel <= 0) then (Core_dTerm.C_Value_VIf (c, th, el)) else (match (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) c) with
  | Core_dTerm.C_Value_VBool (dtb__354) -> (((((v_normalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (if dtb__354 then th else el))
  | dtb__355 -> (Core_dTerm.C_Value_VIf (dtb__355, th, el))
))))

# 906 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteFuelBound = 262144

# 968 "Vuna/Compiler/Core/Eval.vuna"
let v_applyClosureBinder = (fun (mc0 : Core_dTerm.t_Closure) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | { Core_dTerm.f_Closure_closureEnv = dtb__356; Core_dTerm.f_Closure_closureBody = dtb__357 } -> ((v_eval ((B_dData_dList.v_append (B_dData_dList.v_reverse mc1)) dtb__356)) dtb__357)
  | _ -> failwith "DT: impossible branch"
))

# 971 "Vuna/Compiler/Core/Eval.vuna"
let v_freshVar = (fun (name : string) (level : int) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (name, level, B_dData_dList.C_List_Nil)))))

# 962 "Vuna/Compiler/Core/Eval.vuna"
let rec v_argValsAt = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__360; B_dData_dPair.f_Pair_second = dtb__361 } -> (B_dData_dList.C_List__x58__x58_ (((v_freshVar dtb__360) (mc1 + mc2)), (((v_argValsAt dtb__359) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Core/Eval.vuna"
let v_varIndexM = (fun (depth : int) (level : int) -> (if (level < depth) then (B_dData_dMaybe.C_Maybe_Just (((depth - level) - 1))) else B_dData_dMaybe.C_Maybe_Nothing))

# 999 "Vuna/Compiler/Core/Eval.vuna"
let rec v_applyTermSpine = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__362, dtb__363) -> ((v_applyTermSpine (Core_dTerm.C_Term_TApp (mc0, dtb__362, Core_dTerm.C_Rig_RigOmega))) dtb__363)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 912 "Vuna/Compiler/Core/Eval.vuna"
let rec v_quoteFuel = (fun (fuel : int) (depth : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (match v with
  | Core_dTerm.C_Value_VType (dtb__364) -> (Core_dTerm.C_Term_TType (dtb__364))
  | Core_dTerm.C_Value_VPi (dtb__365, dtb__366, dtb__367, dtb__368, dtb__369) -> (Core_dTerm.C_Term_TPi (dtb__365, dtb__366, dtb__367, (((v_quoteFuel (fuel - 1)) depth) dtb__368), (((v_quoteFuel (fuel - 1)) (depth + 1)) ((v_applyClosure dtb__369) ((v_freshVar dtb__365) depth)))))
  | Core_dTerm.C_Value_VLam (dtb__370, dtb__371, dtb__372) -> (Core_dTerm.C_Term_TLam (dtb__370, dtb__371, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_quoteFuel (fuel - 1)) (depth + 1)) ((v_applyClosure dtb__372) ((v_freshVar dtb__370) depth)))))
  | Core_dTerm.C_Value_VNeutral (dtb__373) -> (((v_quoteNeutralFuel (fuel - 1)) depth) dtb__373)
  | Core_dTerm.C_Value_VMeta (dtb__374, dtb__375) -> ((v_applyTermSpine (Core_dTerm.C_Term_TMeta (dtb__374))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> (((v_quoteFuel (fuel - 1)) depth) a))) dtb__375))
  | Core_dTerm.C_Value_VCon (dtb__376, dtb__377) -> (Core_dTerm.C_Term_TCon (dtb__376, (((v_quoteArgValuesFuel (fuel - 1)) depth) dtb__377)))
  | Core_dTerm.C_Value_VApp (dtb__378, dtb__379) -> (Core_dTerm.C_Term_TApp ((((v_quoteFuel (fuel - 1)) depth) dtb__378), (((v_quoteFuel (fuel - 1)) depth) dtb__379), Core_dTerm.C_Rig_RigOmega))
  | Core_dTerm.C_Value_VCase (dtb__380, dtb__381) -> (Core_dTerm.C_Term_TCase ((((v_quoteFuel (fuel - 1)) depth) dtb__380), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_VCaseAlt) -> (((v_quoteCaseAltFuel (fuel - 1)) depth) alt))) dtb__381)))
  | Core_dTerm.C_Value_VProj (dtb__382, dtb__383, dtb__384, dtb__385, dtb__386) -> (Core_dTerm.C_Term_TProj ((((v_quoteFuel (fuel - 1)) depth) dtb__382), dtb__383, dtb__384, dtb__385, dtb__386))
  | Core_dTerm.C_Value_VInt (dtb__387) -> (Core_dTerm.C_Term_TInt (dtb__387))
  | Core_dTerm.C_Value_VStr (dtb__388) -> (Core_dTerm.C_Term_TStr (dtb__388))
  | Core_dTerm.C_Value_VFloat (dtb__389) -> (Core_dTerm.C_Term_TFloat (dtb__389))
  | Core_dTerm.C_Value_VBool (dtb__390) -> (Core_dTerm.C_Term_TBool (dtb__390))
  | Core_dTerm.C_Value_VIf (dtb__391, dtb__392, dtb__393) -> (Core_dTerm.C_Term_TIf ((((v_quoteFuel (fuel - 1)) depth) dtb__391), (((v_quoteFuel (fuel - 1)) depth) dtb__392), (((v_quoteFuel (fuel - 1)) depth) dtb__393)))
  | _ -> failwith "DT: impossible branch"
)))
# 937 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteCaseAltFuel = (fun (fuel : int) (depth : int) (alt0 : Core_dTerm.t_VCaseAlt) -> (if (fuel <= 0) then { Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = B_dData_dList.C_List_Nil; Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) } else (match alt0 with
  | { Core_dTerm.f_VCaseAlt_vCaseAltName = dtb__394; Core_dTerm.f_VCaseAlt_vCaseAltBinders = dtb__395; Core_dTerm.f_VCaseAlt_vCaseAltClosure = dtb__396 } -> (let n = (B_dData_dList.v_length dtb__395) in (let argVals = (((v_argValsAt dtb__395) depth) 0) in (let body = (((v_quoteFuel (fuel - 1)) (depth + n)) ((v_applyClosureBinder dtb__396) argVals)) in { Core_dTerm.f_CaseAlt_caseAltName = dtb__394; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__395); Core_dTerm.f_CaseAlt_caseAltBody = body })))
  | _ -> failwith "DT: impossible branch"
)))
# 953 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteArgValuesFuel = (fun (fuel : int) (depth : int) (vs : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match vs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__397, dtb__398) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_quoteFuel (fuel - 1)) depth) dtb__397); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (((v_quoteArgValuesFuel (fuel - 1)) depth) dtb__398)))
  | _ -> failwith "DT: impossible branch"
)))
# 977 "Vuna/Compiler/Core/Eval.vuna"
and v_quoteNeutralFuel = (fun (fuel : int) (depth : int) (n : Core_dTerm.t_Neutral) -> (if (fuel <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (match n with
  | Core_dTerm.C_Neutral_NVar (dtb__399, dtb__400, dtb__401) -> (let idx = (match ((v_varIndexM depth) dtb__400) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__402) -> dtb__402
  | B_dData_dMaybe.C_Maybe_Nothing -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
) in ((v_applyTermSpine (Core_dTerm.C_Term_TVar (dtb__399, idx, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> (((v_quoteFuel (fuel - 1)) depth) a))) dtb__401)))
  | Core_dTerm.C_Neutral_NGlobal (dtb__403, dtb__404) -> ((v_applyTermSpine (Core_dTerm.C_Term_TGlobal (dtb__403))) ((B_dData_dList.v_map (fun (a : Core_dTerm.t_Value) -> (((v_quoteFuel (fuel - 1)) depth) a))) dtb__404))
  | _ -> failwith "DT: impossible branch"
)))

# 909 "Vuna/Compiler/Core/Eval.vuna"
let v_quote = (fun (depth : int) (v : Core_dTerm.t_Value) -> (((v_quoteFuel v_quoteFuelBound) depth) v))

# 934 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteCaseAlt = (fun (depth : int) (alt : Core_dTerm.t_VCaseAlt) -> (((v_quoteCaseAltFuel v_quoteFuelBound) depth) alt))

# 950 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteArgValues = (fun (depth : int) (vs : Core_dTerm.t_Value B_dData_dList.t_List) -> (((v_quoteArgValuesFuel v_quoteFuelBound) depth) vs))

# 974 "Vuna/Compiler/Core/Eval.vuna"
let v_quoteNeutral = (fun (depth : int) (n : Core_dTerm.t_Neutral) -> (((v_quoteNeutralFuel v_quoteFuelBound) depth) n))

# 1007 "Vuna/Compiler/Core/Eval.vuna"
let rec v_substSolvedMetas = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__405, dtb__406, dtb__407) -> (Core_dTerm.C_Term_TIf (((v_substSolvedMetas mc0) dtb__405), ((v_substSolvedMetas mc0) dtb__406), ((v_substSolvedMetas mc0) dtb__407)))
  | Core_dTerm.C_Term_TCase (dtb__408, dtb__409) -> (Core_dTerm.C_Term_TCase (((v_substSolvedMetas mc0) dtb__408), ((B_dData_dList.v_map (v_substSolvedAlt mc0)) dtb__409)))
  | Core_dTerm.C_Term_TRecUpd (dtb__410, dtb__411, dtb__412, dtb__413, dtb__414) -> (Core_dTerm.C_Term_TRecUpd (((v_substSolvedMetas mc0) dtb__410), dtb__411, dtb__412, dtb__413, ((v_substSolvedMetas mc0) dtb__414)))
  | Core_dTerm.C_Term_TProj (dtb__415, dtb__416, dtb__417, dtb__418, dtb__419) -> (Core_dTerm.C_Term_TProj (((v_substSolvedMetas mc0) dtb__415), dtb__416, dtb__417, dtb__418, dtb__419))
  | Core_dTerm.C_Term_TRecord (dtb__420, dtb__421) -> (Core_dTerm.C_Term_TRecord (dtb__420, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((v_substSolvedMetas mc0) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__421)))
  | Core_dTerm.C_Term_TMk (dtb__422, dtb__423) -> (Core_dTerm.C_Term_TMk (dtb__422, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((v_substSolvedMetas mc0) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__423)))
  | Core_dTerm.C_Term_TCon (dtb__424, dtb__425) -> (Core_dTerm.C_Term_TCon (dtb__424, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((v_substSolvedMetas mc0) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__425)))
  | Core_dTerm.C_Term_TApp (dtb__426, dtb__427, dtb__428) -> (Core_dTerm.C_Term_TApp (((v_substSolvedMetas mc0) dtb__426), ((v_substSolvedMetas mc0) dtb__427), dtb__428))
  | Core_dTerm.C_Term_TLam (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433) -> (let slot2 = (let nd_uscrut7 = dtb__431 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__434) -> (match dtb__434 with
  | { B_dData_dPair.f_Pair_first = dtb__435; B_dData_dPair.f_Pair_second = dtb__436 } -> (match dtb__436 with
  | { B_dData_dPair.f_Pair_first = dtb__437; B_dData_dPair.f_Pair_second = dtb__438 } -> (let bt2 = (match dtb__437 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__440) -> (B_dData_dMaybe.C_Maybe_Just (((v_substSolvedMetas mc0) dtb__440)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__438 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__439) -> (B_dData_dMaybe.C_Maybe_Just (((v_substSolvedMetas mc0) dtb__439)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__435; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__429, dtb__430, slot2, dtb__432, ((v_substSolvedMetas mc0) dtb__433))))
  | Core_dTerm.C_Term_TPi (dtb__441, dtb__442, dtb__443, dtb__444, dtb__445) -> (Core_dTerm.C_Term_TPi (dtb__441, dtb__442, dtb__443, ((v_substSolvedMetas mc0) dtb__444), ((v_substSolvedMetas mc0) dtb__445)))
  | Core_dTerm.C_Term_TMeta (dtb__446) -> (match ((Core_dTerm.v_metaLookupList dtb__446) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__447) -> (let soln = ((v_quote 0) dtb__447) in (if ((Core_dTerm.v_hasFreeTermVar 0) soln) then mc1 else soln))
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
# 1050 "Vuna/Compiler/Core/Eval.vuna"
and v_substSolvedAlt = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_CaseAlt) -> (match mc1 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__448; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__449; Core_dTerm.f_CaseAlt_caseAltBody = dtb__450 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__448; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__449; Core_dTerm.f_CaseAlt_caseAltBody = ((v_substSolvedMetas mc0) dtb__450) }
  | _ -> failwith "DT: impossible branch"
))

# 1063 "Vuna/Compiler/Core/Eval.vuna"
let rec v_substSolvedMetasAtGo = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TIf (dtb__451, dtb__452, dtb__453) -> (Core_dTerm.C_Term_TIf ((((v_substSolvedMetasAtGo mc0) mc1) dtb__451), (((v_substSolvedMetasAtGo mc0) mc1) dtb__452), (((v_substSolvedMetasAtGo mc0) mc1) dtb__453)))
  | Core_dTerm.C_Term_TCase (dtb__454, dtb__455) -> (Core_dTerm.C_Term_TCase ((((v_substSolvedMetasAtGo mc0) mc1) dtb__454), ((B_dData_dList.v_map ((v_substSolvedAltAt mc0) mc1)) dtb__455)))
  | Core_dTerm.C_Term_TRecUpd (dtb__456, dtb__457, dtb__458, dtb__459, dtb__460) -> (Core_dTerm.C_Term_TRecUpd ((((v_substSolvedMetasAtGo mc0) mc1) dtb__456), dtb__457, dtb__458, dtb__459, (((v_substSolvedMetasAtGo mc0) mc1) dtb__460)))
  | Core_dTerm.C_Term_TProj (dtb__461, dtb__462, dtb__463, dtb__464, dtb__465) -> (Core_dTerm.C_Term_TProj ((((v_substSolvedMetasAtGo mc0) mc1) dtb__461), dtb__462, dtb__463, dtb__464, dtb__465))
  | Core_dTerm.C_Term_TRecord (dtb__466, dtb__467) -> (Core_dTerm.C_Term_TRecord (dtb__466, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substSolvedMetasAtGo mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__467)))
  | Core_dTerm.C_Term_TMk (dtb__468, dtb__469) -> (Core_dTerm.C_Term_TMk (dtb__468, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substSolvedMetasAtGo mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__469)))
  | Core_dTerm.C_Term_TCon (dtb__470, dtb__471) -> (Core_dTerm.C_Term_TCon (dtb__470, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substSolvedMetasAtGo mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__471)))
  | Core_dTerm.C_Term_TApp (dtb__472, dtb__473, dtb__474) -> (Core_dTerm.C_Term_TApp ((((v_substSolvedMetasAtGo mc0) mc1) dtb__472), (((v_substSolvedMetasAtGo mc0) mc1) dtb__473), dtb__474))
  | Core_dTerm.C_Term_TLam (dtb__475, dtb__476, dtb__477, dtb__478, dtb__479) -> (let slot2 = (let nd_uscrut8 = dtb__477 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__480) -> (match dtb__480 with
  | { B_dData_dPair.f_Pair_first = dtb__481; B_dData_dPair.f_Pair_second = dtb__482 } -> (match dtb__482 with
  | { B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = dtb__484 } -> (let bt2 = (match dtb__483 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__486) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substSolvedMetasAtGo mc0) mc1) dtb__486)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__484 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__485) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substSolvedMetasAtGo mc0) mc1) dtb__485)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__481; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__475, dtb__476, slot2, dtb__478, (((v_substSolvedMetasAtGo mc0) mc1) dtb__479))))
  | Core_dTerm.C_Term_TPi (dtb__487, dtb__488, dtb__489, dtb__490, dtb__491) -> (Core_dTerm.C_Term_TPi (dtb__487, dtb__488, dtb__489, (((v_substSolvedMetasAtGo mc0) mc1) dtb__490), (((v_substSolvedMetasAtGo mc0) mc1) dtb__491)))
  | Core_dTerm.C_Term_TMeta (dtb__492) -> (match ((Core_dTerm.v_metaLookupList dtb__492) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__493) -> ((v_quote mc0) dtb__493)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
# 1108 "Vuna/Compiler/Core/Eval.vuna"
and v_substSolvedAltAt = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_CaseAlt) -> (match mc2 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__494; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__495; Core_dTerm.f_CaseAlt_caseAltBody = dtb__496 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__494; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__495; Core_dTerm.f_CaseAlt_caseAltBody = (((v_substSolvedMetasAtGo mc0) mc1) dtb__496) }
  | _ -> failwith "DT: impossible branch"
))

# 1059 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAt = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> (((v_substSolvedMetasAtGo mc0) mc1) mc2)
))

# 1111 "Vuna/Compiler/Core/Eval.vuna"
let v_isNilList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 1117 "Vuna/Compiler/Core/Eval.vuna"
let v_showValueAt = (fun (depth : int) (v : Core_dTerm.t_Value) -> (match v with
  | Core_dTerm.C_Value_VType (dtb__497) -> (if ((Core_dTerm.v_levelToInt dtb__497) = 0) then "Type" else ("Type " ^ (bi_strFromInt (Core_dTerm.v_levelToInt dtb__497))))
  | Core_dTerm.C_Value_VNeutral (dtb__498) -> (match dtb__498 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__499, dtb__500) -> (if (v_isNilList dtb__500) then dtb__499 else (Core_dTerm.v_showTerm ((v_quote depth) v)))
  | Core_dTerm.C_Neutral_NVar (dtb__501, dtb__502, dtb__503) -> (if (v_isNilList dtb__503) then dtb__501 else (Core_dTerm.v_showTerm ((v_quote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VMeta (dtb__504, dtb__505) -> (if (v_isNilList dtb__505) then ("?" ^ (bi_strFromInt dtb__504)) else (Core_dTerm.v_showTerm ((v_quote depth) v)))
  | Core_dTerm.C_Value_VCon (dtb__506, dtb__507) -> (match ((v_natCtorInt dtb__506) dtb__507) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__508) -> (bi_strFromInt dtb__508)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.v_showTerm ((v_quote depth) v))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.v_showTerm ((v_quote depth) v))
))

# 1135 "Vuna/Compiler/Core/Eval.vuna"
let v_showValue = (fun (v : Core_dTerm.t_Value) -> ((v_showValueAt 0) v))

# 1141 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeFuelBound = 262144

# 1144 "Vuna/Compiler/Core/Eval.vuna"
let v_normalize = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) -> (((((v_normalizeFuel a3) a1) a2) a3) a4))

# 1147 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeCase = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((((v_normalizeCaseFuel a3) a1) a2) a3) a4) a5))

# 1150 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeNeutral = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Neutral) -> (((((v_normalizeNeutralFuel a3) a1) a2) a3) a4))

# 1153 "Vuna/Compiler/Core/Eval.vuna"
let v_normalizeIf = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) (a6 : Core_dTerm.t_Value) -> (((((((v_normalizeIfFuel a3) a1) a2) a3) a4) a5) a6))

# 1174 "Vuna/Compiler/Core/Eval.vuna"
let v_substFuelMax = 1000000

# 1168 "Vuna/Compiler/Core/Eval.vuna"
let v_substFuelFor = (fun (t : Core_dTerm.t_Term) -> (let need = (128 + (4 * (Core_dTerm.v_termSize t))) in (if (need > v_substFuelMax) then v_substFuelMax else need)))

# 1177 "Vuna/Compiler/Core/Eval.vuna"
let rec v_substSolvedMetasAtTblFuel = (fun (fuel : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (depth : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then t else (match t with
  | Core_dTerm.C_Term_TMeta (dtb__509) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__509) sols) with
  | B_dData_dMaybe.C_Maybe_Nothing -> t
  | B_dData_dMaybe.C_Maybe_Just (dtb__510) -> (let q = ((v_quote depth) dtb__510) in (if (Core_dTerm.v_hasNegativeVar q) then t else ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) q)))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb__511, dtb__512, dtb__513, dtb__514, dtb__515) -> (Core_dTerm.C_Term_TPi (dtb__511, dtb__512, dtb__513, ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__514), ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__515)))
  | Core_dTerm.C_Term_TLam (dtb__516, dtb__517, dtb__518, dtb__519, dtb__520) -> (let slot2 = (let nd_uscrut9 = dtb__518 in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__521) -> (match dtb__521 with
  | { B_dData_dPair.f_Pair_first = dtb__522; B_dData_dPair.f_Pair_second = dtb__523 } -> (match dtb__523 with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> (let bt2 = (match dtb__524 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__527) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__527)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__525 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__526) -> (B_dData_dMaybe.C_Maybe_Just (((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__526)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__522; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__516, dtb__517, slot2, dtb__519, ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__520))))
  | Core_dTerm.C_Term_TApp (dtb__528, dtb__529, dtb__530) -> (Core_dTerm.C_Term_TApp (((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__528), ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__529), dtb__530))
  | Core_dTerm.C_Term_TCon (dtb__531, dtb__532) -> (Core_dTerm.C_Term_TCon (dtb__531, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__532)))
  | Core_dTerm.C_Term_TCase (dtb__533, dtb__534) -> (Core_dTerm.C_Term_TCase (((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__533), ((B_dData_dList.v_map (((v_substSolvedAltAtTbl (fuel - 1)) sols) depth)) dtb__534)))
  | Core_dTerm.C_Term_TIf (dtb__535, dtb__536, dtb__537) -> (Core_dTerm.C_Term_TIf (((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__535), ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__536), ((((v_substSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__537)))
  | _ -> t
)))
# 1215 "Vuna/Compiler/Core/Eval.vuna"
and v_substSolvedAltAtTbl = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc2 : int) (mc3 : Core_dTerm.t_CaseAlt) -> (match mc3 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__538; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__539; Core_dTerm.f_CaseAlt_caseAltBody = dtb__540 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__538; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__539; Core_dTerm.f_CaseAlt_caseAltBody = ((((v_substSolvedMetasAtTblFuel mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__539))) dtb__540) }
  | _ -> failwith "DT: impossible branch"
))

# 1163 "Vuna/Compiler/Core/Eval.vuna"
let v_substSolvedMetasAtTbl = (fun (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (depth : int) (t : Core_dTerm.t_Term) -> ((((v_substSolvedMetasAtTblFuel (v_substFuelFor t)) sols) depth) t))
