open Vuna_runtime
type t_SourceInfo = { f_SourceInfo_siPath : string; f_SourceInfo_siHash : string; f_SourceInfo_siMtime : int; f_SourceInfo_siSize : int }
and t_ModuleIface = { f_ModuleIface_miName : string; f_ModuleIface_miPackage : string; f_ModuleIface_miSource : t_SourceInfo; f_ModuleIface_miIfaceHash : string; f_ModuleIface_miImplHash : string; f_ModuleIface_miDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ModuleIface_miImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_ModuleIface_miImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_ModuleIface_miExports : Loader_dModules.t_ExportEntry B_dData_dList.t_List; f_ModuleIface_miFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_ModuleIface_miDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_ModuleIface_miRecords : Elab_dRecords.t_RecordMeta B_dData_dList.t_List; f_ModuleIface_miPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_ModuleIface_miCached : Driver_dCache.t_CachedProgram; f_ModuleIface_miDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_CanonState = { f_CanonState_csNext : int; f_CanonState_csMap : (int, int) B_dContainer_dHashMap.t_HashMap }
and t_OwnerIndex = { f_OwnerIndex_oiDef : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiData : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiCtor : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiKnown : string B_dData_dList.t_List }
and t_ProgParts = { f_ProgParts_ppSols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppDatas : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppDefs : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppGlobals : (string, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppInsts : (string, Elab_dTypes.t_DtInst B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppClasses : (string, Elab_dTypes.t_DtClass B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap }

# 101 "Vuna/Compiler/Driver/Iface.vuna"
let v_siPathOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siPath)

# 104 "Vuna/Compiler/Driver/Iface.vuna"
let v_siHashOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siHash)

# 107 "Vuna/Compiler/Driver/Iface.vuna"
let v_siMtimeOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siMtime)

# 110 "Vuna/Compiler/Driver/Iface.vuna"
let v_siSizeOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siSize)

# 113 "Vuna/Compiler/Driver/Iface.vuna"
let v_miNameOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miName)

# 116 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPackageOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miPackage)

# 119 "Vuna/Compiler/Driver/Iface.vuna"
let v_miCachedOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miCached)

# 122 "Vuna/Compiler/Driver/Iface.vuna"
let v_miIfaceHashOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miIfaceHash)

# 125 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImplHashOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miImplHash)

# 128 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDepHashesOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miDepHashes)

# 131 "Vuna/Compiler/Driver/Iface.vuna"
let v_miSourceOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miSource)

# 134 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImportsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miImports)

# 137 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImplicitImportsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miImplicitImports)

# 140 "Vuna/Compiler/Driver/Iface.vuna"
let v_miExportsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miExports)

# 143 "Vuna/Compiler/Driver/Iface.vuna"
let v_miFixitiesOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miFixities)

# 146 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDeclsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miDecls)

# 150 "Vuna/Compiler/Driver/Iface.vuna"
let v_miRecordsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miRecords)

# 153 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPreparedOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miPrepared)

# 158 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDefLocsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miDefLocs)

# 161 "Vuna/Compiler/Driver/Iface.vuna"
let v_defLocOf = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__0).Base_dSource.f_Span_spanFile; B_dData_dPair.f_Pair_second = (dtb__0).Base_dSource.f_Span_spanStartLine } }))
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Driver/Iface.vuna"
let v_defLocsOfDefs = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (a : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (b : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) ((B_dData_dList.v_mapMaybe v_defLocOf) ds)))

# 176 "Vuna/Compiler/Driver/Iface.vuna"
let v_preparedForModule = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (name : string) -> ((fun others -> ((fun own -> ((fun auxDecls -> (if ((B_dData_dList.v_length modules) <= 1) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dRecords.v_prepareDeclsWith (Frontend_dRast_dBridge.v_toRastDecls auxDecls)) (Frontend_dRast_dBridge.v_toRastDecls own)) with
  | Base_dDiag.C_Check_ErrC (dtb__1) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__2) -> (match (Elab_dDerive.v_expandDerivings (B_dData_dPair.v_secondOf dtb__2)) with
  | Base_dDiag.C_Check_ErrC (dtb__3) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__4) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dRast_dBridge.v_toAstDecls dtb__4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) others)) entryDecls))) ((B_dData_dList.v_concatMap (fun (m : Loader_dModules.t_Module) -> (if ((Loader_dModules.v_moduleNameOf m) = name) then (Loader_dModules.v_moduleDeclsOf m) else B_dData_dList.C_List_Nil))) modules))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_moduleNameOf m) <> name))) modules)))

# 192 "Vuna/Compiler/Driver/Iface.vuna"
let v_setPrepared = (fun (prepared : Frontend_dAst.t_Decl B_dData_dList.t_List) (mi : t_ModuleIface) -> { f_ModuleIface_miName = (mi).f_ModuleIface_miName; f_ModuleIface_miPackage = (mi).f_ModuleIface_miPackage; f_ModuleIface_miSource = (mi).f_ModuleIface_miSource; f_ModuleIface_miIfaceHash = (mi).f_ModuleIface_miIfaceHash; f_ModuleIface_miImplHash = (mi).f_ModuleIface_miImplHash; f_ModuleIface_miDepHashes = (mi).f_ModuleIface_miDepHashes; f_ModuleIface_miImports = (mi).f_ModuleIface_miImports; f_ModuleIface_miImplicitImports = (mi).f_ModuleIface_miImplicitImports; f_ModuleIface_miExports = (mi).f_ModuleIface_miExports; f_ModuleIface_miFixities = (mi).f_ModuleIface_miFixities; f_ModuleIface_miDecls = (mi).f_ModuleIface_miDecls; f_ModuleIface_miRecords = (mi).f_ModuleIface_miRecords; f_ModuleIface_miPrepared = prepared; f_ModuleIface_miCached = (mi).f_ModuleIface_miCached; f_ModuleIface_miDefLocs = (mi).f_ModuleIface_miDefLocs })

# 212 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceSchema = "vuna-iface 30"

# 217 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceHashVersion = "vuna-iface-hash 10 (opaque/abstract bodies excluded)"

