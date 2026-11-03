open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
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
type t_Vuna_dCompiler_dElab_dCase_dPending = C_Vuna_dCompiler_dElab_dCase_dPending_Vuna_dCompiler_dElab_dCase_dPending of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (string)
and t_Vuna_dCompiler_dElab_dCase_dBindAcc = C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc of ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dCase_dPending t_Base_dList_dList)

let v_Vuna_dCompiler_dElab_dCase_dunifyErr = (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dImpossibleBranchIndex) C_Base_dVec_dVec_Base_dVec_dVNil)))

let rec v_Vuna_dCompiler_dElab_dCase_doccursLevel = (fun lvl -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__1, dtb__2, dtb__3) -> (if ((bi_eq_int dtb__2) lvl) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList lvl) dtb__3))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList lvl) dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__6, dtb__7, dtb__8, dtb__9, dtb__10) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel lvl) dtb__9) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo lvl) dtb__10))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__11, dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelClo lvl) dtb__13)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList lvl) dtb__15)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList lvl) dtb__17)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__18, dtb__19) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel lvl) dtb__18) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel lvl) dtb__19))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__20, dtb__21) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevel lvl) dtb__20)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__22, dtb__23, dtb__24) -> (if (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel lvl) dtb__22) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel lvl) dtb__23)) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevel lvl) dtb__24))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__25) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__26) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__27) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__28) -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel mc0) dtb__29) then true else ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList mc0) dtb__30))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dCase_doccursLevelClo = (fun lvl -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dElab_dCase_doccursLevelList lvl) dtb__31)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv = (fun ec -> (fun acc -> (fun depth -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) a) b) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__33) -> (C_Base_dResult_dResult_Base_dResult_dOk (acc))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__34) -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dCase_dunifyIdxList = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun xs -> (fun ys -> (if ((bi_le_int fuel) 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo ec) acc) depth) fuel) xs) ys))))))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__37, dtb__38) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx mc0) mc1) mc2) ((bi_sub mc3) 1)) dtb__35) dtb__37)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) acc2) mc2) ((bi_sub mc3) 1)) dtb__36) dtb__38)))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdx = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dIndexFuel) C_Base_dVec_dVec_Base_dVec_dVNil))) else ((fun a2 -> ((fun b2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__39) -> (match dtb__39 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__40, dtb__41, dtb__42) -> (match dtb__42 with
  | C_Base_dList_dList_Nil -> (match b2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__43) -> (match dtb__43 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__44, dtb__45, dtb__46) -> (match dtb__46 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_int dtb__41) dtb__45) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (if ((bi_lt_int dtb__41) dtb__45) then (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__45) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, a2)), acc))))) else (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))))
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__41) b2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, b2)), acc)))))
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__47) -> (match dtb__47 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__48, dtb__49, dtb__50) -> (match dtb__50 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__49) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__51) -> (match dtb__51 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__52, dtb__53, dtb__54) -> (match dtb__54 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__53) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__55) -> (match dtb__55 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__56, dtb__57, dtb__58) -> (match dtb__58 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dCase_doccursLevel dtb__57) a2) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, a2)), acc)))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid ec) acc) depth) ((bi_sub fuel) 1)) a2) b2)
)
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b)))) ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue acc) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a))))))))))
and v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then v_Vuna_dCompiler_dElab_dCase_dunifyErr else (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__59, dtb__60) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__61, dtb__62) -> (if ((bi_eq_str dtb__59) dtb__61) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) ((bi_sub fuel) 1)) dtb__60) dtb__62) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__63) -> (match dtb__63 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__64, dtb__65) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__66) -> (match dtb__66 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__67, dtb__68) -> (if ((bi_eq_str dtb__64) dtb__67) then ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) acc) depth) ((bi_sub fuel) 1)) dtb__65) dtb__68) else (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__69) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__70) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__69) dtb__70) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__71) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__72) -> (if ((bi_eq_int dtb__71) dtb__72) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__73) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__74) -> (if ((bi_eq_str dtb__73) dtb__74) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__75) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__76) -> (if (((v_Base_dEq_deq v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool) dtb__75) dtb__76) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else v_Vuna_dCompiler_dElab_dCase_dunifyErr)
  | _ -> v_Vuna_dCompiler_dElab_dCase_dunifyErr
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv ec) acc) depth) a) b)
))))))))

let rec v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (match dtb__77 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__79, ((bi_add mc1) mc2), C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals dtb__78) mc1) ((bi_add mc2) 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dCase_dctorResultTerms = (fun c -> (match (v_Vuna_dCompiler_dElab_dMeta_dresultSpine (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dctorResultVals = (fun c -> (fun base -> ((fun tele -> ((fun env -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dCore_dEval_deval env) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))) (v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals tele) base) 0)))) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c))))

