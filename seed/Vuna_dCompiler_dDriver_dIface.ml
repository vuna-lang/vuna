open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dIface_dSourceInfo = { f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath : string; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash : string; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime : int; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize : int }
and t_Vuna_dCompiler_dDriver_dIface_dModuleIface = { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName : string; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage : string; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource : t_Vuna_dCompiler_dDriver_dIface_dSourceInfo; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash : string; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash : string; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords : Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached : Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs : (string, (string, int) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dIface_dPackageIface = { f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piSchema : string; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piCompiler : string; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piPackage : string; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piEnv : int; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules : t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dIface_dCanonState = { f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext : int; f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap : (int, int) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dDriver_dIface_dOwnerIndex = { f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiDef : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiData : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiCtor : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dIface_dProgParts = { f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppSols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDatas : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDefs : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppGlobals : (string, (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppInsts : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppClasses : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap }

let v_Vuna_dCompiler_dDriver_dIface_dsiPathOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath)

let v_Vuna_dCompiler_dDriver_dIface_dsiHashOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash)

let v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime)

let v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf = (fun s -> (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize)

let v_Vuna_dCompiler_dDriver_dIface_dmiNameOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName)

let v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage)

let v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached)

let v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash)

let v_Vuna_dCompiler_dDriver_dIface_dmiImplHashOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash)

let v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes)

let v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource)

let v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports)

let v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports)

let v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports)

let v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities)

let v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls)

let v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords)

let v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared)

let v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs)

let v_Vuna_dCompiler_dDriver_dIface_ddefLocOf = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (dtb__0).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile; Base_dPair.f_Base_dPair_dPair_second = (dtb__0).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine } }))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dinsertByDefLoc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (match dtb__1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__3; Base_dPair.f_Base_dPair_dPair_second = dtb__4 } -> (if ((Base_dPair.v_Base_dPair_dfirstOf mc0) <= dtb__3) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__3; Base_dPair.f_Base_dPair_dPair_second = dtb__4 }, dtb__2)))) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__3; Base_dPair.f_Base_dPair_dPair_second = dtb__4 }, ((v_Vuna_dCompiler_dDriver_dIface_dinsertByDefLoc mc0) dtb__2))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_ddefLocsOfDefs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match (v_Vuna_dCompiler_dDriver_dIface_ddefLocOf dtb__5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dIface_ddefLocsOfDefs dtb__6)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> ((v_Vuna_dCompiler_dDriver_dIface_dinsertByDefLoc dtb__7) (v_Vuna_dCompiler_dDriver_dIface_ddefLocsOfDefs dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule = (fun modules entryDecls name -> ((fun others -> ((fun own -> ((fun auxDecls -> (if ((Base_dList.v_Base_dList_dlength modules) <= 1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith auxDecls) own) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__8) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__9) -> (match (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings (Base_dPair.v_Base_dPair_dsecondOf dtb__9)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__10) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__11) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) others)) entryDecls))) ((Base_dList.v_Base_dList_dconcatMap (fun m -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m) = name) then (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) else Base_dList.C_Base_dList_dList_Nil))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m) <> name))) modules)))

let v_Vuna_dCompiler_dDriver_dIface_dsetPrepared = (fun prepared mi -> { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = prepared; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs = (mi).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs })

let v_Vuna_dCompiler_dDriver_dIface_difaceSchema = "vuna-iface 26"

let v_Vuna_dCompiler_dDriver_dIface_difaceHashVersion = "vuna-iface-hash 7 (opaque/abstract bodies excluded)"

let v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey s))

let v_Vuna_dCompiler_dDriver_dIface_dshaText = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestHex (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestOfString s)))

let v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress s))

let v_Vuna_dCompiler_dDriver_dIface_dpartOf = (fun s -> (String.concat "" [(bi_strFromInt (bi_strLength s)); ":"; s]))

let v_Vuna_dCompiler_dDriver_dIface_ddigestParts = (fun ps -> (v_Vuna_dCompiler_dDriver_dIface_dshaText (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dpartOf) ps))))

let v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash = "missing"

