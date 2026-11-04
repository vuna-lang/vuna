open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
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
open Vuna_dCompiler_dLoader_dFixity
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
type t_Vuna_dCompiler_dElab_dMeta_dValueEntry = C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor of (t_Vuna_dCompiler_dElab_dTypes_dDtCtor) | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef of (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dMeta_dDataHead = C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (int)

let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun fuel -> (fun ec -> (fun v -> (if ((bi_le_int fuel) 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
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

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9) -> (if dtb__9 then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

let v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName = (fun name -> ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec -> (fun depth -> (fun expected -> (fun actual -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__10) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__10))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__11) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__11))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun remaining -> (fun stop -> (fun sols -> (if ((bi_le_int remaining) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo ((bi_sub remaining) 1)) stop) sols)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub stop) remaining))))))

let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i -> (fun stop -> (fun sols -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo ((bi_sub stop) i)) stop) sols))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if ((bi_eq_int dtb__13) mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId mc0) dtb__14))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__15, dtb__16, dtb__17) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__15)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__16)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__17)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__18) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__19) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__20) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__21, dtb__22) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__21)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__22))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__23, dtb__24) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Base_dPair_dfirstOf p)))) dtb__24)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__25, dtb__26, dtb__27) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__25)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__26))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__28, dtb__29, dtb__30) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__30)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__34)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__35))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__36) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__37) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__38, dtb__39) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__40) -> (C_Base_dList_dList_Base_dList_dCons (dtb__40, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__41, dtb__42, dtb__43) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__41)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__42)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__43)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__44) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__45) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__46) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__47, dtb__48) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__47)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__48))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__49, dtb__50) -> ((v_Base_dList_dconcatMap (fun p -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf p)) then C_Base_dList_dList_Base_dList_dNil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Base_dPair_dfirstOf p))))) dtb__50)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__51, dtb__52, dtb__53) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__53) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__51) else ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__51)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__52)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__54, dtb__55, dtb__56) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__56)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__60)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__61))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__62) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__63) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__64, dtb__65) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__66) -> (C_Base_dList_dList_Base_dList_dCons (dtb__66, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_drelevantMetas = (fun ec -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Base_dPair_dsecondOf d)))) (v_Vuna_dCompiler_dElab_dTypes_decDefs ec))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorType) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec))))

let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a -> (fun b -> (if ((bi_ge_int a) b) then a else b)))

