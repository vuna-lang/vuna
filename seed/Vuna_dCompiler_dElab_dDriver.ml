open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
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
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dInstName
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
type t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder = C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder of (string) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dDriver_dDictSubst = C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst of (int) * (string) * (int)
and t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo of (t_Vuna_dCompiler_dCommon_dSpan) * (string) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList)

let rec v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then ((fun domVal -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__0) domVal) mc0)) dtb__4)) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) dtb__3)) else mc0)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx = (fun ty0 -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty0))

let v_Vuna_dCompiler_dElab_dDriver_dsigDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ((v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2), true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, dtb__5, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) dtb__6) (mc2 + 1))))
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev ((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder (v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2)) mc3) dtb__7) mc0)) dtb__8) (mc2 - 1)) mc3)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev mc0) mc1) ((v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

let v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc1))))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc4) mc3)) (fun parts -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (v_Vuna_dCompiler_dElab_dTypes_decClasses mc1)) mc0) (v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx mc2)) parts) mc4) mc1)) (fun q -> ((fun doms -> ((fun ec1 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts mc2) doms) (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)), ec1))))) (v_Base_dPair_dsecondOf q))) (v_Base_dPair_dfirstOf q))))))
))

let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> (match dtb__9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, dtb__12) -> (match dtb__12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> (match dtb__14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__15, dtb__16) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__15)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, dtb__18) -> (match dtb__18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders mc1) dtb__20) dtb__17) dtb__13) dtb__16)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__10) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, sigTy)), mc1))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__22) (((v_Base_dHashMap_dinsert dtb__11) sigTy) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__22)))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, sigTy)), mc3)))) (((v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__22) 0) dtb__21))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) (v_Base_dList_dreverse mc3)), mc2))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun sigs globals ec -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (v_Base_dHashMap_dfromList globals))) true)) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dDriver_ddeclDictName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__23, dtb__24, dtb__25) -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddeclDictLevel = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__26, dtb__27, dtb__28) -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddeclDictDom = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__29, dtb__30, dtb__31) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (if dtb__33 then ((fun domVal -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo mc0) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__32) domVal) mc1)) dtb__36) acc2)) (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain mc0) domVal) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__32, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1), domVal)), mc3)) else mc3))) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__35)) else (v_Base_dList_dreverse mc3))
  | _ -> (v_Base_dList_dreverse mc3)
))

let v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders = (fun ec ty -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo ec) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dDriver_ddictSubstMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__37, dtb__38, dtb__39) -> dtb__37
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddictSubstName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__40, dtb__41, dtb__42) -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddictSubstQ = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__43, dtb__44, dtb__45) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches = (fun ec a b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__46) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__47) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (if (((v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches mc0) (v_Vuna_dCompiler_dElab_dDriver_ddeclDictDom dtb__48)) mc2) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48)) else (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder mc0) dtb__49) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo = (fun ec binders goals kept acc -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match dtb__50 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__52, dtb__53) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__52) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__54) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__51) (C_Base_dList_dList_Base_dList_dCons (dtb__50, kept))) acc)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder ec) binders) dtb__53) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__51) (C_Base_dList_dList_Base_dList_dCons (dtb__50, kept))) acc)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55) -> ((fun q -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__52) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ((v_Vuna_dCompiler_dElab_dDriver_ddeclDictName dtb__55), (v_Vuna_dCompiler_dElab_dDriver_ddeclDictLevel dtb__55), C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__56) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__56))) binders) dtb__51) kept) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__52, (v_Vuna_dCompiler_dElab_dDriver_ddeclDictName dtb__55), q)), acc)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__57) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__51) (C_Base_dList_dList_Base_dList_dCons (dtb__50, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dDriver_ddeclDictLevel dtb__55) + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse acc), ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals ec) (v_Base_dList_dreverse kept))))
  | _ -> failwith "DT: impossible branch"
)) goals))

