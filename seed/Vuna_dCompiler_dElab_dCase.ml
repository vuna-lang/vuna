open Vuna_runtime
type t_Vuna_dCompiler_dElab_dCase_dBranchVerdict = C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx

let v_Vuna_dCompiler_dElab_dCase_dunifyErr = (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex) Base_dVec.C_Base_dVec_dVec_Nil)))

let v_Vuna_dCompiler_dElab_dCase_didxFuelMax = 1000000

let v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor = (fun c -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

let rec v_Vuna_dCompiler_dElab_dCase_didxIsNatHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__0, dtb__1) -> (v_Vuna_dCompiler_dElab_dCase_didxIsNatHead dtb__0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__2) -> (match dtb__2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__3, dtb__4) -> (v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor dtb__3)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__5, dtb__6) -> (v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor dtb__5)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dCase_didxIsNatSuccHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__7) -> (match dtb__7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__8, dtb__9) -> (dtb__8 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__10, dtb__11) -> (dtb__10 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo = (fun fuel v -> (if (fuel <= 0) then 100000 else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__12, dtb__13) -> (if (dtb__12 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo (fuel - 1)) dtb__14))
  | _ -> 0
)
  | _ -> 0
)) dtb__13) else 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__16) -> (match dtb__16 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__17, dtb__18) -> (if (dtb__17 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (match dtb__20 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo (fuel - 1)) dtb__19))
  | _ -> 0
)
  | _ -> 0
)) dtb__18) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__21, dtb__22) -> (if (v_Vuna_dCompiler_dElab_dCase_didxIsNatSuccHead dtb__21) then (1 + ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo (fuel - 1)) dtb__22)) else 0)
  | _ -> 0
)))

let v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth = (fun v -> ((v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo 100000) v))

let rec v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> ((fun d -> ((fun r -> (if (d >= r) then d else r)) (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__24))) (v_Vuna_dCompiler_dElab_dCase_didxNatDepthNear dtb__23))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_didxNatDepthNear = (fun v -> (if (v_Vuna_dCompiler_dElab_dCase_didxIsNatHead v) then (v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__25, dtb__26) -> (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__26)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__29)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__30, dtb__31, dtb__32) -> (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList dtb__32)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__33, dtb__34) -> (if (v_Vuna_dCompiler_dElab_dCase_didxIsNatHead dtb__34) then (v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth dtb__34) else 0)
  | _ -> 0
)))

let v_Vuna_dCompiler_dElab_dCase_didxFuelFor = (fun xs ys -> ((fun need -> (if (need > v_Vuna_dCompiler_dElab_dCase_didxFuelMax) then v_Vuna_dCompiler_dElab_dCase_didxFuelMax else need)) (512 + (4 * ((v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList xs) + (v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList ys))))))

let v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel = (fun depth lvl -> (if (depth = lvl) then (lvl + 1) else depth))

let rec v_Vuna_dCompiler_dElab_dCase_doccursLevel = (fun fuel depth lvl v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__35) -> (match dtb__35 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__36, dtb__37, dtb__38) -> (if (dtb__37 = lvl) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__38))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__39, dtb__40) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__44) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__45) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_occurs", ((v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel depth) lvl), Base_dList.C_Base_dList_dList_Nil)))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__46, dtb__47, dtb__48) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__48) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_occurs", ((v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel depth) lvl), Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__49, dtb__50) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__50)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__51, dtb__52) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (fuel - 1)) depth) lvl) dtb__52)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__53, dtb__54) -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__53) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__54))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__55, dtb__56) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__55)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__57)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__62, dtb__63, dtb__64) -> (if (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__62) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__63)) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (fuel - 1)) depth) lvl) dtb__64))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__65) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__66) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__67) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__68) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__69) -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelList = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel (mc0 - 1)) mc1) mc2) dtb__70) then true else ((((v_Vuna_dCompiler_dElab_dCase_doccursLevelList (mc0 - 1)) mc1) mc2) dtb__71))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_doccursFuel = 1000000

