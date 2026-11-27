open Vuna_runtime
type t_InstClash = C_InstClash_ClashDuplicate | C_InstClash_ClashOverlap

# 101 "Vuna/Compiler/Elab/InstCoherence.vuna"
let[@tail_mod_cons] rec v_teleAlphaEnvGo = (fun (dtb_u_u1 : int) (dtb_u_u2 : int) -> (if (dtb_u_u1 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (Frontend_dReserved.v_teleProbeBinderName, dtb_u_u2, B_dData_dList.C_List_Nil)))), ((v_teleAlphaEnvGo (dtb_u_u1 - 1)) (dtb_u_u2 + 1))))))

# 98 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_teleAlphaEnv = (fun (dtb_u_u3 : int) -> ((v_teleAlphaEnvGo dtb_u_u3) 0))

# 79 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_headsAlphaEqual = (fun (dtb_u_u4 : Elab_dTypes.t_Ec) (dtb_u_u5 : int) (dtb_u_u6 : Core_dTerm.t_Term) (dtb_u_u7 : Core_dTerm.t_Term) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u4)) (Elab_dTypes.v_ecSolsP dtb_u_u4)) 0) ((Core_dEval.v_eval (v_teleAlphaEnv dtb_u_u5)) dtb_u_u6)) ((Core_dEval.v_eval (v_teleAlphaEnv dtb_u_u5)) dtb_u_u7)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u8) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u9) -> false
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_anyInstanceExact = (fun (dtb_u_u10 : Elab_dTypes.t_Ec) (dtb_u_u11 : int) (dtb_u_u12 : Core_dTerm.t_Term) (dtb_u_u13 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (if ((B_dData_dList.v_length (dtb_u_u14).Elab_dTypes.f_DtInst_dtInstTele) = dtb_u_u11) then (if ((((v_headsAlphaEqual dtb_u_u10) dtb_u_u11) dtb_u_u12) (dtb_u_u14).Elab_dTypes.f_DtInst_dtInstHead) then true else ((((v_anyInstanceExact dtb_u_u10) dtb_u_u11) dtb_u_u12) dtb_u_u15)) else ((((v_anyInstanceExact dtb_u_u10) dtb_u_u11) dtb_u_u12) dtb_u_u15))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_instanceExactQuiet = (fun (dtb_u_u16 : Elab_dTypes.t_Ec) (dtb_u_u17 : int) (dtb_u_u18 : Core_dTerm.t_Term) (dtb_u_u19 : Elab_dTypes.t_DtInst) -> (if ((B_dData_dList.v_length (dtb_u_u19).Elab_dTypes.f_DtInst_dtInstTele) = dtb_u_u17) then ((((v_headsAlphaEqual dtb_u_u16) dtb_u_u17) dtb_u_u18) (dtb_u_u19).Elab_dTypes.f_DtInst_dtInstHead) else false))

# 90 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_instanceKey = (fun (dtb_u_u20 : Elab_dTypes.t_Ec) (dtb_u_u21 : string) (dtb_u_u22 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u23 : Core_dTerm.t_Term) -> (let dtb_u_u24 = (((Elab_dMeta.v_zonkTerm dtb_u_u20) 0) dtb_u_u23) in (let dtb_u_u25 = (B_dData_dList.v_length dtb_u_u22) in (let dtb_u_u26 = ((Core_dEval.v_quote dtb_u_u25) ((Core_dEval.v_eval (v_teleAlphaEnv dtb_u_u25)) dtb_u_u24)) in (String.concat "" [dtb_u_u21; "#"; (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Core_dCanonical.v_encTerm) dtb_u_u26)))])))))

# 134 "Vuna/Compiler/Elab/InstCoherence.vuna"
let[@tail_mod_cons] rec v_teleGlobalEnvGo = (fun (dtb_u_u27 : int) (dtb_u_u28 : int) -> (if (dtb_u_u27 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Frontend_dReserved.v_ovProbeName dtb_u_u28), B_dData_dList.C_List_Nil)))), ((v_teleGlobalEnvGo (dtb_u_u27 - 1)) (dtb_u_u28 + 1))))))

# 131 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_teleGlobalEnv = (fun (dtb_u_u29 : int) -> ((v_teleGlobalEnvGo dtb_u_u29) 0))

