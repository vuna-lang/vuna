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
type t_Vuna_dCompiler_dElab_dMeta_dDataHead = C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (int)

let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun ec -> (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__5, (v_Base_dPair_dsecondOf dtb__7))), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs dtb__6) dtb__8)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm = (fun ctor -> (fun metas -> (if ((bi_eq_int (v_Base_dList_dlength metas)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs metas) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor))))))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> (if ((bi_eq_str dtb__10) "True") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else (if ((bi_eq_str dtb__10) "False") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun name -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> (if dtb__11 then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

let v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__12, dtb__13) -> ((bi_eq_str dtb__13) "Bool")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolTypeVal = (fun ec -> (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__14) -> (match dtb__14 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__15, dtb__16) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName dtb__15)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__17, dtb__18, dtb__19) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName dtb__17)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dboolTypedVal = (fun ec -> (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__20) -> (match dtb__20 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__21, dtb__22) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName dtb__21)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__23, dtb__24, dtb__25) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName dtb__23)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let rec v_Vuna_dCompiler_dElab_dMeta_dprefixUntilMetaId = (fun pid -> (fun cur -> (match cur with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (if ((bi_eq_int dtb__28) pid) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29)), ((v_Vuna_dCompiler_dElab_dMeta_dprefixUntilMetaId pid) dtb__27))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dnewSolsSince = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match dtb__30 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, dtb__33) -> ((v_Vuna_dCompiler_dElab_dMeta_dprefixUntilMetaId dtb__32) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmetaDepthLookup = (fun m -> (fun lst -> (match lst with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37) -> (if ((bi_eq_int dtb__36) m) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37)) else ((v_Vuna_dCompiler_dElab_dMeta_dmetaDepthLookup m) dtb__35))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dmetaDepthOf = (fun ec -> (fun m -> ((v_Vuna_dCompiler_dElab_dMeta_dmetaDepthLookup m) (v_Vuna_dCompiler_dElab_dTypes_decDepthOfMeta ec))))

let rec v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (match dtb__38 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__40, dtb__41) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dmetaDepthOf mc0) dtb__40) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList mc0) dtb__39)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes dtb__42) 0) dtb__41) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: cannot solve metavariable ?") ((bi_concat (bi_strFromInt dtb__40)) " (solution would escape its scope)")))) else ((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList mc0) dtb__39))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dcheckSolsDelta = (fun ec -> (fun oldSols -> (fun newSols -> ((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList ec) ((v_Vuna_dCompiler_dElab_dMeta_dnewSolsSince oldSols) newSols)))))

let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec -> (fun depth -> (fun expected -> (fun actual -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_dboolTypedVal ec) expected) then ((v_Vuna_dCompiler_dElab_dMeta_dboolTypedVal ec) actual) else false) then (C_Base_dResult_dResult_Base_dResult_dOk (ec)) else (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) depth) expected) actual) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__43) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__43))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__44) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dcheckSolsDelta ec) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) dtb__44) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__45) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__45))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__46) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) dtb__44)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (match dtb__47 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, dtb__50) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__49) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom mc0) dtb__48) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__51) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes dtb__50) 0) dtb__51) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: cannot solve metavariable ?") ((bi_concat (bi_strFromInt dtb__49)) " (solution would escape its scope)")))) else (((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom mc0) dtb__48) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_dcheckSolsScoped = (fun ec -> (fun sols -> (((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom ec) (v_Vuna_dCompiler_dElab_dTypes_decDepthOfMeta ec)) sols)))

let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i -> (fun stop -> (fun sols -> (if ((bi_ge_int i) stop) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__52) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom ((bi_add i) 1)) stop) sols)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun i -> (fun ids -> (match ids with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (if ((bi_eq_int dtb__53) i) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) dtb__54))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__55) -> (C_Base_dList_dList_Cons (dtb__55, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__56, dtb__57) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__58) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__59) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__63)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__64))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__65, dtb__66, dtb__67) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__67)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__68, dtb__69, dtb__70) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__68)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__69))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__71, dtb__72) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Base_dPair_dfirstOf p)))) dtb__72)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__73, dtb__74) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__73)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__74))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__75) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__76) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__77) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__78, dtb__79, dtb__80) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__78)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__79)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__80)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__81) -> (C_Base_dList_dList_Cons (dtb__81, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__82, dtb__83) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__84) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__85) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__89)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__90))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__91, dtb__92, dtb__93) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__93)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__94, dtb__95, dtb__96) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__96) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__94) else ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__94)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__95)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__97, dtb__98) -> ((v_Base_dList_dconcatMap (fun p -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf p)) then C_Base_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Base_dPair_dfirstOf p))))) dtb__98)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__99, dtb__100) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__99)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__100))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__101) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__102) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__103) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__104, dtb__105, dtb__106) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__104)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__105)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__106)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun ec -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Base_dPair_dsecondOf d)))) (v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a -> (fun b -> (if ((bi_ge_int a) b) then a else b)))

