open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dIface_dSourceInfo = C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo of (string) * (int) * (int) * (int)
and t_Vuna_dCompiler_dDriver_dIface_dModuleIface = C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface of (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dSourceInfo) * (int) * ((string, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram)
and t_Vuna_dCompiler_dDriver_dIface_dPackageIface = C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface of (string) * (string) * (string) * (int) * (t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dCanonState = C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState of (int) * ((int, int) Base_dHashMap.t_Base_dHashMap_dHashMap)
and t_Vuna_dCompiler_dDriver_dIface_dOwnerIndex = C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex of ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, string) Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dProgParts = C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts of ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap)
and t_Vuna_dCompiler_dDriver_dIface_dManifestEntry = C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry of (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dSourceInfo) * (int) * ((string, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dDriver_dIface_dPackageManifest = C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest of (string) * (string) * (string) * (int) * (t_Vuna_dCompiler_dDriver_dIface_dManifestEntry Base_dList.t_Base_dList_dList)

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
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__30
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__72
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> dtb__99
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__127
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> dtb__155
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> dtb__169
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184) -> dtb__183
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule = (fun modules entryDecls name -> ((fun others -> ((fun own -> ((fun auxDecls -> (if ((Base_dList.v_Base_dList_dlength modules) <= 1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith auxDecls) own) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__185) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__186) -> (match (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__186) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__187) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__188) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) others)) entryDecls))) ((Base_dList.v_Base_dList_dconcatMap (fun m -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m) = name) then (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) else Base_dList.C_Base_dList_dList_Nil))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m) <> name))) modules)))

let v_Vuna_dCompiler_dDriver_dIface_dsetPrepared = (fun prepared mi -> (C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface ((match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> dtb__189
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214) -> dtb__203
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227) -> dtb__217
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> dtb__231
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253) -> dtb__245
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__254, dtb__255, dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266) -> dtb__259
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279) -> dtb__273
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> dtb__287
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> dtb__301
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> dtb__315
  | _ -> failwith "DT: impossible branch"
), (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329, dtb__330, dtb__331) -> dtb__329
  | _ -> failwith "DT: impossible branch"
), prepared, (match mi with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344) -> dtb__344
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dIface_difaceSchema = "vuna-iface 13"

let v_Vuna_dCompiler_dDriver_dIface_dstrongSalts = (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-0:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-1:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-2:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-3:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-4:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-5:", Base_dList.C_Base_dList_dList_Nil))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong = (fun s -> (((Base_dList.v_Base_dList_dfoldl (fun acc salt -> ((((Base_dNum.v_Base_dNum_dmul Base_dInt.v_Num_uInt) acc) 1000003) + (dtp_strHash (salt ^ s))))) 0) v_Vuna_dCompiler_dDriver_dIface_dstrongSalts))

let v_Vuna_dCompiler_dDriver_dIface_dcombineHash = (fun a b -> ((a * 1000003) + b))

let v_Vuna_dCompiler_dDriver_dIface_dhashTerm = (fun t -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal t)))

let rec v_Vuna_dCompiler_dDriver_dIface_dinsertByKey = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__345, dtb__346) -> (match dtb__345 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__347, dtb__348) -> (if (mc0 <= dtb__347) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__347, dtb__348)), dtb__346)))) else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__347, dtb__348)), (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey mc0) mc1) dtb__346))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dsortPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__349, dtb__350) -> (match dtb__349 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__351, dtb__352) -> (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey dtb__351) dtb__352) (v_Vuna_dCompiler_dDriver_dIface_dsortPairs dtb__350))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsortByKey = (fun key xs -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (v_Vuna_dCompiler_dDriver_dIface_dsortPairs ((Base_dList.v_Base_dList_dmap (fun x -> (Base_dPair.C_Base_dPair_dPair_Pair ((key x), x)))) xs))))

