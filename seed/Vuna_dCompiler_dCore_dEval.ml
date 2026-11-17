open Vuna_runtime
# 20 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dlookupEnv = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0)) else ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv (mc0 - 1)) dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_devalFuelMax = 1000000

# 32 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_devalFuelFor = (fun t -> ((fun need -> (if (need > v_Vuna_dCompiler_dCore_dEval_devalFuelMax) then v_Vuna_dCompiler_dCore_dEval_devalFuelMax else need)) (128 + (4 * (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t)))))

# 42 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnamedDefault = (fun e -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ("default")), (Base_dList.C_Base_dList_dList__x58__x58_ (e, Base_dList.C_Base_dList_dList_Nil)))))))))

# 45 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dhostTailValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffConsole.ConsoleOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffClock.ClockOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffEnv.EnvOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffProcess.ProcessOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffExit.ExitOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffStdin.StdinOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffArgs.ArgsOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffNet.NetOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffRef.RefOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor, Base_dList.C_Base_dList_dList_Nil)), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil)))))), Base_dList.C_Base_dList_dList_Nil))))))

# 50 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dhostRowValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCore_dEval_dnamedDefault (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Base.EffFs.FsOp", Base_dList.C_Base_dList_dList_Nil))))), (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dCore_dEval_dhostTailValue, Base_dList.C_Base_dList_dList_Nil))))))

# 86 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_devalAlt = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__2; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__3; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__4 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName = dtb__2; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders = dtb__3; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure = { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = mc0; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__4 } }
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_devalAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dCore_dEval_devalAlt mc0) dtb__5), ((v_Vuna_dCompiler_dCore_dEval_devalAlts mc0) dtb__6)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv = (fun alt scrut env -> (match (alt).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders with
  | Base_dList.C_Base_dList_dList_Nil -> env
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ (scrut, env))
))

# 133 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_devalIf = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__7) -> (if dtb__7 then mc1 else mc2)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (mc0, mc1, mc2))
))

# 137 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dspineAppend = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__8, dtb__9) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__8, ((Base_dList.v_Base_dList_dappend dtb__9) (Base_dList.C_Base_dList_dList__x58__x58_ (mc1, Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__10, dtb__11, dtb__12) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__10, dtb__11, ((Base_dList.v_Base_dList_dappend dtb__12) (Base_dList.C_Base_dList_dList__x58__x58_ (mc1, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dasInt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__13) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 217 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatMax = 4611686018427387903

# 220 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatClamp = (fun n -> (if (n <= 0) then 0 else (if (n >= v_Vuna_dCompiler_dCore_dEval_dnatMax) then v_Vuna_dCompiler_dCore_dEval_dnatMax else n)))

# 223 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatSatAdd = (fun a b -> (if (a > (v_Vuna_dCompiler_dCore_dEval_dnatMax - b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a + b)))

# 226 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatSatMul = (fun a b -> (if (if (a <= 0) then true else (b <= 0)) then 0 else (if (a > (if b = 0 then failwith "division by zero" else v_Vuna_dCompiler_dCore_dEval_dnatMax / b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a * b))))

# 229 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatTruncSub = (fun a b -> (if (a <= b) then 0 else (a - b)))

# 232 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dnatValueGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor, (Base_dList.C_Base_dList_dList__x58__x58_ (acc, Base_dList.C_Base_dList_dList_Nil)))))))

# 235 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatValue = (fun n -> ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (v_Vuna_dCompiler_dCore_dEval_dnatClamp n)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor, Base_dList.C_Base_dList_dList_Nil))))

# 238 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dnatValueToInt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__14) dtb__15)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__16) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
# 243 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dnatCtorInt = (fun c args -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt dtb__17) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd dtb__19) 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) args) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

# 254 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dasNat = (fun v -> (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt v))

# 275 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (if (if (dtb__20 >= 48) then (dtb__20 <= 57) else false) then ((v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars dtb__21) ((mc1 * 10) + (dtb__20 - 48))) else ((v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars dtb__21) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_ddigitsOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars (Base_dList.dtp_unpack s)) 0))

# 282 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dpow10Of = (fun n -> (if (n <= 0) then 1 else (if (n > 18) then 1000000000000000000 else ((v_Vuna_dCompiler_dCore_dEval_dpow10Of (n - 1)) * 10))))

