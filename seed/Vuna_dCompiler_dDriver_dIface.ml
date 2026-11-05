open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dIface_dSourceInfo = C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo of (string) * (int) * (int) * (int)
and t_Vuna_dCompiler_dDriver_dIface_dModuleIface = C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface of (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dSourceInfo) * (int) * ((string, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram)
and t_Vuna_dCompiler_dDriver_dIface_dPackageIface = C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface of (string) * (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dCanonState = C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState of (int) * (int Base_dIntMap.t_Base_dIntMap_dIntMap)
and t_Vuna_dCompiler_dDriver_dIface_dOwnerIndex = C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_Vuna_dCompiler_dDriver_dIface_dOwnerIndex of (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dManifestEntry = C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry of (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dSourceInfo) * (int) * ((string, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dDriver_dIface_dPackageManifest = C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest of (string) * (string) * (string) * (t_Vuna_dCompiler_dDriver_dIface_dManifestEntry Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dDriver_dIface_dsiPathOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsiHashOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo (dtb__4, dtb__5, dtb__6, dtb__7) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo (dtb__8, dtb__9, dtb__10, dtb__11) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf = (fun s -> (match s with
  | C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo (dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiNameOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> dtb__78
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> dtb__119
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135) -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf = (fun m -> (match m with
  | C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceSchema = "vuna-iface 7"

let v_Vuna_dCompiler_dDriver_dIface_dstrongSalts = (Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna-iface-0:", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna-iface-1:", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna-iface-2:", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna-iface-3:", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna-iface-4:", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna-iface-5:", Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong = (fun s -> (((Base_dList.v_Base_dList_dfoldl (fun acc salt -> ((acc * 1000003) + (dtp_strHash (salt ^ s))))) 0) v_Vuna_dCompiler_dDriver_dIface_dstrongSalts))

let v_Vuna_dCompiler_dDriver_dIface_dcombineHash = (fun a b -> ((a * 1000003) + b))

let v_Vuna_dCompiler_dDriver_dIface_dhashTerm = (fun t -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal t)))

let rec v_Vuna_dCompiler_dDriver_dIface_dinsertByKey = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (if ((mc0 mc1) <= (mc0 dtb__160)) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161)))) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__160, (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey mc0) mc1) dtb__161))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dsortByKey = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey mc0) dtb__162) ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey mc0) dtb__163))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dnameKey = (fun n -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong ("name:" ^ n)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty = (C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState (0, (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcanonTerm = (fun st t -> (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__164) -> (match ((Base_dIntMap.v_Base_dIntMap_dlookup dtb__164) (match st with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState (dtb__165, dtb__166) -> dtb__166
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__167) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__167)), st))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta ((match st with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState (dtb__168, dtb__169) -> dtb__168
  | _ -> failwith "DT: impossible branch"
))), (C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState (((match st with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState (dtb__170, dtb__171) -> dtb__170
  | _ -> failwith "DT: impossible branch"
) + 1), (((Base_dIntMap.v_Base_dIntMap_dinsert dtb__164) (match st with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState (dtb__172, dtb__173) -> dtb__172
  | _ -> failwith "DT: impossible branch"
)) (match st with
  | C_Vuna_dCompiler_dDriver_dIface_dCanonState_Vuna_dCompiler_dDriver_dIface_dCanonState (dtb__174, dtb__175) -> dtb__175
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> ((fun pd -> ((fun pc -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__176, dtb__177, dtb__178, (Base_dPair.v_Base_dPair_dfirstOf pd), (Base_dPair.v_Base_dPair_dfirstOf pc))), (Base_dPair.v_Base_dPair_dsecondOf pc)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pd)) dtb__180))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm st) dtb__179))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__181, dtb__182, dtb__183) -> ((fun pb -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__181, dtb__182, (Base_dPair.v_Base_dPair_dfirstOf pb))), (Base_dPair.v_Base_dPair_dsecondOf pb)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm st) dtb__183))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__184, dtb__185, dtb__186) -> ((fun pf -> ((fun pa -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Base_dPair.v_Base_dPair_dfirstOf pf), (Base_dPair.v_Base_dPair_dfirstOf pa), dtb__186)), (Base_dPair.v_Base_dPair_dsecondOf pa)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pf)) dtb__185))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm st) dtb__184))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__187, dtb__188) -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__187, (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs st) dtb__188))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__189, dtb__190) -> ((fun ps -> ((fun pa -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((Base_dPair.v_Base_dPair_dfirstOf ps), (Base_dPair.v_Base_dPair_dfirstOf pa))), (Base_dPair.v_Base_dPair_dsecondOf pa)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf ps)) dtb__190))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm st) dtb__189))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__191, dtb__192, dtb__193) -> ((fun pc -> ((fun pt -> ((fun pe -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((Base_dPair.v_Base_dPair_dfirstOf pc), (Base_dPair.v_Base_dPair_dfirstOf pt), (Base_dPair.v_Base_dPair_dfirstOf pe))), (Base_dPair.v_Base_dPair_dsecondOf pe)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__193))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pc)) dtb__192))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm st) dtb__191))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (t, st))
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__194, dtb__195) -> (match dtb__194 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> ((fun pt -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf pt), dtb__197)), (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__195))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__196))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> (match dtb__198 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__200, dtb__201, dtb__202) -> ((fun pb -> ((fun pr -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__200, dtb__201, (Base_dPair.v_Base_dPair_dfirstOf pb))), (Base_dPair.v_Base_dPair_dfirstOf pr))), (Base_dPair.v_Base_dPair_dsecondOf pr)))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf pb)) dtb__199))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__202))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop = (fun t -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty) t)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe = (fun mo -> (match mo with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__203) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop dtb__203)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddefView = (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)), (v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDefs = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_ddefView) ds)))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDatas = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun d -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) ds))))

