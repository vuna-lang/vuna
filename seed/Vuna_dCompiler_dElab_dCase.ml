open Vuna_runtime
type t_Vuna_dCompiler_dElab_dCase_dBranchVerdict = C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx

let v_Vuna_dCompiler_dElab_dCase_dunifyErr = (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex) Base_dVec.C_Base_dVec_dVec_Nil)))

let rec v_Vuna_dCompiler_dElab_dCase_doccursLevel = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__0) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__1) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__2) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__3) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__4, dtb__5, dtb__6) -> (if (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__4) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__5)) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__6))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__7, dtb__8) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__7)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__9, dtb__10) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__9) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__10))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__11, dtb__12) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__12)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__13, dtb__14) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__14)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__17)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__21) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__22))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__23) -> (match dtb__23 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__24, dtb__25, dtb__26) -> (if (dtb__25 = mc0) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__26))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__27, dtb__28) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__29) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__30))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelClo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__31)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv = (fun ec acc depth a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) a) b) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__33) -> (Base_dResult.C_Base_dResult_dResult_Ok (acc))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__34) -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dunifyIdxList = (fun ec acc depth fuel xs ys -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo ec) acc) depth) fuel) xs) ys)))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx mc0) mc1) mc2) (mc3 - 1)) dtb__35) dtb__37)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) acc2) mc2) (mc3 - 1)) dtb__36) dtb__38)))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (mc1))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdx = (fun ec acc depth fuel a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IndexFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else ((fun a2 -> ((fun b2 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__39) -> (match dtb__39 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__40, dtb__41, dtb__42) -> (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__43) -> (match dtb__43 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__44, dtb__45, dtb__46) -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__41 = dtb__45) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else (if (dtb__41 < dtb__45) then (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__45) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__45, a2)), acc))))) else (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__41, b2)), acc)))))))
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__41, b2)), acc)))))
)) b2)
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__47) -> (match dtb__47 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__48, dtb__49, dtb__50) -> (match dtb__50 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__49) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__49, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__51) -> (match dtb__51 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__52, dtb__53, dtb__54) -> (match dtb__54 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__53) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__53, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__55) -> (match dtb__55 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__56, dtb__57, dtb__58) -> (match dtb__58 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__57) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__57, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)) a2)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid = (fun ec acc depth fuel a b -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__59) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__60) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__59) dtb__60) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__61) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__62) -> (if (dtb__61 = dtb__62) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__63) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__64) -> (if (dtb__63 = dtb__64) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__65) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__66) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__65) dtb__66) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__67) -> (match dtb__67 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__68, dtb__69) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__70) -> (match dtb__70 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__71, dtb__72) -> (if (dtb__68 = dtb__71) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__69) dtb__72) else (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) b)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__73, dtb__74) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__75, dtb__76) -> (if (dtb__73 = dtb__75) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__74) dtb__76) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) a)))

let v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dwildArgs = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))), (v_Vuna_dCompiler_dElab_dCase_dwildArgs (n - 1))))))

let rec v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> (if dtb__78 then (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__81) else (1 + (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__81)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dCase_drigidIdxVals = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if (v_Vuna_dCompiler_dElab_dCase_disRigidVal dtb__82) then (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__83) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_disRigidVal = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__84) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__85) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__86) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__87) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__88, dtb__89) -> (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__89)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dbindCtorGo = (fun ctx ty subpats acc -> (match ty with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> ((fun domVal -> (if dtb__91 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__94) subpats) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (famName, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue famName) domVal) ctx))) (dtb__90 ^ "#fam")) else (match subpats with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CaseBranchTooFewArgs) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (match dtb__95 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__97, dtb__98) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__92) domVal) dtb__94) dtb__97) dtb__96) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__99) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__92) domVal) dtb__94) "_") dtb__96) acc)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__95)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__93))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (ctx, (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), subpats))))))
))
and v_Vuna_dCompiler_dElab_dCase_dbindCtorField = (fun ctx rig domVal cod binderName rest acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (binderName, rig)), acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binderName) domVal) ctx)))

let v_Vuna_dCompiler_dElab_dCase_dbindCtorTele = (fun ctx ty subpats -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx) ty) subpats) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__100 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__102, dtb__103) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__102, (mc1 + mc2), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals dtb__101) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultTerms = (fun c -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__104, dtb__105) -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultVals = (fun c base -> ((fun tele -> ((fun env -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))) (Base_dList.v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals tele) base) 0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let rec v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) Base_dList.C_Base_dList_dList_Nil) mc3) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultVals dtb__106) mc3)) mc2) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__108) -> false
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__109) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo mc0) dtb__107) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable = (fun ec dd idxs depth -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) idxs) depth))

let v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue = (fun ec depth v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__110) -> (match dtb__110 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__111, dtb__112) -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__112)) then false else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__111) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable ec) dtb__113) dtb__112) depth)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__114 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__116, dtb__117) -> (if (((v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc2) dtb__117)) then true else ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt mc0) mc1) (mc2 + 1)) dtb__115))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder = (fun ec ctx -> ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) 0) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__118, dtb__119) -> dtb__118
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify = (fun ec branchCtx refs -> (if ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine branchCtx) refs)) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx else C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk))

