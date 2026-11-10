open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dIface_dSourceInfo = C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo of (string) * (int) * (int) * (int)
and t_Vuna_dCompiler_dDriver_dIface_dModuleIface = C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface of (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dSourceInfo) * (int) * ((string, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram)
and t_Vuna_dCompiler_dDriver_dIface_dPackageIface = C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface of (string) * (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dCanonState = C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState of (int) * ((int, int) Base_dHashMap.t_Base_dHashMap_dHashMap)
and t_Vuna_dCompiler_dDriver_dIface_dOwnerIndex = C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex of ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dProgParts = C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts of ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap)
and t_Vuna_dCompiler_dDriver_dIface_dManifestEntry = C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry of (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dSourceInfo) * (int) * ((string, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dPackageManifest = C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest of (string) * (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dManifestEntry Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dDriver_dIface_dsiPathOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsiHashOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo (dtb__4, dtb__5, dtb__6, dtb__7) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo (dtb__8, dtb__9, dtb__10, dtb__11) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo (dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiNameOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> dtb__78
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> dtb__119
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135) -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceSchema = "vuna-iface 10"

let v_Vuna_dCompiler_dDriver_dIface_dstrongSalts = (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-0:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-1:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-2:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-3:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-4:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-5:", Base_dList.C_Base_dList_dList_Nil))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong = (fun s -> (((Base_dList.v_Base_dList_dfoldl (fun acc salt -> ((((Base_dNum.v_Base_dNum_dmul Base_dInt.v_Num_uInt) acc) 1000003) + (dtp_strHash (salt ^ s))))) 0) v_Vuna_dCompiler_dDriver_dIface_dstrongSalts))

let v_Vuna_dCompiler_dDriver_dIface_dcombineHash = (fun a b -> ((a * 1000003) + b))

let v_Vuna_dCompiler_dDriver_dIface_dhashTerm = (fun t -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal t)))

let rec v_Vuna_dCompiler_dDriver_dIface_dinsertByKey = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (match dtb__160 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__162, dtb__163) -> (if (mc0 <= dtb__162) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__162, dtb__163)), dtb__161)))) else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__162, dtb__163)), (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey mc0) mc1) dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dsortPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__164 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__166, dtb__167) -> (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey dtb__166) dtb__167) (v_Vuna_dCompiler_dDriver_dIface_dsortPairs dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsortByKey = (fun key xs -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (v_Vuna_dCompiler_dDriver_dIface_dsortPairs ((Base_dList.v_Base_dList_dmap (fun x -> (Base_dPair.C_Base_dPair_dPair_Pair ((key x), x)))) xs))))

