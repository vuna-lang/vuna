open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dIface_dSourceInfo = { f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath : string; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash : string; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime : int; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize : int }
and t_Vuna_dCompiler_dDriver_dIface_dModuleIface = { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName : string; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage : string; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource : t_Vuna_dCompiler_dDriver_dIface_dSourceInfo; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash : string; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords : Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached : Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram }
and t_Vuna_dCompiler_dDriver_dIface_dPackageIface = { f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piSchema : string; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piCompiler : string; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piPackage : string; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piEnv : int; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules : t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dIface_dCanonState = { f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext : int; f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap : (int, int) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dDriver_dIface_dOwnerIndex = { f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiDef : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiData : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiCtor : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dIface_dProgParts = { f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppSols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDatas : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDefs : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppGlobals : (string, (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppInsts : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppClasses : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dDriver_dIface_dManifestEntry = { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName : string; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile : string; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource : t_Vuna_dCompiler_dDriver_dIface_dSourceInfo; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash : string; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin : string }
and t_Vuna_dCompiler_dDriver_dIface_dPackageManifest = { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema : string; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler : string; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage : string; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv : int; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules : t_Vuna_dCompiler_dDriver_dIface_dManifestEntry Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dDriver_dIface_dsiPathOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath)

let v_Vuna_dCompiler_dDriver_dIface_dsiHashOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash)

let v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime)

let v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize)

let v_Vuna_dCompiler_dDriver_dIface_dmiNameOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName)

let v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage)

let v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached)

let v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash)

let v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes)

let v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource)

let v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports)

let v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports)

let v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCapabilities)

let v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports)

let v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities)

let v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls)

let v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords)

let v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared)

let v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule = (fun modules entryDecls name -> ((fun others -> ((fun own -> ((fun auxDecls -> (if ((Base_dList.v_Base_dList_dlength modules) <= 1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith auxDecls) own) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1) -> (match (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings (Base_dPair.v_Base_dPair_dsecondOf dtb__1)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__3) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) others)) entryDecls))) ((Base_dList.v_Base_dList_dconcatMap (fun m -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m) = name) then (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) else Base_dList.C_Base_dList_dList_Nil))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m) <> name))) modules)))

let v_Vuna_dCompiler_dDriver_dIface_dsetPrepared = (fun prepared mi -> { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCapabilities = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCapabilities; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = prepared; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached })

let v_Vuna_dCompiler_dDriver_dIface_difaceSchema = "vuna-iface 19"

let v_Vuna_dCompiler_dDriver_dIface_difaceHashVersion = "vuna-iface-hash 3 (sha256 + prehash)"

let v_Vuna_dCompiler_dDriver_dIface_dstrongSalts = (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-0:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-1:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-2:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-3:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-4:", (Base_dList.C_Base_dList_dList_Cons ("vuna-iface-5:", Base_dList.C_Base_dList_dList_Nil))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong = (fun s -> (((Base_dList.v_Base_dList_dfoldl (fun acc salt -> ((((Base_dNum.v_Base_dNum_dmul Base_dInt.v_Num_uInt) acc) 1000003) + (dtp_strHash (salt ^ s))))) 0) v_Vuna_dCompiler_dDriver_dIface_dstrongSalts))

let v_Vuna_dCompiler_dDriver_dIface_dshaText = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestHex (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestOfString s)))

let v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest = (fun s -> (v_Vuna_dCompiler_dDriver_dIface_dshaText (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dprehashOfString s)))

let v_Vuna_dCompiler_dDriver_dIface_dpartOf = (fun s -> (String.concat "" [(bi_strFromInt (bi_strLength s)); ":"; s]))

let v_Vuna_dCompiler_dDriver_dIface_ddigestParts = (fun ps -> (v_Vuna_dCompiler_dDriver_dIface_dshaText (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dpartOf) ps))))

let v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash = "missing"