let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__67 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> (if ((bi_eq_str mc0) dtb__69) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__70)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__68))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun name -> (fun globals -> (fun ec -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup name) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dElab_dTypes_decGlobalsComplete ec) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun d5944 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (match dtb__72 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75) -> (if (((v_Base_dEq_deq d5944) dtb__74) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig d5944) dtb__73) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79) -> (if ((bi_eq_str dtb__78) mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__77))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (match dtb__80 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__82, dtb__83, dtb__84, dtb__85) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__82) dtb__83) dtb__84) dtb__85) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__86, dtb__87, dtb__88) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__86) C_Base_dList_dList_Base_dList_dNil) dtb__87) dtb__88) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__89, dtb__90, dtb__91, dtb__92) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__103) "DT: internal: record was not desugared")
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__104, dtb__105, dtb__106, dtb__107) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__108, dtb__109, dtb__110, dtb__111) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun banned -> (fun preludeBanned -> (fun seen -> (fun acc -> (fun name -> (fun ctx -> (fun ty -> (fun sp -> (fun rest -> (if ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotRedefineBuiltin (name))) name) else (if ((v_Vuna_dCompiler_dCommon_dtblMem name) seen) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDuplicateSignature (name))) name) else (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) (((v_Vuna_dCompiler_dCommon_dtblInsert name) true) seen)) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (name, (C_Base_dPair_dPair_Base_dPair_dPair (ctx, (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf name)) banned) preludeBanned) ctx) ty) sp), sp)))))), acc))) rest))))))))))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil) decls)) (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl defined))) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match dtb__112 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__113) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, dtb__119)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__113) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (match dtb__120 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> (C_Base_dList_dList_Base_dList_dCons (dtb__122, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__121)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__121)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__128, dtb__129) -> true
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__133) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__134) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__135) -> ((bi_ge_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__135)) 0)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__136) -> ((bi_ge_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__136)) 0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__140) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__141) else false)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__142)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__143))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__144)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__145))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__146, dtb__147) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__146)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__147)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc = (fun ec -> (fun name -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup name) (v_Vuna_dCompiler_dElab_dTypes_decCtorTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun ec -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun globals -> (fun ec -> (fun name -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__151)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun globals -> (fun ec -> (fun name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun globals -> (fun ec -> (fun name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))

let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun globals -> (fun ec -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__152))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__153))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__154) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__155, dtb__156, dtb__157) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__155) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, dtb__159) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, ((v_Base_dList_dappend dtb__159) (C_Base_dList_dList_Base_dList_dCons (dtb__156, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ("", C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__164)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType mc0)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__165, dtb__166, dtb__167) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__165) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__166)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__167))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__168, dtb__169) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__168) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__169))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__170, dtb__171) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__171)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__172, dtb__173, dtb__174) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__172) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__173))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__175, dtb__176, dtb__177) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__177)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__181) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__182))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__183, dtb__184) -> ((bi_lt_int dtb__184) 0)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__185, dtb__186) -> (match dtb__185 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__187, dtb__188) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__187) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__186))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__189, dtb__190) -> (match dtb__189 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__191, dtb__192, dtb__193) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__193) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__190))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun fuel -> (fun ec -> (fun depth -> (fun t -> (if ((bi_le_int fuel) 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__194) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__194) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__195))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__196, dtb__197, dtb__198, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__199), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) 1)) dtb__200)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__201, dtb__202, dtb__203) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__201, dtb__202, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) 1)) dtb__203)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__204, dtb__205, dtb__206) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__204), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__205), dtb__206))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__207, dtb__208) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__207, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__208)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__209, dtb__210) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__209), ((v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel ((bi_sub fuel) 1)) ec) depth) alt))) dtb__210)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__211, dtb__212, dtb__213) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__211), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__212), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__213)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun fuel -> (fun ec -> (fun depth -> (fun alt0 -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", C_Base_dList_dList_Base_dList_dNil, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (0)))) else (match alt0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__214, dtb__215, dtb__216) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__214, dtb__215, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) (v_Base_dList_dlength dtb__215))) dtb__216)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun ec -> (fun depth -> (fun t -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))))

let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun ec -> (fun depth -> (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__217, true, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__221) mc1) mc2), mc2))
  | _ -> mc1
))))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__226)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__227, dtb__228) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__227), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__227))), (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__228)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__229, dtb__230, dtb__231) -> dtb__229
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__232, dtb__233, dtb__234) -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__235, dtb__236, dtb__237) -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_ddataHeadName dtb__238)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind dtb__238), (v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity dtb__238))))) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead mc0) dtb__239))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ((bi_concat "Dict_") cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ((bi_concat "MkDict_") cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__240, dtb__241) -> (match dtb__240 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__242, dtb__243, dtb__244, dtb__245) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__241) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, dtb__245)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__241) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__246, dtb__247) -> (match dtb__246 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__248, dtb__249, dtb__250, dtb__251) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__247) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__246, dtb__251)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__247) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__252, dtb__253) -> dtb__252
  | C_Base_dList_dList_Base_dList_dNil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__254, dtb__255) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (((bi_concat "x") (bi_strFromInt mc2)), ((bi_add mc1) ((bi_sub ((bi_sub mc3) 1)) mc2)))), dtb__254)), ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__255) mc1) ((bi_add mc2) 1)) mc3)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs -> (fun nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (v_Base_dList_dlength rigs))))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__256, dtb__257) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (((bi_concat "x") (bi_strFromInt mc1)), dtb__256, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__257) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ((bi_concat "f") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun remaining -> (fun n -> (fun acc -> (if ((bi_le_int remaining) 0) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo ((bi_sub remaining) 1)) n) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName ((bi_sub n) remaining)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), acc)))))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n -> (fun i -> (fun acc -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo ((bi_sub n) i)) n) acc))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname -> (fun arg -> (fun ty -> (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))))

let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if ((bi_eq_str tyName) "String") then "bi_eq_str" else "bi_eq_int"))