let v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv = (fun ec acc depth a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) a) b) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__72) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (acc))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__73) -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dunifyIdxList = (fun ec acc depth fuel xs ys -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo ec) acc) depth) fuel) xs) ys)))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx mc0) mc1) mc2) (mc3 - 1)) dtb__74) dtb__76)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) acc2) mc2) (mc3 - 1)) dtb__75) dtb__77)))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc1))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdx = (fun ec acc depth fuel a b -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IndexFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else ((fun a2 -> ((fun b2 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__78) -> (match dtb__78 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__79, dtb__80, dtb__81) -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__82) -> (match dtb__82 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__83, dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__80 = dtb__84) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (acc)) else (if (dtb__80 < dtb__84) then (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__84) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__84; Base_dPair.f_Base_dPair_dPair_second = a2 }, acc))))) else (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = b2 }, acc)))))))
  | _ -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = b2 }, acc)))))
)
  | _ -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = b2 }, acc)))))
)
  | _ -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__80) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = b2 }, acc)))))
)) b2)
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__86) -> (match dtb__86 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__87, dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__88) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__88; Base_dPair.f_Base_dPair_dPair_second = a2 }, acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__90) -> (match dtb__90 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__91, dtb__92, dtb__93) -> (match dtb__93 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__92) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = a2 }, acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__94) -> (match dtb__94 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__95, dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((v_Vuna_dCompiler_dElab_dCase_doccursLevel v_Vuna_dCompiler_dElab_dCase_doccursFuel) depth) dtb__96) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__96; Base_dPair.f_Base_dPair_dPair_second = a2 }, acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)) a2)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid = (fun ec acc depth fuel a b -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__98) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__99) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) dtb__98) dtb__99) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__100) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__101) -> (if (dtb__100 = dtb__101) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__102) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__103) -> (if (dtb__102 = dtb__103) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__104) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__105) -> (if (dtb__104 = dtb__105) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__106) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__107) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__106) dtb__107) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__108) -> (match dtb__108 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__109, dtb__110) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__111) -> (match dtb__111 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__112, dtb__113) -> (if (dtb__109 = dtb__112) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__110) dtb__113) else (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) b)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__114, dtb__115) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__116, dtb__117) -> (if (dtb__114 = dtb__116) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__115) dtb__117) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) a)))

let v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized = (fun ec acc depth xs ys -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) ((v_Vuna_dCompiler_dElab_dCase_didxFuelFor xs) ys)) xs) ys))

let v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dwildArgs = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ({ Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), (v_Vuna_dCompiler_dElab_dCase_dwildArgs (n - 1))))))

let rec v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (if dtb__119 then (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__122) else (1 + (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__122)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dCase_drigidIdxVals = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (if (v_Vuna_dCompiler_dElab_dCase_disRigidVal dtb__123) then (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__124) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_disRigidVal = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__125) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__126) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__127) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__128) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__129) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__130, dtb__131) -> (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__131)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dbindCtorGo = (fun ctx ty subpats acc -> (match ty with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> ((fun domVal -> (if dtb__133 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__136) subpats) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = famName; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue famName) domVal) ctx))) (dtb__132 ^ "#fam")) else (match subpats with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CaseBranchTooFewArgs) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (match dtb__137 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__139, dtb__140) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__134) domVal) dtb__136) dtb__139) dtb__138) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__141) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__134) domVal) dtb__136) "_") dtb__138) acc)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__137)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__135))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ctx; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = subpats } }))
))
and v_Vuna_dCompiler_dElab_dCase_dbindCtorField = (fun ctx rig domVal cod binderName rest acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = binderName; Base_dPair.f_Base_dPair_dPair_second = rig }, acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binderName) domVal) ctx)))

