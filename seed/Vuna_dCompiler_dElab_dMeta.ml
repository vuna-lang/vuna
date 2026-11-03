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
type t_Vuna_dCompiler_dElab_dMeta_dDataHead = C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (int)

let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun fuel -> (fun ec -> (fun v -> (if ((bi_le_int fuel) 0) then true else ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel ((bi_sub fuel) 1)) ec) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))))

let v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun ec -> (fun v -> (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel 128) ec) v)))

let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__5, (v_Base_dPair_dsecondOf dtb__7))), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs dtb__6) dtb__8)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> C_Base_dList_dList_Base_dList_dNil
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm = (fun ctor -> (fun metas -> (if ((bi_eq_int (v_Base_dList_dlength metas)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs metas) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor))))))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue = (fun name -> (if ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else (if ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun name -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9) -> (if dtb__9 then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

let v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName = (fun name -> ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let rec v_Vuna_dCompiler_dElab_dMeta_dprefixUntilMetaId = (fun pid -> (fun cur -> (match cur with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (match dtb__10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__12, dtb__13) -> (if ((bi_eq_int dtb__12) pid) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__12, dtb__13)), ((v_Vuna_dCompiler_dElab_dMeta_dprefixUntilMetaId pid) dtb__11))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dnewSolsSince = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (match dtb__14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dElab_dMeta_dprefixUntilMetaId dtb__16) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmetaDepthLookup = (fun m -> (fun lst -> (match lst with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (match dtb__18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, dtb__21) -> (if ((bi_eq_int dtb__20) m) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21)) else ((v_Vuna_dCompiler_dElab_dMeta_dmetaDepthLookup m) dtb__19))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dmetaDepthOf = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt m)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__22) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__22))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dmetaDepthLookup m) (v_Vuna_dCompiler_dElab_dTypes_decDepthOfMeta ec))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (match dtb__23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dmetaDepthOf mc0) dtb__25) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList mc0) dtb__24)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__27) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes dtb__27) 0) dtb__26) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveMetavar ((bi_strFromInt dtb__25)))) (C_Base_dVec_dVec_Base_dVec_dVCons ((bi_strFromInt dtb__25), C_Base_dVec_dVec_Base_dVec_dVNil))))) else ((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList mc0) dtb__24))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dcheckSolsDelta = (fun ec -> (fun oldSols -> (fun newSols -> ((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedValueList ec) ((v_Vuna_dCompiler_dElab_dMeta_dnewSolsSince oldSols) newSols)))))

let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec -> (fun depth -> (fun expected -> (fun actual -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__28) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__28))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__29) -> ((fun sl -> (match (((v_Vuna_dCompiler_dElab_dMeta_dcheckSolsDelta ec) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sl) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__30) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__30))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__31) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) sl)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__29))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__32 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__34) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom mc0) dtb__33) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes dtb__35) 0) dtb__36) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotSolveMetavar ((bi_strFromInt dtb__34)))) (C_Base_dVec_dVec_Base_dVec_dVCons ((bi_strFromInt dtb__34), C_Base_dVec_dVec_Base_dVec_dVNil))))) else (((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom mc0) dtb__33) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_dcheckSolsScoped = (fun ec -> (fun sols -> (((v_Vuna_dCompiler_dElab_dMeta_dcheckScopedFrom ec) (v_Vuna_dCompiler_dElab_dTypes_decDepthOfMeta ec)) sols)))

let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun remaining -> (fun stop -> (fun sols -> (if ((bi_le_int remaining) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo ((bi_sub remaining) 1)) stop) sols)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub stop) remaining))))))

let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i -> (fun stop -> (fun sols -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo ((bi_sub stop) i)) stop) sols))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun i -> (fun ids -> (match ids with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__38, dtb__39) -> (if ((bi_eq_int dtb__38) i) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) dtb__39))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__40) -> (C_Base_dList_dList_Base_dList_dCons (dtb__40, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__41, dtb__42) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__43) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__44) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__48)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__49))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__50, dtb__51, dtb__52) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__52)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__53, dtb__54, dtb__55) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__53)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__54))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__56, dtb__57) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Base_dPair_dfirstOf p)))) dtb__57)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__58, dtb__59) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__58)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__59))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__60) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__61) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__62) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__63, dtb__64, dtb__65) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__63)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__64)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__65)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__66) -> (C_Base_dList_dList_Base_dList_dCons (dtb__66, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__67, dtb__68) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__69) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__70) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__74)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__75))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__76, dtb__77, dtb__78) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__78)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__79, dtb__80, dtb__81) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__81) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__79) else ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__79)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__80)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__82, dtb__83) -> ((v_Base_dList_dconcatMap (fun p -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf p)) then C_Base_dList_dList_Base_dList_dNil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Base_dPair_dfirstOf p))))) dtb__83)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__84, dtb__85) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__84)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__85))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__86) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__87) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__88) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__89, dtb__90, dtb__91) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__89)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__90)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__91)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun ec -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Base_dPair_dsecondOf d)))) (v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a -> (fun b -> (if ((bi_ge_int a) b) then a else b)))