let v_Vuna_dCompiler_dDriver_dIface_dnameKey = (fun n -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong ("name:" ^ n)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty = (C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (0, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcanonTerm = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__353, dtb__354, dtb__355) -> ((fun pc -> ((fun pt -> ((fun pe -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Base_dPair.v_Base_dPair_dfirstOf pc), (Base_dPair.v_Base_dPair_dfirstOf pt), (Base_dPair.v_Base_dPair_dfirstOf pe))), (Base_dPair.v_Base_dPair_dsecondOf pe)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__355))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pc)) dtb__354))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__353))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__356, dtb__357) -> ((fun ps -> ((fun pa -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Base_dPair.v_Base_dPair_dfirstOf ps), (Base_dPair.v_Base_dPair_dfirstOf pa))), (Base_dPair.v_Base_dPair_dsecondOf pa)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf ps)) dtb__357))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__356))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__358, dtb__359) -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__358, (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__359))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__360, dtb__361, dtb__362) -> ((fun pf -> ((fun pa -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Base_dPair.v_Base_dPair_dfirstOf pf), (Base_dPair.v_Base_dPair_dfirstOf pa), dtb__362)), (Base_dPair.v_Base_dPair_dsecondOf pa)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pf)) dtb__361))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__360))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__363, dtb__364, dtb__365) -> ((fun pb -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__363, dtb__364, (Base_dPair.v_Base_dPair_dfirstOf pb))), (Base_dPair.v_Base_dPair_dsecondOf pb)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__365))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__366, dtb__367, dtb__368, dtb__369, dtb__370) -> ((fun pd -> ((fun pc -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__366, dtb__367, dtb__368, (Base_dPair.v_Base_dPair_dfirstOf pd), (Base_dPair.v_Base_dPair_dfirstOf pc))), (Base_dPair.v_Base_dPair_dsecondOf pc)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pd)) dtb__370))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__369))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__371) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) dtb__371) (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__372, dtb__373) -> dtb__373
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__374) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__374)), mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__375, dtb__376) -> dtb__375
  | _ -> failwith "DT: impossible branch"
))), (C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (((match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__377, dtb__378) -> dtb__377
  | _ -> failwith "DT: impossible branch"
) + 1), ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__371) (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__379, dtb__380) -> dtb__379
  | _ -> failwith "DT: impossible branch"
)) (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_CanonState (dtb__381, dtb__382) -> dtb__382
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair (mc1, mc0))
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__383, dtb__384) -> (match dtb__383 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__385, dtb__386) -> ((fun pt -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf pt), dtb__386)), (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__384))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__385))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__387, dtb__388) -> (match dtb__387 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__389, dtb__390, dtb__391) -> ((fun pb -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__389, dtb__390, (Base_dPair.v_Base_dPair_dfirstOf pb))), (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf pb)) dtb__388))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__391))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop = (fun t -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty) t)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__392) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop dtb__392)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddefView = (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)), (v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDefs = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_ddefView) ds)))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDatas = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun d -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) ds))))

let v_Vuna_dCompiler_dDriver_dIface_dhashInsts = (fun is -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun i -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) is))))

let v_Vuna_dCompiler_dDriver_dIface_dhashClasses = (fun cs -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun c -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) cs))))

let v_Vuna_dCompiler_dDriver_dIface_dhashGlobals = (fun gs -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) gs))))

let v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf = (fun e -> (String.concat "" [(match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__393, dtb__394, dtb__395, dtb__396) -> dtb__394
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__397, dtb__398, dtb__399, dtb__400) -> dtb__397
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__401, dtb__402, dtb__403, dtb__404) -> dtb__403
  | _ -> failwith "DT: impossible branch"
)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashExports = (fun es -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun e -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf e)))) es))))

let v_Vuna_dCompiler_dDriver_dIface_dhashCapabilities = (fun cs -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun s -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong s))) cs))))

let v_Vuna_dCompiler_dDriver_dIface_dfixityText = (fun f -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [(match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__405, dtb__406, dtb__407, dtb__408, dtb__409) -> dtb__405
  | _ -> failwith "DT: impossible branch"
); "|"; (bi_strFromInt (match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__410, dtb__411, dtb__412, dtb__413, dtb__414) -> dtb__411
  | _ -> failwith "DT: impossible branch"
)); "|"; (bi_strFromInt (match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__415, dtb__416, dtb__417, dtb__418, dtb__419) -> dtb__417
  | _ -> failwith "DT: impossible branch"
))])))

