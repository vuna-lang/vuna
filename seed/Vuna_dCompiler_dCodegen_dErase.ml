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
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
let rec v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__0, dtb__1, dtb__2) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (match dtb__3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, ((v_Base_dList_dappend dtb__5) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1, dtb__2)), C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp dtb__0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__6, dtb__7) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dErase_ddefTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__8) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__8), dtb__10)), (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__11)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11)) else ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef mc0) dtb__12))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef = (fun d -> (if (v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d) then false else true))

let rec v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__13) then (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__13), (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__14))) else (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__14))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_disTypeFormingFuel = (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__15) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> ((v_Vuna_dCompiler_dCodegen_dErase_disTypeFormingFuel ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__20) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__16, 0, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> false
))))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeForming = (fun v -> ((v_Vuna_dCompiler_dCodegen_dErase_disTypeFormingFuel 128) v))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef = (fun tbl -> (fun d -> (v_Vuna_dCompiler_dCodegen_dErase_disTypeForming ((((v_Vuna_dCompiler_dCore_dEval_dforce tbl) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__21, dtb__22) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__21) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__22) mc2) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__21), mc3))) else (if ((v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef mc0) dtb__21) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__22) mc2) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__21), mc3))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__22) (C_Base_dList_dList_Base_dList_dCons (dtb__21, mc2))) mc3)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc2), (v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs = (fun table -> (fun defs -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo (v_Vuna_dCompiler_dCommon_dtblFromList table)) defs) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix = (fun d -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))