let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (if ((bi_eq_str mc0) dtb__109) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun d3901 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (match dtb__111 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> (if (((v_Base_dEq_deq d3901) dtb__113) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig d3901) dtb__112) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (match dtb__115 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> (if ((bi_eq_str dtb__117) mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__116))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__119, dtb__120) -> (match dtb__119 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__121, dtb__122, dtb__123) -> (if ((v_Base_dList_dmemName dtb__121) (v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames ())) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__123) ((bi_concat "DT: cannot redefine builtin ") dtb__121)) else (if (((v_Vuna_dCompiler_dElab_dMeta_dmemSig (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) mc1) dtb__121) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__123) ((bi_concat "DT: duplicate signature for ") dtb__121)) else (((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, (((v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig mc0) dtb__122) dtb__123))), mc1))) dtb__120)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__124, dtb__125, dtb__126, dtb__127) -> (((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) dtb__120)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> (((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) dtb__120)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__138) "DT: internal: record was not desugared")
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__139, dtb__140, dtb__141, dtb__142) -> (((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) dtb__120)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> (((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) dtb__120)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc1)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> (((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto (v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)) C_Base_dList_dList_Nil) decls))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__148 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__149) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__155)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__149) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (match dtb__156 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (C_Base_dList_dList_Cons (dtb__158, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__157)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__157)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__164, dtb__165) -> true
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__170)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__171) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__172, dtb__173) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__172)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__173))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__174, dtb__175) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__174)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__175))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__176)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__178) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__178))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__177)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__179, dtb__180, dtb__181) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__179) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, ((v_Base_dList_dappend dtb__183) (C_Base_dList_dList_Cons (dtb__180, C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__184) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, C_Base_dList_dList_Nil))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ("", C_Base_dList_dList_Nil))
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__189)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType ty)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__190, dtb__191) -> ((bi_lt_int dtb__191) 0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__195) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__196))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__197, dtb__198, dtb__199) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__199)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__200, dtb__201, dtb__202) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__200) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__201))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__203, dtb__204) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__204)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__205, dtb__206) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__205) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__206))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__207, dtb__208, dtb__209) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__207) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__208)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__209))
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (match dtb__210 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__212) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__211))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__214, dtb__215) -> (match dtb__214 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__216, dtb__217, dtb__218) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__218) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__215))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas = (fun ec -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__219) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__219) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__220) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__220))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__221, dtb__222, dtb__223, (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) dtb__224), (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) ((bi_add depth) 1)) dtb__225)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__226, dtb__227, dtb__228) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__226, dtb__227, (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) ((bi_add depth) 1)) dtb__228)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__229, dtb__230, dtb__231) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) dtb__229), (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) dtb__230), dtb__231))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__232, dtb__233) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__232, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__233)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__234, dtb__235) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) dtb__234), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetaAlt ec) depth)) dtb__235)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__236, dtb__237, dtb__238) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) dtb__236), (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) dtb__237), (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas ec) depth) dtb__238)))
  | _ -> t
))))
and v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetaAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__239, dtb__240, dtb__241) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__239, dtb__240, (((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas mc0) ((bi_add mc1) (v_Base_dList_dlength dtb__240))) dtb__241)))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun kindTerm -> (fun tyExpr -> (fun sp -> (match kindTerm with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__242, true, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", sp)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__246) tyExpr) sp), sp))
  | _ -> tyExpr
))))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__251)
  | _ -> t
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__252, dtb__253) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__252), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__252))), (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__253)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__254, dtb__255, dtb__256) -> dtb__254
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__257, dtb__258, dtb__259) -> dtb__258
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__260, dtb__261, dtb__262) -> dtb__262
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun name -> (fun heads -> (match heads with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_ddataHeadName dtb__263)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind dtb__263), (v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity dtb__263))))) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead name) dtb__264))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ((bi_concat "Dict_") cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ((bi_concat "MkDict_") cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__265, dtb__266) -> (match dtb__265 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__267, dtb__268, dtb__269, dtb__270) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__266) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__265, dtb__270)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__266) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (match dtb__271 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__272) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__271, dtb__277)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__272) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__278, dtb__279) -> dtb__278
  | C_Base_dList_dList_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun rigs -> (fun nFields -> (fun i -> (fun arity -> (match rigs with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__280, dtb__281) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (((bi_concat "x") (bi_strFromInt i)), ((bi_add nFields) ((bi_sub ((bi_sub arity) 1)) i)))), dtb__280)), ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__281) nFields) ((bi_add i) 1)) arity)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs -> (fun nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (v_Base_dList_dlength rigs))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__282, dtb__283) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (((bi_concat "x") (bi_strFromInt mc1)), dtb__282, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__283) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ((bi_concat "f") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n -> (fun i -> (fun acc -> (if ((bi_ge_int i) n) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) ((bi_add i) 1)) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName i), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), acc)))))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname -> (fun arg -> (fun ty -> (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))))

