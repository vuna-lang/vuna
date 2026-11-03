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

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun i -> (fun ids -> (match ids with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if ((bi_eq_int dtb__13) i) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) dtb__14))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__15) -> (C_Base_dList_dList_Base_dList_dCons (dtb__15, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__16, dtb__17) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__18) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__19) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__23)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__24))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__25, dtb__26, dtb__27) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__27)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__28, dtb__29, dtb__30) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__28)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__29))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__31, dtb__32) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Base_dPair_dfirstOf p)))) dtb__32)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__33, dtb__34) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__33)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__35) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__36) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__37) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__38, dtb__39, dtb__40) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__38)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__39)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__40)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__41) -> (C_Base_dList_dList_Base_dList_dCons (dtb__41, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__42, dtb__43) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__44) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__45) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__49)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__50))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__51, dtb__52, dtb__53) -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__53)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__54, dtb__55, dtb__56) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__56) then (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__54) else ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__54)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__55)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__57, dtb__58) -> ((v_Base_dList_dconcatMap (fun p -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased (v_Base_dPair_dsecondOf p)) then C_Base_dList_dList_Base_dList_dNil else (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Base_dPair_dfirstOf p))))) dtb__58)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__59, dtb__60) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__59)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__60))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__61) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__62) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__63) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__64, dtb__65, dtb__66) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__64)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__65)) (v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime dtb__66)))
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

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun d5069 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (match dtb__72 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75) -> (if (((v_Base_dEq_deq d5069) dtb__74) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig d5069) dtb__73) mc1))
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

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (match dtb__80 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__82, dtb__83, dtb__84) -> (((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) dtb__82) dtb__83) dtb__84) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__85, dtb__86, dtb__87) -> (((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) dtb__85) dtb__86) dtb__87) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__88, dtb__89, dtb__90, dtb__91) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__102) "DT: internal: record was not desugared")
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__103, dtb__104, dtb__105, dtb__106) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) dtb__81)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun defined -> (fun seen -> (fun acc -> (fun name -> (fun ty -> (fun sp -> (fun rest -> (if ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dCannotRedefineBuiltin (name))) name) else (if ((v_Vuna_dCompiler_dCommon_dtblMem name) seen) then (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dDuplicateSignature (name))) name) else ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto defined) (((v_Vuna_dCompiler_dCommon_dtblInsert name) true) seen)) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (name, (((v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig ((v_Vuna_dCompiler_dElab_dSig_dbannedForModule name) defined)) ty) sp))), acc))) rest))))))))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun defined -> ((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto defined) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil) decls)) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

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

let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun dom -> (match dom with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__130) -> ((bi_ge_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__130)) 0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__134) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__135) else false)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__136, dtb__137, dtb__138, dtb__139, dtb__140) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__139) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__140) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__141) -> ((bi_ge_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__141)) 0)
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

