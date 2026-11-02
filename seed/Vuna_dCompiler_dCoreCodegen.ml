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
type t_Vuna_dCompiler_dCoreCodegen_dGenSt = C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt of (string t_Base_dList_dList) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * ((string, bool t_Base_dList_dList) t_Base_dPair_dPair t_Base_dList_dList) * (int) * (string t_Base_dList_dList)
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

let rec v_Vuna_dCompiler_dCoreCodegen_disTypeForming = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__12) -> true
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dCoreCodegen_disTypeForming ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__17) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__13, 0, C_Base_dList_dList_Nil))))))
  | _ -> false
))

let v_Vuna_dCompiler_dCoreCodegen_disTypeLevelDef = (fun table -> (fun d -> (v_Vuna_dCompiler_dCoreCodegen_disTypeForming ((((v_Vuna_dCompiler_dCore_dforce table) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefType d))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if ((v_Vuna_dCompiler_dCoreCodegen_disTypeLevelDef mc0) dtb__18) then ((((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo mc0) dtb__19) mc2) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_ddtDefName dtb__18), mc3))) else ((((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo mc0) dtb__19) (C_Base_dList_dList_Cons (dtb__18, mc2))) mc3))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc2), (v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs = (fun table -> (fun defs -> ((((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo table) defs) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint = (fun m -> ((bi_concat " ?") (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCoreCodegen_dbinderAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20)) else ((v_Vuna_dCompiler_dCoreCodegen_dbinderAt ((bi_sub mc0) 1)) dtb__21))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckErasure = (fun typeNames -> (fun binders -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__22, dtb__23) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dbinderAt dtb__23) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (match dtb__24 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__26) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level binding `") ((bi_concat dtb__22) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unbound runtime variable ") ((bi_concat dtb__22) ((bi_concat " (index ") ((bi_concat (bi_strFromInt dtb__23)) ((bi_concat ", binders ") ((bi_concat (bi_strFromInt (v_Base_dList_dlength binders))) ")"))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__27) -> (if ((v_Base_dList_dmemName dtb__27) typeNames) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level name `") ((bi_concat dtb__27) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__28) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__34) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: unsolved metavariable in runtime code") (v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint dtb__34))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__35, dtb__36, dtb__37) -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36)), binders))) dtb__37)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__38, dtb__39, dtb__40) -> (match (v_Vuna_dCompiler_dCoreCodegen_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> (match dtb__41 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames) binders) dtb__43)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__40) then (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__38) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__38)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__39))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__44, dtb__45) -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames) binders) dtb__45)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__46, dtb__47) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__46)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure typeNames) binders) dtb__47)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__48) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__49) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__50) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__51, dtb__52, dtb__53) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__51)) (fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__52)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) binders) dtb__53)))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__57) then (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure mc0) mc1) dtb__55) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure mc0) mc1) dtb__56)) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure mc0) mc1) dtb__55))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__58, dtb__59) -> ((fun altBinders -> ((fun env -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure mc0) env) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__58))) (fun _u -> (((v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure mc0) mc1) dtb__59)))) ((v_Base_dList_dappend (v_Base_dList_dreverse altBinders)) mc1))) (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__58))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dcheckOneErasure = (fun typeNames -> (fun d -> (match (((v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefBody d)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__60) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "in `") ((bi_concat (v_Vuna_dCompiler_dElab_ddtDefName d)) ((bi_concat "`: ") dtb__60)))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__61) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__61))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__62, dtb__63) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckOneErasure mc0) dtb__62)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure mc0) dtb__63)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_daddName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if ((bi_eq_str dtb__64) mc0) then (C_Base_dList_dList_Cons (dtb__64, dtb__65)) else (C_Base_dList_dList_Cons (dtb__64, ((v_Vuna_dCompiler_dCoreCodegen_daddName mc0) dtb__65))))
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (mc0, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto = (fun runtimeNames -> (fun acc -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__66) -> (if ((v_Base_dList_dmemName dtb__66) runtimeNames) then ((v_Vuna_dCompiler_dCoreCodegen_daddName dtb__66) acc) else acc)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__67, dtb__68) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__69) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__70) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__76, dtb__77, dtb__78) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__78)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__79, dtb__80, dtb__81) -> (match (v_Vuna_dCompiler_dCoreCodegen_dflattenConApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (match dtb__82 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__84) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames) acc) dtb__84)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__81) then (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__79) else (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__79)) dtb__80))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__85, dtb__86) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames) acc) dtb__86)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__87, dtb__88) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__87)) dtb__88)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__89) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__90) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__91) -> acc
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__92, dtb__93, dtb__94) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames) acc) dtb__92)) dtb__93)) dtb__94)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (match dtb__95 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__98) then (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs mc0) mc1) dtb__96) else (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs mc0) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto mc0) mc1) dtb__97)) dtb__96))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts mc0) (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto mc0) mc1) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__99))) dtb__100)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_ddtDefName dtb__101), (v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf dtb__102)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dlookupDtDef = (fun defs -> (fun name -> ((v_Vuna_dCompiler_dCoreCodegen_dfindDtDef name) defs)))

let rec v_Vuna_dCompiler_dCoreCodegen_dneighborsOf = (fun adj -> (fun name -> (match adj with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__103 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (if ((bi_eq_str dtb__105) name) then dtb__106 else ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf dtb__104) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_ddependentsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> ((fun dep -> (if ((v_Base_dList_dmemName mc0) dtb__110) then (C_Base_dList_dList_Cons (dtb__109, dep)) else dep)) ((v_Vuna_dCompiler_dCoreCodegen_ddependentsOf mc0) dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dreverseAdj = (fun names -> (fun adj -> ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, ((v_Vuna_dCompiler_dCoreCodegen_ddependentsOf n) adj))))) names)))

let rec v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if ((v_Base_dList_dmemName dtb__111) mc2) then ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost mc0) dtb__112) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsPost mc0) dtb__111) (C_Base_dList_dList_Cons (dtb__111, mc2))) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost mc0) dtb__112) dtb__113) dtb__114)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_ddfsPost = (fun adj -> (fun n -> (fun visited -> (fun order -> (match ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost adj) ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf adj) n)) visited) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, (C_Base_dList_dList_Cons (n, dtb__116))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dpostOrder = (fun adj -> (fun nodes -> (fun visited -> (fun order -> (match nodes with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | C_Base_dList_dList_Cons (dtb__117, dtb__118) -> (if ((v_Base_dList_dmemName dtb__117) visited) then ((((v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj) dtb__118) visited) order) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsPost adj) dtb__117) (C_Base_dList_dList_Cons (dtb__117, visited))) order) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> ((((v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj) dtb__118) dtb__119) dtb__120)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (if ((v_Base_dList_dmemName dtb__121) mc2) then ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect mc0) dtb__122) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsCollect mc0) dtb__121) (C_Base_dList_dList_Cons (dtb__121, mc2))) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, dtb__124) -> ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect mc0) dtb__122) dtb__123) dtb__124)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_ddfsCollect = (fun revAdj -> (fun n -> (fun visited -> (fun comp -> (match ((((v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect revAdj) ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf revAdj) n)) visited) comp) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, (C_Base_dList_dList_Cons (n, dtb__126))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dcollectComps = (fun revAdj -> (fun nodes -> (fun visited -> (fun comps -> (match nodes with
  | C_Base_dList_dList_Nil -> comps
  | C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (if ((v_Base_dList_dmemName dtb__127) visited) then ((((v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj) dtb__128) visited) comps) else (match ((((v_Vuna_dCompiler_dCoreCodegen_ddfsCollect revAdj) dtb__127) (C_Base_dList_dList_Cons (dtb__127, visited))) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> ((((v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj) dtb__128) dtb__129) (C_Base_dList_dList_Cons (dtb__130, comps)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dcomponentOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (if ((v_Base_dList_dmemName mc1) dtb__131) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131)) else ((v_Vuna_dCompiler_dCoreCodegen_dcomponentOf dtb__132) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dfilterNames = (fun pred -> (fun names -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (if (pred dtb__133) then (C_Base_dList_dList_Cons (dtb__133, ((v_Vuna_dCompiler_dCoreCodegen_dfilterNames pred) dtb__134))) else ((v_Vuna_dCompiler_dCoreCodegen_dfilterNames pred) dtb__134))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (if ((v_Base_dList_dmemName dtb__135) mc3) then ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo mc0) mc1) dtb__136) mc3) else (match ((v_Vuna_dCompiler_dCoreCodegen_dcomponentOf mc0) dtb__135) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCoreCodegen_dfilterNames (fun m -> ((v_Base_dList_dmemName m) dtb__137))) mc1), ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo mc0) mc1) dtb__136) ((v_Base_dList_dappend dtb__137) mc3))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo mc0) mc1) dtb__136) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dgroupsFromComps = (fun comps -> (fun names -> ((((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo comps) names) names) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCoreCodegen_dnotIn = (fun name -> (fun names -> (if ((v_Base_dList_dmemName name) names) then false else true)))

let rec v_Vuna_dCompiler_dCoreCodegen_duniqueNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (if ((bi_eq_str dtb__138) "") then (v_Vuna_dCompiler_dCoreCodegen_duniqueNames dtb__139) else (if ((v_Base_dList_dmemName dtb__138) dtb__139) then (v_Vuna_dCompiler_dCoreCodegen_duniqueNames dtb__139) else (C_Base_dList_dList_Cons (dtb__138, (v_Vuna_dCompiler_dCoreCodegen_duniqueNames dtb__139)))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgroupDeps = (fun adj -> (fun group -> ((v_Vuna_dCompiler_dCoreCodegen_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCoreCodegen_dnotIn n) group))) (v_Vuna_dCompiler_dCoreCodegen_duniqueNames ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCoreCodegen_dneighborsOf adj)) group)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dallIn = (fun names -> (fun allowed -> (match names with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if ((v_Base_dList_dmemName dtb__140) allowed) then ((v_Vuna_dCompiler_dCoreCodegen_dallIn dtb__141) allowed) else false)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgroupReady = (fun adj -> (fun group -> (fun emitted -> ((v_Vuna_dCompiler_dCoreCodegen_dallIn ((v_Vuna_dCompiler_dCoreCodegen_dgroupDeps adj) group)) emitted))))

let rec v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (if (((v_Vuna_dCompiler_dCoreCodegen_dgroupReady mc0) dtb__142) mc3) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, ((v_Base_dList_dappend (v_Base_dList_dreverse mc2)) dtb__143))))) else ((((v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc mc0) dtb__143) (C_Base_dList_dList_Cons (dtb__142, mc2))) mc3))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dpickReady = (fun adj -> (fun groups -> (fun emitted -> ((((v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc adj) groups) C_Base_dList_dList_Nil) emitted))))

let rec v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> (match (((v_Vuna_dCompiler_dCoreCodegen_dpickReady mc0) mc1) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: dependency cycle between runtime definitions"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (match dtb__144 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, dtb__146) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc mc0) dtb__146) ((v_Base_dList_dappend dtb__145) mc2))) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__145, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
))))

let v_Vuna_dCompiler_dCoreCodegen_dorderGroups = (fun adj -> (fun groups -> (((v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc adj) groups) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency = (fun defs -> ((fun names -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName d), (((v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto names) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefBody d)))))) defs)) (v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf defs)))