# 227 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashTextStrong = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 231 "Vuna/Compiler/Driver/Iface.vuna"
let v_shaText = (fun (s : string) -> (Base_dHash.v_digestHex (Base_dHash.v_digestOfString s)))

# 236 "Vuna/Compiler/Driver/Iface.vuna"
let v_payloadDigest = (fun (s : string) -> (Base_dHash.v_contentAddress s))

# 240 "Vuna/Compiler/Driver/Iface.vuna"
let v_partOf = (fun (s : string) -> (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (bi_strLength s)), (B_dData_dList.C_List__x58__x58_ (":", (B_dData_dList.C_List__x58__x58_ (s, B_dData_dList.C_List_Nil)))))))

# 247 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_flatParts = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> ((B_dData_dList.v_append (v_partOf dtb__5)) (v_flatParts dtb__6))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Driver/Iface.vuna"
let v_digestParts = (fun (ps : string B_dData_dList.t_List) -> (v_shaText (B_dData_dList.dtp_concatMany (v_flatParts ps))))

# 252 "Vuna/Compiler/Driver/Iface.vuna"
let v_depMissingHash = "missing"

# 259 "Vuna/Compiler/Driver/Iface.vuna"
let v_sortTextPairs = (fun ps -> ((B_dData_dSort.v_sortBy (fun a b -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) ps))

# 262 "Vuna/Compiler/Driver/Iface.vuna"
let v_sortByText = (fun key xs -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (v_sortTextPairs ((B_dData_dList.v_map (fun x -> { B_dData_dPair.f_Pair_first = (key x); B_dData_dPair.f_Pair_second = x })) xs))))

# 272 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonStateEmpty = { f_CanonState_csNext = 0; f_CanonState_csMap = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil) }

# 275 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_canonTerm = (fun (mc0 : t_CanonState) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__7, dtb__8, dtb__9) -> ((fun pc -> ((fun pt -> ((fun pe -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((B_dData_dPair.v_firstOf pc), (B_dData_dPair.v_firstOf pt), (B_dData_dPair.v_firstOf pe))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pe) }) ((v_canonTerm (B_dData_dPair.v_secondOf pt)) dtb__9))) ((v_canonTerm (B_dData_dPair.v_secondOf pc)) dtb__8))) ((v_canonTerm mc0) dtb__7))
  | Core_dTerm.C_Term_TCase (dtb__10, dtb__11) -> ((fun ps -> ((fun pa -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase ((B_dData_dPair.v_firstOf ps), (B_dData_dPair.v_firstOf pa))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pa) }) ((v_canonAlts (B_dData_dPair.v_secondOf ps)) dtb__11))) ((v_canonTerm mc0) dtb__10))
  | Core_dTerm.C_Term_TRecord (dtb__12, dtb__13) -> ((fun pr -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecord (dtb__12, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) }) ((v_canonArgs mc0) dtb__13))
  | Core_dTerm.C_Term_TMk (dtb__14, dtb__15) -> ((fun pr -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMk (dtb__14, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) }) ((v_canonArgs mc0) dtb__15))
  | Core_dTerm.C_Term_TCon (dtb__16, dtb__17) -> ((fun pr -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCon (dtb__16, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) }) ((v_canonArgs mc0) dtb__17))
  | Core_dTerm.C_Term_TApp (dtb__18, dtb__19, dtb__20) -> ((fun pf -> ((fun pa -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((B_dData_dPair.v_firstOf pf), (B_dData_dPair.v_firstOf pa), dtb__20)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pa) }) ((v_canonTerm (B_dData_dPair.v_secondOf pf)) dtb__19))) ((v_canonTerm mc0) dtb__18))
  | Core_dTerm.C_Term_TLam (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> ((fun pb -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__21, dtb__22, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (B_dData_dPair.v_firstOf pb))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pb) }) ((v_canonTerm mc0) dtb__25))
  | Core_dTerm.C_Term_TPi (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> ((fun pd -> ((fun pc -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (dtb__26, dtb__27, dtb__28, (B_dData_dPair.v_firstOf pd), (B_dData_dPair.v_firstOf pc))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pc) }) ((v_canonTerm (B_dData_dPair.v_secondOf pd)) dtb__30))) ((v_canonTerm mc0) dtb__29))
  | Core_dTerm.C_Term_TMeta (dtb__31) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) dtb__31) (mc0).f_CanonState_csMap) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb__32)); B_dData_dPair.f_Pair_second = mc0 }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta ((mc0).f_CanonState_csNext)); B_dData_dPair.f_Pair_second = { f_CanonState_csNext = ((mc0).f_CanonState_csNext + 1); f_CanonState_csMap = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) dtb__31) (mc0).f_CanonState_csNext) (mc0).f_CanonState_csMap) } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 }
))
# 320 "Vuna/Compiler/Driver/Iface.vuna"
and v_canonArgs = (fun (mc0 : t_CanonState) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match dtb__33 with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> ((fun pt -> ((fun pr -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf pt); B_dData_dPair.f_Pair_second = dtb__36 }, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) }) ((v_canonArgs (B_dData_dPair.v_secondOf pt)) dtb__34))) ((v_canonTerm mc0) dtb__35))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))
# 328 "Vuna/Compiler/Driver/Iface.vuna"
and v_canonAlts = (fun (mc0 : t_CanonState) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (match dtb__37 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__39; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__40; Core_dTerm.f_CaseAlt_caseAltBody = dtb__41 } -> ((fun pb -> ((fun pr -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__39; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__40; Core_dTerm.f_CaseAlt_caseAltBody = (B_dData_dPair.v_firstOf pb) }, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) }) ((v_canonAlts (B_dData_dPair.v_secondOf pb)) dtb__38))) ((v_canonTerm mc0) dtb__41))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonTermTop = (fun (t : Core_dTerm.t_Term) -> (B_dData_dPair.v_firstOf ((v_canonTerm v_canonStateEmpty) t)))

# 339 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (B_dData_dMaybe.C_Maybe_Just ((v_canonTermTop dtb__42)))
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Driver/Iface.vuna"
let v_defView = (fun (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_canonTermTop (Elab_dTypes.v_dtDefType d)); B_dData_dPair.f_Pair_second = (v_canonMaybe (Elab_dTypes.v_dtDefBody d)) } })