# 266 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw = (fun raw -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Nil -> ((float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf (dtb__22 ^ dtb__24))) /. (float_of_int (v_Vuna_dCompiler_dCore_dEval_dpow10Of (bi_strLength dtb__24))))
  | _ -> (float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf raw))
)
  | _ -> (float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf raw))
)
  | _ -> (float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf raw))
)) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 46) raw)))

# 286 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dshowFloatOf = (fun x -> (Base_dFloat.v_Base_dFloat_dfloatRender x))

# 290 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw = (fun raw -> (v_Vuna_dCompiler_dCore_dEval_dshowFloatOf (v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw raw)))

# 293 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dasFloat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__26) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw dtb__26)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 297 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dfloatPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (match dtb__28 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__27) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatOf (mc1 dtb__29))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 303 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__30) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__34) -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__32) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatOf ((mc1 dtb__34) dtb__35))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 311 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dfloatBool2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__36) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__40) -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__38) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (((mc1 dtb__40) dtb__41)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 319 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dasStr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__42) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 323 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dasBool = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__43) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__43))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 327 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dintPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__44) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__46) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__48) dtb__49)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 338 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dintPrim2Div = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__50) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__52) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> (if (dtb__55 = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((if dtb__55 = 0 then failwith "division by zero" else dtb__54 / dtb__55))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 346 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dboolPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (match dtb__59 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__56) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__58) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__60) dtb__61)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 355 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dprimConst = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc1))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 359 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dstrPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__62) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__64) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__66) dtb__67)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 367 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dintPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (match dtb__69 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__68) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__70)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 373 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (match dtb__72 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__71) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__73)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 379 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match dtb__75 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__74) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__76) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__78) dtb__79)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 387 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__82, dtb__83) -> (match dtb__83 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__80) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__82) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (if (dtb__85 <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dEval_dnatValue (if dtb__85 = 0 then failwith "division by zero" else dtb__84 / dtb__85)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 395 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dstrPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__86) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__88)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 402 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dstrEq = (fun a b -> (a = b))

# 417 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dcmpInt = (fun a b -> (if (a = b) then 0 else (if (a < b) then (0 - 1) else 1)))

# 405 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dgenericCmp = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__89) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__90) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((if (((Base_dEq.v_Base_dEq_d_x61__x61_ Base_dEq.v_Eq_uBase_uBool_uBool) dtb__89) dtb__90) then 0 else (if dtb__89 then 1 else (0 - 1)))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__91) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__92) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((if (dtb__91 = dtb__92) then 0 else (if (dtb__91 < dtb__92) then (0 - 1) else 1))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__93) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__94) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dcmpInt dtb__93) dtb__94)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 420 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (match dtb__96 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dEval_dgenericCmp dtb__95) dtb__97) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((mc1 dtb__99)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 426 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dstrPrim3 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__100, dtb__101) -> (match dtb__101 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__100) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__102) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__104) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((mc1 dtb__106) dtb__107) dtb__108)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 440 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel = (fun fuel a b -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__109) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__110) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__109) dtb__110)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__111) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__112) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__111 = dtb__112)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__113) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__114) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dstrEq dtb__113) dtb__114)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__115) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__116) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__115 = dtb__116)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__117) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__118) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dEq.v_Base_dEq_d_x61__x61_ Base_dEq.v_Eq_uBase_uBool_uBool) dtb__117) dtb__118)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__119, dtb__120) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__121, dtb__122) -> (if (dtb__119 = dtb__121) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (fuel - 1)) dtb__120) dtb__122) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__123) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__124) -> (((v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel (fuel - 1)) dtb__123) dtb__124)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
# 466 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__125, dtb__126, dtb__127) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__128, dtb__129, dtb__130) -> (if (if (dtb__125 = dtb__128) then (dtb__126 = dtb__129) else false) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (mc0 - 1)) dtb__127) dtb__130) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__131, dtb__132) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__133, dtb__134) -> (if (dtb__131 = dtb__133) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (mc0 - 1)) dtb__132) dtb__134) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))
# 475 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__137, dtb__138) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__139) -> (if dtb__139 then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel mc0) dtb__136) dtb__138) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel mc0) dtb__135) dtb__137))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (true))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))

