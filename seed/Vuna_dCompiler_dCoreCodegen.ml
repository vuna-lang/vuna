open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtMatch
open Vuna_dCompiler_dDtTerm
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dSplit
type t_Vuna_dCompiler_dCoreCodegen_dGenSt = C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt of (string t_Base_dList_dList) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * (int) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dCoreCodegen_dAltEnv = C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv of ((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCoreCodegen_dGenSt)
and t_Vuna_dCompiler_dCoreCodegen_dSplitMeta = C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta of ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (string t_Base_dList_dList)

let rec v_Vuna_dCompiler_dCoreCodegen_dflattenConApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__0, dtb__1, dtb__2) -> (match (v_Vuna_dCompiler_dCoreCodegen_dflattenConApp dtb__0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (match dtb__3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, ((v_Base_dList_dappend dtb__5) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1, dtb__2)), C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__6, dtb__7) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCoreCodegen_ddefTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName dtb__8), (v_Vuna_dCompiler_dElab_ddtDefBody dtb__8))), (v_Vuna_dCompiler_dCoreCodegen_ddefTable dtb__9)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dfindDtDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtDefName dtb__10)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10)) else ((v_Vuna_dCompiler_dCoreCodegen_dfindDtDef mc0) dtb__11))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_disTypeLevelDef = (fun table -> (fun d -> (v_Vuna_dCompiler_dCore_disTypeValue ((((v_Vuna_dCompiler_dCore_dforce table) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefType d))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if ((v_Vuna_dCompiler_dCoreCodegen_disTypeLevelDef mc0) dtb__12) then ((((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo mc0) dtb__13) mc2) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_ddtDefName dtb__12), mc3))) else ((((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo mc0) dtb__13) (C_Base_dList_dList_Cons (dtb__12, mc2))) mc3))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc2), (v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs = (fun table -> (fun defs -> ((((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo table) defs) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint = (fun m -> ((bi_concat " ?") (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCoreCodegen_dbinderAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14)) else ((v_Vuna_dCompiler_dCoreCodegen_dbinderAt ((bi_sub mc0) 1)) dtb__15))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckErasure = (fun typeNames -> (fun binders -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__16, dtb__17) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dbinderAt dtb__17) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18) -> (match dtb__18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__20) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level binding `") ((bi_concat dtb__16) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unbound runtime variable ") ((bi_concat dtb__16) ((bi_concat " (index ") ((bi_concat (bi_strFromInt dtb__17)) ((bi_concat ", binders ") ((bi_concat (bi_strFromInt (v_Base_dList_dlength binders))) ")"))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__21) -> (if ((v_Base_dList_dmemName dtb__21) typeNames) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level name `") ((bi_concat dtb__21) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__22) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__28) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: unsolved metavariable in runtime code") (v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint dtb__28))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__29, dtb__30, dtb__31) -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30)), binders))) dtb__31)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__32, dtb__33, dtb__34) -> (match (v_Vuna_dCompiler_dCoreCodegen_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__35) -> (match dtb__35 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37) -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames) binders) dtb__37)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__34) then (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__32) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__32)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__33))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__38, dtb__39) -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames) binders) dtb__39)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__40, dtb__41) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__40)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure typeNames) binders) dtb__41)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__42) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__43) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__44) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__45, dtb__46, dtb__47) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__45)) (fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__46)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__47)))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__48 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__50, dtb__51) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__51) then (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure mc0) mc1) dtb__49) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure mc0) mc1) dtb__50)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure mc0) mc1) dtb__49))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__52, dtb__53) -> ((fun altBinders -> ((fun env -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure mc0) env) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__52))) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure mc0) mc1) dtb__53)))) ((v_Base_dList_dappend (v_Base_dList_dreverse altBinders)) mc1))) (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__52))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dcheckOneErasure = (fun typeNames -> (fun d -> (match (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefBody d)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__54) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "in `") ((bi_concat (v_Vuna_dCompiler_dElab_ddtDefName d)) ((bi_concat "`: ") dtb__54)))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__55) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__55))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__56, dtb__57) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckOneErasure mc0) dtb__56)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure mc0) dtb__57)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_daddName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if ((bi_eq_str dtb__58) mc0) then (C_Base_dList_dList_Cons (dtb__58, dtb__59)) else (C_Base_dList_dList_Cons (dtb__58, ((v_Vuna_dCompiler_dCoreCodegen_daddName mc0) dtb__59))))
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (mc0, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto = (fun runtimeNames -> (fun acc -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__60) -> (if ((v_Base_dList_dmemName dtb__60) runtimeNames) then ((v_Vuna_dCompiler_dCoreCodegen_daddName dtb__60) acc) else acc)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__61, dtb__62) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__63) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__64) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__70, dtb__71, dtb__72) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__72)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__73, dtb__74, dtb__75) -> (match (v_Vuna_dCompiler_dCoreCodegen_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__76) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames) acc) dtb__78)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__75) then (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__73) else (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__73)) dtb__74))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__79, dtb__80) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames) acc) dtb__80)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__81, dtb__82) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__81)) dtb__82)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__83) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__84) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__85) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__86, dtb__87, dtb__88) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__86)) dtb__87)) dtb__88)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__89, dtb__90) -> (match dtb__89 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__92) then (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs mc0) mc1) dtb__90) else (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs mc0) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto mc0) mc1) dtb__91)) dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts mc0) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto mc0) mc1) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__93))) dtb__94)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_ddtDefName dtb__95), (v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf dtb__96)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dlookupDtDef = (fun defs -> (fun name -> ((v_Vuna_dCompiler_dCoreCodegen_dfindDtDef name) defs)))

let rec v_Vuna_dCompiler_dCoreCodegen_dneighborsOf = (fun adj -> (fun name -> (match adj with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__97 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (if ((bi_eq_str dtb__99) name) then dtb__100 else ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf dtb__98) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_ddependentsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (match dtb__101 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> ((fun dep -> (if ((v_Base_dList_dmemName mc0) dtb__104) then (C_Base_dList_dList_Cons (dtb__103, dep)) else dep)) ((v_Vuna_dCompiler_dCoreCodegen_ddependentsOf mc0) dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dreverseAdj = (fun names -> (fun adj -> ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, ((v_Vuna_dCompiler_dCoreCodegen_ddependentsOf n) adj))))) names)))

let rec v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (if ((v_Base_dList_dmemName dtb__105) mc2) then ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost mc0) dtb__106) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsPost mc0) dtb__105) (C_Base_dList_dList_Cons (dtb__105, mc2))) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost mc0) dtb__106) dtb__107) dtb__108)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_ddfsPost = (fun adj -> (fun n -> (fun visited -> (fun order -> (match ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost adj) ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf adj) n)) visited) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, (C_Base_dList_dList_Cons (n, dtb__110))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dpostOrder = (fun adj -> (fun nodes -> (fun visited -> (fun order -> (match nodes with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if ((v_Base_dList_dmemName dtb__111) visited) then ((((v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj) dtb__112) visited) order) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsPost adj) dtb__111) (C_Base_dList_dList_Cons (dtb__111, visited))) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> ((((v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj) dtb__112) dtb__113) dtb__114)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (if ((v_Base_dList_dmemName dtb__115) mc2) then ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect mc0) dtb__116) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsCollect mc0) dtb__115) (C_Base_dList_dList_Cons (dtb__115, mc2))) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect mc0) dtb__116) dtb__117) dtb__118)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_ddfsCollect = (fun revAdj -> (fun n -> (fun visited -> (fun comp -> (match ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect revAdj) ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf revAdj) n)) visited) comp) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, (C_Base_dList_dList_Cons (n, dtb__120))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dcollectComps = (fun revAdj -> (fun nodes -> (fun visited -> (fun comps -> (match nodes with
  | C_Base_dList_dList_Nil -> comps
  | C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (if ((v_Base_dList_dmemName dtb__121) visited) then ((((v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj) dtb__122) visited) comps) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsCollect revAdj) dtb__121) (C_Base_dList_dList_Cons (dtb__121, visited))) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, dtb__124) -> ((((v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj) dtb__122) dtb__123) (C_Base_dList_dList_Cons (dtb__124, comps)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dcomponentOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (if ((v_Base_dList_dmemName mc1) dtb__125) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__125)) else ((v_Vuna_dCompiler_dCoreCodegen_dcomponentOf dtb__126) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dfilterNames = (fun pred -> (fun names -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (if (pred dtb__127) then (C_Base_dList_dList_Cons (dtb__127, ((v_Vuna_dCompiler_dCoreCodegen_dfilterNames pred) dtb__128))) else ((v_Vuna_dCompiler_dCoreCodegen_dfilterNames pred) dtb__128))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (if ((v_Base_dList_dmemName dtb__129) mc3) then ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo mc0) mc1) dtb__130) mc3) else (match ((v_Vuna_dCompiler_dCoreCodegen_dcomponentOf mc0) dtb__129) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCoreCodegen_dfilterNames (fun m -> ((v_Base_dList_dmemName m) dtb__131))) mc1), ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo mc0) mc1) dtb__130) ((v_Base_dList_dappend dtb__131) mc3))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo mc0) mc1) dtb__130) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dgroupsFromComps = (fun comps -> (fun names -> ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo comps) names) names) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCoreCodegen_dnotIn = (fun name -> (fun names -> (if ((v_Base_dList_dmemName name) names) then false else true)))