let v_Vuna_dCompiler_dDriver_dIface_dhashInsts = (fun is -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun i -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) is))))

let v_Vuna_dCompiler_dDriver_dIface_dhashClasses = (fun cs -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun c -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) cs))))

let v_Vuna_dCompiler_dDriver_dIface_dhashGlobals = (fun gs -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) gs))))

let v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf = (fun e -> (String.concat "" [(match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__204, dtb__205, dtb__206, dtb__207) -> dtb__205
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__208, dtb__209, dtb__210, dtb__211) -> dtb__208
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__212, dtb__213, dtb__214, dtb__215) -> dtb__214
  | _ -> failwith "DT: impossible branch"
)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashExports = (fun es -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun e -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf e)))) es))))

let v_Vuna_dCompiler_dDriver_dIface_dfixityText = (fun f -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [(match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> dtb__216
  | _ -> failwith "DT: impossible branch"
); "|"; (bi_strFromInt (match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> dtb__222
  | _ -> failwith "DT: impossible branch"
)); "|"; (bi_strFromInt (match f with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> dtb__228
  | _ -> failwith "DT: impossible branch"
))])))

let v_Vuna_dCompiler_dDriver_dIface_dhashFixities = (fun fs -> (((Base_dList.v_Base_dList_dfoldl (fun acc f -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_dfixityText f)))) 0) fs))