let rec v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlookupDtDef mc0) dtb__147) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf mc0) dtb__148)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (C_Base_dList_dList_Cons (dtb__149, ((v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf mc0) dtb__148)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun adj -> ((fun revAdj -> (match ((((v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj) names) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> ((fun comps -> ((fun groups -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dorderGroups adj) groups)) (fun ordered -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf defs)) ordered)))))) ((v_Vuna_dCompiler_dCoreCodegen_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj) dtb__151) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCoreCodegen_dreverseAdj names) adj))) (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency defs))) (v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf defs)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckNoDupOcamlNames = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (if ((v_Base_dList_dmemName dtb__152) dtb__153) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: OCaml name collision among ") ((bi_concat mc0) ((bi_concat "s: `") ((bi_concat dtb__152) "`")))))) else ((v_Vuna_dCompiler_dCoreCodegen_dcheckNoDupOcamlNames mc0) dtb__153))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__154, dtb__155) -> (if ((bi_ge_int dtb__155) 0) then (if ((bi_lt_int dtb__155) depth) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: out-of-scope de Bruijn index ") ((bi_concat (bi_strFromInt dtb__155)) ((bi_concat " (depth ") ((bi_concat (bi_strFromInt depth)) ")"))))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: negative de Bruijn index ") (bi_strFromInt dtb__155)))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__156) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__157) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__158) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__159) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__160) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__161) -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__162, dtb__163, dtb__164) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__164) then ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__162) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__162)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__163))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopesArgs depth) dtb__166)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__167, dtb__168, dtb__169) -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes ((bi_add depth) 1)) dtb__169)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__173)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes ((bi_add depth) 1)) dtb__174)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__175, dtb__176, dtb__177) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__175)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__176)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__177)))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__178, dtb__179) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes depth) dtb__178)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckAltScopes depth) dtb__179)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopesArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (match dtb__180 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__183) then ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopesArgs mc0) dtb__181) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes mc0) dtb__182)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopesArgs mc0) dtb__181))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCoreCodegen_dcheckAltScopes = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__184, dtb__185) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__184)))) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__184))) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckAltScopes mc0) dtb__185)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckTermScopes 0) (v_Vuna_dCompiler_dElab_ddtDefBody dtb__186))) (fun _u -> (v_Vuna_dCompiler_dCoreCodegen_dcheckAllDefScopes dtb__187)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

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
  | C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (if (v_Vuna_dCompiler_dCore_drigIsErased (v_Base_dPair_dsecondOf dtb__188)) then (C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevelsGo dtb__189) ((bi_add mc1) 1)))) else ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevelsGo dtb__189) ((bi_add mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevelsGo (v_Vuna_dCompiler_dElab_ddtDataParams d)) 0))

let rec v_Vuna_dCompiler_dCoreCodegen_dfindDtData = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtDataName dtb__190)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__190)) else ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData mc0) dtb__191))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dmemInt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (if ((bi_eq_int dtb__192) mc0) then true else ((v_Vuna_dCompiler_dCoreCodegen_dmemInt mc0) dtb__193))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dlevelSlotGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__194, dtb__195) -> (if ((bi_eq_int dtb__194) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCoreCodegen_dlevelSlotGo dtb__195) mc1) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dlevelSlot = (fun levels -> (fun lvl -> (((v_Vuna_dCompiler_dCoreCodegen_dlevelSlotGo levels) lvl) 0)))

let rec v_Vuna_dCompiler_dCoreCodegen_dnthValue = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__196)) else ((v_Vuna_dCompiler_dCoreCodegen_dnthValue dtb__197) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dlookupUsed = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__198)) mc1) then (v_Base_dPair_dsecondOf dtb__198) else ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed dtb__199) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if dtb__201 then (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__204) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__200, lvl, C_Base_dList_dList_Nil)))))) else ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) lvl) dtb__203)) (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) ((bi_add lvl) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__204) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__200, lvl, C_Base_dList_dList_Nil))))))))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__205) -> (match dtb__205 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__206, dtb__207, dtb__208) -> ((v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCoreCodegen_dmemInt dtb__207) tps) then (C_Base_dList_dList_Cons (dtb__207, C_Base_dList_dList_Nil)) else C_Base_dList_dList_Nil)) (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine tps) table) datas) lvl) dtb__208))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__209, dtb__210) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData dtb__209) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__211) -> ((((((v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs tps) table) datas) lvl) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) dtb__209)) dtb__210)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine tps) table) datas) lvl) dtb__210)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dList_dList_Nil
))))))
and v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__212, dtb__213) -> ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels mc0) mc1) mc2) mc3) dtb__212)) (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedSpine mc0) mc1) mc2) mc3) dtb__213))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs = (fun tps -> (fun table -> (fun datas -> (fun lvl -> (fun usedPats -> (fun args -> (match usedPats with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__214, dtb__215) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dnthValue args) dtb__214) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216) -> ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels tps) table) datas) lvl) dtb__216)) ((((((v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs tps) table) datas) lvl) dtb__215) args))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCoreCodegen_dcollectFamilyArgs tps) table) datas) lvl) dtb__215) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match dtb__217 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__219, dtb__220) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__220) then ((((((v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels mc0) mc1) mc2) dtb__218) ((bi_add mc4) 1)) next) else ((v_Base_dList_dappend (((((v_Vuna_dCompiler_dCoreCodegen_dcollectUsedLevels mc0) mc1) mc2) mc4) dtb__224)) ((((((v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels mc0) mc1) mc2) dtb__218) ((bi_add mc4) 1)) next)))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__225) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__221, mc4, C_Base_dList_dList_Nil))))))
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCoreCodegen_ddataUsedLevels = (fun d -> (fun table -> (fun datas -> ((fun raw -> ((v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCoreCodegen_dmemInt l) raw))) (v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevels d))) ((v_Base_dList_dconcatMap (fun c -> ((((((v_Vuna_dCompiler_dCoreCodegen_dctorUsedLevels (v_Vuna_dCompiler_dCoreCodegen_dtypeParamLevels d)) table) datas) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType c))))) (v_Vuna_dCompiler_dElab_ddtDataCtors d))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dsameLevelTable = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__226, dtb__227) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (if (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__226)) (v_Base_dPair_dfirstOf dtb__228)) then ((bi_eq_generic (v_Base_dPair_dsecondOf dtb__226)) (v_Base_dPair_dsecondOf dtb__228)) else false) then ((v_Vuna_dCompiler_dCoreCodegen_dsameLevelTable dtb__227) dtb__229) else false)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dusedTableFix = (fun datas -> (fun table -> ((fun next -> (if ((v_Vuna_dCompiler_dCoreCodegen_dsameLevelTable next) table) then next else ((v_Vuna_dCompiler_dCoreCodegen_dusedTableFix datas) next))) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), (((v_Vuna_dCompiler_dCoreCodegen_ddataUsedLevels d) table) datas))))) datas))))

