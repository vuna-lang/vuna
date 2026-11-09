open Vuna_runtime
type t_Vuna_dCompiler_dElab_dInstCoherence_dInstClash = C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate | C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap

let rec v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo = (fun remaining i -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("#tele", i, Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo (remaining - 1)) (i + 1))))))

let v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual = (fun ec n a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv n)) a)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv n)) b)) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__0) -> true
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if ((Base_dList.v_Base_dList_dlength (match dtb__2 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__4, dtb__5, dtb__6, dtb__7) -> dtb__5
  | _ -> failwith "DT: impossible branch"
)) = mc1) then (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual mc0) mc1) mc2) (match dtb__2 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__8, dtb__9, dtb__10, dtb__11) -> dtb__11
  | _ -> failwith "DT: impossible branch"
)) then true else ((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact mc0) mc1) mc2) dtb__3)) else ((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact mc0) mc1) mc2) dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet = (fun ec n head inst -> (if ((Base_dList.v_Base_dList_dlength (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__13
  | _ -> failwith "DT: impossible branch"
)) = n) then ((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual ec) n) head) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__19
  | _ -> failwith "DT: impossible branch"
)) else false))

let rec v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo = (fun remaining i -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (("#ov" ^ (bi_strFromInt i)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo (remaining - 1)) (i + 1))))))

let v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne = (fun ec teleA hA teleB hB -> (match (((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) teleA) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__20, dtb__21) -> ((fun envA -> ((fun envB -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__21)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__21)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval envA) hA)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval envB) hB)) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__22) -> (Base_dPair.C_Base_dPair_dPair_Pair (true, ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__21) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__22))))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__23) -> (Base_dPair.C_Base_dPair_dPair_Pair (false, dtb__21))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnv (Base_dList.v_Base_dList_dlength teleB)))) ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dList.C_Base_dList_dList_Nil)))) dtb__20))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap = (fun ec tele1 h1 tele2 h2 -> (match tele1 with
  | Base_dList.C_Base_dList_dList_Nil -> (match tele2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual ec) 0) h1) h2), ec))
  | _ -> (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne ec) tele2) h2) tele1) h1)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne ec) tele1) h1) tele2) h2)
))

let rec v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet mc0) (Base_dList.v_Base_dList_dlength mc2)) mc3) dtb__26) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__27) else (if (if mc1 then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength (match dtb__26 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))) (match dtb__26 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__32, dtb__33, dtb__34, dtb__35) -> dtb__35
  | _ -> failwith "DT: impossible branch"
))) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__27) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__36, dtb__37) -> (if dtb__36 then (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap)), dtb__37)) else (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__27))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap mc0) mc2) mc3) (match dtb__26 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__39
  | _ -> failwith "DT: impossible branch"
)) (match dtb__26 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__42, dtb__43, dtb__44, dtb__45) -> dtb__45
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet mc0) (Base_dList.v_Base_dList_dlength mc2)) mc3) dtb__46) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__47) else (if (if mc1 then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength (match dtb__46 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))) (match dtb__46 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__52, dtb__53, dtb__54, dtb__55) -> dtb__55
  | _ -> failwith "DT: impossible branch"
))) then (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__47) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__56, dtb__57) -> (if dtb__56 then (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap)), dtb__57)) else (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap mc0) mc1) mc2) mc3) dtb__47))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap mc0) mc2) mc3) (match dtb__46 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__58, dtb__59, dtb__60, dtb__61) -> dtb__59
  | _ -> failwith "DT: impossible branch"
)) (match dtb__46 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__65
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash = (fun ec name tele head seen -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dhasInstName name) seen) then (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate)), ec)) else (if ((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact ec) (Base_dList.v_Base_dList_dlength tele)) head) seen) then (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate)), ec)) else (((((v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap ec) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead (Base_dList.v_Base_dList_dlength tele)) head)) tele) head) seen))))