let rec v_Vuna_dCompiler_dDriver_dIface_dinsertByText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = dtb__15 } -> (if (mc0 <= dtb__14) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = dtb__15 }, dtb__13)))) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = dtb__15 }, (((v_Vuna_dCompiler_dDriver_dIface_dinsertByText mc0) mc1) dtb__13))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dsortTextPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match dtb__16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__18; Base_dPair.f_Base_dPair_dPair_second = dtb__19 } -> (((v_Vuna_dCompiler_dDriver_dIface_dinsertByText dtb__18) dtb__19) (v_Vuna_dCompiler_dDriver_dIface_dsortTextPairs dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsortByText = (fun key xs -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (v_Vuna_dCompiler_dDriver_dIface_dsortTextPairs ((Base_dList.v_Base_dList_dmap (fun x -> { Base_dPair.f_Base_dPair_dPair_first = (key x); Base_dPair.f_Base_dPair_dPair_second = x })) xs))))

let v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty = { f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext = 0; f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil) }

let rec v_Vuna_dCompiler_dDriver_dIface_dcanonTerm = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__20, dtb__21, dtb__22) -> ((fun pc -> ((fun pt -> ((fun pe -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Base_dPair.v_Base_dPair_dfirstOf pc), (Base_dPair.v_Base_dPair_dfirstOf pt), (Base_dPair.v_Base_dPair_dfirstOf pe))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pe) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__22))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pc)) dtb__21))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__20))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__23, dtb__24) -> ((fun ps -> ((fun pa -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Base_dPair.v_Base_dPair_dfirstOf ps), (Base_dPair.v_Base_dPair_dfirstOf pa))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pa) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf ps)) dtb__24))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__23))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__25, dtb__26) -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__25, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__26))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__27, dtb__28) -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__27, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__28))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__29, dtb__30) -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__29, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs mc0) dtb__30))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__31, dtb__32, dtb__33) -> ((fun pf -> ((fun pa -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Base_dPair.v_Base_dPair_dfirstOf pf), (Base_dPair.v_Base_dPair_dfirstOf pa), dtb__33)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pa) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pf)) dtb__32))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__31))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__34, dtb__35, dtb__36) -> ((fun pb -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__34, dtb__35, (Base_dPair.v_Base_dPair_dfirstOf pb))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pb) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__36))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> ((fun pd -> ((fun pc -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__37, dtb__38, dtb__39, (Base_dPair.v_Base_dPair_dfirstOf pd), (Base_dPair.v_Base_dPair_dfirstOf pc))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pc) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm (Base_dPair.v_Base_dPair_dsecondOf pd)) dtb__41))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__40))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__42) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) dtb__42) (mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__43) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__43)); Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext = ((mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext + 1); f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__42) (mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csNext) (mc0).f_Vuna_dCompiler_dDriver_dIface_dCanonState_csMap) } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc0 }
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__44 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> ((fun pt -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf pt); Base_dPair.f_Base_dPair_dPair_second = dtb__47 }, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonArgs (Base_dPair.v_Base_dPair_dsecondOf pt)) dtb__45))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__46))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dIface_dcanonAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__48 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__50; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__51; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__52 } -> ((fun pb -> ((fun pr -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__50; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__51; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Base_dPair.v_Base_dPair_dfirstOf pb) }, (Base_dPair.v_Base_dPair_dfirstOf pr))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf pr) }) ((v_Vuna_dCompiler_dDriver_dIface_dcanonAlts (Base_dPair.v_Base_dPair_dsecondOf pb)) dtb__49))) ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm mc0) dtb__52))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop = (fun t -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Vuna_dCompiler_dDriver_dIface_dcanonTerm v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty) t)))

let v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop dtb__53)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddefView = (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)) } })

let v_Vuna_dCompiler_dDriver_dIface_dencDefView = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__54; Base_dPair.f_Base_dPair_dPair_second = dtb__55 } -> (match dtb__55 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__56; Base_dPair.f_Base_dPair_dPair_second = dtb__57 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__54) ((Vuna_dCompiler_dCanonical_dCoreTerm.v_Vuna_dCompiler_dCanonical_dCoreTerm_dencTerm dtb__56) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe Vuna_dCompiler_dCanonical_dCoreTerm.v_Vuna_dCompiler_dCanonical_dCoreTerm_dencTerm) dtb__57) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dhashDefView = (fun names d -> ((fun name -> ((fun body -> { Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe body) } }) (if ((Base_dList.v_Base_dList_dmemName name) names) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))

let v_Vuna_dCompiler_dDriver_dIface_dhashDefs = (fun names ds -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDriver_dIface_dencDefView)) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dIface_dhashDefView names)) ds)))))

let v_Vuna_dCompiler_dDriver_dIface_dhashOpaque = (fun names -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr)) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText (fun n -> n)) names))))

let v_Vuna_dCompiler_dDriver_dIface_dhashDatas = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencDtData)) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText (fun d -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) ds))))