let rec v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts dtb__59) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (v_Vuna_dCompiler_dElab_dDriver_ddictSubstMeta dtb__58)) (v_Vuna_dCompiler_dElab_dDriver_ddictSubstName dtb__58)) (v_Vuna_dCompiler_dElab_dDriver_ddictSubstQ dtb__58)) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals = (fun ec ty body -> (match ((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders ec) ty) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (body, ec))
  | dtb__60 -> ((fun solved -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts (v_Base_dPair_dfirstOf solved)) body), (v_Base_dPair_dsecondOf solved)))) (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) dtb__60) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (match dtb__61 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__63, dtb__64, dtb__65, dtb__66) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__62) (((v_Base_dHashMap_dinsert dtb__63) ((v_Base_dList_dappend cur) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65)), C_Base_dList_dList_Base_dList_dNil)))) mc1))) (match ((v_Base_dHashMap_dlookup dtb__63) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__67) -> dtb__67
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__62) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun decls -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun ec decls name -> (match ((v_Base_dHashMap_dlookup name) (v_Vuna_dCompiler_dElab_dTypes_decClausesTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__68) -> dtb__68
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun name ec -> (match ((v_Base_dHashMap_dlookup name) (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__69) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__70) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__70))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun defs -> ((v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (match dtb__71 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__73, dtb__74, dtb__75, dtb__76) -> (C_Base_dList_dList_Base_dList_dCons (dtb__73, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__72)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__72)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dfutureBodyTbl = (fun decls instHeads -> ((v_Base_dHashMap_dinsertAll ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, true)))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) instHeads)))) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__77, dtb__78, dtb__79) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__77)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__78)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__79)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__80) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__81) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__82) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__83, dtb__84) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__83)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__84))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__85, dtb__86) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs (v_Base_dPair_dfirstOf p)))) dtb__86)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__87, dtb__88, dtb__89) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__87)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__88))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__90, dtb__91, dtb__92) -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__92)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__96)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__97))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__98) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__99) -> (C_Base_dList_dList_Base_dList_dCons (dtb__99, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__100) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__101, dtb__102) -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe = (fun fuel future defs defvals self seen refs -> (if (fuel <= 0) then true else (match refs with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (if (dtb__103 = self) then true else (if (v_Base_dMaybe_disJust ((v_Base_dHashMap_dlookup dtb__103) defvals)) then (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) seen) dtb__104) else (if ((v_Base_dHashMap_dmember dtb__103) seen) then (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) seen) dtb__104) else (match ((v_Base_dHashMap_dlookup dtb__103) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__105) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) (((v_Base_dHashMap_dinsert dtb__103) true) seen)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__105)) dtb__104))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dHashMap_dmember dtb__103) future) then true else (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) seen) dtb__104))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_dmemoDefValue = (fun future ec name body -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) body) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) body) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe 4096) future) (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)) name) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs body)) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (name, C_Base_dList_dList_Base_dList_dNil)))))))))))

let v_Vuna_dCompiler_dElab_dDriver_dmemoizeDef = (fun future ec name body -> (match ((((v_Vuna_dCompiler_dElab_dDriver_dmemoDefValue future) ec) name) body) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__106) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutDefVals ec) (((v_Base_dHashMap_dinsert name) dtb__106) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ec
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__109, dtb__110, dtb__111, dtb__112) -> (if (dtb__109 = mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__108))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__108)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match dtb__113 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__115, dtb__116, dtb__117) -> (if (dtb__115 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__114))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__118, dtb__119, dtb__120, dtb__121) -> (if (dtb__118 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__121)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__114))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__114)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__122, dtb__123) -> (match dtb__122 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (match dtb__125 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (match dtb__127 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> (match ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf dtb__124) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__130) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__124) mc2) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__130) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAxiomWithDefinition (dtb__124))) dtb__124) else (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__123) mc1) mc2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__124) mc2) then (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__124) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dSignatureNoDef (dtb__124))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__124, C_Base_dVec_dVec_Base_dVec_dVNil)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131) -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__123) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dSignatureNoDef (dtb__124))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__124, C_Base_dVec_dVec_Base_dVec_dVNil))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs globals decls -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) globals) decls))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__132) -> (match dtb__132 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__133, dtb__134) -> (if (if (if (dtb__133 = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__133 = v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__133 = v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported (("Array " ^ dtb__133)))) dtb__133))
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__135) -> (match dtb__135 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__136, dtb__137) -> (if (if (if (dtb__136 = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__136 = v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__136 = v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (if (dtb__136 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> (match dtb__139 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem mc0) dtb__138)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__137) else (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported (dtb__136))) dtb__136)))
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("non-basic type"))) "non-basic")
))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> (if (mc1 <= 0) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__141 then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) dtb__143)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__144) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__140, mc2, C_Base_dList_dList_Base_dList_dNil))))))))))
  | _ -> (if (mc1 <= 0) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) mc3))
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy = (fun sp tyTerm -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue sp) 64) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm)))

