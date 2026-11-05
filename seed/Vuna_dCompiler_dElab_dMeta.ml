open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
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
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
type t_Vuna_dCompiler_dElab_dMeta_dValueEntry = C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor of (t_Vuna_dCompiler_dElab_dTypes_dDtCtor) | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef of (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dMeta_dDataHead = C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (int)

let rec v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel = (fun fuel ec v -> (if (fuel <= 0) then true else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel (fuel - 1)) ec) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__4) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__3))) else false)
  | _ -> true
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi = (fun ec v -> (((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel 128) ec) v))

let rec v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs = (fun mc0 mc1 -> (match mc0 with
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
))

let v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm = (fun ctor metas -> (if ((v_Base_dList_dlength metas) = (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs metas) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor)))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)))))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue = (fun name -> (if (name = v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else (if (name = v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9) -> (if dtb__9 then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue name)))

let v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName = (fun name -> (name = v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_dconvEc = (fun ec depth expected actual -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) depth) expected) actual) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__10) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__10))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__11) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__11))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo = (fun remaining stop sols -> (if (remaining <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (remaining - 1)) stop) sols)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

let v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom = (fun i stop sols -> (((v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo (stop - i)) stop) sols))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemMetaId = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if (dtb__13 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemMetaId mc0) dtb__14))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

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

let v_Vuna_dCompiler_dElab_dMeta_dmaxInt = (fun a b -> (if (a >= b) then a else b))

let rec v_Vuna_dCompiler_dElab_dMeta_dglobalLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__67 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> (if (mc0 = dtb__69) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__70)) else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup mc0) dtb__68))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup = (fun name globals ec -> (match ((v_Base_dHashMap_dlookup name) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dElab_dTypes_decGlobalsComplete ec) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemSig = (fun d6271 mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (match dtb__72 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75) -> (if (((v_Base_dEq_deq d6271) dtb__74) mc1) then true else (((v_Vuna_dCompiler_dElab_dMeta_dmemSig d6271) dtb__73) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmemDefName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79) -> (if (dtb__78 = mc0) then true else ((v_Vuna_dCompiler_dElab_dMeta_dmemDefName mc0) dtb__77))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (match dtb__80 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__82, dtb__83, dtb__84, dtb__85) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__82) dtb__83) dtb__84) dtb__85) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__86, dtb__87, dtb__88) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__86) C_Base_dList_dList_Base_dList_dNil) dtb__87) dtb__88) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__89, dtb__90, dtb__91, dtb__92) -> (((((((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne mc0) mc1) mc2) mc3) dtb__89) C_Base_dList_dList_Base_dList_dNil) dtb__91) dtb__92) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__93, dtb__94, dtb__95, dtb__96) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__107) "DT: internal: record was not desugared")
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__108, dtb__109, dtb__110, dtb__111) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__112, dtb__113, dtb__114, dtb__115) -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto mc0) mc1) mc2) mc3) dtb__81)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne = (fun banned preludeBanned seen acc name ctx ty sp rest -> (if ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotRedefineBuiltin (name))) name) else (if ((v_Base_dHashMap_dmember name) seen) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDuplicateSignature (name))) name) else (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) (((v_Base_dHashMap_dinsert name) true) seen)) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (name, (C_Base_dPair_dPair_Base_dPair_dPair (ctx, (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf name)) banned) preludeBanned) ctx) ty) sp), sp)))))), acc))) rest))))

let v_Vuna_dCompiler_dElab_dMeta_dcollectSigs = (fun decls -> ((fun defined -> ((fun banned -> ((fun preludeBanned -> (((((v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto banned) preludeBanned) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil) decls)) (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl defined))) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames decls)))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__116, dtb__117) -> (match dtb__116 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__117) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__116, dtb__123)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls dtb__117) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__125) -> (match dtb__124 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> (C_Base_dList_dList_Base_dList_dCons (dtb__126, (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__125)))
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf dtb__125)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dnonEmpty = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> true
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__137) then (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__138) else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__139) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__139) >= 0)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__140) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__140) >= 0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (if (v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed dtb__144) then (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__145) else false)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__146, dtb__147) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__146) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146)) else ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup mc0) dtb__147))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__148) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) dtb__149))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__150)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup mc0) dtb__151)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc = (fun ec name -> (match ((v_Base_dHashMap_dlookup name) (v_Vuna_dCompiler_dElab_dTypes_decCtorTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName = (fun ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__154) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal = (fun globals ec name -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__155) -> (v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed dtb__155)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disTypeName = (fun globals ec name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal globals) ec) name) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName ec) name)))