let v_Vuna_dCompiler_dDriver_dIface_dhashInsts = (fun is -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencDtInstSem)) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText (fun i -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i))) is))))

let v_Vuna_dCompiler_dDriver_dIface_dhashClasses = (fun cs -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencDtClassSem)) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText (fun c -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c))) cs))))

let v_Vuna_dCompiler_dDriver_dIface_dencGlobal = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__58; Base_dPair.f_Base_dPair_dPair_second = dtb__59 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__58) ((Vuna_dCompiler_dCanonical_dCoreTerm.v_Vuna_dCompiler_dCanonical_dCoreTerm_dencTerm dtb__59) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dhashGlobals = (fun gs -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDriver_dIface_dencGlobal)) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) gs))))

let v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf = (fun e -> (String.concat "" [(e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent]))

let v_Vuna_dCompiler_dDriver_dIface_dhashExports = (fun es -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencExportEntry)) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf) es))))

let v_Vuna_dCompiler_dDriver_dIface_dhashFixities = (fun fs -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencFixity)) fs)))

let v_Vuna_dCompiler_dDriver_dIface_dhashRecords = (fun recs -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencRecordMeta)) recs)))

let v_Vuna_dCompiler_dDriver_dIface_dhashImports = (fun is -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencImport)) is)))

let v_Vuna_dCompiler_dDriver_dIface_dhashDecls = (fun ds -> (v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_dencDecls) ds)))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfParts = (fun name pkg imports implicitImports fixities records exports decls cp -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dIface_difaceHashVersion, (Base_dList.C_Base_dList_dList_Cons (name, (Base_dList.C_Base_dList_dList_Cons (pkg, (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashImports imports), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashImports implicitImports), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashFixities fixities), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashRecords records), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashDecls decls), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashDatas (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dIface_dhashDefs ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf cp))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashGlobals (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashInsts (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashClasses (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashExports exports), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashOpaque (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf cp)), Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfIface = (fun m -> (((((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf m)) (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m)))

let v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piSchema = dtb__60; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piCompiler = dtb__61; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piPackage = dtb__62; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piEnv = dtb__63; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules = dtb__64 } -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts (Base_dList.C_Base_dList_dList_Cons ("vuna-pkg-iface-hash 1", (Base_dList.C_Base_dList_dList_Cons (dtb__62, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__64)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpkgImplHashOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piSchema = dtb__65; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piCompiler = dtb__66; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piPackage = dtb__67; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piEnv = dtb__68; f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules = dtb__69 } -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts (Base_dList.C_Base_dList_dList_Cons ("vuna-pkg-impl-hash 1", (Base_dList.C_Base_dList_dList_Cons (dtb__67, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dmiImplHashOf) ((v_Vuna_dCompiler_dDriver_dIface_dsortByText v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__69)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimplHashOfParts = (fun name pkg records exports decls cp -> (v_Vuna_dCompiler_dDriver_dIface_ddigestParts (Base_dList.C_Base_dList_dList_Cons ("vuna-impl-hash 1", (Base_dList.C_Base_dList_dList_Cons (name, (Base_dList.C_Base_dList_dList_Cons (pkg, (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashRecords records), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashExports exports), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashDecls decls), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashDatas (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dIface_dhashDefs Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashGlobals (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashInsts (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp)), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dhashClasses (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp)), Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dtblOwner = (fun t name -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) t))

let v_Vuna_dCompiler_dDriver_dIface_dprefixOwner = (fun knownModules name -> ((fun prefix -> (if ((Base_dList.v_Base_dList_dmemName prefix) knownModules) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (prefix)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)))

let v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiDef) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiData) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((v_Vuna_dCompiler_dDriver_dIface_dprefixOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown) name) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__72) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__72))) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs dtb__73))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_dtblOwner (oi).f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiCtor) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74) -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) dtb__74)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difacePreludeNames = ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinternalIntrinsicNames)

let v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf = (fun oi name -> (if ((Base_dList.v_Base_dList_dmemName name) v_Vuna_dCompiler_dDriver_dIface_difacePreludeNames) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dIface_downerIndexOf = (fun meta datas -> { f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiDef = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDefOwners); f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiData = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smDataOwners); f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiCtor = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs datas)); f_Vuna_dCompiler_dDriver_dIface_dOwnerIndex_oiKnown = (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules })

let v_Vuna_dCompiler_dDriver_dIface_dbucketOf = (fun name tbl -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> dtb__77
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (match (mc0 dtb__78) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__79) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__80) -> (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo mc0) dtb__79) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__80) (Base_dList.C_Base_dList_dList_Cons (dtb__78, ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf dtb__80) mc2)))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBucket = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__81; Base_dPair.f_Base_dPair_dPair_second = dtb__82 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__81; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse dtb__82) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets = (fun tbl -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dreverseBucket) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) tbl))))

let v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner = (fun ownerOf xs -> (v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets (((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo ownerOf) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf = (fun oi prog -> { f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppSols = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDatas = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDefs = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun d -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppGlobals = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun p -> ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) (Base_dPair.v_Base_dPair_dfirstOf p)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppInsts = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun i -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)); f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppClasses = ((v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner (fun c -> ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)) })

let v_Vuna_dCompiler_dDriver_dIface_dcpOfModule = (fun parts prog mod_ opaqueNames -> ((fun datas -> ((fun defs -> ((fun globals -> ((fun insts -> ((fun classes -> ((fun slice -> ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dwithCachedOpaque opaqueNames) ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppSols) slice))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = datas; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = defs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = globals; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = insts; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = classes; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = 0; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = Base_dList.C_Base_dList_dList_Nil })) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppClasses))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppInsts))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppGlobals))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDefs))) ((v_Vuna_dCompiler_dDriver_dIface_dbucketOf mod_) (parts).f_Vuna_dCompiler_dDriver_dIface_dProgParts_ppDatas)))

let rec v_Vuna_dCompiler_dDriver_dIface_dsourceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__83 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__85; Base_dPair.f_Base_dPair_dPair_second = dtb__86 } -> (if (dtb__85 = mc1) then dtb__86 else ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf dtb__84) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = ""; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = ""; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = 0; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = 0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dimportNameOf = (fun _uarity0 -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName _uarity0))

let v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dIface_dimportNameOf) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf)))

let rec v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (match dtb__87 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__89; Base_dPair.f_Base_dPair_dPair_second = dtb__90 } -> (if (dtb__90 = v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash) then true else (v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep dtb__88))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName = (fun tbl name -> (match ((Base_dList.v_Base_dList_dlookupPair name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91) -> dtb__91
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf = (fun tbl m -> ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName tbl) n) })) (v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule m)))

let rec v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__92) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92)) else ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf dtb__93) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase = (fun pkg parts prog sources clean m -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> dtb__94
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun name -> ((fun cp -> ((fun records -> ((fun h -> ((fun hi -> { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = name; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = pkg; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = ((v_Vuna_dCompiler_dDriver_dIface_dsourceOf sources) name); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = h; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash = hi; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = records; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = cp; f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs = (v_Vuna_dCompiler_dDriver_dIface_ddefLocsOfDefs (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp)) }) ((((((v_Vuna_dCompiler_dDriver_dIface_dimplHashOfParts name) pkg) records) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf) cp))) (((((((((v_Vuna_dCompiler_dDriver_dIface_dhashOfParts name) pkg) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf) records) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf) cp))) (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf))) ((((v_Vuna_dCompiler_dDriver_dIface_dcpOfModule parts) prog) name) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleOpaqueOf m)))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dfinishIface = (fun tbl clean m mi -> (match ((v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf clean) (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> dtb__95
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = (v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash = (v_Vuna_dCompiler_dDriver_dIface_dmiImplHashOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = ((v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf tbl) m); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = (v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf mi); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs = (v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf mi) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difacesGo = (fun pkg parts prog sources knownDeps clean modules -> ((fun built -> ((fun hashes -> ((fun fullTbl -> { Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dmap (fun p -> ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface fullTbl) clean) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)))) built); Base_dPair.f_Base_dPair_dPair_second = fullTbl }) ((Base_dList.v_Base_dList_dappend knownDeps) hashes))) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf (Base_dPair.v_Base_dPair_dsecondOf p)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf (Base_dPair.v_Base_dPair_dsecondOf p)) })) built))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) sources) clean) m) })) modules)))

let v_Vuna_dCompiler_dDriver_dIface_downerOfAny = (fun oi name -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf = (fun oi ourNames inherited merged prelude name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) prelude) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) inherited) then "" else (match ((v_Vuna_dCompiler_dDriver_dIface_downerOfAny oi) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> (if (dtb__98 = Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) then "" else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__98) ourNames) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) merged) then "" else (String.concat "" ["missing-from-iface "; name; " -> "; dtb__98])) else ""))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("unowned " ^ name)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> ((fun issue -> (if (issue = "") then ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo mc0) mc1) mc2) mc3) mc4) dtb__100) else issue)) ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf mc0) mc1) mc2) mc3) mc4) dtb__99))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf = (fun prog -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)))))))