# 120 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_headsOverlapOne = (fun (dtb_u_u30 : Elab_dTypes.t_Ec) (dtb_u_u31 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u32 : Core_dTerm.t_Term) (dtb_u_u33 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u34 : Core_dTerm.t_Term) -> (match ((((Elab_dDict.v_allocTeleMetas B_dData_dMaybe.C_Maybe_Nothing) Elab_dTypes.v_emptyCtx) dtb_u_u30) dtb_u_u31) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = dtb_u_u36 } -> (let dtb_u_u37 = ((B_dData_dList.v_map (fun (dtb_u_u41 : int) -> (Core_dTerm.C_Value_VMeta (dtb_u_u41, B_dData_dList.C_List_Nil)))) dtb_u_u35) in (let dtb_u_u38 = (v_teleGlobalEnv (B_dData_dList.v_length dtb_u_u33)) in (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u36)) (Elab_dTypes.v_ecSolsP dtb_u_u36)) 0) ((Core_dEval.v_eval dtb_u_u37) dtb_u_u32)) ((Core_dEval.v_eval dtb_u_u38) dtb_u_u34)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u39) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutSols dtb_u_u36) (Core_dTerm.v_solsList dtb_u_u39)) }
  | Base_dDiag.C_Check_ErrC (dtb_u_u40) -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u36 }
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_headsOverlap = (fun (dtb_u_u42 : Elab_dTypes.t_Ec) (dtb_u_u43 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u44 : Core_dTerm.t_Term) (dtb_u_u45 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u46 : Core_dTerm.t_Term) -> (match dtb_u_u43 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u45 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ((((v_headsAlphaEqual dtb_u_u42) 0) dtb_u_u44) dtb_u_u46); B_dData_dPair.f_Pair_second = dtb_u_u42 }
  | _ -> (((((v_headsOverlapOne dtb_u_u42) dtb_u_u45) dtb_u_u46) dtb_u_u43) dtb_u_u44)
)
  | _ -> (((((v_headsOverlapOne dtb_u_u42) dtb_u_u43) dtb_u_u44) dtb_u_u45) dtb_u_u46)
))

# 61 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_anyInstanceOverlap = (fun (dtb_u_u47 : Elab_dTypes.t_Ec) (dtb_u_u48 : bool) (dtb_u_u49 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u50 : Core_dTerm.t_Term) (dtb_u_u51 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u49 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u52, dtb_u_u53) -> (match dtb_u_u51 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (if ((((v_instanceExactQuiet dtb_u_u47) (B_dData_dList.v_length dtb_u_u49)) dtb_u_u50) dtb_u_u54) then (((((v_anyInstanceOverlap dtb_u_u47) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u55) else (if (if dtb_u_u48 then true else ((Elab_dMeta.v_isBlanketInstHead (B_dData_dList.v_length (dtb_u_u54).Elab_dTypes.f_DtInst_dtInstTele)) (dtb_u_u54).Elab_dTypes.f_DtInst_dtInstHead)) then (((((v_anyInstanceOverlap dtb_u_u47) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u55) else (let dtb_u_u56 = (((((v_headsOverlap dtb_u_u47) dtb_u_u49) dtb_u_u50) (dtb_u_u54).Elab_dTypes.f_DtInst_dtInstTele) (dtb_u_u54).Elab_dTypes.f_DtInst_dtInstHead) in (match dtb_u_u56 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u57; B_dData_dPair.f_Pair_second = dtb_u_u58 } -> (if dtb_u_u57 then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashOverlap)); B_dData_dPair.f_Pair_second = dtb_u_u58 } else (((((v_anyInstanceOverlap dtb_u_u47) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u55))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u47 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u51 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u59, dtb_u_u60) -> (if ((((v_instanceExactQuiet dtb_u_u47) (B_dData_dList.v_length dtb_u_u49)) dtb_u_u50) dtb_u_u59) then (((((v_anyInstanceOverlap dtb_u_u47) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u60) else (if (if dtb_u_u48 then true else ((Elab_dMeta.v_isBlanketInstHead (B_dData_dList.v_length (dtb_u_u59).Elab_dTypes.f_DtInst_dtInstTele)) (dtb_u_u59).Elab_dTypes.f_DtInst_dtInstHead)) then (((((v_anyInstanceOverlap dtb_u_u47) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u60) else (let dtb_u_u61 = (((((v_headsOverlap dtb_u_u47) dtb_u_u49) dtb_u_u50) (dtb_u_u59).Elab_dTypes.f_DtInst_dtInstTele) (dtb_u_u59).Elab_dTypes.f_DtInst_dtInstHead) in (match dtb_u_u61 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u62; B_dData_dPair.f_Pair_second = dtb_u_u63 } -> (if dtb_u_u62 then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashOverlap)); B_dData_dPair.f_Pair_second = dtb_u_u63 } else (((((v_anyInstanceOverlap dtb_u_u47) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u60))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u47 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_findInstanceClash = (fun (dtb_u_u64 : Elab_dTypes.t_Ec) (dtb_u_u65 : string) (dtb_u_u66 : string) (dtb_u_u67 : string) (dtb_u_u68 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u69 : Core_dTerm.t_Term) (dtb_u_u70 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (if ((Elab_dTypes.v_hasInstKey dtb_u_u67) dtb_u_u70) then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashDuplicate)); B_dData_dPair.f_Pair_second = dtb_u_u64 } else (if ((Elab_dTypes.v_hasInstSym dtb_u_u66) dtb_u_u70) then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashDuplicate)); B_dData_dPair.f_Pair_second = dtb_u_u64 } else (if ((((v_anyInstanceExact dtb_u_u64) (B_dData_dList.v_length dtb_u_u68)) dtb_u_u69) dtb_u_u70) then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashDuplicate)); B_dData_dPair.f_Pair_second = dtb_u_u64 } else (((((v_anyInstanceOverlap dtb_u_u64) ((Elab_dMeta.v_isBlanketInstHead (B_dData_dList.v_length dtb_u_u68)) dtb_u_u69)) dtb_u_u68) dtb_u_u69) dtb_u_u70)))))