let v_Vuna_dCompiler_dDriver_dIface_dhashFixities = (fun fs -> (((Base_dList.v_Base_dList_dfoldl (fun acc f -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_dfixityText f)))) 0) fs))

let rec v_Vuna_dCompiler_dDriver_dIface_djoinStrings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__420, dtb__421) -> (match dtb__421 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__420
  | _ -> (String.concat "" [dtb__420; ","; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__421)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_drecordHash = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dElab_dRecords.C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__422, dtb__423, dtb__424, dtb__425, dtb__426, dtb__427) -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [dtb__422; "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__423); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__424)); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__425); "|"; (if dtb__426 then "1" else "0"); "|"; dtb__427]))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dhashRecords = (fun decls -> (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls (fun n -> n)) decls) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__428, dtb__429) -> (((Base_dList.v_Base_dList_dfoldl (fun acc r -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_drecordHash r)))) 0) dtb__428)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportAliasText = (fun i -> (match (match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__430, dtb__431, dtb__432, dtb__433) -> dtb__432
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__434) -> dtb__434
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText = (fun i -> (if (match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__435, dtb__436, dtb__437, dtb__438) -> dtb__436
  | _ -> failwith "DT: impossible branch"
) then "q" else "u"))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameText = (fun i -> (String.concat "" [(match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__439, dtb__440, dtb__441, dtb__442) -> dtb__439
  | _ -> failwith "DT: impossible branch"
); "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportAliasText i); "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText i)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashImports = (fun is -> (((Base_dList.v_Base_dList_dfoldl (fun acc i -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (v_Vuna_dCompiler_dDriver_dIface_dimportNameText i))))) 0) is))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfParts = (fun name pkg imports implicitImports fixities decls exports capabilities cp -> ((fun h0 -> ((fun h1 -> ((fun h2 -> ((fun h3 -> ((fun h4 -> ((fun h5 -> ((fun h6 -> ((fun h7 -> ((fun h8 -> ((fun h9 -> ((fun h10 -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h10) (v_Vuna_dCompiler_dDriver_dIface_dhashCapabilities capabilities))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h9) (v_Vuna_dCompiler_dDriver_dIface_dhashExports exports)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h8) (v_Vuna_dCompiler_dDriver_dIface_dhashClasses (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h7) (v_Vuna_dCompiler_dDriver_dIface_dhashInsts (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h6) (v_Vuna_dCompiler_dDriver_dIface_dhashGlobals (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h5) (v_Vuna_dCompiler_dDriver_dIface_dhashDefs (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h4) (v_Vuna_dCompiler_dDriver_dIface_dhashDatas (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h3) (v_Vuna_dCompiler_dDriver_dIface_dhashRecords decls)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h2) (v_Vuna_dCompiler_dDriver_dIface_dhashFixities fixities)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h1) (v_Vuna_dCompiler_dDriver_dIface_dhashImports implicitImports)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h0) (v_Vuna_dCompiler_dDriver_dIface_dhashImports imports)))) (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [name; "|"; pkg]))))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfIface = (fun m -> (((((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m)))

let v_Vuna_dCompiler_dDriver_dIface_dtblOwner = (fun t name -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) t))

let v_Vuna_dCompiler_dDriver_dIface_dprefixOwner = (fun knownModules name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (prefix)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)))

let v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__443, dtb__444, dtb__445, dtb__446) -> dtb__443
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__447) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__447))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__448, dtb__449, dtb__450, dtb__451) -> dtb__451
  | _ -> failwith "DT: impossible branch"
)) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__452, dtb__453, dtb__454, dtb__455) -> dtb__453
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__456) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__456))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__457, dtb__458, dtb__459, dtb__460) -> dtb__460
  | _ -> failwith "DT: impossible branch"
)) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__461, dtb__462) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__461))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__461))) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs dtb__462))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (dtb__463, dtb__464, dtb__465, dtb__466) -> dtb__465
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467) -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) dtb__467)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf = (fun oi name -> (if ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__468) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__468))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__469) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__469))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dIface_downerIndexOf = (fun meta datas -> (C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_OwnerIndex (((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_SplitMeta (dtb__470, dtb__471, dtb__472, dtb__473, dtb__474) -> dtb__470
  | _ -> failwith "DT: impossible branch"
)), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_SplitMeta (dtb__475, dtb__476, dtb__477, dtb__478, dtb__479) -> dtb__476
  | _ -> failwith "DT: impossible branch"
)), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs datas)), (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_SplitMeta (dtb__480, dtb__481, dtb__482, dtb__483, dtb__484) -> dtb__482
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dIface_dbucketOf = (fun name tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__485) -> dtb__485
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__486, dtb__487) -> (match (mc0 dtb__486) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__487) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__488) -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__487) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__488) (Base_dList.C_Base_dList_dList_Cons (dtb__486, ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf dtb__488) mc2)))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBucket = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__489, dtb__490) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__489, (Base_dList.v_Base_dList_dreverse dtb__490)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets = (fun tbl -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dreverseBucket) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) tbl))))