# 639 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dstrHashChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__140, dtb__141) -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars dtb__141) (((mc1 * 33) + dtb__140) - ((if 1024 = 0 then failwith "division by zero" else ((mc1 * 33) + dtb__140) / 1024) * 1024)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dstrHashOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars (Base_dList.dtp_unpack s)) 0))

# 655 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dnthByte = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (if (mc1 <= 0) then dtb__142 else ((v_Vuna_dCompiler_dCore_dEval_dnthByte dtb__143) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 652 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dstrAtBytes = (fun s i -> (if (if (i < 0) then true else (i >= (bi_strLength s))) then (0 - 1) else ((v_Vuna_dCompiler_dCore_dEval_dnthByte (Base_dList.dtp_unpack s)) i)))

# 644 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_datPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__144) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__148) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__146) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (((v_Vuna_dCompiler_dCore_dEval_dstrAtBytes dtb__148) dtb__149)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 679 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dtakeBytes = (fun n xs -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__150, ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes (n - 1)) dtb__151)))
  | _ -> failwith "DT: impossible branch"
)))

# 685 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_ddropBytes = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__152, dtb__153) -> ((v_Vuna_dCompiler_dCore_dEval_ddropBytes (n - 1)) dtb__153)
  | _ -> failwith "DT: impossible branch"
)))

# 671 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dsubstringBytes = (fun start len s -> ((fun n -> ((fun st -> ((fun ln -> (Base_dList.dtp_pack ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes ln) ((v_Vuna_dCompiler_dCore_dEval_ddropBytes st) (Base_dList.dtp_unpack s))))) (if (len < 0) then 0 else (if ((st + len) > n) then (n - st) else len)))) (if (start < 0) then 0 else (if (start > n) then n else start)))) (bi_strLength s)))

# 661 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dsubstringPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (match dtb__155 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (match dtb__157 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (match dtb__159 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__154) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__156) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__158) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__162) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((((v_Vuna_dCompiler_dCore_dEval_dsubstringBytes dtb__160) dtb__161) dtb__162)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 699 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dargAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__163, dtb__164) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163)) else ((v_Vuna_dCompiler_dCore_dEval_dargAt (mc0 - 1)) dtb__164))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 704 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_devalProjFuel = (fun fuel v c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (v, c, tele, i, fi)) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__165, dtb__166) -> (match ((v_Vuna_dCompiler_dCore_dEval_dargAt i) dtb__166) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> dtb__167
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (v, c, tele, i, fi))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (v, c, tele, i, fi))
)))

# 54 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_devalFuel = (fun fuel env t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__168, dtb__169, dtb__170) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__169) env) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> dtb__171
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__168, dtb__169, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__172) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__172, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__173) -> (if (dtb__173 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dhostRowName) then v_Vuna_dCompiler_dCore_dEval_dhostRowValue else (if (dtb__173 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dhostTailName) then v_Vuna_dCompiler_dCore_dEval_dhostTailValue else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__173, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__174) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__174))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__175, dtb__176, dtb__177, (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__178), { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = env; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__179 }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__180, dtb__181, dtb__182) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__180, dtb__181, { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = env; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__182 }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__183, dtb__184, dtb__185) -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__183)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__184))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__186, dtb__187) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__186, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__187)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__188, dtb__189) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__188, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__189)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__190, dtb__191) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__190, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__191)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__192, dtb__193) -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__192)) ((v_Vuna_dCompiler_dCore_dEval_devalAlts env) dtb__193))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198) -> ((((((v_Vuna_dCompiler_dCore_dEval_devalProjFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__194)) dtb__195) dtb__196) dtb__197) dtb__198)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__199)) (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dCore_dEval_devalAlt env) { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__200; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__201; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__203 }), Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__204) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__204))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__205) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__205))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__206) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw dtb__206)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__207) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__207))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__208, dtb__209, dtb__210) -> (((v_Vuna_dCompiler_dCore_dEval_devalIf (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__208)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__209)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__210))
  | _ -> failwith "DT: impossible branch"
)))
# 96 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel = (fun fuel env args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__211, dtb__212) -> (match dtb__211 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__213; Base_dPair.f_Base_dPair_dPair_second = dtb__214 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__213), (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__212)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) args)))
# 107 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_devalCaseFuel = (fun fuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match scrut with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__215, dtb__216) -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) dtb__215) dtb__216) alts)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts))
)))
# 116 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel = (fun fuel c args alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (c, args)), Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__217, dtb__218) -> (if ((dtb__217).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName = c) then (match (dtb__217).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__219; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__220 } -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse args)) dtb__219)) dtb__220)
  | _ -> failwith "DT: impossible branch"
) else (if ((dtb__217).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName = "") then (match (dtb__217).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__221; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__222 } -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__217) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (c, args))) dtb__221)) dtb__222)
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) c) args) dtb__218)))
  | _ -> failwith "DT: impossible branch"
)))
# 144 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel = (fun fuel f a -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__223, dtb__224) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__223, ((Base_dList.v_Base_dList_dappend dtb__224) (Base_dList.C_Base_dList_dList__x58__x58_ (a, Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__225) -> (match dtb__225 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__226, dtb__227) -> (match dtb__227 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__228, dtb__229) -> (match dtb__229 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__226 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEraseName) then (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) dtb__228) a) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__226, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__228, Base_dList.C_Base_dList_dList_Nil))))) a))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__225) a)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__226 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEraseName) then a else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__226, Base_dList.C_Base_dList_dList_Nil))) a))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__225) a)))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__225) a)))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__230, dtb__231, dtb__232) -> (match dtb__232 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__233; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__234 } -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (Base_dList.C_Base_dList_dList__x58__x58_ (a, dtb__233))) dtb__234)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (f, a))
)) f)))

