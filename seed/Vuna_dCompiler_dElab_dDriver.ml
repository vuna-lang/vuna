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
type t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo of (t_Vuna_dCompiler_dCommon_dSpan) * (string) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList)

let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__3)) (fun p -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> (match dtb__5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, sigTy)), mc1))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__7) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__2) sigTy) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__7)))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, sigTy)), mc3)))) (((v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__7) 0) dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend mc1) (v_Base_dList_dreverse mc3)), mc2))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun sigs -> (fun globals -> (fun ec -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (v_Vuna_dCompiler_dCommon_dtblFromList globals))) true)) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__10, dtb__11, dtb__12, dtb__13) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__9) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__10) ((v_Base_dList_dappend cur) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, dtb__12)), C_Base_dList_dList_Base_dList_dNil)))) mc1))) (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__10) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14) -> dtb__14
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__9) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun decls -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) v_Vuna_dCompiler_dCommon_dtblEmpty))

let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun ec -> (fun decls -> (fun name -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup name) (v_Vuna_dCompiler_dElab_dTypes_decClausesTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> dtb__15
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun name -> (fun ec -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__17))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun defs -> ((v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (match dtb__18 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__20, dtb__21, dtb__22, dtb__23) -> (C_Base_dList_dList_Base_dList_dCons (dtb__20, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__19)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__19)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dfutureBodyTbl = (fun decls -> (fun instHeads -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, true)))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) instHeads)))) v_Vuna_dCompiler_dCommon_dtblEmpty)))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__24, dtb__25) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__26) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__27) -> (C_Base_dList_dList_Base_dList_dCons (dtb__27, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__28) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__32)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__33))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__34, dtb__35, dtb__36) -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__36)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__37, dtb__38, dtb__39) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__37)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__38))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__40, dtb__41) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs (v_Base_dPair_dfirstOf p)))) dtb__41)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__42, dtb__43) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__42)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__43))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__44) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__45) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__46) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__47, dtb__48, dtb__49) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__47)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__48)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__49)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe = (fun fuel -> (fun future -> (fun defs -> (fun defvals -> (fun self -> (fun seen -> (fun refs -> (if ((bi_le_int fuel) 0) then true else (match refs with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (if ((bi_eq_str dtb__50) self) then true else (if (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__50) defvals)) then (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe ((bi_sub fuel) 1)) future) defs) defvals) self) seen) dtb__51) else (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__50) seen) then (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe ((bi_sub fuel) 1)) future) defs) defvals) self) seen) dtb__51) else (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__50) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__52) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe ((bi_sub fuel) 1)) future) defs) defvals) self) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__50) true) seen)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__52)) dtb__51))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__50) future) then true else (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe ((bi_sub fuel) 1)) future) defs) defvals) self) seen) dtb__51))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dDriver_dmemoDefValue = (fun future -> (fun ec -> (fun name -> (fun body -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) body) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) body) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe 4096) future) (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)) name) v_Vuna_dCompiler_dCommon_dtblEmpty) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs body)) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (name, C_Base_dList_dList_Base_dList_dNil))))))))))))))