let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (match dtb__92 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (if ((bi_eq_str mc0) dtb__94) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__95)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__93))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun name -> (fun globals -> (fun ec -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup name) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dElab_dTypes_decGlobalsComplete ec) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun d5014 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (match dtb__97 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (if (((v_Base_dEq_deq d5014) dtb__99) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig d5014) dtb__98) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (match dtb__101 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> (if ((bi_eq_str dtb__103) mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__105 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__107, dtb__108, dtb__109) -> (if ((v_Base_dList_dmemName dtb__107) v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__109) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotRedefineBuiltin (dtb__107))) dtb__107) else (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__107) mc1) then (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__109) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dDuplicateSignature (dtb__107))) dtb__107) else ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__107) true) mc1)) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, (((v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig mc0) dtb__108) dtb__109))), mc2))) dtb__106)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__110, dtb__111, dtb__112, dtb__113) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__106)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__106)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__124) "DT: internal: record was not desugared")
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__125, dtb__126, dtb__127, dtb__128) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__106)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__106)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun banned -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil) decls)) (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned (v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls))))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> (match dtb__134 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__135) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__141)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__135) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (match dtb__142 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> (C_Base_dList_dList_Base_dList_dCons (dtb__144, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__143)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__143)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> true
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__156)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__157) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__158)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__158)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__159))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__160)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__161))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__162)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__164) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__164))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__163)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__165, dtb__166, dtb__167) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__165) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, ((v_Base_dList_dappend dtb__169) (C_Base_dList_dList_Base_dList_dCons (dtb__166, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__170) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, C_Base_dList_dList_Base_dList_dNil))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ("", C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__175)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType ty)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__176, dtb__177) -> ((bi_lt_int dtb__177) 0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__181) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__182))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__183, dtb__184, dtb__185) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__185)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__186, dtb__187, dtb__188) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__186) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__187))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__189, dtb__190) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__190)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__191, dtb__192) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__191) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__192))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__193, dtb__194, dtb__195) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__193) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__194)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__195))
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> (match dtb__196 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__198) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__197))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> (match dtb__200 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__202, dtb__203, dtb__204) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__204) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__201))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel = (fun fuel -> (fun ec -> (fun depth -> (fun t -> (if ((bi_le_int fuel) 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__205) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__205) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__206) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__206))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__207, dtb__208, dtb__209, ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) dtb__210), ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) 1)) dtb__211)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__212, dtb__213, dtb__214) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__212, dtb__213, ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) 1)) dtb__214)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__215, dtb__216, dtb__217) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) dtb__215), ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) dtb__216), dtb__217))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__218, dtb__219) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__218, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__219)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__220, dtb__221) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) dtb__220), ((v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetaAltFuel ((bi_sub fuel) 1)) ec) depth) alt))) dtb__221)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__222, dtb__223, dtb__224) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) dtb__222), ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) dtb__223), ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) depth) dtb__224)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetaAltFuel = (fun fuel -> (fun ec -> (fun depth -> (fun alt0 -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", C_Base_dList_dList_Base_dList_dNil, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (0)))) else (match alt0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__225, dtb__226, dtb__227) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__225, dtb__226, ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) (v_Base_dList_dlength dtb__226))) dtb__227)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetas = (fun ec -> (fun depth -> (fun t -> ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetasFuel 64) ec) depth) t))))

let v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetaAlt = (fun ec -> (fun depth -> (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dinlineSolvedMetaAltFuel 64) ec) depth) alt))))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun kindTerm -> (fun tyExpr -> (fun sp -> (match kindTerm with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__228, true, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", sp)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__232) tyExpr) sp), sp))
  | _ -> tyExpr
))))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__237)
  | _ -> t
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__238), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__238))), (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__239)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__240, dtb__241, dtb__242) -> dtb__240
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__243, dtb__244, dtb__245) -> dtb__244
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__246, dtb__247, dtb__248) -> dtb__248
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun name -> (fun heads -> (match heads with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__249, dtb__250) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_ddataHeadName dtb__249)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind dtb__249), (v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity dtb__249))))) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead name) dtb__250))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ((bi_concat "Dict_") cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ((bi_concat "MkDict_") cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__251, dtb__252) -> (match dtb__251 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__253, dtb__254, dtb__255, dtb__256) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__252) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__256)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__252) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__257, dtb__258) -> (match dtb__257 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__259, dtb__260, dtb__261, dtb__262, dtb__263) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__258) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__257, dtb__263)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__258) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__264, dtb__265) -> dtb__264
  | C_Base_dList_dList_Base_dList_dNil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun rigs -> (fun nFields -> (fun i -> (fun arity -> (match rigs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__266, dtb__267) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (((bi_concat "x") (bi_strFromInt i)), ((bi_add nFields) ((bi_sub ((bi_sub arity) 1)) i)))), dtb__266)), ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__267) nFields) ((bi_add i) 1)) arity)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs -> (fun nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (v_Base_dList_dlength rigs))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__268, dtb__269) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (((bi_concat "x") (bi_strFromInt mc1)), dtb__268, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__269) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ((bi_concat "f") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName ((bi_sub n) remaining)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), acc)))))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n -> (fun i -> (fun acc -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo ((bi_sub n) i)) n) acc))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname -> (fun arg -> (fun ty -> (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))))

