open Vuna_runtime
# 78 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_disNatCtorName = (fun (c : string) -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then true else (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)))

# 82 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue = 4611686018427387903

# 85 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dnatChainNextValue = (fun (n : int) -> (if (n >= v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue) then v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue else (n + 1)))

# 93 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dnatFoldGo = (fun (fuel : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__0, dtb__1) -> (((v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs (fuel - 1)) dtb__0) dtb__1)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__2) -> (match dtb__2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__3, dtb__4) -> (((v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs (fuel - 1)) dtb__3) dtb__4)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__5, dtb__6) -> (((v_Vuna_dCompiler_dCore_dConv_dnatFoldApplied (fuel - 1)) dtb__5) dtb__6)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))
# 107 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs = (fun (fuel : int) (c : string) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc fuel) dtb__7)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) args) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
# 120 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dnatFoldApplied = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__9) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__10 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc mc0) mc2) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__9)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__12 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc mc0) mc2) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
# 128 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc = (fun (fuel : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match ((v_Vuna_dCompiler_dCore_dConv_dnatFoldGo fuel) a) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dConv_dnatChainNextValue dtb__14)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dnatFoldValue = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((v_Vuna_dCompiler_dCore_dConv_dnatFoldGo 1000000) v))

# 134 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dsameNatValue = (fun (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__16) -> (dtb__15 = dtb__16)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_disNatLikeHead = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__17) -> (match dtb__17 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__18, dtb__19) -> (dtb__18 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__20, dtb__21) -> (dtb__20 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)
  | _ -> false
))

# 144 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_disNatLikeValue = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__22, dtb__23) -> (v_Vuna_dCompiler_dCore_dConv_disNatLikeHead dtb__22)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__24) -> (match dtb__24 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__25, dtb__26) -> (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__25)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__27, dtb__28) -> (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__27)
  | _ -> false
))

# 165 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo = (fun (fuel : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then 100000 else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__29, dtb__30) -> (if (dtb__29 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo (fuel - 1)) dtb__31))
  | _ -> 0
)
  | _ -> 0
)) dtb__30) else 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__33) -> (match dtb__33 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__34, dtb__35) -> (if (dtb__34 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo (fuel - 1)) dtb__36))
  | _ -> 0
)
  | _ -> 0
)) dtb__35) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__38, dtb__39) -> (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeHead dtb__38) then (1 + ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo (fuel - 1)) dtb__39)) else 0)
  | _ -> 0
)))

# 162 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo 100000) v))

# 198 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvFuelBase = 4096

# 218 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> ((fun d -> ((fun r -> (if (d >= r) then d else r)) (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__41))) (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue dtb__40) then (v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth dtb__40) else 0))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvNatNear = (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue v) then (v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__42, dtb__43) -> (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__43)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__44) -> (match dtb__44 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__45, dtb__46) -> (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__46)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__47, dtb__48, dtb__49) -> (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__49)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__50, dtb__51) -> (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue dtb__51) then (v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth dtb__51) else 0)
  | _ -> 0
)))

# 233 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvFuelMax = 100000

# 236 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvNatFuel = (fun (depth : int) -> ((fun need -> (if (need > v_Vuna_dCompiler_dCore_dConv_dconvFuelMax) then v_Vuna_dCompiler_dCore_dConv_dconvFuelMax else need)) (v_Vuna_dCompiler_dCore_dConv_dconvFuelBase + (4 * depth))))

# 226 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvFuelFor = (fun (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((fun d -> ((fun d2 -> (v_Vuna_dCompiler_dCore_dConv_dconvNatFuel (if (d >= d2) then d else d2))) (v_Vuna_dCompiler_dCore_dConv_dconvNatNear b))) (v_Vuna_dCompiler_dCore_dConv_dconvNatNear a)))

# 279 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_disNilList = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
))

