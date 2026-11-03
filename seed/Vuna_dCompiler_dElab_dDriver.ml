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

let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (match dtb__18 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__20, dtb__21, dtb__22, dtb__23) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__20) mc1) mc4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__23) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dExpectedSignature (dtb__20))) dtb__20)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__20) mc4) then (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__19) mc1) mc2) mc3) mc4) else ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc1) mc4) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc4) (C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19))) dtb__20)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__24)) dtb__23)) (fun p -> ((fun _u -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__19) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, liftedTy)), mc2))) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__20, liftedTy, cleanTerm)), mc3))) ((v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, cleanTerm))))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__20) liftedTy) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf lifted))) ((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__20) dtb__26) dtb__24) dtb__25))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__23))) ((bi_concat "FUN ") dtb__20)))))) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__23))) ((bi_concat "DEF ") dtb__20))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__27, dtb__28, dtb__29) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__27) mc1) mc4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__29) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dExpectedSignature (dtb__27))) dtb__27)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__30) -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__19) mc1) mc2) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__27, dtb__30)), mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__19) mc1) mc2) mc3) mc4)
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), mc4))))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__33, dtb__34, dtb__35, dtb__36) -> (if ((bi_eq_str dtb__33) mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__32))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__32)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (match dtb__37 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__39, dtb__40, dtb__41) -> (if ((bi_eq_str dtb__39) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__38))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__38)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (match dtb__42 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, dtb__45) -> (match ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf dtb__44) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__46) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__44) mc2) then (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__46) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dAxiomWithDefinition (dtb__44))) dtb__44) else (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__43) mc1) mc2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__44) mc2) then (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__44) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dSignatureNoDef (dtb__44))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__44, C_Base_dVec_dVec_Base_dVec_dVNil)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__47) -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__43) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dSignatureNoDef (dtb__44))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__44, C_Base_dVec_dVec_Base_dVec_dVNil))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs -> (fun globals -> (fun decls -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) globals) decls))))

let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec -> (fun defs -> ((v_Base_dList_dmap (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__48)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs)))

let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals -> (fun ec -> (fun n -> ((fun ec2 -> (if ((bi_le_int n) 0) then ec2 else (if ((bi_lt_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix globals) ec2) ((bi_sub n) 1)) else ec2))) ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog -> (fun expr -> (match prog with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> ((fun bodies -> ((fun ec0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__53) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (match dtb__58 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> ((fun ec2 -> ((fun sols2 -> (match (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__56) (v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) sols2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__61) -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnsolvedMetavarInfer ((bi_strFromInt dtb__61)))) (bi_strFromInt dtb__61))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dEval_dnormalize (v_Vuna_dCompiler_dCommon_dtblFromList bodies)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__57)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__62) -> (C_Base_dResult_dResult_Base_dResult_dOk ((bi_strFromInt dtb__62)))
  | dtb__63 -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__63)))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__53) dtb__60) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__56, dtb__52, (v_Base_dList_dreverse bodies), dtb__49, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, dtb__54, dtb__55, C_Base_dList_dList_Base_dList_dNil, (v_Vuna_dCompiler_dCommon_dtblFromList bodies), (v_Vuna_dCompiler_dCommon_dtblFromList dtb__53), (v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__52), v_Vuna_dCompiler_dCommon_dtblEmpty, true, v_Vuna_dCompiler_dCommon_dtblEmpty)))) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__50))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun m -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__64) -> ((bi_eq_int dtb__64) m)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__65, dtb__66) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__67) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__68) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__72) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__73))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__74, dtb__75, dtb__76) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__76)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__77, dtb__78, dtb__79) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__77) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__78))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__80, dtb__81) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta m) dtb__81)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__82, dtb__83) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__82) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta m) dtb__83))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__84) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__85) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__86) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__87, dtb__88, dtb__89) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__87) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__88)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__89))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun m -> (fun args -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (match dtb__90 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__92) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta m) dtb__91))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)) args)))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun m -> (fun alts -> (match alts with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__94)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta m) dtb__95))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun defs -> (fun m -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (match dtb__96 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__99) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((bi_concat dtb__98) ((bi_concat " body=") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__99))))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__97) m))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) defs)))

