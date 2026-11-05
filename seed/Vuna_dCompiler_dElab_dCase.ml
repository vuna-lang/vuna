open Vuna_runtime
type t_Vuna_dCompiler_dElab_dCase_dBranchVerdict = C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx

let v_Vuna_dCompiler_dElab_dCase_dunifyErr = (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchIndex) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))

let rec v_Vuna_dCompiler_dElab_dCase_doccursLevel = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__0) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__1) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__2) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__3) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__4, dtb__5, dtb__6) -> (if (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__4) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__5)) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__6))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__7, dtb__8) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__7)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__9, dtb__10) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__9) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__10))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__11, dtb__12) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__12)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__13, dtb__14) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__14)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__17)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__21) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__22))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__23) -> (match dtb__23 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__24, dtb__25, dtb__26) -> (if (dtb__25 = mc0) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__26))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__27, dtb__28) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__29) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__30))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelClo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__31)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv = (fun ec acc depth a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) a) b) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__33) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (acc))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__34) -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dunifyIdxList = (fun ec acc depth fuel xs ys -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo ec) acc) depth) fuel) xs) ys)))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx mc0) mc1) mc2) (mc3 - 1)) dtb__35) dtb__37)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) acc2) mc2) (mc3 - 1)) dtb__36) dtb__38)))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdx = (fun ec acc depth fuel a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIndexFuel) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil))) else ((fun a2 -> ((fun b2 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__39) -> (match dtb__39 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__40, dtb__41, dtb__42) -> (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__43) -> (match dtb__43 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__44, dtb__45, dtb__46) -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (dtb__41 = dtb__45) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (if (dtb__41 < dtb__45) then (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__45) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, a2)), acc))))) else (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))))
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)) b2)
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__47) -> (match dtb__47 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__48, dtb__49, dtb__50) -> (match dtb__50 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__49) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__51) -> (match dtb__51 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__52, dtb__53, dtb__54) -> (match dtb__54 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__53) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__55) -> (match dtb__55 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__56, dtb__57, dtb__58) -> (match dtb__58 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__57) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)) a2)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid = (fun ec acc depth fuel a b -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__59) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__60) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__59) dtb__60) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__61) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__62) -> (if (dtb__61 = dtb__62) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__63) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__64) -> (if (dtb__63 = dtb__64) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__65) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__66) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__65) dtb__66) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__67) -> (match dtb__67 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__68, dtb__69) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__70) -> (match dtb__70 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__71, dtb__72) -> (if (dtb__68 = dtb__71) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__69) dtb__72) else (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) b)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__73, dtb__74) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__75, dtb__76) -> (if (dtb__73 = dtb__75) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__74) dtb__76) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) a)))

let v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dwildArgs = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (v_Vuna_dCompiler_dElab_dCase_dwildArgs (n - 1))))))

let rec v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> (if dtb__78 then (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__81) else (1 + (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__81)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dCase_drigidIdxVals = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (if (v_Vuna_dCompiler_dElab_dCase_disRigidVal dtb__82) then (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__83) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_disRigidVal = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__84) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__85) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__86) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__87) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__88, dtb__89) -> (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__89)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dbindCtorGo = (fun ctx ty subpats acc -> (match ty with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> ((fun domVal -> (if dtb__91 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__94) subpats) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (famName, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue famName) domVal) ctx))) (dtb__90 ^ "#fam")) else (match subpats with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCaseBranchTooFewArgs) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (match dtb__95 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__97, dtb__98) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__92) domVal) dtb__94) dtb__97) dtb__96) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__99) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__92) domVal) dtb__94) "_") dtb__96) acc)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__95)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__93))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (ctx, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse acc), subpats))))))
))
and v_Vuna_dCompiler_dElab_dCase_dbindCtorField = (fun ctx rig domVal cod binderName rest acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (binderName, rig)), acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binderName) domVal) ctx)))

let v_Vuna_dCompiler_dElab_dCase_dbindCtorTele = (fun ctx ty subpats -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx) ty) subpats) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__102, (mc1 + mc2), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals dtb__101) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultTerms = (fun c -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultVals = (fun c base -> ((fun tele -> ((fun env -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))) (Base_dList.v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals tele) base) 0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let rec v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc3) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultVals dtb__106) mc3)) mc2) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__108) -> false
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__109) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo mc0) dtb__107) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable = (fun ec dd idxs depth -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) idxs) depth))

let v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue = (fun ec depth v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__110) -> (match dtb__110 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__111, dtb__112) -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__112)) then false else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__111) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable ec) dtb__113) dtb__112) depth)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (match dtb__114 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__116, dtb__117) -> (if (((v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc2) dtb__117)) then true else ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt mc0) mc1) (mc2 + 1)) dtb__115))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder = (fun ec ctx -> ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) 0) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__118, dtb__119) -> dtb__118
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify = (fun ec branchCtx refs -> (if ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine branchCtx) refs)) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx else C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk))

let v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn = (fun ctx c -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c)))

