open Vuna_runtime
type t_Vuna_dCompiler_dElab_dInstCoherence_dInstClash = C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate | C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap

# 71 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo = (fun remaining i -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("#tele", i, Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo (remaining - 1)) (i + 1))))))

# 68 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo n) 0))

# 63 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual = (fun ec n a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv n)) a)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv n)) b)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__0) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1) -> false
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if ((Base_dList.v_Base_dList_dlength (dtb__2).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) = mc1) then (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual mc0) mc1) mc2) (dtb__2).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead) then true else ((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact mc0) mc1) mc2) dtb__3)) else ((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact mc0) mc1) mc2) dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet = (fun ec n head inst -> (if ((Base_dList.v_Base_dList_dlength (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) = n) then ((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual ec) n) head) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead) else false))

# 99 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo = (fun remaining i -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (("#ov" ^ (bi_strFromInt i)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo (remaining - 1)) (i + 1))))))

# 96 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo n) 0))

# 86 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne = (fun ec teleA hA teleB hB -> (match ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) teleA) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__4; Base_dPair.f_Base_dPair_dPair_second = dtb__5 } -> ((fun envA -> ((fun envB -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__5)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__5)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval envA) hA)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval envB) hB)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__6) -> { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__5) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__6)) }
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__7) -> { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = dtb__5 }
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnv (Base_dList.v_Base_dList_dlength teleB)))) ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dList.C_Base_dList_dList_Nil)))) dtb__4))
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap = (fun ec tele1 h1 tele2 h2 -> (match tele1 with
  | Base_dList.C_Base_dList_dList_Nil -> (match tele2 with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual ec) 0) h1) h2); Base_dPair.f_Base_dPair_dPair_second = ec }
  | _ -> (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne ec) tele2) h2) tele1) h1)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne ec) tele1) h1) tele2) h2)
))

# 49 "Vuna/Compiler/Elab/InstCoherence.vuna"
let rec v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet mc0) (Base_dList.v_Base_dList_dlength mc2)) mc3) dtb__10) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__11) else (if (if mc1 then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength (dtb__10).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)) (dtb__10).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__11) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> (if dtb__12 then { Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap)); Base_dPair.f_Base_dPair_dPair_second = dtb__13 } else (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__11))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap mc0) mc2) mc3) (dtb__10).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) (dtb__10).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead))))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet mc0) (Base_dList.v_Base_dList_dlength mc2)) mc3) dtb__14) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__15) else (if (if mc1 then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength (dtb__14).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)) (dtb__14).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__15) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> (if dtb__16 then { Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap)); Base_dPair.f_Base_dPair_dPair_second = dtb__17 } else (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__15))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap mc0) mc2) mc3) (dtb__14).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) (dtb__14).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead))))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Elab/InstCoherence.vuna"
let v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash = (fun ec name tele head seen -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dhasInstName name) seen) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate)); Base_dPair.f_Base_dPair_dPair_second = ec } else (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact ec) (Base_dList.v_Base_dList_dlength tele)) head) seen) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate)); Base_dPair.f_Base_dPair_dPair_second = ec } else (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap ec) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength tele)) head)) tele) head) seen))))