let rec v_Vuna_dCompiler_dCoreCodegen_duniqueNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (if ((bi_eq_str dtb__132) "") then (v_Vuna_dCompiler_dCoreCodegen_duniqueNames dtb__133) else (if ((v_Base_dList_dmemName dtb__132) dtb__133) then (v_Vuna_dCompiler_dCoreCodegen_duniqueNames dtb__133) else (C_Base_dList_dList_Cons (dtb__132, (v_Vuna_dCompiler_dCoreCodegen_duniqueNames dtb__133)))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgroupDeps = (fun adj -> (fun group -> ((v_Vuna_dCompiler_dCoreCodegen_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCoreCodegen_dnotIn n) group))) (v_Vuna_dCompiler_dCoreCodegen_duniqueNames ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCoreCodegen_dneighborsOf adj)) group)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dallIn = (fun names -> (fun allowed -> (match names with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (if ((v_Base_dList_dmemName dtb__134) allowed) then ((v_Vuna_dCompiler_dCoreCodegen_dallIn dtb__135) allowed) else false)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgroupReady = (fun adj -> (fun group -> (fun emitted -> ((v_Vuna_dCompiler_dCoreCodegen_dallIn ((v_Vuna_dCompiler_dCoreCodegen_dgroupDeps adj) group)) emitted))))

let rec v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (if (((v_Vuna_dCompiler_dCoreCodegen_dgroupReady mc0) dtb__136) mc3) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, ((v_Base_dList_dappend (v_Base_dList_dreverse mc2)) dtb__137))))) else ((((v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc mc0) dtb__137) (C_Base_dList_dList_Cons (dtb__136, mc2))) mc3))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dpickReady = (fun adj -> (fun groups -> (fun emitted -> ((((v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc adj) groups) C_Base_dList_dList_Nil) emitted))))

let rec v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> (match (((v_Vuna_dCompiler_dCoreCodegen_dpickReady mc0) mc1) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: dependency cycle between runtime definitions"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (match dtb__138 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc mc0) dtb__140) ((v_Base_dList_dappend dtb__139) mc2))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__139, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
))))

let v_Vuna_dCompiler_dCoreCodegen_dorderGroups = (fun adj -> (fun groups -> (((v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc adj) groups) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency = (fun defs -> ((fun names -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName d), (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto names) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefBody d)))))) defs)) (v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf defs)))

let rec v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlookupDtDef mc0) dtb__141) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf mc0) dtb__142)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__143) -> (C_Base_dList_dList_Cons (dtb__143, ((v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf mc0) dtb__142)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun adj -> ((fun revAdj -> (match ((((v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj) names) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> ((fun comps -> ((fun groups -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dorderGroups adj) groups)) (fun ordered -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf defs)) ordered)))))) ((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj) dtb__145) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCoreCodegen_dreverseAdj names) adj))) (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency defs))) (v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf defs)))

let v_Vuna_dCompiler_dCoreCodegen_dprepareDtProgram = (fun program -> ((fun datas -> ((fun defs -> ((fun table -> ((fun familyNames -> (match ((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs table) defs) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> ((fun allTypeNames -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure allTypeNames) dtb__146)) (fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs dtb__146)) (fun groups -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, groups))))))))) ((v_Base_dList_dappend dtb__147) familyNames))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName) datas))) (v_Vuna_dCompiler_dCoreCodegen_ddefTable defs))) (v_Base_dPair_dsecondOf program))) (v_Base_dPair_dfirstOf program)))

let v_Vuna_dCompiler_dCoreCodegen_dsanitizeChar = (fun c -> (if ((bi_eq_int c) 46) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (100, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 95) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (117, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 39) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (112, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 35) then (C_Base_dList_dList_Cons (95, (C_Base_dList_dList_Cons (104, C_Base_dList_dList_Nil)))) else (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil)))))))

let v_Vuna_dCompiler_dCoreCodegen_dsanitizeName = (fun name -> (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCoreCodegen_dsanitizeChar) (dtp_unpack name))))

let v_Vuna_dCompiler_dCoreCodegen_docamlPad3 = (fun s -> (if ((bi_eq_int (bi_strLength s)) 1) then ((bi_concat "00") s) else (if ((bi_eq_int (bi_strLength s)) 2) then ((bi_concat "0") s) else s)))

let v_Vuna_dCompiler_dCoreCodegen_docamlEscapeChar = (fun c -> (if ((bi_eq_int c) 34) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (34, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 92) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (92, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 10) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (110, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 9) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (116, C_Base_dList_dList_Nil)))) else (if ((bi_eq_int c) 13) then (C_Base_dList_dList_Cons (92, (C_Base_dList_dList_Cons (114, C_Base_dList_dList_Nil)))) else (if (if ((bi_ge_int c) 32) then ((bi_le_int c) 126) else false) then (C_Base_dList_dList_Cons (c, C_Base_dList_dList_Nil)) else (dtp_unpack ((bi_concat "\\") (v_Vuna_dCompiler_dCoreCodegen_docamlPad3 (bi_strFromInt c)))))))))))

let v_Vuna_dCompiler_dCoreCodegen_docamlString = (fun s -> ((bi_concat "\"") ((bi_concat (dtp_pack ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCoreCodegen_docamlEscapeChar) (dtp_unpack s)))) "\"")))

let v_Vuna_dCompiler_dCoreCodegen_dvalueName = (fun name -> ((bi_concat "v_") (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName name)))

let v_Vuna_dCompiler_dCoreCodegen_dboolText = (fun b -> (if b then "true" else "false"))

let v_Vuna_dCompiler_dCoreCodegen_dtypeName = (fun name -> ((bi_concat "t_") (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName name)))

let v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName = (fun family -> (fun ctor -> ((bi_concat "C_") ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName family)) ((bi_concat "_") (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName ctor))))))

let v_Vuna_dCompiler_dCoreCodegen_ddtPrimRuntime = fun () -> ((bi_concat "let dtp_print s = print_string s; flush stdout; String.length s\n") ((bi_concat "let dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n") ((bi_concat "let dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n") ((bi_concat "let dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n") ((bi_concat "let dtp_readLine () = try input_line stdin with End_of_file -> \"\"\n") ((bi_concat "let dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\n") ((bi_concat "let dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\n") ((bi_concat "let dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\n") ((bi_concat "let dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\n") ((bi_concat "let dtp_fileExists path = Sys.file_exists path\n") ((bi_concat "let dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\n") ((bi_concat "let dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n") ((bi_concat "let dtp_exit n = exit n\n") "let dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n")))))))))))))