# 24 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_deval = (fun env t -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (v_Vuna_dCompiler_dCore_dEval_devalFuelFor t)) env) t))

# 93 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun env args -> (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel 128) env) args))

# 104 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut alts -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel 128) scrut) alts))

# 113 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun c args alts -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel 128) c) args) alts))

# 141 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f a -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel 128) f) a))

# 159 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dapplyClosure = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__235; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__236 } -> ((v_Vuna_dCompiler_dCore_dEval_deval (Base_dList.C_Base_dList_dList__x58__x58_ (mc1, dtb__235))) dtb__236)
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dapplySpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__237, dtb__238) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__237)) dtb__238)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dobsReduce = (fun g sp -> (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsLevelIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsLogIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsCounterIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsMarkIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanBeginIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanEndIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsSampleStartIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsSampleStopIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanIntrinsicName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (match dtb__240 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (match dtb__242 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__243, dtb__244) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dapplyValue dtb__243) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0))))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0))))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0))))
)) sp) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanLabIntrinsicName) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__245, dtb__246) -> (match dtb__246 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__247, dtb__248) -> (match dtb__248 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__249, dtb__250) -> (match dtb__250 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__251, dtb__252) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dapplyValue dtb__251) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0))))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0))))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0))))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0))))
)) sp) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))))

# 171 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dforce = (fun defs sols fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__253, dtb__254) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__253) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__255) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__255) dtb__254))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260) -> ((fun b2 -> (match b2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__261, dtb__262) -> (match ((v_Vuna_dCompiler_dCore_dEval_dargAt dtb__259) dtb__262) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__263)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (b2, dtb__257, dtb__258, dtb__259, dtb__260))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (b2, dtb__257, dtb__258, dtb__259, dtb__260))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__256))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__264, dtb__265) -> ((fun s2 -> (match s2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__266, dtb__267) -> (match dtb__265 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (s2, Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__266) dtb__267) dtb__265))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (s2, dtb__265))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__264))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__268, dtb__269) -> ((fun f2 -> (match f2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__270, dtb__271, dtb__272) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__272) dtb__269))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__273, dtb__274) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__273, ((Base_dList.v_Base_dList_dappend dtb__274) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__269, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__275) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__275) dtb__269))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (f2, dtb__269))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__268))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__276) -> (match dtb__276 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__277, dtb__278) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__277) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__279)) dtb__278))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (fuel - 1)) dtb__277) dtb__278) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__280) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__280)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
)))
# 496 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_drowRemReduce = (fun defs sols fuel e r -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__281, dtb__282) -> (match dtb__282 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__283, dtb__284) -> (match dtb__284 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__285, dtb__286) -> (if (dtb__281 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__287) -> (if dtb__287 then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__285)) else (match (((((v_Vuna_dCompiler_dCore_dEval_drowRemReduce defs) sols) (fuel - 1)) e) dtb__285) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__281, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__283, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__288, Base_dList.C_Base_dList_dList_Nil))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel (fuel - 1)) e) dtb__283)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> (if (dtb__281 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor, Base_dList.C_Base_dList_dList_Nil)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
)
  | _ -> (if (dtb__281 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor, Base_dList.C_Base_dList_dList_Nil)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) r))))