let v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf = (fun cp -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)))

let v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf = (fun cp -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp)))

let v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf = (fun m -> ((fun cp -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf cp)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf cp)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp)))))))) (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m)))

let v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames = (fun ifaces -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf) ifaces))

let v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue = (fun oi ourNames inherited ifaces prog -> ((fun merged -> ((fun mergedTbl -> ((fun ourTbl -> ((fun inhTbl -> ((fun preludeTbl -> ((fun issue -> (if (issue = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (issue)))) ((((((v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo oi) ourTbl) inhTbl) mergedTbl) preludeTbl) (v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf prog)))) (Base_dHashMap.v_Base_dHashMap_dofNames v_Vuna_dCompiler_dDriver_dIface_difacePreludeNames))) (Base_dHashMap.v_Base_dHashMap_dofNames inherited))) (Base_dHashMap.v_Base_dHashMap_dofNames ourNames))) (Base_dHashMap.v_Base_dHashMap_dofNames merged))) (v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames ifaces)))

let v_Vuna_dCompiler_dDriver_dIface_dcoverageResult = (fun oi ourNames inherited ifaces prog -> (match (((((v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue oi) ourNames) inherited) ifaces) prog) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__101) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("iface: " ^ dtb__101))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ifaces))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage = (fun pkg sources knownDeps inherited clean modules entryDecls prog -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match (((((((v_Vuna_dCompiler_dDriver_dIface_difacesGo pkg) parts) prog) sources) knownDeps) clean) ourModules) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__103 } -> (((((v_Vuna_dCompiler_dDriver_dIface_dcoverageResult oi) ourNames) inherited) dtb__102) prog)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__104) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104)) else ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule dtb__105) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dsameOwner = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (dtb__106 = mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_downedByModule = (fun oi name artifact -> ((v_Vuna_dCompiler_dDriver_dIface_dsameOwner name) ((v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf oi) artifact)))

let rec v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> ((fun skip -> (if skip then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__108) mc4) else (if ((Base_dList.v_Base_dList_dmemName dtb__107) mc4) then (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent mc0) mc1) mc2) dtb__108) mc4) else false))) (if ((Base_dList.v_Base_dList_dmemName dtb__107) mc1) then true else (Base_dBool.v_Base_dBool_dnot (((v_Vuna_dCompiler_dDriver_dIface_downedByModule mc0) mc2) dtb__107))))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk = (fun oi inherited name prog mi -> ((fun present -> (((((v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent oi) inherited) name) (v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf prog)) present)) (v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf mi)))

let v_Vuna_dCompiler_dDriver_dIface_difaceOfModule = (fun pkg si knownDeps inherited clean modules entryDecls prog name -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match ((v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule ourModules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["iface: module "; name; " is not part of the checked package"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> ((fun mi0 -> ((fun tbl -> ((fun mi -> ((fun miP -> (if (((((v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk oi) inherited) name) prog) miP) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (miP)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["iface: module "; name; " has uncovered artifacts"])))) (match (((v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule ourModules) entryDecls) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mi
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> ((v_Vuna_dCompiler_dDriver_dIface_dsetPrepared dtb__110) mi)
  | _ -> failwith "DT: impossible branch"
))) ((((v_Vuna_dCompiler_dDriver_dIface_dfinishIface tbl) Base_dList.C_Base_dList_dList_Nil) dtb__109) mi0))) ((Base_dList.v_Base_dList_dappend knownDeps) ((Base_dList.v_Base_dList_dmap (fun x -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dIface_dmiNameOf x); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf x) })) ((Base_dList.v_Base_dList_dappend clean) (Base_dList.C_Base_dList_dList_Cons (mi0, Base_dList.C_Base_dList_dList_Nil))))))) ((((((v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase pkg) parts) prog) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = si }, Base_dList.C_Base_dList_dList_Nil))) Base_dList.C_Base_dList_dList_Nil) dtb__109))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ourModules))) ((v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf oi) prog))) ((v_Vuna_dCompiler_dDriver_dIface_downerIndexOf meta) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf declModules) entryDecls))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) modules))))

let rec v_Vuna_dCompiler_dDriver_dIface_dallValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__111)) then (v_Vuna_dCompiler_dDriver_dIface_dallValid dtb__112) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid = (fun pi -> (if (if ((pi).f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piSchema = v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Base_dList.v_Base_dList_dlength (pi).f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules) > 0) else false) then (v_Vuna_dCompiler_dDriver_dIface_dallValid (pi).f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules) else false))

