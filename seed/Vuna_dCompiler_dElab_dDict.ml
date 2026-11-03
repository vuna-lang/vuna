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
let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec -> (fun g -> ((v_Base_dList_dmemName g) ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)))))

let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun ec -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily ec) dtb__1)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec -> (fun dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec -> (fun t -> ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) t)))

let rec v_Vuna_dCompiler_dElab_dDict_dfilterInstances = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> ((fun hd -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc0)) mc3) 0) mc1) hd) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__5) -> ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances mc0) mc1) dtb__4) mc3)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__6) -> (match ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances mc0) mc1) dtb__4) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__7, dtb__8) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__7)), dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__3))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc3))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> ((bi_concat ", ") ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__9)) (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__10)))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__11)) (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__12))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec -> (fun dom -> (fun sp -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> (match dtb__13 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (match dtb__16 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__15))), ((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__14))))))
  | _ -> ((fun sd -> ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dAmbiguousInstance (sd, (v_Vuna_dCompiler_dElab_dDict_djoinInstNames dtb__13)))) sd) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames dtb__13))) (v_Vuna_dCompiler_dCore_dEval_dshowValue dom))
)
  | C_Base_dList_dList_Base_dList_dNil -> ((fun sd -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dNoInstanceFound (sd))) sd)) (v_Vuna_dCompiler_dCore_dEval_dshowValue dom))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances ec) dom) ((v_Base_dList_dfilter (fun i -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dTypes_ddtInstNamed i)))) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec))) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec))))))

let v_Vuna_dCompiler_dElab_dDict_dmethodNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__17, dtb__18) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dDict_dinstNamedLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__19, dtb__20) -> (if (if (v_Vuna_dCompiler_dElab_dTypes_ddtInstNamed dtb__19) then ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__19)) mc0) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19)) else ((v_Vuna_dCompiler_dElab_dDict_dinstNamedLookup mc0) dtb__20))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dinstDictName = (fun inst -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21) -> (match dtb__21 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__22))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst))))

let v_Vuna_dCompiler_dElab_dDict_dinstHeadArg = (fun inst -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (match dtb__24 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (match dtb__26 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (v_Base_dPair_dfirstOf dtb__27)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst))))

let rec v_Vuna_dCompiler_dElab_dDict_dfindClassByDict = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__29))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29)) else ((v_Vuna_dCompiler_dElab_dDict_dfindClassByDict mc0) dtb__30))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dinstClassOfDict = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__31) -> ((v_Vuna_dCompiler_dElab_dDict_dfindClassByDict dtb__31) mc1)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dmethodNameMatches = (fun a -> (fun b -> (if ((bi_eq_str a) b) then true else ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf a)) (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf b)))))

let rec v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (if ((v_Vuna_dCompiler_dElab_dDict_dmethodNameMatches mc0) (v_Base_dPair_dfirstOf dtb__32)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo mc0) dtb__33) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDict_dclassMethodIndex = (fun mname -> (fun methods -> (((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo mname) methods) 0)))

let rec v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (if ((bi_le_int mc0) 0) then dtb__34 else ((v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt ((bi_sub mc0) 1)) dtb__35))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dinferInstSel = (fun globals -> (fun ctx -> (fun ec -> (fun meth -> (fun iname -> (fun sp -> (match (v_Vuna_dCompiler_dElab_dDict_dmethodNameOf meth) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceAnnotationWrongUse)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (match ((v_Vuna_dCompiler_dElab_dDict_dinstNamedLookup iname) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnknownNamedInstance (iname))) iname)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37) -> (match ((v_Vuna_dCompiler_dElab_dDict_dinstClassOfDict (v_Vuna_dCompiler_dElab_dDict_dinstDictName dtb__37)) (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceNotTrait (iname))) iname)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> (match ((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndex dtb__36) (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__38)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dNotTraitMethod (dtb__36, (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__38)))) dtb__36) (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__38))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> ((fun nFields -> ((fun fty -> ((fun instTy -> ((fun rigs -> ((fun fieldVar -> ((fun applied -> ((fun alt -> ((fun proj -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (proj, (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) instTy), ec))))))) (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (iname)), (C_Base_dList_dList_Base_dList_dCons (alt, C_Base_dList_dList_Base_dList_dNil))))))) (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__38)), (v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields), applied)))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) ((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields)))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName dtb__39), ((bi_sub ((bi_sub nFields) 1)) dtb__39))))) ((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dMeta_dbinderRig) fty))) (((v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassParams dtb__38))) (v_Vuna_dCompiler_dElab_dDict_dinstHeadArg dtb__37)) fty))) ((v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt dtb__39) (v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys dtb__38)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__38)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec -> (fun dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__40) -> (match dtb__40 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__41, dtb__42) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__43) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__43) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__44) with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__45, dtb__46) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__45))) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__50))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun v -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__52) -> (match dtb__52 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__53, dtb__54) -> (match dtb__54 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__53, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> v
)
  | _ -> v
)
  | _ -> v
)) v))