# 353 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDefView = (fun (mc0 : (string, (Core_dTerm.t_Term, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__43; B_dData_dPair.f_Pair_second = dtb__44 } -> (match dtb__44 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> ((Base_dBytes.v_encStr dtb__43) ((Core_dCanonical.v_encTerm dtb__45) (((Base_dBytes.v_encMaybe Core_dCanonical.v_encTerm) dtb__46) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDefView = (fun (names : string B_dData_dList.t_List) (d : Elab_dTypes.t_DtDef) -> ((fun name -> ((fun body -> { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_canonTermTop (Elab_dTypes.v_dtDefType d)); B_dData_dPair.f_Pair_second = (v_canonMaybe body) } }) (if ((B_dData_dList.v_memName name) names) then B_dData_dMaybe.C_Maybe_Nothing else (Elab_dTypes.v_dtDefBody d)))) (Elab_dTypes.v_dtDefName d)))

# 363 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDefs = (fun (names : string B_dData_dList.t_List) (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList v_encDefView)) ((v_sortByText (fun (p : (string, (Core_dTerm.t_Term, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) ((B_dData_dList.v_map (v_hashDefView names)) ds)))))

# 368 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOpaque = (fun (names : string B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) ((v_sortByText (fun (n : string) -> n)) names))))

# 372 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDatas = (fun (ds : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtData)) ((v_sortByText (fun (d : Elab_dTypes.t_DtData) -> (Elab_dTypes.v_dtDataName d))) ds))))

# 375 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashInsts = (fun (is : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtInstSem)) ((v_sortByText (fun (i : Elab_dTypes.t_DtInst) -> (Elab_dTypes.v_dtInstName i))) is))))

# 378 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashClasses = (fun (cs : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtClassSem)) ((v_sortByText (fun (c : Elab_dTypes.t_DtClass) -> (Elab_dTypes.v_dtClassName c))) cs))))

# 383 "Vuna/Compiler/Driver/Iface.vuna"
let v_encGlobal = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 } -> ((Base_dBytes.v_encStr dtb__47) ((Core_dCanonical.v_encTerm dtb__48) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashGlobals = (fun (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList v_encGlobal)) ((v_sortByText (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) gs))))

# 390 "Vuna/Compiler/Driver/Iface.vuna"
let v_exportKeyOf = (fun (e : Loader_dModules.t_ExportEntry) -> (String.concat "" [(e).Loader_dModules.f_ExportEntry_public; "|"; (e).Loader_dModules.f_ExportEntry_kind; "|"; (e).Loader_dModules.f_ExportEntry_target; "|"; (e).Loader_dModules.f_ExportEntry_parent]))

# 393 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashExports = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encExportEntry)) ((v_sortByText v_exportKeyOf) es))))

# 397 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashFixities = (fun (fs : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encFixity)) fs)))

# 401 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashRecords = (fun (recs : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encRecordMeta)) recs)))

# 405 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashImports = (fun (is : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encImport)) is)))

# 411 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDecls = (fun (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encDecls) ds)))

# 416 "Vuna/Compiler/Driver/Iface.vuna"
let v_stripOpaqueDeclBodies = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DFun (dtb__49, dtb__50, dtb__51, dtb__52) -> (if ((B_dData_dList.v_memName dtb__49) mc0) then (Frontend_dAst.C_Decl_DFun (dtb__49, dtb__50, (Frontend_dAst.C_Expr_EVar ("@opaque@", dtb__52)), dtb__52)) else (Frontend_dAst.C_Decl_DFun (dtb__49, dtb__50, dtb__51, dtb__52)))
  | _ -> mc1
))

# 421 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDeclsForIface = (fun (names : string B_dData_dList.t_List) (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_hashDecls ((B_dData_dList.v_map (v_stripOpaqueDeclBodies names)) ds)))

# 424 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOfParts = (fun (name : string) (pkg : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (implicitImports : Frontend_dAst.t_Import B_dData_dList.t_List) (fixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (exports : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (cp : Driver_dCache.t_CachedProgram) -> ((fun opaqueNames -> (v_digestParts (B_dData_dList.C_List__x58__x58_ (v_ifaceHashVersion, (B_dData_dList.C_List__x58__x58_ (name, (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ ((v_hashImports imports), (B_dData_dList.C_List__x58__x58_ ((v_hashImports implicitImports), (B_dData_dList.C_List__x58__x58_ ((v_hashFixities fixities), (B_dData_dList.C_List__x58__x58_ ((v_hashRecords records), (B_dData_dList.C_List__x58__x58_ (((v_hashDeclsForIface opaqueNames) decls), (B_dData_dList.C_List__x58__x58_ ((v_hashDatas (Driver_dCache.v_cachedDatas cp)), (B_dData_dList.C_List__x58__x58_ (((v_hashDefs opaqueNames) (Driver_dCache.v_cachedDefs cp)), (B_dData_dList.C_List__x58__x58_ ((v_hashGlobals (Driver_dCache.v_cachedGlobals cp)), (B_dData_dList.C_List__x58__x58_ ((v_hashInsts (Driver_dCache.v_cachedInsts cp)), (B_dData_dList.C_List__x58__x58_ ((v_hashClasses (Driver_dCache.v_cachedClasses cp)), (B_dData_dList.C_List__x58__x58_ ((v_hashExports exports), (B_dData_dList.C_List__x58__x58_ ((v_hashOpaque (Driver_dCache.v_cachedOpaqueOf cp)), B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))) ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) (Driver_dCache.v_cachedOpaqueOf cp))))

# 431 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOfIface = (fun (m : t_ModuleIface) -> (((((((((v_hashOfParts (v_miNameOf m)) (v_miPackageOf m)) (v_miImportsOf m)) (v_miImplicitImportsOf m)) (v_miFixitiesOf m)) (v_miRecordsOf m)) (v_miExportsOf m)) (v_miDeclsOf m)) (v_miCachedOf m)))