let v_Vuna_dCompiler_dDriver_dIface_dnameKey = (fun n -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong ("name:" ^ n)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty = (C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (0, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcanonTerm = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__168, dtb__169, dtb__170) -> ((fun pc -> ((fun pt -> ((fun pe -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Base_dPair.v_Base_dPair_dfirstOf pc), (Base_dPair.v_Base_dPair_dfirstOf pt), (Base_dPair.v_Base_dPair_dfirstOf pe))), (Base_dPair.v_Base_dPair_dsecondOf pe)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__170))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pc)) dtb__169))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__168))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__171, dtb__172) -> ((fun ps -> ((fun pa -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Base_dPair.v_Base_dPair_dfirstOf ps), (Base_dPair.v_Base_dPair_dfirstOf pa))), (Base_dPair.v_Base_dPair_dsecondOf pa)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf ps)) dtb__172))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__171))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__173, dtb__174) -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__173, (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__174))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__175, dtb__176, dtb__177) -> ((fun pf -> ((fun pa -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Base_dPair.v_Base_dPair_dfirstOf pf), (Base_dPair.v_Base_dPair_dfirstOf pa), dtb__177)), (Base_dPair.v_Base_dPair_dsecondOf pa)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pf)) dtb__176))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__175))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__178, dtb__179, dtb__180) -> ((fun pb -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__178, dtb__179, (Base_dPair.v_Base_dPair_dfirstOf pb))), (Base_dPair.v_Base_dPair_dsecondOf pb)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__180))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((fun pd -> ((fun pc -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__181, dtb__182, dtb__183, (Base_dPair.v_Base_dPair_dfirstOf pd), (Base_dPair.v_Base_dPair_dfirstOf pc))), (Base_dPair.v_Base_dPair_dsecondOf pc)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pd)) dtb__185))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__184))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__186) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) dtb__186) (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__187, dtb__188) -> dtb__188
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__189)), mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__190, dtb__191) -> dtb__190
  | _ -> failwith "DT: impossible branch"
))), (C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (((match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__192, dtb__193) -> dtb__192
  | _ -> failwith "DT: impossible branch"
) + 1), ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__186) (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__194, dtb__195) -> dtb__194
  | _ -> failwith "DT: impossible branch"
)) (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__196, dtb__197) -> dtb__197
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair (mc1, mc0))
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (match dtb__198 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__200, dtb__201) -> ((fun pt -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf pt), dtb__201)), (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__199))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__200))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__202, dtb__203) -> (match dtb__202 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__204, dtb__205, dtb__206) -> ((fun pb -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__204, dtb__205, (Base_dPair.v_Base_dPair_dfirstOf pb))), (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf pb)) dtb__203))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__206))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop = (fun t -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty) t)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__207) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop dtb__207)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddefView = (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)), (v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDefs = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_ddefView) ds)))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDatas = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun d -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) ds))))

let v_Vuna_dCompiler_dDriver_dIface_dhashInsts = (fun is -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun i -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) is))))

let v_Vuna_dCompiler_dDriver_dIface_dhashClasses = (fun cs -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun c -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) cs))))

let v_Vuna_dCompiler_dDriver_dIface_dhashGlobals = (fun gs -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) gs))))

let v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf = (fun e -> (String.concat "" [(match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__208, dtb__209, dtb__210, dtb__211) -> dtb__209
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__212, dtb__213, dtb__214, dtb__215) -> dtb__212
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__216, dtb__217, dtb__218, dtb__219) -> dtb__218
  | _ -> failwith "DT: impossible branch"
)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashExports = (fun es -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun e -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf e)))) es))))

let v_Vuna_dCompiler_dDriver_dIface_dfixityText = (fun f -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [(match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> dtb__220
  | _ -> failwith "DT: impossible branch"
); "|"; (bi_strFromInt (match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> dtb__226
  | _ -> failwith "DT: impossible branch"
)); "|"; (bi_strFromInt (match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__230, dtb__231, dtb__232, dtb__233, dtb__234) -> dtb__232
  | _ -> failwith "DT: impossible branch"
))])))

let v_Vuna_dCompiler_dDriver_dIface_dhashFixities = (fun fs -> (((Base_dList.v_Base_dList_dfoldl (fun acc f -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_dfixityText f)))) 0) fs))