let v_Vuna_dCompiler_dElab_dMeta_dtypeLookup = (fun globals ec name -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) name) then (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dElab_dMeta_dvalueLookup = (fun globals ec name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__156))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__157))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dspineOfType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__158) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__159, dtb__160, dtb__161) -> (match (v_Vuna_dCompiler_dElab_dMeta_dspineOfType dtb__159) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__162, dtb__163) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__162, ((v_Base_dList_dappend dtb__163) (C_Base_dList_dList_Base_dList_dCons (dtb__160, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ("", C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dMeta_dresultSpine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> (v_Vuna_dCompiler_dElab_dMeta_dresultSpine dtb__168)
  | _ -> (v_Vuna_dCompiler_dElab_dMeta_dspineOfType mc0)
))

let rec v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__169, dtb__170, dtb__171) -> (if (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__169) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__170)) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__171))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__172, dtb__173) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__172) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__173))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__174, dtb__175) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__175)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__176, dtb__177, dtb__178) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__176) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__177))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__179, dtb__180, dtb__181) -> (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__181)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__185) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__186))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__187, dtb__188) -> (dtb__188 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__189, dtb__190) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__191, dtb__192) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__191) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs dtb__190))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__194) -> (match dtb__193 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__195, dtb__196, dtb__197) -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar dtb__197) then true else (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts dtb__194))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel = (fun fuel ec depth t -> (if (fuel <= 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__198) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__198) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__199) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar q) then t else ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__199))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__200, dtb__201, dtb__202, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__203), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__204)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__205, dtb__206, dtb__207) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__205, dtb__206, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + 1)) dtb__207)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__208, dtb__209, dtb__210) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__208), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__209), dtb__210))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__211, dtb__212) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__211, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__212)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__213, dtb__214) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__213), ((v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel (fuel - 1)) ec) depth) alt))) dtb__214)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__215, dtb__216, dtb__217) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__215), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__216), ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) depth) dtb__217)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel = (fun fuel ec depth alt0 -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", C_Base_dList_dList_Base_dList_dNil, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (0)))) else (match alt0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__218, dtb__219, dtb__220) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__218, dtb__219, ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel (fuel - 1)) ec) (depth + (v_Base_dList_dlength dtb__219))) dtb__220)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_dzonkTerm = (fun ec depth t -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel 64) ec) depth) t))

let v_Vuna_dCompiler_dElab_dMeta_dzonkAlt = (fun ec depth alt -> ((((v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel 64) ec) depth) alt))

let rec v_Vuna_dCompiler_dElab_dMeta_dprependFamParams = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__221, true, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dMeta_dprependFamParams dtb__225) mc1) mc2), mc2))
  | _ -> mc1
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> (v_Vuna_dCompiler_dElab_dMeta_ddropParams dtb__230)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctorGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__231), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__231))), (v_Vuna_dCompiler_dElab_dMeta_dctorGlobals dtb__232)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__233, dtb__234, dtb__235) -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__236, dtb__237, dtb__238) -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dMeta_dDataHead_Vuna_dCompiler_dElab_dMeta_dDataHead (dtb__239, dtb__240, dtb__241) -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__242, dtb__243) -> (if ((v_Vuna_dCompiler_dElab_dMeta_ddataHeadName dtb__242) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_ddataHeadKind dtb__242), (v_Vuna_dCompiler_dElab_dMeta_ddataHeadArity dtb__242))))) else ((v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead mc0) dtb__243))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_ddictTypeName = (fun cname -> ("Dict_" ^ cname))