let v_Vuna_dCompiler_dDriver_dIface_dhashTerm = (fun t -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest (dtp_marshal t)))

let rec v_Vuna_dCompiler_dDriver_dIface_dinsertByKey = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> (if (mc0 <= dtb__6) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 }, dtb__5)))) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 }, (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey mc0) mc1) dtb__5))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dsortPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (((v_Vuna_dCompiler_dDriver_dIface_dinsertByKey dtb__10) dtb__11) (v_Vuna_dCompiler_dDriver_dIface_dsortPairs dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsortByKey = (fun key xs -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (v_Vuna_dCompiler_dDriver_dIface_dsortPairs ((Base_dList.v_Base_dList_dmap (fun x -> { Base_dPair.f_Base_dPair_dPair_first = (key x); Base_dPair.f_Base_dPair_dPair_second = x })) xs))))

let v_Vuna_dCompiler_dDriver_dIface_dnameKey = (fun n -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong ("name:" ^ n)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty = { f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext = 0; f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil) }

let rec v_Vuna_dCompiler_dDriver_dIface_dcanonTerm = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__12, dtb__13, dtb__14) -> ((fun pc -> ((fun pt -> ((fun pe -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Base_dPair.v_Base_dPair_dfirstOf pc), (Base_dPair.v_Base_dPair_dfirstOf pt), (Base_dPair.v_Base_dPair_dfirstOf pe))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pe) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__14))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pc)) dtb__13))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__12))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__15, dtb__16) -> ((fun ps -> ((fun pa -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Base_dPair.v_Base_dPair_dfirstOf ps), (Base_dPair.v_Base_dPair_dfirstOf pa))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pa) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf ps)) dtb__16))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__15))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__17, dtb__18) -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__17, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__18))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__19, dtb__20) -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__19, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__20))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__21, dtb__22) -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__21, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__22))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__23, dtb__24, dtb__25) -> ((fun pf -> ((fun pa -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Base_dPair.v_Base_dPair_dfirstOf pf), (Base_dPair.v_Base_dPair_dfirstOf pa), dtb__25)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pa) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pf)) dtb__24))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__23))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__26, dtb__27, dtb__28) -> ((fun pb -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__26, dtb__27, (Base_dPair.v_Base_dPair_dfirstOf pb))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pb) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__28))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> ((fun pd -> ((fun pc -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__29, dtb__30, dtb__31, (Base_dPair.v_Base_dPair_dfirstOf pd), (Base_dPair.v_Base_dPair_dfirstOf pc))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pc) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pd)) dtb__33))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__32))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__34) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) dtb__34) (mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__35)); Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext = ((mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext + 1); f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__34) (mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext) (mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap) } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc0 }
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> ((fun pt -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf pt); Base_dPair.f_Base_dPair_dPair_second = dtb__39 }, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__37))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__38))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__42; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__43; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__44 } -> ((fun pb -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__42; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__43; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Base_dPair.v_Base_dPair_dfirstOf pb) }, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf pb)) dtb__41))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__44))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop = (fun t -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty) t)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop dtb__45)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddefView = (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)) } })

let v_Vuna_dCompiler_dDriver_dIface_dhashDefs = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_ddefView) ds)))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDatas = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun d -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) ds))))

let v_Vuna_dCompiler_dDriver_dIface_dhashInsts = (fun is -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun i -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) is))))

let v_Vuna_dCompiler_dDriver_dIface_dhashClasses = (fun cs -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun c -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) cs))))

let v_Vuna_dCompiler_dDriver_dIface_dhashGlobals = (fun gs -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun p -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (Base_dPair.v_Base_dPair_dfirstOf p)))) gs))))

let v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf = (fun e -> (String.concat "" [(e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target]))

let v_Vuna_dCompiler_dDriver_dIface_dhashExports = (fun es -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest (dtp_marshal ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun e -> (v_Vuna_dCompiler_dDriver_dIface_dnameKey (v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf e)))) es))))