let rec v_Vuna_dCompiler_dDriver_dIface_djoinStrings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__235, dtb__236) -> (match dtb__236 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__235
  | _ -> (String.concat "" [dtb__235; ","; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__236)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_drecordHash = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dElab_dRecords.C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242) -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [dtb__237; "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__238); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__239)); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__240); "|"; (if dtb__241 then "1" else "0"); "|"; dtb__242]))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dhashRecords = (fun decls -> (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls (fun n -> n)) decls) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__243, dtb__244) -> (((Base_dList.v_Base_dList_dfoldl (fun acc r -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_drecordHash r)))) 0) dtb__243)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportAliasText = (fun i -> (match (match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__245, dtb__246, dtb__247, dtb__248) -> dtb__247
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> dtb__249
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText = (fun i -> (if (match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__250, dtb__251, dtb__252, dtb__253) -> dtb__251
  | _ -> failwith "DT: impossible branch"
) then "q" else "u"))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameText = (fun i -> (String.concat "" [(match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__254, dtb__255, dtb__256, dtb__257) -> dtb__254
  | _ -> failwith "DT: impossible branch"
); "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportAliasText i); "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText i)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashImports = (fun is -> (((Base_dList.v_Base_dList_dfoldl (fun acc i -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (v_Vuna_dCompiler_dDriver_dIface_dimportNameText i))))) 0) is))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfParts = (fun name pkg imports implicitImports fixities decls cp -> ((fun h0 -> ((fun h1 -> ((fun h2 -> ((fun h3 -> ((fun h4 -> ((fun h5 -> ((fun h6 -> ((fun h7 -> ((fun h8 -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h8) (v_Vuna_dCompiler_dDriver_dIface_dhashClasses (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h7) (v_Vuna_dCompiler_dDriver_dIface_dhashInsts (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h6) (v_Vuna_dCompiler_dDriver_dIface_dhashGlobals (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h5) (v_Vuna_dCompiler_dDriver_dIface_dhashDefs (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h4) (v_Vuna_dCompiler_dDriver_dIface_dhashDatas (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h3) (v_Vuna_dCompiler_dDriver_dIface_dhashRecords decls)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h2) (v_Vuna_dCompiler_dDriver_dIface_dhashFixities fixities)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h1) (v_Vuna_dCompiler_dDriver_dIface_dhashImports implicitImports)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h0) (v_Vuna_dCompiler_dDriver_dIface_dhashImports imports)))) (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [name; "|"; pkg]))))

let v_Vuna_dCompiler_dDriver_dIface_dtblOwner = (fun t name -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) t))

let v_Vuna_dCompiler_dDriver_dIface_dprefixOwner = (fun knownModules name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (prefix)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)))

let v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__258, dtb__259, dtb__260, dtb__261) -> dtb__258
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__263, dtb__264, dtb__265, dtb__266) -> dtb__266
  | _ -> failwith "DT: impossible branch"
)) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__267, dtb__268, dtb__269, dtb__270) -> dtb__268
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__271) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__271))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__272, dtb__273, dtb__274, dtb__275) -> dtb__275
  | _ -> failwith "DT: impossible branch"
)) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__276, dtb__277) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__276))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__276))) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs dtb__277))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__278, dtb__279, dtb__280, dtb__281) -> dtb__280
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__282) -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) dtb__282)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf = (fun oi name -> (if ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__283) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__283))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__284) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__284))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dIface_downerIndexOf = (fun meta datas -> (C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_SplitMeta (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289) -> dtb__285
  | _ -> failwith "DT: impossible branch"
)), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_SplitMeta (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294) -> dtb__291
  | _ -> failwith "DT: impossible branch"
)), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs datas)), (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_SplitMeta (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> dtb__297
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dIface_dbucketOf = (fun name tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__300) -> dtb__300
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__301, dtb__302) -> (match (mc0 dtb__301) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__302) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__303) -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__302) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__303) (Base_dList.C_Base_dList_dList_Cons (dtb__301, ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf dtb__303) mc2)))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBucket = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__304, dtb__305) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__304, (Base_dList.v_Base_dList_dreverse dtb__305)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets = (fun tbl -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dreverseBucket) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) tbl))))

let v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner = (fun ownerOf xs -> (v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo ownerOf) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf = (fun oi prog -> (C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun p -> ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) (Base_dPair.v_Base_dPair_dfirstOf p)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun i -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun c -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))))