let v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner = (fun ownerOf xs -> (v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo ownerOf) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf = (fun oi prog -> (C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun p -> ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) (Base_dPair.v_Base_dPair_dfirstOf p)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun i -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)), ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun c -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))))

let v_Vuna_dCompiler_dDriver_dIface_dcpOfModule = (fun parts prog mod_ -> ((fun datas -> ((fun defs -> ((fun globals -> ((fun insts -> ((fun classes -> ((fun slice -> ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496) -> dtb__491
  | _ -> failwith "DT: impossible branch"
)) slice)) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (datas, defs, Base_dList.C_Base_dList_dList_Nil, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog), globals, insts, classes, 0, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__497, dtb__498, dtb__499, dtb__500, dtb__501, dtb__502) -> dtb__502
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__503, dtb__504, dtb__505, dtb__506, dtb__507, dtb__508) -> dtb__507
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__509, dtb__510, dtb__511, dtb__512, dtb__513, dtb__514) -> dtb__512
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__515, dtb__516, dtb__517, dtb__518, dtb__519, dtb__520) -> dtb__517
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (match parts with
  | C_Vuna_dCompiler_dDriver_dIface_dProgParts_ProgParts (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526) -> dtb__522
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dsourceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__527, dtb__528) -> (match dtb__527 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__529, dtb__530) -> (if (dtb__529 = mc1) then dtb__530 else ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf dtb__528) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_SourceInfo ("", 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameOf = (fun _uarity0 -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName _uarity0))

let v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) ((Base_dList.v_Base_dList_dappend (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__531, dtb__532, dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> dtb__533
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__540, dtb__541, dtb__542, dtb__543, dtb__544, dtb__545, dtb__546, dtb__547, dtb__548) -> dtb__543
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName = (fun tbl name -> (match ((Base_dList.v_Base_dList_dlookupPair name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__549) -> dtb__549
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf = (fun tbl m -> ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Pair (n, ((v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName tbl) n))))) (v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule m)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__550, dtb__551) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__550) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__550)) else ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf dtb__551) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase = (fun pkg parts prog sources clean m -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__552) -> dtb__552
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun name -> ((fun cp -> ((fun h -> (C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface (name, pkg, ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf sources) name), h, Base_dList.C_Base_dList_dList_Nil, (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, dtb__560, dtb__561) -> dtb__555
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__562, dtb__563, dtb__564, dtb__565, dtb__566, dtb__567, dtb__568, dtb__569, dtb__570) -> dtb__565
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__571, dtb__572, dtb__573, dtb__574, dtb__575, dtb__576, dtb__577, dtb__578, dtb__579) -> dtb__577
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__580, dtb__581, dtb__582, dtb__583, dtb__584, dtb__585, dtb__586, dtb__587, dtb__588) -> dtb__585
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__589, dtb__590, dtb__591, dtb__592, dtb__593, dtb__594, dtb__595, dtb__596, dtb__597) -> dtb__597
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__598, dtb__599, dtb__600, dtb__601, dtb__602, dtb__603, dtb__604, dtb__605, dtb__606) -> dtb__602
  | _ -> failwith "DT: impossible branch"
), Base_dList.C_Base_dList_dList_Nil, cp))) (((((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts name) pkg) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__607, dtb__608, dtb__609, dtb__610, dtb__611, dtb__612, dtb__613, dtb__614, dtb__615) -> dtb__609
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__616, dtb__617, dtb__618, dtb__619, dtb__620, dtb__621, dtb__622, dtb__623, dtb__624) -> dtb__619
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__625, dtb__626, dtb__627, dtb__628, dtb__629, dtb__630, dtb__631, dtb__632, dtb__633) -> dtb__633
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__634, dtb__635, dtb__636, dtb__637, dtb__638, dtb__639, dtb__640, dtb__641, dtb__642) -> dtb__638
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__643, dtb__644, dtb__645, dtb__646, dtb__647, dtb__648, dtb__649, dtb__650, dtb__651) -> dtb__648
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__652, dtb__653, dtb__654, dtb__655, dtb__656, dtb__657, dtb__658, dtb__659, dtb__660) -> dtb__658
  | _ -> failwith "DT: impossible branch"
)) cp))) (((v_Vuna_dCompiler_dDriver_dIface_dcpOfModule parts) prog) name))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dfinishIface = (fun tbl clean m mi -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__661) -> dtb__661
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (C_Vuna_dCompiler_dDriver_dIface_dModuleIface_ModuleIface ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf mi), ((v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf tbl) m), (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf mi)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difacesGo = (fun pkg parts prog sources knownDeps clean modules -> ((fun built -> ((fun hashes -> ((fun fullTbl -> (Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dmap (fun p -> ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface fullTbl) clean) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)))) built), fullTbl))) ((Base_dList.v_Base_dList_dappend knownDeps) hashes))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf (Base_dPair.v_Base_dPair_dsecondOf p)), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf (Base_dPair.v_Base_dPair_dsecondOf p)))))) built))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair (m, ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) sources) clean) m))))) modules)))