# 512 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dappendReduce = (fun defs sols fuel a b -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) a) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__289, dtb__290) -> (if (dtb__289 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) b))) else (if (dtb__289 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__291, dtb__292) -> (match dtb__292 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__293, dtb__294) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) b) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__295, dtb__296) -> (if (dtb__295 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__289, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__291, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__293, Base_dList.C_Base_dList_dList_Nil)))))))) else (match (((((v_Vuna_dCompiler_dCore_dEval_dappendReduce defs) sols) (fuel - 1)) dtb__293) b) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__297) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__289, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__291, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__297, Base_dList.C_Base_dList_dList_Nil))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__290) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
# 527 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs sols fuel g sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowRemName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__298, dtb__299) -> (match dtb__299 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__300, dtb__301) -> (((((v_Vuna_dCompiler_dCore_dEval_drowRemReduce defs) sols) (fuel - 1)) dtb__298) dtb__300)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowAppendName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__302, dtb__303) -> (match dtb__303 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__304, dtb__305) -> (((((v_Vuna_dCompiler_dCore_dEval_dappendReduce defs) sols) (fuel - 1)) dtb__302) dtb__304)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp) else (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__306) -> (match (dtb__306).Vuna_dCompiler_dBase_dIntrinsics.f_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsic_intrinsicOp with
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpAdd -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a + b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpSub -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a - b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpMul -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a * b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpDiv -> (v_Vuna_dCompiler_dCore_dEval_dintPrim2Div sp)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpEqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a = b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNeqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((Base_dBool.v_Base_dBool_dnot (a = b))))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpLtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a < b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpLeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a <= b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpGtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a > b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpGeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a >= b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpEqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNeqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b))))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpLtValue -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o < 0)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpLeValue -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o <= 0)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpGtValue -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o > 0)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpGeValue -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o >= 0)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpConcat -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((a ^ b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpAnd -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((if a then b else false)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpOr -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((if a then true else b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((bi_strFromInt n)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrLength -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((bi_strLength s)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrHash -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((v_Vuna_dCompiler_dCore_dEval_dstrHashOf s)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrAt -> (v_Vuna_dCompiler_dCore_dEval_datPrim sp)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrSubstring -> (v_Vuna_dCompiler_dCore_dEval_dsubstringPrim sp)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrShow -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowCoreString s)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNatAdd -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd a) b))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNatSub -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatTruncSub a) b))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNatMul -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatMul a) b))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNatDiv -> (v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div sp)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNatToInt -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (n))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNatFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (v_Vuna_dCompiler_dCore_dEval_dnatValue (v_Vuna_dCompiler_dCore_dEval_dnatClamp n))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpAddF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a +. b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpSubF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a -. b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpMulF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a *. b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpDivF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a /. b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpEqF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a = b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNeqF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a <> b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpLtF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a < b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpLeF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a <= b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpGtF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a > b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpGeF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a >= b)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpFloatAbs -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim1 sp) abs_float)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpFloatSqrt -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim1 sp) sqrt)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrFromFloat -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__307, dtb__308) -> (match dtb__307 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__309) -> (match dtb__308 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw dtb__309)))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpFloatFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatOf (float_of_int n))))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpIntFromFloat -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__310, dtb__311) -> (match dtb__310 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__312) -> (match dtb__311 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((int_of_float (v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw dtb__312))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrUnpack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrPack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrConcatMany -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpStrSubstTemplate -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpIdentity -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__313, dtb__314) -> (match dtb__314 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__313))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpBitAnd -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a land b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpBitOr -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a lor b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpBitXor -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a lxor b)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpBitNot -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun a -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((lnot a)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpBitShl -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((if n < 0 || n >= 63 then 0 else a lsl n)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpBitShr -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((if n < 0 || n >= 63 then 0 else a lsr n)))))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsicOp_OpNone -> (match ((v_Vuna_dCompiler_dCore_dEval_dobsReduce g) sp) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__315) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__315))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_ddebugOnIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (false)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_ddebugLineIntrinsicName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (0)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 489 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dforceLabelArgs = (fun defs sols fuel v -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__316) -> (match dtb__316 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__317, dtb__318, dtb__319) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__317, dtb__318, ((Base_dList.v_Base_dList_dmap (fun a -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) a))) dtb__319)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__320, dtb__321) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__320, ((Base_dList.v_Base_dList_dmap (fun a -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) a))) dtb__321)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> nd_uscrut4
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) v)))