let rec v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__258) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__259, dtb__260, dtb__261) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__262) -> (match dtb__262 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__263, dtb__264) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__263, ((v_Base_dList_dappend dtb__264) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__260, dtb__261)), C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp dtb__259))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxItemAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__265, dtb__266) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__265)) else ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt ((bi_sub mc0) 1)) dtb__266))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType = (fun ctx -> (fun ec -> (fun lvl -> ((fun d -> ((fun idx -> (if ((bi_lt_int lvl) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if ((bi_lt_int idx) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__267) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) (v_Base_dPair_dsecondOf dtb__267))))
  | _ -> failwith "DT: impossible branch"
)))) ((bi_sub ((bi_sub d) lvl)) 1))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__268) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel ((bi_sub fuel) 1)) dtb__272) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__273) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__269, 0, C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
))))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun v -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit -> (fun dom -> ((v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom))))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__274, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__275) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__277)))), (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__278)))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> ((fun domVal -> ((fun v -> ((fun rig -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, rig)), ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__283) (C_Base_dList_dList_Base_dList_dCons (v, mc1)))))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__280) domVal))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__279, (v_Base_dList_dlength mc1), C_Base_dList_dList_Base_dList_dNil)))))) ((v_Vuna_dCompiler_dCore_dEval_deval mc1) dtb__282))
  | _ -> C_Base_dList_dList_Base_dList_dNil
)))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__284) -> (match dtb__284 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__285, dtb__286) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__285) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__287) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec -> (fun dom -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain = (fun ctx -> (fun ec -> (fun lvl -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) lvl) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__288) -> ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__288)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx = (fun fuel -> (fun ctx -> (fun ec -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__289) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294) -> ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx ((bi_sub fuel) 1)) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__294) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("ty", 0, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__295) -> (match dtb__295 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__296, dtb__297, dtb__298) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) dtb__297) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__299) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dtb__299)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__300, dtb__301) -> ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) v)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__302, dtb__303) -> true
  | _ -> false
))))))

let rec v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel = (fun fuel -> (fun ctx -> (fun ec -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__304) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__305, dtb__306, dtb__307, dtb__308, dtb__309) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx fuel) ctx) ec) dtb__308) then ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel ((bi_sub fuel) 1)) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__309) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("kind", 0, C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
))))))

let v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx = (fun ctx -> (fun ec -> (fun v -> ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel 64) ctx) ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain = (fun ctx -> (fun ec -> (fun dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dom) then true else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__310, dtb__311) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__312) -> (match dtb__312 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__313, dtb__314, dtb__315) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__314)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__316, dtb__317, dtb__318, dtb__319, dtb__320) -> (((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx ctx) ec) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))
  | _ -> false
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel -> (fun ec -> (fun ctx -> (fun v -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec)))))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__321, dtb__322, dtb__323, dtb__324, dtb__325) -> (if dtb__322 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__324) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__326, dtb__327) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel ((bi_sub fuel) 1)) dtb__327) ctx) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__325) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__326)))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__328, dtb__329) -> (match dtb__329 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__328, (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__326, dtb__330)), dtb__331))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec))))))
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))))))

let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec -> (fun ctx -> (fun v -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))))

let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name -> (fun level -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil))))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__332, dtb__333) -> dtb__332
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__334, dtb__335, dtb__336) -> dtb__334
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__337) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__337))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__338) -> true
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__339, dtb__340) -> (match dtb__339 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__341, dtb__342) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc0) dtb__341), dtb__342)), ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs mc0) dtb__340)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_detaCtorLa = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__343, dtb__344) -> (match dtb__343 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__345, dtb__346) -> ((fun binder -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (binder, dtb__346, ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa mc0) ((bi_add mc1) 1)) dtb__344) ((v_Base_dList_dappend mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (binder, (v_Base_dList_dlength dtb__344))), dtb__346)), C_Base_dList_dList_Base_dList_dNil))))))) ((bi_concat "#eta") (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropCount = (fun n -> (fun xs -> (if ((bi_le_int n) 0) then xs else (match xs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__347, dtb__348) -> ((v_Vuna_dCompiler_dElab_dMeta_ddropCount ((bi_sub n) 1)) dtb__348)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm = (fun ctor -> (fun args -> ((fun rest -> ((fun k -> ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)) 0) rest) ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs k) args))) (v_Base_dList_dlength rest))) ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (v_Base_dList_dlength args)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__349) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__349)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__349)) else (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__349))) 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (name, C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__349) C_Base_dList_dList_Base_dList_dNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec -> (fun ctx -> (fun name -> (fun tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__350) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__350)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__350)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__351) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__351))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__352) -> (match dtb__352 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__353, dtb__354) -> (match dtb__354 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__355, dtb__356) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__350) dtb__355), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__353, dtb__356))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (ctorTy, ec)))))))) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__357, dtb__358) -> (match dtb__357 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__359, dtb__360) -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__359, dtb__360))) dtb__358)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__361) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__361) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__362) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__362)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__361) else (if ((bi_ge_int (v_Base_dList_dlength mc2)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__362))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__361, mc2)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__362) mc2)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__361))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__363, dtb__364, dtb__365, dtb__366, dtb__367) -> ((bi_neq_str dtb__363) "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> dtb__369
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__370, dtb__371) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__370))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__370)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__371))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__372, dtb__373) -> (match dtb__372 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> (match dtb__374 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__376, dtb__377, dtb__378) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__373)
  | _ -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__375))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