let v_Vuna_dCompiler_dDriver_dIface_downerOfAny = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__662) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__662))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__663) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__663))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf = (fun oi ourNames inherited merged prelude name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) prelude) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) inherited) then "" else (match ((v_Vuna_dCompiler_dDriver_dIface_downerOfAny oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__664) -> (if (dtb__664 = Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__664) ourNames) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) merged) then "" else (String.concat "" ["missing-from-iface "; name; " -> "; dtb__664])) else ""))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("unowned " ^ name)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__665, dtb__666) -> ((fun issue -> (if (issue = "") then ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo mc0) mc1) mc2) mc3) mc4) dtb__666) else issue)) ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf mc0) mc1) mc2) mc3) mc4) dtb__665))
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__667) -> (Base_dResult.C_Base_dResult_dResult_Err (("iface: " ^ dtb__667)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (ifaces))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage = (fun pkg sources knownDeps inherited clean modules entryDecls prog -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match (((((((v_Vuna_dCompiler_dDriver_dIface_difacesGo pkg) parts) prog) sources) knownDeps) clean) ourModules) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__668, dtb__669) -> (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageResult oi) ourNames) inherited) dtb__668) prog)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m), (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m))))) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__670, dtb__671) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__670) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__670)) else ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule dtb__671) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsameOwner = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__672) -> (dtb__672 = mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_downedByModule = (fun oi name artifact -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner name) ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) artifact)))