let v_Vuna_dCompiler_dDriver_dIface_dhashCapabilities = (fun cs -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts ((v_Vuna_dCompiler_dDriver_dIface_dsortByKey (fun s -> (v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong s))) cs)))

let v_Vuna_dCompiler_dDriver_dIface_dfixityKeyText = (fun f -> (String.concat "" [(f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp; "|"; (bi_strFromInt (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel); "|"; (bi_strFromInt (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashFixities = (fun fs -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dfixityKeyText) fs)))

let v_Vuna_dCompiler_dDriver_dIface_dfieldKeyText = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName = dtb__46; Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldType = dtb__47; Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldIndex = dtb__48 } -> (String.concat "" [dtb__46; ":"; (bi_strFromInt dtb__48)])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_djoinStrings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (match dtb__50 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__49
  | _ -> (String.concat "" [dtb__49; ","; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings dtb__50)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_drecordKeyText = (fun r -> (String.concat "" [(r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName; "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings (r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaParams); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dfieldKeyText) (r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields)); "|"; (v_Vuna_dCompiler_dDriver_dIface_djoinStrings (r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaDerivings); "|"; (if (r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaDerivingVia then "1" else "0"); "|"; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dreprPrefix (r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaRepr); "|"; (r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaCtor; "|"; (if (r).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaLinear then "1" else "0")]))

let v_Vuna_dCompiler_dDriver_dIface_dhashRecords = (fun recs -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_drecordKeyText) recs)))

let v_Vuna_dCompiler_dDriver_dIface_dimportAliasText = (fun i -> (match (i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> dtb__51
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText = (fun i -> (if (i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified then "q" else "u"))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameText = (fun i -> (String.concat "" [(i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName; "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportAliasText i); "|"; (v_Vuna_dCompiler_dDriver_dIface_dimportQualifiedText i)]))

let v_Vuna_dCompiler_dDriver_dIface_dhashImports = (fun is -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameText) is)))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfParts = (fun name pkg imports implicitImports fixities records exports capabilities cp -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dIface_difaceHashVersion, (Base_dList.C_Base_dList_dList_Cons (name, (Base_dList.C_Base_dList_dList_Cons (pkg, (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashImports imports), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashImports implicitImports), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashFixities fixities), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashRecords records), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashDatas (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashDefs (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashGlobals (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashInsts (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashClasses (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashExports exports), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashCapabilities capabilities), Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfIface = (fun m -> (((((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m)))

let v_Vuna_dCompiler_dDriver_dIface_dtblOwner = (fun t name -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) t))

let v_Vuna_dCompiler_dDriver_dIface_dprefixOwner = (fun knownModules name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (prefix)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)))

let v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiDef) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiData) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__54) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__54))) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs dtb__55))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiCtor) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) dtb__56)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf = (fun oi name -> (if ((Base_dList.v_Base_dList_dmemName name) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dIface_downerIndexOf = (fun meta datas -> { f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiDef = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDefOwners); f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiData = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDataOwners); f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiCtor = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs datas)); f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown = (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules })

let v_Vuna_dCompiler_dDriver_dIface_dbucketOf = (fun name tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> dtb__59
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match (mc0 dtb__60) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__61) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__61) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__62) (Base_dList.C_Base_dList_dList_Cons (dtb__60, ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf dtb__62) mc2)))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBucket = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__63; Base_dPair.f_Base_dPair_dPair_second = dtb__64 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__63; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse dtb__64) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets = (fun tbl -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dreverseBucket) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) tbl))))

let v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner = (fun ownerOf xs -> (v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo ownerOf) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf = (fun oi prog -> { f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppSols = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDatas = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDefs = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppGlobals = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun p -> ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) (Base_dPair.v_Base_dPair_dfirstOf p)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppInsts = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun i -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppClasses = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun c -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)) })