let v_Vuna_dCompiler_dDriver_dIface_dcpOfModule = (fun parts prog mod_ -> ((fun datas -> ((fun defs -> ((fun globals -> ((fun insts -> ((fun classes -> ((fun slice -> ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311) -> dtb__306
  | _ -> failwith "DT: impossible branch"
)) slice)) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (datas, defs, Base_dList.C_Base_dList_dList_Nil, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog), globals, insts, classes, 0, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317) -> dtb__317
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323) -> dtb__322
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> dtb__327
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> dtb__332
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341) -> dtb__337
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dsourceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__342, dtb__343) -> (match dtb__342 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__344, dtb__345) -> (if (dtb__344 = mc1) then dtb__345 else ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf dtb__343) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo ("", 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameOf = (fun _uarity0 -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName _uarity0))

let v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) ((Base_dList.v_Base_dList_dappend (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> dtb__348
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362, dtb__363) -> dtb__358
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName = (fun tbl name -> (match ((Base_dList.v_Base_dList_dlookupPair name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__364) -> dtb__364
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf = (fun tbl m -> ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Pair (n, ((v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName tbl) n))))) (v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule m)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__365, dtb__366) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__365) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__365)) else ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf dtb__366) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase = (fun pkg parts prog sources clean m -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__367) -> dtb__367
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun name -> ((fun cp -> ((fun h -> (C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (name, pkg, ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf sources) name), h, Base_dList.C_Base_dList_dList_Nil, (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> dtb__370
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385) -> dtb__380
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> dtb__392
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401, dtb__402, dtb__403) -> dtb__400
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410, dtb__411, dtb__412) -> dtb__412
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420, dtb__421) -> dtb__417
  | _ -> failwith "DT: impossible branch"
), cp))) (((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts name) pkg) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__422, dtb__423, dtb__424, dtb__425, dtb__426, dtb__427, dtb__428, dtb__429, dtb__430) -> dtb__424
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439) -> dtb__434
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448) -> dtb__448
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457) -> dtb__453
  | _ -> failwith "DT: impossible branch"
)) cp))) (((v_Vuna_dCompiler_dDriver_dIface_dcpOfModule parts) prog) name))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dfinishIface = (fun tbl clean m mi -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__458) -> dtb__458
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf mi), ((v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf tbl) m), (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf mi)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difacesGo = (fun pkg parts prog sources knownDeps clean modules -> ((fun built -> ((fun hashes -> ((fun fullTbl -> (Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dmap (fun p -> ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface fullTbl) clean) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)))) built), fullTbl))) ((Base_dList.v_Base_dList_dappend knownDeps) hashes))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf (Base_dPair.v_Base_dPair_dsecondOf p)), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf (Base_dPair.v_Base_dPair_dsecondOf p)))))) built))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair (m, ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) sources) clean) m))))) modules)))

let v_Vuna_dCompiler_dDriver_dIface_downerOfAny = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__459) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__459))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__460) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__460))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf = (fun oi ourNames inherited merged prelude name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) prelude) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) inherited) then "" else (match ((v_Vuna_dCompiler_dDriver_dIface_downerOfAny oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__461) -> (if (dtb__461 = Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__461) ourNames) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) merged) then "" else (String.concat "" ["missing-from-iface "; name; " -> "; dtb__461])) else ""))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("unowned " ^ name)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__462, dtb__463) -> ((fun issue -> (if (issue = "") then ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo mc0) mc1) mc2) mc3) mc4) dtb__463) else issue)) ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf mc0) mc1) mc2) mc3) mc4) dtb__462))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf = (fun prog -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)))))))

let v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf = (fun cp -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)))

let v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf = (fun cp -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)))

let v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf = (fun m -> ((fun cp -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf cp)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf cp)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp)))))))) (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m)))

let v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames = (fun ifaces -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf) ifaces))

