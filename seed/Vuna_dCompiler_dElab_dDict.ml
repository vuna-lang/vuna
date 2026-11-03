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
let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec -> (fun g -> ((v_Base_dList_dmemName g) ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)))))

let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun ec -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily ec) dtb__1)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec -> (fun dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec -> (fun t -> ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) t)))

let rec v_Vuna_dCompiler_dElab_dDict_dfilterInstances = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun hd -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefs mc0)) mc3) 0) mc1) hd) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__5) -> ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances mc0) mc1) dtb__4) mc3)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__6) -> (match ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances mc0) mc1) dtb__4) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__7, dtb__8) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__3, dtb__7)), dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__3))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc3))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__9, dtb__10) -> ((bi_concat ", ") ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__9)) (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__10)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__11, dtb__12) -> ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__11)) (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__12))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec -> (fun dom -> (fun sp -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> (match dtb__13 with
  | C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (match dtb__16 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__15))), ((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) dtb__14)))))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_AmbiguousInstance] DT: ambiguous instance for ") ((bi_concat (v_Vuna_dCompiler_dCore_dEval_dshowValue dom)) ((bi_concat " (candidates: ") ((bi_concat (v_Vuna_dCompiler_dElab_dDict_djoinInstNames dtb__13)) ")")))))
)
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_NoInstanceFound] DT: no instance found for ") (v_Vuna_dCompiler_dCore_dEval_dshowValue dom)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dDict_dfilterInstances ec) dom) ((v_Base_dList_dfilter (fun i -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dTypes_ddtInstNamed i)))) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec))) (v_Vuna_dCompiler_dElab_dTypes_decSols ec))))))

let v_Vuna_dCompiler_dElab_dDict_dmethodNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__17, dtb__18) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dDict_dinstNamedLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (if (if (v_Vuna_dCompiler_dElab_dTypes_ddtInstNamed dtb__19) then ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__19)) mc0) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19)) else ((v_Vuna_dCompiler_dElab_dDict_dinstNamedLookup mc0) dtb__20))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dinstDictName = (fun inst -> (match (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21) -> (match dtb__21 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__22))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dinstHeadArg = (fun inst -> (match (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (match dtb__24 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__25, dtb__26) -> (match dtb__26 with
  | C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (v_Base_dPair_dfirstOf dtb__27)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dfindClassByDict = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__29))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29)) else ((v_Vuna_dCompiler_dElab_dDict_dfindClassByDict mc0) dtb__30))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dinstClassOfDict = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__31) -> ((v_Vuna_dCompiler_dElab_dDict_dfindClassByDict dtb__31) mc1)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dmethodNameMatches = (fun a -> (fun b -> (if ((bi_eq_str a) b) then true else ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf a)) (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf b)))))

let rec v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if ((v_Vuna_dCompiler_dElab_dDict_dmethodNameMatches mc0) (v_Base_dPair_dfirstOf dtb__32)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo mc0) dtb__33) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDict_dclassMethodIndex = (fun mname -> (fun methods -> (((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndexGo mname) methods) 0)))

let rec v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if ((bi_le_int mc0) 0) then dtb__34 else ((v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt ((bi_sub mc0) 1)) dtb__35))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dinferInstSel = (fun globals -> (fun ctx -> (fun ec -> (fun meth -> (fun iname -> (fun sp -> (match (v_Vuna_dCompiler_dElab_dDict_dmethodNameOf meth) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_InstanceAnnotationWrongUse] DT: @instance can only be used with a trait method (write `method @instance`)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (match ((v_Vuna_dCompiler_dElab_dDict_dinstNamedLookup iname) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_UnknownNamedInstance] DT: unknown named instance ") iname))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37) -> (match ((v_Vuna_dCompiler_dElab_dDict_dinstClassOfDict (v_Vuna_dCompiler_dElab_dDict_dinstDictName dtb__37)) (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_InstanceNotTrait] DT: instance ") ((bi_concat iname) " is not an instance of a trait")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> (match ((v_Vuna_dCompiler_dElab_dDict_dclassMethodIndex dtb__36) (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__38)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_OpOnlyIntString] DT: `") ((bi_concat dtb__36) ((bi_concat "` is not a method of trait ") (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__38)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> ((fun nFields -> ((fun fty -> ((fun instTy -> ((fun rigs -> ((fun fieldVar -> ((fun applied -> ((fun alt -> ((fun proj -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (proj, (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) instTy), ec))))))) (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (iname)), (C_Base_dList_dList_Cons (alt, C_Base_dList_dList_Nil))))))) (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__38)), (v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields), applied)))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) ((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields)))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName dtb__39), ((bi_sub ((bi_sub nFields) 1)) dtb__39))))) ((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dMeta_dbinderRig) fty))) (((v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassParams dtb__38))) (v_Vuna_dCompiler_dElab_dDict_dinstHeadArg dtb__37)) fty))) ((v_Vuna_dCompiler_dElab_dDict_dclassFieldTyAt dtb__39) (v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys dtb__38)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__38)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__40) -> (match dtb__40 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__41, dtb__42) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__43) -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__43) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__44) with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__45))) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__50))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__52) -> (match dtb__52 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__53, dtb__54) -> (match dtb__54 with
  | C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__53, C_Base_dList_dList_Nil))))
  | _ -> v
)
  | _ -> v
)
  | _ -> v
))

