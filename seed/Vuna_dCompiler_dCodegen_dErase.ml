open Vuna_runtime
open Vuna_builtins
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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser
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
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
let rec v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__0, dtb__1, dtb__2) -> (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp dtb__0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (match dtb__3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, ((v_Base_dList_dappend dtb__5) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1, dtb__2)), C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__6, dtb__7) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dErase_ddefTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__8), (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__8))), (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__10)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10)) else ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef mc0) dtb__11))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_disTypeForming = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__12) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dCodegen_dErase_disTypeForming ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__17) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, 0, C_Base_dList_dList_Nil))))))
  | _ -> false
))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef = (fun table -> (fun d -> (v_Vuna_dCompiler_dCodegen_dErase_disTypeForming ((((v_Vuna_dCompiler_dCore_dEval_dforce table) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if ((v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef mc0) dtb__18) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__19) mc2) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__18), mc3))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__19) (C_Base_dList_dList_Cons (dtb__18, mc2))) mc3))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc2), (v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs = (fun table -> (fun defs -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo table) defs) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint = (fun m -> ((bi_concat " ?") (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dbinderAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20)) else ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt ((bi_sub mc0) 1)) dtb__21))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure = (fun typeNames -> (fun binders -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__22, dtb__23) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__23) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (match dtb__24 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__26) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level binding `") ((bi_concat dtb__22) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unbound runtime variable ") ((bi_concat dtb__22) ((bi_concat " (index ") ((bi_concat (bi_strFromInt dtb__23)) ((bi_concat ", binders ") ((bi_concat (bi_strFromInt (v_Base_dList_dlength binders))) ")"))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__27) -> (if ((v_Base_dList_dmemName dtb__27) typeNames) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level name `") ((bi_concat dtb__27) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__28) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__34) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: unsolved metavariable in runtime code") (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__34))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__35, dtb__36, dtb__37) -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36)), binders))) dtb__37)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__38, dtb__39, dtb__40) -> (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> (match dtb__41 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure typeNames) binders) dtb__43)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__40) then (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) binders) dtb__38) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) binders) dtb__38)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) binders) dtb__39))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__44, dtb__45) -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure typeNames) binders) dtb__45)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__46, dtb__47) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) binders) dtb__46)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure typeNames) binders) dtb__47)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__48) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__49) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__50) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__51, dtb__52, dtb__53) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) binders) dtb__51)) (fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) binders) dtb__52)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) binders) dtb__53)))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__57) then (((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure mc0) mc1) dtb__55) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure mc0) mc1) dtb__56)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure mc0) mc1) dtb__55))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__58, dtb__59) -> ((fun altBinders -> ((fun env -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure mc0) env) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__58))) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure mc0) mc1) dtb__59)))) ((v_Base_dList_dappend (v_Base_dList_dreverse altBinders)) mc1))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__58))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure = (fun typeNames -> (fun d -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__60) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "in `") ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ((bi_concat "`: ") dtb__60)))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__61) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__61))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__62, dtb__63) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure mc0) dtb__62)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure mc0) dtb__63)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if ((bi_eq_str dtb__64) mc0) then (C_Base_dList_dList_Cons (dtb__64, dtb__65)) else (C_Base_dList_dList_Cons (dtb__64, ((v_Vuna_dCompiler_dCodegen_dErase_daddName mc0) dtb__65))))
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (mc0, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto = (fun runtimeNames -> (fun acc -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__66) -> (if ((v_Base_dList_dmemName dtb__66) runtimeNames) then ((v_Vuna_dCompiler_dCodegen_dErase_daddName dtb__66) acc) else acc)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__67, dtb__68) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__69) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__70) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__76, dtb__77, dtb__78) -> (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) acc) dtb__78)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__79, dtb__80, dtb__81) -> (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (match dtb__82 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__84) -> (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs runtimeNames) acc) dtb__84)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__81) then (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) acc) dtb__79) else (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) acc) dtb__79)) dtb__80))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__85, dtb__86) -> (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs runtimeNames) acc) dtb__86)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__87, dtb__88) -> (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts runtimeNames) (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) acc) dtb__87)) dtb__88)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__89) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__90) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__91) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__92, dtb__93, dtb__94) -> (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto runtimeNames) acc) dtb__92)) dtb__93)) dtb__94)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (match dtb__95 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__98) then (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs mc0) mc1) dtb__96) else (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs mc0) (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto mc0) mc1) dtb__97)) dtb__96))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts mc0) (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto mc0) mc1) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__99))) dtb__100)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__101), (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf dtb__102)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef = (fun defs -> (fun name -> ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf = (fun adj -> (fun name -> (match adj with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__103 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (if ((bi_eq_str dtb__105) name) then dtb__106 else ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf dtb__104) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_ddependentsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> ((fun dep -> (if ((v_Base_dList_dmemName mc0) dtb__110) then (C_Base_dList_dList_Cons (dtb__109, dep)) else dep)) ((v_Vuna_dCompiler_dCodegen_dErase_ddependentsOf mc0) dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dreverseAdj = (fun names -> (fun adj -> ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, ((v_Vuna_dCompiler_dCodegen_dErase_ddependentsOf n) adj))))) names)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if ((v_Base_dList_dmemName dtb__111) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost mc0) dtb__112) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPost mc0) dtb__111) (C_Base_dList_dList_Cons (dtb__111, mc2))) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost mc0) dtb__112) dtb__113) dtb__114)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsPost = (fun adj -> (fun n -> (fun visited -> (fun order -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost adj) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adj) n)) visited) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, (C_Base_dList_dList_Cons (n, dtb__116))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpostOrder = (fun adj -> (fun nodes -> (fun visited -> (fun order -> (match nodes with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | C_Base_dList_dList_Cons (dtb__117, dtb__118) -> (if ((v_Base_dList_dmemName dtb__117) visited) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adj) dtb__118) visited) order) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPost adj) dtb__117) (C_Base_dList_dList_Cons (dtb__117, visited))) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adj) dtb__118) dtb__119) dtb__120)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (if ((v_Base_dList_dmemName dtb__121) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect mc0) dtb__122) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect mc0) dtb__121) (C_Base_dList_dList_Cons (dtb__121, mc2))) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, dtb__124) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect mc0) dtb__122) dtb__123) dtb__124)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect = (fun revAdj -> (fun n -> (fun visited -> (fun comp -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect revAdj) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf revAdj) n)) visited) comp) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, (C_Base_dList_dList_Cons (n, dtb__126))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcollectComps = (fun revAdj -> (fun nodes -> (fun visited -> (fun comps -> (match nodes with
  | C_Base_dList_dList_Nil -> comps
  | C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (if ((v_Base_dList_dmemName dtb__127) visited) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revAdj) dtb__128) visited) comps) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect revAdj) dtb__127) (C_Base_dList_dList_Cons (dtb__127, visited))) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revAdj) dtb__128) dtb__129) (C_Base_dList_dList_Cons (dtb__130, comps)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcomponentOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (if ((v_Base_dList_dmemName mc1) dtb__131) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131)) else ((v_Vuna_dCompiler_dCodegen_dErase_dcomponentOf dtb__132) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfilterNames = (fun pred -> (fun names -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (if (pred dtb__133) then (C_Base_dList_dList_Cons (dtb__133, ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames pred) dtb__134))) else ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames pred) dtb__134))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (if ((v_Base_dList_dmemName dtb__135) mc3) then ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__136) mc3) else (match ((v_Vuna_dCompiler_dCodegen_dErase_dcomponentOf mc0) dtb__135) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((v_Base_dList_dmemName m) dtb__137))) mc1), ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__136) ((v_Base_dList_dappend dtb__137) mc3))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__136) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps = (fun comps -> (fun names -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo comps) names) names) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_dnotIn = (fun name -> (fun names -> (if ((v_Base_dList_dmemName name) names) then false else true)))