# 283 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__52, dtb__53, dtb__54) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__55, dtb__56, dtb__57) -> (if (if (if (dtb__52 = dtb__55) then (dtb__53 = dtb__56) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__54) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__57) else false)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__58, dtb__59) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__60, dtb__61) -> (if (if (dtb__58 = dtb__60) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__59) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__61) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 25 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dfastSame = (fun (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__62) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__63) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__62) dtb__63)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__64) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__65) -> (dtb__64 = dtb__65)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__66) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__67) -> (dtb__66 = dtb__67)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__68) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__69) -> (dtb__68 = dtb__69)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__70) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__71) -> (if dtb__70 then dtb__71 else (Base_dData_dBool.v_Base_dData_dBool_dnot dtb__71))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__72) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__73) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((v_Vuna_dCompiler_dCore_dConv_dsameNatValue a) b) else ((v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom dtb__72) dtb__73))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__74, dtb__75) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__76, dtb__77) -> (if (if (if (dtb__74 = dtb__76) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__75) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__77) else false) then true else (if (if (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__74) then (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__76) else false) then ((v_Vuna_dCompiler_dCore_dConv_dsameNatValue a) b) else false))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__78, dtb__79) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__80, dtb__81) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((v_Vuna_dCompiler_dCore_dConv_dsameNatValue a) b) else false)
  | _ -> false
)
  | _ -> false
))

# 476 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun (depth : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((fun sa -> ((fun sb -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcTypeMismatchNoLoc sa) sb)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)))

# 497 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth = (fun (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (m : int) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsDepth m) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__82) -> dtb__82
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> depth
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_disNilSpine = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
))

# 581 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dmemLevel = (fun (mc0 : int) (mc1 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (match dtb__83 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__85; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__86 } -> (if (dtb__86 = mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel mc0) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dtermScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__87, dtb__88, dtb__89) -> (if (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__87) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__88) else false) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__89) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__90) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__91) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__92) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__93) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__94, dtb__95) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__94) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__95) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__96) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__98))) mc3) dtb__100) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__101)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__106, dtb__107) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__107)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__108, dtb__109) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__109)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__110, dtb__111) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__111)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__112, dtb__113, dtb__114) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__112) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__113) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> ((fun slotOk -> (if slotOk then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__119) else false)) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__120) -> (match dtb__120 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__121; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__122 } -> (match dtb__121 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)) dtb__117))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__127) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__128) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__129) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__130) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__131) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__132, dtb__133, dtb__134) -> (if (dtb__133 < mc2) then true else ((fun level -> (if (level >= 0) then (if (level < mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel level) mc3)) else false)) (((mc1 + mc2) - 1) - dtb__133)))
  | _ -> failwith "DT: impossible branch"
))
# 549 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dargsScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (match dtb__135 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__137; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__138 } -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__137) then (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__136) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 554 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_daltsScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__139)))) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__139)) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__140) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__141, dtb__142) -> (match dtb__141 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__143) -> (match dtb__143 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__144, dtb__145, dtb__146) -> (if (v_Vuna_dCompiler_dCore_dConv_disNilSpine dtb__146) then (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf dtb__142) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__147) -> (if ((v_Vuna_dCompiler_dCore_dConv_dmemLevel dtb__145) dtb__147) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__144; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__145 }, dtb__147)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dlevelPosGo = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149) -> (if (dtb__148 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo mc0) dtb__149) (mc2 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dlevelPos = (fun (level : int) (levels : int Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo level) levels) 0))

# 592 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dspineLevels = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__150), (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__151)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dabsPatternBody = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : int) (mc4 : int Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__152, dtb__153, dtb__154) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__152), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__153), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__154)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__155, dtb__156) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__155), ((Base_dData_dList.v_Base_dData_dList_dmap (fun (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) mc4) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })) dtb__156)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__157, dtb__158) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__157, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__158)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__159, dtb__160, dtb__161) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__159), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__160), dtb__161))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> ((fun slot2 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__162, dtb__163, slot2, dtb__165, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__166)))) ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__167) -> (match dtb__167 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__168; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__169 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamTyOf (match dtb__168 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__170) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__170)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__169 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__171) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__171)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__164))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__172, dtb__173, dtb__174, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__175), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__176)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__177, dtb__178, dtb__179) -> (if (dtb__178 < mc3) then mc5 else ((fun level -> (match ((v_Vuna_dCompiler_dCore_dConv_dlevelPos level) mc4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__180) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__177, (((mc3 + mc0) - 1) - dtb__180), dtb__179))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__177, (dtb__178 + mc0), dtb__179))
  | _ -> failwith "DT: impossible branch"
)) (((mc2 + mc3) - 1) - dtb__178)))
  | _ -> mc5
))

# 654 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__181, dtb__182) -> (match dtb__181 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__183; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__184 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__183, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__182) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 662 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dpatternEnv = (fun (created : int) (depth : int) -> (if (depth <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((fun level -> ((fun lvl -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_", lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), ((v_Vuna_dCompiler_dCore_dConv_dpatternEnv created) (depth - 1))))) (if (level < created) then level else 0))) (depth - 1))))