let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals -> (fun ec -> (fun ctx -> (fun forced -> (fun argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__57) -> (match dtb__57 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__58, dtb__59) -> (match dtb__59 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__58) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__60))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__61) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__62) -> false
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
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__63) -> (match dtb__63 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__64, dtb__65) -> (match dtb__65 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (match dtb__67 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_dclassArgIndex = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__68) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__68) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__69) -> (match dtb__69 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__70, dtb__71, dtb__72) -> dtb__71
  | _ -> 0
)
  | _ -> 0
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> 0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec -> (fun arg -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) arg) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__73) -> (match dtb__73 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__74, dtb__75, dtb__76) -> true
  | _ -> false
)
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel = (fun fuel -> (fun globals -> (fun ec -> (if ((bi_le_int fuel) 0) then ec else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> (match dtb__77 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__79, dtb__80) -> ((fun ec1 -> ((fun forced -> ((fun keep -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec1) forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec1)) dtb__81) then keep else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg ec1) dtb__81) then keep else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__82) -> keep
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__83) -> (match dtb__83 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__85)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__85)) 0) dtb__79) C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__84)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__86) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((bi_sub fuel) 1)) globals) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__85) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__86)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__87) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec1) forced) (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> keep
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((bi_sub fuel) 1)) globals) ec1)) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__79, forced))))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__80))) ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals ec) dtb__78))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ec
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))))))

let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals -> (fun ec -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel 64) globals) ec)))

let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__88) -> ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg ec) dtb__88)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dgenericEqApp = (fun name -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> ((fun rt -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) (if ((bi_eq_str name) "==") then "bi_eq_generic" else "bi_neq_generic"))))))

let rec v_Vuna_dCompiler_dElab_dDict_dtermHasPi = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__94, dtb__95, dtb__96) -> (if (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__94) then true else (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__95))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__97, dtb__98) -> (v_Vuna_dCompiler_dElab_dDict_dtermHasPiArgs dtb__98)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__99, dtb__100, dtb__101) -> (if (if (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__99) then true else (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__100)) then true else (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__101))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__102, dtb__103) -> (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__102)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dDict_dtermHasPiArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (match dtb__104 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (if (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__106) then true else (v_Vuna_dCompiler_dElab_dDict_dtermHasPiArgs dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_ddropDataParams = (fun n -> (fun t -> (if ((bi_le_int n) 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> ((v_Vuna_dCompiler_dElab_dDict_ddropDataParams ((bi_sub n) 1)) dtb__112)
  | _ -> t
))))

let rec v_Vuna_dCompiler_dElab_dDict_dctorFieldsComparable = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> (if (v_Vuna_dCompiler_dElab_dDict_dtermHasPi dtb__116) then false else (v_Vuna_dCompiler_dElab_dDict_dctorFieldsComparable dtb__117))
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dDict_ddataByName = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__118, dtb__119) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__118)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__118)) else ((v_Vuna_dCompiler_dElab_dDict_ddataByName dtb__119) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dprimitiveComparable = (fun g -> (if (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dboolTypeName)))

let rec v_Vuna_dCompiler_dElab_dDict_dallCtorsComparable = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (if (v_Vuna_dCompiler_dElab_dDict_dctorFieldsComparable ((v_Vuna_dCompiler_dElab_dDict_ddropDataParams (v_Base_dList_dlength mc3)) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__120))) then (((((v_Vuna_dCompiler_dElab_dDict_dallCtorsComparable mc0) mc1) mc2) mc3) dtb__121) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dDict_dtypeComparable = (fun ec -> (fun fuel -> (fun seen -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__122) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__123) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__124) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__125, dtb__126) -> (if (v_Vuna_dCompiler_dElab_dDict_dprimitiveComparable dtb__125) then true else (((((v_Vuna_dCompiler_dElab_dDict_ddataComparable ec) ((bi_sub fuel) 1)) seen) dtb__125) dtb__126))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__127) -> (match dtb__127 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__128, dtb__129) -> (if (v_Vuna_dCompiler_dElab_dDict_dprimitiveComparable dtb__128) then true else (((((v_Vuna_dCompiler_dElab_dDict_ddataComparable ec) ((bi_sub fuel) 1)) seen) dtb__128) dtb__129))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__130, dtb__131, dtb__132) -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__133) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__139, dtb__140, dtb__141) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__142, dtb__143) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__144, dtb__145) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__146, dtb__147, dtb__148) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__149, dtb__150) -> false
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dDict_ddataComparable = (fun ec -> (fun fuel -> (fun seen -> (fun name -> (fun args -> (if ((v_Base_dList_dmemName name) seen) then true else (match ((v_Vuna_dCompiler_dElab_dDict_ddataByName (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> (if ((((v_Vuna_dCompiler_dElab_dDict_danyValueUnsafe ec) fuel) (C_Base_dList_dList_Base_dList_dCons (name, seen))) args) then false else (((((v_Vuna_dCompiler_dElab_dDict_dallCtorsComparable ec) fuel) (C_Base_dList_dList_Base_dList_dCons (name, seen))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataParams dtb__151)) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__151)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dDict_danyValueUnsafe = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (if ((((v_Vuna_dCompiler_dElab_dDict_dtypeComparable mc0) mc1) mc2) dtb__152) then ((((v_Vuna_dCompiler_dElab_dDict_danyValueUnsafe mc0) mc1) mc2) dtb__153) else true)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dDict_dgenericEqSafe = (fun name -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (if ((((v_Vuna_dCompiler_dElab_dDict_dtypeComparable ec) 64) C_Base_dList_dList_Base_dList_dNil) aTy) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dDict_dgenericEqApp name) tyTerm) aTerm) bTerm), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec)))))))) else ((fun st -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dGenericEqNotComparable (st))) st)) (v_Vuna_dCompiler_dCore_dEval_dshowValue ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))))))))))