let v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint = (fun m -> ((bi_concat " ?") (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dbinderAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__23)) else ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt ((bi_sub mc0) 1)) dtb__24))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel = (fun fuel -> (fun typeNames -> (fun binders -> (fun t -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__25, dtb__26) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unbound runtime variable ") ((bi_concat dtb__25) ((bi_concat " (index ") ((bi_concat (bi_strFromInt dtb__26)) ((bi_concat ", binders ") ((bi_concat (bi_strFromInt (v_Base_dList_dlength binders))) ")"))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__27) -> (match dtb__27 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__29) then ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__25))) dtb__25) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__26) binders))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__30) -> (if ((v_Base_dList_dmemName dtb__30) typeNames) then ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelNameRuntime (dtb__30))) dtb__30) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__31) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__37) -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__37)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__37))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__38, dtb__39, dtb__40) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__38, dtb__39)), binders))) dtb__40)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__41, dtb__42, dtb__43) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__43) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__41) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__41)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__42))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44) -> (match dtb__44 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__46)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__47, dtb__48) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__48)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__49, dtb__50) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__49)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__50)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__51) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__52) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__53) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__54, dtb__55, dtb__56) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__54)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__55)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__56)))))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (match dtb__57 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__60) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__58) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__59)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__58)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else ((fun altBinders -> ((fun env -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub mc0) 1)) mc1) env) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__61))) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__62)))) ((v_Base_dList_dappend (v_Base_dList_dreverse altBinders)) mc2))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__61)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64) -> (if ((bi_eq_str dtb__63) mc0) then (C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64)) else (C_Base_dList_dList_Base_dList_dCons (dtb__63, ((v_Vuna_dCompiler_dCodegen_dErase_daddName mc0) dtb__64))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel = (fun fuel -> (fun runtimeNames -> (fun acc -> (fun t -> (if ((bi_le_int fuel) 0) then acc else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__65) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__65) runtimeNames) then ((v_Vuna_dCompiler_dCodegen_dErase_daddName dtb__65) acc) else acc)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__66, dtb__67) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__68) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__69) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__75, dtb__76, dtb__77) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__77)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__78, dtb__79, dtb__80) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__80) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__78) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__78)) dtb__79))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81) -> (match dtb__81 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__82, dtb__83) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__83)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__84, dtb__85) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__85)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__86, dtb__87) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__86)) dtb__87)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__88) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__89) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__90) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__91, dtb__92, dtb__93) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__91)) dtb__92)) dtb__93)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, dtb__97) -> (if ((bi_le_int mc0) 0) then mc2 else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__97) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__95) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub mc0) 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__96)) dtb__95)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__98, dtb__99) -> (if ((bi_le_int mc0) 0) then mc2 else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel ((bi_sub mc0) 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub mc0) 1)) mc1) mc2) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__98))) dtb__99))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__100), (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf dtb__101)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef = (fun defs -> (fun name -> ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs)))

let v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf = (fun adjT -> (fun name -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup name) adjT) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102) -> dtb__102
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddDependents = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> ((fun cur -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents mc0) dtb__104) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__103) (C_Base_dList_dList_Base_dList_dCons (mc0, cur))) mc2))) (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__103) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__105) -> dtb__105
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (match dtb__106 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__108, dtb__109) -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents dtb__108) dtb__109) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl dtb__107))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> v_Vuna_dCompiler_dCommon_dtblEmpty
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf = (fun adj -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll adj) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel = (fun fuel -> (fun adjT -> (fun ms -> (fun visited -> (fun order -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, order)) else (match ms with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__110) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel ((bi_sub fuel) 1)) adjT) dtb__111) visited) order) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel ((bi_sub fuel) 1)) adjT) dtb__110) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__110) true) visited)) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, dtb__113) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel ((bi_sub fuel) 1)) adjT) dtb__111) dtb__112) dtb__113)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel = (fun fuel -> (fun adjT -> (fun n -> (fun visited -> (fun order -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, order)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel ((bi_sub fuel) 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, dtb__115) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, (C_Base_dList_dList_Base_dList_dCons (n, dtb__115))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost = (fun adjT -> (fun ms -> (fun visited -> (fun order -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel 100000) adjT) ms) visited) order)))))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsPost = (fun adjT -> (fun n -> (fun visited -> (fun order -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel 100000) adjT) n) visited) order)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpostOrder = (fun adjT -> (fun nodes -> (fun visited -> (fun order -> (match nodes with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | C_Base_dList_dList_Base_dList_dCons (dtb__116, dtb__117) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__116) visited) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) dtb__117) visited) order) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPost adjT) dtb__116) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__116) true) visited)) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__118, dtb__119) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) dtb__117) dtb__118) dtb__119)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel = (fun fuel -> (fun adjT -> (fun ms -> (fun visited -> (fun comp -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, comp)) else (match ms with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, comp))
  | C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__120) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel ((bi_sub fuel) 1)) adjT) dtb__121) visited) comp) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel ((bi_sub fuel) 1)) adjT) dtb__120) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__120) true) visited)) comp) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__122, dtb__123) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel ((bi_sub fuel) 1)) adjT) dtb__121) dtb__122) dtb__123)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel = (fun fuel -> (fun adjT -> (fun n -> (fun visited -> (fun comp -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, comp)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel ((bi_sub fuel) 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) comp) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, (C_Base_dList_dList_Base_dList_dCons (n, dtb__125))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect = (fun adjT -> (fun ms -> (fun visited -> (fun comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel 100000) adjT) ms) visited) comp)))))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect = (fun adjT -> (fun n -> (fun visited -> (fun comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel 100000) adjT) n) visited) comp)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcollectComps = (fun adjT -> (fun nodes -> (fun visited -> (fun comps -> (match nodes with
  | C_Base_dList_dList_Base_dList_dNil -> comps
  | C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__126) visited) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps adjT) dtb__127) visited) comps) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect adjT) dtb__126) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__126) true) visited)) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps adjT) dtb__127) dtb__128) (C_Base_dList_dList_Base_dList_dCons (dtb__129, comps)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf = (fun comps -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dconcatMap (fun g -> ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, g)))) g))) comps)) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddAllNames = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__131) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__130) true) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfilterNames = (fun pred -> (fun names -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> (if (pred dtb__132) then (C_Base_dList_dList_Base_dList_dCons (dtb__132, ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames pred) dtb__133))) else ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames pred) dtb__133))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupOf = (fun allNames -> (fun g -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> (match dtb__135 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__134, C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((v_Vuna_dCompiler_dCommon_dtblMem m) (v_Vuna_dCompiler_dCommon_dtblOfNames g)))) allNames)
)
  | _ -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((v_Vuna_dCompiler_dCommon_dtblMem m) (v_Vuna_dCompiler_dCommon_dtblOfNames g)))) allNames)
)) g)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__136) mc3) then ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__137) mc3) else (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__136) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCodegen_dErase_dgroupOf mc1) dtb__138), ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__137) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__138) mc3))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__137) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps = (fun comps -> (fun names -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo (v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf comps)) names) names) v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCodegen_dErase_dnotIn = (fun name -> (fun names -> (if ((v_Base_dList_dmemName name) names) then false else true)))