let v_Vuna_dCompiler_dElab_dDriver_dmemoizeDef = (fun future -> (fun ec -> (fun name -> (fun body -> (match ((((v_Vuna_dCompiler_dElab_dDriver_dmemoDefValue future) ec) name) body) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutDefVals ec) (((v_Vuna_dCompiler_dCommon_dtblInsert name) dtb__53) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ec
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__56, dtb__57, dtb__58, dtb__59) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__56) mc2) mc5) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__59) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__56))) dtb__56)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__56) mc5) then ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__55) mc2) mc3) mc4) mc5) else ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc2) mc5) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc5) (C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55))) dtb__56)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__60)) dtb__59)) (fun p -> ((fun _u -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62) -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> ((fun ecNext2 -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__55) mc2) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, liftedTy)), mc3))) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__56, liftedTy, cleanTerm, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59)))), mc4))) ecNext2)) ((((v_Vuna_dCompiler_dElab_dDriver_dmemoizeDef mc0) ecWithDef) dtb__56) cleanTerm))) ((v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, cleanTerm))))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__56) liftedTy) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf lifted))) ((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__56) dtb__62) dtb__60) dtb__61))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__59))) ((bi_concat "FUN ") dtb__56)))))) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__59))) ((bi_concat "DEF ") dtb__56))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__63, dtb__64, dtb__65) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__63) mc2) mc5) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__65) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__63))) dtb__63)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__55) mc2) mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__63, dtb__66, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__55) mc2) mc3) mc4) mc5)
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), mc5))))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__67 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__69, dtb__70, dtb__71, dtb__72) -> (if ((bi_eq_str dtb__69) mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__68))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__68)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__75, dtb__76, dtb__77) -> (if ((bi_eq_str dtb__75) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__74))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__74)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (match dtb__78 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> (match ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf dtb__80) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__80) mc2) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__82) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAxiomWithDefinition (dtb__80))) dtb__80) else (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__79) mc1) mc2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__80) mc2) then (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__80) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dSignatureNoDef (dtb__80))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__80, C_Base_dVec_dVec_Base_dVec_dVNil)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__79) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dSignatureNoDef (dtb__80))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__80, C_Base_dVec_dVec_Base_dVec_dVNil))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs -> (fun globals -> (fun decls -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) globals) decls))))

let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec -> (fun defs -> ((v_Base_dList_dmap (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__84), (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs)))

let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals -> (fun ec -> (fun n -> ((fun ec2 -> (if ((bi_le_int n) 0) then ec2 else (if ((bi_lt_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix globals) ec2) ((bi_sub n) 1)) else ec2))) ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun prog -> (fun expr -> (match prog with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> ((fun bodies -> ((fun ec0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__89) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match dtb__95 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, dtb__97) -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__92) (v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) sols2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedMetavarInfer ((bi_strFromInt dtb__98)))) (bi_strFromInt dtb__98))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dEval_dnormalize (v_Vuna_dCompiler_dCommon_dtblFromList bodies)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__94)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__99) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__99), tyText))))
  | dtb__100 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__100), tyText))))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dCommon_dtblFromList bodies)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__96))))) (v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__89) dtb__97) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__92, dtb__88, (v_Base_dList_dreverse bodies), dtb__85, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, dtb__90, dtb__91, C_Base_dList_dList_Base_dList_dNil, (v_Vuna_dCompiler_dCommon_dtblFromList bodies), (v_Vuna_dCompiler_dCommon_dtblFromList dtb__89), (v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__88), v_Vuna_dCompiler_dCommon_dtblEmpty, true, v_Vuna_dCompiler_dCommon_dtblEmpty, (v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__85), dtb__93)))) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__86))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog -> (fun expr -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dPair_dfirstOf p)))))))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun m -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__101) -> ((bi_eq_int dtb__101) m)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__102, dtb__103) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__104) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__105) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__109) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__110))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__111, dtb__112, dtb__113) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__113)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__114, dtb__115, dtb__116) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__114) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__115))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__117, dtb__118) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta m) dtb__118)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__119, dtb__120) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__119) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta m) dtb__120))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__121) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__122) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__123) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__124, dtb__125, dtb__126) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__124) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__125)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__126))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun m -> (fun args -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> (match dtb__127 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__129) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta m) dtb__128))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)) args)))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun m -> (fun alts -> (match alts with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__131, dtb__132) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__131)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta m) dtb__132))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun defs -> (fun m -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (match dtb__133 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__135, dtb__136) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__136) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((bi_concat dtb__135) ((bi_concat " body=") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__136))))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__134) m))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) defs)))