let rec v_Vuna_dCompiler_dDriver_dIface_djoinStrings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> (match dtb__232 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> dtb__231
  | _ -> (String.concat "" [dtb__231; ","; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__232)])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_drecordHash = (fun r -> (match r with
  | Vuna_dCompiler_dElab_dRecords.C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237) -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [dtb__233; "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__234); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__235)); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__236); "|"; dtb__237]))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dhashRecords = (fun decls -> (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls (fun n -> n)) decls) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__238, dtb__239) -> (((Base_dList.v_Base_dList_dfoldl (fun acc r -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_drecordHash r)))) 0) dtb__238)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportAliasText = (fun i -> (match (match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__240, dtb__241, dtb__242, dtb__243) -> dtb__242
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__244) -> dtb__244
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText = (fun i -> (if (match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__245, dtb__246, dtb__247, dtb__248) -> dtb__246
  | _ -> failwith "DT: impossible branch"
) then "q" else "u"))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameText = (fun i -> (String.concat "" [(match i with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__249, dtb__250, dtb__251, dtb__252) -> dtb__249
  | _ -> failwith "DT: impossible branch"
); "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportAliasText i); "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText i)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashImports = (fun is -> (((Base_dList.v_Base_dList_dfoldl (fun acc i -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash acc) (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (v_Vuna_dCompiler_dDriver_dIface_dimportNameText i))))) 0) is))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfParts = (fun name pkg imports implicitImports fixities decls cp -> ((fun h0 -> ((fun h1 -> ((fun h2 -> ((fun h3 -> ((fun h4 -> ((fun h5 -> ((fun h6 -> ((fun h7 -> ((fun h8 -> ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h8) (v_Vuna_dCompiler_dDriver_dIface_dhashClasses (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h7) (v_Vuna_dCompiler_dDriver_dIface_dhashInsts (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h6) (v_Vuna_dCompiler_dDriver_dIface_dhashGlobals (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h5) (v_Vuna_dCompiler_dDriver_dIface_dhashDefs (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h4) (v_Vuna_dCompiler_dDriver_dIface_dhashDatas (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp))))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h3) (v_Vuna_dCompiler_dDriver_dIface_dhashRecords decls)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h2) (v_Vuna_dCompiler_dDriver_dIface_dhashFixities fixities)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h1) (v_Vuna_dCompiler_dDriver_dIface_dhashImports implicitImports)))) ((v_Vuna_dCompiler_dDriver_dIface_dcombineHash h0) (v_Vuna_dCompiler_dDriver_dIface_dhashImports imports)))) (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" [name; "|"; pkg]))))

let v_Vuna_dCompiler_dDriver_dIface_dtblOwner = (fun t name -> ((Base_dHashMap.v_Base_dHashMap_dlookup name) t))

let v_Vuna_dCompiler_dDriver_dIface_dprefixOwner = (fun knownModules name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (prefix)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)))

let v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_Vuna_dCompiler_dDriver_dIface_dOwnerIndex (dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__253
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__257) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__257))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_Vuna_dCompiler_dDriver_dIface_dOwnerIndex (dtb__258, dtb__259, dtb__260, dtb__261) -> dtb__261
  | _ -> failwith "DT: impossible branch"
)) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_Vuna_dCompiler_dDriver_dIface_dOwnerIndex (dtb__262, dtb__263, dtb__264, dtb__265) -> dtb__263
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__266) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__266))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_Vuna_dCompiler_dDriver_dIface_dOwnerIndex (dtb__267, dtb__268, dtb__269, dtb__270) -> dtb__270
  | _ -> failwith "DT: impossible branch"
)) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__271, dtb__272) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__271))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__271))) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs dtb__272))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (match oi with
  | C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_Vuna_dCompiler_dDriver_dIface_dOwnerIndex (dtb__273, dtb__274, dtb__275, dtb__276) -> dtb__275
  | _ -> failwith "DT: impossible branch"
)) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__277) -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) dtb__277)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf = (fun oi name -> (if ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__278) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__278))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__279) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__279))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dIface_downerIndexOf = (fun meta datas -> (C_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_Vuna_dCompiler_dDriver_dIface_dOwnerIndex ((Base_dHashMap.v_Base_dHashMap_dfromList (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (dtb__280, dtb__281, dtb__282) -> dtb__280
  | _ -> failwith "DT: impossible branch"
)), (Base_dHashMap.v_Base_dHashMap_dfromList (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (dtb__283, dtb__284, dtb__285) -> dtb__284
  | _ -> failwith "DT: impossible branch"
)), (Base_dHashMap.v_Base_dHashMap_dfromList (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs datas)), (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_Vuna_dCompiler_dDriver_dOwner_dSplitMeta (dtb__286, dtb__287, dtb__288) -> dtb__288
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dIface_dsameOwner = (fun mod_ mo -> (match mo with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__289) -> (dtb__289 = mod_)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcpOfModule = (fun oi prog mod_ -> ((fun datas -> ((fun defs -> ((fun globals -> ((fun insts -> ((fun classes -> ((fun slice -> (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram slice)) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (datas, defs, Base_dList.C_Base_dList_dList_Base_dList_dNil, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog), globals, insts, classes, 0, (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), Base_dList.C_Base_dList_dList_Base_dList_dNil)))) ((Base_dList.v_Base_dList_dfilter (fun c -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner mod_) ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))) ((Base_dList.v_Base_dList_dfilter (fun i -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner mod_) ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)))) ((Base_dList.v_Base_dList_dfilter (fun p -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner mod_) ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) (Base_dPair.v_Base_dPair_dfirstOf p))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner mod_) ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner mod_) ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))

let rec v_Vuna_dCompiler_dDriver_dIface_dsourceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__290, dtb__291) -> (match dtb__290 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, dtb__293) -> (if (dtb__292 = mc1) then dtb__293 else ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf dtb__291) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo ("", 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameOf = (fun _uarity0 -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName _uarity0))

let v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) ((Base_dList.v_Base_dList_dappend (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> dtb__296
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307, dtb__308, dtb__309) -> dtb__305
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName = (fun tbl name -> (match ((Base_dList.v_Base_dList_dlookupPair name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__310) -> dtb__310
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf = (fun tbl m -> ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, ((v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName tbl) n))))) (v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule m)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__311, dtb__312) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__311) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__311)) else ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf dtb__312) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase = (fun pkg oi prog sources clean m -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__313) -> dtb__313
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun name -> ((fun cp -> ((fun h -> (C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface (name, pkg, ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf sources) name), h, Base_dList.C_Base_dList_dList_Base_dList_dNil, (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__314, dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> dtb__316
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> dtb__325
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337) -> dtb__336
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345) -> dtb__343
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> dtb__353
  | _ -> failwith "DT: impossible branch"
), (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361) -> dtb__358
  | _ -> failwith "DT: impossible branch"
), cp))) (((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts name) pkg) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369) -> dtb__364
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__370, dtb__371, dtb__372, dtb__373, dtb__374, dtb__375, dtb__376, dtb__377) -> dtb__373
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385) -> dtb__385
  | _ -> failwith "DT: impossible branch"
)) (match m with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392, dtb__393) -> dtb__390
  | _ -> failwith "DT: impossible branch"
)) cp))) (((v_Vuna_dCompiler_dDriver_dIface_dcpOfModule oi) prog) name))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dfinishIface = (fun tbl clean m mi -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__394) -> dtb__394
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dDriver_dIface_dModuleIface_Vuna_dCompiler_dDriver_dIface_dModuleIface ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf mi), ((v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf tbl) m), (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf mi), (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf mi)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difacesGo = (fun pkg oi prog sources knownDeps clean modules -> ((fun built -> ((fun hashes -> ((fun fullTbl -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Base_dList.v_Base_dList_dmap (fun p -> ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface fullTbl) clean) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)))) built), fullTbl))) ((Base_dList.v_Base_dList_dappend knownDeps) hashes))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf (Base_dPair.v_Base_dPair_dsecondOf p)), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf (Base_dPair.v_Base_dPair_dsecondOf p)))))) built))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (m, ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) oi) prog) sources) clean) m))))) modules)))