let v_Vuna_dCompiler_dCoreCodegen_dctorKeepFlags = (fun c -> ((v_Base_dList_dmap (fun b -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dCore_drigIsErased (v_Base_dPair_dsecondOf b))))) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)))

let v_Vuna_dCompiler_dCoreCodegen_dflagMatchesRig = (fun keep -> (fun rig -> (if keep then (v_Base_dBool_dnot (v_Vuna_dCompiler_dCore_drigIsErased rig)) else (v_Vuna_dCompiler_dCore_drigIsErased rig))))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorShapeOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__230, dtb__231) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtCtorName c), (v_Vuna_dCompiler_dCoreCodegen_dctorKeepFlags c))))) (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__230))) (v_Vuna_dCompiler_dCoreCodegen_dctorShapeOf dtb__231))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dmaxIntList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__232, dtb__233) -> (if ((bi_ge_int dtb__232) (v_Vuna_dCompiler_dCoreCodegen_dmaxIntList dtb__233)) then dtb__232 else (v_Vuna_dCompiler_dCoreCodegen_dmaxIntList dtb__233))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dparenOne = (fun t -> ((bi_concat "(") ((bi_concat t) ")")))

let rec v_Vuna_dCompiler_dCoreCodegen_dparenList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__234, dtb__235) -> ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_dparenOne dtb__234), C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dCoreCodegen_dparenList dtb__235))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsCtorShapes = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245) -> dtb__243
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsFamilies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__246, dtb__247, dtb__248, dtb__249, dtb__250) -> dtb__246
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__251, dtb__252, dtb__253, dtb__254, dtb__255) -> dtb__254
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsThunks = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260) -> dtb__260
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgsPutNext = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> (C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (dtb__261, dtb__262, dtb__263, mc1, dtb__265))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dctorTableOfData = (fun d -> ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtCtorName c), (v_Vuna_dCompiler_dElab_ddtCtorFamily c))))) (v_Vuna_dCompiler_dElab_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__266, dtb__267) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dCoreCodegen_dctorTableOfData dtb__266)) (v_Vuna_dCompiler_dCoreCodegen_dctorTableOf dtb__267))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_druntimeArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__268, dtb__269, dtb__270) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__269) then (v_Vuna_dCompiler_dCoreCodegen_druntimeArity dtb__270) else ((bi_add 1) (v_Vuna_dCompiler_dCoreCodegen_druntimeArity dtb__270)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCoreCodegen_dthunkable = (fun d -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtDefName d)) "main") then false else ((bi_eq_int (v_Vuna_dCompiler_dCoreCodegen_druntimeArity (v_Vuna_dCompiler_dElab_ddtDefBody d))) 0)))

let v_Vuna_dCompiler_dCoreCodegen_dthunkNames = (fun defs -> ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dElab_ddtDefName d))) ((v_Base_dList_dfilter v_Vuna_dCompiler_dCoreCodegen_dthunkable) defs)))

let v_Vuna_dCompiler_dCoreCodegen_dmkGenSt = (fun datas -> (fun defs -> (C_Vuna_dCompiler_dCoreCodegen_dGenSt_Vuna_dCompiler_dCoreCodegen_dGenSt (((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName) datas), (v_Vuna_dCompiler_dCoreCodegen_dctorTableOf datas), (v_Vuna_dCompiler_dCoreCodegen_dctorShapeOf datas), 0, (v_Vuna_dCompiler_dCoreCodegen_dthunkNames defs)))))

let v_Vuna_dCompiler_dCoreCodegen_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (dtb__271, dtb__272, dtb__273) -> dtb__271
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (dtb__274, dtb__275, dtb__276) -> dtb__275
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (dtb__277, dtb__278, dtb__279) -> dtb__279
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_daltEnvGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__280, dtb__281) -> (match dtb__280 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__282, dtb__283) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__283) then ((((v_Vuna_dCompiler_dCoreCodegen_daltEnvGo mc0) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), mc1))) dtb__281) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCoreCodegen_daltEnvGo ((v_Vuna_dCompiler_dCoreCodegen_dgsPutNext mc0) ((bi_add fresh) 1))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), mc1))) dtb__281) (C_Base_dList_dList_Cons (nm, mc3)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCoreCodegen_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (mc1, (v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_daltEnv = (fun st -> (fun outer -> (fun tele -> ((((v_Vuna_dCompiler_dCoreCodegen_daltEnvGo st) outer) tele) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dCoreCodegen_dcountKept = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__284, dtb__285) -> (if dtb__284 then ((bi_add 1) (v_Vuna_dCompiler_dCoreCodegen_dcountKept dtb__285)) else (v_Vuna_dCompiler_dCoreCodegen_dcountKept dtb__285))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_daltEnvFull = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (fun pats -> (match binders with
  | C_Base_dList_dList_Nil -> (match flags with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (outer, (v_Base_dList_dreverse pats), st))))
  | C_Base_dList_dList_Cons (dtb__286, dtb__287) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch has fewer binders than its shape"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Cons (dtb__288, dtb__289) -> (match dtb__288 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__290, dtb__291) -> (match flags with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch has more binders than its shape"))))
  | C_Base_dList_dList_Cons (dtb__292, dtb__293) -> (if ((v_Vuna_dCompiler_dCoreCodegen_dflagMatchesRig dtb__292) dtb__291) then (if dtb__292 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCoreCodegen_daltEnvFull ((v_Vuna_dCompiler_dCoreCodegen_dgsPutNext st) ((bi_add fresh) 1))) label) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), outer))) dtb__289) dtb__293) (C_Base_dList_dList_Cons (nm, pats)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCoreCodegen_dgsNext st)) else ((((((v_Vuna_dCompiler_dCoreCodegen_daltEnvFull st) label) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), outer))) dtb__289) dtb__293) pats)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder rig disagrees with its shape")))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCoreCodegen_daltEnvKept = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__294, dtb__295) -> (match dtb__294 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__296, dtb__297) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__297) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": kept-field branch has an erased binder")))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCoreCodegen_daltEnvKept ((v_Vuna_dCompiler_dCoreCodegen_dgsPutNext mc0) ((bi_add fresh) 1))) mc1) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), mc2))) dtb__295) (C_Base_dList_dList_Cons (nm, mc4)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCoreCodegen_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCoreCodegen_dAltEnv_Vuna_dCompiler_dCoreCodegen_dAltEnv (mc2, (v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCoreCodegen_daltEnvChecked = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCoreCodegen_daltEnvFull st) label) outer) binders) flags) C_Base_dList_dList_Nil) else (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Vuna_dCompiler_dCoreCodegen_dcountKept flags)) then (((((v_Vuna_dCompiler_dCoreCodegen_daltEnvKept st) label) outer) binders) C_Base_dList_dList_Nil) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder count matches neither full telescope nor kept fields")))))))))))

