open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
type t_Vuna_dCompiler_dElab_dCase_dBranchVerdict = C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx

let v_Vuna_dCompiler_dElab_dCase_dunifyErr = (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchIndex) C_Base_dVec_dVec_Base_dVec_dVNil)))

let rec v_Vuna_dCompiler_dElab_dCase_doccursLevel = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__0) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__1) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__2) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__3) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__4, dtb__5, dtb__6) -> (if (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__4) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__5)) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__6))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__7, dtb__8) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__7)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__9, dtb__10) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__9) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__10))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__11, dtb__12) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__12)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__13, dtb__14) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__14)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__17)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__21) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo mc0) dtb__22))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__23) -> (match dtb__23 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__24, dtb__25, dtb__26) -> (if ((bi_eq_int dtb__25) mc0) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__26))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__27, dtb__28) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__29) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__30))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelClo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__31)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv = (fun ec -> (fun acc -> (fun depth -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) a) b) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__33) -> (C_Base_dResult_dResult_Base_dResult_dOk (acc))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__34) -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dCase_dunifyIdxList = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun xs -> (fun ys -> (if ((bi_le_int fuel) 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo ec) acc) depth) fuel) xs) ys))))))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx mc0) mc1) mc2) ((bi_sub mc3) 1)) dtb__35) dtb__37)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) acc2) mc2) ((bi_sub mc3) 1)) dtb__36) dtb__38)))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdx = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIndexFuel) C_Base_dVec_dVec_Base_dVec_dVNil))) else ((fun a2 -> ((fun b2 -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__39) -> (match dtb__39 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__40, dtb__41, dtb__42) -> (match dtb__42 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__43) -> (match dtb__43 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__44, dtb__45, dtb__46) -> (match dtb__46 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_eq_int dtb__41) dtb__45) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (if ((bi_lt_int dtb__41) dtb__45) then (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__45) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, a2)), acc))))) else (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))))
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)) b2)
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__47) -> (match dtb__47 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__48, dtb__49, dtb__50) -> (match dtb__50 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__49) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__51) -> (match dtb__51 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__52, dtb__53, dtb__54) -> (match dtb__54 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__53) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)) b2)
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__55) -> (match dtb__55 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__56, dtb__57, dtb__58) -> (match dtb__58 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__57) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)) b2)
)) a2)) ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b)))) ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a))))))))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__59) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__60) -> (if (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) dtb__59) dtb__60) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__61) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__62) -> (if ((bi_eq_str dtb__61) dtb__62) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__63) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__64) -> (if ((bi_eq_int dtb__63) dtb__64) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__65) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__66) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__65) dtb__66) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__67) -> (match dtb__67 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__68, dtb__69) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__70) -> (match dtb__70 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__71, dtb__72) -> (if ((bi_eq_str dtb__68) dtb__71) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) ((bi_sub fuel) 1)) dtb__69) dtb__72) else (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) b)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__73, dtb__74) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__75, dtb__76) -> (if ((bi_eq_str dtb__73) dtb__75) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) ((bi_sub fuel) 1)) dtb__74) dtb__76) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)) a))))))))

let v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dwildArgs = (fun n -> (if ((bi_le_int n) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (v_Vuna_dCompiler_dElab_dCase_dwildArgs ((bi_sub n) 1))))))

let rec v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> (if dtb__78 then (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__81) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__81)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dCase_drigidIdxVals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (if (v_Vuna_dCompiler_dElab_dCase_disRigidVal dtb__82) then (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__83) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_disRigidVal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__84) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__85) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__86) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__87) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__88, dtb__89) -> (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__89)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dbindCtorGo = (fun ctx -> (fun ty -> (fun subpats -> (fun acc -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> ((fun domVal -> (if dtb__91 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__94) subpats) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (famName, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), acc)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue famName) domVal) ctx))) ((bi_concat dtb__90) "#fam")) else (match subpats with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCaseBranchTooFewArgs) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (match dtb__95 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__97, dtb__98) -> ((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) domVal) dtb__94) dtb__97) dtb__96) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__99) -> ((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorField ctx) domVal) dtb__94) "_") dtb__96) acc)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__95)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__93))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (ctx, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse acc), subpats))))))
)))))
and v_Vuna_dCompiler_dElab_dCase_dbindCtorField = (fun ctx -> (fun domVal -> (fun cod -> (fun binderName -> (fun rest -> (fun acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (binderName, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) domVal))), acc)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binderName) domVal) ctx))))))))