# 446 "Vuna/Compiler/Driver/Iface.vuna"
let v_pkgIfaceHashOfModules = (fun (pkg : string) (mods : t_ModuleIface B_dData_dList.t_List) -> (v_digestParts (B_dData_dList.C_List__x58__x58_ ("vuna-pkg-iface-hash 1", (B_dData_dList.C_List__x58__x58_ (pkg, ((B_dData_dList.v_map v_miIfaceHashOf) ((v_sortByText v_miNameOf) mods))))))))

# 450 "Vuna/Compiler/Driver/Iface.vuna"
let v_pkgImplHashOfModules = (fun (pkg : string) (mods : t_ModuleIface B_dData_dList.t_List) -> (v_digestParts (B_dData_dList.C_List__x58__x58_ ("vuna-pkg-impl-hash 1", (B_dData_dList.C_List__x58__x58_ (pkg, ((B_dData_dList.v_map v_miImplHashOf) ((v_sortByText v_miNameOf) mods))))))))

# 455 "Vuna/Compiler/Driver/Iface.vuna"
let v_sortModuleIfaces = (fun (mods : t_ModuleIface B_dData_dList.t_List) -> ((v_sortByText v_miNameOf) mods))

# 459 "Vuna/Compiler/Driver/Iface.vuna"
let v_implHashOfParts = (fun (name : string) (pkg : string) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (exports : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (cp : Driver_dCache.t_CachedProgram) -> (v_digestParts (B_dData_dList.C_List__x58__x58_ ("vuna-impl-hash 1", (B_dData_dList.C_List__x58__x58_ (name, (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ ((v_hashRecords records), (B_dData_dList.C_List__x58__x58_ ((v_hashExports exports), (B_dData_dList.C_List__x58__x58_ ((v_hashDecls decls), (B_dData_dList.C_List__x58__x58_ ((v_hashDatas (Driver_dCache.v_cachedDatas cp)), (B_dData_dList.C_List__x58__x58_ (((v_hashDefs B_dData_dList.C_List_Nil) (Driver_dCache.v_cachedDefs cp)), (B_dData_dList.C_List__x58__x58_ ((v_hashGlobals (Driver_dCache.v_cachedGlobals cp)), (B_dData_dList.C_List__x58__x58_ ((v_hashInsts (Driver_dCache.v_cachedInsts cp)), (B_dData_dList.C_List__x58__x58_ ((v_hashClasses (Driver_dCache.v_cachedClasses cp)), B_dData_dList.C_List_Nil))))))))))))))))))))))))

# 475 "Vuna/Compiler/Driver/Iface.vuna"
let v_tblOwner = (fun (t : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) t))

# 478 "Vuna/Compiler/Driver/Iface.vuna"
let v_prefixOwner = (fun (knownModules : string B_dData_dList.t_List) (name : string) -> ((fun prefix -> (if ((B_dData_dList.v_memName prefix) knownModules) then (B_dData_dMaybe.C_Maybe_Just (prefix)) else B_dData_dMaybe.C_Maybe_Nothing)) (Driver_dOwner.v_modulePrefixOfName name)))

# 484 "Vuna/Compiler/Driver/Iface.vuna"
let v_defOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_tblOwner (oi).f_OwnerIndex_oiDef) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (B_dData_dMaybe.C_Maybe_Just (dtb__53))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then ((v_prefixOwner (oi).f_OwnerIndex_oiKnown) name) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Driver/Iface.vuna"
let v_dataOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_tblOwner (oi).f_OwnerIndex_oiData) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> (B_dData_dMaybe.C_Maybe_Just (dtb__54))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then ((v_prefixOwner (oi).f_OwnerIndex_oiKnown) name) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_ctorFamilyPairs = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataName dtb__55) })) (Elab_dTypes.v_dtDataCtors dtb__55))) (v_ctorFamilyPairs dtb__56))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Driver/Iface.vuna"
let v_ctorOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_tblOwner (oi).f_OwnerIndex_oiCtor) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> ((v_dataOwnerOf oi) dtb__57)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifacePreludeNames = ((B_dData_dList.v_append Elab_dPrelude.v_preludeNames) Base_dIntrinsics.v_internalIntrinsicNames)

# 515 "Vuna/Compiler/Driver/Iface.vuna"
let v_globalOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (if ((B_dData_dList.v_memName name) v_ifacePreludeNames) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_defOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (B_dData_dMaybe.C_Maybe_Just (dtb__58))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_dataOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (B_dData_dMaybe.C_Maybe_Just (dtb__59))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 527 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownerIndexOf = (fun (meta : Driver_dOwner.t_SplitMeta) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> { f_OwnerIndex_oiDef = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (meta).Driver_dOwner.f_SplitMeta_smDefOwners); f_OwnerIndex_oiData = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (meta).Driver_dOwner.f_SplitMeta_smDataOwners); f_OwnerIndex_oiCtor = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (v_ctorFamilyPairs datas)); f_OwnerIndex_oiKnown = (meta).Driver_dOwner.f_SplitMeta_smKnownModules })

# 558 "Vuna/Compiler/Driver/Iface.vuna"
let v_bucketOf = (fun (name : string) tbl -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> dtb__60
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_partitionByOwnerGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match (mc0 dtb__61) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_partitionByOwnerGo mc0) dtb__62) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> (((v_partitionByOwnerGo mc0) dtb__62) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ (dtb__61, ((v_bucketOf dtb__63) mc2)))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 567 "Vuna/Compiler/Driver/Iface.vuna"
let v_reverseBucket = (fun mc0 -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__65 } -> { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb__65) }
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Driver/Iface.vuna"
let v_reverseBuckets = (fun tbl -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ((B_dData_dList.v_map v_reverseBucket) (B_dContainer_dHashMap.v_toList tbl))))

# 548 "Vuna/Compiler/Driver/Iface.vuna"
let v_partitionByOwner = (fun ownerOf xs -> (v_reverseBuckets (((v_partitionByOwnerGo ownerOf) xs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil))))