let v_Vuna_dCompiler_dCoreCodegen_docamlReservedWords = fun () -> (C_Base_dList_dList_Cons ("and", (C_Base_dList_dList_Cons ("as", (C_Base_dList_dList_Cons ("assert", (C_Base_dList_dList_Cons ("asr", (C_Base_dList_dList_Cons ("begin", (C_Base_dList_dList_Cons ("class", (C_Base_dList_dList_Cons ("constraint", (C_Base_dList_dList_Cons ("do", (C_Base_dList_dList_Cons ("done", (C_Base_dList_dList_Cons ("downto", (C_Base_dList_dList_Cons ("else", (C_Base_dList_dList_Cons ("end", (C_Base_dList_dList_Cons ("exception", (C_Base_dList_dList_Cons ("external", (C_Base_dList_dList_Cons ("false", (C_Base_dList_dList_Cons ("for", (C_Base_dList_dList_Cons ("fun", (C_Base_dList_dList_Cons ("function", (C_Base_dList_dList_Cons ("functor", (C_Base_dList_dList_Cons ("if", (C_Base_dList_dList_Cons ("in", (C_Base_dList_dList_Cons ("include", (C_Base_dList_dList_Cons ("inherit", (C_Base_dList_dList_Cons ("initializer", (C_Base_dList_dList_Cons ("land", (C_Base_dList_dList_Cons ("lazy", (C_Base_dList_dList_Cons ("let", (C_Base_dList_dList_Cons ("lor", (C_Base_dList_dList_Cons ("lsl", (C_Base_dList_dList_Cons ("lsr", (C_Base_dList_dList_Cons ("lxor", (C_Base_dList_dList_Cons ("match", (C_Base_dList_dList_Cons ("method", (C_Base_dList_dList_Cons ("mod", (C_Base_dList_dList_Cons ("module", (C_Base_dList_dList_Cons ("mutable", (C_Base_dList_dList_Cons ("new", (C_Base_dList_dList_Cons ("nonrec", (C_Base_dList_dList_Cons ("object", (C_Base_dList_dList_Cons ("of", (C_Base_dList_dList_Cons ("open", (C_Base_dList_dList_Cons ("or", (C_Base_dList_dList_Cons ("private", (C_Base_dList_dList_Cons ("rec", (C_Base_dList_dList_Cons ("sig", (C_Base_dList_dList_Cons ("struct", (C_Base_dList_dList_Cons ("then", (C_Base_dList_dList_Cons ("to", (C_Base_dList_dList_Cons ("true", (C_Base_dList_dList_Cons ("try", (C_Base_dList_dList_Cons ("type", (C_Base_dList_dList_Cons ("val", (C_Base_dList_dList_Cons ("virtual", (C_Base_dList_dList_Cons ("when", (C_Base_dList_dList_Cons ("while", (C_Base_dList_dList_Cons ("with", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCoreCodegen_docamlBinderName = (fun name -> ((fun oc -> (if ((v_Base_dList_dmemName oc) (v_Vuna_dCompiler_dCoreCodegen_docamlReservedWords ())) then ((bi_concat oc) "_") else oc)) (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName name)))

let rec v_Vuna_dCompiler_dCoreCodegen_dalignCtorArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__298, dtb__299) -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__300, dtb__301) -> (match dtb__300 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__302, dtb__303) -> (if dtb__298 then (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__303) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": runtime field marked erased")))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dalignCtorArgs mc0) dtb__299) dtb__301)) (fun ts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__302, dtb__303)), ts))))))) else (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__303) then (((v_Vuna_dCompiler_dCoreCodegen_dalignCtorArgs mc0) dtb__299) dtb__301) else (((v_Vuna_dCompiler_dCoreCodegen_dalignCtorArgs mc0) dtb__299) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__302, dtb__303)), dtb__301)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if dtb__298 then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has fewer arguments than its shape")))) else (((v_Vuna_dCompiler_dCoreCodegen_dalignCtorArgs mc0) dtb__299) C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__304, dtb__305) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has more arguments than its shape"))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__306, dtb__307) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dcaseAltName dtb__306)) "") then true else (v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt dtb__307))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_djoinWith = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__308, dtb__309) -> (match dtb__309 with
  | C_Base_dList_dList_Nil -> dtb__308
  | _ -> ((bi_concat dtb__308) ((bi_concat mc0) ((v_Vuna_dCompiler_dCoreCodegen_djoinWith mc0) dtb__309)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dtypeParamDecl = (fun mc0 -> (if ((bi_eq_int mc0) 0) then "" else ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__310, dtb__311) -> (match dtb__311 with
  | C_Base_dList_dList_Nil -> ((bi_concat dtb__310) " ")
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") nd_uscrut)) ") "))
)
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") nd_uscrut)) ") "))
)) (v_Vuna_dCompiler_dCoreCodegen_dtypeParamNames mc0))))

let v_Vuna_dCompiler_dCoreCodegen_dfamilyTyText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__312, dtb__313) -> (match dtb__313 with
  | C_Base_dList_dList_Nil -> ((bi_concat dtb__312) ((bi_concat " ") (v_Vuna_dCompiler_dCoreCodegen_dtypeName mc0)))
  | _ -> ((bi_concat "(") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith ", ") mc1)) ((bi_concat ") ") (v_Vuna_dCompiler_dCoreCodegen_dtypeName mc0))))
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCoreCodegen_dtypeName mc0)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dctorDeclText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__314, dtb__315) -> (match dtb__315 with
  | C_Base_dList_dList_Nil -> ((bi_concat mc0) ((bi_concat " of ") (v_Vuna_dCompiler_dCoreCodegen_dparenOne dtb__314)))
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
  | C_Base_dList_dList_Cons (dtb__316, dtb__317) -> (match dtb__317 with
  | C_Base_dList_dList_Nil -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat dtb__316) "))"))))
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
  | C_Base_dList_dList_Cons (dtb__318, dtb__319) -> (match dtb__319 with
  | C_Base_dList_dList_Nil -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtDefName dtb__318)) ((v_Vuna_dCompiler_dCoreCodegen_dneighborsOf mc0) (v_Vuna_dCompiler_dElab_ddtDefName dtb__318)))
  | _ -> true
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dlastName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__320, dtb__321) -> dtb__321
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__322, dtb__323) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName (v_Vuna_dCompiler_dElab_ddtCtorName dtb__322))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__322)) else ((v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor mc0) dtb__323))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__324, dtb__325) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName (v_Vuna_dCompiler_dElab_ddtDataName dtb__324))) "List") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__324)) else (v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData dtb__325))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_ddtListBridge = (fun datas -> (match (v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__326) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor "Nil") (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__326)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__327) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindFamilyCtor "Cons") (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__326)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__328) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> ((bi_concat "\nlet dtp_unpack (s : string) =\n") ((bi_concat "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n") ((bi_concat "  List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) cs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_pack xs =\n") ((bi_concat "  let rec to_list xs = match xs with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: to_list rest in\n") ((bi_concat "  let cs = to_list xs in\n") ((bi_concat "  String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "\nlet dtp_listOf xs = List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) xs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_ocamlOf xs =\n") ((bi_concat "  let rec go l = match l with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: go rest in\n") "  go xs\n"))))))))))))))))))))))))))) ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_ddtCtorName dtb__328)))) ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_ddtCtorName dtb__327)))) (v_Vuna_dCompiler_dElab_ddtDataName dtb__326))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dhasListFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__329, dtb__330) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName dtb__329)) "List") then true else (v_Vuna_dCompiler_dCoreCodegen_dhasListFamily dtb__330))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgenGlobalRef = (fun st -> (fun name -> (match ((v_Base_dList_dlookupPair name) (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__331) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__331) name), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dCoreCodegen_dgsThunks st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dvalueName name)) " ())")), st)))) else (if ((bi_eq_str name) "strUnpack") then (if (v_Vuna_dCompiler_dCoreCodegen_dhasListFamily (v_Vuna_dCompiler_dCoreCodegen_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_unpack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strUnpack", st))))) else (if ((bi_eq_str name) "strPack") then (if (v_Vuna_dCompiler_dCoreCodegen_dhasListFamily (v_Vuna_dCompiler_dCoreCodegen_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_pack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strPack", st))))) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dglobalRef name)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (r, st)))))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs = (fun levels -> (fun table -> (fun datas -> (fun usedPats -> (fun args -> (match usedPats with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__332, dtb__333) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dnthValue args) dtb__332) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__334) -> (C_Base_dList_dList_Cons (((((v_Vuna_dCompiler_dCoreCodegen_drenderTypeArg levels) table) datas) dtb__334), (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) dtb__333) args)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) dtb__333) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCoreCodegen_drenderTypeArg = (fun levels -> (fun table -> (fun datas -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__335) -> (match dtb__335 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__336, dtb__337, dtb__338) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlevelSlot levels) dtb__337) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__339) -> (v_Vuna_dCompiler_dCoreCodegen_dtypeParamName dtb__339)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__340, dtb__341) -> (if ((bi_eq_str dtb__340) "Int") then "int" else (if ((bi_eq_str dtb__340) "String") then "string" else (if ((bi_eq_str dtb__340) "Bool") then "bool" else (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName dtb__340)) "Bool") then "bool" else (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData dtb__340) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__342) -> ((v_Vuna_dCompiler_dCoreCodegen_dfamilyTyText dtb__340) (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) dtb__340)) dtb__341))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "unit"
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> "unit"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_drenderPiTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347) -> ((fun next -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__345) then (((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) ((bi_add lvl) 1)) next) else ((bi_concat "(") ((bi_concat (((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) lvl) dtb__346)) ((bi_concat ") -> ") (((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) ((bi_add lvl) 1)) next)))))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__347) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__343, lvl, C_Base_dList_dList_Nil))))))
  | _ -> ((((v_Vuna_dCompiler_dCoreCodegen_drenderTypeArg levels) table) datas) v)
))))))

let v_Vuna_dCompiler_dCoreCodegen_drenderFieldTy = (fun levels -> (fun table -> (fun datas -> (fun lvl -> (fun dom -> (fun slot -> (match dom with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> (if dtb__349 then (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCoreCodegen_drenderPiTy levels) table) datas) lvl) dom), slot)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__353) -> (match dtb__353 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__354, dtb__355, dtb__356) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlevelSlot levels) dtb__355) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__357) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName dtb__357), slot))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__358, dtb__359) -> (if ((bi_eq_str dtb__358) "Int") then (C_Base_dPair_dPair_Base_dPair_dPair ("int", slot)) else (if ((bi_eq_str dtb__358) "String") then (C_Base_dPair_dPair_Base_dPair_dPair ("string", slot)) else (if ((bi_eq_str dtb__358) "Bool") then (C_Base_dPair_dPair_Base_dPair_dPair ("bool", slot)) else (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtData dtb__358) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__360) -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCoreCodegen_dfamilyTyText dtb__358) (((((v_Vuna_dCompiler_dCoreCodegen_drenderFamilyArgs levels) table) datas) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) dtb__358)) dtb__359)), slot))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dtypeParamName slot), ((bi_add slot) 1)))
)))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__363, dtb__364) -> (match dtb__363 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__365, dtb__366) -> (if ((v_Vuna_dCompiler_dCoreCodegen_dflagMatchesRig dtb__361) dtb__366) then (match mc6 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__367, dtb__368, dtb__369, dtb__370, dtb__371) -> ((fun next -> (if dtb__361 then (match ((((((v_Vuna_dCompiler_dCoreCodegen_drenderFieldTy mc0) mc1) mc2) mc5) dtb__370) mc7) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts mc0) mc1) mc2) dtb__362) dtb__364) ((bi_add mc5) 1)) next) dtb__373)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__372, dtb__374)), dtb__375))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts mc0) mc1) mc2) dtb__362) dtb__364) ((bi_add mc5) 1)) next) mc7))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__371) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__367, mc5, C_Base_dList_dList_Nil))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor telescope does not match its type"))
) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor keep flag disagrees with telescope rig")))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__376, dtb__377) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: constructor shape has more binders than its telescope"))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc7))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dCoreCodegen_dctorArityNeed = (fun levels -> (fun table -> (fun datas -> (fun c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCoreCodegen_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_sub (v_Base_dPair_dsecondOf p)) (v_Base_dList_dlength levels))))))))))

let v_Vuna_dCompiler_dCoreCodegen_ddataArityNeed = (fun levels -> (fun table -> (fun datas -> (fun ctors -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCoreCodegen_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_add (v_Base_dList_dlength levels)) (v_Vuna_dCompiler_dCoreCodegen_dmaxIntList ns))))))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenCtorDecl = (fun levels -> (fun table -> (fun datas -> (fun c -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dCoreCodegen_dctorFieldTexts levels) table) datas) (v_Vuna_dCompiler_dCoreCodegen_dctorKeepFlags c)) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType c))) (v_Base_dList_dlength levels))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dCoreCodegen_dctorDeclText ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName (v_Vuna_dCompiler_dElab_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_ddtCtorName c))) (v_Base_dPair_dfirstOf p))))))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl = (fun table -> (fun datas -> (fun d -> ((fun levels -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCoreCodegen_ddataArityNeed levels) table) datas) (v_Vuna_dCompiler_dElab_ddtDataCtors d))) (fun arity -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((v_Vuna_dCompiler_dCoreCodegen_dgenCtorDecl levels) table) datas)) (v_Vuna_dCompiler_dElab_ddtDataCtors d))) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dtypeParamDecl arity)) ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dtypeName (v_Vuna_dCompiler_dElab_ddtDataName d))) ((bi_concat " = ") (v_Vuna_dCompiler_dCoreCodegen_dctorBodyText cs))))))))))) ((v_Vuna_dCompiler_dCoreCodegen_dlookupUsed table) (v_Vuna_dCompiler_dElab_ddtDataName d))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenTypeDecls = (fun datas -> (match datas with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((fun table -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl table) datas)) datas)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat "type ") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand ") parts)) "\n\n"))))))) ((v_Vuna_dCompiler_dCoreCodegen_dusedTableFix datas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), C_Base_dList_dList_Nil)))) datas)))
))