let v_Vuna_dCompiler_dDriver_dIface_dcpOfModule = (fun parts prog mod_ -> ((fun datas -> ((fun defs -> ((fun globals -> ((fun insts -> ((fun classes -> ((fun slice -> ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppSols) slice)) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = datas; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = defs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = globals; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = insts; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = classes; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = 0; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = Base_dList.C_Base_dList_dList_Nil })) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppClasses))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppInsts))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppGlobals))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDefs))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDatas)))

let rec v_Vuna_dCompiler_dDriver_dIface_dsourceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> (match dtb__65 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__67; Base_dPair.f_Base_dPair_dPair_second = dtb__68 } -> (if (dtb__67 = mc1) then dtb__68 else ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf dtb__66) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = ""; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = ""; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = 0; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = 0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameOf = (fun _uarity0 -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName _uarity0))

let v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf)))

let rec v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__69 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> (if (dtb__72 = v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash) then true else (v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName = (fun tbl name -> (match ((Base_dList.v_Base_dList_dlookupPair name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> dtb__73
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf = (fun tbl m -> ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName tbl) n) })) (v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule m)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__74) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74)) else ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf dtb__75) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase = (fun pkg parts prog sources clean m -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> dtb__76
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun name -> ((fun cp -> ((fun records -> ((fun h -> { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = name; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = pkg; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf sources) name); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = h; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCapabilities = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = records; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = cp }) (((((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts name) pkg) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf) records) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities) cp))) (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf))) (((v_Vuna_dCompiler_dDriver_dIface_dcpOfModule parts) prog) name))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dfinishIface = (fun tbl clean m mi -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> dtb__77
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = ((v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf tbl) m); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCapabilities = (v_Vuna_dCompiler_dDriver_dIface_dmiCapabilitiesOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = (v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf mi) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difacesGo = (fun pkg parts prog sources knownDeps clean modules -> ((fun built -> ((fun hashes -> ((fun fullTbl -> { Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dmap (fun p -> ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface fullTbl) clean) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)))) built); Base_dPair.f_Base_dPair_dPair_second = fullTbl }) ((Base_dList.v_Base_dList_dappend knownDeps) hashes))) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf (Base_dPair.v_Base_dPair_dsecondOf p)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf (Base_dPair.v_Base_dPair_dsecondOf p)) })) built))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) sources) clean) m) })) modules)))

let v_Vuna_dCompiler_dDriver_dIface_downerOfAny = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf = (fun oi ourNames inherited merged prelude name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) prelude) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) inherited) then "" else (match ((v_Vuna_dCompiler_dDriver_dIface_downerOfAny oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__80) -> (if (dtb__80 = Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__80) ourNames) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) merged) then "" else (String.concat "" ["missing-from-iface "; name; " -> "; dtb__80])) else ""))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("unowned " ^ name)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> ((fun issue -> (if (issue = "") then ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo mc0) mc1) mc2) mc3) mc4) dtb__82) else issue)) ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf mc0) mc1) mc2) mc3) mc4) dtb__81))
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("iface: " ^ dtb__83))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ifaces))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage = (fun pkg sources knownDeps inherited clean modules entryDecls prog -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match (((((((v_Vuna_dCompiler_dDriver_dIface_difacesGo pkg) parts) prog) sources) knownDeps) clean) ourModules) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__84; Base_dPair.f_Base_dPair_dPair_second = dtb__85 } -> (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageResult oi) ourNames) inherited) dtb__84) prog)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__86) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__86)) else ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule dtb__87) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsameOwner = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> (dtb__88 = mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_downedByModule = (fun oi name artifact -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner name) ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) artifact)))

