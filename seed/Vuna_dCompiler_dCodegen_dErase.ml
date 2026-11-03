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
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
let rec v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__0, dtb__1, dtb__2) -> (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp dtb__0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (match dtb__3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, ((v_Base_dList_dappend dtb__5) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1, dtb__2)), C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__6, dtb__7) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dErase_ddefTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__8), (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__8))), (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__10)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10)) else ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef mc0) dtb__11))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_disTypeFormingFuel = (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__12) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dCodegen_dErase_disTypeFormingFuel ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__17) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, 0, C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> false
))))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeForming = (fun v -> ((v_Vuna_dCompiler_dCodegen_dErase_disTypeFormingFuel 128) v))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef = (fun tbl -> (fun d -> (v_Vuna_dCompiler_dCodegen_dErase_disTypeForming ((((v_Vuna_dCompiler_dCore_dEval_dforce tbl) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (if ((v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef mc0) dtb__18) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__19) mc2) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__18), mc3))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__19) (C_Base_dList_dList_Base_dList_dCons (dtb__18, mc2))) mc3))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc2), (v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs = (fun table -> (fun defs -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo (v_Vuna_dCompiler_dCommon_dtblFromList table)) defs) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint = (fun m -> ((bi_concat " ?") (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dbinderAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20)) else ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt ((bi_sub mc0) 1)) dtb__21))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel = (fun fuel -> (fun typeNames -> (fun binders -> (fun t -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__22, dtb__23) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__23) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (match dtb__24 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__26) then ((v_Vuna_dCompiler_dDiagnostics_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dTypeLevelBindingRuntime (dtb__22))) dtb__22) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unbound runtime variable ") ((bi_concat dtb__22) ((bi_concat " (index ") ((bi_concat (bi_strFromInt dtb__23)) ((bi_concat ", binders ") ((bi_concat (bi_strFromInt (v_Base_dList_dlength binders))) ")"))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__27) -> (if ((v_Base_dList_dmemName dtb__27) typeNames) then ((v_Vuna_dCompiler_dDiagnostics_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dTypeLevelNameRuntime (dtb__27))) dtb__27) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__28) -> (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__34) -> ((v_Vuna_dCompiler_dDiagnostics_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dUnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__34)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__35, dtb__36, dtb__37) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36)), binders))) dtb__37)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__38, dtb__39, dtb__40) -> (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> (match dtb__41 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__43)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__40) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__38) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__38)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__39))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__44, dtb__45) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__45)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__46, dtb__47) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__46)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__47)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__48) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__49) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__50) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__51, dtb__52, dtb__53) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__51)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__52)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub fuel) 1)) typeNames) binders) dtb__53)))))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__57) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__55) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__56)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__55)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else ((fun altBinders -> ((fun env -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel ((bi_sub mc0) 1)) mc1) env) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__58))) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__59)))) ((v_Base_dList_dappend (v_Base_dList_dreverse altBinders)) mc2))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__58)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (if ((bi_eq_str dtb__60) mc0) then (C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61)) else (C_Base_dList_dList_Base_dList_dCons (dtb__60, ((v_Vuna_dCompiler_dCodegen_dErase_daddName mc0) dtb__61))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel = (fun fuel -> (fun runtimeNames -> (fun acc -> (fun t -> (if ((bi_le_int fuel) 0) then acc else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__62) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__62) runtimeNames) then ((v_Vuna_dCompiler_dCodegen_dErase_daddName dtb__62) acc) else acc)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__63, dtb__64) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__65) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__66) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__72, dtb__73, dtb__74) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__74)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__75, dtb__76, dtb__77) -> (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78) -> (match dtb__78 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__80)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__77) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__75) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__75)) dtb__76))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__81, dtb__82) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__82)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__83, dtb__84) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__83)) dtb__84)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__85) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__86) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__87) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__88, dtb__89, dtb__90) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub fuel) 1)) runtimeNames) acc) dtb__88)) dtb__89)) dtb__90)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> (match dtb__91 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> (if ((bi_le_int mc0) 0) then mc2 else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__94) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__92) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel ((bi_sub mc0) 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__93)) dtb__92)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (if ((bi_le_int mc0) 0) then mc2 else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel ((bi_sub mc0) 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel ((bi_sub mc0) 1)) mc1) mc2) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__95))) dtb__96))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__97), (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf dtb__98)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef = (fun defs -> (fun name -> ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs)))

let v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf = (fun adjT -> (fun name -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup name) adjT) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99) -> dtb__99
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddDependents = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> ((fun cur -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents mc0) dtb__101) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__100) (C_Base_dList_dList_Base_dList_dCons (mc0, cur))) mc2))) (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__100) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102) -> dtb__102
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__103 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents dtb__105) dtb__106) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> v_Vuna_dCompiler_dCommon_dtblEmpty
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf = (fun adj -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll adj) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel = (fun fuel -> (fun adjT -> (fun ms -> (fun visited -> (fun order -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, order)) else (match ms with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__107) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel ((bi_sub fuel) 1)) adjT) dtb__108) visited) order) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel ((bi_sub fuel) 1)) adjT) dtb__107) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__107) true) visited)) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel ((bi_sub fuel) 1)) adjT) dtb__108) dtb__109) dtb__110)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel = (fun fuel -> (fun adjT -> (fun n -> (fun visited -> (fun order -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, order)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel ((bi_sub fuel) 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, (C_Base_dList_dList_Base_dList_dCons (n, dtb__112))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost = (fun adjT -> (fun ms -> (fun visited -> (fun order -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel 100000) adjT) ms) visited) order)))))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsPost = (fun adjT -> (fun n -> (fun visited -> (fun order -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel 100000) adjT) n) visited) order)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpostOrder = (fun adjT -> (fun nodes -> (fun visited -> (fun order -> (match nodes with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__113) visited) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) dtb__114) visited) order) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPost adjT) dtb__113) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__113) true) visited)) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) dtb__114) dtb__115) dtb__116)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel = (fun fuel -> (fun adjT -> (fun ms -> (fun visited -> (fun comp -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, comp)) else (match ms with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, comp))
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__117) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel ((bi_sub fuel) 1)) adjT) dtb__118) visited) comp) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel ((bi_sub fuel) 1)) adjT) dtb__117) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__117) true) visited)) comp) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel ((bi_sub fuel) 1)) adjT) dtb__118) dtb__119) dtb__120)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel = (fun fuel -> (fun adjT -> (fun n -> (fun visited -> (fun comp -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, comp)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel ((bi_sub fuel) 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) comp) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, (C_Base_dList_dList_Base_dList_dCons (n, dtb__122))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect = (fun adjT -> (fun ms -> (fun visited -> (fun comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel 100000) adjT) ms) visited) comp)))))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect = (fun adjT -> (fun n -> (fun visited -> (fun comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel 100000) adjT) n) visited) comp)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcollectComps = (fun adjT -> (fun nodes -> (fun visited -> (fun comps -> (match nodes with
  | C_Base_dList_dList_Base_dList_dNil -> comps
  | C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__124) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__123) visited) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps adjT) dtb__124) visited) comps) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect adjT) dtb__123) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__123) true) visited)) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps adjT) dtb__124) dtb__125) (C_Base_dList_dList_Base_dList_dCons (dtb__126, comps)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf = (fun comps -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dconcatMap (fun g -> ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, g)))) g))) comps)) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddAllNames = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__128) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__127) true) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfilterNames = (fun pred -> (fun names -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__129, dtb__130) -> (if (pred dtb__129) then (C_Base_dList_dList_Base_dList_dCons (dtb__129, ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames pred) dtb__130))) else ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames pred) dtb__130))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupOf = (fun allNames -> (fun g -> (match g with
  | C_Base_dList_dList_Base_dList_dCons (dtb__131, dtb__132) -> (match dtb__132 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__131, C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((v_Vuna_dCompiler_dCommon_dtblMem m) (v_Vuna_dCompiler_dCommon_dtblOfNames g)))) allNames)
)
  | _ -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((v_Vuna_dCompiler_dCommon_dtblMem m) (v_Vuna_dCompiler_dCommon_dtblOfNames g)))) allNames)
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__133) mc3) then ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__134) mc3) else (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__133) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCodegen_dErase_dgroupOf mc1) dtb__135), ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__134) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__135) mc3))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__134) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps = (fun comps -> (fun names -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo (v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf comps)) names) names) v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCodegen_dErase_dnotIn = (fun name -> (fun names -> (if ((v_Base_dList_dmemName name) names) then false else true)))

