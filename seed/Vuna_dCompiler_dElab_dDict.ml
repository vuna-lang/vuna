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
type t_Vuna_dCompiler_dElab_dDict_dInstMatch = C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch of (t_Vuna_dCompiler_dElab_dTypes_dDtInst) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)

let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec -> (fun g -> ((v_Base_dList_dmemName g) ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)))))

let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun ec -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily ec) dtb__1)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec -> (fun dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_dinstMatchInst = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__3, dtb__4) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dinstMatchTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__5, dtb__6) -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmissingInstance = (fun ec -> (fun dom -> (fun sp -> ((fun sd -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dNoInstanceFound (sd))) sd)) (v_Vuna_dCompiler_dCore_dEval_dshowValue dom)))))

let rec v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (match dtb__7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> ((fun v -> (if ((v_Vuna_dCompiler_dElab_dDict_disDictValue mc3) v) then (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc3)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) 0) v) mc2) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__11) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__9, mc1)), ((v_Vuna_dCompiler_dElab_dTypes_decPutSols mc3) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__11))))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__12) -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) ((bi_add mc1) 1)) mc2) mc3) dtb__8)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) ((bi_add mc1) 1)) mc2) mc3) dtb__8))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc1) dtb__10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup = (fun ctx -> (fun i -> (fun dom -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx) with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo ctx) i) dom) ec) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx))
)))))

let rec v_Vuna_dCompiler_dElab_dDict_dallInstancesMono = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele dtb__13) with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtInstCtx dtb__13) with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono dtb__14)
  | _ -> false
)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dtermMetaId = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__15) -> dtb__15
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc0) mc1) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, dtb__19) -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas mc0) dtb__19) dtb__17) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, dtb__21) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dDict_dtermMetaId dtb__18), dtb__20)), dtb__21))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__22) (v_Vuna_dCompiler_dElab_dTypes_decSols mc0)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas mc0) dtb__23) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__25) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__27) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigs (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__26), dtb__28))) dtb__27) dtb__29)
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigs (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__26), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) dtb__27) C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dDict_dpiRigs = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> (C_Base_dList_dList_Base_dList_dCons (dtb__32, (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__34)))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal = (fun ec -> (fun g -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup g) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__35) -> (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__35)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_ddictTermOfValue = (fun ec -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__36) -> (match dtb__36 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__37, dtb__38) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigs (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__37))) dtb__38) ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__37))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let rec v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo = (fun ec -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__39) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__39) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__40) -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictTermOfValue ec) dtb__40) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) dtb__41) then t else (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) depth) dtb__41))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun soln0 -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln0) then t else soln0)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__40))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__42, dtb__43, dtb__44, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) dtb__45), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) ((bi_add depth) 1)) dtb__46)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__47, dtb__48, dtb__49) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__47, dtb__48, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) ((bi_add depth) 1)) dtb__49)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__50, dtb__51, dtb__52) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) dtb__50), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) dtb__51), dtb__52))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__53, dtb__54) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__53, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__54)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__55, dtb__56) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) dtb__55), ((v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt ec) depth) alt))) dtb__56)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__57, dtb__58, dtb__59) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) dtb__57), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) dtb__58), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) depth) dtb__59)))
  | _ -> t
))))
and v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt = (fun ec -> (fun depth -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__60, dtb__61, dtb__62) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__60, dtb__61, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) ((bi_add depth) (v_Base_dList_dlength dtb__61))) dtb__62)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec -> (fun t -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) 0) t)))

let rec v_Vuna_dCompiler_dElab_dDict_dfilterInstances = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64) -> ((fun hd -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc0)) mc3) 0) mc1) hd) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__65) -> ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances mc0) mc1) dtb__64) mc3)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__66) -> (match ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances mc0) mc1) dtb__64) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__67, dtb__68) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__67)), dtb__66))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__63))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc3))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__69, dtb__70) -> ((bi_concat ", ") ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__69)) (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__70)))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__71)) (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__72))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dinstDictName = (fun inst -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> (match dtb__73 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__74))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst))))

let v_Vuna_dCompiler_dElab_dDict_dinstHeadArg = (fun inst -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__76) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (match dtb__78 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (v_Base_dPair_dfirstOf dtb__79)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst))))