let rec v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__673, dtb__674) -> ((fun skip -> (if skip then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__674) mc4) else (if ((Base_dList.v_Base_dList_dmemName dtb__673) mc4) then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__674) mc4) else false))) (if ((Base_dList.v_Base_dList_dmemName dtb__673) mc1) then true else (Base_dBool.v_Base_dBool_dnot (((v_Vuna_dCompiler_dDriver_dIface_downedByModule mc0) mc2) dtb__673))))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk = (fun oi inherited name prog mi -> ((fun present -> (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent oi) inherited) name) (v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf prog)) present)) (v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf mi)))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfModule = (fun pkg si knownDeps inherited clean modules entryDecls prog name -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule ourModules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["iface: module "; name; " is not part of the checked package"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__675) -> ((fun mi0 -> ((fun tbl -> ((fun mi -> ((fun miP -> (if (((((v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk oi) inherited) name) prog) miP) then (Base_dResult.C_Base_dResult_dResult_Ok (miP)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["iface: module "; name; " has uncovered artifacts"]))))) (match (((v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule ourModules) entryDecls) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mi
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__676) -> ((v_Vuna_dCompiler_dDriver_dIface_dsetPrepared dtb__676) mi)
  | _ -> failwith "DT: impossible branch"
))) ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface tbl) Base_dList.C_Base_dList_dList_Nil) dtb__675) mi0))) ((Base_dList.v_Base_dList_dappend knownDeps) ((Base_dList.v_Base_dList_dmap (fun x -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf x), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf x))))) ((Base_dList.v_Base_dList_dappend clean) (Base_dList.C_Base_dList_dList_Cons (mi0, Base_dList.C_Base_dList_dList_Nil))))))) ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (name, si)), Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) dtb__675))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m), (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m))))) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dallValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__677, dtb__678) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__677)) then (v_Vuna_dCompiler_dDriver_dIface_dallValid dtb__678) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid = (fun pi -> (if (if ((match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface (dtb__679, dtb__680, dtb__681, dtb__682, dtb__683) -> dtb__679
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Base_dList.v_Base_dList_dlength (match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface (dtb__684, dtb__685, dtb__686, dtb__687, dtb__688) -> dtb__688
  | _ -> failwith "DT: impossible branch"
)) > 0) else false) then (v_Vuna_dCompiler_dDriver_dIface_dallValid (match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface (dtb__689, dtb__690, dtb__691, dtb__692, dtb__693) -> dtb__693
  | _ -> failwith "DT: impossible branch"
)) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__694, dtb__695) -> (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__694), (v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf dtb__695)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName = ".vuna-iface"

let v_Vuna_dCompiler_dDriver_dIface_drelUnder = (fun pkgDir path -> ((fun pkg -> ((fun p -> (if (pkg = ".") then (if ((Base_dString.v_Base_dString_dstartsWith "./") p) then (((dtp_substring 2) ((bi_strLength p) - 2)) p) else p) else (if ((Base_dString.v_Base_dString_dstartsWith (pkg ^ "/")) p) then (((dtp_substring ((bi_strLength pkg) + 1)) (((bi_strLength p) - (bi_strLength pkg)) - 1)) p) else ""))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir pkgDir)))

let v_Vuna_dCompiler_dDriver_dIface_difaceMirrorMode = ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_IFACE_DIR")) <> "")

let v_Vuna_dCompiler_dDriver_dIface_difaceHashToken = (fun n -> ((fun m -> ((fun r -> (bi_strFromInt (if (r < 0) then (r + m) else r))) (n - ((if m = 0 then failwith "division by zero" else n / m) * m)))) 1000000007))

let v_Vuna_dCompiler_dDriver_dIface_difaceRelPathOf = (fun h pkgDir si -> ((fun rel -> ((fun stem -> (if (stem = "") then "" else (if v_Vuna_dCompiler_dDriver_dIface_difaceMirrorMode then (String.concat "" [stem; "-"; (v_Vuna_dCompiler_dDriver_dIface_difaceHashToken h); ".iface"]) else (stem ^ ".iface")))) (if (rel = "") then "" else (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel) then (((dtp_substring 0) ((bi_strLength rel) - 5)) rel) else rel)))) ((v_Vuna_dCompiler_dDriver_dIface_drelUnder pkgDir) (v_Vuna_dCompiler_dDriver_dIface_dsiPathOf si))))

let v_Vuna_dCompiler_dDriver_dIface_dvalidIfaceRelPath = (fun file -> (if (if (if (if (file <> "") then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") file)) else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "../") file)) else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dcontains "/../") file)) else false) then ((Base_dString.v_Base_dString_dendsWith ".iface") file) else false))

let v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__696, dtb__697, dtb__698, dtb__699, dtb__700, dtb__701, dtb__702) -> dtb__696
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__703, dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709) -> dtb__704
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__710, dtb__711, dtb__712, dtb__713, dtb__714, dtb__715, dtb__716) -> dtb__712
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__717, dtb__718, dtb__719, dtb__720, dtb__721, dtb__722, dtb__723) -> dtb__720
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeDepsOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__724, dtb__725, dtb__726, dtb__727, dtb__728, dtb__729, dtb__730) -> dtb__728
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeImportsOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__731, dtb__732, dtb__733, dtb__734, dtb__735, dtb__736, dtb__737) -> dtb__736
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeOriginOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__738, dtb__739, dtb__740, dtb__741, dtb__742, dtb__743, dtb__744) -> dtb__744
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__745, dtb__746, dtb__747, dtb__748, dtb__749) -> dtb__745
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__750, dtb__751, dtb__752, dtb__753, dtb__754) -> dtb__751
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__755, dtb__756, dtb__757, dtb__758, dtb__759) -> dtb__757
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmEnvOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__760, dtb__761, dtb__762, dtb__763, dtb__764) -> dtb__763
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__765, dtb__766, dtb__767, dtb__768, dtb__769) -> dtb__769
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf = (fun dir -> (String.concat "" [dir; "/"; v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName]))