let v_Vuna_dCompiler_dCoreCodegen_ddtRuntime = fun () -> ((bi_concat "let bi_add a b = a + b\n") ((bi_concat "let bi_sub a b = a - b\n") ((bi_concat "let bi_mul a b = a * b\n") ((bi_concat "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n") ((bi_concat "let bi_eq_int (a : int) (b : int) = a = b\n") ((bi_concat "let bi_neq_int (a : int) (b : int) = a <> b\n") ((bi_concat "let bi_eq_str (a : string) (b : string) = a = b\n") ((bi_concat "let bi_neq_str (a : string) (b : string) = a <> b\n") ((bi_concat "let bi_eq_generic (a : 'a) (b : 'a) = a = b\n") ((bi_concat "let bi_neq_generic (a : 'a) (b : 'a) = a <> b\n") ((bi_concat "let bi_strFromInt (n : int) = string_of_int n\n") ((bi_concat "let bi_strLength (s : string) = String.length s\n") ((bi_concat "let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\n") ((bi_concat "let bi_strPack (cs : int list) = String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "let bi_lt_int (a : int) (b : int) = a < b\n") ((bi_concat "let bi_le_int (a : int) (b : int) = a <= b\n") ((bi_concat "let bi_gt_int (a : int) (b : int) = a > b\n") ((bi_concat "let bi_ge_int (a : int) (b : int) = a >= b\n") ((bi_concat "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n") ((bi_concat "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n") ((bi_concat "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n") ((bi_concat "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n") ((bi_concat "let bi_concat a b = a ^ b\n") ((bi_concat "let bi_and a b = a && b\n") ((bi_concat "let bi_or a b = a || b\n") ((bi_concat "let dt_show_bool b = if b then \"True\" else \"False\"\n") ((bi_concat "let dt_show_string s =\n") ((bi_concat "  let buf = Buffer.create 16 in\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  String.iter (fun c ->\n") ((bi_concat "    let n = Char.code c in\n") ((bi_concat "    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n") ((bi_concat "    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n") ((bi_concat "    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n") ((bi_concat "    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n") ((bi_concat "    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n") ((bi_concat "    else Buffer.add_char buf c) s;\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  Buffer.contents buf\n") (v_Vuna_dCompiler_dCoreCodegen_ddtPrimRuntime ()))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCoreCodegen_dglobalRef = (fun name -> (if ((bi_eq_str name) "True") then (C_Base_dResult_dResult_Base_dResult_dOk ("true")) else (if ((bi_eq_str name) "False") then (C_Base_dResult_dResult_Base_dResult_dOk ("false")) else (if ((bi_eq_str name) "+") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_add")) else (if ((bi_eq_str name) "-") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_sub")) else (if ((bi_eq_str name) "*") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_mul")) else (if ((bi_eq_str name) "/") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_div")) else (if ((bi_eq_str name) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (if ((bi_eq_str name) "/=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int")) else (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (if ((bi_eq_str name) ">=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int")) else (if ((bi_eq_str name) "++") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_concat")) else (if ((bi_eq_str name) "&&") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_and")) else (if ((bi_eq_str name) "||") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_or")) else (if ((bi_eq_str name) "bi_eq_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (if ((bi_eq_str name) "bi_neq_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int")) else (if ((bi_eq_str name) "bi_eq_str") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_str")) else (if ((bi_eq_str name) "bi_neq_str") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_str")) else (if ((bi_eq_str name) "bi_eq_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_generic")) else (if ((bi_eq_str name) "bi_neq_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_generic")) else (if ((bi_eq_str name) "bi_lt_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "bi_le_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) "bi_gt_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (if ((bi_eq_str name) "bi_ge_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int")) else (if ((bi_eq_str name) "bi_lt_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_generic")) else (if ((bi_eq_str name) "bi_le_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_generic")) else (if ((bi_eq_str name) "bi_gt_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_generic")) else (if ((bi_eq_str name) "bi_ge_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_generic")) else (if ((bi_eq_str name) "strFromInt") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_strFromInt")) else (if ((bi_eq_str name) "strUnpack") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_unpack")) else (if ((bi_eq_str name) "strPack") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_pack")) else (if ((bi_eq_str name) "strLength") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_strLength")) else (if ((bi_eq_str name) "print") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_print")) else (if ((bi_eq_str name) "readFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_readFile")) else (if ((bi_eq_str name) "writeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_writeFile")) else (if ((bi_eq_str name) "readDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun p -> dtp_listOf (dtp_readDir p))")) else (if ((bi_eq_str name) "isDirectory") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_isDirectory")) else (if ((bi_eq_str name) "makeDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_makeDir")) else (if ((bi_eq_str name) "removeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_removeFile")) else (if ((bi_eq_str name) "fileExists") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileExists")) else (if ((bi_eq_str name) "fileMtime") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileMtime")) else (if ((bi_eq_str name) "fileSize") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileSize")) else (if ((bi_eq_str name) "exit") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_exit")) else (if ((bi_eq_str name) "getArgs") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_listOf (dtp_getArgs ()))")) else (if ((bi_eq_str name) "readLine") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_readLine ())")) else (if ((bi_eq_str name) "prim_print") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_print")) else (if ((bi_eq_str name) "prim_readFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_readFile")) else (if ((bi_eq_str name) "prim_writeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_writeFile")) else (if ((bi_eq_str name) "prim_readDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun p -> dtp_listOf (dtp_readDir p))")) else (if ((bi_eq_str name) "prim_isDirectory") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_isDirectory")) else (if ((bi_eq_str name) "prim_makeDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_makeDir")) else (if ((bi_eq_str name) "prim_removeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_removeFile")) else (if ((bi_eq_str name) "prim_fileExists") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileExists")) else (if ((bi_eq_str name) "prim_fileMtime") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileMtime")) else (if ((bi_eq_str name) "prim_fileSize") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileSize")) else (if ((bi_eq_str name) "prim_exit") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_exit")) else (if ((bi_eq_str name) "prim_runIn") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun dir args -> dtp_runIn dir (dtp_ocamlOf args))")) else (if ((bi_eq_str name) "prim_getArgs") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_listOf (dtp_getArgs ()))")) else (if ((bi_eq_str name) "prim_readLine") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_readLine ())")) else (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dvalueName name))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCoreCodegen_dtypeParamName = (fun i -> ((bi_concat "'a") (bi_strFromInt i)))

let v_Vuna_dCompiler_dCoreCodegen_dtypeParamNames = (fun n -> ((v_Base_dList_dmap v_Vuna_dCompiler_dCoreCodegen_dtypeParamName) ((v_Base_dList_drange 0) n)))

let rec v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevelsGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (if (v_Vuna_dCompiler_dCore_drigIsErased (v_Base_dPair_dsecondOf dtb__148)) then (C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevelsGo dtb__149) ((bi_add mc1) 1)))) else ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevelsGo dtb__149) ((bi_add mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevelsGo (v_Vuna_dCompiler_dElab_ddtDataParams d)) 0))

let rec v_Vuna_dCompiler_dCoreCodegen_dfindDtData = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtDataName dtb__150)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150)) else ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData mc0) dtb__151))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dmemInt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (if ((bi_eq_int dtb__152) mc0) then true else ((v_Vuna_dCompiler_dCoreCodegen_dmemInt mc0) dtb__153))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dlevelSlotGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if ((bi_eq_int dtb__154) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCoreCodegen_dlevelSlotGo dtb__155) mc1) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dlevelSlot = (fun levels -> (fun lvl -> (((v_Vuna_dCompiler_dCoreCodegen_dlevelSlotGo levels) lvl) 0)))

let rec v_Vuna_dCompiler_dCoreCodegen_dnthValue = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156)) else ((v_Vuna_dCompiler_dCoreCodegen_dnthValue dtb__157) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dlookupUsed = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__158)) mc1) then (v_Base_dPair_dsecondOf dtb__158) else ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed dtb__159) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (if dtb__161 then (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__164) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__160, lvl, C_Base_dList_dList_Nil)))))) else ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) lvl) dtb__163)) (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__164) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__160, lvl, C_Base_dList_dList_Nil))))))))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__165) -> (match dtb__165 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__166, dtb__167, dtb__168) -> ((v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCoreCodegen_dmemInt dtb__167) tps) then (C_Base_dList_dList_Cons (dtb__167, C_Base_dList_dList_Nil)) else C_Base_dList_dList_Nil)) (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine tps) table) datas) lvl) dtb__168))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__169, dtb__170) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData dtb__169) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> ((((((v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs tps) table) datas) lvl) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) dtb__169)) dtb__170)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine tps) table) datas) lvl) dtb__170)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dList_dList_Nil
))))))
and v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__172, dtb__173) -> ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels mc0) mc1) mc2) mc3) dtb__172)) (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine mc0) mc1) mc2) mc3) dtb__173))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun usedPats -> (fun args -> (match usedPats with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__174, dtb__175) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dnthValue args) dtb__174) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) lvl) dtb__176)) ((((((v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs tps) table) datas) lvl) dtb__175) args))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs tps) table) datas) lvl) dtb__175) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (match dtb__177 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__180) then ((((((v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels mc0) mc1) mc2) dtb__178) ((bi_add mc4) 1)) next) else ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels mc0) mc1) mc2) mc4) dtb__184)) ((((((v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels mc0) mc1) mc2) dtb__178) ((bi_add mc4) 1)) next)))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__185) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__181, mc4, C_Base_dList_dList_Nil))))))
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCoreCodegen_ddataUsedLevels = (fun d -> (fun table -> (fun datas -> ((fun raw -> ((v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCoreCodegen_dmemInt l) raw))) (v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevels d))) ((v_Base_dList_dconcatMap (fun c -> ((((((v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels (v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevels d)) table) datas) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType c))))) (v_Vuna_dCompiler_dElab_ddtDataCtors d))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dsameLevelTable = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (if (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__186)) (v_Base_dPair_dfirstOf dtb__188)) then ((bi_eq_generic (v_Base_dPair_dsecondOf dtb__186)) (v_Base_dPair_dsecondOf dtb__188)) else false) then ((v_Vuna_dCompiler_dCoreCodegen_dsameLevelTable dtb__187) dtb__189) else false)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dusedTableFix = (fun datas -> (fun table -> ((fun next -> (if ((v_Vuna_dCompiler_dCoreCodegen_dsameLevelTable next) table) then next else ((v_Vuna_dCompiler_dCoreCodegen_dusedTableFix datas) next))) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), (((v_Vuna_dCompiler_dCoreCodegen_ddataUsedLevels d) table) datas))))) datas))))

