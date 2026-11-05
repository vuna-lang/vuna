open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta = C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta of ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx = C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx of ((string, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan = (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))

let v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner = "Main"

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule = (fun modName -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName modName))

let v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__4, dtb__5, dtb__6, dtb__7) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__8, dtb__9, dtb__10, dtb__11) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__12, dtb__13, dtb__14, dtb__15) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__16, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__27, dtb__28, dtb__29, dtb__30) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__27, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> (match dtb__31 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__33, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__32)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__39, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__32)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__32)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dheadClassName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__44, dtb__45) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__46, dtb__47, dtb__48) -> (match dtb__46 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__49, dtb__50) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__51) ((((Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dinstHead dtb__51) mc1) mc2) v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan)), mc0)), ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners mc0) mc1) mc2) dtb__52)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57) -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners mc0) dtb__53) dtb__54) dtb__56)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners mc0) dtb__58) dtb__59) dtb__62)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__64, dtb__65, dtb__66, dtb__67) -> (match (v_Vuna_dCompiler_dCodegen_dSplit_dheadClassName dtb__65) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__68) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__68) dtb__65), mc0)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDefOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__69, dtb__70, dtb__71, dtb__72) -> ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), mc0)))) dtb__71)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDataOwnerOf = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__73, dtb__74, dtb__75, dtb__76) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (("Dict_" ^ dtb__73), mc0)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnerOf mc0) dtb__77)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo mc0) dtb__78))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOf = (fun owner decls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, owner)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames decls))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo owner) decls)) ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDefOwnerOf owner)) decls))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOf = (fun owner decls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, owner)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames decls))) ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDataOwnerOf owner)) decls)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__79 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOf dtb__81) dtb__82)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules dtb__80))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> (match dtb__83 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, dtb__86) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOf dtb__85) dtb__86)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMetaOf = (fun modules entryDecls -> ((fun knownModules -> ((fun defOwners -> ((fun dataOwners -> (C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (defOwners, dataOwners, knownModules))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOf v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) entryDecls)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOf v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) entryDecls)))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) modules)))

let v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf = (fun pairs name -> ((Base_dList.v_Base_dList_dlookupPair name) pairs))

let v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr = (fun knownModules what name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (prefix)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT split: `"; what; "` "; name; " has module prefix `"; prefix; "` but no such module"]))))) (v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName name)))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf = (fun meta d -> (match ((v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf (match meta with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__87, dtb__88, dtb__89) -> dtb__88
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__90) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__90))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then (((v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr (match meta with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__91, dtb__92, dtb__93) -> dtb__93
  | _ -> failwith "DT: impossible branch"
)) "data") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT split: cannot determine module for data `"; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); "`"]))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf = (fun meta name -> (match ((v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf (match meta with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__94, dtb__95, dtb__96) -> dtb__94
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__97))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (((v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr (match meta with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__98, dtb__99, dtb__100) -> dtb__100
  | _ -> failwith "DT: impossible branch"
)) "definition") name) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT split: cannot determine module for definition `"; name; "`"]))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__101))) (fun o -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs mc0) dtb__102)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__101), o)), ps))))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf mc0) dtb__103)) (fun o -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas mc0) dtb__104)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__103), o)), ps))))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf = (fun pairs -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll pairs) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl = (fun t name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__105) -> dtb__105
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit = (fun ownerT u datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (((v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl ownerT) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) = u))) datas))

