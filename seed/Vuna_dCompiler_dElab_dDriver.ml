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
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__3)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> (match dtb__5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, sigTy)), mc1))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__7) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__2) sigTy) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__7)))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, sigTy)), mc3)))) (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas dtb__7) 0) dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
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

let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match dtb__17 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__19, dtb__20, dtb__21, dtb__22) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__19) mc1) mc4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__22) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dExpectedSignature (dtb__19))) dtb__19)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__23) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__19) mc4) then (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__18) mc1) mc2) mc3) mc4) else ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc1) mc4) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc4) (C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18))) dtb__19)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__23)) dtb__22)) (fun p -> ((fun _u -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__24, dtb__25) -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__18) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, liftedTy)), mc2))) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__19, liftedTy, cleanTerm)), mc3))) ((v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, cleanTerm))))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__19) liftedTy) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf lifted))) ((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__19) dtb__25) dtb__23) dtb__24))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__22))) ((bi_concat "FUN ") dtb__19)))))) ((v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine dtb__22))) ((bi_concat "DEF ") dtb__19))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__18) mc1) mc2) mc3) mc4)
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), mc4))))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__28, dtb__29, dtb__30, dtb__31) -> (if ((bi_eq_str dtb__28) mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__27))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__27)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__32 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__34) mc2) then (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__34) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dSignatureNoDef (dtb__34))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__34, C_Base_dVec_dVec_Base_dVec_dVNil)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined dtb__33) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dSignatureNoDef (dtb__34))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__34, C_Base_dVec_dVec_Base_dVec_dVNil))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec -> (fun defs -> ((v_Base_dList_dmap (fun d -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)))))) defs)))