let v_Vuna_dCompiler_dElab_dCase_dbindCtorTele = (fun ctx -> (fun ty -> (fun subpats -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx) ty) subpats) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__102, ((bi_add mc1) mc2), C_Base_dList_dList_Base_dList_dNil)))), (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals dtb__101) mc1) ((bi_add mc2) 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dCase_dctorResultTerms = (fun c -> (match (v_Vuna_dCompiler_dElab_dMeta_dresultSpine (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultVals = (fun c -> (fun base -> ((fun tele -> ((fun env -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dCore_dEval_deval env) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))) (v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals tele) base) 0)))) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c))))

let rec v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) C_Base_dList_dList_Base_dList_dNil) mc3) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultVals dtb__106) mc3)) mc2) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__108) -> false
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__109) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo mc0) dtb__107) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable = (fun ec -> (fun dd -> (fun idxs -> (fun depth -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo ec) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) idxs) depth)))))

let v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue = (fun ec -> (fun depth -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__110) -> (match dtb__110 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__111, dtb__112) -> (if (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__112)) then false else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__111) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable ec) dtb__113) dtb__112) depth)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))))

let rec v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (match dtb__114 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__116, dtb__117) -> (if (((v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue mc0) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) (((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc1) mc2) dtb__117)) then true else ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt mc0) mc1) ((bi_add mc2) 1)) dtb__115))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder = (fun ec -> (fun ctx -> ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) 0) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx))))

let v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify = (fun ec -> (fun branchCtx -> (fun refs -> (if ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) ((v_Vuna_dCompiler_dElab_dTypes_dctxRefine branchCtx) refs)) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx else C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk))))

let v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn = (fun ctx -> (fun c -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))))

let v_Vuna_dCompiler_dElab_dCase_dbranchVerdict = (fun ctx -> (fun ec -> (fun idxs -> (fun ctor -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__118) -> (match dtb__118 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (match dtb__120 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__122) then C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk else (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__119)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__119) ctor)) ((v_Base_dList_dmap (fun v -> (((v_Vuna_dCompiler_dElab_dTypes_drefineValue C_Base_dList_dList_Base_dList_dNil) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__123) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__124) -> (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__119) dtb__124)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__125) -> C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dCase_dwildArgs (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)))))))))

let v_Vuna_dCompiler_dElab_dCase_dbranchReachable = (fun ctx -> (fun ec -> (fun idxs -> (fun ctor -> (v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable ((((v_Vuna_dCompiler_dElab_dCase_dbranchVerdict ctx) ec) idxs) ctor))))))

let rec v_Vuna_dCompiler_dElab_dCase_dteleValsFrom = (fun low -> (fun k -> (if ((bi_le_int k) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("_tele", low, C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((bi_add low) 1)) ((bi_sub k) 1)))))))

let v_Vuna_dCompiler_dElab_dCase_dctorValueIn = (fun ctx -> (fun c -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((bi_sub (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))))))

let v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee = (fun ec -> (fun depth -> (fun refs -> (fun ctorVal -> (fun scrutVal -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) scrutVal)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__126) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__127, dtb__128, dtb__129) -> (match dtb__129 with
  | C_Base_dList_dList_Base_dList_dNil -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx ec) refs) depth) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__126))) ctorVal)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
)) dtb__126)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
))))))