# 570 "Vuna/Compiler/Driver/Iface.vuna"
let v_progPartsOf = (fun (oi : t_OwnerIndex) (prog : Elab_dTypes.t_DtProgram) -> { f_ProgParts_ppSols = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) (Elab_dTypes.v_dtProgSols prog)); f_ProgParts_ppDatas = ((v_partitionByOwner (fun (d : Elab_dTypes.t_DtData) -> ((v_dataOwnerOf oi) (Elab_dTypes.v_dtDataName d)))) (Elab_dTypes.v_dtProgDatas prog)); f_ProgParts_ppDefs = ((v_partitionByOwner (fun (d : Elab_dTypes.t_DtDef) -> ((v_defOwnerOf oi) (Elab_dTypes.v_dtDefName d)))) (Elab_dTypes.v_dtProgDefs prog)); f_ProgParts_ppGlobals = ((v_partitionByOwner (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> ((v_globalOwnerOf oi) (B_dData_dPair.v_firstOf p)))) (Elab_dTypes.v_dtProgGlobals prog)); f_ProgParts_ppInsts = ((v_partitionByOwner (fun (i : Elab_dTypes.t_DtInst) -> ((v_defOwnerOf oi) (Elab_dTypes.v_dtInstName i)))) (Elab_dTypes.v_dtProgInsts prog)); f_ProgParts_ppClasses = ((v_partitionByOwner (fun (c : Elab_dTypes.t_DtClass) -> ((v_defOwnerOf oi) (Elab_dTypes.v_dtClassName c)))) (Elab_dTypes.v_dtProgClasses prog)) })

# 582 "Vuna/Compiler/Driver/Iface.vuna"
let v_cpOfModule = (fun (parts : t_ProgParts) (prog : Elab_dTypes.t_DtProgram) (mod_ : string) (opaqueNames : string B_dData_dList.t_List) -> ((fun datas -> ((fun defs -> ((fun globals -> ((fun insts -> ((fun classes -> ((fun slice -> ((Driver_dCache.v_withCachedOpaque opaqueNames) ((Driver_dCache.v_cachedOfProgramWith (parts).f_ProgParts_ppSols) slice))) { Elab_dTypes.f_DtProgram_dtProgDatas = datas; Elab_dTypes.f_DtProgram_dtProgDefs = defs; Elab_dTypes.f_DtProgram_dtProgGoals = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = globals; Elab_dTypes.f_DtProgram_dtProgInsts = insts; Elab_dTypes.f_DtProgram_dtProgClasses = classes; Elab_dTypes.f_DtProgram_dtProgNext = 0; Elab_dTypes.f_DtProgram_dtProgDepths = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtProgram_dtProgWarnings = B_dData_dList.C_List_Nil })) ((v_bucketOf mod_) (parts).f_ProgParts_ppClasses))) ((v_bucketOf mod_) (parts).f_ProgParts_ppInsts))) ((v_bucketOf mod_) (parts).f_ProgParts_ppGlobals))) ((v_bucketOf mod_) (parts).f_ProgParts_ppDefs))) ((v_bucketOf mod_) (parts).f_ProgParts_ppDatas)))

# 593 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_sourceOf = (fun (mc0 : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (if (dtb__68 = mc1) then dtb__69 else ((v_sourceOf dtb__67) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_SourceInfo_siPath = ""; f_SourceInfo_siHash = ""; f_SourceInfo_siMtime = 0; f_SourceInfo_siSize = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Driver/Iface.vuna"
let v_importNameOf = (fun (_uarity0 : Frontend_dAst.t_Import) -> (Loader_dModules.v_importName _uarity0))

# 600 "Vuna/Compiler/Driver/Iface.vuna"
let v_importNamesOfModule = (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_importNameOf) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 605 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_hasMissingDep = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { B_dData_dPair.f_Pair_first = dtb__72; B_dData_dPair.f_Pair_second = dtb__73 } -> (if (dtb__73 = v_depMissingHash) then true else (v_hasMissingDep dtb__71))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOfImportName = (fun (tbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match ((B_dData_dList.v_lookupPair name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> dtb__74
  | B_dData_dMaybe.C_Maybe_Nothing -> v_depMissingHash
  | _ -> failwith "DT: impossible branch"
))

# 615 "Vuna/Compiler/Driver/Iface.vuna"
let v_depHashesOf = (fun (tbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = ((v_hashOfImportName tbl) n) })) (v_importNamesOfModule m)))