let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146) -> (match dtb__145 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__147, dtb__148, dtb__149, dtb__150) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__147) mc2) mc5) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__150) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__147))) dtb__147)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__147) mc5) then ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__146) mc2) mc3) mc4) mc5) else ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc2) mc5) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc5) (C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146))) dtb__147)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__151)) dtb__150)) (fun p -> ((fun _u -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> ((fun ecNext2 -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__146) mc2) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, liftedTy)), mc3))) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__147, liftedTy, cleanTerm, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150)))), mc4))) ecNext2)) ((((v_Vuna_dCompiler_dElab_dDriver_dmemoizeDef mc0) ecWithDef) dtb__147) cleanTerm))) ((v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, cleanTerm))))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) (((v_Base_dHashMap_dinsert dtb__147) liftedTy) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf lifted))) ((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__147) ec1b) dtb__151) bodyTerm1))) (v_Base_dPair_dsecondOf solvedDecl))) (v_Base_dPair_dfirstOf solvedDecl))) (((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals dtb__153) dtb__151) dtb__152))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__150))) ("FUN " ^ dtb__147)))))) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__150))) ("DEF " ^ dtb__147))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__154, dtb__155, dtb__156) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__154) mc2) mc5) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__156) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__154))) dtb__154)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__146) mc2) mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__154, dtb__157, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__158, dtb__159, dtb__160, dtb__161) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__158) mc2) mc5) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__161) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__158))) dtb__158)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__162) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy dtb__161) dtb__162)) (fun _u -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__146) mc2) mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__158, dtb__162, dtb__159, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161)))), mc4))) mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__146) mc2) mc3) mc4) mc5)
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec defs -> ((v_Base_dList_dmap (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__163), (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals ec n -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2)) < (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix globals) ec2) (n - 1)) else ec2))) ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun prog expr -> (match prog with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> ((fun bodies -> ((fun ec0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__168) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__173, dtb__174) -> (match dtb__174 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__171) (v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) sols2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__177) -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedMetavarInfer ((bi_strFromInt dtb__177)))) (bi_strFromInt dtb__177))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dEval_dnormalize (v_Base_dHashMap_dfromList bodies)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__173)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__178) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__178), tyText))))
  | dtb__179 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__179), tyText))))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Base_dHashMap_dfromList bodies)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__175))))) (v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__168) dtb__176) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__171, dtb__167, (v_Base_dList_dreverse bodies), dtb__164, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, dtb__169, dtb__170, C_Base_dList_dList_Base_dList_dNil, (v_Base_dHashMap_dfromList bodies), (v_Base_dHashMap_dfromList dtb__168), (v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__167), (v_Base_dIntMap_dfromList C_Base_dList_dList_Base_dList_dNil), true, (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil), (v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__164), dtb__172)))) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__165))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog expr -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dPair_dfirstOf p))))))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__180, dtb__181, dtb__182) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__180) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__181)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__182))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__183) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__184) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__185) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__186, dtb__187) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__186) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__187))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__188, dtb__189) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__189)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__190, dtb__191, dtb__192) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__190) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__191))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__193, dtb__194, dtb__195) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__195)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__199) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__200))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__201) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__202) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__203, dtb__204) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__205) -> (dtb__205 = mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__206, dtb__207) -> (match dtb__206 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__208) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__207))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__210, dtb__211) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__210)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__211))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__212, dtb__213) -> (match dtb__212 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc1) dtb__215) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" [dtb__214; " body="; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__215)]))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__213) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216) -> (String.concat "" [" (in `"; dtb__216; "`)"])
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__217, dtb__218) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtGoalMeta dtb__217) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__217)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__218))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining stop sols relevant goals -> (if (remaining <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__219) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i stop sols relevant goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__220) -> ((fun detail -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedHole (detail))) (C_Base_dVec_dVec_Base_dVec_dVCons (detail, C_Base_dVec_dVec_Base_dVec_dVNil)))) (String.concat "" [(v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan dtb__220)); " with goal "; ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__220)) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType dtb__220))]))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun num -> ((fun hint -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedMetavar (num, hint))) (C_Base_dVec_dVec_Base_dVec_dVCons (num, (C_Base_dVec_dVec_Base_dVec_dVCons (hint, C_Base_dVec_dVec_Base_dVec_dVNil)))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dData_delabDatas ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) C_Base_dList_dList_Base_dList_dNil)) v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) v_Vuna_dCompiler_dElab_dTypes_decEmpty)) (fun pd -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__221, dtb__222) -> (match dtb__222 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__223, dtb__224) -> ((fun ec0b -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTraits ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__223) ec0b)) (fun pt -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__225, dtb__226) -> (match dtb__226 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> (match dtb__228 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__229, dtb__230) -> (match dtb__230 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__231, dtb__232) -> ((fun globals1 -> ((fun datas1 -> ((fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__229) globals1) dtb__232)) (fun pih -> (match pih with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__233, dtb__234) -> ((fun globals2 -> ((fun future -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__234)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__235, dtb__236) -> ((fun ec2b -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__235) decls)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies future) decls) dtb__235) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ec2b)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238) -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies decls) dtb__229) datas1) dtb__235) ec3)) (fun pi -> (match pi with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__239, dtb__240) -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__241) -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__241)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun extra -> ((fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls decls)) (fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (datas1, allDefs, (v_Vuna_dCompiler_dElab_dTypes_decGoals ec4), (v_Vuna_dCompiler_dElab_dTypes_decSols ec4), globalsOut, (v_Vuna_dCompiler_dElab_dTypes_decInsts ec4), (v_Vuna_dCompiler_dElab_dTypes_decClasses ec4), (v_Vuna_dCompiler_dElab_dTypes_decNext ec4), (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec4)))))) (v_Vuna_dCompiler_dDebug_dstamp "termination-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "extradefs-done"))) ((v_Base_dList_dmap (fun g -> (match ((v_Base_dHashMap_dlookup (v_Base_dPair_dfirstOf g)) defsTblOut) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__242) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf g), dtb__242))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> g
  | _ -> failwith "DT: impossible branch"
))) dtb__235))) ((v_Base_dHashMap_dinsertAll ((v_Base_dList_dmap (fun x -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName x), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType x))))) allDefs)) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((v_Base_dList_dappend instDefs) ((v_Base_dList_dappend extra) defs))))) ((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf dtb__235) ec4) dtb__231) ((v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDebug_dstamp "instbodies-done"))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__239))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__235) dtb__240) 8))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp (String.concat "" ["bodies-done g="; (bi_strFromInt (v_Base_dList_dlength dtb__235)); " sols="; (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decSols dtb__238))); " defs="; (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__238))); " metas="; (bi_strFromInt (v_Vuna_dCompiler_dElab_dTypes_decNext dtb__238)); " dgoals="; (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals dtb__238))); " datas="; (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__238))); " insts="; (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__238))); " classes="; (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__238)))])))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__237))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__235) dtb__238) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (v_Vuna_dCompiler_dDebug_dstamp "sigs-elab-done"))) ((v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__236) (v_Base_dHashMap_dfromList dtb__235))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "instheads-done"))) ((v_Vuna_dCompiler_dElab_dDriver_dfutureBodyTbl decls) dtb__233))) ((v_Base_dList_dappend globals1) dtb__233))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "traits-done"))) ((v_Base_dList_dappend dtb__221) dtb__225))) ((v_Base_dList_dappend dtb__223) dtb__227))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (v_Vuna_dCompiler_dDebug_dstamp "datas-done"))) ((v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__224) (v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__224))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (v_Vuna_dCompiler_dDebug_dstamp "collectSigs-done")))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun ds -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> (v_Vuna_dCompiler_dElab_dDriver_delabProgramGo ds2))))))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__243, dtb__244, dtb__245) -> dtb__243
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoGoal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__246, dtb__247, dtb__248) -> dtb__247
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__249, dtb__250, dtb__251) -> dtb__251
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols v -> ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) (v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__252, dtb__253) -> (match dtb__252 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, dtb__255) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((v_Vuna_dCompiler_dCore_dEval_deval (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, dtb__255)), dtb__253))) 0) mc2)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) dtb__255))))), (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__253) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols g -> (C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan g), ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType g))), (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g)))))

let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))))))))
