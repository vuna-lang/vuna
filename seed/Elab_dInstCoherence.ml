open Vuna_runtime
type t_InstClash = C_InstClash_ClashDuplicate | C_InstClash_ClashOverlap

# 101 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_teleAlphaEnvGo = (fun (remaining : int) (i : int) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (Frontend_dReserved.v_teleProbeBinderName, i, B_dData_dList.C_List_Nil)))), ((v_teleAlphaEnvGo (remaining - 1)) (i + 1))))))

# 98 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_teleAlphaEnv = (fun (n : int) -> ((v_teleAlphaEnvGo n) 0))

# 79 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_headsAlphaEqual = (fun (ec : Elab_dTypes.t_Ec) (n : int) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) ((Core_dEval.v_eval (v_teleAlphaEnv n)) a)) ((Core_dEval.v_eval (v_teleAlphaEnv n)) b)) with
  | Base_dDiag.C_Check_OkC (dtb__0) -> true
  | Base_dDiag.C_Check_ErrC (dtb__1) -> false
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_anyInstanceExact = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Term) (mc3 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if ((B_dData_dList.v_length (dtb__2).Elab_dTypes.f_DtInst_dtInstTele) = mc1) then (if ((((v_headsAlphaEqual mc0) mc1) mc2) (dtb__2).Elab_dTypes.f_DtInst_dtInstHead) then true else ((((v_anyInstanceExact mc0) mc1) mc2) dtb__3)) else ((((v_anyInstanceExact mc0) mc1) mc2) dtb__3))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_instanceExactQuiet = (fun (ec : Elab_dTypes.t_Ec) (n : int) (head : Core_dTerm.t_Term) (inst : Elab_dTypes.t_DtInst) -> (if ((B_dData_dList.v_length (inst).Elab_dTypes.f_DtInst_dtInstTele) = n) then ((((v_headsAlphaEqual ec) n) head) (inst).Elab_dTypes.f_DtInst_dtInstHead) else false))

# 90 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_instanceKey = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (tele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (head : Core_dTerm.t_Term) -> (let zonked = (((Elab_dMeta.v_zonkTerm ec) 0) head) in (let n = (B_dData_dList.v_length tele) in (let canon = ((Core_dEval.v_quote n) ((Core_dEval.v_eval (v_teleAlphaEnv n)) zonked)) in (String.concat "" [cname; "#"; (Base_dHash.v_digestHex (Base_dHash.v_digestOfString ((Base_dBytes.v_encTop Core_dCanonical.v_encTerm) canon)))])))))

# 134 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_teleGlobalEnvGo = (fun (remaining : int) (i : int) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Frontend_dReserved.v_ovProbeName i), B_dData_dList.C_List_Nil)))), ((v_teleGlobalEnvGo (remaining - 1)) (i + 1))))))

# 131 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_teleGlobalEnv = (fun (n : int) -> ((v_teleGlobalEnvGo n) 0))

# 120 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_headsOverlapOne = (fun (ec : Elab_dTypes.t_Ec) (teleA : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (hA : Core_dTerm.t_Term) (teleB : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (hB : Core_dTerm.t_Term) -> (match ((((Elab_dDict.v_allocTeleMetas B_dData_dMaybe.C_Maybe_Nothing) Elab_dTypes.v_emptyCtx) ec) teleA) with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (let envA = ((B_dData_dList.v_map (fun (m : int) -> (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil)))) dtb__4) in (let envB = (v_teleGlobalEnv (B_dData_dList.v_length teleB)) in (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__5)) (Elab_dTypes.v_ecSolsP dtb__5)) 0) ((Core_dEval.v_eval envA) hA)) ((Core_dEval.v_eval envB) hB)) with
  | Base_dDiag.C_Check_OkC (dtb__6) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutSols dtb__5) (Core_dTerm.v_solsList dtb__6)) }
  | Base_dDiag.C_Check_ErrC (dtb__7) -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__5 }
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_headsOverlap = (fun (ec : Elab_dTypes.t_Ec) (tele1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (h1 : Core_dTerm.t_Term) (tele2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (h2 : Core_dTerm.t_Term) -> (match tele1 with
  | B_dData_dList.C_List_Nil -> (match tele2 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = ((((v_headsAlphaEqual ec) 0) h1) h2); B_dData_dPair.f_Pair_second = ec }
  | _ -> (((((v_headsOverlapOne ec) tele2) h2) tele1) h1)
)
  | _ -> (((((v_headsOverlapOne ec) tele1) h1) tele2) h2)
))

# 61 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_anyInstanceOverlap = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : bool) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Core_dTerm.t_Term) (mc4 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if ((((v_instanceExactQuiet mc0) (B_dData_dList.v_length mc2)) mc3) dtb__10) then (((((v_anyInstanceOverlap mc0) mc1) mc2) mc3) dtb__11) else (if (if mc1 then true else ((Elab_dMeta.v_isBlanketInstHead (B_dData_dList.v_length (dtb__10).Elab_dTypes.f_DtInst_dtInstTele)) (dtb__10).Elab_dTypes.f_DtInst_dtInstHead)) then (((((v_anyInstanceOverlap mc0) mc1) mc2) mc3) dtb__11) else (let nd_uscrut11 = (((((v_headsOverlap mc0) mc2) mc3) (dtb__10).Elab_dTypes.f_DtInst_dtInstTele) (dtb__10).Elab_dTypes.f_DtInst_dtInstHead) in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if dtb__12 then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashOverlap)); B_dData_dPair.f_Pair_second = dtb__13 } else (((((v_anyInstanceOverlap mc0) mc1) mc2) mc3) dtb__11))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if ((((v_instanceExactQuiet mc0) (B_dData_dList.v_length mc2)) mc3) dtb__14) then (((((v_anyInstanceOverlap mc0) mc1) mc2) mc3) dtb__15) else (if (if mc1 then true else ((Elab_dMeta.v_isBlanketInstHead (B_dData_dList.v_length (dtb__14).Elab_dTypes.f_DtInst_dtInstTele)) (dtb__14).Elab_dTypes.f_DtInst_dtInstHead)) then (((((v_anyInstanceOverlap mc0) mc1) mc2) mc3) dtb__15) else (let nd_uscrut9 = (((((v_headsOverlap mc0) mc2) mc3) (dtb__14).Elab_dTypes.f_DtInst_dtInstTele) (dtb__14).Elab_dTypes.f_DtInst_dtInstHead) in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (if dtb__16 then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashOverlap)); B_dData_dPair.f_Pair_second = dtb__17 } else (((((v_anyInstanceOverlap mc0) mc1) mc2) mc3) dtb__15))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_findInstanceClash = (fun (ec : Elab_dTypes.t_Ec) (name : string) (sym : string) (key : string) (tele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (head : Core_dTerm.t_Term) (seen : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (if ((Elab_dTypes.v_hasInstKey key) seen) then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashDuplicate)); B_dData_dPair.f_Pair_second = ec } else (if ((Elab_dTypes.v_hasInstSym sym) seen) then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashDuplicate)); B_dData_dPair.f_Pair_second = ec } else (if ((((v_anyInstanceExact ec) (B_dData_dList.v_length tele)) head) seen) then { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (C_InstClash_ClashDuplicate)); B_dData_dPair.f_Pair_second = ec } else (((((v_anyInstanceOverlap ec) ((Elab_dMeta.v_isBlanketInstHead (B_dData_dList.v_length tele)) head)) tele) head) seen)))))