# 618 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_cleanIfaceOf = (fun (mc0 : t_ModuleIface B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if ((v_miNameOf dtb__75) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__75)) else ((v_cleanIfaceOf dtb__76) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Driver/Iface.vuna"
let v_mkIfaceBase = (fun (pkg : string) (parts : t_ProgParts) (prog : Elab_dTypes.t_DtProgram) (sources : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> (match ((v_cleanIfaceOf clean) (Loader_dModules.v_moduleNameOf m)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__77) -> dtb__77
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun name -> ((fun cp -> ((fun records -> ((fun h -> ((fun hi -> { f_ModuleIface_miName = name; f_ModuleIface_miPackage = pkg; f_ModuleIface_miSource = ((v_sourceOf sources) name); f_ModuleIface_miIfaceHash = h; f_ModuleIface_miImplHash = hi; f_ModuleIface_miDepHashes = B_dData_dList.C_List_Nil; f_ModuleIface_miImports = (m).Loader_dModules.f_Module_moduleImportsOf; f_ModuleIface_miImplicitImports = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; f_ModuleIface_miExports = (m).Loader_dModules.f_Module_moduleExportsOf; f_ModuleIface_miFixities = (m).Loader_dModules.f_Module_moduleFixitiesOf; f_ModuleIface_miDecls = (m).Loader_dModules.f_Module_moduleDeclsOf; f_ModuleIface_miRecords = records; f_ModuleIface_miPrepared = B_dData_dList.C_List_Nil; f_ModuleIface_miCached = cp; f_ModuleIface_miDefLocs = (v_defLocsOfDefs (Driver_dCache.v_cachedDefs cp)) }) ((((((v_implHashOfParts name) pkg) records) (m).Loader_dModules.f_Module_moduleExportsOf) (m).Loader_dModules.f_Module_moduleDeclsOf) cp))) (((((((((v_hashOfParts name) pkg) (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf) (m).Loader_dModules.f_Module_moduleFixitiesOf) records) (m).Loader_dModules.f_Module_moduleExportsOf) (m).Loader_dModules.f_Module_moduleDeclsOf) cp))) (Elab_dRecords.v_recordsOfDecls (Frontend_dRast_dBridge.v_toRastDecls (m).Loader_dModules.f_Module_moduleDeclsOf)))) ((((v_cpOfModule parts) prog) name) (Loader_dModules.v_moduleOpaqueOf m)))) (Loader_dModules.v_moduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

# 665 "Vuna/Compiler/Driver/Iface.vuna"
let v_finishIface = (fun (tbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (m : Loader_dModules.t_Module) (mi : t_ModuleIface) -> (match ((v_cleanIfaceOf clean) (v_miNameOf mi)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> dtb__78
  | B_dData_dMaybe.C_Maybe_Nothing -> { f_ModuleIface_miName = (v_miNameOf mi); f_ModuleIface_miPackage = (v_miPackageOf mi); f_ModuleIface_miSource = (v_miSourceOf mi); f_ModuleIface_miIfaceHash = (v_miIfaceHashOf mi); f_ModuleIface_miImplHash = (v_miImplHashOf mi); f_ModuleIface_miDepHashes = ((v_depHashesOf tbl) m); f_ModuleIface_miImports = (v_miImportsOf mi); f_ModuleIface_miImplicitImports = (v_miImplicitImportsOf mi); f_ModuleIface_miExports = (v_miExportsOf mi); f_ModuleIface_miFixities = (v_miFixitiesOf mi); f_ModuleIface_miDecls = (v_miDeclsOf mi); f_ModuleIface_miRecords = (v_miRecordsOf mi); f_ModuleIface_miPrepared = (v_miPreparedOf mi); f_ModuleIface_miCached = (v_miCachedOf mi); f_ModuleIface_miDefLocs = (v_miDefLocsOf mi) }
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifacesGo = (fun (pkg : string) (parts : t_ProgParts) (prog : Elab_dTypes.t_DtProgram) (sources : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (knownDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) -> ((fun built -> ((fun hashes -> ((fun fullTbl -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (fun (p : (Loader_dModules.t_Module, t_ModuleIface) B_dData_dPair.t_Pair) -> ((((v_finishIface fullTbl) clean) (B_dData_dPair.v_firstOf p)) (B_dData_dPair.v_secondOf p)))) built); B_dData_dPair.f_Pair_second = fullTbl }) ((B_dData_dList.v_append knownDeps) hashes))) ((B_dData_dList.v_map (fun (p : (Loader_dModules.t_Module, t_ModuleIface) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (v_miNameOf (B_dData_dPair.v_secondOf p)); B_dData_dPair.f_Pair_second = (v_miIfaceHashOf (B_dData_dPair.v_secondOf p)) })) built))) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = ((((((v_mkIfaceBase pkg) parts) prog) sources) clean) m) })) modules)))

# 700 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownerOfAny = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_defOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (B_dData_dMaybe.C_Maybe_Just (dtb__79))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_dataOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__80) -> (B_dData_dMaybe.C_Maybe_Just (dtb__80))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Driver/Iface.vuna"
let v_coverageIssueOf = (fun (oi : t_OwnerIndex) (ourNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (inherited : (string, bool) B_dContainer_dHashMap.t_HashMap) (merged : (string, bool) B_dContainer_dHashMap.t_HashMap) (prelude : (string, bool) B_dContainer_dHashMap.t_HashMap) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) prelude) then "" else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) inherited) then "" else (match ((v_ownerOfAny oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> (if (dtb__81 = Driver_dOwner.v_entryOwner) then "" else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__81) ourNames) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) merged) then "" else (String.concat "" ["missing-from-iface "; name; " -> "; dtb__81])) else ""))
  | B_dData_dMaybe.C_Maybe_Nothing -> ("unowned " ^ name)
  | _ -> failwith "DT: impossible branch"
))))

# 720 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_coverageIssueGo = (fun (mc0 : t_OwnerIndex) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> ((fun issue -> (if (issue = "") then ((((((v_coverageIssueGo mc0) mc1) mc2) mc3) mc4) dtb__83) else issue)) ((((((v_coverageIssueOf mc0) mc1) mc2) mc3) mc4) dtb__82))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Driver/Iface.vuna"
let v_isSealName = (fun (n : string) -> ((B_dData_dString.v_startsWith "vuna_seal_") n))

# 730 "Vuna/Compiler/Driver/Iface.vuna"
let v_artifactNamesOf = (fun (prog : Elab_dTypes.t_DtProgram) -> ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not (v_isSealName n)))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Elab_dTypes.v_dtProgDatas prog))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Elab_dTypes.v_dtProgDefs prog))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstName) (Elab_dTypes.v_dtProgInsts prog))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Elab_dTypes.v_dtProgClasses prog))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Elab_dTypes.v_dtProgGlobals prog))))))))

# 737 "Vuna/Compiler/Driver/Iface.vuna"
let v_dataNamesOf = (fun (cp : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Driver_dCache.v_cachedDatas cp)))

# 740 "Vuna/Compiler/Driver/Iface.vuna"
let v_ctorNamesOf = (fun (cp : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) (Driver_dCache.v_cachedDatas cp)))

# 743 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceNamesOf = (fun (m : t_ModuleIface) -> ((fun cp -> ((B_dData_dList.v_append (v_dataNamesOf cp)) ((B_dData_dList.v_append (v_ctorNamesOf cp)) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstName) (Driver_dCache.v_cachedInsts cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Driver_dCache.v_cachedClasses cp))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Driver_dCache.v_cachedGlobals cp)))))))) (v_miCachedOf m)))

# 751 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceArtifactNames = (fun (ifaces : t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_ifaceNamesOf) ifaces))