let v_Vuna_dCompiler_dElab_dCase_dbranchVerdict = (fun ctx ec idxs ctor -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__120) -> (match dtb__120 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (match dtb__122 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, dtb__124) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__124) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk else (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__121)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__121) ctor)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Base_dList_dNil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__125) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__126) -> (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__121) dtb__126)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__127) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dCase_dwildArgs (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))))

let v_Vuna_dCompiler_dElab_dCase_dbranchReachable = (fun ctx ec idxs ctor -> (v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable ((((v_Vuna_dCompiler_dElab_dCase_dbranchVerdict ctx) ec) idxs) ctor)))

let rec v_Vuna_dCompiler_dElab_dCase_dteleValsFrom = (fun low k -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("_tele", low, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom (low + 1)) (k - 1))))))

let v_Vuna_dCompiler_dElab_dCase_dctorValueIn = (fun ctx c -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c))))))

let v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee = (fun ec depth refs ctorVal scrutVal -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) scrutVal)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__128) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__129, dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx ec) refs) depth) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__128))) ctorVal)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (refs))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (refs))
)) dtb__128)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (refs))
))

let v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__132) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__133, dtb__134) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__135, dtb__136) -> (if (v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable dtb__135) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__136) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (match dtb__137 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> (match dtb__139 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__141, dtb__142, dtb__143) -> (if (if (dtb__141 = mc0) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__142) else false) then true else ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__138))
  | _ -> ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__138)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitPatEq = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__144, dtb__145) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__146, dtb__147) -> (dtb__144 = dtb__146)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__148, dtb__149) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__150, dtb__151) -> (dtb__148 = dtb__150)
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (match dtb__152 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitPatEq mc0) dtb__154) then true else ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered mc0) dtb__153))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitLabel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__156, dtb__157) -> (String.concat "" ["\""; dtb__156; "\""])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__158, dtb__159) -> (bi_strFromInt dtb__158)
  | _ -> ""
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasLitHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (match dtb__160 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__162, dtb__163) -> (match dtb__162 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__164, dtb__165) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__166, dtb__167) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCase_dhasLitHead dtb__161)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> (if (v_Vuna_dCompiler_dElab_dCase_dhasLitHead mc2) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc3) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBranchAfterCatchAll) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc3) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCatchAllNotLast))
))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo = (fun prevs alts -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__168, dtb__169) -> (match dtb__168 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> (match dtb__170 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__172, dtb__173, dtb__174) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered dtb__172) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__174) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRedundantCtorBranch (dtb__172))) dtb__172) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171)), prevs))) dtb__169))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__175, dtb__176, dtb__177) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo prevs) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__171)), dtb__169)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__178, dtb__179) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckLitHead prevs) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171))) dtb__169) dtb__179)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__180, dtb__181) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckLitHead prevs) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171))) dtb__169) dtb__181)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__182, dtb__183) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171))) dtb__169) dtb__183)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__184) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171))) dtb__169) dtb__184)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__185, dtb__186, dtb__187) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171)), prevs))) dtb__169)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)) alts))
and v_Vuna_dCompiler_dElab_dCase_dcheckLitHead = (fun prevs alt rest sp -> ((fun p -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered p) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel p)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel p)) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Base_dList_dCons (alt, prevs))) rest))) (Base_dPair.v_Base_dPair_dfirstOf alt)))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat = (fun alts -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo Base_dList.C_Base_dList_dList_Base_dList_dNil) alts))

let rec v_Vuna_dCompiler_dElab_dCase_daltNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (match dtb__188 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (match dtb__190 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__192, dtb__193, dtb__194) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__192, (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__189)))
  | _ -> (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__189)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> (match dtb__195 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__197, dtb__198) -> (match dtb__197 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__199, dtb__200, dtb__201) -> (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll dtb__196)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasDupNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__202, dtb__203) -> (if ((Base_dList.v_Base_dList_dmemName dtb__202) dtb__203) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames dtb__203))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedArg = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__204, dtb__205) -> (match dtb__204 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__206, dtb__207) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__205)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__208) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__205)
  | _ -> true
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dnestedInPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__209, dtb__210, dtb__211) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__210)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedPat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__212, dtb__213) -> (match dtb__212 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215) -> (if (v_Vuna_dCompiler_dElab_dCase_dnestedInPat dtb__214) then true else (v_Vuna_dCompiler_dElab_dCase_danyNestedPat dtb__213))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCovered = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__216)) mc4) then ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__217) else (if ((((v_Vuna_dCompiler_dElab_dCase_dbranchReachable mc0) mc1) mc3) dtb__216) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc6) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotExhaustive ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__216)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__216)) else ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__217)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCoverage = (fun ctx ec dd idxs alts sp -> ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) alts) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone = (fun ec ctx dd idxs alts expected sp scrutTerm altTerms -> (if (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll alts) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (scrutTerm, altTerms)), ec)))) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (scrutTerm, altTerms)), ec))))))))