let rec v_Vuna_dCompiler_dCodegen_dErase_duniqueNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (if ((bi_eq_str dtb__139) "") then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__140) else (if ((v_Base_dList_dmemName dtb__139) dtb__140) then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__140) else (C_Base_dList_dList_Base_dList_dCons (dtb__139, (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__140)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps = (fun adjT -> (fun group -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCodegen_dErase_dnotIn n) group))) (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT)) group)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dallIn = (fun names -> (fun allowed -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | C_Base_dList_dList_Base_dList_dCons (dtb__141, dtb__142) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__141) allowed) then ((v_Vuna_dCompiler_dCodegen_dErase_dallIn dtb__142) allowed) else false)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupReady = (fun adjT -> (fun group -> (fun emitted -> ((v_Vuna_dCompiler_dCodegen_dErase_dallIn ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps adjT) group)) emitted))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__143, dtb__144) -> (if (((v_Vuna_dCompiler_dCodegen_dErase_dgroupReady mc0) dtb__143) mc3) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, ((v_Base_dList_dappend (v_Base_dList_dreverse mc2)) dtb__144))))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc mc0) dtb__144) (C_Base_dList_dList_Base_dList_dCons (dtb__143, mc2))) mc3))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dpickReady = (fun adjT -> (fun groups -> (fun emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc adjT) groups) C_Base_dList_dList_Base_dList_dNil) emitted))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel = (fun fuel -> (fun adjT -> (fun remaining -> (fun emitted -> (if ((bi_le_int fuel) 0) then (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle) else (match remaining with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__145) -> (match dtb__145 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel ((bi_sub fuel) 1)) adjT) dtb__147) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__146) emitted))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__146, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dErase_dpickReady adjT) remaining) emitted))
))))))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc = (fun adjT -> (fun remaining -> (fun emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel ((bi_add (v_Base_dList_dlength remaining)) 1)) adjT) remaining) emitted))))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroups = (fun adjT -> (fun groups -> (((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc adjT) groups) v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf = (fun defs -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), d)))) defs)) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__148) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__149)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (C_Base_dList_dList_Base_dList_dCons (dtb__150, ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__149)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__151) mc2) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: OCaml name collision among ") ((bi_concat mc0) ((bi_concat "s: `") ((bi_concat dtb__151) "`")))))) else (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo mc0) dtb__152) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__151) true) mc2)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames = (fun kind -> (fun names -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo kind) names) v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames = (fun datas -> (fun defs -> ((fun runtime -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__153, dtb__154) -> (if ((bi_ge_int dtb__154) 0) then (if ((bi_lt_int dtb__154) depth) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: out-of-scope de Bruijn index ") ((bi_concat (bi_strFromInt dtb__154)) ((bi_concat " (depth ") ((bi_concat (bi_strFromInt depth)) ")"))))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: negative de Bruijn index ") (bi_strFromInt dtb__154)))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__155) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__156) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__157) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__158) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__159) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__160) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__161, dtb__162, dtb__163) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__163) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__161) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__161)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__162))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__164, dtb__165) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs depth) dtb__165)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__166, dtb__167, dtb__168) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add depth) 1)) dtb__168)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__172)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add depth) 1)) dtb__173)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__174, dtb__175, dtb__176) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__174)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__175)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__176)))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__177, dtb__178) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__177)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes depth) dtb__178)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (match dtb__179 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, dtb__182) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__182) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__180) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__181)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__180))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__183, dtb__184) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__183)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__183))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__184)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__185, dtb__186) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__185) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__186)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes 0) dtb__187) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__188) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix dtb__185)) dtb__188)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__189) -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__186)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel 100000) a1) a2) a3))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__190) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__191)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto mc0) C_Base_dList_dList_Base_dList_dNil) dtb__192) with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__191)
  | C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__194) -> ((((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__190)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__190)) (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dAxiomAtRuntime (dtb__193))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__193, C_Base_dVec_dVec_Base_dVec_dVNil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime = (fun axiomNames -> (fun defs -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo (v_Vuna_dCompiler_dCommon_dtblOfNames axiomNames)) defs)))

let v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency = (fun defs -> ((fun names -> ((v_Base_dList_dmap (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto names) C_Base_dList_dList_Base_dList_dNil) dtb__195)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))) defs)) (v_Vuna_dCompiler_dCommon_dtblOfNames (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun defsTbl -> ((fun adj -> ((fun adjT -> ((fun revT -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) names) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> ((fun comps -> ((fun groups -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dorderGroups adjT) groups)) (fun ordered -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf defsTbl)) ordered)))))) ((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revT) dtb__197) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl adj))) (v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf adj))) (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency defs))) (v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf defs))) (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel 100000) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel 100000) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure = (fun typeNames -> (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: axiom reached the runtime erasure check (partition must erase it)"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__198) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) C_Base_dList_dList_Base_dList_dNil) dtb__198) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__199) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix d)) dtb__199)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__200) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__200))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__201, dtb__202) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure mc0) dtb__201)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure mc0) dtb__202)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel 512) a1) a2) a3))))
