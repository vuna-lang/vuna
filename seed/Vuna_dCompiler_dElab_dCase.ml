open Vuna_runtime
type t_Vuna_dCompiler_dElab_dCase_dBranchVerdict = C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx

let v_Vuna_dCompiler_dElab_dCase_dunifyErr = (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex) Base_dVec.C_Base_dVec_dVec_Nil)))

let rec v_Vuna_dCompiler_dElab_dCase_doccursLevel = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__0) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__1) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__2) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__3) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__4) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__5, dtb__6, dtb__7) -> (if (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__5) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__6)) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__7))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__8, dtb__9) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__8)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__10, dtb__11) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__10) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__11))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__13)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__15)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__16, dtb__17, dtb__18) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__18)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__22) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__23))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__24) -> (match dtb__24 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__25, dtb__26, dtb__27) -> (if (dtb__26 = mc0) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__27))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__29)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__30) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__31))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelClo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__32, dtb__33) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__32)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv = (fun ec acc depth a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) a) b) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__34) -> (Base_dResult.C_Base_dResult_dResult_Ok (acc))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__35) -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dunifyIdxList = (fun ec acc depth fuel xs ys -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo ec) acc) depth) fuel) xs) ys)))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx mc0) mc1) mc2) (mc3 - 1)) dtb__36) dtb__38)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) acc2) mc2) (mc3 - 1)) dtb__37) dtb__39)))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (mc1))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdx = (fun ec acc depth fuel a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IndexFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else ((fun a2 -> ((fun b2 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__40) -> (match dtb__40 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__41, dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__44) -> (match dtb__44 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__45, dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__42 = dtb__46) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else (if (dtb__42 < dtb__46) then (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__46) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__46, a2)), acc))))) else (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__42) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__42, b2)), acc)))))))
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__42) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__42, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__42) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__42, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__42) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__42, b2)), acc)))))
)) b2)
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__48) -> (match dtb__48 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__49, dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__50) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__50, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__52) -> (match dtb__52 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__53, dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__54) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__54, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__56) -> (match dtb__56 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__57, dtb__58, dtb__59) -> (match dtb__59 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__58) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__58, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) (fuel - 1)) a2) b2)
)) b2)
)) a2)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid = (fun ec acc depth fuel a b -> (if (fuel <= 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__60) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__61) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__60) dtb__61) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__62) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__63) -> (if (dtb__62 = dtb__63) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__64) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__65) -> (if (dtb__64 = dtb__65) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__66) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__67) -> (if (dtb__66 = dtb__67) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__68) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__69) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__68) dtb__69) then (Base_dResult.C_Base_dResult_dResult_Ok (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__70) -> (match dtb__70 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__71, dtb__72) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__73) -> (match dtb__73 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__74, dtb__75) -> (if (dtb__71 = dtb__74) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__72) dtb__75) else (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) b)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__76, dtb__77) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__78, dtb__79) -> (if (dtb__76 = dtb__78) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) (fuel - 1)) dtb__77) dtb__79) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (if dtb__81 then (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__84) else (1 + (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__84)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dCase_drigidIdxVals = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (if (v_Vuna_dCompiler_dElab_dCase_disRigidVal dtb__85) then (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__86) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_disRigidVal = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__87) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__88) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__89) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__90) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__91) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__92, dtb__93) -> (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__93)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dbindCtorGo = (fun ctx ty subpats acc -> (match ty with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> ((fun domVal -> (if dtb__95 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__98) subpats) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (famName, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue famName) domVal) ctx))) (dtb__94 ^ "#fam")) else (match subpats with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CaseBranchTooFewArgs) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__101, dtb__102) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__96) domVal) dtb__98) dtb__101) dtb__100) acc)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__103) -> (((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) dtb__96) domVal) dtb__98) "_") dtb__100) acc)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__99)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__97))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (ctx, (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), subpats))))))
))
and v_Vuna_dCompiler_dElab_dCase_dbindCtorField = (fun ctx rig domVal cod binderName rest acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (binderName, rig)), acc)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binderName) domVal) ctx)))

let v_Vuna_dCompiler_dElab_dCase_dbindCtorTele = (fun ctx ty subpats -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx) ty) subpats) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__104 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__106, dtb__107) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__106, (mc1 + mc2), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals dtb__105) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultTerms = (fun c -> (match (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresultSpine (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__108, dtb__109) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultVals = (fun c base -> ((fun tele -> ((fun env -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))) (Base_dList.v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals tele) base) 0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let rec v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) Base_dList.C_Base_dList_dList_Nil) mc3) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultVals dtb__110) mc3)) mc2) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__112) -> false
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__113) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo mc0) dtb__111) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable = (fun ec dd idxs depth -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) idxs) depth))

let v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue = (fun ec depth v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__114) -> (match dtb__114 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__115, dtb__116) -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__116)) then false else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__115) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable ec) dtb__117) dtb__116) depth)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (match dtb__118 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__120, dtb__121) -> (if (((v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc2) dtb__121)) then true else ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt mc0) mc1) (mc2 + 1)) dtb__119))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder = (fun ec ctx -> ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) 0) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__122, dtb__123) -> dtb__122
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify = (fun ec branchCtx refs -> (if ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine branchCtx) refs)) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx else C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk))