# 712 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel = (fun fuel defs sols evalFuel v -> (if (fuel <= 0) then v else (if (evalFuel <= 0) then v else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) evalFuel) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__322) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel (fuel - 1)) defs) sols) evalFuel) dtb__322)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__323, dtb__324, dtb__325) -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel (fuel - 1)) defs) sols) evalFuel) dtb__323) dtb__324) dtb__325)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__326, dtb__327) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel (fuel - 1)) defs) sols) evalFuel) dtb__326) dtb__327)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332) -> (((((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeProjFuel (fuel - 1)) defs) sols) evalFuel) dtb__328) dtb__329) dtb__330) dtb__331) dtb__332)
  | dtb__333 -> dtb__333
))))
# 724 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel = (fun fuel defs sols evalFuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) scrut) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__334, dtb__335) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__334) dtb__335) alts))
  | dtb__336 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__336, alts))
))))
# 732 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dnormalizeProjFuel = (fun fuel defs sols evalFuel v c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (v, c, tele, i, fi)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (v, c, tele, i, fi)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__337, dtb__338) -> (match ((v_Vuna_dCompiler_dCore_dEval_dargAt i) dtb__338) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__339) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__339)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (v, c, tele, i, fi))
  | _ -> failwith "DT: impossible branch"
)
  | dtb__340 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__340, c, tele, i, fi))
))))
# 741 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel = (fun fuel defs sols evalFuel n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (n)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (n)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__341, dtb__342, dtb__343) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__341, dtb__342, ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__343)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__344, dtb__345) -> ((fun sp2 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__344) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__346) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__346)) sp2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (evalFuel - 1)) dtb__344) sp2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__347) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__347)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__344, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__345))
  | _ -> failwith "DT: impossible branch"
))))
# 756 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel = (fun fuel defs sols evalFuel c th el -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (c, th, el)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (c, th, el)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) c) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__348) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (if dtb__348 then th else el))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__349) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__349)), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) el)))
  | dtb__350 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__350, (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) el)))
))))

# 829 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__351; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__352 } -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__353, dtb__354) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__353, dtb__351)); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__352 }) dtb__354)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ("_alt", Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dfreshVar = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil)))))

# 823 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dargValsAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__355, dtb__356) -> (match dtb__355 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__357; Base_dPair.f_Base_dPair_dPair_second = dtb__358 } -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__357) (mc1 + mc2)), (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__356) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 852 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dvarIndex = (fun depth level -> (if (level < depth) then ((depth - level) - 1) else (0 - 1)))

# 855 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__359, dtb__360) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__359, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))) dtb__360)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 774 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dquoteFuel = (fun fuel depth v -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__361) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__361))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__362, dtb__363, dtb__364, dtb__365, dtb__366) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__362, dtb__363, dtb__364, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__365), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__366) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__362) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__367, dtb__368, dtb__369) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__367, dtb__368, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__369) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__367) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__370) -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel (fuel - 1)) depth) dtb__370)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__371, dtb__372) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__371))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__372))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__373, dtb__374) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__373, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__374)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__375, dtb__376) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__375), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__376), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__377, dtb__378) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__377), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel (fuel - 1)) depth) alt))) dtb__378)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__379, dtb__380, dtb__381, dtb__382, dtb__383) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__379), dtb__380, dtb__381, dtb__382, dtb__383))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__384) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__384))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__385) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__385))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__386) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__386))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__387) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__387))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__388, dtb__389, dtb__390) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__388), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__389), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__390)))
  | _ -> failwith "DT: impossible branch"
)))
# 803 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel = (fun fuel depth alt0 -> (if (fuel <= 0) then { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ""; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) } else (match alt0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName = dtb__391; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders = dtb__392; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure = dtb__393 } -> ((fun n -> ((fun argVals -> ((fun body -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__391; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__392; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = body }) (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__393) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__392) depth) 0))) (Base_dList.v_Base_dList_dlength dtb__392))
  | _ -> failwith "DT: impossible branch"
)))
# 816 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel = (fun fuel depth vs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__394, dtb__395) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__394); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__395)))
  | _ -> failwith "DT: impossible branch"
)))
# 840 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel = (fun fuel depth n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__396, dtb__397, dtb__398) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__396, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__397), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__398))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__399, dtb__400) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__399))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__400))
  | _ -> failwith "DT: impossible branch"
)))

