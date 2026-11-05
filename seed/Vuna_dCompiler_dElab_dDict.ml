open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDict_dInstMatch = C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)

let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec g -> ((Base_dList.v_Base_dList_dmemName g) ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec))))

let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily mc0) dtb__1)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dinstMatchInst = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__3, dtb__4) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmissingInstance = (fun ec dom sp -> ((fun sd -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNoInstanceFound (sd))) sd)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom)))

let rec v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (match dtb__5 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__7, dtb__8) -> ((fun v -> (if ((v_Vuna_dCompiler_dElab_dDict_disDictValue mc3) v) then (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc3)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) 0) v) mc2) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__9) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__7, mc1)), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__9))))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__10) -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__6)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__6))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc1) dtb__8)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup = (fun ctx i dom ec -> (match (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__11, dtb__12) -> dtb__11
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo ctx) i) dom) ec) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__13, dtb__14) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))
))

let rec v_Vuna_dCompiler_dElab_dDict_dallInstancesMono = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (match (match dtb__15 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__18
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (match dtb__15 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__23
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono dtb__16)
  | _ -> false
)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dtermMetaId = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__25) -> dtb__25
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__27) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc0) mc1) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas mc0) dtb__29) dtb__27) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, dtb__31) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dDict_dtermMetaId dtb__28), dtb__30)), dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__32) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__34) -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas mc0) dtb__33) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__35) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__38, dtb__39) -> ((((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt mc0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc1, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__36), dtb__38))) dtb__37) dtb__39)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt mc0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc1, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__36), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) dtb__37) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dpiRigs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__42, (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__44)))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal = (fun ec g -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__45) -> (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__45)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt = (fun ec depth v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__46) -> (match dtb__46 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__47, dtb__48) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt depth) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__47))) dtb__48) ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__47))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__49, dtb__50, dtb__51) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__49), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__50), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__51)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__52, dtb__53) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__52), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt mc0) mc1) alt))) dtb__53)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__54, dtb__55) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__54, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__55)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__56, dtb__57, dtb__58) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__56), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__57), dtb__58))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__59, dtb__60, dtb__61) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__59, dtb__60, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__61)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__62, dtb__63, dtb__64, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__65), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__66)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__67) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__67) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__68) -> (match (((v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt mc0) mc1) dtb__68) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__69) -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) dtb__69) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__69)) then mc2 else dtb__69)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun soln0 -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) soln0) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar soln0)) then mc2 else soln0)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__68))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__70, dtb__71, dtb__72) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__70, dtb__71, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__71))) dtb__72)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec t -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) 0) t))

let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (String.concat "" [", "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__73); (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__74)])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__75) ^ (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__76))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__77) -> (match dtb__77 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__78, dtb__79) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__80) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__80) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__81) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__82))) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__89) -> (match dtb__89 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__90, dtb__91) -> (match dtb__91 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__90, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals ec ctx forced argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__94) -> (match dtb__94 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__95, dtb__96) -> (match dtb__96 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__95) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__97))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__98) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__99) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__100) -> (match dtb__100 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__101, dtb__102) -> (match dtb__102 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__104 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__103))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let rec v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar = (fun ec fuel v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__105) -> (match dtb__105 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__106, dtb__107, dtb__108) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__109, dtb__110) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__110)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__111, dtb__112) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__112)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__113, dtb__114) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__113) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__114))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__115, dtb__116) -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__115)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__117, dtb__118, dtb__119) -> (if (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__117) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__118)) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__119))
  | _ -> false
)))
and v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar mc0) mc1) dtb__120) then true else (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar mc0) mc1) dtb__121))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec arg -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) 64) arg))

let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__122) -> ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg ec) dtb__122)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_drigidSearchFast = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dom) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) else false))

let rec v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun _u -> (match ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup ctx) 0) dom) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__123))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (match dtb__124 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (match dtb__127 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__126 with
  | C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__128, dtb__129) -> dtb__129
  | _ -> failwith "DT: impossible branch"
), dtb__125))))
  | _ -> ((fun _u -> ((fun sd -> ((fun names -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAmbiguousInstance (sd, names))) sd) names)) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dDict_dinstMatchInst) dtb__124)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["search-ambig: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " cands="; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (fun x -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName (v_Vuna_dCompiler_dElab_dDict_dinstMatchInst x)))) dtb__124))])) else 0))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance dtb__125) dom) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) ec) dom) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["search: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " rigid="; (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then "T" else "F"); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))])) else 0))))