# 672 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dpatternSolution = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__187; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__188 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__187, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = ((v_Vuna_dCompiler_dCore_dConv_dpatternEnv mc1) mc2); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__186) mc3) }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

# 684 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore = (fun (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (m : int) (rhs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((fun created -> ((fun t -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil) t) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) rhs) sols))) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m)))

# 679 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : int) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__189, dtb__190) -> (match dtb__190 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__189 = mc2) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc0)) else ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
))

# 700 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (mc0 = 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 } else (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals (mc0 - 1)) dtb__192) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__193; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__193)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 }
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
)))

# 244 "Vuna/Compiler/Core/Conv.vuna"
let rec v_Vuna_dCompiler_dCore_dConv_dconvNatChains = (fun (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (args2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (fuel : int) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__195) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__196) -> (if (dtb__195 = dtb__196) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
))
# 254 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvNatNeutral = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (n1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) (n2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__197) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__198) -> (if (dtb__197 = dtb__198) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
))
# 264 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvNatApplied = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (f : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (x : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (f2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (x2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__199) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__200) -> (if (dtb__199 = dtb__200) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
))
# 293 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (if ((v_Vuna_dCompiler_dCore_dConv_dfastSame a) b) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__201, dtb__202) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__201) dtb__202) y2)
  | _ -> (match y2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__203, dtb__204) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__203) dtb__204) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel (fuel - 1)) defs) sols) depth) a2) y2)
)
)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
# 310 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__205) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__206) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__205) dtb__206) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__208) dtb__213) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__210) dtb__215)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__211) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__216) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__207) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__217, dtb__218, dtb__219) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__220, dtb__221, dtb__222) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__219) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__222) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__217) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel (fuel - 1)) defs) sols) depth) dtb__217) dtb__219) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__223) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__224) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNatNeutral fuel) defs) sols) depth) dtb__223) dtb__224) a) b) else ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) dtb__223) dtb__224) a) b))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__225, dtb__226, dtb__227) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel (fuel - 1)) defs) sols) depth) a) dtb__225) dtb__227)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__228) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__229) -> (if (dtb__228 = dtb__229) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__230) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__231) -> (if (dtb__230 = dtb__231) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__232) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__233) -> (if (dtb__232 = dtb__233) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__234) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__235) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ Base_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__234) dtb__235) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__236, dtb__237) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__238, dtb__239) -> (if (dtb__236 = dtb__238) then (if (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__236) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNatChains defs) sols) depth) a) b) dtb__237) dtb__239) fuel) else ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) dtb__237) dtb__239)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> (if (if (dtb__241 = dtb__246) then (dtb__243 = dtb__248) else false) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__240) dtb__245) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__250, dtb__251) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__252, dtb__253) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((((((((((v_Vuna_dCompiler_dCore_dConv_dconvNatApplied fuel) defs) sols) depth) dtb__250) dtb__251) dtb__252) dtb__253) a) b) else ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__250) dtb__252)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__251) dtb__253)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["vapp: "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue a); " <> "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue b); " | x="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__251); " x2="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__253)])) else 0)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__254, dtb__255) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__256, dtb__257) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__254) dtb__256)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (fuel - 1)) defs) sols2) depth) dtb__255) dtb__257)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__258, dtb__259, dtb__260) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__261, dtb__262, dtb__263) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__258) dtb__261)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__259) dtb__262)) (fun (sols3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols3) depth) dtb__260) dtb__263)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)))
# 390 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (name : string) (clo : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dClosure) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
# 399 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (name : string) (clo : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dClosure) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
# 408 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (n1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) (n2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) (v1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (v2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (match n1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__264, dtb__265, dtb__266) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__267, dtb__268, dtb__269) -> (if (dtb__265 = dtb__268) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__266) dtb__269) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__270, dtb__271) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__272, dtb__273) -> (if (dtb__270 = dtb__272) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__271) dtb__273) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
)))
# 423 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (mc3 : int) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc7 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, dtb__275) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__276, dtb__277) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__274) dtb__276)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (mc0 - 1)) mc1) sols2) mc3) dtb__275) dtb__277) mc6) mc7))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
))
# 435 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (mc3 : int) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__278, dtb__279) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__280, dtb__281) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__278) dtb__280)) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (mc0 - 1)) mc1) sols2) mc3) dtb__279) dtb__281))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeMismatchCtorArity))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
# 448 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (mc3 : int) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__282, dtb__283) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__284, dtb__285) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (if ((dtb__282).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName = (dtb__284).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName) then (if ((Base_dData_dList.v_Base_dData_dList_dlength (dtb__282).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders) = (Base_dData_dList.v_Base_dData_dList_dlength (dtb__284).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders)) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel (mc0 - 1)) mc1) mc2) mc3) dtb__282) dtb__284) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__286) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__286))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__287) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (mc0 - 1)) mc1) dtb__287) mc3) dtb__283) dtb__285)
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeMismatchCaseVars ((dtb__282).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName))) (dtb__282).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName)) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeMismatchCaseBranch ((dtb__282).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName, (dtb__284).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName))) (dtb__282).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName) (dtb__284).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeMismatchCaseCount))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
# 465 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + n)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (a).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure) args)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (b).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure) args))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (Base_dData_dList.v_Base_dData_dList_dlength bs))) (a).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders)))
# 707 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (m : int) (sp : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (rhs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__288, dtb__289) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__288) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__290) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) Base_dData_dList.C_Base_dData_dList_dList_Nil)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__290) dtb__289))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (m = dtb__288) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__289) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__288, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__289) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__291) -> (match dtb__291 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__292, dtb__293) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__291))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__292, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) dtb__293)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__294, dtb__295, dtb__296) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__291))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__294, dtb__295, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) dtb__296)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))
# 724 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (m : int) (sp : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (whole : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (headVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (if ((Base_dData_dList.v_Base_dData_dList_dlength args) >= (Base_dData_dList.v_Base_dData_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__297; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__298 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__297))) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__298) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) (bi_natSub (Base_dData_dList.v_Base_dData_dList_dlength args) (Base_dData_dList.v_Base_dData_dList_dlength sp))) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))
# 736 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (m : int) (sp : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (rhs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf sp) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) rhs)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__299) -> ((fun created -> ((fun t -> ((fun n -> ((fun levels -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) dtb__299) t) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) ((((v_Vuna_dCompiler_dCore_dConv_dpatternSolution dtb__299) created) depth) ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody n) created) depth) 0) levels) t))) sols))) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__299))) (Base_dData_dList.v_Base_dData_dList_dlength dtb__299))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m))
  | _ -> failwith "DT: impossible branch"
)))
# 751 "Vuna/Compiler/Core/Conv.vuna"
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun (fuel : int) (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (m : int) (sp : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (rhs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "conv") else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup m) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__300) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__300) sp)) rhs)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match sp with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs)
  | _ -> (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__301, dtb__302) -> (if (dtb__301 = m) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__302) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs) else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__301) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__303) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) sp) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__303) dtb__302))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__301, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (fun (sols2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__302) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern (fuel - 1)) defs) sols) depth) m) sp) rhs)
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 773 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew = (fun (defs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (sols : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (depth : int) (m : int) (rhs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs))

# 776 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconv = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((fun _u -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((v_Vuna_dCompiler_dCore_dConv_dconvFuelFor a4) a5)) a1) a2) a3) a4) a5)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["conv-in: "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote a3) a4)); " <> "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote a3) a5)); " |v: "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a4); " <> "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a5); " @"; (bi_strFromInt a3)])) else 0)))

# 784 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvBoth = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel ((v_Vuna_dCompiler_dCore_dConv_dconvFuelFor a4) a5)) a1) a2) a3) a4) a5))

# 787 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dData_dList.t_Base_dData_dList_dList) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5))

# 790 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvOneAlt = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5))

# 793 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvValueLists = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5))

# 796 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvNeutral = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dNeutral) (a6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (a7 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5) a6) a7))

# 799 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dconvSpines = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (a6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (a7 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5) a6) a7))

# 802 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_detaLeft = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (a5 : string) (a6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dClosure) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5) a6))

# 805 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_detaRight = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : string) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dClosure) (a6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5) a6))

# 808 "Vuna/Compiler/Core/Conv.vuna"
let v_Vuna_dCompiler_dCore_dConv_dsolveMeta = (fun (a1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dSols) (a3 : int) (a4 : int) (a5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (a6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel v_Vuna_dCompiler_dCore_dConv_dconvFuelBase) a1) a2) a3) a4) a5) a6))