let v_Vuna_dCompiler_dDriver_dIface_disPreludeName = (fun name -> ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames))

let v_Vuna_dCompiler_dDriver_dIface_downerOfAny = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__395) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__395))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__396) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__396))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf = (fun oi ourNames inherited merged name -> (if (v_Vuna_dCompiler_dDriver_dIface_disPreludeName name) then "" else (if ((Base_dList.v_Base_dList_dmemName name) inherited) then "" else (match ((v_Vuna_dCompiler_dDriver_dIface_downerOfAny oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__397) -> (if (dtb__397 = Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) then "" else (if ((Base_dList.v_Base_dList_dmemName dtb__397) ourNames) then (if ((Base_dList.v_Base_dList_dmemName name) merged) then "" else (String.concat "" ["missing-from-iface "; name; " -> "; dtb__397])) else ""))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ("unowned " ^ name)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__398, dtb__399) -> ((fun issue -> (if (issue = "") then (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo mc0) mc1) mc2) mc3) dtb__399) else issue)) (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf mc0) mc1) mc2) mc3) dtb__398))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf = (fun prog -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)))))))

let v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf = (fun cp -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)))

let v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf = (fun cp -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)))

let v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf = (fun m -> ((fun cp -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf cp)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf cp)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp)))))))) (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m)))