let rec v_Vuna_dCompiler_dCoreCodegen_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (if ((bi_ge_int dtb__190) (v_Vuna_dCompiler_dCoreCodegen_dmaxIntList dtb__191)) then dtb__190 else (v_Vuna_dCompiler_dCoreCodegen_dmaxIntList dtb__191))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dparenOne = (fun t -> ((bi_concat "(") ((bi_concat t) ")")))

let rec v_Vuna_dCompiler_dCoreCodegen_dparenList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__192, dtb__193) -> ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_dparenOne dtb__192), C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dCoreCodegen_dparenList dtb__193))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__194, dtb__195, dtb__196, dtb__197) -> dtb__195
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsFamilies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__198, dtb__199, dtb__200, dtb__201) -> dtb__198
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__202, dtb__203, dtb__204, dtb__205) -> dtb__204
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsThunks = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsPutNext = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__210, dtb__211, dtb__212, dtb__213) -> (C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__210, dtb__211, mc1, dtb__213))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dctorTableOfData = (fun d -> ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtCtorName c), (v_Vuna_dCompiler_dElab_ddtCtorFamily c))))) (v_Vuna_dCompiler_dElab_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__214, dtb__215) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dCoreCodegen_dctorTableOfData dtb__214)) (v_Vuna_dCompiler_dCoreCodegen_dctorTableOf dtb__215))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_druntimeArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__216, dtb__217, dtb__218) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__217) then (v_Vuna_dCompiler_dCoreCodegen_druntimeArity dtb__218) else ((bi_add 1) (v_Vuna_dCompiler_dCoreCodegen_druntimeArity dtb__218)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCoreCodegen_dthunkable = (fun d -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtDefName d)) "main") then false else ((bi_eq_int (v_Vuna_dCompiler_dCoreCodegen_druntimeArity (v_Vuna_dCompiler_dElab_ddtDefBody d))) 0)))

let v_Vuna_dCompiler_dCoreCodegen_dthunkNames = (fun defs -> ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dElab_ddtDefName d))) ((v_Base_dList_dfilter v_Vuna_dCompiler_dCoreCodegen_dthunkable) defs)))

let v_Vuna_dCompiler_dCoreCodegen_dmkGenSt = (fun datas -> (fun defs -> (C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName) datas), (v_Vuna_dCompiler_dCoreCodegen_dctorTableOf datas), 0, (v_Vuna_dCompiler_dCoreCodegen_dthunkNames defs)))))

let v_Vuna_dCompiler_dCoreCodegen_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (dtb__219, dtb__220, dtb__221) -> dtb__219
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (dtb__222, dtb__223, dtb__224) -> dtb__223
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (dtb__225, dtb__226, dtb__227) -> dtb__227
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_daltEnvGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (match dtb__228 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, dtb__231) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__231) then ((((v_Vuna_dCompiler_dCoreCodegen_daltEnvGo mc0) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), mc1))) dtb__229) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCoreCodegen_daltEnvGo ((v_Vuna_dCompiler_dCoreCodegen_dgsPutNext mc0) ((bi_add fresh) 1))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), mc1))) dtb__229) (C_Base_dList_dList_Cons (nm, mc3)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCoreCodegen_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (mc1, (v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_daltEnv = (fun st -> (fun outer -> (fun tele -> ((((v_Vuna_dCompiler_dCoreCodegen_daltEnvGo st) outer) tele) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__232, dtb__233) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dcaseAltName dtb__232)) "") then true else (v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt dtb__233))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_djoinWith = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (match dtb__235 with
  | C_Base_dList_dList_Nil -> dtb__234
  | _ -> ((bi_concat dtb__234) ((bi_concat mc0) ((v_Vuna_dCompiler_dCoreCodegen_djoinWith mc0) dtb__235)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dtypeParamDecl = (fun mc0 -> (if ((bi_eq_int mc0) 0) then "" else ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__236, dtb__237) -> (match dtb__237 with
  | C_Base_dList_dList_Nil -> ((bi_concat dtb__236) " ")
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") nd_uscrut)) ") "))
)
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") nd_uscrut)) ") "))
)) (v_Vuna_dCompiler_dCoreCodegen_dtypeParamNames mc0))))

let v_Vuna_dCompiler_dCoreCodegen_dfamilyTyText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__238, dtb__239) -> (match dtb__239 with
  | C_Base_dList_dList_Nil -> ((bi_concat dtb__238) ((bi_concat " ") (v_Vuna_dCompiler_dCoreCodegen_dtypeName mc0)))
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") mc1)) ((bi_concat ") ") (v_Vuna_dCompiler_dCoreCodegen_dtypeName mc0))))
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCoreCodegen_dtypeName mc0)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dctorDeclText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__240, dtb__241) -> (match dtb__241 with
  | C_Base_dList_dList_Nil -> ((bi_concat mc0) ((bi_concat " of ") (v_Vuna_dCompiler_dCoreCodegen_dparenOne dtb__240)))
  | _ -> ((bi_concat mc0) ((bi_concat " of ") ((v_Vuna_dCompiler_dCoreCodegen_djoinWith " * ") (v_Vuna_dCompiler_dCoreCodegen_dparenList mc1))))
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dctorBodyText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Nil -> "|"
  | _ -> ((v_Vuna_dCompiler_dCoreCodegen_djoinWith " | ") mc0)
))

let v_Vuna_dCompiler_dCoreCodegen_dconAppText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__242, dtb__243) -> (match dtb__243 with
  | C_Base_dList_dList_Nil -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat dtb__242) "))"))))
  | _ -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") mc1)) "))"))))
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_darmPatternText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Nil -> mc0
  | _ -> ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") mc1)) ")")))
)))