let v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit = (fun ownerT u defs -> ((Base_dList.v_Base_dList_dfilter (fun d -> (((v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl ownerT) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) = u))) defs))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dposOfNameGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (if (dtb__106 = mc1) then mc0 else (((v_Vuna_dCompiler_dCodegen_dSplit_dposOfNameGo (mc0 + 1)) mc1) dtb__107))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dposOfName = (fun name units -> (((v_Vuna_dCompiler_dCodegen_dSplit_dposOfNameGo 1) name) units))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> ((fun selfPos -> ((fun depPos -> (if (depPos = 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: "; mc1; " references unknown unit `"; dtb__108; "`"]))) else (if (selfPos = 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: split unit `"; mc1; "` is not in the module order"]))) else (if (depPos >= selfPos) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: split dependency is not in topological order: "; mc1; " -> "; dtb__108]))) else (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder mc0) mc1) dtb__109))))) ((v_Vuna_dCompiler_dCodegen_dSplit_dposOfName dtb__108) mc0))) ((v_Vuna_dCompiler_dCodegen_dSplit_dposOfName mc1) mc0))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_ddepsInOrder = (fun ordered self deps -> ((Base_dList.v_Base_dList_dfilter (fun u -> (if (Base_dBool.v_Base_dBool_dnot (u = self)) then ((Base_dList.v_Base_dList_dmemName u) deps) else false))) ordered))

let v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf = (fun ordered self deps -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder ordered) self) deps)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dCodegen_dSplit_ddepsInOrder ordered) self) deps))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit = (fun pairs -> ((Base_dList.v_Base_dList_dmap (fun q -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf q), (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dsecondOf q)))))) pairs))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (match dtb__110 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, dtb__113) -> ((fun unit -> ((fun unitDatas -> ((fun unitDefs -> ((fun qc -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs unitDefs)) (fun groups -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__114
  | _ -> failwith "DT: impossible branch"
)) qc) (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129) -> dtb__123
  | _ -> failwith "DT: impossible branch"
)) unitDatas) groups)) (fun parts -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles mc0) dtb__111)) (fun tail -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> dtb__137
  | _ -> failwith "DT: impossible branch"
)) unit) (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps parts))) (fun deps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dDriver_dSplit.C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ((unit ^ ".ml"), ((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts) ^ "\n"), deps)), tail))))))))))))) (Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (unit, (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> dtb__143
  | _ -> failwith "DT: impossible branch"
), (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> dtb__152
  | _ -> failwith "DT: impossible branch"
))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> dtb__157
  | _ -> failwith "DT: impossible branch"
)) dtb__112) (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> dtb__164
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> dtb__174
  | _ -> failwith "DT: impossible branch"
)) dtb__112) (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> dtb__179
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule dtb__112))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFile = (fun ctx printResult -> ((fun entryUnit -> ((fun entryDefs -> ((fun entryDatas -> ((fun qc -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs entryDefs)) (fun groups -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> dtb__186
  | _ -> failwith "DT: impossible branch"
)) qc) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> dtb__195
  | _ -> failwith "DT: impossible branch"
)) entryDatas) groups)) (fun parts -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook qc) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__203
  | _ -> failwith "DT: impossible branch"
), (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> dtb__212
  | _ -> failwith "DT: impossible branch"
)))) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> dtb__220
  | _ -> failwith "DT: impossible branch"
)) printResult)) (fun hook -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233) -> dtb__233
  | _ -> failwith "DT: impossible branch"
)) entryUnit) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps parts)) (Base_dPair.v_Base_dPair_dsecondOf hook)))) (fun deps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dDriver_dSplit.C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ("Main.ml", ((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts) ^ (Base_dPair.v_Base_dPair_dfirstOf hook)), deps))))))))))))) (Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (entryUnit, (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241) -> dtb__239
  | _ -> failwith "DT: impossible branch"
), (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> dtb__248
  | _ -> failwith "DT: impossible branch"
))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257) -> dtb__254
  | _ -> failwith "DT: impossible branch"
)) v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> dtb__259
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> dtb__269
  | _ -> failwith "DT: impossible branch"
)) v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281) -> dtb__276
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner)))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName = (fun knownModules mname name -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName name)) knownModules) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: module "; mname; " declares `"; name; "` whose module prefix `"; (v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"])))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"])))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__282, dtb__283) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName mc0) mc1) dtb__282)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) mc1) dtb__283)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__284, dtb__285) -> (match dtb__284 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__286, dtb__287) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) dtb__286) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__287))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls mc0) dtb__285)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__288, dtb__289) -> (match dtb__288 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__290, dtb__291, dtb__292, dtb__293) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__290, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__289)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__294, dtb__295, dtb__296, dtb__297) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__294, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__289)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__298, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__289)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__304, dtb__305, dtb__306, dtb__307, dtb__308) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__304, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__289)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__309, dtb__310, dtb__311, dtb__312) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__309, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__289)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__289)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName = (fun seen name -> (if (name = "") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: entry declaration has an empty name")) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"]))) else (if ((Base_dList.v_Base_dList_dmemName name) seen) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: duplicate entry declaration `"; name; "`"]))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__313, dtb__314) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName mc0) dtb__313)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__313, mc0))) dtb__314)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls = (fun decls -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo Base_dList.C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities decls)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__315, dtb__316) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__315))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners mc0) dtb__316)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__317, dtb__318) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf mc0) dtb__317)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners mc0) dtb__318)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules = (fun meta modules entryDecls runtime datas -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls (match meta with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__319, dtb__320, dtb__321) -> dtb__321
  | _ -> failwith "DT: impossible branch"
)) modules)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls entryDecls)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners meta) runtime)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners meta) datas))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitWithOwners = (fun modules printResult runtime allDatas allDefs defPairs dataPairs -> ((fun defUnitT -> ((fun dataUnitT -> ((fun ordered -> ((fun ctx -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles ctx) modules)) (fun moduleFiles -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFile ctx) printResult)) (fun mainFile -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dDriver_dSplit.C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ("Vuna_runtime.ml", Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime, Base_dList.C_Base_dList_dList_Base_dList_dNil)), ((Base_dList.v_Base_dList_dappend moduleFiles) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mainFile, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))))))) (C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas), allDatas, runtime, (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf defPairs), (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf dataPairs), defUnitT, dataUnitT, ordered)))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Base_dList_dCons (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dList.C_Base_dList_dList_Base_dList_dNil))) ((Base_dList.v_Base_dList_dmap (fun q -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dfirstOf q)))) modules))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit dataPairs)))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit defPairs))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitProgramFiles = (fun modules entryDecls printResult runtime allDatas allDefs meta -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules meta) modules) entryDecls) runtime) allDatas)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs meta) runtime)) (fun defPairs -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas meta) allDatas)) (fun dataPairs -> (((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitWithOwners modules) printResult) runtime) allDatas) allDefs) defPairs) dataPairs))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram = (fun modules entryDecls prog printResult -> ((fun allDatas -> ((fun allDefs -> ((fun meta -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), allDefs)))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__322, dtb__323) -> (((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitProgramFiles modules) entryDecls) printResult) dtb__322) allDatas) allDefs) meta)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMetaOf modules) entryDecls))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))