let rec v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__89, dtb__90) -> ((fun skip -> (if skip then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__90) mc4) else (if ((Base_dList.v_Base_dList_dmemName dtb__89) mc4) then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__90) mc4) else false))) (if ((Base_dList.v_Base_dList_dmemName dtb__89) mc1) then true else (Base_dBool.v_Base_dBool_dnot (((v_Vuna_dCompiler_dDriver_dIface_downedByModule mc0) mc2) dtb__89))))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk = (fun oi inherited name prog mi -> ((fun present -> (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent oi) inherited) name) (v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf prog)) present)) (v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf mi)))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfModule = (fun pkg si knownDeps inherited clean modules entryDecls prog name -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule ourModules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["iface: module "; name; " is not part of the checked package"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91) -> ((fun mi0 -> ((fun tbl -> ((fun mi -> ((fun miP -> (if (((((v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk oi) inherited) name) prog) miP) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (miP)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["iface: module "; name; " has uncovered artifacts"])))) (match (((v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule ourModules) entryDecls) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mi
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> ((v_Vuna_dCompiler_dDriver_dIface_dsetPrepared dtb__92) mi)
  | _ -> failwith "DT: impossible branch"
))) ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface tbl) Base_dList.C_Base_dList_dList_Nil) dtb__91) mi0))) ((Base_dList.v_Base_dList_dappend knownDeps) ((Base_dList.v_Base_dList_dmap (fun x -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf x); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf x) })) ((Base_dList.v_Base_dList_dappend clean) (Base_dList.C_Base_dList_dList_Cons (mi0, Base_dList.C_Base_dList_dList_Nil))))))) ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = si }, Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) dtb__91))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dallValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__93)) then (v_Vuna_dCompiler_dDriver_dIface_dallValid dtb__94) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid = (fun pi -> (if (if ((pi).f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piSchema = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Base_dList.v_Base_dList_dlength (pi).f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules) > 0) else false) then (v_Vuna_dCompiler_dDriver_dIface_dallValid (pi).f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__95), (v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf dtb__96)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName = ".vuna-iface"

let v_Vuna_dCompiler_dDriver_dIface_drelUnder = (fun pkgDir path -> ((fun pkg -> ((fun p -> (if (pkg = ".") then (if ((Base_dString.v_Base_dString_dstartsWith "./") p) then (((dtp_substring 2) ((bi_strLength p) - 2)) p) else p) else (if ((Base_dString.v_Base_dString_dstartsWith (pkg ^ "/")) p) then (((dtp_substring ((bi_strLength pkg) + 1)) (((bi_strLength p) - (bi_strLength pkg)) - 1)) p) else ""))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir pkgDir)))

let v_Vuna_dCompiler_dDriver_dIface_difaceMirrorMode = ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_IFACE_DIR")) <> "")

let v_Vuna_dCompiler_dDriver_dIface_difaceHashToken = (fun h -> (((dtp_substring 0) 16) h))

let v_Vuna_dCompiler_dDriver_dIface_difaceRelPathOf = (fun h pkgDir si -> ((fun rel -> ((fun stem -> (if (stem = "") then "" else (if v_Vuna_dCompiler_dDriver_dIface_difaceMirrorMode then (String.concat "" [stem; "-"; (v_Vuna_dCompiler_dDriver_dIface_difaceHashToken h); ".iface"]) else (stem ^ ".iface")))) (if (rel = "") then "" else (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel) then (((dtp_substring 0) ((bi_strLength rel) - 5)) rel) else rel)))) ((v_Vuna_dCompiler_dDriver_dIface_drelUnder pkgDir) (v_Vuna_dCompiler_dDriver_dIface_dsiPathOf si))))

let v_Vuna_dCompiler_dDriver_dIface_dvalidIfaceRelPath = (fun file -> (if (if (if (if (file <> "") then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") file)) else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "../") file)) else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dcontains "/../") file)) else false) then ((Base_dString.v_Base_dString_dendsWith ".iface") file) else false))

let v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = dtb__97; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = dtb__98; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = dtb__99; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = dtb__100; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = dtb__101; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = dtb__102; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = dtb__103 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = dtb__104; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = dtb__105; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = dtb__106; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = dtb__107; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = dtb__108; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = dtb__109; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = dtb__110 } -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = dtb__111; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = dtb__112; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = dtb__113; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = dtb__114; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = dtb__115; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = dtb__116; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = dtb__117 } -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = dtb__118; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = dtb__119; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = dtb__120; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = dtb__121; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = dtb__122; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = dtb__123; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = dtb__124 } -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeDepsOfEntry = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = dtb__125; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = dtb__126; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = dtb__127; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = dtb__128; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = dtb__129; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = dtb__130; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = dtb__131 } -> dtb__129
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeImportsOfEntry = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = dtb__132; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = dtb__133; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = dtb__134; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = dtb__135; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = dtb__136; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = dtb__137; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = dtb__138 } -> dtb__137
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmeOriginOfEntry = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = dtb__139; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = dtb__140; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = dtb__141; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = dtb__142; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = dtb__143; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = dtb__144; f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = dtb__145 } -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = dtb__146; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = dtb__147; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage = dtb__148; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv = dtb__149; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules = dtb__150 } -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = dtb__151; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = dtb__152; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage = dtb__153; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv = dtb__154; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules = dtb__155 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = dtb__156; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = dtb__157; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage = dtb__158; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv = dtb__159; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules = dtb__160 } -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmEnvOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = dtb__161; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = dtb__162; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage = dtb__163; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv = dtb__164; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules = dtb__165 } -> dtb__164
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = dtb__166; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = dtb__167; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage = dtb__168; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv = dtb__169; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules = dtb__170 } -> dtb__170
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf = (fun dir -> (String.concat "" [dir; "/"; v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName]))