# 754 "Vuna/Compiler/Driver/Iface.vuna"
let v_firstCoverageIssue = (fun (oi : t_OwnerIndex) (ourNames : string B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (ifaces : t_ModuleIface B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) -> ((fun merged -> ((fun mergedTbl -> ((fun ourTbl -> ((fun inhTbl -> ((fun preludeTbl -> ((fun issue -> (if (issue = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (issue)))) ((((((v_coverageIssueGo oi) ourTbl) inhTbl) mergedTbl) preludeTbl) (v_artifactNamesOf prog)))) (B_dContainer_dHashMap.v_ofNames v_ifacePreludeNames))) (B_dContainer_dHashMap.v_ofNames inherited))) (B_dContainer_dHashMap.v_ofNames ourNames))) (B_dContainer_dHashMap.v_ofNames merged))) (v_ifaceArtifactNames ifaces)))

# 770 "Vuna/Compiler/Driver/Iface.vuna"
let v_coverageResult = (fun (oi : t_OwnerIndex) (ourNames : string B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (ifaces : t_ModuleIface B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) -> (match (((((v_firstCoverageIssue oi) ourNames) inherited) ifaces) prog) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> (Base_dDiag.v_icInternal ("iface: " ^ dtb__84))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ifaces))
  | _ -> failwith "DT: impossible branch"
))

# 776 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceOfPackage = (fun (pkg : string) (sources : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (knownDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match (((((((v_ifacesGo pkg) parts) prog) sources) knownDeps) clean) ourModules) with
  | { B_dData_dPair.f_Pair_first = dtb__85; B_dData_dPair.f_Pair_second = dtb__86 } -> (((((v_coverageResult oi) ourNames) inherited) dtb__85) prog)
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ourModules))) ((v_progPartsOf oi) prog))) ((v_ownerIndexOf meta) (Elab_dTypes.v_dtProgDatas prog)))) ((Driver_dOwner.v_splitMetaOf declModules) entryDecls))) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules))) (B_dData_dList.v_reverse ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) modules))))

# 797 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_findNamedModule = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (if ((Loader_dModules.v_moduleNameOf dtb__87) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__87)) else ((v_findNamedModule dtb__88) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Driver/Iface.vuna"
let v_sameOwner = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> (dtb__89 = mc0)
  | _ -> failwith "DT: impossible branch"
))

# 808 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownedByModule = (fun (oi : t_OwnerIndex) (name : string) (artifact : string) -> ((v_sameOwner name) ((v_globalOwnerOf oi) artifact)))

# 817 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_allOwnedPresent = (fun (mc0 : t_OwnerIndex) (mc1 : string B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> ((fun skip -> (if skip then (((((v_allOwnedPresent mc0) mc1) mc2) dtb__91) mc4) else (if ((B_dData_dList.v_memName dtb__90) mc4) then (((((v_allOwnedPresent mc0) mc1) mc2) dtb__91) mc4) else false))) (if ((B_dData_dList.v_memName dtb__90) mc1) then true else (B_dData_dBool.v_not (((v_ownedByModule mc0) mc2) dtb__90))))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 811 "Vuna/Compiler/Driver/Iface.vuna"
let v_moduleCoverageOk = (fun (oi : t_OwnerIndex) (inherited : string B_dData_dList.t_List) (name : string) (prog : Elab_dTypes.t_DtProgram) (mi : t_ModuleIface) -> ((fun present -> (((((v_allOwnedPresent oi) inherited) name) (v_artifactNamesOf prog)) present)) (v_ifaceNamesOf mi)))

# 827 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceOfModule = (fun (pkg : string) (si : t_SourceInfo) (knownDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (name : string) -> ((fun ourModules -> ((fun declModules -> ((fun meta -> ((fun oi -> ((fun parts -> ((fun ourNames -> (match ((v_findNamedModule ourModules) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["iface: module "; name; " is not part of the checked package"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> ((fun mi0 -> ((fun tbl -> ((fun mi -> ((fun miP -> (if (((((v_moduleCoverageOk oi) inherited) name) prog) miP) then (Base_dDiag.C_Check_OkC (miP)) else (Base_dDiag.v_icInternal (String.concat "" ["iface: module "; name; " has uncovered artifacts"])))) (match (((v_preparedForModule ourModules) entryDecls) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> mi
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> ((v_setPrepared dtb__93) mi)
  | _ -> failwith "DT: impossible branch"
))) ((((v_finishIface tbl) B_dData_dList.C_List_Nil) dtb__92) mi0))) ((B_dData_dList.v_append knownDeps) ((B_dData_dList.v_map (fun (x : t_ModuleIface) -> { B_dData_dPair.f_Pair_first = (v_miNameOf x); B_dData_dPair.f_Pair_second = (v_miIfaceHashOf x) })) ((B_dData_dList.v_append clean) (B_dData_dList.C_List__x58__x58_ (mi0, B_dData_dList.C_List_Nil))))))) ((((((v_mkIfaceBase pkg) parts) prog) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = si }, B_dData_dList.C_List_Nil))) B_dData_dList.C_List_Nil) dtb__92))
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ourModules))) ((v_progPartsOf oi) prog))) ((v_ownerIndexOf meta) (Elab_dTypes.v_dtProgDatas prog)))) ((Driver_dOwner.v_splitMetaOf declModules) entryDecls))) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules))) (B_dData_dList.v_reverse ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) modules))))

# 853 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_moduleNamesOf = (fun (mc0 : t_ModuleIface B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (B_dData_dList.C_List__x58__x58_ ((v_miNameOf dtb__94), (v_moduleNamesOf dtb__95)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 858 "Vuna/Compiler/Driver/Iface.vuna"
let v_encSourceInfo = (fun (s : t_SourceInfo) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (s).f_SourceInfo_siPath) ((Base_dBytes.v_encStr (s).f_SourceInfo_siHash) ((Base_dBytes.v_encInt (s).f_SourceInfo_siMtime) ((Base_dBytes.v_encInt (s).f_SourceInfo_siSize) acc)))))

# 861 "Vuna/Compiler/Driver/Iface.vuna"
let v_decSourceInfo = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (path : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (hash : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (mtime : int) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b3)) (fun (size : int) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_SourceInfo_siPath = path; f_SourceInfo_siHash = hash; f_SourceInfo_siMtime = mtime; f_SourceInfo_siSize = size }; B_dData_dPair.f_Pair_second = b4 })))))))))))

# 867 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDepPair = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> ((Base_dBytes.v_encStr dtb__96) ((Base_dBytes.v_encStr dtb__97) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 870 "Vuna/Compiler/Driver/Iface.vuna"
let v_decDepPair = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (n : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (h : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = h }; B_dData_dPair.f_Pair_second = b2 })))))))