let v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn = (fun ctx c -> ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c)))

let v_Vuna_dCompiler_dElab_dCase_dbranchVerdict = (fun ctx ec idxs ctor -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__124) -> (match dtb__124 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__125, dtb__126) -> (match dtb__126 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__127, dtb__128) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__128) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk else (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__125)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__125) ctor)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__129) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__130) -> (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__125) dtb__130)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__131) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dCase_dwildArgs (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))))

let v_Vuna_dCompiler_dElab_dCase_dbranchReachable = (fun ctx ec idxs ctor -> (v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable ((((v_Vuna_dCompiler_dElab_dCase_dbranchVerdict ctx) ec) idxs) ctor)))

let rec v_Vuna_dCompiler_dElab_dCase_dteleValsFrom = (fun low k -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_tele", low, Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom (low + 1)) (k - 1))))))

let v_Vuna_dCompiler_dElab_dCase_dctorValueIn = (fun ctx c -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx) - (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c))))))

let v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee = (fun ec depth refs ctorVal scrutVal -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) scrutVal)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__132) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__133, dtb__134, dtb__135) -> (match dtb__135 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx ec) refs) depth) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__132))) ctorVal)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (refs))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (refs))
)) dtb__132)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (refs))
))

let v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__136) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__137, dtb__138) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (if (v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable dtb__139) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__140) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match dtb__141 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__143, dtb__144) -> (match dtb__143 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__145, dtb__146, dtb__147) -> (if (if (dtb__145 = mc0) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__146) else false) then true else ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__142))
  | _ -> ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__142)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitPatEq = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__148, dtb__149) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__150, dtb__151) -> (dtb__148 = dtb__150)
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__152, dtb__153) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__154, dtb__155) -> (dtb__152 = dtb__154)
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (match dtb__156 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__158, dtb__159) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitPatEq mc0) dtb__158) then true else ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered mc0) dtb__157))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dlitLabel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__160, dtb__161) -> (String.concat "" ["\""; dtb__160; "\""])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__162, dtb__163) -> (bi_strFromInt dtb__162)
  | _ -> ""
))

let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__164, dtb__165, dtb__166) -> (v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__165)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dCase_dstripAsPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match dtb__167 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__169, dtb__170) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dCase_dstripAsPat dtb__169), dtb__170)), (v_Vuna_dCompiler_dElab_dCase_dstripAsPats dtb__168)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasLitHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__171 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__173, dtb__174) -> (match dtb__173 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__175, dtb__176) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__177, dtb__178) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCase_dhasLitHead dtb__172)
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (match dtb__179 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182) -> (match dtb__181 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__183, dtb__184, dtb__185) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered dtb__183) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__185) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RedundantCtorBranch (dtb__183))) dtb__183) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182)), prevs))) dtb__180))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__186, dtb__187) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__181) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__187) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__181)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__181)) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182)), prevs))) dtb__180))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__188, dtb__189) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered dtb__181) prevs) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__189) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__181)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel dtb__181)) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182)), prevs))) dtb__180))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__190, dtb__191, dtb__192) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182)), prevs))) dtb__180)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__193, dtb__194) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182))) dtb__180) dtb__194)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__195) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182))) dtb__180) dtb__195)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__196, dtb__197, dtb__198) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__182)), prevs))) dtb__180)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
)) alts))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat = (fun alts -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dCase_dstripAsPats alts)))

let rec v_Vuna_dCompiler_dElab_dCase_daltNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> (match dtb__199 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__201, dtb__202) -> (match dtb__201 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__203, dtb__204, dtb__205) -> (Base_dList.C_Base_dList_dList_Cons (dtb__203, (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__200)))
  | _ -> (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__200)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__206, dtb__207) -> (match dtb__206 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__208, dtb__209) -> (match dtb__208 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__210, dtb__211, dtb__212) -> (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll dtb__207)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasDupNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__213, dtb__214) -> (if ((Base_dList.v_Base_dList_dmemName dtb__213) dtb__214) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames dtb__214))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedArg = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (match dtb__215 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__217, dtb__218) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__216)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__219) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__216)
  | _ -> true
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dnestedInPat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__220, dtb__221, dtb__222) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__221)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedPat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (match dtb__223 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__225, dtb__226) -> (if (v_Vuna_dCompiler_dElab_dCase_dnestedInPat dtb__225) then true else (v_Vuna_dCompiler_dElab_dCase_danyNestedPat dtb__224))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCovered = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__227)) mc4) then ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__228) else (if ((((v_Vuna_dCompiler_dElab_dCase_dbranchReachable mc0) mc1) mc3) dtb__227) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc6) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotExhaustive ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__227))))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__227))) else ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__228)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCoverage = (fun ctx ec dd idxs alts sp -> ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) alts) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone = (fun ec ctx dd idxs alts expected sp scrutTerm altTerms -> (if (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll alts) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)), ec)))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (scrutTerm, altTerms)), ec))))))))