let v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf = (fun dir file -> (String.concat "" [dir; "/"; file]))

let v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic = "vuna-iface-file 1"

let v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix = (fun compiler -> (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|\n"]))

let v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile = (fun compiler payload -> ((v_Vuna_dCompiler_dDriver_dIface_difaceFilePrefix compiler) ^ payload))

let rec v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (if (dtb__171 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack dtb__172) })) else ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline dtb__172) (Base_dList.C_Base_dList_dList_Cons (dtb__171, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile = (fun compiler raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_dbreakAtNewline (Base_dList.dtp_unpack raw)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__173) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__173) = (String.concat "" [v_Vuna_dCompiler_dDriver_dIface_difaceFileMagic; "|"; v_Vuna_dCompiler_dDriver_dIface_difaceSchema; "|"; compiler; "|"])) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__173))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreadManifest = (fun dir compiler -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir))) then ((fun raw -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtp_unmarshal dtb__174)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

let v_Vuna_dCompiler_dDriver_dIface_dwriteManifest = (fun dir compiler mf -> ((fun path -> ((fun payload -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (if ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path)) = payload) then 0 else (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) payload))) else (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) payload)))) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile compiler) (dtp_marshal mf)))) (v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dir)))

let v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith = (fun origin pkgDir m -> { f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meFile = (((v_Vuna_dCompiler_dDriver_dIface_difaceRelPathOf (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m)) pkgDir) (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf m)); f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meSource = (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf m); f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m); f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps = (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf m); f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meImports = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m))); f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = origin })

let v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf = (fun _uarity0 _uarity1 -> (((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith "pkg") _uarity0) _uarity1))