# 877 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDefLoc = (fun (mc0 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> (match dtb__99 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> ((Base_dBytes.v_encStr dtb__98) ((Base_dBytes.v_encStr dtb__100) ((Base_dBytes.v_encInt dtb__101) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 880 "Vuna/Compiler/Driver/Iface.vuna"
let v_decDefLoc = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (file : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (line : int) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = file; B_dData_dPair.f_Pair_second = line } }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 887 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIfacePayload = (fun (m : t_ModuleIface) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (m).f_ModuleIface_miName) ((Base_dBytes.v_encStr (m).f_ModuleIface_miPackage) ((v_encSourceInfo (m).f_ModuleIface_miSource) ((Base_dBytes.v_encStr (m).f_ModuleIface_miIfaceHash) ((Base_dBytes.v_encStr (m).f_ModuleIface_miImplHash) (((Base_dBytes.v_encList v_encDepPair) (m).f_ModuleIface_miDepHashes) (((Base_dBytes.v_encList Elab_dCanonical.v_encImport) (m).f_ModuleIface_miImports) (((Base_dBytes.v_encList Elab_dCanonical.v_encImport) (m).f_ModuleIface_miImplicitImports) (((Base_dBytes.v_encList Elab_dCanonical.v_encExportEntry) (m).f_ModuleIface_miExports) (((Base_dBytes.v_encList Elab_dCanonical.v_encFixity) (m).f_ModuleIface_miFixities) (((Base_dBytes.v_encList Frontend_dCanonical_dAst.v_encDecl) (m).f_ModuleIface_miDecls) (((Base_dBytes.v_encList Elab_dCanonical.v_encRecordMeta) (m).f_ModuleIface_miRecords) (((Base_dBytes.v_encList Frontend_dCanonical_dAst.v_encDecl) (m).f_ModuleIface_miPrepared) ((Driver_dCache.v_encCachedProgram (m).f_ModuleIface_miCached) (((Base_dBytes.v_encList v_encDefLoc) (m).f_ModuleIface_miDefLocs) acc))))))))))))))))

# 894 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIfaceAt = (fun (_uarity0 : t_ModuleIface) (_uarity1 : string B_dData_dList.t_List) -> ((v_encModuleIfacePayload _uarity0) _uarity1))

# 897 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIface = (fun (m : t_ModuleIface) -> ((Base_dBytes.v_encTop v_encModuleIfacePayload) m))

# 903 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfacePayload = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun p1 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) ((Base_dBytes.v_decStr (fuel - 1)) (B_dData_dPair.v_secondOf p1))) (fun p2 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) ((v_decSourceInfo (fuel - 1)) (B_dData_dPair.v_secondOf p2))) (fun p3 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) ((Base_dBytes.v_decStr (fuel - 1)) (B_dData_dPair.v_secondOf p3))) (fun p4 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) ((Base_dBytes.v_decStr (fuel - 1)) (B_dData_dPair.v_secondOf p4))) (fun p5 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList v_decDepPair) (fuel - 1)) (B_dData_dPair.v_secondOf p5))) (fun p6 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decImport) (fuel - 1)) (B_dData_dPair.v_secondOf p6))) (fun p7 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decImport) (fuel - 1)) (B_dData_dPair.v_secondOf p7))) (fun p8 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decExportEntry) (fuel - 1)) (B_dData_dPair.v_secondOf p8))) (fun p9 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decFixity) (fuel - 1)) (B_dData_dPair.v_secondOf p9))) (fun p10 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList Frontend_dCanonical_dAst.v_decDecl) (fuel - 1)) (B_dData_dPair.v_secondOf p10))) (fun p11 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decRecordMeta) (fuel - 1)) (B_dData_dPair.v_secondOf p11))) (fun p12 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList Frontend_dCanonical_dAst.v_decDecl) (fuel - 1)) (B_dData_dPair.v_secondOf p12))) (fun p13 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) ((Driver_dCache.v_decCachedProgram (fuel - 1)) (B_dData_dPair.v_secondOf p13))) (fun p14 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_uBase_uData_uMaybe_uMaybe) (((Base_dBytes.v_decList v_decDefLoc) (fuel - 1)) (B_dData_dPair.v_secondOf p14))) (fun p15 -> ((B_dTrait_dApplicative.v_pure B_dData_dMaybe.v_Applicative_uBase_uData_uMaybe_uMaybe) { B_dData_dPair.f_Pair_first = { f_ModuleIface_miName = (B_dData_dPair.v_firstOf p1); f_ModuleIface_miPackage = (B_dData_dPair.v_firstOf p2); f_ModuleIface_miSource = (B_dData_dPair.v_firstOf p3); f_ModuleIface_miIfaceHash = (B_dData_dPair.v_firstOf p4); f_ModuleIface_miImplHash = (B_dData_dPair.v_firstOf p5); f_ModuleIface_miDepHashes = (B_dData_dPair.v_firstOf p6); f_ModuleIface_miImports = (B_dData_dPair.v_firstOf p7); f_ModuleIface_miImplicitImports = (B_dData_dPair.v_firstOf p8); f_ModuleIface_miExports = (B_dData_dPair.v_firstOf p9); f_ModuleIface_miFixities = (B_dData_dPair.v_firstOf p10); f_ModuleIface_miDecls = (B_dData_dPair.v_firstOf p11); f_ModuleIface_miRecords = (B_dData_dPair.v_firstOf p12); f_ModuleIface_miPrepared = (B_dData_dPair.v_firstOf p13); f_ModuleIface_miCached = (B_dData_dPair.v_firstOf p14); f_ModuleIface_miDefLocs = (B_dData_dPair.v_firstOf p15) }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p15) }))))))))))))))))))))))))))))))))

# 900 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfaceAt = (fun (_uarity0 : int) (_uarity1 : Base_dBytes.t_Cur) -> ((v_decModuleIfacePayload _uarity0) _uarity1))

# 924 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfaceComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (match dtb__102 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (if (Base_dBytes.v_curAtEnd dtb__104) then (B_dData_dMaybe.C_Maybe_Just (dtb__103)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decModuleIfacePayload (bi_strLength s)) (Base_dBytes.v_curOf s))))