let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun ec -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun globals -> (fun ec -> (fun name -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__150)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun globals -> (fun ec -> (fun name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun globals -> (fun ec -> (fun name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))

let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun globals -> (fun ec -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__151))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__152))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__153, dtb__154, dtb__155) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__153) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, ((v_Base_dList_dappend dtb__157) (C_Base_dList_dList_Base_dList_dCons (dtb__154, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__158) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, C_Base_dList_dList_Base_dList_dNil))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ("", C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__163)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType ty)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__164, dtb__165) -> ((bi_lt_int dtb__165) 0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__169) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__170))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__171, dtb__172, dtb__173) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__173)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__174, dtb__175, dtb__176) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__174) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__175))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__177, dtb__178) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__178)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__179, dtb__180) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__179) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__180))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__181, dtb__182, dtb__183) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__181) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__182)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__183))
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (match dtb__184 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__186) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__185))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (match dtb__188 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__190, dtb__191, dtb__192) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__192) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__189))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun fuel -> (fun ec -> (fun depth -> (fun t -> (if ((bi_le_int fuel) 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__193) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__193) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__194) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__194))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__195, dtb__196, dtb__197, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__198), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) 1)) dtb__199)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__200, dtb__201, dtb__202) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__200, dtb__201, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) 1)) dtb__202)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__203, dtb__204, dtb__205) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__203), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__204), dtb__205))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__206, dtb__207) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__206, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__207)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__208, dtb__209) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__208), ((v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel ((bi_sub fuel) 1)) ec) depth) alt))) dtb__209)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__210, dtb__211, dtb__212) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__210), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__211), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) depth) dtb__212)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun fuel -> (fun ec -> (fun depth -> (fun alt0 -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", C_Base_dList_dList_Base_dList_dNil, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (0)))) else (match alt0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__213, dtb__214, dtb__215) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__213, dtb__214, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel ((bi_sub fuel) 1)) ec) ((bi_add depth) (v_Base_dList_dlength dtb__214))) dtb__215)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun ec -> (fun depth -> (fun t -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))))

let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun ec -> (fun depth -> (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun kindTerm -> (fun tyExpr -> (fun sp -> (match kindTerm with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__216, true, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", sp)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__220) tyExpr) sp), sp))
  | _ -> tyExpr
))))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__225)
  | _ -> t
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__226, dtb__227) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__226), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__226))), (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__227)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__228, dtb__229, dtb__230) -> dtb__228
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__231, dtb__232, dtb__233) -> dtb__232
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__234, dtb__235, dtb__236) -> dtb__236
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun name -> (fun heads -> (match heads with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__237, dtb__238) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_ddataHeadName dtb__237)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind dtb__237), (v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity dtb__237))))) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead name) dtb__238))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ((bi_concat "Dict_") cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ((bi_concat "MkDict_") cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__239, dtb__240) -> (match dtb__239 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__241, dtb__242, dtb__243, dtb__244) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__240) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__239, dtb__244)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__240) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__245, dtb__246) -> (match dtb__245 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__246) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, dtb__251)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__246) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__252, dtb__253) -> dtb__252
  | C_Base_dList_dList_Base_dList_dNil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun rigs -> (fun nFields -> (fun i -> (fun arity -> (match rigs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__254, dtb__255) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (((bi_concat "x") (bi_strFromInt i)), ((bi_add nFields) ((bi_sub ((bi_sub arity) 1)) i)))), dtb__254)), ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__255) nFields) ((bi_add i) 1)) arity)))
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

let rec v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__258, dtb__259, dtb__260) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__261) -> (match dtb__261 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__262, dtb__263) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__262, ((v_Base_dList_dappend dtb__263) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__259, dtb__260)), C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp dtb__258))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__264) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__265) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__266, dtb__267, dtb__268, dtb__269, dtb__270) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel ((bi_sub fuel) 1)) dtb__269) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__270) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__266, 0, C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
))))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun v -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit -> (fun dom -> ((v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom))))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__271, dtb__272, dtb__273, dtb__274, dtb__275) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__271, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__272) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__274)))), (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__275)))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280) -> ((fun domVal -> ((fun v -> ((fun rig -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__276, rig)), ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__280) (C_Base_dList_dList_Base_dList_dCons (v, env)))))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__277) domVal))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__276, (v_Base_dList_dlength env), C_Base_dList_dList_Base_dList_dNil)))))) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__279))
  | _ -> C_Base_dList_dList_Base_dList_dNil
)))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun datas -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__281) -> (match dtb__281 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__282, dtb__283) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__282) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__284) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec -> (fun dom -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel -> (fun ec -> (fun ctx -> (fun v -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec)))))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289) -> (if dtb__286 then (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__288) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__290, dtb__291) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel ((bi_sub fuel) 1)) dtb__291) ctx) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__289) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__290)))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, dtb__293) -> (match dtb__293 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__295) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__290, dtb__294)), dtb__295))))))
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

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__296, dtb__297, dtb__298) -> dtb__296
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__299, dtb__300) -> dtb__299
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> ((bi_eq_str name) v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__301) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__301))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__302) -> true
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__303) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__303)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__303)) else (if ((bi_eq_generic (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__303)) C_Base_dList_dList_Base_dList_dNil) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (name, C_Base_dList_dList_Base_dList_dNil)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec -> (fun ctx -> (fun name -> (fun tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__304) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__304)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__304)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__305) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__305))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__306) -> (match dtb__306 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, dtb__308) -> (match dtb__308 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__309, dtb__310) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__304) dtb__309), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, dtb__310))))))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__311, dtb__312) -> (match dtb__311 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__313, dtb__314) -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__313, dtb__314))) dtb__312)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__315) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__315) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__316) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__316)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__315) else (if ((bi_ge_int (v_Base_dList_dlength mc2)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__316))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__315, mc2)) else ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__315))) mc2)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__315))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> ((bi_neq_str dtb__317) "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__322, dtb__323) -> dtb__323
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__324, dtb__325) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__324))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__324)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__325))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__326, dtb__327) -> (match dtb__326 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__328, dtb__329) -> (match dtb__328 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__330, dtb__331, dtb__332) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__327)
  | _ -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__329))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