let v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue = (fun oi ourNames inherited ifaces prog -> ((fun merged -> ((fun mergedTbl -> ((fun ourTbl -> ((fun inhTbl -> ((fun preludeTbl -> ((fun issue -> (if (issue = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (issue)))) ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo oi) ourTbl) inhTbl) mergedTbl) preludeTbl) (v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf prog)))) (Base_dHashMap.v_Base_dHashMap_dofNames Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames))) (Base_dHashMap.v_Base_dHashMap_dofNames inherited))) (Base_dHashMap.v_Base_dHashMap_dofNames ourNames))) (Base_dHashMap.v_Base_dHashMap_dofNames merged))) (v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames ifaces)))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageResult = (fun oi ourNames inherited ifaces prog -> (match (((((v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue oi) ourNames) inherited) ifaces) prog) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__464) -> (Base_dResult.C_Base_dResult_dResult_Err (("iface: " ^ dtb__464)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (ifaces))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage = (fun pkg sources knownDeps inherited clean modules entryDecls prog -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match (((((((v_Vuna_dCompiler_dDriver_dIface_difacesGo pkg) parts) prog) sources) knownDeps) clean) ourModules) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__465, dtb__466) -> (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageResult oi) ourNames) inherited) dtb__465) prog)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m), (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m))))) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__467, dtb__468) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__467) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467)) else ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule dtb__468) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsameOwner = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__469) -> (dtb__469 = mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_downedByModule = (fun oi name artifact -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner name) ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) artifact)))

let rec v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__470, dtb__471) -> ((fun skip -> (if skip then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__471) mc4) else (if ((Base_dList.v_Base_dList_dmemName dtb__470) mc4) then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__471) mc4) else false))) (if ((Base_dList.v_Base_dList_dmemName dtb__470) mc1) then true else (Base_dBool.v_Base_dBool_dnot (((v_Vuna_dCompiler_dDriver_dIface_downedByModule mc0) mc2) dtb__470))))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk = (fun oi inherited name prog mi -> ((fun present -> (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent oi) inherited) name) (v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf prog)) present)) (v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf mi)))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfModule = (fun pkg si knownDeps inherited clean modules entryDecls prog name -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule ourModules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["iface: module "; name; " is not part of the checked package"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__472) -> ((fun mi0 -> ((fun tbl -> ((fun mi -> (if (((((v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk oi) inherited) name) prog) mi) then (Base_dResult.C_Base_dResult_dResult_Ok (mi)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["iface: module "; name; " has uncovered artifacts"]))))) ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface tbl) Base_dList.C_Base_dList_dList_Nil) dtb__472) mi0))) ((Base_dList.v_Base_dList_dappend knownDeps) ((Base_dList.v_Base_dList_dmap (fun x -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf x), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf x))))) ((Base_dList.v_Base_dList_dappend clean) (Base_dList.C_Base_dList_dList_Cons (mi0, Base_dList.C_Base_dList_dList_Nil))))))) ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (name, si)), Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) dtb__472))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m), (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m))))) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dallValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__473, dtb__474) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__473)) then (v_Vuna_dCompiler_dDriver_dIface_dallValid dtb__474) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid = (fun pi -> (if (if ((match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface (dtb__475, dtb__476, dtb__477, dtb__478) -> dtb__475
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Base_dList.v_Base_dList_dlength (match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface (dtb__479, dtb__480, dtb__481, dtb__482) -> dtb__482
  | _ -> failwith "DT: impossible branch"
)) > 0) else false) then (v_Vuna_dCompiler_dDriver_dIface_dallValid (match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface (dtb__483, dtb__484, dtb__485, dtb__486) -> dtb__486
  | _ -> failwith "DT: impossible branch"
)) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__487, dtb__488) -> (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__487), (v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf dtb__488)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName = ".vuna-iface"

let v_Vuna_dCompiler_dDriver_dIface_drelUnder = (fun pkgDir path -> ((fun pkg -> ((fun p -> (if (pkg = ".") then (if ((Base_dString.v_Base_dString_dstartsWith "./") p) then (((dtp_substring 2) ((bi_strLength p) - 2)) p) else p) else (if ((Base_dString.v_Base_dString_dstartsWith (pkg ^ "/")) p) then (((dtp_substring ((bi_strLength pkg) + 1)) (((bi_strLength p) - (bi_strLength pkg)) - 1)) p) else ""))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir pkgDir)))

let v_Vuna_dCompiler_dDriver_dIface_difaceRelPathOf = (fun pkgDir si -> ((fun rel -> (if (rel = "") then "" else (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel) then ((((dtp_substring 0) ((bi_strLength rel) - 5)) rel) ^ ".iface") else (rel ^ ".iface")))) ((v_Vuna_dCompiler_dDriver_dIface_drelUnder pkgDir) (v_Vuna_dCompiler_dDriver_dIface_dsiPathOf si))))

let v_Vuna_dCompiler_dDriver_dIface_dvalidIfaceRelPath = (fun file -> (if (if (if (if (file <> "") then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") file)) else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "../") file)) else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dcontains "/../") file)) else false) then ((Base_dString.v_Base_dString_dendsWith ".iface") file) else false))

let v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__489, dtb__490, dtb__491, dtb__492, dtb__493, dtb__494) -> dtb__489
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> dtb__496
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> dtb__503
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__507, dtb__508, dtb__509, dtb__510, dtb__511, dtb__512) -> dtb__510
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeDepsOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__513, dtb__514, dtb__515, dtb__516, dtb__517, dtb__518) -> dtb__517
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeImportsOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524) -> dtb__524
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__525, dtb__526, dtb__527, dtb__528) -> dtb__525
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__529, dtb__530, dtb__531, dtb__532) -> dtb__530
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__533, dtb__534, dtb__535, dtb__536) -> dtb__535
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__537, dtb__538, dtb__539, dtb__540) -> dtb__540
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf = (fun dir -> (String.concat "" [dir; "/"; v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName]))