let rec v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__113), (v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf dtb__114)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_difaceCodec = "module-iface 4"

let v_Vuna_dCompiler_dDriver_dIface_dencSourceInfo = (fun s acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt (s).f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize) acc)))))

let v_Vuna_dCompiler_dDriver_dIface_ddecSourceInfo = (fun fuel c -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun path b1 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun hash b2 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b2)) (fun mtime b3 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b3)) (fun size b4 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = path; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = hash; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size }; Base_dPair.f_Base_dPair_dPair_second = b4 })))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dencDepPair = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__115; Base_dPair.f_Base_dPair_dPair_second = dtb__116 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__115) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__116) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddecDepPair = (fun fuel c -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun n b1 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun h b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = h }; Base_dPair.f_Base_dPair_dPair_second = b2 })))))))

let v_Vuna_dCompiler_dDriver_dIface_dencDefLoc = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__117; Base_dPair.f_Base_dPair_dPair_second = dtb__118 } -> (match dtb__118 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__120 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__117) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__119) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencInt dtb__120) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dIface_ddecDefLoc = (fun fuel c -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun name b1 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) b1)) (fun file b2 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecInt (fuel - 1)) b2)) (fun line b3 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = file; Base_dPair.f_Base_dPair_dPair_second = line } }; Base_dPair.f_Base_dPair_dPair_second = b3 })))))))))

let v_Vuna_dCompiler_dDriver_dIface_dencModuleIfacePayload = (fun m acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage) ((v_Vuna_dCompiler_dDriver_dIface_dencSourceInfo (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDriver_dIface_dencDepPair) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencImport) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencImport) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencExportEntry) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencFixity) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_dencDecl) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencRecordMeta) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_dencDecl) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared) ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dencCachedProgram (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDriver_dIface_dencDefLoc) (m).f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs) acc))))))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_dencModuleIfaceAt = (fun _uarity0 _uarity1 -> ((v_Vuna_dCompiler_dDriver_dIface_dencModuleIfacePayload _uarity0) _uarity1))

let v_Vuna_dCompiler_dDriver_dIface_dencModuleIface = (fun m -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop v_Vuna_dCompiler_dDriver_dIface_dencModuleIfacePayload) m))

let v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfacePayload = (fun fuel c -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun p1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p1))) (fun p2 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((v_Vuna_dCompiler_dDriver_dIface_ddecSourceInfo (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p2))) (fun p3 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p3))) (fun p4 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p4))) (fun p5 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDriver_dIface_ddecDepPair) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p5))) (fun p6 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecImport) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p6))) (fun p7 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecImport) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p7))) (fun p8 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecExportEntry) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p8))) (fun p9 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecFixity) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p9))) (fun p10 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_ddecDecl) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p10))) (fun p11 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecRecordMeta) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p11))) (fun p12 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_ddecDecl) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p12))) (fun p13 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgram (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p13))) (fun p14 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDriver_dIface_ddecDefLoc) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p14))) (fun p15 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dMaybe.v_Applicative_uBase_uMaybe_uMaybe) { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (Base_dPair.v_Base_dPair_dfirstOf p1); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (Base_dPair.v_Base_dPair_dfirstOf p2); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = (Base_dPair.v_Base_dPair_dfirstOf p3); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (Base_dPair.v_Base_dPair_dfirstOf p4); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash = (Base_dPair.v_Base_dPair_dfirstOf p5); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = (Base_dPair.v_Base_dPair_dfirstOf p6); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (Base_dPair.v_Base_dPair_dfirstOf p7); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (Base_dPair.v_Base_dPair_dfirstOf p8); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (Base_dPair.v_Base_dPair_dfirstOf p9); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (Base_dPair.v_Base_dPair_dfirstOf p10); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (Base_dPair.v_Base_dPair_dfirstOf p11); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (Base_dPair.v_Base_dPair_dfirstOf p12); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = (Base_dPair.v_Base_dPair_dfirstOf p13); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (Base_dPair.v_Base_dPair_dfirstOf p14); f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs = (Base_dPair.v_Base_dPair_dfirstOf p15) }; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p15) }))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceAt = (fun _uarity0 _uarity1 -> ((v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfacePayload _uarity0) _uarity1))

let v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__121) -> (match dtb__121 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__122; Base_dPair.f_Base_dPair_dPair_second = dtb__123 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__123) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfacePayload (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))