let v_Vuna_dCompiler_dCoreCodegen_dgroupNeedsRec = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (match dtb__245 with
  | C_Base_dList_dList_Nil -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtDefName dtb__244)) ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf mc0) (v_Vuna_dCompiler_dElab_ddtDefName dtb__244)))
  | _ -> true
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dlastName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__246, dtb__247) -> dtb__247
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__248, dtb__249) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName (v_Vuna_dCompiler_dElab_ddtCtorName dtb__248))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__248)) else ((v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor mc0) dtb__249))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__250, dtb__251) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName (v_Vuna_dCompiler_dElab_ddtDataName dtb__250))) "List") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__250)) else (v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData dtb__251))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_ddtListBridge = (fun datas -> (match (v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__252) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor "Nil") (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__252)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__253) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor "Cons") (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__252)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__254) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> ((bi_concat "\nlet dtp_unpack (s : string) =\n") ((bi_concat "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n") ((bi_concat "  List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) cs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_pack xs =\n") ((bi_concat "  let rec to_list xs = match xs with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: to_list rest in\n") ((bi_concat "  let cs = to_list xs in\n") ((bi_concat "  String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "\nlet dtp_listOf xs = List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) xs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_ocamlOf xs =\n") ((bi_concat "  let rec go l = match l with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: go rest in\n") "  go xs\n"))))))))))))))))))))))))))) ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_ddtCtorName dtb__254)))) ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_ddtCtorName dtb__253)))) (v_Vuna_dCompiler_dElab_ddtDataName dtb__252))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dhasListFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__255, dtb__256) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName dtb__255)) "List") then true else (v_Vuna_dCompiler_dCoreCodegen_dhasListFamily dtb__256))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgenGlobalRef = (fun st -> (fun name -> (match ((v_Base_dList_dlookupPair name) (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__257) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__257) name), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dCoreCodegen_dgsThunks st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dvalueName name)) " ())")), st)))) else (if ((bi_eq_str name) "strUnpack") then (if (v_Vuna_dCompiler_dCoreCodegen_dhasListFamily (v_Vuna_dCompiler_dCoreCodegen_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_unpack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strUnpack", st))))) else (if ((bi_eq_str name) "strPack") then (if (v_Vuna_dCompiler_dCoreCodegen_dhasListFamily (v_Vuna_dCompiler_dCoreCodegen_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_pack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strPack", st))))) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dglobalRef name)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (r, st)))))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs = (fun levels -> (fun table -> (fun datas -> (fun usedPats -> (fun args -> (match usedPats with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__258, dtb__259) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dnthValue args) dtb__258) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__260) -> (C_Base_dList_dList_Cons (((((v_Vuna_dCompiler_dCoreCodegen_drenderTypeArg levels) table) datas) dtb__260), (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) dtb__259) args)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) dtb__259) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCoreCodegen_drenderTypeArg = (fun levels -> (fun table -> (fun datas -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__261) -> (match dtb__261 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__262, dtb__263, dtb__264) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlevelSlot levels) dtb__263) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__265) -> (v_Vuna_dCompiler_dCoreCodegen_dtypeParamName dtb__265)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__266, dtb__267) -> (if ((bi_eq_str dtb__266) "Int") then "int" else (if ((bi_eq_str dtb__266) "String") then "string" else (if ((bi_eq_str dtb__266) "Bool") then "bool" else (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName dtb__266)) "Bool") then "bool" else (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData dtb__266) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__268) -> ((v_Vuna_dCompiler_dCoreCodegen_dfamilyTyText dtb__266) (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) dtb__266)) dtb__267))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "unit"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_drenderPiTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__271) then (((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) ((bi_add lvl) 1)) next) else ((bi_concat "(") ((bi_concat (((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) lvl) dtb__272)) ((bi_concat ") -> ") (((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) ((bi_add lvl) 1)) next)))))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__273) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__269, lvl, C_Base_dList_dList_Nil))))))
  | _ -> ((((v_Vuna_dCompiler_dCoreCodegen_drenderTypeArg levels) table) datas) v)
))))))

let v_Vuna_dCompiler_dCoreCodegen_drenderFieldTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun dom -> (fun slot -> (match dom with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278) -> (if dtb__275 then (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) lvl) dom), slot)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__279) -> (match dtb__279 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__280, dtb__281, dtb__282) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlevelSlot levels) dtb__281) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__283) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName dtb__283), slot))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__284, dtb__285) -> (if ((bi_eq_str dtb__284) "Int") then (C_Base_dPair_dPair_Base_dPair_dPair ("int", slot)) else (if ((bi_eq_str dtb__284) "String") then (C_Base_dPair_dPair_Base_dPair_dPair ("string", slot)) else (if ((bi_eq_str dtb__284) "Bool") then (C_Base_dPair_dPair_Base_dPair_dPair ("bool", slot)) else (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData dtb__284) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__286) -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCoreCodegen_dfamilyTyText dtb__284) (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) dtb__284)) dtb__285)), slot))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1)))
)))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__287, dtb__288) -> (match dtb__287 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__289, dtb__290) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__290) then (((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts mc0) mc1) mc2) dtb__288) ((bi_add mc4) 1)) next) mc6) else (match ((((((v_Vuna_dCompiler_dCoreCodegen_drenderFieldTy mc0) mc1) mc2) mc4) dtb__294) mc6) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__296, dtb__297) -> (match (((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts mc0) mc1) mc2) dtb__288) ((bi_add mc4) 1)) next) dtb__297) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__296, dtb__298)), dtb__299))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__295) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__291, mc4, C_Base_dList_dList_Nil))))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc6))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc6))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCoreCodegen_dctorArityNeed = (fun levels -> (fun table -> (fun datas -> (fun c -> ((bi_sub (v_Base_dPair_dsecondOf (((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType c))) (v_Base_dList_dlength levels)))) (v_Base_dList_dlength levels))))))

let v_Vuna_dCompiler_dCoreCodegen_ddataArityNeed = (fun levels -> (fun table -> (fun datas -> (fun ctors -> ((bi_add (v_Base_dList_dlength levels)) (v_Vuna_dCompiler_dCoreCodegen_dmaxIntList ((v_Base_dList_dmap (((v_Vuna_dCompiler_dCoreCodegen_dctorArityNeed levels) table) datas)) ctors)))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenCtorDecl = (fun levels -> (fun table -> (fun datas -> (fun c -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dCoreCodegen_dctorDeclText ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName (v_Vuna_dCompiler_dElab_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_ddtCtorName c))) (v_Base_dPair_dfirstOf (((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType c))) (v_Base_dList_dlength levels))))))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl = (fun table -> (fun datas -> (fun d -> ((fun levels -> ((fun arity -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCoreCodegen_dgenCtorDecl levels) table) datas)) (v_Vuna_dCompiler_dElab_ddtDataCtors d))) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dtypeParamDecl arity)) ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dtypeName (v_Vuna_dCompiler_dElab_ddtDataName d))) ((bi_concat " = ") (v_Vuna_dCompiler_dCoreCodegen_dctorBodyText cs))))))))) ((((v_Vuna_dCompiler_dCoreCodegen_ddataArityNeed levels) table) datas) (v_Vuna_dCompiler_dElab_ddtDataCtors d)))) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) (v_Vuna_dCompiler_dElab_ddtDataName d))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenTypeDecls = (fun datas -> (match datas with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((fun table -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl table) datas)) datas)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat "type ") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand ") parts)) "\n\n"))))))) ((v_Vuna_dCompiler_dCoreCodegen_dusedTableFix datas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), C_Base_dList_dList_Nil)))) datas)))
))

let v_Vuna_dCompiler_dCoreCodegen_disBoolFamilyName = (fun name -> ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName name)) "Bool"))