# 771 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth v -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel 64) depth) v))

# 800 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun depth alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel 64) depth) alt))

# 813 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun depth vs -> (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel 64) depth) vs))

# 837 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth n -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel 64) depth) n))

# 863 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__401, dtb__402, dtb__403) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__401), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__402), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__403)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__404, dtb__405) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__404), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt mc0)) dtb__405)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__406), dtb__407, dtb__408, dtb__409, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__410)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__411), dtb__412, dtb__413, dtb__414, dtb__415))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__416, dtb__417) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__416, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__417)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__418, dtb__419) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__418, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__419)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__420, dtb__421) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__420, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__421)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__422, dtb__423, dtb__424) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__422), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__423), dtb__424))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__425, dtb__426, dtb__427) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__425, dtb__426, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__427)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__428, dtb__429, dtb__430, dtb__431, dtb__432) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__428, dtb__429, dtb__430, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__431), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__432)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__433) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__433) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__434) -> ((fun soln -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__434))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
# 889 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__435; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__436; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__437 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__435; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__436; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__437) }
  | _ -> failwith "DT: impossible branch"
))

# 902 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__438, dtb__439, dtb__440) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__438), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__439), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__440)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__441, dtb__442) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__441), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt mc0) mc1)) dtb__442)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__443, dtb__444, dtb__445, dtb__446, dtb__447) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__443), dtb__444, dtb__445, dtb__446, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__447)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__448, dtb__449, dtb__450, dtb__451, dtb__452) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__448), dtb__449, dtb__450, dtb__451, dtb__452))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__453, dtb__454) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__453, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__454)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__455, dtb__456) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__455, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__456)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__457, dtb__458) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__457, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__458)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__459, dtb__460, dtb__461) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__459), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__460), dtb__461))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__462, dtb__463, dtb__464) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__462, dtb__463, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__464)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__465, dtb__466, dtb__467, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__468), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__469)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__470) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__470) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__471) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__471)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
# 928 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__472; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__473; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__474 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__472; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__473; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__474) }
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) mc2)
))

# 931 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_disNilList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

# 937 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dshowValueAt = (fun depth v -> (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__475) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__475) = 0) then "Type" else ("Type " ^ (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__475))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__476) -> (match dtb__476 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__477, dtb__478) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__478) then dtb__477 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__479, dtb__480, dtb__481) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__481) then dtb__479 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__482, dtb__483) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__483) then ("?" ^ (bi_strFromInt dtb__482)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__484, dtb__485) -> (match ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__484) dtb__485) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__486) -> (bi_strFromInt dtb__486)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
))

# 952 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt 0) v))

# 955 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnormalize = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel 1024) a1) a2) a3) a4))

# 958 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnormalizeCase = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel 1024) a1) a2) a3) a4) a5))

# 961 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel 1024) a1) a2) a3) a4))

# 964 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dnormalizeIf = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel 1024) a1) a2) a3) a4) a5) a6))

# 977 "Vuna/Compiler/Core/Eval.vuna"
let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel = (fun fuel sols depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__487) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) dtb__487) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> t
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__488) -> ((fun q -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar q) then t else ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__488))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__489, dtb__490, dtb__491, dtb__492, dtb__493) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__489, dtb__490, dtb__491, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__492), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__493)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__494, dtb__495, dtb__496) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__494, dtb__495, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__496)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__497, dtb__498, dtb__499) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__497), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__498), dtb__499))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__500, dtb__501) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__500, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__501)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__502, dtb__503) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__502), ((Base_dList.v_Base_dList_dmap (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl (fuel - 1)) sols) depth)) dtb__503)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__504, dtb__505, dtb__506) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__504), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__505), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__506)))
  | _ -> t
)))
# 1006 "Vuna/Compiler/Core/Eval.vuna"
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__507; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__508; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__509 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__507; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__508; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__508))) dtb__509) }
  | _ -> failwith "DT: impossible branch"
))

# 974 "Vuna/Compiler/Core/Eval.vuna"
let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl = (fun sols depth t -> ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel 128) sols) depth) t))