let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__100) -> ((bi_concat " (in `") ((bi_concat dtb__100) "`)"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTypes_ddtGoalMeta dtb__101)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__101)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__102))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (if ((bi_le_int remaining) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__103) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub remaining) 1)) stop) sols) relevant) goals)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub remaining) 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub stop) remaining))))))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub stop) i)) stop) sols) relevant) goals))))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__104) -> ((fun detail -> ((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnsolvedHole (detail))) (C_Base_dVec_dVec_Base_dVec_dVCons (detail, C_Base_dVec_dVec_Base_dVec_dVNil)))) ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan dtb__104))) ((bi_concat " with goal ") ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__104)) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType dtb__104)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun num -> ((fun hint -> ((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnsolvedMetavar (num, hint))) (C_Base_dVec_dVec_Base_dVec_dVCons (num, (C_Base_dVec_dVec_Base_dVec_dVCons (hint, C_Base_dVec_dVec_Base_dVec_dVNil)))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dData_delabDatas ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) C_Base_dList_dList_Base_dList_dNil)) v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) v_Vuna_dCompiler_dElab_dTypes_decEmpty)) (fun pd -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (match dtb__106 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTraits ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__107) dtb__108)) (fun pt -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (match dtb__112 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> ((fun globals1 -> ((fun datas1 -> ((fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__113) globals1) dtb__114)) (fun pih -> (match pih with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> ((fun globals2 -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__116)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> ((fun ec2b -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__117) decls)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies decls) dtb__117) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ec2b)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__113) datas1) dtb__117) ec3)) (fun pi -> (match pi with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__123)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun extra -> ((fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls decls)) (fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (datas1, allDefs, (v_Vuna_dCompiler_dElab_dTypes_decGoals ec4), (v_Vuna_dCompiler_dElab_dTypes_decSols ec4), globalsOut, (v_Vuna_dCompiler_dElab_dTypes_decInsts ec4), (v_Vuna_dCompiler_dElab_dTypes_decClasses ec4), (v_Vuna_dCompiler_dElab_dTypes_decNext ec4)))))) (v_Vuna_dCompiler_dDebug_dstamp "termination-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "extradefs-done"))) ((v_Base_dList_dmap (fun g -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup (v_Base_dPair_dfirstOf g)) defsTblOut) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__124) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf g), dtb__124))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> g
  | _ -> failwith "DT: impossible branch"
))) dtb__117))) ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun x -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName x), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType x))))) allDefs)) v_Vuna_dCompiler_dCommon_dtblEmpty))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((v_Base_dList_dappend instDefs) ((v_Base_dList_dappend extra) defs))))) (((v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf dtb__117) ec4) ((v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDebug_dstamp "instbodies-done"))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__121))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__117) dtb__122) 8))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp ((bi_concat "bodies-done g=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength dtb__117))) ((bi_concat " sols=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decSols dtb__120)))) ((bi_concat " defs=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__120)))) ((bi_concat " metas=") ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dElab_dTypes_decNext dtb__120))) ((bi_concat " dgoals=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals dtb__120)))) ((bi_concat " datas=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__120)))) ((bi_concat " insts=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__120)))) ((bi_concat " classes=") (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__120))))))))))))))))))))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__119))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__117) dtb__120) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (v_Vuna_dCompiler_dDebug_dstamp "sigs-elab-done"))) ((v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__118) (v_Vuna_dCompiler_dCommon_dtblFromList dtb__117))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "instheads-done"))) ((v_Base_dList_dappend globals1) dtb__115))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "traits-done"))) ((v_Base_dList_dappend dtb__105) dtb__109))) ((v_Base_dList_dappend dtb__107) dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (v_Vuna_dCompiler_dDebug_dstamp "datas-done"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (v_Vuna_dCompiler_dDebug_dstamp "collectSigs-done")))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun ds -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> (v_Vuna_dCompiler_dElab_dDriver_delabProgramGo ds2))))))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__125, dtb__126, dtb__127) -> dtb__125
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoGoal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__128, dtb__129, dtb__130) -> dtb__129
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__131, dtb__132, dtb__133) -> dtb__133
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols -> (fun v -> ((((v_Vuna_dCompiler_dCore_dEval_dforce v_Vuna_dCompiler_dCommon_dtblEmpty) (v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v)))

let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> (match dtb__134 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((v_Vuna_dCompiler_dCore_dEval_deval (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137)), dtb__135))) 0) mc2)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) ((bi_add mc1) 1)) dtb__137))))), (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__135) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols -> (fun g -> (C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan g), ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType g))), (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g))))))

let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))))))))