let v_Vuna_dCompiler_dCoreCodegen_druntimeDatas = (fun datas -> ((v_Base_dList_dfilter (fun d -> (if (v_Vuna_dCompiler_dCoreCodegen_disBoolFamilyName (v_Vuna_dCompiler_dElab_ddtDataName d)) then false else true))) datas))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenTerm = (fun st -> (fun binders -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__300, dtb__301) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dbinderAt dtb__301) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__302) -> (match dtb__302 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__303, dtb__304) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__304) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level binding `") ((bi_concat dtb__300) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__303, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__305) -> ((v_Vuna_dCompiler_dCoreCodegen_dgenGlobalRef st) dtb__305)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__306) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__306), st))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__307) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_docamlString dtb__307), st))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__308) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dboolText dtb__308), st))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__309, dtb__310, dtb__311) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) dtb__309)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__312, dtb__313) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm dtb__313) binders) dtb__310)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__314, dtb__315) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm dtb__315) binders) dtb__311)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__316, dtb__317) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(if ") ((bi_concat dtb__312) ((bi_concat " then ") ((bi_concat dtb__314) ((bi_concat " else ") ((bi_concat dtb__316) ")")))))), dtb__317))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__318, dtb__319, dtb__320) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__319) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), binders))) dtb__320)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__321, dtb__322) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__321, dtb__322))))
  | _ -> failwith "DT: impossible branch"
))) else ((fun ocName -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (ocName, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), binders))) dtb__320)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__323, dtb__324) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(fun ") ((bi_concat ocName) ((bi_concat " -> ") ((bi_concat dtb__323) ")")))), dtb__324))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName dtb__318)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__325, dtb__326, dtb__327) -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenApp st) binders) dtb__325) dtb__326) dtb__327)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__328, dtb__329) -> ((((v_Vuna_dCompiler_dCoreCodegen_dgenConApp st) binders) dtb__328) dtb__329)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__330, dtb__331) -> ((((v_Vuna_dCompiler_dCoreCodegen_dgenCase st) binders) dtb__330) dtb__331)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__337) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__338) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: unsolved metavariable in runtime code") (v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint dtb__338))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dgenApp = (fun st -> (fun binders -> (fun f -> (fun a -> (fun rig -> (if (v_Vuna_dCompiler_dCore_drigIsErased rig) then (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) f) else (match (v_Vuna_dCompiler_dCoreCodegen_dflattenConApp (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (f, a, rig))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__339) -> (match dtb__339 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__340, dtb__341) -> ((((v_Vuna_dCompiler_dCoreCodegen_dgenConApp st) binders) dtb__340) dtb__341)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) f)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__342, dtb__343) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm dtb__343) binders) a)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__344, dtb__345) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat dtb__342) ((bi_concat " ") ((bi_concat dtb__344) ")")))), dtb__345))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCoreCodegen_dgenConArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__346, dtb__347) -> (match dtb__346 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__348, dtb__349) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__349) then (((v_Vuna_dCompiler_dCoreCodegen_dgenConArgs mc0) mc1) dtb__347) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm mc0) mc1) dtb__348)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__350, dtb__351) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenConArgs dtb__351) mc1) dtb__347)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__352, dtb__353) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__350, dtb__352)), dtb__353))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc0))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dgenConApp = (fun st -> (fun binders -> (fun c -> (fun args -> (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__354) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenConArgs st) binders) args)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__355, dtb__356) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCoreCodegen_dconAppText ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__354) c)) dtb__355), dtb__356))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_dgenArm = (fun st -> (fun outer -> (fun alt -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dcaseAltName alt)) "") then ((fun bound -> ((fun patText -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm (v_Vuna_dCompiler_dCoreCodegen_daeSt bound)) (v_Vuna_dCompiler_dCoreCodegen_daeEnv bound)) (v_Vuna_dCompiler_dCore_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__357, dtb__358) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__357) "\n")))), dtb__358))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCoreCodegen_daePats bound) with
  | C_Base_dList_dList_Nil -> "_"
  | C_Base_dList_dList_Cons (dtb__359, dtb__360) -> dtb__359
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCoreCodegen_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dcaseAltBinders alt))) else (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dcaseAltName alt)) (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") (v_Vuna_dCompiler_dCore_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__361) -> ((fun bound -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm (v_Vuna_dCompiler_dCoreCodegen_daeSt bound)) (v_Vuna_dCompiler_dCoreCodegen_daeEnv bound)) (v_Vuna_dCompiler_dCore_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363) -> ((fun cname -> ((fun patText -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__362) "\n")))), dtb__363))))) ((v_Vuna_dCompiler_dCoreCodegen_darmPatternText cname) (v_Vuna_dCompiler_dCoreCodegen_daePats bound)))) ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__361) (v_Vuna_dCompiler_dCore_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCoreCodegen_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dcaseAltBinders alt)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_dgenArms = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__364, dtb__365) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenArm mc0) mc1) dtb__364)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__366, dtb__367) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenArms dtb__367) mc1) dtb__365)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat dtb__366) dtb__368), dtb__369))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc0))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dgenCase = (fun st -> (fun binders -> (fun scrut -> (fun alts -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) scrut)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenArms dtb__371) binders) alts)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> ((fun fallback -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(match ") ((bi_concat dtb__370) ((bi_concat " with\n") ((bi_concat dtb__372) ((bi_concat fallback) ")"))))), dtb__373))))) (if (v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenGroupDef = (fun st -> (fun d -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefBody d))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dvalueName (v_Vuna_dCompiler_dElab_ddtDefName d))) ((bi_concat " = ") ((bi_concat (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtDefName d)) (v_Vuna_dCompiler_dCoreCodegen_dgsThunks st)) then "fun () -> " else "")) dtb__374))), dtb__375))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__376, dtb__377) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenGroupDef mc0) dtb__376)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__378, dtb__379) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies dtb__379) dtb__377)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__380, dtb__381) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__378, dtb__380)), dtb__381))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc0))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgenGroup = (fun adj -> (fun st -> (fun group -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies st) group)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (if ((v_Vuna_dCompiler_dCoreCodegen_dgroupNeedsRec adj) group) then "let rec " else "let ")) ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand ") dtb__382)), dtb__383))))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenGroups = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__384, dtb__385) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroup mc0) mc1) dtb__384)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__386, dtb__387) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups mc0) dtb__387) dtb__385)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__388, dtb__389) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__386, dtb__388)), dtb__389))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dioResultTy = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__390, dtb__391, dtb__392) -> (match dtb__390 with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__393) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName dtb__393)) "IO") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__391)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCoreCodegen_dfirstCtorOf = (fun d -> (match (v_Vuna_dCompiler_dElab_ddtDataCtors d) with
  | C_Base_dList_dList_Cons (dtb__394, dtb__395) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), (v_Vuna_dCompiler_dElab_ddtCtorName dtb__394)))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dioCtorOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__396, dtb__397) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName (v_Vuna_dCompiler_dElab_ddtDataName dtb__396))) "IO") then (v_Vuna_dCompiler_dCoreCodegen_dfirstCtorOf dtb__396) else (v_Vuna_dCompiler_dCoreCodegen_dioCtorOf dtb__397))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dmainShowErr = fun () -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: main must return Int, String or Bool (M13 limitation)"))

let v_Vuna_dCompiler_dCoreCodegen_dmainShowForName = (fun g -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName g)) "Int") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName g)) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName g)) "Bool") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())))))

let v_Vuna_dCompiler_dCoreCodegen_dmainShow = (fun table -> (fun tyTerm -> (match ((((v_Vuna_dCompiler_dCore_dforce table) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) tyTerm)) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__398) -> (match dtb__398 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__399, dtb__400) -> (match dtb__400 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowForName dtb__399)
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())
)
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())
)
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())
)))

let v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody = (fun program -> ((fun datas -> ((fun defs -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dprepareDtProgram program)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__401, dtb__402) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTypeDecls (v_Vuna_dCompiler_dCoreCodegen_druntimeDatas datas))) (fun typeText -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency dtb__401)) ((v_Vuna_dCompiler_dCoreCodegen_dmkGenSt (v_Vuna_dCompiler_dCoreCodegen_druntimeDatas datas)) dtb__401)) dtb__402)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__403, dtb__404) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_ddtRuntime ())) ((bi_concat "\n") ((bi_concat typeText) ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_ddtListBridge datas)) ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\n\n") dtb__403))))), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__401, (v_Vuna_dCompiler_dCoreCodegen_ddefTable defs)))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf program))) (v_Base_dPair_dfirstOf program)))

let v_Vuna_dCompiler_dCoreCodegen_dgenDtHook = (fun bodyText -> (fun table -> (fun tyTerm -> (fun mainExpr -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__405, dtb__406) -> ((fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat bodyText) ((bi_concat "\n") hook))))) (if printResult then ((bi_concat "let () = print_endline (") ((bi_concat dtb__405) ((bi_concat " (") ((bi_concat mainExpr) "))\n")))) else ((bi_concat "let () = ignore (") ((bi_concat mainExpr) ")\n"))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCoreCodegen_dioRunText = (fun program -> (fun mainRef -> (match (v_Vuna_dCompiler_dCoreCodegen_dioCtorOf (v_Base_dPair_dfirstOf program)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__407) -> (match dtb__407 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__408, dtb__409) -> ((bi_concat "match ") ((bi_concat mainRef) ((bi_concat " with ") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__408) dtb__409)) " f -> f 0"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgenerateDtProgram = (fun program -> (fun printResult -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody program)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__410, dtb__411) -> (match dtb__411 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__412, dtb__413) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtDef "main") dtb__412) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: no main definition"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__414) -> ((fun mainTy -> ((fun mainRef -> (match (v_Vuna_dCompiler_dCoreCodegen_dioResultTy mainTy) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__415) -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook dtb__410) dtb__413) dtb__415) ((v_Vuna_dCompiler_dCoreCodegen_dioRunText program) mainRef)) printResult)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook dtb__410) dtb__413) mainTy) mainRef) printResult)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCoreCodegen_dvalueName "main"))) (v_Vuna_dCompiler_dElab_ddtDefType dtb__414))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dcheckDtProgram = (fun program -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody program)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (0)))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan = fun () -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))

let v_Vuna_dCompiler_dCoreCodegen_dentryOwner = fun () -> "Main"

let v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner = fun () -> "Vuna_builtins"

let v_Vuna_dCompiler_dCoreCodegen_druntimeUnit = fun () -> "Vuna_runtime"

let v_Vuna_dCompiler_dCoreCodegen_dbuiltinUnit = fun () -> "Vuna_builtins"

let v_Vuna_dCompiler_dCoreCodegen_dsplitUnitOfModule = (fun modName -> (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName modName))

let v_Vuna_dCompiler_dCoreCodegen_dbuiltinClassNames = fun () -> (C_Base_dList_dList_Cons ("Show", (C_Base_dList_dList_Cons ("Eq", (C_Base_dList_dList_Cons ("Ord", C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dCoreCodegen_dbuiltinMethodNames = fun () -> (C_Base_dList_dList_Cons ("show", (C_Base_dList_dList_Cons ("eq", (C_Base_dList_dList_Cons ("neq", (C_Base_dList_dList_Cons ("lt", (C_Base_dList_dList_Cons ("le", (C_Base_dList_dList_Cons ("gt", (C_Base_dList_dList_Cons ("ge", C_Base_dList_dList_Nil))))))))))))))

let v_Vuna_dCompiler_dCoreCodegen_disBuiltinClassName = (fun n -> ((v_Base_dList_dmemName n) (v_Vuna_dCompiler_dCoreCodegen_dbuiltinClassNames ())))

let v_Vuna_dCompiler_dCoreCodegen_disBuiltinInstanceName = (fun n -> (if (if ((v_Base_dString_dstartsWith "Show_Show_") n) then true else ((v_Base_dString_dstartsWith "Eq_Eq_") n)) then true else ((v_Base_dString_dstartsWith "Ord_Ord_") n)))

let v_Vuna_dCompiler_dCoreCodegen_dsplitAnonInstName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__416, dtb__417) -> ((v_Base_dString_dstartsWith "#") dtb__417)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitInstPrefixOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__418, dtb__419) -> (if ((bi_eq_generic dtb__418) C_Base_dList_dList_Nil) then "" else ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__418)) "."))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitExprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__420, dtb__421) -> dtb__420
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__422, dtb__423) -> (bi_strFromInt dtb__422)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__424, dtb__425) -> dtb__424
  | _ -> "X"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitArgSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__426, dtb__427) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dsplitExprNameFor dtb__426)) (v_Vuna_dCompiler_dCoreCodegen_dsplitArgSuffix dtb__427)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedInstName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__428, dtb__429, dtb__430) -> (match dtb__428 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__431, dtb__432) -> ((bi_concat dtb__431) (v_Vuna_dCompiler_dCoreCodegen_dsplitArgSuffix dtb__429))
  | _ -> "Inst"
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__433, dtb__434) -> dtb__433
  | _ -> "Inst"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceName = (fun cname -> (fun mname -> (fun headExpr -> (match mname with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedInstName headExpr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__435) -> (if (v_Vuna_dCompiler_dCoreCodegen_dsplitAnonInstName dtb__435) then ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dsplitInstPrefixOf dtb__435)) ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedInstName headExpr)))) else dtb__435)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dheadClassName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__436, dtb__437, dtb__438) -> (match dtb__436 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__439, dtb__440) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__439))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__441, dtb__442) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__441))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCoreCodegen_dmodulePrefixOfName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__443, dtb__444) -> (v_Vuna_dCompiler_dCommon_djoinDots dtb__443)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__445, dtb__446) -> (match dtb__445 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__447, dtb__448, dtb__449) -> (C_Base_dList_dList_Cons (dtb__447, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__446)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__450, dtb__451, dtb__452, dtb__453) -> (C_Base_dList_dList_Cons (dtb__450, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__446)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__454, dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (C_Base_dList_dList_Cons (dtb__454, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__446)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__460, dtb__461, dtb__462, dtb__463, dtb__464) -> (C_Base_dList_dList_Cons (dtb__460, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__446)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__465, dtb__466, dtb__467, dtb__468) -> (C_Base_dList_dList_Cons (dtb__465, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__446)))
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__446)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__469, dtb__470) -> (match dtb__469 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__471, dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (C_Base_dList_dList_Cons (dtb__471, (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__470)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__477, dtb__478, dtb__479, dtb__480, dtb__481) -> (C_Base_dList_dList_Cons (dtb__477, (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__470)))
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__470)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__482, dtb__483) -> ((fun headExpr -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceName dtb__482) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) headExpr), mc0)), ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners mc0) mc1) mc2) dtb__483)))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__482, (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (mc1, (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))), ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (p, (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))))) mc2))), (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnerOf = (fun owner -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488) -> (match (v_Vuna_dCompiler_dCoreCodegen_dheadClassName dtb__486) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__489) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceName dtb__489) dtb__484) dtb__486), owner)), C_Base_dList_dList_Nil))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__490, dtb__491, dtb__492, dtb__493, dtb__494, dtb__495) -> ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners owner) dtb__490) dtb__491) dtb__494)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners owner) dtb__496) dtb__497) dtb__499)
  | _ -> C_Base_dList_dList_Nil
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__501, dtb__502) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnerOf mc0) dtb__501)) ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo mc0) dtb__502))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__503, dtb__504) -> (match dtb__503 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__505, dtb__506) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, dtb__505)))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__506))) ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo dtb__505) dtb__506)) (v_Vuna_dCompiler_dCoreCodegen_dsplitOwnerEntriesOfModules dtb__504)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__507, dtb__508) -> (match dtb__507 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__509, dtb__510) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, dtb__509)))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__510))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerEntriesOfModules dtb__508))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDictClass = (fun name -> (if ((v_Base_dString_dstartsWith "Dict_") name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Base_dString_dsubstring 5) ((bi_sub (bi_strLength name)) 5)) name))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dCoreCodegen_dlookupModuleOf = (fun pairs -> (fun name -> ((v_Base_dList_dlookupPair name) pairs)))

let v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr = (fun knownModules -> (fun what -> (fun name -> ((fun prefix -> (if ((v_Base_dList_dmemName prefix) knownModules) then (C_Base_dResult_dResult_Base_dResult_dOk (prefix)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: `") ((bi_concat what) ((bi_concat "` ") ((bi_concat name) ((bi_concat " has module prefix `") ((bi_concat prefix) "` but no such module")))))))))) (v_Vuna_dCompiler_dCoreCodegen_dmodulePrefixOfName name)))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerOf = (fun dataOwners -> (fun knownModules -> (fun entryDataNames -> (fun d -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlookupModuleOf dataOwners) (v_Vuna_dCompiler_dElab_ddtDataName d)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__511) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__511))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dCoreCodegen_dsplitDictClass (v_Vuna_dCompiler_dElab_ddtDataName d)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__512) -> (if (v_Vuna_dCompiler_dCoreCodegen_disBuiltinClassName dtb__512) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ()))) else (((v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr knownModules) "data") dtb__512))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot (v_Vuna_dCompiler_dElab_ddtDataName d)) then (((v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr knownModules) "data") (v_Vuna_dCompiler_dElab_ddtDataName d)) else (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtDataName d)) entryDataNames) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for data `") ((bi_concat (v_Vuna_dCompiler_dElab_ddtDataName d)) "`"))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwnerOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__513, dtb__514) -> (match dtb__513 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__515, dtb__516) -> (if ((v_Base_dString_dstartsWith ((bi_concat "Show_Show_") dtb__515)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__516)) else (if ((v_Base_dString_dstartsWith ((bi_concat "Eq_Eq_") dtb__515)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__516)) else (if ((v_Base_dString_dstartsWith ((bi_concat "Ord_Ord_") dtb__515)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__516)) else ((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwnerOf dtb__514) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDefOwnerOf = (fun defOwners -> (fun dataOwners -> (fun knownModules -> (fun entryNames -> (fun name -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlookupModuleOf defOwners) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__517) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__517))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dCoreCodegen_dbuiltinMethodNames ())) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ()))) else (match ((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwnerOf dataOwners) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__518) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__518))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (((v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr knownModules) "definition") name) else (if ((v_Base_dList_dmemName name) entryNames) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))) else (if (v_Vuna_dCompiler_dCoreCodegen_disBuiltinInstanceName name) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ()))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for definition `") ((bi_concat name) "`")))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCoreCodegen_dsmDefOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__519, dtb__520, dtb__521, dtb__522) -> dtb__519
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsmDataOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__523, dtb__524, dtb__525, dtb__526) -> dtb__524
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsmKnownModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__527, dtb__528, dtb__529, dtb__530) -> dtb__529
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsmEntryNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__531, dtb__532, dtb__533, dtb__534) -> dtb__534
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitMetaOf = (fun modules -> (fun entryDecls -> ((fun knownModules -> ((fun entryNames -> ((fun defOwners -> ((fun dataOwners -> (C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (defOwners, dataOwners, knownModules, entryNames))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerEntriesOfModules modules)) ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames entryDecls))))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCoreCodegen_dsplitOwnerEntriesOfModules modules)) ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))))) entryNames)) ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ())) entryDecls))))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames entryDecls))) ((v_Base_dList_dmap (fun p -> (v_Base_dPair_dfirstOf p))) modules))))

let rec v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDefs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__535, dtb__536) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCoreCodegen_dsplitDefOwnerOf (v_Vuna_dCompiler_dCoreCodegen_dsmDefOwners mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmDataOwners mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmKnownModules mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmEntryNames mc0)) (v_Vuna_dCompiler_dElab_ddtDefName dtb__535))) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDefs mc0) dtb__536)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName dtb__535), o)), ps))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDatas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__537, dtb__538) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerOf (v_Vuna_dCompiler_dCoreCodegen_dsmDataOwners mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmKnownModules mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmEntryNames mc0)) dtb__537)) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDatas mc0) dtb__538)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName dtb__537), o)), ps))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__539, dtb__540) -> (match dtb__539 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__541, dtb__542) -> (if ((bi_eq_str dtb__541) mc1) then dtb__542 else ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf dtb__540) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_ddatasInUnit = (fun pairs -> (fun u -> (fun datas -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf pairs) (v_Vuna_dCompiler_dElab_ddtDataName d))) u))) datas))))

let v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit = (fun pairs -> (fun u -> (fun defs -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf pairs) (v_Vuna_dCompiler_dElab_ddtDefName d))) u))) defs))))

let rec v_Vuna_dCompiler_dCoreCodegen_dopenHeader = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__543, dtb__544) -> ((bi_concat "open ") ((bi_concat dtb__543) ((bi_concat "\n") (v_Vuna_dCompiler_dCoreCodegen_dopenHeader dtb__544))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgenTypeDeclsOf = (fun allDatas -> (fun subset -> (match subset with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((fun table -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl table) allDatas)) subset)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat "type ") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand ") parts)) "\n\n"))))))) ((v_Vuna_dCompiler_dCoreCodegen_dusedTableFix allDatas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), C_Base_dList_dList_Nil)))) allDatas)))
)))

let v_Vuna_dCompiler_dCoreCodegen_dsplitUnitText = (fun allDatas -> (fun allDefs -> (fun unitDatas -> (fun unitDefs -> (fun bridgeText -> (fun opens -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenTypeDeclsOf allDatas) unitDatas)) (fun typeText -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs unitDefs)) (fun groups -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency unitDefs)) ((v_Vuna_dCompiler_dCoreCodegen_dmkGenSt allDatas) allDefs)) groups)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__545, dtb__546) -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dopenHeader opens)) ((bi_concat typeText) ((bi_concat bridgeText) ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\n\n") dtb__545)) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitListBridgeFor = (fun allDatas -> (fun dataPairs -> (fun unit -> (match (v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData allDatas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__547) -> (if ((bi_eq_str ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf dataPairs) (v_Vuna_dCompiler_dElab_ddtDataName dtb__547))) unit) then (v_Vuna_dCompiler_dCoreCodegen_ddtListBridge allDatas) else "")
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitModuleFiles = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__548, dtb__549) -> (match dtb__548 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__550, dtb__551) -> ((fun unit -> ((fun unitDatas -> ((fun unitDefs -> ((fun bridge -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitUnitText mc0) mc1) unitDatas) unitDefs) bridge) ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_druntimeUnit ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinUnit ()), C_Base_dList_dList_Nil))))) mc4))) (fun text -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitModuleFiles mc0) mc1) mc2) mc3) ((v_Base_dList_dappend mc4) (C_Base_dList_dList_Cons (unit, C_Base_dList_dList_Nil)))) dtb__549)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile (((bi_concat unit) ".ml"), text)), tail))))))))) (((v_Vuna_dCompiler_dCoreCodegen_dsplitListBridgeFor mc0) mc3) dtb__550))) (((v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit mc2) dtb__550) mc1))) (((v_Vuna_dCompiler_dCoreCodegen_ddatasInUnit mc3) dtb__550) mc0))) (v_Vuna_dCompiler_dCoreCodegen_dsplitUnitOfModule dtb__550))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitMainHook = (fun allDatas -> (fun allDefs -> (fun printResult -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtDef "main") allDefs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: no main definition"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__552) -> ((fun table -> ((fun mainRef -> (match (v_Vuna_dCompiler_dCoreCodegen_dioResultTy (v_Vuna_dCompiler_dElab_ddtDefType dtb__552)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__553) -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook "") table) dtb__553) ((v_Vuna_dCompiler_dCoreCodegen_dioRunText (C_Base_dPair_dPair_Base_dPair_dPair (allDatas, allDefs))) mainRef)) printResult)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook "") table) (v_Vuna_dCompiler_dElab_ddtDefType dtb__552)) mainRef) printResult)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCoreCodegen_dvalueName "main"))) (v_Vuna_dCompiler_dCoreCodegen_ddefTable allDefs))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitMainFile = (fun allDatas -> (fun allDefs -> (fun defPairs -> (fun printResult -> (fun opens -> ((fun entryDefs -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs entryDefs)) (fun groups -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency entryDefs)) ((v_Vuna_dCompiler_dCoreCodegen_dmkGenSt allDatas) allDefs)) groups)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__554, dtb__555) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dsplitMainHook allDatas) allDefs) printResult)) (fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile ("Main.ml", ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dopenHeader opens)) ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\n\n") dtb__554)) ((bi_concat "\n") hook)))))))))
  | _ -> failwith "DT: impossible branch"
)))))) (((v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit defPairs) (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ())) allDefs)))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenerateDtSplitProgram = (fun modules -> (fun entryDecls -> (fun prog -> (fun printResult -> ((fun allDatas -> ((fun allDefs -> ((fun runtimeAll -> ((fun table -> (match ((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs table) allDefs) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__556, dtb__557) -> ((fun allTypeNames -> ((fun meta -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure allTypeNames) dtb__556)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDefs meta) dtb__556)) (fun defPairs -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDatas meta) allDatas)) (fun dataPairs -> ((fun builtinDatas -> ((fun builtinDefs -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitUnitText runtimeAll) dtb__556) builtinDatas) builtinDefs) "") (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_druntimeUnit ()), C_Base_dList_dList_Nil)))) (fun builtinText -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitModuleFiles runtimeAll) dtb__556) defPairs) dataPairs) C_Base_dList_dList_Nil) modules)) (fun moduleFiles -> ((fun unitNames -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCoreCodegen_dsplitMainFile runtimeAll) dtb__556) defPairs) printResult) ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_druntimeUnit ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinUnit ()), C_Base_dList_dList_Nil))))) unitNames))) (fun mainFile -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile ("Vuna_runtime.ml", (v_Vuna_dCompiler_dCoreCodegen_ddtRuntime ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile ("Vuna_builtins.ml", builtinText)), ((v_Base_dList_dappend moduleFiles) (C_Base_dList_dList_Cons (mainFile, C_Base_dList_dList_Nil)))))))))))) ((v_Base_dList_dmap (fun p -> (v_Vuna_dCompiler_dCoreCodegen_dsplitUnitOfModule (v_Base_dPair_dfirstOf p)))) modules))))))) (((v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit defPairs) (v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ())) dtb__556))) (((v_Vuna_dCompiler_dCoreCodegen_ddatasInUnit dataPairs) (v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ())) runtimeAll))))))))) ((v_Vuna_dCompiler_dCoreCodegen_dsplitMetaOf modules) entryDecls))) ((v_Base_dList_dappend dtb__557) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName) allDatas)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCoreCodegen_ddefTable allDefs))) (v_Vuna_dCompiler_dCoreCodegen_druntimeDatas allDatas))) (v_Vuna_dCompiler_dElab_ddtProgDefs prog))) (v_Vuna_dCompiler_dElab_ddtProgDatas prog))))))