let v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames = (fun ifaces -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf) ifaces))

let v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue = (fun oi ourNames inherited ifaces prog -> ((fun merged -> ((fun issue -> (if (issue = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (issue)))) (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo oi) ourNames) inherited) merged) (v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf prog)))) (v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames ifaces)))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageResult = (fun oi ourNames inherited ifaces prog -> (match (((((v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue oi) ourNames) inherited) ifaces) prog) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__400) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("iface: " ^ dtb__400)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ifaces))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage = (fun pkg sources knownDeps inherited clean modules entryDecls prog -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun ourNames -> (match (((((((v_Vuna_dCompiler_dDriver_dIface_difacesGo pkg) oi) prog) sources) knownDeps) clean) ourModules) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__401, dtb__402) -> (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageResult oi) ourNames) inherited) dtb__401) prog)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m), (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m))))) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dallValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__403, dtb__404) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__403)) then (v_Vuna_dCompiler_dDriver_dIface_dallValid dtb__404) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid = (fun pi -> (if (if ((match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__405, dtb__406, dtb__407, dtb__408) -> dtb__405
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Base_dList.v_Base_dList_dlength (match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__409, dtb__410, dtb__411, dtb__412) -> dtb__412
  | _ -> failwith "DT: impossible branch"
)) > 0) else false) then (v_Vuna_dCompiler_dDriver_dIface_dallValid (match pi with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__413, dtb__414, dtb__415, dtb__416) -> dtb__416
  | _ -> failwith "DT: impossible branch"
)) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__417, dtb__418) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__417), (v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf dtb__418)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName = "manifest"

let v_Vuna_dCompiler_dDriver_dIface_difaceFileNameOf = (fun name -> (name ^ ".iface"))

let v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__419, dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> dtb__419
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__425, dtb__426, dtb__427, dtb__428, dtb__429, dtb__430) -> dtb__426
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> dtb__433
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__437, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442) -> dtb__440
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeDepsOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448) -> dtb__447
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeImportsOfEntry = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> dtb__454
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__455, dtb__456, dtb__457, dtb__458) -> dtb__455
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__459, dtb__460, dtb__461, dtb__462) -> dtb__460
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__463, dtb__464, dtb__465, dtb__466) -> dtb__465
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__467, dtb__468, dtb__469, dtb__470) -> dtb__470
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf = (fun dir -> (String.concat "" [dir; "/"; v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName]))

let v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf = (fun dir file -> (String.concat "" [dir; "/"; file]))

let v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic = "vuna-iface-file 1"