let v_Vuna_dCompiler_dCoreCodegen_disBoolFamilyName = (fun name -> ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName name)) "Bool"))

let v_Vuna_dCompiler_dCoreCodegen_druntimeDatas = (fun datas -> ((v_Base_dList_dfilter (fun d -> (if (v_Vuna_dCompiler_dCoreCodegen_disBoolFamilyName (v_Vuna_dCompiler_dElab_ddtDataName d)) then false else true))) datas))

let v_Vuna_dCompiler_dCoreCodegen_densureUniqueOcamlNames = (fun datas -> (fun defs -> ((fun runtime -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCoreCodegen_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName (v_Vuna_dCompiler_dElab_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_ddtCtorName c)))) (v_Vuna_dCompiler_dElab_ddtDataCtors d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCoreCodegen_dtypeName (v_Vuna_dCompiler_dElab_ddtDataName d)))) runtime))) ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dCoreCodegen_dvalueName (v_Vuna_dCompiler_dElab_ddtDefName d)))) defs))) (v_Vuna_dCompiler_dCoreCodegen_druntimeDatas datas))))

let v_Vuna_dCompiler_dCoreCodegen_dprepareDtProgram = (fun program -> ((fun datas -> ((fun defs -> ((fun table -> ((fun familyNames -> (match ((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs table) defs) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__378, dtb__379) -> ((fun allTypeNames -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckAllDefScopes dtb__378)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_densureUniqueOcamlNames datas) dtb__378)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure allTypeNames) dtb__378)) (fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs dtb__378)) (fun groups -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__378, groups))))))))))))) ((v_Base_dList_dappend dtb__379) familyNames))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName) datas))) (v_Vuna_dCompiler_dCoreCodegen_ddefTable defs))) (v_Base_dPair_dsecondOf program))) (v_Base_dPair_dfirstOf program)))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenTerm = (fun st -> (fun binders -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__380, dtb__381) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dbinderAt dtb__381) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__382) -> (match dtb__382 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__383, dtb__384) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__384) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level binding `") ((bi_concat dtb__380) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__383, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__385) -> ((v_Vuna_dCompiler_dCoreCodegen_dgenGlobalRef st) dtb__385)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__386) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__386), st))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__387) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_docamlString dtb__387), st))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__388) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCoreCodegen_dboolText dtb__388), st))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__389, dtb__390, dtb__391) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) dtb__389)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__392, dtb__393) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm dtb__393) binders) dtb__390)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__394, dtb__395) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm dtb__395) binders) dtb__391)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__396, dtb__397) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(if ") ((bi_concat dtb__392) ((bi_concat " then ") ((bi_concat dtb__394) ((bi_concat " else ") ((bi_concat dtb__396) ")")))))), dtb__397))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__398, dtb__399, dtb__400) -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenTermLam st) binders) dtb__398) dtb__399) dtb__400)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__401, dtb__402, dtb__403) -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenApp st) binders) dtb__401) dtb__402) dtb__403)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__404, dtb__405) -> ((((v_Vuna_dCompiler_dCoreCodegen_dgenConApp st) binders) dtb__404) dtb__405)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__406, dtb__407) -> ((((v_Vuna_dCompiler_dCoreCodegen_dgenCase st) binders) dtb__406) dtb__407)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__408, dtb__409, dtb__410, dtb__411, dtb__412) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__413) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__414) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: unsolved metavariable in runtime code") (v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint dtb__414))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dgenTermLam = (fun st -> (fun binders -> (fun name -> (fun rig -> (fun body -> (if (v_Vuna_dCompiler_dCore_drigIsErased rig) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__415, dtb__416) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__415, dtb__416))))
  | _ -> failwith "DT: impossible branch"
))) else ((fun ocName -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (ocName, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__417, dtb__418) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(fun ") ((bi_concat ocName) ((bi_concat " -> ") ((bi_concat dtb__417) ")")))), dtb__418))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCoreCodegen_docamlBinderName name))))))))
and v_Vuna_dCompiler_dCoreCodegen_dgenApp = (fun st -> (fun binders -> (fun f -> (fun a -> (fun rig -> (if (v_Vuna_dCompiler_dCore_drigIsErased rig) then (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) f) else (match (v_Vuna_dCompiler_dCoreCodegen_dflattenConApp (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (f, a, rig))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__419) -> (match dtb__419 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, dtb__421) -> ((((v_Vuna_dCompiler_dCoreCodegen_dgenConApp st) binders) dtb__420) dtb__421)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) f)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__422, dtb__423) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm dtb__423) binders) a)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__424, dtb__425) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat dtb__422) ((bi_concat " ") ((bi_concat dtb__424) ")")))), dtb__425))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCoreCodegen_dgenConArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__426, dtb__427) -> (match dtb__426 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__428, dtb__429) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm mc0) mc1) dtb__428)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__430, dtb__431) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenConArgs dtb__431) mc1) dtb__427)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__432, dtb__433) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__430, dtb__432)), dtb__433))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc0))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dgenConApp = (fun st -> (fun binders -> (fun c -> (fun args -> (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__434) -> (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCoreCodegen_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__435) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dalignCtorArgs c) dtb__435) args)) (fun runtimeArgs -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenConArgs st) binders) runtimeArgs)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__436, dtb__437) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCoreCodegen_dconAppText ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__434) c)) dtb__436), dtb__437))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_dgenArm = (fun st -> (fun outer -> (fun alt -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dcaseAltName alt)) "") then ((fun bound -> ((fun patText -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm (v_Vuna_dCompiler_dCoreCodegen_daeSt bound)) (v_Vuna_dCompiler_dCoreCodegen_daeEnv bound)) (v_Vuna_dCompiler_dCore_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__438, dtb__439) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__438) "\n")))), dtb__439))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCoreCodegen_daePats bound) with
  | C_Base_dList_dList_Nil -> "_"
  | C_Base_dList_dList_Cons (dtb__440, dtb__441) -> dtb__440
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCoreCodegen_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dcaseAltBinders alt))) else (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dcaseAltName alt)) (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") (v_Vuna_dCompiler_dCore_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__442) -> (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dcaseAltName alt)) (v_Vuna_dCompiler_dCoreCodegen_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") (v_Vuna_dCompiler_dCore_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__443) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCoreCodegen_daltEnvChecked st) (v_Vuna_dCompiler_dCore_dcaseAltName alt)) outer) (v_Vuna_dCompiler_dCore_dcaseAltBinders alt)) dtb__443)) (fun bound -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm (v_Vuna_dCompiler_dCoreCodegen_daeSt bound)) (v_Vuna_dCompiler_dCoreCodegen_daeEnv bound)) (v_Vuna_dCompiler_dCore_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__444, dtb__445) -> ((fun cname -> ((fun patText -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__444) "\n")))), dtb__445))))) ((v_Vuna_dCompiler_dCoreCodegen_darmPatternText cname) (v_Vuna_dCompiler_dCoreCodegen_daePats bound)))) ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__442) (v_Vuna_dCompiler_dCore_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCoreCodegen_dgenArms = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__446, dtb__447) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenArm mc0) mc1) dtb__446)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__448, dtb__449) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenArms dtb__449) mc1) dtb__447)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__450, dtb__451) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat dtb__448) dtb__450), dtb__451))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc0))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCoreCodegen_dgenCase = (fun st -> (fun binders -> (fun scrut -> (fun alts -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) binders) scrut)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__452, dtb__453) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenArms dtb__453) binders) alts)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__454, dtb__455) -> ((fun fallback -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(match ") ((bi_concat dtb__452) ((bi_concat " with\n") ((bi_concat dtb__454) ((bi_concat fallback) ")"))))), dtb__455))))) (if (v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenGroupDef = (fun st -> (fun d -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenTerm st) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtDefBody d))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__456, dtb__457) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dvalueName (v_Vuna_dCompiler_dElab_ddtDefName d))) ((bi_concat " = ") ((bi_concat (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtDefName d)) (v_Vuna_dCompiler_dCoreCodegen_dgsThunks st)) then "fun () -> " else "")) dtb__456))), dtb__457))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__458, dtb__459) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenGroupDef mc0) dtb__458)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__460, dtb__461) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies dtb__461) dtb__459)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__462, dtb__463) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__460, dtb__462)), dtb__463))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc0))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgenGroup = (fun adj -> (fun st -> (fun group -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies st) group)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__464, dtb__465) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (if ((v_Vuna_dCompiler_dCoreCodegen_dgroupNeedsRec adj) group) then "let rec " else "let ")) ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand ") dtb__464)), dtb__465))))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenGroups = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__466, dtb__467) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroup mc0) mc1) dtb__466)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__468, dtb__469) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups mc0) dtb__469) dtb__467)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__470, dtb__471) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__468, dtb__470)), dtb__471))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dioResultTy = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__472, dtb__473, dtb__474) -> (match dtb__472 with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__475) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName dtb__475)) "IO") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__473)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCoreCodegen_dfirstCtorOf = (fun d -> (match (v_Vuna_dCompiler_dElab_ddtDataCtors d) with
  | C_Base_dList_dList_Cons (dtb__476, dtb__477) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), (v_Vuna_dCompiler_dElab_ddtCtorName dtb__476)))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dioCtorOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__478, dtb__479) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName (v_Vuna_dCompiler_dElab_ddtDataName dtb__478))) "IO") then (v_Vuna_dCompiler_dCoreCodegen_dfirstCtorOf dtb__478) else (v_Vuna_dCompiler_dCoreCodegen_dioCtorOf dtb__479))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dmainShowErr = fun () -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: main must return Int, String or Bool (M13 limitation)"))

let v_Vuna_dCompiler_dCoreCodegen_dmainShowForName = (fun g -> (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName g)) "Int") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName g)) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCoreCodegen_dlastName g)) "Bool") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())))))

let v_Vuna_dCompiler_dCoreCodegen_dmainShow = (fun table -> (fun tyTerm -> (match ((((v_Vuna_dCompiler_dCore_dforce table) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) tyTerm)) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__480) -> (match dtb__480 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__481, dtb__482) -> (match dtb__482 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowForName dtb__481)
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())
)
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())
)
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dmainShowErr ())
)))

let v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody = (fun program -> ((fun datas -> ((fun defs -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dprepareDtProgram program)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__483, dtb__484) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTypeDecls (v_Vuna_dCompiler_dCoreCodegen_druntimeDatas datas))) (fun typeText -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency dtb__483)) ((v_Vuna_dCompiler_dCoreCodegen_dmkGenSt (v_Vuna_dCompiler_dCoreCodegen_druntimeDatas datas)) dtb__483)) dtb__484)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__485, dtb__486) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_ddtRuntime ())) ((bi_concat "\n") ((bi_concat typeText) ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_ddtListBridge datas)) ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\n\n") dtb__485))))), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__483, (v_Vuna_dCompiler_dCoreCodegen_ddefTable defs)))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf program))) (v_Base_dPair_dfirstOf program)))

let v_Vuna_dCompiler_dCoreCodegen_dgenDtHook = (fun bodyText -> (fun table -> (fun tyTerm -> (fun mainExpr -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__487, dtb__488) -> ((fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat bodyText) ((bi_concat "\n") hook))))) (if printResult then ((bi_concat "let () = print_endline (") ((bi_concat dtb__487) ((bi_concat " (") ((bi_concat mainExpr) "))\n")))) else ((bi_concat "let () = ignore (") ((bi_concat mainExpr) ")\n"))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCoreCodegen_dioRunText = (fun program -> (fun mainRef -> (match (v_Vuna_dCompiler_dCoreCodegen_dioCtorOf (v_Base_dPair_dfirstOf program)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__489) -> (match dtb__489 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__490, dtb__491) -> ((bi_concat "match ") ((bi_concat mainRef) ((bi_concat " with ") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName dtb__490) dtb__491)) " f -> f 0"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dgenerateDtProgram = (fun program -> (fun printResult -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody program)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__492, dtb__493) -> (match dtb__493 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__494, dtb__495) -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtDef "main") dtb__494) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: no main definition"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__496) -> ((fun mainTy -> ((fun mainRef -> (match (v_Vuna_dCompiler_dCoreCodegen_dioResultTy mainTy) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__497) -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook dtb__492) dtb__495) dtb__497) ((v_Vuna_dCompiler_dCoreCodegen_dioRunText program) mainRef)) printResult)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook dtb__492) dtb__495) mainTy) mainRef) printResult)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCoreCodegen_dvalueName "main"))) (v_Vuna_dCompiler_dElab_ddtDefType dtb__496))
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
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__498, dtb__499) -> ((v_Base_dString_dstartsWith "#") dtb__499)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitInstPrefixOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__500, dtb__501) -> (if ((bi_eq_generic dtb__500) C_Base_dList_dList_Nil) then "" else ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__500)) "."))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitExprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__502, dtb__503) -> dtb__502
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__504, dtb__505) -> (bi_strFromInt dtb__504)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__506, dtb__507) -> dtb__506
  | _ -> "X"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitArgSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__508, dtb__509) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dsplitExprNameFor dtb__508)) (v_Vuna_dCompiler_dCoreCodegen_dsplitArgSuffix dtb__509)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedInstName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__510, dtb__511, dtb__512) -> (match dtb__510 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__513, dtb__514) -> ((bi_concat dtb__513) (v_Vuna_dCompiler_dCoreCodegen_dsplitArgSuffix dtb__511))
  | _ -> "Inst"
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__515, dtb__516) -> dtb__515
  | _ -> "Inst"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceName = (fun cname -> (fun mname -> (fun headExpr -> (match mname with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedInstName headExpr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__517) -> (if (v_Vuna_dCompiler_dCoreCodegen_dsplitAnonInstName dtb__517) then ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dsplitInstPrefixOf dtb__517)) ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedInstName headExpr)))) else dtb__517)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dheadClassName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__518, dtb__519, dtb__520) -> (match dtb__518 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__521, dtb__522) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__521))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__523, dtb__524) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__523))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCoreCodegen_dmodulePrefixOfName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__525, dtb__526) -> (v_Vuna_dCompiler_dCommon_djoinDots dtb__525)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__527, dtb__528) -> (match dtb__527 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__529, dtb__530, dtb__531) -> (C_Base_dList_dList_Cons (dtb__529, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__528)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__532, dtb__533, dtb__534, dtb__535) -> (C_Base_dList_dList_Cons (dtb__532, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__528)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__536, dtb__537, dtb__538, dtb__539, dtb__540, dtb__541) -> (C_Base_dList_dList_Cons (dtb__536, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__528)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__542, dtb__543, dtb__544, dtb__545, dtb__546) -> (C_Base_dList_dList_Cons (dtb__542, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__528)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__547, dtb__548, dtb__549, dtb__550) -> (C_Base_dList_dList_Cons (dtb__547, (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__528)))
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__528)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__551, dtb__552) -> (match dtb__551 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558) -> (C_Base_dList_dList_Cons (dtb__553, (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__552)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__559, dtb__560, dtb__561, dtb__562, dtb__563) -> (C_Base_dList_dList_Cons (dtb__559, (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__552)))
  | _ -> (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__552)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__564, dtb__565) -> ((fun headExpr -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceName dtb__564) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) headExpr), mc0)), ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners mc0) mc1) mc2) dtb__565)))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__564, (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (mc1, (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))), ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (p, (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))))) mc2))), (v_Vuna_dCompiler_dCoreCodegen_dsplitNoSpan ()))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnerOf = (fun owner -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__566, dtb__567, dtb__568, dtb__569, dtb__570) -> (match (v_Vuna_dCompiler_dCoreCodegen_dheadClassName dtb__568) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__571) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceName dtb__571) dtb__566) dtb__568), owner)), C_Base_dList_dList_Nil))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__572, dtb__573, dtb__574, dtb__575, dtb__576, dtb__577) -> ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners owner) dtb__572) dtb__573) dtb__576)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__578, dtb__579, dtb__580, dtb__581, dtb__582) -> ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwners owner) dtb__578) dtb__579) dtb__581)
  | _ -> C_Base_dList_dList_Nil
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__583, dtb__584) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnerOf mc0) dtb__583)) ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo mc0) dtb__584))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__585, dtb__586) -> (match dtb__585 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__587, dtb__588) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, dtb__587)))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__588))) ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo dtb__587) dtb__588)) (v_Vuna_dCompiler_dCoreCodegen_dsplitOwnerEntriesOfModules dtb__586)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__589, dtb__590) -> (match dtb__589 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__591, dtb__592) -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, dtb__591)))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames dtb__592))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerEntriesOfModules dtb__590))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDictClass = (fun name -> (if ((v_Base_dString_dstartsWith "Dict_") name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Base_dString_dsubstring 5) ((bi_sub (bi_strLength name)) 5)) name))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dCoreCodegen_dlookupModuleOf = (fun pairs -> (fun name -> ((v_Base_dList_dlookupPair name) pairs)))

let v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr = (fun knownModules -> (fun what -> (fun name -> ((fun prefix -> (if ((v_Base_dList_dmemName prefix) knownModules) then (C_Base_dResult_dResult_Base_dResult_dOk (prefix)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: `") ((bi_concat what) ((bi_concat "` ") ((bi_concat name) ((bi_concat " has module prefix `") ((bi_concat prefix) "` but no such module")))))))))) (v_Vuna_dCompiler_dCoreCodegen_dmodulePrefixOfName name)))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerOf = (fun dataOwners -> (fun knownModules -> (fun entryDataNames -> (fun d -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlookupModuleOf dataOwners) (v_Vuna_dCompiler_dElab_ddtDataName d)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__593) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__593))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dCoreCodegen_dsplitDictClass (v_Vuna_dCompiler_dElab_ddtDataName d)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__594) -> (if (v_Vuna_dCompiler_dCoreCodegen_disBuiltinClassName dtb__594) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ()))) else (((v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr knownModules) "data") dtb__594))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot (v_Vuna_dCompiler_dElab_ddtDataName d)) then (((v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr knownModules) "data") (v_Vuna_dCompiler_dElab_ddtDataName d)) else (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtDataName d)) entryDataNames) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for data `") ((bi_concat (v_Vuna_dCompiler_dElab_ddtDataName d)) "`"))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwnerOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__595, dtb__596) -> (match dtb__595 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__597, dtb__598) -> (if ((v_Base_dString_dstartsWith ((bi_concat "Show_Show_") dtb__597)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__598)) else (if ((v_Base_dString_dstartsWith ((bi_concat "Eq_Eq_") dtb__597)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__598)) else (if ((v_Base_dString_dstartsWith ((bi_concat "Ord_Ord_") dtb__597)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__598)) else ((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwnerOf dtb__596) mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_dsplitDefOwnerOf = (fun defOwners -> (fun dataOwners -> (fun knownModules -> (fun entryNames -> (fun name -> (match ((v_Vuna_dCompiler_dCoreCodegen_dlookupModuleOf defOwners) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__599) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__599))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dCoreCodegen_dbuiltinMethodNames ())) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ()))) else (match ((v_Vuna_dCompiler_dCoreCodegen_dsplitDerivedOwnerOf dataOwners) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__600) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__600))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (((v_Vuna_dCompiler_dCoreCodegen_dknownModuleOrErr knownModules) "definition") name) else (if ((v_Base_dList_dmemName name) entryNames) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))) else (if (v_Vuna_dCompiler_dCoreCodegen_disBuiltinInstanceName name) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ()))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for definition `") ((bi_concat name) "`")))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCoreCodegen_dsmDefOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__601, dtb__602, dtb__603, dtb__604) -> dtb__601
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsmDataOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__605, dtb__606, dtb__607, dtb__608) -> dtb__606
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsmKnownModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__609, dtb__610, dtb__611, dtb__612) -> dtb__611
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsmEntryNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (dtb__613, dtb__614, dtb__615, dtb__616) -> dtb__616
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dsplitMetaOf = (fun modules -> (fun entryDecls -> ((fun knownModules -> ((fun entryNames -> ((fun defOwners -> ((fun dataOwners -> (C_Vuna_dCompiler_dCoreCodegen_dSplitMeta_Vuna_dCompiler_dCoreCodegen_dSplitMeta (defOwners, dataOwners, knownModules, entryNames))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerEntriesOfModules modules)) ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDataNames entryDecls))))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCoreCodegen_dsplitOwnerEntriesOfModules modules)) ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ()))))) entryNames)) ((v_Vuna_dCompiler_dCoreCodegen_dsplitInstanceOwnersGo (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ())) entryDecls))))) (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames entryDecls))) ((v_Base_dList_dmap (fun p -> (v_Base_dPair_dfirstOf p))) modules))))

let rec v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDefs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__617, dtb__618) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCoreCodegen_dsplitDefOwnerOf (v_Vuna_dCompiler_dCoreCodegen_dsmDefOwners mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmDataOwners mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmKnownModules mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmEntryNames mc0)) (v_Vuna_dCompiler_dElab_ddtDefName dtb__617))) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDefs mc0) dtb__618)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName dtb__617), o)), ps))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDatas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__619, dtb__620) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCoreCodegen_dsplitDataOwnerOf (v_Vuna_dCompiler_dCoreCodegen_dsmDataOwners mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmKnownModules mc0)) (v_Vuna_dCompiler_dCoreCodegen_dsmEntryNames mc0)) dtb__619)) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDatas mc0) dtb__620)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName dtb__619), o)), ps))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__621, dtb__622) -> (match dtb__621 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__623, dtb__624) -> (if ((bi_eq_str dtb__623) mc1) then dtb__624 else ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf dtb__622) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCoreCodegen_ddatasInUnit = (fun pairs -> (fun u -> (fun datas -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf pairs) (v_Vuna_dCompiler_dElab_ddtDataName d))) u))) datas))))

let v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit = (fun pairs -> (fun u -> (fun defs -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf pairs) (v_Vuna_dCompiler_dElab_ddtDefName d))) u))) defs))))

let rec v_Vuna_dCompiler_dCoreCodegen_dopenHeader = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__625, dtb__626) -> ((bi_concat "open ") ((bi_concat dtb__625) ((bi_concat "\n") (v_Vuna_dCompiler_dCoreCodegen_dopenHeader dtb__626))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgenTypeDeclsOf = (fun allDatas -> (fun subset -> (match subset with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (""))
  | _ -> ((fun table -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl table) allDatas)) subset)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat "type ") ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand ") parts)) "\n\n"))))))) ((v_Vuna_dCompiler_dCoreCodegen_dusedTableFix allDatas) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), C_Base_dList_dList_Nil)))) allDatas)))
)))

let v_Vuna_dCompiler_dCoreCodegen_dsplitUnitText = (fun allDatas -> (fun allDefs -> (fun unitDatas -> (fun unitDefs -> (fun bridgeText -> (fun opens -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenTypeDeclsOf allDatas) unitDatas)) (fun typeText -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs unitDefs)) (fun groups -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency unitDefs)) ((v_Vuna_dCompiler_dCoreCodegen_dmkGenSt allDatas) allDefs)) groups)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__627, dtb__628) -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dopenHeader opens)) ((bi_concat typeText) ((bi_concat bridgeText) ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\n\n") dtb__627)) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitListBridgeFor = (fun allDatas -> (fun dataPairs -> (fun unit -> (match (v_Vuna_dCompiler_dCoreCodegen_dfindListFamilyData allDatas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__629) -> (if ((bi_eq_str ((v_Vuna_dCompiler_dCoreCodegen_dmapOwnerOf dataPairs) (v_Vuna_dCompiler_dElab_ddtDataName dtb__629))) unit) then (v_Vuna_dCompiler_dCoreCodegen_ddtListBridge allDatas) else "")
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCoreCodegen_dsplitModuleFiles = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__630, dtb__631) -> (match dtb__630 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__632, dtb__633) -> ((fun unit -> ((fun unitDatas -> ((fun unitDefs -> ((fun bridge -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitUnitText mc0) mc1) unitDatas) unitDefs) bridge) ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_druntimeUnit ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinUnit ()), C_Base_dList_dList_Nil))))) mc4))) (fun text -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitModuleFiles mc0) mc1) mc2) mc3) ((v_Base_dList_dappend mc4) (C_Base_dList_dList_Cons (unit, C_Base_dList_dList_Nil)))) dtb__631)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile (((bi_concat unit) ".ml"), text)), tail))))))))) (((v_Vuna_dCompiler_dCoreCodegen_dsplitListBridgeFor mc0) mc3) dtb__632))) (((v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit mc2) dtb__632) mc1))) (((v_Vuna_dCompiler_dCoreCodegen_ddatasInUnit mc3) dtb__632) mc0))) (v_Vuna_dCompiler_dCoreCodegen_dsplitUnitOfModule dtb__632))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitMainHook = (fun allDatas -> (fun allDefs -> (fun printResult -> (match ((v_Vuna_dCompiler_dCoreCodegen_dfindDtDef "main") allDefs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: no main definition"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__634) -> ((fun table -> ((fun mainRef -> (match (v_Vuna_dCompiler_dCoreCodegen_dioResultTy (v_Vuna_dCompiler_dElab_ddtDefType dtb__634)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__635) -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook "") table) dtb__635) ((v_Vuna_dCompiler_dCoreCodegen_dioRunText (C_Base_dPair_dPair_Base_dPair_dPair (allDatas, allDefs))) mainRef)) printResult)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCoreCodegen_dgenDtHook "") table) (v_Vuna_dCompiler_dElab_ddtDefType dtb__634)) mainRef) printResult)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCoreCodegen_dvalueName "main"))) (v_Vuna_dCompiler_dCoreCodegen_ddefTable allDefs))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCoreCodegen_dsplitMainFile = (fun allDatas -> (fun allDefs -> (fun defPairs -> (fun dataPairs -> (fun printResult -> (fun opens -> ((fun entryDefs -> ((fun entryDatas -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dgenTypeDeclsOf allDatas) entryDatas)) (fun typeText -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs entryDefs)) (fun groups -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dgenGroups (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency entryDefs)) ((v_Vuna_dCompiler_dCoreCodegen_dmkGenSt allDatas) allDefs)) groups)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__636, dtb__637) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCoreCodegen_dsplitMainHook allDatas) allDefs) printResult)) (fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile ("Main.ml", ((bi_concat (v_Vuna_dCompiler_dCoreCodegen_dopenHeader opens)) ((bi_concat typeText) ((bi_concat ((v_Vuna_dCompiler_dCoreCodegen_djoinWith "\n\n") dtb__636)) ((bi_concat "\n") hook))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))) (((v_Vuna_dCompiler_dCoreCodegen_ddatasInUnit dataPairs) (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ())) allDatas))) (((v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit defPairs) (v_Vuna_dCompiler_dCoreCodegen_dentryOwner ())) allDefs))))))))

let rec v_Vuna_dCompiler_dCoreCodegen_dfirstUnresolvedDeclName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__638, dtb__639) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__638) then (v_Vuna_dCompiler_dCoreCodegen_dfirstUnresolvedDeclName dtb__639) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__638)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckResolvedModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__640, dtb__641) -> (match dtb__640 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__642, dtb__643) -> (match (v_Vuna_dCompiler_dCoreCodegen_dfirstUnresolvedDeclName (v_Vuna_dCompiler_dCoreCodegen_dsplitDeclNames dtb__643)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__644) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: module ") ((bi_concat dtb__642) ((bi_concat " has an unresolved declaration name `") ((bi_concat dtb__644) "` (codegen requires Loader-resolved decls)"))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCoreCodegen_dcheckResolvedModules dtb__641)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCoreCodegen_dgenerateDtSplitProgram = (fun modules -> (fun entryDecls -> (fun prog -> (fun printResult -> ((fun allDatas -> ((fun allDefs -> ((fun runtimeAll -> ((fun table -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckResolvedModules modules)) (fun _u -> (match ((v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs table) allDefs) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__645, dtb__646) -> ((fun allTypeNames -> ((fun meta -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckAllDefScopes dtb__645)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_densureUniqueOcamlNames allDatas) dtb__645)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure allTypeNames) dtb__645)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDefs meta) dtb__645)) (fun defPairs -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCoreCodegen_dnameOwnerPairsOfDatas meta) allDatas)) (fun dataPairs -> ((fun builtinDatas -> ((fun builtinDefs -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitUnitText runtimeAll) dtb__645) builtinDatas) builtinDefs) "") (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_druntimeUnit ()), C_Base_dList_dList_Nil)))) (fun builtinText -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitModuleFiles runtimeAll) dtb__645) defPairs) dataPairs) C_Base_dList_dList_Nil) modules)) (fun moduleFiles -> ((fun unitNames -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCoreCodegen_dsplitMainFile runtimeAll) dtb__645) defPairs) dataPairs) printResult) ((v_Base_dList_dappend (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_druntimeUnit ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCoreCodegen_dbuiltinUnit ()), C_Base_dList_dList_Nil))))) unitNames))) (fun mainFile -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile ("Vuna_runtime.ml", (v_Vuna_dCompiler_dCoreCodegen_ddtRuntime ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile ("Vuna_builtins.ml", builtinText)), ((v_Base_dList_dappend moduleFiles) (C_Base_dList_dList_Cons (mainFile, C_Base_dList_dList_Nil)))))))))))) ((v_Base_dList_dmap (fun p -> (v_Vuna_dCompiler_dCoreCodegen_dsplitUnitOfModule (v_Base_dPair_dfirstOf p)))) modules))))))) (((v_Vuna_dCompiler_dCoreCodegen_ddefsInUnit defPairs) (v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ())) dtb__645))) (((v_Vuna_dCompiler_dCoreCodegen_ddatasInUnit dataPairs) (v_Vuna_dCompiler_dCoreCodegen_dbuiltinOwner ())) runtimeAll))))))))))))) ((v_Vuna_dCompiler_dCoreCodegen_dsplitMetaOf modules) entryDecls))) ((v_Base_dList_dappend dtb__646) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName) allDatas)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCoreCodegen_ddefTable allDefs))) (v_Vuna_dCompiler_dCoreCodegen_druntimeDatas allDatas))) (v_Vuna_dCompiler_dElab_ddtProgDefs prog))) (v_Vuna_dCompiler_dElab_ddtProgDatas prog))))))