let v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__130) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__131, dtb__132) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (if (v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable dtb__133) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__134) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__135, dtb__136) -> (match dtb__135 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, dtb__138) -> (match dtb__137 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__139, dtb__140, dtb__141) -> (if (if ((bi_eq_str dtb__139) mc0) then (v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable dtb__140) else false) then true else ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__136))
  | _ -> ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered mc0) dtb__136)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dCase_dlitPatEq = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__142, dtb__143) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__144, dtb__145) -> ((bi_eq_str dtb__142) dtb__144)
  | _ -> false
)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__146, dtb__147) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__148, dtb__149) -> ((bi_eq_int dtb__146) dtb__148)
  | _ -> false
)
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match dtb__150 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitPatEq mc0) dtb__152) then true else ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered mc0) dtb__151))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dCase_dlitLabel = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__154, dtb__155) -> ((bi_concat "\"") ((bi_concat dtb__154) "\""))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__156, dtb__157) -> (bi_strFromInt dtb__156)
  | _ -> ""
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasLitHead = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (match dtb__158 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> (match dtb__160 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__162, dtb__163) -> true
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__164, dtb__165) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCase_dhasLitHead dtb__159)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> (if (v_Vuna_dCompiler_dElab_dCase_dhasLitHead mc2) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc3) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBranchAfterCatchAll) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc3) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCatchAllNotLast))
)))))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo = (fun prevs -> (fun alts -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__166, dtb__167) -> (match dtb__166 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169) -> (match dtb__168 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__170, dtb__171, dtb__172) -> (if ((v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered dtb__170) prevs) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__172) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRedundantCtorBranch (dtb__170))) dtb__170) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169)), prevs))) dtb__167))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__173, dtb__174, dtb__175) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo prevs) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__169)), dtb__167)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__176, dtb__177) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckLitHead prevs) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169))) dtb__167) dtb__177)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__178, dtb__179) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckLitHead prevs) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169))) dtb__167) dtb__179)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__180, dtb__181) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169))) dtb__167) dtb__181)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__182) -> ((((v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll prevs) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169))) dtb__167) dtb__182)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__183, dtb__184, dtb__185) -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169)), prevs))) dtb__167)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)) alts)))
and v_Vuna_dCompiler_dElab_dCase_dcheckLitHead = (fun prevs -> (fun alt -> (fun rest -> (fun sp -> ((fun p -> (if ((v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered p) prevs) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRedundantLiteralBranch ((v_Vuna_dCompiler_dElab_dCase_dlitLabel p)))) (v_Vuna_dCompiler_dElab_dCase_dlitLabel p)) else ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo (C_Base_dList_dList_Base_dList_dCons (alt, prevs))) rest))) (v_Base_dPair_dfirstOf alt))))))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat = (fun alts -> ((v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo C_Base_dList_dList_Base_dList_dNil) alts))

let rec v_Vuna_dCompiler_dElab_dCase_daltNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match dtb__186 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (match dtb__188 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__190, dtb__191, dtb__192) -> (C_Base_dList_dList_Base_dList_dCons (dtb__190, (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__187)))
  | _ -> (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__187)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasCatchAll = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__194) -> (match dtb__193 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__196) -> (match dtb__195 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__197, dtb__198, dtb__199) -> (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll dtb__194)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasDupNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> (if ((v_Base_dList_dmemName dtb__200) dtb__201) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames dtb__201))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedArg = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__202, dtb__203) -> (match dtb__202 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__204, dtb__205) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__203)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__206) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__203)
  | _ -> true
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dnestedInPat = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__207, dtb__208, dtb__209) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__208)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedPat = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__210, dtb__211) -> (match dtb__210 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> (if (v_Vuna_dCompiler_dElab_dCase_dnestedInPat dtb__212) then true else (v_Vuna_dCompiler_dElab_dCase_danyNestedPat dtb__211))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCovered = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__214, dtb__215) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__214)) mc4) then ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__215) else (if ((((v_Vuna_dCompiler_dElab_dCase_dbranchReachable mc0) mc1) mc3) dtb__214) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc6) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotExhaustive ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__214)))) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__214)) else ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__215)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dCase_dcheckCoverage = (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun alts -> (fun sp -> ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) alts) sp) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd))))))))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone = (fun ec -> (fun ctx -> (fun dd -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (fun scrutTerm -> (fun altTerms -> (if (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll alts) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (scrutTerm, altTerms)), ec)))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (scrutTerm, altTerms)), ec))))))))))))))))