let v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf = (fun dir file -> (String.concat "" [dir; "/"; file]))

let v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic = "vuna-iface-file 1"

let v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix = (fun compiler -> (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|\n"]))

let v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile = (fun compiler payload -> ((v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix compiler) ^ payload))

let rec v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__770, dtb__771) -> (if (dtb__770 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dList.dtp_pack dtb__771))))) else ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline dtb__771) (Base_dList.C_Base_dList_dList_Cons (dtb__770, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile = (fun compiler raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline (Base_dList.dtp_unpack raw)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__772) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__772) = (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|"])) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__772))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreadManifest = (fun dir compiler -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir))) then ((fun raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__773) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtp_unmarshal dtb__773)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

let v_Vuna_dCompiler_dDriver_dIface_dwriteManifest = (fun dir compiler mf -> ((fun path -> ((fun payload -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (if ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path)) = payload) then 0 else (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) payload))) else (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) payload)))) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile compiler) (dtp_marshal mf)))) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith = (fun origin pkgDir m -> (C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (((v_Vuna_dCompiler_dDriver_dIface_difaceRelPathOf (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m)) pkgDir) (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf m)), (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf m), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m), (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf m), ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m))), origin)))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf = (fun _uarity0 _uarity1 -> (((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith "pkg") _uarity0) _uarity1))

let rec v_Vuna_dCompiler_dDriver_dIface_doldEntryOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__774, dtb__775) -> (if ((match dtb__774 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__776, dtb__777, dtb__778, dtb__779, dtb__780, dtb__781, dtb__782) -> dtb__776
  | _ -> failwith "DT: impossible branch"
) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__774)) else ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf dtb__775) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_ddepListIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__783, dtb__784) -> (match dtb__783 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__785, dtb__786) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__785) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__787) -> (if (dtb__787 = dtb__786) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn dtb__784) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepListsSame = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn a) b) else false) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn b) a) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dwriteModules = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__788, dtb__789) -> ((fun file -> (if (file = "") then ((((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules mc0) mc1) mc2) mc3) mc4) dtb__789) else ((fun path -> ((fun unchanged -> ((fun n -> (n + ((((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules mc0) mc1) mc2) mc3) mc4) dtb__789))) (if unchanged then 0 else ((fun _u -> 1) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile mc1) (dtp_marshal dtb__788)))))))) (match ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf mc4) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__788)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__790) -> (if (if (if ((match dtb__790 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__791, dtb__792, dtb__793, dtb__794, dtb__795, dtb__796, dtb__797) -> dtb__794
  | _ -> failwith "DT: impossible branch"
) = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__788)) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListsSame (match dtb__790 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__798, dtb__799, dtb__800, dtb__801, dtb__802, dtb__803, dtb__804) -> dtb__802
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__788)) else false) then ((match dtb__790 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__805, dtb__806, dtb__807, dtb__808, dtb__809, dtb__810, dtb__811) -> dtb__811
  | _ -> failwith "DT: impossible branch"
) = mc3) else false) then (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf mc0) file)))) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry (((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith mc3) mc2) dtb__788)))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__812, dtb__813) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__812) = (v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry mc1)) then (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__813)) else (Base_dList.C_Base_dList_dList_Cons (dtb__812, ((v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry dtb__813) mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dentryNameIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__814, dtb__815) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__814) = mc1) then true else ((v_Vuna_dCompiler_dDriver_dIface_dentryNameIn dtb__815) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dwriteModuleIfaceMerge = (fun dir compiler pkg pkgDir env origin mi -> ((fun entry -> ((fun file -> (if (file = "") then 0 else ((fun old -> ((fun merged -> ((fun _u -> ((fun _u -> 1) (((v_Vuna_dCompiler_dDriver_dIface_dwriteManifest dir) compiler) (C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (v_Vuna_dCompiler_dDriver_dIface_difaceSchema, compiler, pkg, env, merged))))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf dir) file)) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile compiler) (dtp_marshal mi)))))) ((v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry old) entry))) (match ((v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__816) -> (if (if (if ((v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf dtb__816) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf dtb__816) = compiler) else false) then ((v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf dtb__816) = pkg) else false) then (v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__816) else Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry entry))) (((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith origin) pkgDir) mi)))