let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals -> (fun ec -> (fun ctx -> (fun forced -> (fun argKind -> (match (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__57) -> (match dtb__57 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__58, dtb__59) -> (match dtb__59 with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__58) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__60))) with
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
))))))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__63) -> (match dtb__63 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__64, dtb__65) -> (match dtb__65 with
  | C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__67 with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

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

let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec) with
  | C_Base_dList_dList_Nil -> ec
  | C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__75, dtb__76) -> ((fun ec1 -> ((fun forced -> ((fun keep -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec1) forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_dTypes_decSols ec1)) dtb__77) then keep else (match (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec1) forced) (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__78) -> (match dtb__78 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__80)) (v_Vuna_dCompiler_dElab_dTypes_decSols dtb__80)) 0) dtb__75) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__79)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__81) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dcheckSolsDelta dtb__80) (v_Vuna_dCompiler_dElab_dTypes_decSols dtb__80)) dtb__81) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__82) -> keep
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__83) -> ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__80) dtb__81))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__84) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__85) -> keep
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> keep
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec1)) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__75, forced))))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__76))) ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals ec) dtb__74))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__86) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__87) -> (match dtb__87 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__88, dtb__89, dtb__90) -> true
  | _ -> false
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dgenericEqApp = (fun name -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> ((fun rt -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) (if ((bi_eq_str name) "==") then "bi_eq_generic" else "bi_neq_generic"))))))

let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals -> (fun ctx -> (fun mname -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun dictTy -> (fun ec -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__91, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__92) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, dictTy)))))))))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)))))))))))

let v_Vuna_dCompiler_dElab_dDict_dcmpOps = fun () -> (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", C_Base_dList_dList_Nil))))))))

let v_Vuna_dCompiler_dElab_dDict_disCmpOp = (fun name -> ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dElab_dDict_dcmpOps ())))

let v_Vuna_dCompiler_dElab_dDict_dcmpMethodName = (fun name -> (if ((bi_eq_str name) "<") then "lt" else (if ((bi_eq_str name) "<=") then "le" else (if ((bi_eq_str name) ">") then "gt" else "ge"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpGenericName = (fun name -> (if ((bi_eq_str name) "<") then "bi_lt_generic" else (if ((bi_eq_str name) "<=") then "bi_le_generic" else (if ((bi_eq_str name) ">") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun name -> (fun tyName -> (if ((bi_eq_str tyName) "Int") then (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int"))))) else (if ((bi_eq_str tyName) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))) else (if ((bi_eq_str tyName) "Bool") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "[TC_OpOnlyIntString] DT: `") ((bi_concat name) ((bi_concat "` is not defined for ") ((bi_concat tyName) " (Ord instance required)")))))))))))

let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__93) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__94, dtb__95) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__94) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName name) dtb__97)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dDict_dgenericEqApp name) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy)) aTerm) bTerm), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (match (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec) dictTy) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__99) -> (match dtb__99 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__100, dtb__101) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__100, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__101))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__102) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dDict_dgenericEqApp name) tyTerm) aTerm) bTerm), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec)))))))))
  | _ -> failwith "DT: impossible branch"
))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__98)), (C_Base_dList_dList_Cons (aTy, C_Base_dList_dList_Nil)))))))) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__98)) (if ((bi_eq_str name) "==") then "eq" else "neq")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__103) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName name) dtb__103)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName name))), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__104) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (match (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec) dictTy) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__105) -> (match dtb__105 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__106, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__107))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__108) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__108)))
  | _ -> failwith "DT: impossible branch"
))) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__104)), (C_Base_dList_dList_Cons (aTy, C_Base_dList_dList_Nil)))))))) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods dtb__104)) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodName name)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name -> (fun a -> (fun b -> (if ((bi_eq_str name) "&&") then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, b, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)), b))))))