let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if ((bi_eq_str tyName) "String") then "bi_eq_str" else "bi_eq_int"))

let rec v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__284, dtb__285, dtb__286) -> (match (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp dtb__284) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__287) -> (match dtb__287 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__288, dtb__289) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__288, ((v_Base_dList_dappend dtb__289) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__285, dtb__286)), C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__290) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__290, C_Base_dList_dList_Nil))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit -> (fun dom -> ((v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dCore_dTerm_disTypeValue dom))))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__291, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__292) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__294)))), (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__295)))
  | _ -> C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> ((fun domVal -> ((fun v -> ((fun rig -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__296, rig)), ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__300) (C_Base_dList_dList_Cons (v, env)))))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__297) domVal))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__296, (v_Base_dList_dlength env), C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__299))
  | _ -> C_Base_dList_dList_Nil
)))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__301) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306) -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue dtb__305) then (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__306) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__302, 0, C_Base_dList_dList_Nil)))))) else false)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLayerRig = (fun implicit -> (fun dom -> (if implicit then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else (if (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue dom) then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun datas -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__307) -> (match dtb__307 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__308, dtb__309) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__308) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__310) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec -> (fun dom -> (if (if (v_Vuna_dCompiler_dCore_dTerm_disTypeValue dom) then true else (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue dom)) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec -> (fun ctx -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> (if dtb__312 then (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__314) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__316, dtb__317) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor dtb__317) ctx) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__315) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__316)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, dtb__319) -> (match dtb__319 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__320, dtb__321) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__316, dtb__320)), dtb__321))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, ec))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, ec)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, ec))))))
))))

let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name -> (fun level -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__322, dtb__323, dtb__324) -> dtb__322
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__325, dtb__326) -> dtb__325
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__327, dtb__328) -> ((bi_eq_str dtb__328) "Bool")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__329) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__329))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__330) -> true
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__331) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__331)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm name) else (if ((bi_eq_generic (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__331)) C_Base_dList_dList_Nil) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (name, C_Base_dList_dList_Nil)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec -> (fun ctx -> (fun name -> (fun tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__332) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__332)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm name), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__332), C_Base_dList_dList_Nil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then (match (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__333) -> (match dtb__333 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__334, dtb__335) -> (match dtb__335 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__336, dtb__337) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__332) dtb__336), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__334, dtb__337))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__338) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__338))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (ctorTy, ec)))))))) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) tyTerm)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__339, dtb__340) -> (match dtb__339 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__341, dtb__342) -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__341, dtb__342))) dtb__340)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__343) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__343) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__344) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolBaseName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__344)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__343) else (if ((bi_ge_int (v_Base_dList_dlength mc2)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__344))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__343, mc2)) else ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__343))) mc2)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__343))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__345, dtb__346, dtb__347, dtb__348, dtb__349) -> ((bi_neq_str dtb__345) "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__350, dtb__351) -> dtb__351
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__352, dtb__353) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__352))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__352)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__353))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__354, dtb__355) -> (match dtb__354 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__356, dtb__357) -> (match dtb__356 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__358, dtb__359, dtb__360) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__355)
  | _ -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__357))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindBoolFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__361))) "Bool") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__361))) else (v_Vuna_dCompiler_dElab_dMeta_dfindBoolFamily dtb__362))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dshortBoolFamily = (fun ec -> (fun name -> (if ((bi_eq_str name) "Bool") then (v_Vuna_dCompiler_dElab_dMeta_dfindBoolFamily (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