let v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn = (fun ctx c -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c)))

let v_Vuna_dCompiler_dElab_dCase_dbranchVerdict = (fun ctx ec idxs ctor -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__120) -> (match dtb__120 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__121, dtb__122) -> (match dtb__122 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__123, dtb__124) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__124) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk else (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__121)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__121) ctor)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__125) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__126) -> (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__121) dtb__126)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__127) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dCase_dwildArgs (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))))

let v_Vuna_dCompiler_dElab_dCase_dbranchReachable = (fun ctx ec idxs ctor -> (v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable ((((v_Vuna_dCompiler_dElab_dCase_dbranchVerdict ctx) ec) idxs) ctor)))

let rec v_Vuna_dCompiler_dElab_dCase_dteleValsFrom = (fun low k -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_tele", low, Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom (low + 1)) (k - 1))))))

let v_Vuna_dCompiler_dElab_dCase_dctorValueIn = (fun ctx c -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c))))))

let v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee = (fun ec depth refs ctorVal scrutVal -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) scrutVal)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__128) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__129, dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx ec) refs) depth) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__128))) ctorVal)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (refs))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (refs))
)) dtb__128)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (refs))
))

let v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__132) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__133, dtb__134) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (if (v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable dtb__135) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__136) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (match dtb__137 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__139, dtb__140) -> (match dtb__139 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__141, dtb__142, dtb__143) -> (if (if (dtb__141 = mc0) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__142) else false) then true else ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__138))
  | _ -> ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__138)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitPatEq = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__144, dtb__145) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__146, dtb__147) -> (dtb__144 = dtb__146)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__148, dtb__149) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__150, dtb__151) -> (dtb__148 = dtb__150)
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (match dtb__152 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__154, dtb__155) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitPatEq mc0) dtb__154) then true else ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered mc0) dtb__153))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitLabel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__156, dtb__157) -> (String.concat "" ["\""; dtb__156; "\""])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__158, dtb__159) -> (bi_strFromInt dtb__158)
  | _ -> ""
))

let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__160, dtb__161, dtb__162) -> (v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__161)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__163, dtb__164) -> (match dtb__163 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__165, dtb__166) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__165), dtb__166)), (v_Vuna_dCompiler_dElab_dCase_dstripAsPats dtb__164)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasLitHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match dtb__167 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__169, dtb__170) -> (match dtb__169 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__171, dtb__172) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__173, dtb__174) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCase_dhasLitHead dtb__168)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> (if (v_Vuna_dCompiler_dElab_dCase_dhasLitHead mc2) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc3) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_BranchAfterCatchAll) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc3) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CatchAllNotLast))
))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo = (fun prevs alts -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (match dtb__175 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178) -> (match dtb__177 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__179, dtb__180, dtb__181) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered dtb__179) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__181) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RedundantCtorBranch (dtb__179))) dtb__179) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178)), prevs))) dtb__176))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__182, dtb__183) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__177) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__183) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__177)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__177)) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178)), prevs))) dtb__176))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__184, dtb__185) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__177) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__185) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__177)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__177)) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178)), prevs))) dtb__176))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__186, dtb__187, dtb__188) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178)), prevs))) dtb__176)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__189, dtb__190) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178))) dtb__176) dtb__190)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__191) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178))) dtb__176) dtb__191)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__192, dtb__193, dtb__194) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__177, dtb__178)), prevs))) dtb__176)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
)) alts))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat = (fun alts -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dCase_dstripAsPats alts)))

let rec v_Vuna_dCompiler_dElab_dCase_daltNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__195 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__197, dtb__198) -> (match dtb__197 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__199, dtb__200, dtb__201) -> (Base_dList.C_Base_dList_dList_Cons (dtb__199, (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__196)))
  | _ -> (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__196)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__202, dtb__203) -> (match dtb__202 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__204, dtb__205) -> (match dtb__204 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__206, dtb__207, dtb__208) -> (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll dtb__203)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasDupNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (if ((Base_dList.v_Base_dList_dmemName dtb__209) dtb__210) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames dtb__210))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedArg = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (match dtb__211 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__213, dtb__214) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__212)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__215) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__212)
  | _ -> true
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dnestedInPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__216, dtb__217, dtb__218) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__217)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedPat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__219, dtb__220) -> (match dtb__219 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__221, dtb__222) -> (if (v_Vuna_dCompiler_dElab_dCase_dnestedInPat dtb__221) then true else (v_Vuna_dCompiler_dElab_dCase_danyNestedPat dtb__220))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCovered = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__223)) mc4) then ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__224) else (if ((((v_Vuna_dCompiler_dElab_dCase_dbranchReachable mc0) mc1) mc3) dtb__223) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc6) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotExhaustive ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__223))))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__223))) else ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__224)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCoverage = (fun ctx ec dd idxs alts sp -> ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) alts) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone = (fun ec ctx dd idxs alts expected sp scrutTerm altTerms -> (if (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll alts) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)), ec)))) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)), ec))))))))