let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> ((bi_concat " (in `") ((bi_concat dtb__137) "`)"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTypes_ddtGoalMeta dtb__138)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__139))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (if ((bi_le_int remaining) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__140) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub remaining) 1)) stop) sols) relevant) goals)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub remaining) 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub stop) remaining))))))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub stop) i)) stop) sols) relevant) goals))))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141) -> ((fun detail -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedHole (detail))) (C_Base_dVec_dVec_Base_dVec_dVCons (detail, C_Base_dVec_dVec_Base_dVec_dVNil)))) ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan dtb__141))) ((bi_concat " with goal ") ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__141)) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType dtb__141)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun num -> ((fun hint -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedMetavar (num, hint))) (C_Base_dVec_dVec_Base_dVec_dVCons (num, (C_Base_dVec_dVec_Base_dVec_dVCons (hint, C_Base_dVec_dVec_Base_dVec_dVNil)))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dData_delabDatas ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) C_Base_dList_dList_Base_dList_dNil)) v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) v_Vuna_dCompiler_dElab_dTypes_decEmpty)) (fun pd -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__143) -> (match dtb__143 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> ((fun ec0b -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTraits ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__144) ec0b)) (fun pt -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (match dtb__147 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> (match dtb__149 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (match dtb__151 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> ((fun globals1 -> ((fun datas1 -> ((fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__150) globals1) dtb__153)) (fun pih -> (match pih with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> ((fun globals2 -> ((fun future -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__155)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> ((fun ec2b -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__156) decls)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies future) decls) dtb__156) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ec2b)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, dtb__159) -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies decls) dtb__150) datas1) dtb__156) ec3)) (fun pi -> (match pi with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__162) -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__162)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun extra -> ((fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls decls)) (fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (datas1, allDefs, (v_Vuna_dCompiler_dElab_dTypes_decGoals ec4), (v_Vuna_dCompiler_dElab_dTypes_decSols ec4), globalsOut, (v_Vuna_dCompiler_dElab_dTypes_decInsts ec4), (v_Vuna_dCompiler_dElab_dTypes_decClasses ec4), (v_Vuna_dCompiler_dElab_dTypes_decNext ec4), (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec4)))))) (v_Vuna_dCompiler_dDebug_dstamp "termination-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "extradefs-done"))) ((v_Base_dList_dmap (fun g -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup (v_Base_dPair_dfirstOf g)) defsTblOut) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf g), dtb__163))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> g
  | _ -> failwith "DT: impossible branch"
))) dtb__156))) ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun x -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName x), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType x))))) allDefs)) v_Vuna_dCompiler_dCommon_dtblEmpty))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((v_Base_dList_dappend instDefs) ((v_Base_dList_dappend extra) defs))))) ((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf dtb__156) ec4) dtb__152) ((v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDebug_dstamp "instbodies-done"))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__160))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__156) dtb__161) 8))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp ((bi_concat "bodies-done g=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength dtb__156))) ((bi_concat " sols=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decSols dtb__159)))) ((bi_concat " defs=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__159)))) ((bi_concat " metas=") ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dElab_dTypes_decNext dtb__159))) ((bi_concat " dgoals=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals dtb__159)))) ((bi_concat " datas=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__159)))) ((bi_concat " insts=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__159)))) ((bi_concat " classes=") (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__159))))))))))))))))))))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__158))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__156) dtb__159) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (v_Vuna_dCompiler_dDebug_dstamp "sigs-elab-done"))) ((v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__157) (v_Vuna_dCompiler_dCommon_dtblFromList dtb__156))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "instheads-done"))) ((v_Vuna_dCompiler_dElab_dDriver_dfutureBodyTbl decls) dtb__154))) ((v_Base_dList_dappend globals1) dtb__154))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "traits-done"))) ((v_Base_dList_dappend dtb__142) dtb__146))) ((v_Base_dList_dappend dtb__144) dtb__148))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (v_Vuna_dCompiler_dDebug_dstamp "datas-done"))) ((v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__145) (v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__145))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (v_Vuna_dCompiler_dDebug_dstamp "collectSigs-done")))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun ds -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> (v_Vuna_dCompiler_dElab_dDriver_delabProgramGo ds2))))))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__164, dtb__165, dtb__166) -> dtb__164
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoGoal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__167, dtb__168, dtb__169) -> dtb__168
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__170, dtb__171, dtb__172) -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols -> (fun v -> ((((v_Vuna_dCompiler_dCore_dEval_dforce v_Vuna_dCompiler_dCommon_dtblEmpty) (v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v)))

let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((v_Vuna_dCompiler_dCore_dEval_deval (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176)), dtb__174))) 0) mc2)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) ((bi_add mc1) 1)) dtb__176))))), (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__174) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols -> (fun g -> (C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan g), ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType g))), (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g))))))

let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))))))))