let v_Vuna_dCompiler_dElab_dMeta_ddictCtorName = (fun cname -> ("MkDict_" ^ cname))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__244, dtb__245) -> (match dtb__244 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__246, dtb__247, dtb__248, dtb__249) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__245) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__244, dtb__249)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls dtb__245) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__250, dtb__251) -> (match dtb__250 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__252, dtb__253, dtb__254, dtb__255) -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__251) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__250, dtb__255)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls dtb__251) mc1)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dparamNameOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__256, dtb__257) -> dtb__256
  | C_Base_dList_dList_Base_dList_dNil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__258, dtb__259) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (("x" ^ (bi_strFromInt mc2)), (mc1 + ((mc3 - 1) - mc2)))), dtb__258)), ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo dtb__259) mc1) (mc2 + 1)) mc3)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms = (fun rigs nFields -> ((((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo rigs) nFields) 0) (v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__260, dtb__261) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (("x" ^ (bi_strFromInt mc1)), dtb__260, (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams dtb__261) (mc1 + 1)) mc2)))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dfieldVarName = (fun i -> ("f" ^ (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo = (fun remaining n acc -> (if (remaining <= 0) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (remaining - 1)) n) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName (n - remaining)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), acc)))))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo = (fun n i acc -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo (n - i)) n) acc))

let v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo n) 0) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam = (fun pname arg ty -> (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt 0) arg) ty))

let v_Vuna_dCompiler_dElab_dMeta_dlitEqName = (fun tyName -> (if (tyName = "String") then "bi_eq_str" else "bi_eq_int"))

let rec v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__262) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__262, C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__263, dtb__264, dtb__265) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__266) -> (match dtb__266 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__267, dtb__268) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__267, ((v_Base_dList_dappend dtb__268) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, dtb__265)), C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp dtb__263))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dMeta_dctxItemAt = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__269, dtb__270) -> (if (mc0 <= 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__269)) else ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt (mc0 - 1)) dtb__270))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType = (fun ctx ec lvl -> ((fun d -> ((fun idx -> (if (lvl < 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (idx < 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dElab_dMeta_dctxItemAt idx) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__271) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) idx) (v_Base_dPair_dsecondOf dtb__271))))
  | _ -> failwith "DT: impossible branch"
)))) ((d - lvl) - 1))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__272) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (if ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) dtb__276) then ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__277) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__273, 0, C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue = (fun v -> ((v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel 128) v))

let v_Vuna_dCompiler_dElab_dMeta_disTypeDomain = (fun v -> (v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue v))

let v_Vuna_dCompiler_dElab_dMeta_dbinderRig = (fun implicit dom -> ((v_Vuna_dCompiler_dCore_dTerm_drigOfBinder implicit) (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom)))

let rec v_Vuna_dCompiler_dElab_dMeta_dsplitKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__278, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__279) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__281)))), (v_Vuna_dCompiler_dElab_dMeta_dsplitKind dtb__282)))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dElab_dMeta_dteleOf = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> ((fun domVal -> ((fun v -> ((fun rig -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, rig)), ((v_Vuna_dCompiler_dElab_dMeta_dteleOf dtb__287) (C_Base_dList_dList_Base_dList_dCons (v, mc1)))))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__284) domVal))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__283, (v_Base_dList_dlength mc1), C_Base_dList_dList_Base_dList_dNil)))))) ((v_Vuna_dCompiler_dCore_dEval_deval mc1) dtb__286))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dMeta_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dMeta_dteleOf ty) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dMeta_disDataHead = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__288) -> (match dtb__288 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__289, dtb__290) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__289) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__291) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disIndexDomain = (fun ec dom -> (if (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dom) then true else ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain = (fun ctx ec lvl -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) lvl) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__292) -> ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dtb__292)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__293) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298) -> ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx (fuel - 1)) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__298) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("ty", 0, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__299) -> (match dtb__299 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__300, dtb__301, dtb__302) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType ctx) ec) dtb__301) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__303) -> (v_Vuna_dCompiler_dElab_dMeta_disTypeDomain dtb__303)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__304, dtb__305) -> ((v_Vuna_dCompiler_dElab_dMeta_disDataHead (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) v)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__306, dtb__307) -> true
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel = (fun fuel ctx ec v -> (if (fuel <= 0) then false else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__308) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> (if ((((v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx fuel) ctx) ec) dtb__312) then ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel (fuel - 1)) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__313) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("kind", 0, C_Base_dList_dList_Base_dList_dNil)))))) else false)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx = (fun ctx ec v -> ((((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel 64) ctx) ec) v))