let v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn = (fun ctx -> (fun c -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dCase_dctorResultTerms c))))

let rec v_Vuna_dCompiler_dElab_dCase_dteleValsFrom = (fun low -> (fun k -> (if ((bi_le_int k) 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("_tele", low, C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((bi_add low) 1)) ((bi_sub k) 1)))))))

let v_Vuna_dCompiler_dElab_dCase_dctorValueIn = (fun ctx -> (fun c -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dCase_dteleValsFrom ((bi_sub (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))))))

let v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee = (fun ec -> (fun depth -> (fun refs -> (fun ctorVal -> (fun scrutVal -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) scrutVal)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__83) -> (match dtb__83 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__84, dtb__85, dtb__86) -> (match dtb__86 with
  | C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdx ec) refs) depth) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__83))) ctorVal)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
))))))

let v_Vuna_dCompiler_dElab_dCase_dpendingPat = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dPending_Vuna_dCompiler_dElab_dCase_dPending (dtb__87, dtb__88) -> dtb__87
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dpendingName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dPending_Vuna_dCompiler_dElab_dCase_dPending (dtb__89, dtb__90) -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dbaBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc (dtb__91, dtb__92) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dbaPending = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc (dtb__93, dtb__94) -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dfreshPatName = (fun i -> ((bi_concat "_np") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dCase_dbindCtorGo = (fun ctx -> (fun ty -> (fun subpats -> (fun acc -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> ((fun domVal -> (if dtb__96 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__99) subpats) (C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (famName, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), (v_Vuna_dCompiler_dElab_dCase_dbaBinders acc))), (v_Vuna_dCompiler_dElab_dCase_dbaPending acc))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue famName) domVal) ctx))) ((bi_concat dtb__95) "#fam")) else (match subpats with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCaseBranchTooFewArgs) C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__100 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__102, dtb__103) -> ((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorBinder ctx) domVal) dtb__99) dtb__102) dtb__101) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__104) -> ((((((v_Vuna_dCompiler_dElab_dCase_dbindCtorBinder ctx) domVal) dtb__99) "_") dtb__101) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__105, dtb__106, dtb__107) -> ((fun fresh -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) dtb__99) dtb__101) (C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fresh, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dCase_dbaBinders acc))), ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dCase_dbaPending acc)) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dCase_dPending_Vuna_dCompiler_dElab_dCase_dPending (dtb__100, fresh)), C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue fresh) domVal) ctx))) (v_Vuna_dCompiler_dElab_dCase_dfreshPatName (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dCase_dbaPending acc))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__108, dtb__109) -> ((((((v_Vuna_dCompiler_dElab_dCase_dmkPendingBinder ctx) domVal) dtb__99) dtb__100) dtb__101) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__110, dtb__111) -> ((((((v_Vuna_dCompiler_dElab_dCase_dmkPendingBinder ctx) domVal) dtb__99) dtb__100) dtb__101) acc)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__100)) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dNestedPatterns)
)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__98))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (ctx, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dCase_dbaBinders acc)), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dCase_dbaPending acc), subpats))))))))
)))))
and v_Vuna_dCompiler_dElab_dCase_dmkPendingBinder = (fun ctx -> (fun domVal -> (fun cod -> (fun p -> (fun rest -> (fun acc -> ((fun fresh -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fresh, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dCase_dbaBinders acc))), ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dCase_dbaPending acc)) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dCase_dPending_Vuna_dCompiler_dElab_dCase_dPending (p, fresh)), C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue fresh) domVal) ctx))) (v_Vuna_dCompiler_dElab_dCase_dfreshPatName (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dCase_dbaPending acc))))))))))
and v_Vuna_dCompiler_dElab_dCase_dbindCtorBinder = (fun ctx -> (fun domVal -> (fun cod -> (fun binderName -> (fun rest -> (fun acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx2) cod) rest) (C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (binderName, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dCase_dbaBinders acc))), (v_Vuna_dCompiler_dElab_dCase_dbaPending acc))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binderName) domVal) ctx))))))))