let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if ((bi_eq_str tyName) "String") then "bi_eq_str" else "bi_eq_int"))

let rec v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__270, dtb__271, dtb__272) -> (match (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp dtb__270) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__273) -> (match dtb__273 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__274, dtb__275) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__274, ((v_Base_dList_dappend dtb__275) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__271, dtb__272)), C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__276) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__276, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit -> (fun dom -> ((v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dCore_dTerm_disTypeValue dom))))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__277, dtb__278, dtb__279, dtb__280, dtb__281) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__277, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__278) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__280)))), (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__281)))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> ((fun domVal -> ((fun v -> ((fun rig -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__282, rig)), ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__286) (C_Base_dList_dList_Base_dList_dCons (v, env)))))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__283) domVal))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__282, (v_Base_dList_dlength env), C_Base_dList_dList_Base_dList_dNil)))))) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__285))
  | _ -> C_Base_dList_dList_Base_dList_dNil
)))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__287) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel ((bi_sub fuel) 1)) dtb__291) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__292) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__288, 0, C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
))))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLayerRig = (fun implicit -> (fun dom -> (if implicit then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else (if (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue dom) then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun datas -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__293) -> (match dtb__293 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__294, dtb__295) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__294) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__296) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec -> (fun dom -> (if (if (v_Vuna_dCompiler_dCore_dTerm_disTypeValue dom) then true else (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue dom)) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel -> (fun ec -> (fun ctx -> (fun v -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec)))))) else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> (if dtb__298 then (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__300) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__302, dtb__303) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel ((bi_sub fuel) 1)) dtb__303) ctx) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__301) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__302)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, dtb__305) -> (match dtb__305 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__306, dtb__307) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__302, dtb__306)), dtb__307))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec))))))
))))))

let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec -> (fun ctx -> (fun v -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))))

let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name -> (fun level -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil))))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__308, dtb__309, dtb__310) -> dtb__308
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__311, dtb__312) -> dtb__311
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__313) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__313))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__314) -> true
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__315) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__315)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__315)) else (if ((bi_eq_generic (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__315)) C_Base_dList_dList_Base_dList_dNil) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (name, C_Base_dList_dList_Base_dList_dNil)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec -> (fun ctx -> (fun name -> (fun tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__316) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__316)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__316)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then (match (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__317) -> (match dtb__317 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, dtb__319) -> (match dtb__319 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__320, dtb__321) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__316) dtb__320), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, dtb__321))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__322) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__322))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (ctorTy, ec)))))))) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__323, dtb__324) -> (match dtb__323 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__325, dtb__326) -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__325, dtb__326))) dtb__324)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__327) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__327) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__328) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__328)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__327) else (if ((bi_ge_int (v_Base_dList_dlength mc2)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__328))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__327, mc2)) else ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__327))) mc2)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__327))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__329, dtb__330, dtb__331, dtb__332, dtb__333) -> ((bi_neq_str dtb__329) "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__334, dtb__335) -> dtb__335
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__336, dtb__337) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__336))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__336)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__337))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__338, dtb__339) -> (match dtb__338 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__340, dtb__341) -> (match dtb__340 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__342, dtb__343, dtb__344) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__339)
  | _ -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__341))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