let rec v_Vuna_dCompiler_dElab_dDict_dfindClassByDict = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__81))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81)) else ((v_Vuna_dCompiler_dElab_dDict_dfindClassByDict mc0) dtb__82))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dinstClassOfDict = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> ((v_Vuna_dCompiler_dElab_dDict_dfindClassByDict dtb__83) mc1)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dmethodNameMatches = (fun a -> (fun b -> (if ((bi_eq_str a) b) then true else ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf a)) (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf b)))))

let rec v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__84, dtb__85) -> (if ((v_Vuna_dCompiler_dElab_dDict_dmethodNameMatches mc0) (v_Base_dPair_dfirstOf dtb__84)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo mc0) dtb__85) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDict_dclassMethodIndex = (fun mname -> (fun methods -> (((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo mname) methods) 0)))

let rec v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> (if ((bi_le_int mc0) 0) then dtb__86 else ((v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt ((bi_sub mc0) 1)) dtb__87))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec -> (fun dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__88) -> (match dtb__88 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__89, dtb__90) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__91) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__92) with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__93))) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun v -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__100) -> (match dtb__100 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__101, dtb__102) -> (match dtb__102 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__101, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> v
)
  | _ -> v
)
  | _ -> v
)) v))

let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals -> (fun ec -> (fun ctx -> (fun forced -> (fun argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__105) -> (match dtb__105 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__106, dtb__107) -> (match dtb__107 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__106) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__108) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__108))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__109) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__110) -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)))))))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec -> (fun dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__111) -> (match dtb__111 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__112, dtb__113) -> (match dtb__113 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (match dtb__115 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_dclassArgIndex = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__116) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__116) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__117) -> (match dtb__117 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__118, dtb__119, dtb__120) -> dtb__119
  | _ -> 0
)
  | _ -> 0
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> 0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar = (fun ec -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__121) -> (match dtb__121 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__122, dtb__123, dtb__124) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__125, dtb__126) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__126)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__127, dtb__128) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__128)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__129, dtb__130) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__129) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__130))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__131, dtb__132) -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__131)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__133, dtb__134, dtb__135) -> (if (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__133) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__134)) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) ((bi_sub fuel) 1)) dtb__135))
  | _ -> false
)))))
and v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar mc0) mc1) dtb__136) then true else (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar mc0) mc1) dtb__137))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec -> (fun arg -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) 64) arg)))

let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg ec) dtb__138)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_drigidSearchFast = (fun ec -> (fun dom -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dom) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) else false)))

let rec v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel = (fun globals -> (fun ctx -> (fun fuel -> (fun ec -> (fun dom -> (fun sp -> (if ((bi_le_int fuel) 0) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else (match ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup ctx) 0) dom) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__139) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__139))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> (match dtb__140 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (match dtb__143 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dDict_dinstMatchTerm dtb__142), dtb__141))))
  | _ -> ((fun sd -> ((fun names -> ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dAmbiguousInstance (sd, names))) sd) names)) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dDict_dinstMatchInst) dtb__140)))) (v_Vuna_dCompiler_dCore_dEval_dshowValue dom))
)
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance dtb__141) dom) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) ec) dom) sp) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dDict_dmatchInstances = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__145) mc7)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146) -> (match dtb__146 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) dtb__148) mc4) mc5) dtb__145) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__144, dtb__147)), mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dtryMatchInst mc0) mc1) mc2) mc3) dtb__144) mc4) mc5))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc7), mc3))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dDict_dtryMatchInst = (fun globals -> (fun ctx -> (fun fuel -> (fun ec -> (fun inst -> (fun dom -> (fun sp -> (if ((bi_le_int fuel) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas ctx) ec) (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele inst)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__149, dtb__150) -> ((fun hd -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__150)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__150)) 0) dom) hd) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__151) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__152) -> ((fun ec2 -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas ec2) dtb__149) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153) -> ((fun teleArgs -> ((fun env2 -> ((fun ctxVals -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__154) -> (match dtb__154 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__155, dtb__156) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst)))) ((v_Base_dList_dappend teleArgs) dtb__155)), dtb__156))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs globals) ctx) ((bi_sub fuel) 1)) ec2) sp) ctxVals) C_Base_dList_dList_Base_dList_dNil))) ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) ((v_Vuna_dCompiler_dCore_dEval_deval env2) t)))) (v_Vuna_dCompiler_dElab_dTypes_ddtInstCtx inst)))) ((v_Base_dList_dmap (fun v -> ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v))) dtb__153))) ((v_Base_dList_dmap (fun v -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)))) (v_Base_dList_dreverse dtb__153)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__150) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__152)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dmap (fun m -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, C_Base_dList_dList_Base_dList_dNil)))) dtb__149)) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__159) -> (match dtb__159 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs mc0) mc1) mc2) dtb__161) mc4) dtb__158) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__162) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel mc0) mc1) mc2) mc3) dtb__157) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc6), mc3))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn = (fun globals -> (fun ctx -> (fun ec -> (fun dom -> (fun sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) 16) ec) dom) sp))))))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec -> (fun dom -> (fun sp -> (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn C_Base_dList_dList_Base_dList_dNil) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dom) sp))))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel = (fun fuel -> (fun globals -> (fun ec -> (if ((bi_le_int fuel) 0) then ec else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (match dtb__163 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__165, dtb__166) -> ((fun ec1 -> ((fun forced -> ((fun keep -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec1) forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__167) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec1)) dtb__167) then keep else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg ec1) dtb__167) then keep else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__168) -> keep
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__169) -> (match dtb__169 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__171)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__171)) 0) dtb__165) C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__170)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__172) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((bi_sub fuel) 1)) globals) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__171) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__172)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__173) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec1) forced) (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> keep
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((bi_sub fuel) 1)) globals) ec1)) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__165, forced))))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__166))) ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals ec) dtb__164))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ec
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))))))