let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals -> (fun ec -> (fun n -> ((fun ec2 -> (if ((bi_le_int n) 0) then ec2 else (if ((bi_lt_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix globals) ec2) ((bi_sub n) 1)) else ec2))) ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog -> (fun expr -> (match prog with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> ((fun ec0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__41) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> (match dtb__46 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__47, dtb__48) -> ((fun ec2 -> ((fun sols2 -> (match (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__44) (v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) sols2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49) -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnsolvedMetavarInfer ((bi_strFromInt dtb__49)))) (bi_strFromInt dtb__49))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dEval_dnormalize (v_Vuna_dCompiler_dCommon_dtblFromList ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))))) dtb__38))) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__45)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__50) -> (C_Base_dResult_dResult_Base_dResult_dOk ((bi_strFromInt dtb__50)))
  | dtb__51 -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__51)))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__41) dtb__48) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__44, dtb__40, (v_Base_dList_dreverse ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))))) dtb__38)), dtb__37, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, dtb__42, dtb__43, C_Base_dList_dList_Base_dList_dNil, (v_Vuna_dCompiler_dCommon_dtblFromList ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))))) dtb__38)), (v_Vuna_dCompiler_dCommon_dtblFromList dtb__41), (v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__40), v_Vuna_dCompiler_dCommon_dtblEmpty, true, v_Vuna_dCompiler_dCommon_dtblEmpty)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun m -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__52) -> ((bi_eq_int dtb__52) m)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__53, dtb__54) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__55) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__56) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__60) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__61))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__62, dtb__63, dtb__64) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__64)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__65, dtb__66, dtb__67) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__65) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__66))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__68, dtb__69) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta m) dtb__69)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__70, dtb__71) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__70) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta m) dtb__71))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__72) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__73) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__74) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__75, dtb__76, dtb__77) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__75) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__76)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__77))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun m -> (fun args -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (match dtb__78 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__80) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta m) dtb__79))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun m -> (fun alts -> (match alts with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__82)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta m) dtb__83))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun defs -> (fun m -> (match defs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__84, dtb__85) -> (match dtb__84 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta m) dtb__87) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((bi_concat dtb__86) ((bi_concat " body=") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__87))))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__85) m))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__88) -> ((bi_concat " (in `") ((bi_concat dtb__88) "`)"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTypes_ddtGoalMeta dtb__89)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__90))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (if ((bi_le_int remaining) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub remaining) 1)) stop) sols) relevant) goals)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub remaining) 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub stop) remaining))))))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo ((bi_sub stop) i)) stop) sols) relevant) goals))))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> ((fun detail -> ((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnsolvedHole (detail))) (C_Base_dVec_dVec_Base_dVec_dVCons (detail, C_Base_dVec_dVec_Base_dVec_dVNil)))) ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan dtb__92))) ((bi_concat " with goal ") ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__92)) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType dtb__92)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun num -> ((fun hint -> ((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnsolvedMetavar (num, hint))) (C_Base_dVec_dVec_Base_dVec_dVCons (num, (C_Base_dVec_dVec_Base_dVec_dVCons (hint, C_Base_dVec_dVec_Base_dVec_dVNil)))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dData_delabDatas ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) C_Base_dList_dList_Base_dList_dNil)) v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) v_Vuna_dCompiler_dElab_dTypes_decEmpty)) (fun pd -> (match pd with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> (match dtb__94 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTraits ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__95) dtb__96)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> (match dtb__98 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (match dtb__100 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> ((fun globals1 -> ((fun datas1 -> ((fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__101) globals1) dtb__102)) (fun pih -> (match pih with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> ((fun globals2 -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__104)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((fun ec2b -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__105) decls)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies decls) dtb__105) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ec2b)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) C_Base_dList_dList_Base_dList_dNil)) dtb__101) datas1) dtb__105) ec3)) (fun pi -> (match pi with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__111) -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__111)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun extra -> ((fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls decls)) (fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (datas1, allDefs, (v_Vuna_dCompiler_dElab_dTypes_decGoals ec4), (v_Vuna_dCompiler_dElab_dTypes_decSols ec4), globalsOut, (v_Vuna_dCompiler_dElab_dTypes_decInsts ec4), (v_Vuna_dCompiler_dElab_dTypes_decClasses ec4), (v_Vuna_dCompiler_dElab_dTypes_decNext ec4)))))) (v_Vuna_dCompiler_dDebug_dstamp "termination-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "extradefs-done"))) ((v_Base_dList_dmap (fun g -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup (v_Base_dPair_dfirstOf g)) defsTblOut) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf g), dtb__112))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> g
  | _ -> failwith "DT: impossible branch"
))) dtb__105))) ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun x -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName x), (v_Vuna_dCompiler_dElab_dTypes_ddtDefType x))))) allDefs)) v_Vuna_dCompiler_dCommon_dtblEmpty))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((v_Base_dList_dappend instDefs) ((v_Base_dList_dappend extra) defs))))) (((v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf dtb__105) ec4) ((v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDebug_dstamp "instbodies-done"))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__109))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__105) dtb__110) 8))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp ((bi_concat "bodies-done g=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength dtb__105))) ((bi_concat " sols=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decSols dtb__108)))) ((bi_concat " defs=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__108)))) ((bi_concat " metas=") ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dElab_dTypes_decNext dtb__108))) ((bi_concat " dgoals=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDictGoals dtb__108)))) ((bi_concat " datas=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__108)))) ((bi_concat " insts=") ((bi_concat (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__108)))) ((bi_concat " classes=") (bi_strFromInt (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__108))))))))))))))))))))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__107))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__105) dtb__108) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (v_Vuna_dCompiler_dDebug_dstamp "sigs-elab-done"))) ((v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__106) (v_Vuna_dCompiler_dCommon_dtblFromList dtb__105))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "instheads-done"))) ((v_Base_dList_dappend globals1) dtb__103))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "traits-done"))) ((v_Base_dList_dappend dtb__93) dtb__97))) ((v_Base_dList_dappend dtb__95) dtb__99))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "datas-done"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "collectSigs-done")))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun ds -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> (v_Vuna_dCompiler_dElab_dDriver_delabProgramGo ds2))))))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__113, dtb__114, dtb__115) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoGoal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__116, dtb__117, dtb__118) -> dtb__117
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtGoalInfoCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo (dtb__119, dtb__120, dtb__121) -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols -> (fun v -> ((((v_Vuna_dCompiler_dCore_dEval_dforce v_Vuna_dCompiler_dCommon_dtblEmpty) (v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v)))

let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__122, dtb__123) -> (match dtb__122 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((v_Vuna_dCompiler_dCore_dEval_deval (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125)), dtb__123))) 0) mc2)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) ((bi_add mc1) 1)) dtb__125))))), (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__123) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols -> (fun g -> (C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan g), ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (v_Vuna_dCompiler_dElab_dTypes_ddtGoalType g))), (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx g))))))

let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))))))))