let v_Vuna_dCompiler_dElab_dCase_dbindCtorTele = (fun ctx ty subpats -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx) ty) subpats) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__142 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = dtb__145 } -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__144, (mc1 + mc2), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals dtb__143) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultTerms = (fun c -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__146; Base_dPair.f_Base_dPair_dPair_second = dtb__147 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultVals = (fun c base -> ((fun tele -> ((fun env -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))) (Base_dList.v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals tele) base) 0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let rec v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized mc0) Base_dList.C_Base_dList_dList_Nil) mc3) ((v_Vuna_dCompiler_dElab_dCase_dctorResultVals dtb__148) mc3)) mc2) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__150) -> false
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__151) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo mc0) dtb__149) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable = (fun ec dd idxs depth -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) idxs) depth))

let v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue = (fun ec depth v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__152) -> (match dtb__152 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__153, dtb__154) -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__154)) then false else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__153) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable ec) dtb__155) dtb__154) depth)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (match dtb__156 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__158; Base_dPair.f_Base_dPair_dPair_second = dtb__159 } -> (if (((v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc2) dtb__159)) then true else ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt mc0) mc1) (mc2 + 1)) dtb__157))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder = (fun ec ctx -> ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) 0) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems))

let v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify = (fun ec branchCtx refs -> (if ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine branchCtx) refs)) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx else C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk))

let v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn = (fun ctx c -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c)))

let v_Vuna_dCompiler_dElab_dCase_dbranchVerdict = (fun ctx ec idxs ctor -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__160) -> (match dtb__160 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = dtb__162 } -> (match dtb__162 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = dtb__164 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__164) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk else (match (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized ec) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__161)) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__161) ctor)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__165) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__166) -> (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__161) dtb__166)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__167) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dCase_dwildArgs (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))))

let v_Vuna_dCompiler_dElab_dCase_dbranchReachable = (fun ctx ec idxs ctor -> (v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable ((((v_Vuna_dCompiler_dElab_dCase_dbranchVerdict ctx) ec) idxs) ctor)))

let rec v_Vuna_dCompiler_dElab_dCase_dteleValsFrom = (fun low k -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_tele", low, Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom (low + 1)) (k - 1))))))

let v_Vuna_dCompiler_dElab_dCase_dctorValueIn = (fun ctx c -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c))))))

let v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee = (fun ec depth refs ctorVal scrutVal -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) scrutVal)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__168) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__169, dtb__170, dtb__171) -> (match dtb__171 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx ec) refs) depth) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__168))) ctorVal)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (refs))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (refs))
)) dtb__168)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (refs))
))

let v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__172) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__173, dtb__174) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (if (v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable dtb__175) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__176) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (match dtb__177 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__179; Base_dPair.f_Base_dPair_dPair_second = dtb__180 } -> (match dtb__179 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__181, dtb__182, dtb__183) -> (if (if (dtb__181 = mc0) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__182) else false) then true else ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__178))
  | _ -> ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__178)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitPatEq = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__184, dtb__185) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__186, dtb__187) -> (dtb__184 = dtb__186)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__188, dtb__189) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__190, dtb__191) -> (dtb__188 = dtb__190)
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (match dtb__192 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitPatEq mc0) dtb__194) then true else ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered mc0) dtb__193))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitLabel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__196, dtb__197) -> (String.concat "" ["\""; dtb__196; "\""])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__198, dtb__199) -> (bi_strFromInt dtb__198)
  | _ -> ""
))