let v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain = (fun ctx ec dom -> (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain ec) dom) then true else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__314, dtb__315) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__316) -> (match dtb__316 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__317, dtb__318, dtb__319) -> (((v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain ctx) ec) dtb__318)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__320, dtb__321, dtb__322, dtb__323, dtb__324) -> (((v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx ctx) ec) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel = (fun fuel ec ctx v -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec)))))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> (if dtb__326 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__328) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel (fuel - 1)) dtb__331) ctx) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__329) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__330)))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__332, dtb__333) -> (match dtb__333 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__334, dtb__335) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__332, (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__330, dtb__334)), dtb__335))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ec))))))
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor = (fun ec ctx v -> ((((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel 64) ec) ctx) v))

let v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue = (fun name level -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__336, dtb__337) -> dtb__336
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__338, dtb__339, dtb__340) -> dtb__338
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal = (fun name -> (name = v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dMeta_disBoolType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__341) -> (v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal (v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName dtb__341))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_disSortVal = (fun ec v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__342) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__343, dtb__344) -> (match dtb__343 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__345, dtb__346) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc0) dtb__345), dtb__346)), ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs mc0) dtb__344)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_detaCtorLa = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__347, dtb__348) -> (match dtb__347 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__349, dtb__350) -> ((fun binder -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (binder, dtb__350, ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa mc0) (mc1 + 1)) dtb__348) ((v_Base_dList_dappend mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (binder, (v_Base_dList_dlength dtb__348))), dtb__350)), C_Base_dList_dList_Base_dList_dNil))))))) ("#eta" ^ (bi_strFromInt mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (mc0, mc3))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_ddropCount = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__351, dtb__352) -> ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (n - 1)) dtb__352)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm = (fun ctor args -> ((fun rest -> ((fun k -> ((((v_Vuna_dCompiler_dElab_dMeta_detaCtorLa (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName ctor)) 0) rest) ((v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs k) args))) (v_Base_dList_dlength rest))) ((v_Vuna_dCompiler_dElab_dMeta_ddropCount (v_Base_dList_dlength args)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

let v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm = (fun datas name -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__353) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__353)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__353)) else (if ((v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__353)) = 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (name, C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__353) C_Base_dList_dList_Base_dList_dNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef = (fun ec ctx name tyTerm -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__354) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__354)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__354)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi ec) ctorTy) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__355) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__355))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__356) -> (match dtb__356 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__357, dtb__358) -> (match dtb__358 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__359, dtb__360) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm dtb__354) dtb__359), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__357, dtb__360))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor ec) ctx) ctorTy)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (ctorTy, ec)))))))) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__361, dtb__362) -> (match dtb__361 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__363, dtb__364) -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__363, dtb__364))) dtb__362)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__365) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup dtb__365) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__366) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__366)) then (v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm dtb__365) else (if ((v_Base_dList_dlength mc2) >= (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__366))) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__365, mc2)) else ((v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm dtb__366) mc2)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__365))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms mc1) mc2)
))

let v_Vuna_dCompiler_dElab_dMeta_dhasFamParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__367, dtb__368, dtb__369, dtb__370, dtb__371) -> (dtb__367 <> "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> dtb__373
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__374, dtb__375) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__374)) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__374)) else ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName mc0) dtb__375))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable = (fun ec -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))))) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__376, dtb__377) -> (match dtb__376 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__378, dtb__379) -> (match dtb__378 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__380, dtb__381, dtb__382) -> (v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody dtb__377)
  | _ -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__379))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