let v_Vuna_dCompiler_dElab_dCase_dbindCtorTele = (fun ctx -> (fun ty -> (fun subpats -> ((((v_Vuna_dCompiler_dElab_dCase_dbindCtorGo ctx) ty) subpats) (C_Vuna_dCompiler_dElab_dCase_dBindAcc_Vuna_dCompiler_dElab_dCase_dBindAcc (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dElab_dCase_dfoldPending = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__112, dtb__113) -> ((fun ps -> ((fun patAlt -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dElab_dCase_dpendingName dtb__112), ps)), (C_Base_dList_dList_Cons (patAlt, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (ps)), dtb__114)), C_Base_dList_dList_Nil)))), ps))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dElab_dCase_dpendingName dtb__112), ps)), (C_Base_dList_dList_Cons (patAlt, C_Base_dList_dList_Nil)), ps))
  | _ -> failwith "DT: impossible branch"
)) (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dCase_dpendingPat dtb__112), (((v_Vuna_dCompiler_dElab_dCase_dfoldPending mc0) dtb__113) mc2))))) (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Vuna_dCompiler_dElab_dCase_dpendingPat dtb__112)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dCase_daltNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (match dtb__115 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> (match dtb__117 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__119, dtb__120, dtb__121) -> (C_Base_dList_dList_Cons (dtb__119, (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__116)))
  | _ -> (v_Vuna_dCompiler_dElab_dCase_daltNames dtb__116)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasCatchAll = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (match dtb__124 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__126, dtb__127, dtb__128) -> (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll dtb__123)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dhasDupNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (if ((v_Base_dList_dmemName dtb__129) dtb__130) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames dtb__130))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dwildArgs = (fun n -> (if ((bi_le_int n) 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (v_Vuna_dCompiler_dElab_dCase_dwildArgs ((bi_sub n) 1))))))

let rec v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135) -> (if dtb__132 then (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__135) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity dtb__135)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dCase_drigidIdxVals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (if (v_Vuna_dCompiler_dElab_dCase_disRigidVal dtb__136) then (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__137) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dCase_disRigidVal = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__138, dtb__139) -> (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__139)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__140) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__141) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__142) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__143) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList mc0) C_Base_dList_dList_Nil) mc3) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultVals dtb__144) mc3)) mc2) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__146) -> false
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__147) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo mc0) dtb__145) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable = (fun ec -> (fun dd -> (fun idxs -> (fun depth -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo ec) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) idxs) depth)))))

let v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue = (fun ec -> (fun depth -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__148) -> (match dtb__148 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__149, dtb__150) -> (if (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dCase_drigidIdxVals dtb__150)) then false else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__149) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> ((((v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable ec) dtb__151) dtb__150) depth)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))))

let rec v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt = (fun ec -> (fun ctx -> (fun idx -> (fun items -> (match items with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (match dtb__152 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> (if (((v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) (((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) dtb__155)) then true else ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) ((bi_add idx) 1)) dtb__153))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder = (fun ec -> (fun ctx -> ((((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt ec) ctx) 0) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx))))

let v_Vuna_dCompiler_dElab_dCase_dbranchReachable = (fun ctx -> (fun ec -> (fun idxs -> (fun ctor -> (match (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dCase_dwildArgs (v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__156) -> true
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__157) -> (match dtb__157 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, dtb__159) -> (match dtb__159 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> (match dtb__161 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__162, dtb__163) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__163) then true else (match ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__158)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__158) ctor)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue C_Base_dList_dList_Nil) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) idxs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__164) -> false
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__165) -> (v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder ec) ((v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__158) dtb__165)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dCase_dcheckCovered = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dList_dList_Cons (dtb__166, dtb__167) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__166)) mc4) then ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__167) else (if ((((v_Vuna_dCompiler_dElab_dCase_dbranchReachable mc0) mc1) mc3) dtb__166) then (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 mc6) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dNotExhaustive ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__166)))) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__166)) else ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__167)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dCase_dcheckCoverage = (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun alts -> (fun sp -> ((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_dCase_daltNames alts)) alts) sp) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd))))))))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedArg = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (match dtb__168 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__170, dtb__171) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__169)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__172) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__169)
  | _ -> true
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dnestedInPat = (fun p -> (match p with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__173, dtb__174, dtb__175) -> (v_Vuna_dCompiler_dElab_dCase_danyNestedArg dtb__174)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dCase_danyNestedPat = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (match dtb__176 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> (if (v_Vuna_dCompiler_dElab_dCase_dnestedInPat dtb__178) then true else (v_Vuna_dCompiler_dElab_dCase_danyNestedPat dtb__177))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dhasVarCatchAll = (fun alts -> (match (v_Base_dList_dreverse alts) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (match dtb__180 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (match dtb__182 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__184, dtb__185) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dCase_dcatchAllNotLast = (fun alts -> (match alts with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (match dtb__186 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (match dtb__188 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__190, dtb__191, dtb__192) -> (v_Vuna_dCompiler_dElab_dCase_dcatchAllNotLast dtb__187)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__187)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone = (fun ec -> (fun ctx -> (fun dd -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (fun scrutTerm -> (fun altTerms -> (if (v_Vuna_dCompiler_dElab_dCase_dhasCatchAll alts) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (scrutTerm, altTerms)), ec)))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (scrutTerm, altTerms)), ec))))))))))))))))