let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__200, dtb__201, dtb__202) -> (v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__201)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (match dtb__203 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = dtb__206 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__205); Base_dPair.f_Base_dPair_dPair_second = dtb__206 }, (v_Vuna_dCompiler_dElab_dCase_dstripAsPats dtb__204)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasLitHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> (match dtb__207 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__209; Base_dPair.f_Base_dPair_dPair_second = dtb__210 } -> (match dtb__209 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__211, dtb__212) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__213, dtb__214) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCase_dhasLitHead dtb__208)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_daltNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (match dtb__215 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__217; Base_dPair.f_Base_dPair_dPair_second = dtb__218 } -> (match dtb__217 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__219, dtb__220, dtb__221) -> (Base_dList.C_Base_dList_dList_Cons (dtb__219, (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__216)))
  | _ -> (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__216)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223) -> (match dtb__222 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__224; Base_dPair.f_Base_dPair_dPair_second = dtb__225 } -> (match dtb__224 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__226, dtb__227, dtb__228) -> (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll dtb__223)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasDupNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (if ((Base_dList.v_Base_dList_dmemName dtb__229) dtb__230) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames dtb__230))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedArg = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__231, dtb__232) -> (match dtb__231 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__233, dtb__234) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__232)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__235) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__232)
  | _ -> true
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dnestedInPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__236, dtb__237, dtb__238) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__237)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedPat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> (match dtb__239 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__241; Base_dPair.f_Base_dPair_dPair_second = dtb__242 } -> (if (v_Vuna_dCompiler_dElab_dCase_dnestedInPat dtb__241) then true else (v_Vuna_dCompiler_dElab_dCase_danyNestedPat dtb__240))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dmissingCtors = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__243)) mc3) then (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors mc0) mc1) mc2) mc3) dtb__244) else (if ((((v_Vuna_dCompiler_dElab_dCase_dbranchReachable mc0) mc1) mc2) dtb__243) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__243)); Base_dPair.f_Base_dPair_dPair_second = (dtb__243).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan }, (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors mc0) mc1) mc2) mc3) dtb__244))) else (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors mc0) mc1) mc2) mc3) dtb__244)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCovered = (fun ctx ec dd idxs written alts sp ctors -> ((fun missing -> (if ((Base_dList.v_Base_dList_dlength missing) = 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcCoverageMissing sp) missing))) (((((v_Vuna_dCompiler_dElab_dCase_dmissingCtors ctx) ec) idxs) written) ctors)))

let v_Vuna_dCompiler_dElab_dCase_dcheckCoverage = (fun ctx ec dd idxs alts sp -> ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) alts) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone = (fun ec ctx dd idxs alts expected sp scrutTerm altTerms -> (if (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll alts) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)); Base_dPair.f_Base_dPair_dPair_second = ec })) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dCase_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)); Base_dPair.f_Base_dPair_dPair_second = ec }))))))

let v_Vuna_dCompiler_dElab_dCase_dbranchRemovalSpan = (fun patSpan body -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile patSpan); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine patSpan); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan body)) + 1); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 1 })

let v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest = (fun title patSpan body d -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithSuggestion { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle = title; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan = ((v_Vuna_dCompiler_dElab_dCase_dbranchRemovalSpan patSpan) body); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText = "" }, Base_dList.C_Base_dList_dList_Nil)) }) d))

let v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> (if (v_Vuna_dCompiler_dElab_dCase_dhasLitHead mc2) then ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))) (((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt0Mod (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove unreachable branch") mc3) (Base_dPair.v_Base_dPair_dsecondOf mc1))) mc3) Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_WarnBranchAfterCatchAll)) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc3) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CatchAllNotLast))
))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo = (fun prevs alts -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (match dtb__245 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 } -> (match dtb__247 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__249, dtb__250, dtb__251) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered dtb__249) prevs) then ((fun _u -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246)) ((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1Mod (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove redundant constructor branch") dtb__251) dtb__248)) dtb__251) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_WarnRedundantCtorBranch (dtb__249))) dtb__249)) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__252, dtb__253) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__247) prevs) then ((fun _u -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246)) ((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1Mod (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove redundant literal branch") dtb__253) dtb__248)) dtb__253) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_WarnRedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__247)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__247))) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__254, dtb__255) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__247) prevs) then ((fun _u -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246)) ((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1Mod (((v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest "remove redundant literal branch") dtb__255) dtb__248)) dtb__255) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_WarnRedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__247)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__247))) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__256, dtb__257, dtb__258) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__259, dtb__260) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) { Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }) dtb__246) dtb__260)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__261) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) { Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }) dtb__246) dtb__261)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__262, dtb__263, dtb__264) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 }, prevs))) dtb__246)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
)) alts))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat = (fun alts -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dCase_dstripAsPats alts)))