and v_Vuna_dCompiler_dElab_dDict_dmatchInstances = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__131) mc7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (match dtb__132 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__133, dtb__134) -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) dtb__134) mc4) mc5) dtb__131) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__130, dtb__133)), mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dtryMatchInst mc0) mc1) mc2) mc3) dtb__130) mc4) mc5))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc7), mc3))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDict_dtryMatchInst = (fun globals ctx fuel ec inst dom sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas ctx) ec) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__136
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> ((fun _u -> ((fun hd -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__140)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__140)) 0) dom) hd) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__141) -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["inst-conv-err: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " hd="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue hd)])) else 0))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__142) -> ((fun ec2 -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas ec2) dtb__139) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__143) -> ((fun teleArgs -> ((fun env2 -> ((fun ctxVals -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (match dtb__144 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, dtb__146) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst)))) ((Base_dList.v_Base_dList_dappend teleArgs) dtb__145)), dtb__146))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs globals) ctx) (fuel - 1)) ec2) sp) ctxVals) Base_dList.C_Base_dList_dList_Base_dList_dNil))) ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env2) t)))) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__147, dtb__148, dtb__149, dtb__150) -> dtb__149
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap (fun v -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v))) dtb__143))) ((Base_dList.v_Base_dList_dmap (fun v -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)))) (Base_dList.v_Base_dList_dreverse dtb__143)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__140) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__142)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) dtb__139)) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__151, dtb__152, dtb__153, dtb__154) -> dtb__154
  | _ -> failwith "DT: impossible branch"
)))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["inst-try: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " head="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__155, dtb__156, dtb__157, dtb__158) -> dtb__158
  | _ -> failwith "DT: impossible branch"
)); " tele="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__159, dtb__160, dtb__161, dtb__162) -> dtb__160
  | _ -> failwith "DT: impossible branch"
)))])) else 0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__165) -> (match dtb__165 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, dtb__167) -> (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs mc0) mc1) mc2) dtb__167) mc4) dtb__164) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__168) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel mc0) mc1) mc2) mc3) dtb__163) mc4))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc6), mc3))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn = (fun globals ctx ec dom sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) 16) ec) dom) sp))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec dom sp -> (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn Base_dList.C_Base_dList_dList_Base_dList_dNil) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dom) sp))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel = (fun fuel globals ec -> (if (fuel <= 0) then ec else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (match dtb__169 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__171, dtb__172) -> ((fun ec1 -> ((fun forced -> ((fun keep -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec1) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec1)) dtb__173) then keep else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg ec1) dtb__173) then keep else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__174) -> keep
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__175) -> (match dtb__175 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__177) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__177)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__177)) 0) dtb__171) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__176)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__178) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__177) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__178)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__179) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec1) forced) (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> keep
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__171, forced))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__172))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals ec) dtb__170))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ec
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))))

let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals ec -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel 64) globals) ec))

let v_Vuna_dCompiler_dElab_dDict_dclassHasProjection = (fun className short name ec -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName className) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__180) -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (match dtb__180 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__181, dtb__182, dtb__183, dtb__184) -> dtb__183
  | _ -> failwith "DT: impossible branch"
)) short) = name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disEqMethod = (fun ec name -> (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "eq") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "neq") name) ec)) then true else (name = "==")) then true else (name = "/=")))

let v_Vuna_dCompiler_dElab_dDict_disCmpMethod = (fun ec name -> (if (if (if (if (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "lt") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "le") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "gt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "ge") name) ec)) then true else (name = "<")) then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")))

let v_Vuna_dCompiler_dElab_dDict_dmethodShortOf = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf = (fun mc0 -> (if (mc0 = "==") then "eq" else (if (mc0 = "/=") then "neq" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))

let v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf = (fun mc0 -> (if (mc0 = "<") then "lt" else (if (mc0 = "<=") then "le" else (if (mc0 = ">") then "gt" else (if (mc0 = ">=") then "ge" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))))

let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals ctx mname tyTerm aTerm bTerm sp dictTy ec -> ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__185, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__186) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, dictTy)))))))))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

let v_Vuna_dCompiler_dElab_dDict_dcmpGenericName = (fun mc0 -> (if (mc0 = "lt") then "bi_lt_generic" else (if (mc0 = "le") then "bi_le_generic" else (if (mc0 = "gt") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun mc0 mc1 mc2 -> (if (mc2 = "Int") then (if (mc1 = "lt") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if (mc1 = "le") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if (mc1 = "gt") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int"))))) else (if (mc2 = "String") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else (if (mc2 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOpNotDefinedFor (mc1, mc2))) mc1) mc2)))))

let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__187) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__188, dtb__189) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__188) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__190) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__191) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) dtb__191)) (fun rt -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dEqRequiresEvidence (st))) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__193) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__193)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__194) -> (match dtb__194 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__196) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__195, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__196))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__192)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (aTy, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (name = "==") then true else (name = "/=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (match dtb__192 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__197, dtb__198, dtb__199, dtb__200) -> dtb__199
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__201) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) dtb__201)) (fun rt -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOpNotDefinedFor ((v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name), st))) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__202) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__203) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__203)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__204) -> (match dtb__204 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__205, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__206))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__202)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (aTy, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (match dtb__202 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__207, dtb__208, dtb__209, dtb__210) -> dtb__209
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name a b -> (if (name = "&&") then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, b, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)), b))))