let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals -> (fun ec -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel 64) globals) ec)))

let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals -> (fun ctx -> (fun mname -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun dictTy -> (fun ec -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__174, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__175) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, dictTy)))))))))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)))))))))))

let v_Vuna_dCompiler_dElab_dDict_dcmpOps = (C_Base_dList_dList_Base_dList_dCons ("<", (C_Base_dList_dList_Base_dList_dCons ("<=", (C_Base_dList_dList_Base_dList_dCons (">", (C_Base_dList_dList_Base_dList_dCons (">=", C_Base_dList_dList_Base_dList_dNil))))))))

let v_Vuna_dCompiler_dElab_dDict_disCmpOp = (fun name -> ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dElab_dDict_dcmpOps))

let v_Vuna_dCompiler_dElab_dDict_dcmpMethodName = (fun name -> (if ((bi_eq_str name) "<") then "lt" else (if ((bi_eq_str name) "<=") then "le" else (if ((bi_eq_str name) ">") then "gt" else "ge"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpGenericName = (fun name -> (if ((bi_eq_str name) "<") then "bi_lt_generic" else (if ((bi_eq_str name) "<=") then "bi_le_generic" else (if ((bi_eq_str name) ">") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun sp -> (fun name -> (fun tyName -> (if ((bi_eq_str tyName) "Int") then (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int"))))) else (if ((bi_eq_str tyName) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))) else (if ((bi_eq_str tyName) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))) else ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dOpNotDefinedFor (name, tyName))) name) tyName)))))))

let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__176) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__177, dtb__178) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__177) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179) -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__180) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName name) dtb__180)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dEqRequiresEvidence (st))) st)) (v_Vuna_dCompiler_dCore_dEval_dshowValue ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__182) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__182)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__183) -> (match dtb__183 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__184, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), dtb__185))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__181)), (C_Base_dList_dList_Base_dList_dCons (aTy, C_Base_dList_dList_Base_dList_dNil)))))))) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__181)) (if ((bi_eq_str name) "==") then "eq" else "neq")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__186) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) name) dtb__186)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st -> ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dOpNotDefinedFor (name, st))) name) st)) (v_Vuna_dCompiler_dCore_dEval_dshowValue ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__188) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__188)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__189) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__190, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), dtb__191))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__187)), (C_Base_dList_dList_Base_dList_dCons (aTy, C_Base_dList_dList_Base_dList_dNil)))))))) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__187)) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodName name)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name -> (fun a -> (fun b -> (if ((bi_eq_str name) "&&") then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, b, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)), b))))))