let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals -> (fun ctx -> (fun mname -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun dictTy -> (fun ec -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__154, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__155) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, dictTy)))))))))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)))))))))))

let v_Vuna_dCompiler_dElab_dDict_dcmpOps = (C_Base_dList_dList_Base_dList_dCons ("<", (C_Base_dList_dList_Base_dList_dCons ("<=", (C_Base_dList_dList_Base_dList_dCons (">", (C_Base_dList_dList_Base_dList_dCons (">=", C_Base_dList_dList_Base_dList_dNil))))))))

let v_Vuna_dCompiler_dElab_dDict_disCmpOp = (fun name -> ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dElab_dDict_dcmpOps))

let v_Vuna_dCompiler_dElab_dDict_dcmpMethodName = (fun name -> (if ((bi_eq_str name) "<") then "lt" else (if ((bi_eq_str name) "<=") then "le" else (if ((bi_eq_str name) ">") then "gt" else "ge"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpGenericName = (fun name -> (if ((bi_eq_str name) "<") then "bi_lt_generic" else (if ((bi_eq_str name) "<=") then "bi_le_generic" else (if ((bi_eq_str name) ">") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun sp -> (fun name -> (fun tyName -> (if ((bi_eq_str tyName) "Int") then (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int"))))) else (if ((bi_eq_str tyName) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))) else (if ((bi_eq_str tyName) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))) else ((((v_Vuna_dCompiler_dDiagnostics_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dOpNotDefinedFor (name, tyName))) name) tyName)))))))

let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__156) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__157, dtb__158) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__157) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName name) dtb__160)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dDict_dgenericEqSafe name) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy)) aTerm) bTerm) sp) aTy) ec)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__162) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (((((((v_Vuna_dCompiler_dElab_dDict_dgenericEqSafe name) tyTerm) aTerm) bTerm) sp) aTy) ec))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__163) -> (match dtb__163 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__165) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__164, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), dtb__165))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec) dictTy) sp)))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__161)), (C_Base_dList_dList_Base_dList_dCons (aTy, C_Base_dList_dList_Base_dList_dNil)))))))) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__161)) (if ((bi_eq_str name) "==") then "eq" else "neq")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__166) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) name) dtb__166)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), ec))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__167) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__168) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__168)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__169) -> (match dtb__169 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__170, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), dtb__171))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec) dictTy) sp)))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__167)), (C_Base_dList_dList_Base_dList_dCons (aTy, C_Base_dList_dList_Base_dList_dNil)))))))) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__167)) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodName name)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name -> (fun a -> (fun b -> (if ((bi_eq_str name) "&&") then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, b, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)), b))))))