let v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf = (fun dir file -> (String.concat "" [dir; "/"; file]))

let v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic = "vuna-iface-file 1"

let v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix = (fun compiler -> (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|\n"]))

let v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile = (fun compiler payload -> ((v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix compiler) ^ payload))

let rec v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__541, dtb__542) -> (if (dtb__541 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dList.dtp_pack dtb__542))))) else ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline dtb__542) (Base_dList.C_Base_dList_dList_Cons (dtb__541, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile = (fun compiler raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline (Base_dList.dtp_unpack raw)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__543) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__543) = (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|"])) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__543))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreadManifest = (fun dir compiler -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir))) then ((fun raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__544) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtp_unmarshal dtb__544)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

let v_Vuna_dCompiler_dDriver_dIface_dwriteManifest = (fun dir compiler mf -> ((fun path -> ((fun payload -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (if ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path)) = payload) then 0 else (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) payload))) else (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) payload)))) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile compiler) (dtp_marshal mf)))) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf = (fun pkgDir m -> (C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), ((v_Vuna_dCompiler_dDriver_dIface_difaceRelPathOf pkgDir) (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf m)), (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf m), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m), (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf m), ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m))))))

let rec v_Vuna_dCompiler_dDriver_dIface_doldEntryOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__545, dtb__546) -> (if ((match dtb__545 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__547, dtb__548, dtb__549, dtb__550, dtb__551, dtb__552) -> dtb__547
  | _ -> failwith "DT: impossible branch"
) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__545)) else ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf dtb__546) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_ddepListIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__553, dtb__554) -> (match dtb__553 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__555, dtb__556) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__555) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__557) -> (if (dtb__557 = dtb__556) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn dtb__554) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepListsSame = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn a) b) else false) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn b) a) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dwriteModules = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__558, dtb__559) -> ((fun file -> (if (file = "") then (((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules mc0) mc1) mc2) mc3) dtb__559) else ((fun path -> ((fun unchanged -> ((fun n -> (n + (((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules mc0) mc1) mc2) mc3) dtb__559))) (if unchanged then 0 else ((fun _u -> 1) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile mc1) (dtp_marshal dtb__558)))))))) (match ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf mc3) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__558)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__560) -> (if (if ((match dtb__560 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__561, dtb__562, dtb__563, dtb__564, dtb__565, dtb__566) -> dtb__564
  | _ -> failwith "DT: impossible branch"
) = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__558)) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListsSame (match dtb__560 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__567, dtb__568, dtb__569, dtb__570, dtb__571, dtb__572) -> dtb__571
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__558)) else false) then (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf mc0) file)))) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry ((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf mc2) dtb__558)))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__573, dtb__574) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__573) = (v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry mc1)) then (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__574)) else (Base_dList.C_Base_dList_dList_Cons (dtb__573, ((v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry dtb__574) mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dentryNameIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__575, dtb__576) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__575) = mc1) then true else ((v_Vuna_dCompiler_dDriver_dIface_dentryNameIn dtb__576) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dwriteModuleIfaceMerge = (fun dir compiler pkg pkgDir mi -> ((fun entry -> ((fun file -> (if (file = "") then 0 else ((fun old -> ((fun merged -> ((fun _u -> ((fun _u -> 1) (((v_Vuna_dCompiler_dDriver_dIface_dwriteManifest dir) compiler) (C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (v_Vuna_dCompiler_dDriver_dIface_difaceSchema, compiler, pkg, merged))))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf dir) file)) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile compiler) (dtp_marshal mi)))))) ((v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry old) entry))) (match ((v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__577) -> (if (if (if ((v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf dtb__577) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf dtb__577) = compiler) else false) then ((v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf dtb__577) = pkg) else false) then (v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__577) else Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry entry))) ((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf pkgDir) mi)))