let rec v_Vuna_dCompiler_dDriver_dIface_doldEntryOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (if ((dtb__175).f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__175)) else ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf dtb__176) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_ddepListIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (match dtb__177 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__179; Base_dPair.f_Base_dPair_dPair_second = dtb__180 } -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__179) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181) -> (if (dtb__181 = dtb__180) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListIn dtb__178) mc1) else false)
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__182, dtb__183) -> ((fun file -> (if (file = "") then ((((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules mc0) mc1) mc2) mc3) mc4) dtb__183) else ((fun path -> ((fun unchanged -> ((fun n -> (n + ((((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules mc0) mc1) mc2) mc3) mc4) dtb__183))) (if unchanged then 0 else ((fun _u -> 1) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile mc1) (dtp_marshal dtb__182)))))))) (match ((v_Vuna_dCompiler_dDriver_dIface_doldEntryOf mc4) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__182)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (if (if (if ((dtb__184).f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__182)) then ((v_Vuna_dCompiler_dDriver_dIface_ddepListsSame (dtb__184).f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meDeps) (v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__182)) else false) then ((dtb__184).f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meOrigin = mc3) else false) then (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf mc0) file)))) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry (((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith mc3) mc2) dtb__182)))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__185) = (v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry mc1)) then (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__186)) else (Base_dList.C_Base_dList_dList_Cons (dtb__185, ((v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry dtb__186) mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dentryNameIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__187) = mc1) then true else ((v_Vuna_dCompiler_dDriver_dIface_dentryNameIn dtb__188) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dwriteModuleIfaceMerge = (fun dir compiler pkg pkgDir env origin mi -> ((fun entry -> ((fun file -> (if (file = "") then 0 else ((fun old -> ((fun merged -> ((fun _u -> ((fun _u -> 1) (((v_Vuna_dCompiler_dDriver_dIface_dwriteManifest dir) compiler) { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = v_Vuna_dCompiler_dDriver_dIface_difaceSchema; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = compiler; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage = pkg; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv = env; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules = merged }))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf dir) file)) ((v_Vuna_dCompiler_dDriver_dIface_dencodeIfaceFile compiler) (dtp_marshal mi)))))) ((v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry old) entry))) (match ((v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (if (if (if ((v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf dtb__189) = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf dtb__189) = compiler) else false) then ((v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf dtb__189) = pkg) else false) then (v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__189) else Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry entry))) (((v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith origin) pkgDir) mi)))

let v_Vuna_dCompiler_dDriver_dIface_dwritePackageIface = (fun oldReadable dir compiler pkg pkgDir env modules -> ((fun oldEntries -> ((fun written -> ((fun mf -> ((fun _u -> written) (((v_Vuna_dCompiler_dDriver_dIface_dwriteManifest dir) compiler) mf))) { f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = v_Vuna_dCompiler_dDriver_dIface_difaceSchema; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = compiler; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage = pkg; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv = env; f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf pkgDir)) modules) })) ((((((v_Vuna_dCompiler_dDriver_dIface_dwriteModules dir) compiler) pkgDir) "pkg") oldEntries) modules))) (if oldReadable then (match ((v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) compiler) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__190) -> (v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__190)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
) else Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dDriver_dIface_difaceFileTokenOk = (fun e -> (if v_Vuna_dCompiler_dDriver_dIface_difaceMirrorMode then ((Base_dString.v_Base_dString_dendsWith (String.concat "" ["-"; (v_Vuna_dCompiler_dDriver_dIface_difaceHashToken (v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry e)); ".iface"])) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e)) else true))

let v_Vuna_dCompiler_dDriver_dIface_dreadModuleFileRaw = (fun dir compiler e -> ((fun path -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then ((fun raw -> ((fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> ((fun m -> (if (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m) = (e).f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meName) then ((v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m) = (e).f_Vuna_dCompiler_dDriver_dIface_dManifestEntry_meIfaceHash) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (m)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (dtp_unmarshal dtb__191))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dIface_ddecodeIfaceFile compiler) raw))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) ((v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf dir) (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e))))

let v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile = (fun dir compiler e -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dIface_dvalidIfaceRelPath (v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry e))) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dIface_difaceFileTokenOk e)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFileRaw dir) compiler) e))))

let rec v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile mc0) mc1) dtb__192) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__194) -> (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles mc0) mc1) dtb__193) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__194, dtb__195))))
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__196) -> (if (if ((dtb__196).f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((dtb__196).f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler = compiler) else false) then (match (((v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles dir) compiler) (dtb__196).f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmModules) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__197) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piSchema = (dtb__196).f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmSchema; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piCompiler = (dtb__196).f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmCompiler; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piPackage = (dtb__196).f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmPackage; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piEnv = (dtb__196).f_Vuna_dCompiler_dDriver_dIface_dPackageManifest_pmEnv; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules = dtb__197 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