let rec v_Vuna_dCompiler_dCodegen_dErase_duniqueNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (if ((bi_eq_str dtb__138) "") then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__139) else (if ((v_Base_dList_dmemName dtb__138) dtb__139) then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__139) else (C_Base_dList_dList_Cons (dtb__138, (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__139)))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps = (fun adj -> (fun group -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCodegen_dErase_dnotIn n) group))) (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adj)) group)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dallIn = (fun names -> (fun allowed -> (match names with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if ((v_Base_dList_dmemName dtb__140) allowed) then ((v_Vuna_dCompiler_dCodegen_dErase_dallIn dtb__141) allowed) else false)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupReady = (fun adj -> (fun group -> (fun emitted -> ((v_Vuna_dCompiler_dCodegen_dErase_dallIn ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps adj) group)) emitted))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (if (((v_Vuna_dCompiler_dCodegen_dErase_dgroupReady mc0) dtb__142) mc3) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, ((v_Base_dList_dappend (v_Base_dList_dreverse mc2)) dtb__143))))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc mc0) dtb__143) (C_Base_dList_dList_Cons (dtb__142, mc2))) mc3))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dErase_dpickReady = (fun adj -> (fun groups -> (fun emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc adj) groups) C_Base_dList_dList_Nil) emitted))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dpickReady mc0) mc1) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: dependency cycle between runtime definitions"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (match dtb__144 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, dtb__146) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc mc0) dtb__146) ((v_Base_dList_dappend dtb__145) mc2))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__145, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
))))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroups = (fun adj -> (fun groups -> (((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc adj) groups) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency = (fun defs -> ((fun names -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto names) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)))))) defs)) (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef mc0) dtb__147) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__148)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (C_Base_dList_dList_Cons (dtb__149, ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__148)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun adj -> ((fun revAdj -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adj) names) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> ((fun comps -> ((fun groups -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dorderGroups adj) groups)) (fun ordered -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf defs)) ordered)))))) ((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revAdj) dtb__151) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dreverseAdj names) adj))) (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency defs))) (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (if ((v_Base_dList_dmemName dtb__152) dtb__153) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: OCaml name collision among ") ((bi_concat mc0) ((bi_concat "s: `") ((bi_concat dtb__152) "`")))))) else ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames mc0) dtb__153))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames = (fun datas -> (fun defs -> ((fun runtime -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__154, dtb__155) -> (if ((bi_ge_int dtb__155) 0) then (if ((bi_lt_int dtb__155) depth) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: out-of-scope de Bruijn index ") ((bi_concat (bi_strFromInt dtb__155)) ((bi_concat " (depth ") ((bi_concat (bi_strFromInt depth)) ")"))))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: negative de Bruijn index ") (bi_strFromInt dtb__155)))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__156) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__157) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__158) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__159) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__160) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__161) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__162, dtb__163, dtb__164) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__164) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__162) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__162)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__163))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs depth) dtb__166)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__167, dtb__168, dtb__169) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add depth) 1)) dtb__169)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__173)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add depth) 1)) dtb__174)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__175, dtb__176, dtb__177) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__175)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__176)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__177)))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__178, dtb__179) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes depth) dtb__178)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes depth) dtb__179)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (match dtb__180 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__183) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__181) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__182)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__181))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__184, dtb__185) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__184)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__184))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__185)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes 0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__186))) (fun _u -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__187)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))