let rec v_Vuna_dCompiler_dCodegen_dErase_duniqueNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (if ((bi_eq_str dtb__136) "") then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__137) else (if ((v_Base_dList_dmemName dtb__136) dtb__137) then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__137) else (C_Base_dList_dList_Base_dList_dCons (dtb__136, (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__137)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps = (fun adjT -> (fun group -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCodegen_dErase_dnotIn n) group))) (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT)) group)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dallIn = (fun names -> (fun allowed -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__138) allowed) then ((v_Vuna_dCompiler_dCodegen_dErase_dallIn dtb__139) allowed) else false)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupReady = (fun adjT -> (fun group -> (fun emitted -> ((v_Vuna_dCompiler_dCodegen_dErase_dallIn ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps adjT) group)) emitted))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__140, dtb__141) -> (if (((v_Vuna_dCompiler_dCodegen_dErase_dgroupReady mc0) dtb__140) mc3) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, ((v_Base_dList_dappend (v_Base_dList_dreverse mc2)) dtb__141))))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc mc0) dtb__141) (C_Base_dList_dList_Base_dList_dCons (dtb__140, mc2))) mc3))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dpickReady = (fun adjT -> (fun groups -> (fun emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc adjT) groups) C_Base_dList_dList_Base_dList_dNil) emitted))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel = (fun fuel -> (fun adjT -> (fun remaining -> (fun emitted -> (if ((bi_le_int fuel) 0) then (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dDependencyCycle) else (match remaining with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dpickReady adjT) remaining) emitted) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dDependencyCycle)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142) -> (match dtb__142 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel ((bi_sub fuel) 1)) adjT) dtb__144) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__143) emitted))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__143, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
))))))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc = (fun adjT -> (fun remaining -> (fun emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel ((bi_add (v_Base_dList_dlength remaining)) 1)) adjT) remaining) emitted))))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroups = (fun adjT -> (fun groups -> (((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc adjT) groups) v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf = (fun defs -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), d)))) defs)) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146) -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__145) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__146)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__147) -> (C_Base_dList_dList_Base_dList_dCons (dtb__147, ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__146)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__148) mc2) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: OCaml name collision among ") ((bi_concat mc0) ((bi_concat "s: `") ((bi_concat dtb__148) "`")))))) else (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo mc0) dtb__149) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__148) true) mc2)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames = (fun kind -> (fun names -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo kind) names) v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames = (fun datas -> (fun defs -> ((fun runtime -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__150, dtb__151) -> (if ((bi_ge_int dtb__151) 0) then (if ((bi_lt_int dtb__151) depth) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: out-of-scope de Bruijn index ") ((bi_concat (bi_strFromInt dtb__151)) ((bi_concat " (depth ") ((bi_concat (bi_strFromInt depth)) ")"))))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: negative de Bruijn index ") (bi_strFromInt dtb__151)))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__152) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__153) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__154) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__155) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__156) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__157) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__158, dtb__159, dtb__160) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__160) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__158) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__158)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__159))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__161, dtb__162) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs depth) dtb__162)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__163, dtb__164, dtb__165) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add depth) 1)) dtb__165)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__169)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add depth) 1)) dtb__170)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__171, dtb__172, dtb__173) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__171)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__172)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__173)))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__174, dtb__175) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__174)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes depth) dtb__175)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (match dtb__176 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__179) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__177) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__178)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__177))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__180, dtb__181) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__180)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__180))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__181)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes 0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__182))) (fun _u -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__183)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel 100000) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency = (fun defs -> ((fun names -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto names) C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)))))) defs)) (v_Vuna_dCompiler_dCommon_dtblOfNames (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun defsTbl -> ((fun adj -> ((fun adjT -> ((fun revT -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) names) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> ((fun comps -> ((fun groups -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dorderGroups adjT) groups)) (fun ordered -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf defsTbl)) ordered)))))) ((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revT) dtb__185) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl adj))) (v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf adj))) (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency defs))) (v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf defs))) (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel 100000) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel 100000) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure = (fun typeNames -> (fun d -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__186) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "in `") ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ((bi_concat "`: ") dtb__186)))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__187) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__187))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure mc0) dtb__188)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure mc0) dtb__189)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel 512) a1) a2) a3))))