let v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix = (fun compiler -> (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|\n"]))

let v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile = (fun compiler payload -> ((v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix compiler) ^ payload))

let rec v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__471, dtb__472) -> (if (dtb__471 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dList.dtp_pack dtb__472))))) else ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline dtb__472) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__471, mc1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile = (fun compiler raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline (Base_dList.dtp_unpack raw)) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__473) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__473) = (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|"])) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.v_Base_dPair_dsecondOf dtb__473))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreadManifest = (fun dir compiler -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir))) then ((fun raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__474) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal dtb__474)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dIface_dwriteManifest = (fun dir compiler mf -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile compiler) (dtp_marshal mf)))))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf = (fun m -> (C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (v_Vuna_dCompiler_dDriver_dIface_difaceFileNameOf (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m)), (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf m), (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m), (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf m), ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m))))))

let rec v_Vuna_dCompiler_dDriver_dIface_doldEntryOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__475, dtb__476) -> (if ((match dtb__475 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__477, dtb__478, dtb__479, dtb__480, dtb__481, dtb__482) -> dtb__477
  | _ -> failwith "DT: impossible branch"
) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__475)) else ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf dtb__476) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_ddepListIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__483, dtb__484) -> (match dtb__483 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__485, dtb__486) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__485) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__487) -> (if (dtb__487 = dtb__486) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn dtb__484) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepListsSame = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn a) b) else false) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn b) a) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dwriteModules = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__488, dtb__489) -> ((fun path -> ((fun unchanged -> ((fun n -> (n + ((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules mc0) mc1) mc2) dtb__489))) (if unchanged then 0 else ((fun _u -> 1) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile mc1) (dtp_marshal dtb__488)))))))) (match ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf mc2) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__488)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__490) -> (if (if ((match dtb__490 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496) -> dtb__494
  | _ -> failwith "DT: impossible branch"
) = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__488)) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListsSame (match dtb__490 with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__497, dtb__498, dtb__499, dtb__500, dtb__501, dtb__502) -> dtb__501
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__488)) else false) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf mc0) (v_Vuna_dCompiler_dDriver_dIface_difaceFileNameOf (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__488))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile = (fun dir compiler e -> ((fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then ((fun raw -> ((fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__503) -> ((fun m -> (if (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m) = (match e with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__504, dtb__505, dtb__506, dtb__507, dtb__508, dtb__509) -> dtb__504
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m) = (match e with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__510, dtb__511, dtb__512, dtb__513, dtb__514, dtb__515) -> dtb__513
  | _ -> failwith "DT: impossible branch"
)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (m)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (dtp_unmarshal dtb__503))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf dir) (match e with
  | C_Vuna_dCompiler_dDriver_dIface_dManifestEntry_Vuna_dCompiler_dDriver_dIface_dManifestEntry (dtb__516, dtb__517, dtb__518, dtb__519, dtb__520, dtb__521) -> dtb__517
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__522, dtb__523) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile mc0) mc1) dtb__522) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__524) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles mc0) mc1) dtb__523) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__525) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__524, dtb__525))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface = (fun dir compiler -> (match ((v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__526) -> (if (if ((match dtb__526 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__527, dtb__528, dtb__529, dtb__530) -> dtb__527
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((match dtb__526 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__531, dtb__532, dtb__533, dtb__534) -> dtb__532
  | _ -> failwith "DT: impossible branch"
) = compiler) else false) then (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles dir) compiler) (match dtb__526 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__535, dtb__536, dtb__537, dtb__538) -> dtb__538
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__539) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface ((match dtb__526 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__540, dtb__541, dtb__542, dtb__543) -> dtb__540
  | _ -> failwith "DT: impossible branch"
), (match dtb__526 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__544, dtb__545, dtb__546, dtb__547) -> dtb__545
  | _ -> failwith "DT: impossible branch"
), (match dtb__526 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (dtb__548, dtb__549, dtb__550, dtb__551) -> dtb__550
  | _ -> failwith "DT: impossible branch"
), dtb__539))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dwritePackageIface = (fun dir compiler pkg modules -> ((fun oldEntries -> ((fun written -> ((fun mf -> ((fun _u -> written) (((v_Vuna_dCompiler_dDriver_dIface_dwriteManifest dir) compiler) mf))) (C_Vuna_dCompiler_dDriver_dIface_dPackageManifest_Vuna_dCompiler_dDriver_dIface_dPackageManifest (v_Vuna_dCompiler_dDriver_dIface_difaceSchema, compiler, pkg, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf) modules))))) ((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules dir) compiler) oldEntries) modules))) (match ((v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__552) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf) (match dtb__552 with
  | C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__553, dtb__554, dtb__555, dtb__556) -> dtb__556
  | _ -> failwith "DT: impossible branch"
))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))