let v_Vuna_dCompiler_dDriver_dIface_difaceFileTokenOk = (fun e -> (if v_Vuna_dCompiler_dDriver_dIface_difaceMirrorMode then ((Base_dString.v_Base_dString_dendsWith (String.concat "" ["-"; (v_Vuna_dCompiler_dDriver_dIface_difaceHashToken (v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry e)); ".iface"])) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e)) else true))

let v_Vuna_dCompiler_dDriver_dIface_dreadModuleFileRaw = (fun dir compiler e -> ((fun path -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then ((fun raw -> ((fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__817) -> ((fun m -> (if (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m) = (match e with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__818, dtb__819, dtb__820, dtb__821, dtb__822, dtb__823, dtb__824) -> dtb__818
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m) = (match e with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_ManifestEntry (dtb__825, dtb__826, dtb__827, dtb__828, dtb__829, dtb__830, dtb__831) -> dtb__828
  | _ -> failwith "DT: impossible branch"
)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (m)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (dtp_unmarshal dtb__817))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf dir) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e))))

let v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile = (fun dir compiler e -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dIface_dvalidIfaceRelPath (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e))) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dIface_difaceFileTokenOk e)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFileRaw dir) compiler) e))))

let rec v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__832, dtb__833) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile mc0) mc1) dtb__832) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__834) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles mc0) mc1) dtb__833) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__835) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__834, dtb__835))))
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__836) -> (if (if ((match dtb__836 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__837, dtb__838, dtb__839, dtb__840, dtb__841) -> dtb__837
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((match dtb__836 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__842, dtb__843, dtb__844, dtb__845, dtb__846) -> dtb__843
  | _ -> failwith "DT: impossible branch"
) = compiler) else false) then (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles dir) compiler) (match dtb__836 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__847, dtb__848, dtb__849, dtb__850, dtb__851) -> dtb__851
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__852) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dDriver_dIface_dPackageIface_PackageIface ((match dtb__836 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__853, dtb__854, dtb__855, dtb__856, dtb__857) -> dtb__853
  | _ -> failwith "DT: impossible branch"
), (match dtb__836 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__858, dtb__859, dtb__860, dtb__861, dtb__862) -> dtb__859
  | _ -> failwith "DT: impossible branch"
), (match dtb__836 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__863, dtb__864, dtb__865, dtb__866, dtb__867) -> dtb__865
  | _ -> failwith "DT: impossible branch"
), (match dtb__836 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (dtb__868, dtb__869, dtb__870, dtb__871, dtb__872) -> dtb__871
  | _ -> failwith "DT: impossible branch"
), dtb__852))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dwritePackageIface = (fun dir compiler pkg pkgDir env modules -> ((fun oldEntries -> ((fun written -> ((fun mf -> ((fun _u -> written) (((v_Vuna_dCompiler_dDriver_dIface_dwriteManifest dir) compiler) mf))) (C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_PackageManifest (v_Vuna_dCompiler_dDriver_dIface_difaceSchema, compiler, pkg, env, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf pkgDir)) modules))))) ((((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules dir) compiler) pkgDir) "pkg") oldEntries) modules))) (match ((v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__873) -> (match ((v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__874) -> (v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__874)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))
