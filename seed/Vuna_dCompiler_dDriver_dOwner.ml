open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dOwner_dSplitMeta = C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta of ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap)

let v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan = (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))

let v_Vuna_dCompiler_dDriver_dOwner_dentryOwner = "Main"

let v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__4, dtb__5, dtb__6, dtb__7) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__8, dtb__9, dtb__10, dtb__11) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__12, dtb__13, dtb__14, dtb__15) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__16, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__23, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__29, dtb__30, dtb__31, dtb__32) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__29, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__3)))
  | _ -> (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__3)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (match dtb__33 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__35, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames dtb__34)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__42, (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames dtb__34)))
  | _ -> (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames dtb__34)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dOwner_dheadClassName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__48, dtb__49) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__50, dtb__51, dtb__52) -> (match dtb__50 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__53, dtb__54) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__55) ((((Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dinstHead dtb__55) mc1) mc2) v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan)), mc0)), ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners mc0) mc1) mc2) dtb__56)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners mc0) dtb__57) dtb__58) dtb__60)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> ((((v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners mc0) dtb__63) dtb__64) dtb__67)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__70, dtb__71, dtb__72, dtb__73) -> (match (v_Vuna_dCompiler_dDriver_dOwner_dheadClassName dtb__71) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__74) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__74) dtb__71), mc0)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDefOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__75, dtb__76, dtb__77, dtb__78) -> ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), mc0)))) dtb__77)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDataOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__79, dtb__80, dtb__81, dtb__82) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (("Dict_" ^ dtb__79), mc0)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnerOf mc0) dtb__83)) ((v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo mc0) dtb__84))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf = (fun owner decls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, owner)))) (v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames decls))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo owner) decls)) ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDefOwnerOf owner)) decls))))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf = (fun owner decls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, owner)))) (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames decls))) ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDataOwnerOf owner)) decls)))

let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (match dtb__85 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf dtb__87) dtb__88)) (v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules dtb__86))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (match dtb__89 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf dtb__91) dtb__92)) (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf = (fun modules entryDecls -> ((fun knownModules -> ((fun defOwners -> ((fun dataOwners -> (C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (defOwners, dataOwners, knownModules, (Base_dHashMap.v_Base_dHashMap_dfromList defOwners), (Base_dHashMap.v_Base_dHashMap_dfromList dataOwners)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) entryDecls)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) entryDecls)))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) modules)))

let v_Vuna_dCompiler_dDriver_dOwner_dlookupModuleOf = (fun pairs name -> ((Base_dList.v_Base_dList_dlookupPair name) pairs))

let v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr = (fun knownModules what name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (prefix)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT split: `"; what; "` "; name; " has module prefix `"; prefix; "` but no such module"]))))) (v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf = (fun meta d -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (match meta with
  | C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__97
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__98))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then (((v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr (match meta with
  | C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> dtb__101
  | _ -> failwith "DT: impossible branch"
)) "data") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT split: cannot determine module for data `"; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); "`"]))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf = (fun meta name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) (match meta with
  | C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> dtb__107
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__109) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__109))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (((v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr (match meta with
  | C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__112
  | _ -> failwith "DT: impossible branch"
)) "definition") name) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT split: cannot determine module for definition `"; name; "`"]))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__115))) (fun o -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs mc0) dtb__116)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__115), o)), ps))))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf mc0) dtb__117)) (fun o -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas mc0) dtb__118)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__117), o)), ps))))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))