let v_Vuna_dCompiler_dDriver_dIface_dreadModuleFileRaw = (fun dir compiler e -> ((fun path -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then ((fun raw -> ((fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__578) -> ((fun m -> (if (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m) = (match e with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__579, dtb__580, dtb__581, dtb__582, dtb__583, dtb__584) -> dtb__579
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m) = (match e with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__585, dtb__586, dtb__587, dtb__588, dtb__589, dtb__590) -> dtb__588
  | _ -> failwith "DT: impossible branch"
)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (m)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (dtp_unmarshal dtb__578))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf dir) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e))))

let v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile = (fun dir compiler e -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dIface_dvalidIfaceRelPath (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e))) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFileRaw dir) compiler) e)))

let rec v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__591, dtb__592) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile mc0) mc1) dtb__591) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__593) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles mc0) mc1) dtb__592) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__594) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__593, dtb__594))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface = (fun dir compiler -> (match ((v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__595) -> (if (if ((match dtb__595 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__596, dtb__597, dtb__598, dtb__599) -> dtb__596
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((match dtb__595 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__600, dtb__601, dtb__602, dtb__603) -> dtb__601
  | _ -> failwith "DT: impossible branch"
) = compiler) else false) then (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles dir) compiler) (match dtb__595 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__604, dtb__605, dtb__606, dtb__607) -> dtb__607
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__608) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface ((match dtb__595 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__609, dtb__610, dtb__611, dtb__612) -> dtb__609
  | _ -> failwith "DT: impossible branch"
), (match dtb__595 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__613, dtb__614, dtb__615, dtb__616) -> dtb__614
  | _ -> failwith "DT: impossible branch"
), (match dtb__595 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__617, dtb__618, dtb__619, dtb__620) -> dtb__619
  | _ -> failwith "DT: impossible branch"
), dtb__608))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dwritePackageIface = (fun dir compiler pkg pkgDir modules -> ((fun oldEntries -> ((fun written -> ((fun mf -> ((fun _u -> written) (((v_Vuna_dCompiler_dDriver_dIface_dwriteManifest dir) compiler) mf))) (C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (v_Vuna_dCompiler_dDriver_dIface_difaceSchema, compiler, pkg, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf pkgDir)) modules))))) (((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules dir) compiler) pkgDir) oldEntries) modules))) (match ((v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__621) -> ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf pkgDir)) (match dtb__621 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface (dtb__622, dtb__623, dtb__624, dtb__625) -> dtb__625
  | _ -> failwith "DT: impossible branch"
))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))
