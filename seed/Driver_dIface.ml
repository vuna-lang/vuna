open Vuna_runtime
type t_SourceInfo = { f_SourceInfo_siPath : string; f_SourceInfo_siHash : string; f_SourceInfo_siMtime : int; f_SourceInfo_siSize : int }
and t_ModuleIface = { f_ModuleIface_miName : string; f_ModuleIface_miPackage : string; f_ModuleIface_miSource : t_SourceInfo; f_ModuleIface_miIfaceHash : string; f_ModuleIface_miDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ModuleIface_miImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_ModuleIface_miImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_ModuleIface_miExports : Loader_dModules.t_ExportEntry B_dData_dList.t_List; f_ModuleIface_miFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_ModuleIface_miDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_ModuleIface_miRecords : Elab_dRecords.t_RecordMeta B_dData_dList.t_List; f_ModuleIface_miPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_ModuleIface_miCached : Driver_dCache.t_CachedProgram; f_ModuleIface_miDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_CanonState = { f_CanonState_csNext : int; f_CanonState_csMap : (int, int) B_dContainer_dHashMap.t_HashMap }
and t_OwnerIndex = { f_OwnerIndex_oiDef : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiData : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiCtor : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiKnown : string B_dData_dList.t_List }
and t_ProgParts = { f_ProgParts_ppSols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppDatas : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppDefs : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppGlobals : (string, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppInsts : (string, Elab_dTypes.t_DtInst B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppClasses : (string, Elab_dTypes.t_DtClass B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap }

# 96 "Vuna/Compiler/Driver/Iface.vuna"
let v_siPathOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siPath)

# 99 "Vuna/Compiler/Driver/Iface.vuna"
let v_siHashOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siHash)

# 102 "Vuna/Compiler/Driver/Iface.vuna"
let v_siMtimeOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siMtime)

# 105 "Vuna/Compiler/Driver/Iface.vuna"
let v_siSizeOf = (fun (s : t_SourceInfo) -> (s).f_SourceInfo_siSize)

# 108 "Vuna/Compiler/Driver/Iface.vuna"
let v_miNameOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miName)

# 111 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPackageOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miPackage)

# 114 "Vuna/Compiler/Driver/Iface.vuna"
let v_miCachedOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miCached)

# 117 "Vuna/Compiler/Driver/Iface.vuna"
let v_miIfaceHashOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miIfaceHash)

# 120 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDepHashesOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miDepHashes)

# 123 "Vuna/Compiler/Driver/Iface.vuna"
let v_miSourceOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miSource)

# 126 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImportsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miImports)

# 129 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImplicitImportsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miImplicitImports)

# 132 "Vuna/Compiler/Driver/Iface.vuna"
let v_miExportsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miExports)

# 135 "Vuna/Compiler/Driver/Iface.vuna"
let v_miFixitiesOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miFixities)

# 138 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDeclsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miDecls)

# 142 "Vuna/Compiler/Driver/Iface.vuna"
let v_miRecordsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miRecords)

# 145 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPreparedOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miPrepared)

# 150 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDefLocsOf = (fun (m : t_ModuleIface) -> (m).f_ModuleIface_miDefLocs)

# 202 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_lookupDefLoc = (fun (mc0 : string) (mc1 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> (match dtb__3 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (if (mc0 = dtb__2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 })) else ((v_lookupDefLoc mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Driver/Iface.vuna"
let v_restoreDefLocsSpansDef = (fun (locs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> d
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut3 = ((v_lookupDefLoc (Elab_dTypes.v_dtDefName d)) locs) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (match dtb__7 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (let sp = (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = dtb__8; Base_dSource.f_Span_spanStartLine = dtb__9; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = dtb__9; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) in (match d with
  | Elab_dTypes.C_DtDef_DtDef (dtb__10, dtb__11, dtb__12, dtb__13) -> (Elab_dTypes.C_DtDef_DtDef (dtb__10, dtb__11, dtb__12, sp))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb__14, dtb__15, dtb__16) -> (Elab_dTypes.C_DtDef_DtAxiom (dtb__14, dtb__15, sp))
  | Elab_dTypes.C_DtDef_DtExtern (dtb__17, dtb__18, dtb__19, dtb__20) -> (Elab_dTypes.C_DtDef_DtExtern (dtb__17, dtb__18, dtb__19, sp))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Driver/Iface.vuna"
let v_restoreDefLocsSpansIface = (fun (mi : t_ModuleIface) -> (let cp = (mi).f_ModuleIface_miCached in (let cp2 = { Driver_dCache.f_CachedProgram_cachedDatas = (Driver_dCache.v_cachedDatas cp); Driver_dCache.f_CachedProgram_cachedDefs = ((B_dData_dList.v_map (v_restoreDefLocsSpansDef (mi).f_ModuleIface_miDefLocs)) (Driver_dCache.v_cachedDefs cp)); Driver_dCache.f_CachedProgram_cachedGlobals = (Driver_dCache.v_cachedGlobals cp); Driver_dCache.f_CachedProgram_cachedInsts = (Driver_dCache.v_cachedInsts cp); Driver_dCache.f_CachedProgram_cachedClasses = (Driver_dCache.v_cachedClasses cp); Driver_dCache.f_CachedProgram_cachedOpaque = (Driver_dCache.v_cachedOpaque cp) } in { f_ModuleIface_miName = (mi).f_ModuleIface_miName; f_ModuleIface_miPackage = (mi).f_ModuleIface_miPackage; f_ModuleIface_miSource = (mi).f_ModuleIface_miSource; f_ModuleIface_miIfaceHash = (mi).f_ModuleIface_miIfaceHash; f_ModuleIface_miDepHashes = (mi).f_ModuleIface_miDepHashes; f_ModuleIface_miImports = (mi).f_ModuleIface_miImports; f_ModuleIface_miImplicitImports = (mi).f_ModuleIface_miImplicitImports; f_ModuleIface_miExports = (mi).f_ModuleIface_miExports; f_ModuleIface_miFixities = (mi).f_ModuleIface_miFixities; f_ModuleIface_miDecls = (mi).f_ModuleIface_miDecls; f_ModuleIface_miRecords = (mi).f_ModuleIface_miRecords; f_ModuleIface_miPrepared = (mi).f_ModuleIface_miPrepared; f_ModuleIface_miCached = cp2; f_ModuleIface_miDefLocs = (mi).f_ModuleIface_miDefLocs })))

# 156 "Vuna/Compiler/Driver/Iface.vuna"
let v_restoreDefLocsSpans = (fun (ifaces : t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_map v_restoreDefLocsSpansIface) ifaces))

# 207 "Vuna/Compiler/Driver/Iface.vuna"
let v_defLocOf = (fun (norm : (string) -> string) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (norm (dtb__21).Base_dSource.f_Span_spanFile); B_dData_dPair.f_Pair_second = (dtb__21).Base_dSource.f_Span_spanStartLine } }))
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Driver/Iface.vuna"
let v_defLocsOfDefs = (fun (norm : (string) -> string) (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (a : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (b : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) ((B_dData_dList.v_mapMaybe (v_defLocOf norm)) ds)))

# 223 "Vuna/Compiler/Driver/Iface.vuna"
let v_preparedForModule = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (name : string) -> (let others = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_moduleNameOf m) <> name))) modules) in (let own = ((B_dData_dList.v_concatMap (fun (m : Loader_dModules.t_Module) -> (if ((Loader_dModules.v_moduleNameOf m) = name) then (Loader_dModules.v_moduleDeclsOf m) else B_dData_dList.C_List_Nil))) modules) in (let auxDecls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) others)) entryDecls) in (if ((B_dData_dList.v_length modules) <= 1) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dRecords.v_prepareDeclsWith auxDecls) own) with
  | Base_dDiag.C_Check_ErrC (dtb__22) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__23) -> (match (Elab_dDerive.v_expandDerivings (B_dData_dPair.v_secondOf dtb__23)) with
  | Base_dDiag.C_Check_ErrC (dtb__24) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__25) -> (B_dData_dMaybe.C_Maybe_Just (dtb__25))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 239 "Vuna/Compiler/Driver/Iface.vuna"
let v_setPrepared = (fun (prepared : Frontend_dAst.t_Decl B_dData_dList.t_List) (mi : t_ModuleIface) -> { f_ModuleIface_miName = (mi).f_ModuleIface_miName; f_ModuleIface_miPackage = (mi).f_ModuleIface_miPackage; f_ModuleIface_miSource = (mi).f_ModuleIface_miSource; f_ModuleIface_miIfaceHash = (mi).f_ModuleIface_miIfaceHash; f_ModuleIface_miDepHashes = (mi).f_ModuleIface_miDepHashes; f_ModuleIface_miImports = (mi).f_ModuleIface_miImports; f_ModuleIface_miImplicitImports = (mi).f_ModuleIface_miImplicitImports; f_ModuleIface_miExports = (mi).f_ModuleIface_miExports; f_ModuleIface_miFixities = (mi).f_ModuleIface_miFixities; f_ModuleIface_miDecls = (mi).f_ModuleIface_miDecls; f_ModuleIface_miRecords = (mi).f_ModuleIface_miRecords; f_ModuleIface_miPrepared = prepared; f_ModuleIface_miCached = (mi).f_ModuleIface_miCached; f_ModuleIface_miDefLocs = (mi).f_ModuleIface_miDefLocs })

# 258 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceSchema = "vuna-iface 36"

# 263 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceHashVersion = "vuna-iface-hash 13 (instance stable key + full-class symbol)"

# 273 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashTextStrong = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 277 "Vuna/Compiler/Driver/Iface.vuna"
let v_shaText = (fun (s : string) -> (Base_dHash.v_digestHex (Base_dHash.v_digestOfString s)))

# 282 "Vuna/Compiler/Driver/Iface.vuna"
let v_payloadDigest = (fun (s : string) -> (Base_dHash.v_contentAddress s))

# 286 "Vuna/Compiler/Driver/Iface.vuna"
let v_partOf = (fun (s : string) -> (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (bi_strLength s)), (B_dData_dList.C_List__x58__x58_ (":", (B_dData_dList.C_List__x58__x58_ (s, B_dData_dList.C_List_Nil)))))))

# 293 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_flatParts = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> ((B_dData_dList.v_append (v_partOf dtb__26)) (v_flatParts dtb__27))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Driver/Iface.vuna"
let v_digestParts = (fun (ps : string B_dData_dList.t_List) -> (v_shaText (B_dData_dList.dtp_concatMany (v_flatParts ps))))

# 298 "Vuna/Compiler/Driver/Iface.vuna"
let v_depMissingHash = "missing"

# 305 "Vuna/Compiler/Driver/Iface.vuna"
let v_sortTextPairs = (fun ps -> ((B_dData_dSort.v_sortBy (fun a b -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) ps))

# 308 "Vuna/Compiler/Driver/Iface.vuna"
let v_sortByText = (fun key xs -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (v_sortTextPairs ((B_dData_dList.v_map (fun x -> { B_dData_dPair.f_Pair_first = (key x); B_dData_dPair.f_Pair_second = x })) xs))))

# 318 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonStateEmpty = { f_CanonState_csNext = 0; f_CanonState_csMap = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) }

# 321 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_canonTerm = (fun (mc0 : t_CanonState) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__28, dtb__29, dtb__30) -> (let pc = ((v_canonTerm mc0) dtb__28) in (let pt = ((v_canonTerm (B_dData_dPair.v_secondOf pc)) dtb__29) in (let pe = ((v_canonTerm (B_dData_dPair.v_secondOf pt)) dtb__30) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((B_dData_dPair.v_firstOf pc), (B_dData_dPair.v_firstOf pt), (B_dData_dPair.v_firstOf pe))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pe) })))
  | Core_dTerm.C_Term_TCase (dtb__31, dtb__32) -> (let ps = ((v_canonTerm mc0) dtb__31) in (let pa = ((v_canonAlts (B_dData_dPair.v_secondOf ps)) dtb__32) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase ((B_dData_dPair.v_firstOf ps), (B_dData_dPair.v_firstOf pa))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pa) }))
  | Core_dTerm.C_Term_TRecord (dtb__33, dtb__34) -> (let pr = ((v_canonArgs mc0) dtb__34) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecord (dtb__33, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) })
  | Core_dTerm.C_Term_TMk (dtb__35, dtb__36) -> (let pr = ((v_canonArgs mc0) dtb__36) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMk (dtb__35, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) })
  | Core_dTerm.C_Term_TCon (dtb__37, dtb__38) -> (let pr = ((v_canonArgs mc0) dtb__38) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCon (dtb__37, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) })
  | Core_dTerm.C_Term_TApp (dtb__39, dtb__40, dtb__41) -> (let pf = ((v_canonTerm mc0) dtb__39) in (let pa = ((v_canonTerm (B_dData_dPair.v_secondOf pf)) dtb__40) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((B_dData_dPair.v_firstOf pf), (B_dData_dPair.v_firstOf pa), dtb__41)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pa) }))
  | Core_dTerm.C_Term_TLam (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (let pb = ((v_canonTerm mc0) dtb__46) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__42, dtb__43, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (B_dData_dPair.v_firstOf pb))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pb) })
  | Core_dTerm.C_Term_TPi (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> (let pd = ((v_canonTerm mc0) dtb__50) in (let pc = ((v_canonTerm (B_dData_dPair.v_secondOf pd)) dtb__51) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (dtb__47, dtb__48, dtb__49, (B_dData_dPair.v_firstOf pd), (B_dData_dPair.v_firstOf pc))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pc) }))
  | Core_dTerm.C_Term_TMeta (dtb__52) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__52) (mc0).f_CanonState_csMap) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb__53)); B_dData_dPair.f_Pair_second = mc0 }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta ((mc0).f_CanonState_csNext)); B_dData_dPair.f_Pair_second = { f_CanonState_csNext = ((mc0).f_CanonState_csNext + 1); f_CanonState_csMap = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__52) (mc0).f_CanonState_csNext) (mc0).f_CanonState_csMap) } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 }
))
# 365 "Vuna/Compiler/Driver/Iface.vuna"
and v_canonArgs = (fun (mc0 : t_CanonState) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__54 with
  | { B_dData_dPair.f_Pair_first = dtb__56; B_dData_dPair.f_Pair_second = dtb__57 } -> (let pt = ((v_canonTerm mc0) dtb__56) in (let pr = ((v_canonArgs (B_dData_dPair.v_secondOf pt)) dtb__55) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf pt); B_dData_dPair.f_Pair_second = dtb__57 }, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))
# 373 "Vuna/Compiler/Driver/Iface.vuna"
and v_canonAlts = (fun (mc0 : t_CanonState) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (match dtb__58 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__60; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__61; Core_dTerm.f_CaseAlt_caseAltBody = dtb__62 } -> (let pb = ((v_canonTerm mc0) dtb__62) in (let pr = ((v_canonAlts (B_dData_dPair.v_secondOf pb)) dtb__59) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__60; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__61; Core_dTerm.f_CaseAlt_caseAltBody = (B_dData_dPair.v_firstOf pb) }, (B_dData_dPair.v_firstOf pr))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf pr) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonTermTop = (fun (t : Core_dTerm.t_Term) -> (B_dData_dPair.v_firstOf ((v_canonTerm v_canonStateEmpty) t)))

# 384 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> (B_dData_dMaybe.C_Maybe_Just ((v_canonTermTop dtb__63)))
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Driver/Iface.vuna"
let v_defView = (fun (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_canonTermTop (Elab_dTypes.v_dtDefType d)); B_dData_dPair.f_Pair_second = (v_canonMaybe (Elab_dTypes.v_dtDefBody d)) } })

# 398 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDefView = (fun (mc0 : (string, (Core_dTerm.t_Term, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__65 } -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = dtb__67 } -> ((Base_dBytes.v_encStr dtb__64) ((Core_dCanonical.v_encTerm dtb__66) (((Base_dBytes.v_encMaybe Core_dCanonical.v_encTerm) dtb__67) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDefView = (fun (names : string B_dData_dList.t_List) (d : Elab_dTypes.t_DtDef) -> (let name = (Elab_dTypes.v_dtDefName d) in (let body = (if ((B_dData_dList.v_memName name) names) then B_dData_dMaybe.C_Maybe_Nothing else (Elab_dTypes.v_dtDefBody d)) in { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_canonTermTop (Elab_dTypes.v_dtDefType d)); B_dData_dPair.f_Pair_second = (v_canonMaybe body) } })))

# 408 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDefs = (fun (names : string B_dData_dList.t_List) (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList v_encDefView)) ((v_sortByText (fun (p : (string, (Core_dTerm.t_Term, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) ((B_dData_dList.v_map (v_hashDefView names)) ds)))))

# 413 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOpaque = (fun (names : string B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) ((v_sortByText (fun (n : string) -> n)) names))))

# 417 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDatas = (fun (ds : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtData)) ((v_sortByText (fun (d : Elab_dTypes.t_DtData) -> (Elab_dTypes.v_dtDataName d))) ds))))

# 420 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashInsts = (fun (is : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtInstSem)) ((v_sortByText Elab_dTypes.v_dtInstKey) is))))

# 423 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashClasses = (fun (cs : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtClassSem)) ((v_sortByText (fun (c : Elab_dTypes.t_DtClass) -> (Elab_dTypes.v_dtClassName c))) cs))))

# 428 "Vuna/Compiler/Driver/Iface.vuna"
let v_encGlobal = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> ((Base_dBytes.v_encStr dtb__68) ((Core_dCanonical.v_encTerm dtb__69) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashGlobals = (fun (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList v_encGlobal)) ((v_sortByText (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) gs))))

# 435 "Vuna/Compiler/Driver/Iface.vuna"
let v_exportKeyOf = (fun (e : Loader_dModules.t_ExportEntry) -> (String.concat "" [(e).Loader_dModules.f_ExportEntry_public; "|"; (e).Loader_dModules.f_ExportEntry_kind; "|"; (e).Loader_dModules.f_ExportEntry_target; "|"; (e).Loader_dModules.f_ExportEntry_parent]))

# 438 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashExports = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encExportEntry)) ((v_sortByText v_exportKeyOf) es))))

# 442 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashFixities = (fun (fs : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encFixity)) fs)))

# 446 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashRecords = (fun (recs : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encRecordMeta)) recs)))

# 450 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashImports = (fun (is : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encImport)) is)))

# 456 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDecls = (fun (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encDecls) ds)))

# 461 "Vuna/Compiler/Driver/Iface.vuna"
let v_stripOpaqueDeclBodies = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DFun (dtb__70, dtb__71, dtb__72, dtb__73) -> (if ((B_dData_dList.v_memName dtb__70) mc0) then (Frontend_dAst.C_Decl_DFun (dtb__70, dtb__71, (Frontend_dAst.C_Expr_EVar ("@opaque@", (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__73)))), dtb__73)) else (Frontend_dAst.C_Decl_DFun (dtb__70, dtb__71, dtb__72, dtb__73)))
  | _ -> mc1
))

# 469 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDeclsForIface = (fun (names : string B_dData_dList.t_List) (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_hashDecls ((B_dData_dList.v_map (v_stripOpaqueDeclBodies names)) ds)))

# 474 "Vuna/Compiler/Driver/Iface.vuna"
let v_moduleHashes = (fun (name : string) (pkg : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (implicitImports : Frontend_dAst.t_Import B_dData_dList.t_List) (fixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (exports : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (cp : Driver_dCache.t_CachedProgram) -> (let opaqueNames = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) (Driver_dCache.v_cachedOpaqueOf cp)) in (let im = (v_hashImports imports) in (let imi = (v_hashImports implicitImports) in (let fx = (v_hashFixities fixities) in (let re = (v_hashRecords records) in (let ex = (v_hashExports exports) in (let da = (v_hashDatas (Driver_dCache.v_cachedDatas cp)) in (let gl = (v_hashGlobals (Driver_dCache.v_cachedGlobals cp)) in (let inst = (v_hashInsts (Driver_dCache.v_cachedInsts cp)) in (let cl = (v_hashClasses (Driver_dCache.v_cachedClasses cp)) in (let op = (v_hashOpaque (Driver_dCache.v_cachedOpaqueOf cp)) in (let declsIface = ((v_hashDeclsForIface opaqueNames) decls) in (let defsIface = ((v_hashDefs opaqueNames) (Driver_dCache.v_cachedDefs cp)) in (v_digestParts (B_dData_dList.C_List__x58__x58_ (v_ifaceHashVersion, (B_dData_dList.C_List__x58__x58_ (name, (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ (im, (B_dData_dList.C_List__x58__x58_ (imi, (B_dData_dList.C_List__x58__x58_ (fx, (B_dData_dList.C_List__x58__x58_ (re, (B_dData_dList.C_List__x58__x58_ (declsIface, (B_dData_dList.C_List__x58__x58_ (da, (B_dData_dList.C_List__x58__x58_ (defsIface, (B_dData_dList.C_List__x58__x58_ (gl, (B_dData_dList.C_List__x58__x58_ (inst, (B_dData_dList.C_List__x58__x58_ (cl, (B_dData_dList.C_List__x58__x58_ (ex, (B_dData_dList.C_List__x58__x58_ (op, B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))

# 493 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOfIface = (fun (m : t_ModuleIface) -> (((((((((v_moduleHashes (v_miNameOf m)) (v_miPackageOf m)) (v_miImportsOf m)) (v_miImplicitImportsOf m)) (v_miFixitiesOf m)) (v_miRecordsOf m)) (v_miExportsOf m)) (v_miDeclsOf m)) (v_miCachedOf m)))

# 507 "Vuna/Compiler/Driver/Iface.vuna"
let v_pkgIfaceHashOfModules = (fun (pkg : string) (mods : t_ModuleIface B_dData_dList.t_List) -> (v_digestParts (B_dData_dList.C_List__x58__x58_ ("vuna-pkg-iface-hash 1", (B_dData_dList.C_List__x58__x58_ (pkg, ((B_dData_dList.v_map v_miIfaceHashOf) ((v_sortByText v_miNameOf) mods))))))))

# 522 "Vuna/Compiler/Driver/Iface.vuna"
let v_tblOwner = (fun (t : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) t))

# 525 "Vuna/Compiler/Driver/Iface.vuna"
let v_prefixOwner = (fun (knownModules : string B_dData_dList.t_List) (name : string) -> (let prefix = (Driver_dOwner.v_modulePrefixOfName name) in (if ((B_dData_dList.v_memName prefix) knownModules) then (B_dData_dMaybe.C_Maybe_Just (prefix)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 531 "Vuna/Compiler/Driver/Iface.vuna"
let v_defOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_tblOwner (oi).f_OwnerIndex_oiDef) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (B_dData_dMaybe.C_Maybe_Just (dtb__74))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then ((v_prefixOwner (oi).f_OwnerIndex_oiKnown) name) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Driver/Iface.vuna"
let v_dataOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_tblOwner (oi).f_OwnerIndex_oiData) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (B_dData_dMaybe.C_Maybe_Just (dtb__75))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then ((v_prefixOwner (oi).f_OwnerIndex_oiKnown) name) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_ctorFamilyPairs = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataName dtb__76) })) (Elab_dTypes.v_dtDataCtors dtb__76))) (v_ctorFamilyPairs dtb__77))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Driver/Iface.vuna"
let v_ctorOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_tblOwner (oi).f_OwnerIndex_oiCtor) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> ((v_dataOwnerOf oi) dtb__78)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifacePreludeNames = ((B_dData_dList.v_append Elab_dPrelude.v_preludeNames) Base_dIntrinsics.v_internalIntrinsicNames)

# 562 "Vuna/Compiler/Driver/Iface.vuna"
let v_globalOwnerOf = (fun (oi : t_OwnerIndex) (name : string) -> (if ((B_dData_dList.v_memName name) v_ifacePreludeNames) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_defOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (B_dData_dMaybe.C_Maybe_Just (dtb__79))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_dataOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__80) -> (B_dData_dMaybe.C_Maybe_Just (dtb__80))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 574 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownerIndexOf = (fun (meta : Driver_dOwner.t_SplitMeta) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> { f_OwnerIndex_oiDef = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (meta).Driver_dOwner.f_SplitMeta_smDefOwners); f_OwnerIndex_oiData = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (meta).Driver_dOwner.f_SplitMeta_smDataOwners); f_OwnerIndex_oiCtor = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_ctorFamilyPairs datas)); f_OwnerIndex_oiKnown = (meta).Driver_dOwner.f_SplitMeta_smKnownModules })

# 605 "Vuna/Compiler/Driver/Iface.vuna"
let v_bucketOf = (fun (name : string) tbl -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> dtb__81
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 598 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_partitionByOwnerGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match (mc0 dtb__82) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_partitionByOwnerGo mc0) dtb__83) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> (((v_partitionByOwnerGo mc0) dtb__83) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__84) (B_dData_dList.C_List__x58__x58_ (dtb__82, ((v_bucketOf dtb__84) mc2)))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 614 "Vuna/Compiler/Driver/Iface.vuna"
let v_reverseBucket = (fun mc0 -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__85; B_dData_dPair.f_Pair_second = dtb__86 } -> { B_dData_dPair.f_Pair_first = dtb__85; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb__86) }
  | _ -> failwith "DT: impossible branch"
))

# 611 "Vuna/Compiler/Driver/Iface.vuna"
let v_reverseBuckets = (fun tbl -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_reverseBucket) (B_dContainer_dHashMap.v_toList tbl))))

# 595 "Vuna/Compiler/Driver/Iface.vuna"
let v_partitionByOwner = (fun ownerOf xs -> (v_reverseBuckets (((v_partitionByOwnerGo ownerOf) xs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))))

# 617 "Vuna/Compiler/Driver/Iface.vuna"
let v_progPartsOf = (fun (oi : t_OwnerIndex) (prog : Elab_dTypes.t_DtProgram) -> { f_ProgParts_ppSols = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Elab_dTypes.v_dtProgSols prog)); f_ProgParts_ppDatas = ((v_partitionByOwner (fun (d : Elab_dTypes.t_DtData) -> ((v_dataOwnerOf oi) (Elab_dTypes.v_dtDataName d)))) (Elab_dTypes.v_dtProgDatas prog)); f_ProgParts_ppDefs = ((v_partitionByOwner (fun (d : Elab_dTypes.t_DtDef) -> ((v_defOwnerOf oi) (Elab_dTypes.v_dtDefName d)))) (Elab_dTypes.v_dtProgDefs prog)); f_ProgParts_ppGlobals = ((v_partitionByOwner (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> ((v_globalOwnerOf oi) (B_dData_dPair.v_firstOf p)))) (Elab_dTypes.v_dtProgGlobals prog)); f_ProgParts_ppInsts = ((v_partitionByOwner (fun (i : Elab_dTypes.t_DtInst) -> ((v_defOwnerOf oi) (Elab_dTypes.v_dtInstSym i)))) (Elab_dTypes.v_dtProgInsts prog)); f_ProgParts_ppClasses = ((v_partitionByOwner (fun (c : Elab_dTypes.t_DtClass) -> ((v_defOwnerOf oi) (Elab_dTypes.v_dtClassName c)))) (Elab_dTypes.v_dtProgClasses prog)) })

# 629 "Vuna/Compiler/Driver/Iface.vuna"
let v_cpOfModule = (fun (parts : t_ProgParts) (prog : Elab_dTypes.t_DtProgram) (mod_ : string) (opaqueNames : string B_dData_dList.t_List) -> (let datas = ((v_bucketOf mod_) (parts).f_ProgParts_ppDatas) in (let defs = ((v_bucketOf mod_) (parts).f_ProgParts_ppDefs) in (let globals = ((v_bucketOf mod_) (parts).f_ProgParts_ppGlobals) in (let insts = ((v_bucketOf mod_) (parts).f_ProgParts_ppInsts) in (let classes = ((v_bucketOf mod_) (parts).f_ProgParts_ppClasses) in (let slice = { Elab_dTypes.f_DtProgram_dtProgDatas = datas; Elab_dTypes.f_DtProgram_dtProgDefs = defs; Elab_dTypes.f_DtProgram_dtProgGoals = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = globals; Elab_dTypes.f_DtProgram_dtProgInsts = insts; Elab_dTypes.f_DtProgram_dtProgClasses = classes; Elab_dTypes.f_DtProgram_dtProgNext = 0; Elab_dTypes.f_DtProgram_dtProgDepths = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtProgram_dtProgWarnings = B_dData_dList.C_List_Nil } in ((Driver_dCache.v_withCachedOpaque opaqueNames) ((Driver_dCache.v_cachedOfProgramWith (parts).f_ProgParts_ppSols) slice)))))))))

# 640 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_sourceOf = (fun (mc0 : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (match dtb__87 with
  | { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__90 } -> (if (dtb__89 = mc1) then dtb__90 else ((v_sourceOf dtb__88) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_SourceInfo_siPath = ""; f_SourceInfo_siHash = ""; f_SourceInfo_siMtime = 0; f_SourceInfo_siSize = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Driver/Iface.vuna"
let v_importNameOf = (fun (imp : Frontend_dAst.t_Import) -> (imp).Frontend_dAst.f_Import_importName)

# 647 "Vuna/Compiler/Driver/Iface.vuna"
let v_importNamesOfModule = (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_importNameOf) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 652 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_hasMissingDep = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__93; B_dData_dPair.f_Pair_second = dtb__94 } -> (if (dtb__94 = v_depMissingHash) then true else (v_hasMissingDep dtb__92))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 656 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOfImportName = (fun (tbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match ((B_dData_dList.v_lookupPair name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> dtb__95
  | B_dData_dMaybe.C_Maybe_Nothing -> v_depMissingHash
  | _ -> failwith "DT: impossible branch"
))

# 662 "Vuna/Compiler/Driver/Iface.vuna"
let v_depHashesOf = (fun (tbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = ((v_hashOfImportName tbl) n) })) (v_importNamesOfModule m)))

# 665 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_cleanIfaceOf = (fun (mc0 : t_ModuleIface B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (if ((v_miNameOf dtb__96) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__96)) else ((v_cleanIfaceOf dtb__97) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Driver/Iface.vuna"
let v_mkIfaceBase = (fun (pkg : string) (parts : t_ProgParts) (prog : Elab_dTypes.t_DtProgram) (sources : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (norm : (string) -> string) (m : Loader_dModules.t_Module) -> (match ((v_cleanIfaceOf clean) (Loader_dModules.v_moduleNameOf m)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> dtb__98
  | B_dData_dMaybe.C_Maybe_Nothing -> (let name = (Loader_dModules.v_moduleNameOf m) in (let cp = ((((v_cpOfModule parts) prog) name) (Loader_dModules.v_moduleOpaqueOf m)) in (let records = (Elab_dRecords.v_recordsOfDecls (m).Loader_dModules.f_Module_moduleDeclsOf) in (let h = (((((((((v_moduleHashes name) pkg) (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf) (m).Loader_dModules.f_Module_moduleFixitiesOf) records) (m).Loader_dModules.f_Module_moduleExportsOf) (m).Loader_dModules.f_Module_moduleDeclsOf) cp) in { f_ModuleIface_miName = name; f_ModuleIface_miPackage = pkg; f_ModuleIface_miSource = ((v_sourceOf sources) name); f_ModuleIface_miIfaceHash = h; f_ModuleIface_miDepHashes = B_dData_dList.C_List_Nil; f_ModuleIface_miImports = (m).Loader_dModules.f_Module_moduleImportsOf; f_ModuleIface_miImplicitImports = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; f_ModuleIface_miExports = (m).Loader_dModules.f_Module_moduleExportsOf; f_ModuleIface_miFixities = (m).Loader_dModules.f_Module_moduleFixitiesOf; f_ModuleIface_miDecls = (m).Loader_dModules.f_Module_moduleDeclsOf; f_ModuleIface_miRecords = records; f_ModuleIface_miPrepared = B_dData_dList.C_List_Nil; f_ModuleIface_miCached = cp; f_ModuleIface_miDefLocs = ((v_defLocsOfDefs norm) (Driver_dCache.v_cachedDefs cp)) }))))
  | _ -> failwith "DT: impossible branch"
))

# 710 "Vuna/Compiler/Driver/Iface.vuna"
let v_finishIface = (fun (tbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (m : Loader_dModules.t_Module) (mi : t_ModuleIface) -> (match ((v_cleanIfaceOf clean) (v_miNameOf mi)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__99) -> dtb__99
  | B_dData_dMaybe.C_Maybe_Nothing -> { f_ModuleIface_miName = (v_miNameOf mi); f_ModuleIface_miPackage = (v_miPackageOf mi); f_ModuleIface_miSource = (v_miSourceOf mi); f_ModuleIface_miIfaceHash = (v_miIfaceHashOf mi); f_ModuleIface_miDepHashes = ((v_depHashesOf tbl) m); f_ModuleIface_miImports = (v_miImportsOf mi); f_ModuleIface_miImplicitImports = (v_miImplicitImportsOf mi); f_ModuleIface_miExports = (v_miExportsOf mi); f_ModuleIface_miFixities = (v_miFixitiesOf mi); f_ModuleIface_miDecls = (v_miDeclsOf mi); f_ModuleIface_miRecords = (v_miRecordsOf mi); f_ModuleIface_miPrepared = (v_miPreparedOf mi); f_ModuleIface_miCached = (v_miCachedOf mi); f_ModuleIface_miDefLocs = (v_miDefLocsOf mi) }
  | _ -> failwith "DT: impossible branch"
))

# 731 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifacesGo = (fun (pkg : string) (parts : t_ProgParts) (prog : Elab_dTypes.t_DtProgram) (sources : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (knownDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (norm : (string) -> string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) -> (let built = ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = (((((((v_mkIfaceBase pkg) parts) prog) sources) clean) norm) m) })) modules) in (let hashes = ((B_dData_dList.v_map (fun (p : (Loader_dModules.t_Module, t_ModuleIface) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (v_miNameOf (B_dData_dPair.v_secondOf p)); B_dData_dPair.f_Pair_second = (v_miIfaceHashOf (B_dData_dPair.v_secondOf p)) })) built) in (let fullTbl = ((B_dData_dList.v_append knownDeps) hashes) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (fun (p : (Loader_dModules.t_Module, t_ModuleIface) B_dData_dPair.t_Pair) -> ((((v_finishIface fullTbl) clean) (B_dData_dPair.v_firstOf p)) (B_dData_dPair.v_secondOf p)))) built); B_dData_dPair.f_Pair_second = fullTbl }))))

# 744 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownerOfAny = (fun (oi : t_OwnerIndex) (name : string) -> (match ((v_defOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> (B_dData_dMaybe.C_Maybe_Just (dtb__100))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_dataOwnerOf oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__101) -> (B_dData_dMaybe.C_Maybe_Just (dtb__101))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorOwnerOf oi) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Driver/Iface.vuna"
let v_coverageIssueOf = (fun (oi : t_OwnerIndex) (ourNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (inherited : (string, bool) B_dContainer_dHashMap.t_HashMap) (merged : (string, bool) B_dContainer_dHashMap.t_HashMap) (prelude : (string, bool) B_dContainer_dHashMap.t_HashMap) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) prelude) then "" else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) inherited) then "" else (match ((v_ownerOfAny oi) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (if (dtb__102 = Driver_dOwner.v_entryOwner) then "" else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__102) ourNames) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) merged) then "" else (String.concat "" ["missing-from-iface "; name; " -> "; dtb__102])) else ""))
  | B_dData_dMaybe.C_Maybe_Nothing -> ("unowned " ^ name)
  | _ -> failwith "DT: impossible branch"
))))

# 764 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_coverageIssueGo = (fun (mc0 : t_OwnerIndex) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc5 : string B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (let issue = ((((((v_coverageIssueOf mc0) mc1) mc2) mc3) mc4) dtb__103) in (if (issue = "") then ((((((v_coverageIssueGo mc0) mc1) mc2) mc3) mc4) dtb__104) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 771 "Vuna/Compiler/Driver/Iface.vuna"
let v_isSealName = (fun (n : string) -> ((B_dData_dString.v_startsWith "vuna_seal_") n))

# 774 "Vuna/Compiler/Driver/Iface.vuna"
let v_artifactNamesOf = (fun (prog : Elab_dTypes.t_DtProgram) -> ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not (v_isSealName n)))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Elab_dTypes.v_dtProgDatas prog))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Elab_dTypes.v_dtProgDefs prog))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstSym) (Elab_dTypes.v_dtProgInsts prog))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Elab_dTypes.v_dtProgClasses prog))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Elab_dTypes.v_dtProgGlobals prog))))))))

# 781 "Vuna/Compiler/Driver/Iface.vuna"
let v_dataNamesOf = (fun (cp : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Driver_dCache.v_cachedDatas cp)))

# 784 "Vuna/Compiler/Driver/Iface.vuna"
let v_ctorNamesOf = (fun (cp : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) (Driver_dCache.v_cachedDatas cp)))

# 787 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceNamesOf = (fun (m : t_ModuleIface) -> (let cp = (v_miCachedOf m) in ((B_dData_dList.v_append (v_dataNamesOf cp)) ((B_dData_dList.v_append (v_ctorNamesOf cp)) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstSym) (Driver_dCache.v_cachedInsts cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Driver_dCache.v_cachedClasses cp))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Driver_dCache.v_cachedGlobals cp)))))))))

# 795 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceArtifactNames = (fun (ifaces : t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_ifaceNamesOf) ifaces))

# 798 "Vuna/Compiler/Driver/Iface.vuna"
let v_firstCoverageIssue = (fun (oi : t_OwnerIndex) (ourNames : string B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (ifaces : t_ModuleIface B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) -> (let merged = (v_ifaceArtifactNames ifaces) in (let mergedTbl = (B_dContainer_dHashMap.v_ofNames merged) in (let ourTbl = (B_dContainer_dHashMap.v_ofNames ourNames) in (let inhTbl = (B_dContainer_dHashMap.v_ofNames inherited) in (let preludeTbl = (B_dContainer_dHashMap.v_ofNames v_ifacePreludeNames) in (let issue = ((((((v_coverageIssueGo oi) ourTbl) inhTbl) mergedTbl) preludeTbl) (v_artifactNamesOf prog)) in (if (issue = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (issue))))))))))

# 814 "Vuna/Compiler/Driver/Iface.vuna"
let v_coverageResult = (fun (oi : t_OwnerIndex) (ourNames : string B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (ifaces : t_ModuleIface B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) -> (match (((((v_firstCoverageIssue oi) ourNames) inherited) ifaces) prog) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (Base_dDiag.v_icInternal ("iface: " ^ dtb__105))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ifaces))
  | _ -> failwith "DT: impossible branch"
))

# 820 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceOfPackage = (fun (pkg : string) (sources : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (knownDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (norm : (string) -> string) -> (let ourModules = (B_dData_dList.v_reverse ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) modules)) in (let declModules = ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules) in (let meta = ((Driver_dOwner.v_splitMetaOf declModules) entryDecls) in (let oi = ((v_ownerIndexOf meta) (Elab_dTypes.v_dtProgDatas prog)) in (let parts = ((v_progPartsOf oi) prog) in (let ourNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ourModules) in (match ((((((((v_ifacesGo pkg) parts) prog) sources) knownDeps) clean) norm) ourModules) with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (((((v_coverageResult oi) ourNames) inherited) dtb__106) prog)
  | _ -> failwith "DT: impossible branch"
))))))))

# 841 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_findNamedModule = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (if ((Loader_dModules.v_moduleNameOf dtb__108) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__108)) else ((v_findNamedModule dtb__109) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 848 "Vuna/Compiler/Driver/Iface.vuna"
let v_sameOwner = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> (dtb__110 = mc0)
  | _ -> failwith "DT: impossible branch"
))

# 852 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownedByModule = (fun (oi : t_OwnerIndex) (name : string) (artifact : string) -> ((v_sameOwner name) ((v_globalOwnerOf oi) artifact)))

# 861 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_allOwnedPresent = (fun (mc0 : t_OwnerIndex) (mc1 : string B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (let skip = (if ((B_dData_dList.v_memName dtb__111) mc1) then true else (B_dData_dBool.v_not (((v_ownedByModule mc0) mc2) dtb__111))) in (if skip then (((((v_allOwnedPresent mc0) mc1) mc2) dtb__112) mc4) else (if ((B_dData_dList.v_memName dtb__111) mc4) then (((((v_allOwnedPresent mc0) mc1) mc2) dtb__112) mc4) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 855 "Vuna/Compiler/Driver/Iface.vuna"
let v_moduleCoverageOk = (fun (oi : t_OwnerIndex) (inherited : string B_dData_dList.t_List) (name : string) (prog : Elab_dTypes.t_DtProgram) (mi : t_ModuleIface) -> (let present = (v_ifaceNamesOf mi) in (((((v_allOwnedPresent oi) inherited) name) (v_artifactNamesOf prog)) present)))

# 871 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceOfModule = (fun (pkg : string) (si : t_SourceInfo) (knownDeps : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (inherited : string B_dData_dList.t_List) (clean : t_ModuleIface B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (norm : (string) -> string) (name : string) -> (let ourModules = (B_dData_dList.v_reverse ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) modules)) in (let declModules = ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules) in (let meta = ((Driver_dOwner.v_splitMetaOf declModules) entryDecls) in (let oi = ((v_ownerIndexOf meta) (Elab_dTypes.v_dtProgDatas prog)) in (let parts = ((v_progPartsOf oi) prog) in (let ourNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ourModules) in (match ((v_findNamedModule ourModules) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["iface: module "; name; " is not part of the checked package"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (let mi0 = (((((((v_mkIfaceBase pkg) parts) prog) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = si }, B_dData_dList.C_List_Nil))) B_dData_dList.C_List_Nil) norm) dtb__113) in (let tbl = ((B_dData_dList.v_append knownDeps) ((B_dData_dList.v_map (fun (x : t_ModuleIface) -> { B_dData_dPair.f_Pair_first = (v_miNameOf x); B_dData_dPair.f_Pair_second = (v_miIfaceHashOf x) })) ((B_dData_dList.v_append clean) (B_dData_dList.C_List__x58__x58_ (mi0, B_dData_dList.C_List_Nil))))) in (let mi = ((((v_finishIface tbl) B_dData_dList.C_List_Nil) dtb__113) mi0) in (let miP = (match (((v_preparedForModule ourModules) entryDecls) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> mi
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> ((v_setPrepared dtb__114) mi)
  | _ -> failwith "DT: impossible branch"
) in (if (((((v_moduleCoverageOk oi) inherited) name) prog) miP) then (Base_dDiag.C_Check_OkC (miP)) else (Base_dDiag.v_icInternal (String.concat "" ["iface: module "; name; " has uncovered artifacts"])))))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 896 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_moduleNamesOf = (fun (mc0 : t_ModuleIface B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (B_dData_dList.C_List__x58__x58_ ((v_miNameOf dtb__115), (v_moduleNamesOf dtb__116)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Driver/Iface.vuna"
let v_encSourceInfo = (fun (s : t_SourceInfo) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (s).f_SourceInfo_siPath) ((Base_dBytes.v_encStr (s).f_SourceInfo_siHash) ((Base_dBytes.v_encInt (s).f_SourceInfo_siMtime) ((Base_dBytes.v_encInt (s).f_SourceInfo_siSize) acc)))))

# 904 "Vuna/Compiler/Driver/Iface.vuna"
let v_decSourceInfo = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (path : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (hash : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (mtime : int) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b3)) (fun (size : int) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_SourceInfo_siPath = path; f_SourceInfo_siHash = hash; f_SourceInfo_siMtime = mtime; f_SourceInfo_siSize = size }; B_dData_dPair.f_Pair_second = b4 })))))))))))

# 910 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDepPair = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__117; B_dData_dPair.f_Pair_second = dtb__118 } -> ((Base_dBytes.v_encStr dtb__117) ((Base_dBytes.v_encStr dtb__118) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 913 "Vuna/Compiler/Driver/Iface.vuna"
let v_decDepPair = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (n : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (h : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = h }; B_dData_dPair.f_Pair_second = b2 })))))))

# 920 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDefLoc = (fun (mc0 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> (match dtb__120 with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> ((Base_dBytes.v_encStr dtb__119) ((Base_dBytes.v_encStr dtb__121) ((Base_dBytes.v_encInt dtb__122) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 923 "Vuna/Compiler/Driver/Iface.vuna"
let v_decDefLoc = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (name : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (file : string) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (line : int) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = file; B_dData_dPair.f_Pair_second = line } }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 930 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIfacePayload = (fun (m : t_ModuleIface) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (m).f_ModuleIface_miName) ((Base_dBytes.v_encStr (m).f_ModuleIface_miPackage) ((v_encSourceInfo (m).f_ModuleIface_miSource) ((Base_dBytes.v_encStr (m).f_ModuleIface_miIfaceHash) (((Base_dBytes.v_encList v_encDepPair) (m).f_ModuleIface_miDepHashes) (((Base_dBytes.v_encList Elab_dCanonical.v_encImport) (m).f_ModuleIface_miImports) (((Base_dBytes.v_encList Elab_dCanonical.v_encImport) (m).f_ModuleIface_miImplicitImports) (((Base_dBytes.v_encList Elab_dCanonical.v_encExportEntry) (m).f_ModuleIface_miExports) (((Base_dBytes.v_encList Elab_dCanonical.v_encFixity) (m).f_ModuleIface_miFixities) (((Base_dBytes.v_encList Frontend_dCanonical_dAst.v_encDecl) (m).f_ModuleIface_miDecls) (((Base_dBytes.v_encList Elab_dCanonical.v_encRecordMeta) (m).f_ModuleIface_miRecords) (((Base_dBytes.v_encList Frontend_dCanonical_dAst.v_encDecl) (m).f_ModuleIface_miPrepared) ((Driver_dCache.v_encCachedProgram (m).f_ModuleIface_miCached) (((Base_dBytes.v_encList v_encDefLoc) (m).f_ModuleIface_miDefLocs) acc)))))))))))))))

# 937 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIfaceAt = v_encModuleIfacePayload

# 940 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIface = (fun (m : t_ModuleIface) -> ((Base_dBytes.v_encTop v_encModuleIfacePayload) m))

# 946 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfacePayload = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun p1 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Base_dBytes.v_decStr (fuel - 1)) (B_dData_dPair.v_secondOf p1))) (fun p2 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((v_decSourceInfo (fuel - 1)) (B_dData_dPair.v_secondOf p2))) (fun p3 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Base_dBytes.v_decStr (fuel - 1)) (B_dData_dPair.v_secondOf p3))) (fun p4 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList v_decDepPair) (fuel - 1)) (B_dData_dPair.v_secondOf p4))) (fun p5 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decImport) (fuel - 1)) (B_dData_dPair.v_secondOf p5))) (fun p6 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decImport) (fuel - 1)) (B_dData_dPair.v_secondOf p6))) (fun p7 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decExportEntry) (fuel - 1)) (B_dData_dPair.v_secondOf p7))) (fun p8 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decFixity) (fuel - 1)) (B_dData_dPair.v_secondOf p8))) (fun p9 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Frontend_dCanonical_dAst.v_decDecl) (fuel - 1)) (B_dData_dPair.v_secondOf p9))) (fun p10 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decRecordMeta) (fuel - 1)) (B_dData_dPair.v_secondOf p10))) (fun p11 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Frontend_dCanonical_dAst.v_decDecl) (fuel - 1)) (B_dData_dPair.v_secondOf p11))) (fun p12 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Driver_dCache.v_decCachedProgram (fuel - 1)) (B_dData_dPair.v_secondOf p12))) (fun p13 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList v_decDefLoc) (fuel - 1)) (B_dData_dPair.v_secondOf p13))) (fun p14 -> ((B_dTrait_dApplicative.v_pure B_dData_dMaybe.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) { B_dData_dPair.f_Pair_first = { f_ModuleIface_miName = (B_dData_dPair.v_firstOf p1); f_ModuleIface_miPackage = (B_dData_dPair.v_firstOf p2); f_ModuleIface_miSource = (B_dData_dPair.v_firstOf p3); f_ModuleIface_miIfaceHash = (B_dData_dPair.v_firstOf p4); f_ModuleIface_miDepHashes = (B_dData_dPair.v_firstOf p5); f_ModuleIface_miImports = (B_dData_dPair.v_firstOf p6); f_ModuleIface_miImplicitImports = (B_dData_dPair.v_firstOf p7); f_ModuleIface_miExports = (B_dData_dPair.v_firstOf p8); f_ModuleIface_miFixities = (B_dData_dPair.v_firstOf p9); f_ModuleIface_miDecls = (B_dData_dPair.v_firstOf p10); f_ModuleIface_miRecords = (B_dData_dPair.v_firstOf p11); f_ModuleIface_miPrepared = (B_dData_dPair.v_firstOf p12); f_ModuleIface_miCached = (B_dData_dPair.v_firstOf p13); f_ModuleIface_miDefLocs = (B_dData_dPair.v_firstOf p14) }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p14) }))))))))))))))))))))))))))))))

# 943 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfaceAt = v_decModuleIfacePayload

# 966 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfaceComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decModuleIfacePayload (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (match dtb__123 with
  | { B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = dtb__125 } -> (if (Base_dBytes.v_curAtEnd dtb__125) then (B_dData_dMaybe.C_Maybe_Just (dtb__124)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 59 "Vuna/Compiler/Driver/Iface.vuna"
let v_siPath = (fun (p : t_SourceInfo) -> (match p with
  | { f_SourceInfo_siPath = dtb__126; f_SourceInfo_siHash = dtb__127; f_SourceInfo_siMtime = dtb__128; f_SourceInfo_siSize = dtb__129 } -> dtb__126
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Driver/Iface.vuna"
let v_siHash = (fun (p : t_SourceInfo) -> (match p with
  | { f_SourceInfo_siPath = dtb__130; f_SourceInfo_siHash = dtb__131; f_SourceInfo_siMtime = dtb__132; f_SourceInfo_siSize = dtb__133 } -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Driver/Iface.vuna"
let v_siMtime = (fun (p : t_SourceInfo) -> (match p with
  | { f_SourceInfo_siPath = dtb__134; f_SourceInfo_siHash = dtb__135; f_SourceInfo_siMtime = dtb__136; f_SourceInfo_siSize = dtb__137 } -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Driver/Iface.vuna"
let v_siSize = (fun (p : t_SourceInfo) -> (match p with
  | { f_SourceInfo_siPath = dtb__138; f_SourceInfo_siHash = dtb__139; f_SourceInfo_siMtime = dtb__140; f_SourceInfo_siSize = dtb__141 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Driver/Iface.vuna"
let v_miName = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__142; f_ModuleIface_miPackage = dtb__143; f_ModuleIface_miSource = dtb__144; f_ModuleIface_miIfaceHash = dtb__145; f_ModuleIface_miDepHashes = dtb__146; f_ModuleIface_miImports = dtb__147; f_ModuleIface_miImplicitImports = dtb__148; f_ModuleIface_miExports = dtb__149; f_ModuleIface_miFixities = dtb__150; f_ModuleIface_miDecls = dtb__151; f_ModuleIface_miRecords = dtb__152; f_ModuleIface_miPrepared = dtb__153; f_ModuleIface_miCached = dtb__154; f_ModuleIface_miDefLocs = dtb__155 } -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPackage = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__156; f_ModuleIface_miPackage = dtb__157; f_ModuleIface_miSource = dtb__158; f_ModuleIface_miIfaceHash = dtb__159; f_ModuleIface_miDepHashes = dtb__160; f_ModuleIface_miImports = dtb__161; f_ModuleIface_miImplicitImports = dtb__162; f_ModuleIface_miExports = dtb__163; f_ModuleIface_miFixities = dtb__164; f_ModuleIface_miDecls = dtb__165; f_ModuleIface_miRecords = dtb__166; f_ModuleIface_miPrepared = dtb__167; f_ModuleIface_miCached = dtb__168; f_ModuleIface_miDefLocs = dtb__169 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Driver/Iface.vuna"
let v_miSource = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__170; f_ModuleIface_miPackage = dtb__171; f_ModuleIface_miSource = dtb__172; f_ModuleIface_miIfaceHash = dtb__173; f_ModuleIface_miDepHashes = dtb__174; f_ModuleIface_miImports = dtb__175; f_ModuleIface_miImplicitImports = dtb__176; f_ModuleIface_miExports = dtb__177; f_ModuleIface_miFixities = dtb__178; f_ModuleIface_miDecls = dtb__179; f_ModuleIface_miRecords = dtb__180; f_ModuleIface_miPrepared = dtb__181; f_ModuleIface_miCached = dtb__182; f_ModuleIface_miDefLocs = dtb__183 } -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Driver/Iface.vuna"
let v_miIfaceHash = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__184; f_ModuleIface_miPackage = dtb__185; f_ModuleIface_miSource = dtb__186; f_ModuleIface_miIfaceHash = dtb__187; f_ModuleIface_miDepHashes = dtb__188; f_ModuleIface_miImports = dtb__189; f_ModuleIface_miImplicitImports = dtb__190; f_ModuleIface_miExports = dtb__191; f_ModuleIface_miFixities = dtb__192; f_ModuleIface_miDecls = dtb__193; f_ModuleIface_miRecords = dtb__194; f_ModuleIface_miPrepared = dtb__195; f_ModuleIface_miCached = dtb__196; f_ModuleIface_miDefLocs = dtb__197 } -> dtb__187
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDepHashes = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__198; f_ModuleIface_miPackage = dtb__199; f_ModuleIface_miSource = dtb__200; f_ModuleIface_miIfaceHash = dtb__201; f_ModuleIface_miDepHashes = dtb__202; f_ModuleIface_miImports = dtb__203; f_ModuleIface_miImplicitImports = dtb__204; f_ModuleIface_miExports = dtb__205; f_ModuleIface_miFixities = dtb__206; f_ModuleIface_miDecls = dtb__207; f_ModuleIface_miRecords = dtb__208; f_ModuleIface_miPrepared = dtb__209; f_ModuleIface_miCached = dtb__210; f_ModuleIface_miDefLocs = dtb__211 } -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImports = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__212; f_ModuleIface_miPackage = dtb__213; f_ModuleIface_miSource = dtb__214; f_ModuleIface_miIfaceHash = dtb__215; f_ModuleIface_miDepHashes = dtb__216; f_ModuleIface_miImports = dtb__217; f_ModuleIface_miImplicitImports = dtb__218; f_ModuleIface_miExports = dtb__219; f_ModuleIface_miFixities = dtb__220; f_ModuleIface_miDecls = dtb__221; f_ModuleIface_miRecords = dtb__222; f_ModuleIface_miPrepared = dtb__223; f_ModuleIface_miCached = dtb__224; f_ModuleIface_miDefLocs = dtb__225 } -> dtb__217
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImplicitImports = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__226; f_ModuleIface_miPackage = dtb__227; f_ModuleIface_miSource = dtb__228; f_ModuleIface_miIfaceHash = dtb__229; f_ModuleIface_miDepHashes = dtb__230; f_ModuleIface_miImports = dtb__231; f_ModuleIface_miImplicitImports = dtb__232; f_ModuleIface_miExports = dtb__233; f_ModuleIface_miFixities = dtb__234; f_ModuleIface_miDecls = dtb__235; f_ModuleIface_miRecords = dtb__236; f_ModuleIface_miPrepared = dtb__237; f_ModuleIface_miCached = dtb__238; f_ModuleIface_miDefLocs = dtb__239 } -> dtb__232
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Iface.vuna"
let v_miExports = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__240; f_ModuleIface_miPackage = dtb__241; f_ModuleIface_miSource = dtb__242; f_ModuleIface_miIfaceHash = dtb__243; f_ModuleIface_miDepHashes = dtb__244; f_ModuleIface_miImports = dtb__245; f_ModuleIface_miImplicitImports = dtb__246; f_ModuleIface_miExports = dtb__247; f_ModuleIface_miFixities = dtb__248; f_ModuleIface_miDecls = dtb__249; f_ModuleIface_miRecords = dtb__250; f_ModuleIface_miPrepared = dtb__251; f_ModuleIface_miCached = dtb__252; f_ModuleIface_miDefLocs = dtb__253 } -> dtb__247
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Driver/Iface.vuna"
let v_miFixities = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__254; f_ModuleIface_miPackage = dtb__255; f_ModuleIface_miSource = dtb__256; f_ModuleIface_miIfaceHash = dtb__257; f_ModuleIface_miDepHashes = dtb__258; f_ModuleIface_miImports = dtb__259; f_ModuleIface_miImplicitImports = dtb__260; f_ModuleIface_miExports = dtb__261; f_ModuleIface_miFixities = dtb__262; f_ModuleIface_miDecls = dtb__263; f_ModuleIface_miRecords = dtb__264; f_ModuleIface_miPrepared = dtb__265; f_ModuleIface_miCached = dtb__266; f_ModuleIface_miDefLocs = dtb__267 } -> dtb__262
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDecls = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__268; f_ModuleIface_miPackage = dtb__269; f_ModuleIface_miSource = dtb__270; f_ModuleIface_miIfaceHash = dtb__271; f_ModuleIface_miDepHashes = dtb__272; f_ModuleIface_miImports = dtb__273; f_ModuleIface_miImplicitImports = dtb__274; f_ModuleIface_miExports = dtb__275; f_ModuleIface_miFixities = dtb__276; f_ModuleIface_miDecls = dtb__277; f_ModuleIface_miRecords = dtb__278; f_ModuleIface_miPrepared = dtb__279; f_ModuleIface_miCached = dtb__280; f_ModuleIface_miDefLocs = dtb__281 } -> dtb__277
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/Iface.vuna"
let v_miRecords = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__282; f_ModuleIface_miPackage = dtb__283; f_ModuleIface_miSource = dtb__284; f_ModuleIface_miIfaceHash = dtb__285; f_ModuleIface_miDepHashes = dtb__286; f_ModuleIface_miImports = dtb__287; f_ModuleIface_miImplicitImports = dtb__288; f_ModuleIface_miExports = dtb__289; f_ModuleIface_miFixities = dtb__290; f_ModuleIface_miDecls = dtb__291; f_ModuleIface_miRecords = dtb__292; f_ModuleIface_miPrepared = dtb__293; f_ModuleIface_miCached = dtb__294; f_ModuleIface_miDefLocs = dtb__295 } -> dtb__292
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPrepared = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__296; f_ModuleIface_miPackage = dtb__297; f_ModuleIface_miSource = dtb__298; f_ModuleIface_miIfaceHash = dtb__299; f_ModuleIface_miDepHashes = dtb__300; f_ModuleIface_miImports = dtb__301; f_ModuleIface_miImplicitImports = dtb__302; f_ModuleIface_miExports = dtb__303; f_ModuleIface_miFixities = dtb__304; f_ModuleIface_miDecls = dtb__305; f_ModuleIface_miRecords = dtb__306; f_ModuleIface_miPrepared = dtb__307; f_ModuleIface_miCached = dtb__308; f_ModuleIface_miDefLocs = dtb__309 } -> dtb__307
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/Iface.vuna"
let v_miCached = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__310; f_ModuleIface_miPackage = dtb__311; f_ModuleIface_miSource = dtb__312; f_ModuleIface_miIfaceHash = dtb__313; f_ModuleIface_miDepHashes = dtb__314; f_ModuleIface_miImports = dtb__315; f_ModuleIface_miImplicitImports = dtb__316; f_ModuleIface_miExports = dtb__317; f_ModuleIface_miFixities = dtb__318; f_ModuleIface_miDecls = dtb__319; f_ModuleIface_miRecords = dtb__320; f_ModuleIface_miPrepared = dtb__321; f_ModuleIface_miCached = dtb__322; f_ModuleIface_miDefLocs = dtb__323 } -> dtb__322
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDefLocs = (fun (p : t_ModuleIface) -> (match p with
  | { f_ModuleIface_miName = dtb__324; f_ModuleIface_miPackage = dtb__325; f_ModuleIface_miSource = dtb__326; f_ModuleIface_miIfaceHash = dtb__327; f_ModuleIface_miDepHashes = dtb__328; f_ModuleIface_miImports = dtb__329; f_ModuleIface_miImplicitImports = dtb__330; f_ModuleIface_miExports = dtb__331; f_ModuleIface_miFixities = dtb__332; f_ModuleIface_miDecls = dtb__333; f_ModuleIface_miRecords = dtb__334; f_ModuleIface_miPrepared = dtb__335; f_ModuleIface_miCached = dtb__336; f_ModuleIface_miDefLocs = dtb__337 } -> dtb__337
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Driver/Iface.vuna"
let v_csNext = (fun (p : t_CanonState) -> (match p with
  | { f_CanonState_csNext = dtb__338; f_CanonState_csMap = dtb__339 } -> dtb__338
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Driver/Iface.vuna"
let v_csMap = (fun (p : t_CanonState) -> (match p with
  | { f_CanonState_csNext = dtb__340; f_CanonState_csMap = dtb__341 } -> dtb__341
  | _ -> failwith "DT: impossible branch"
))

# 516 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiDef = (fun (p : t_OwnerIndex) -> (match p with
  | { f_OwnerIndex_oiDef = dtb__342; f_OwnerIndex_oiData = dtb__343; f_OwnerIndex_oiCtor = dtb__344; f_OwnerIndex_oiKnown = dtb__345 } -> dtb__342
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiData = (fun (p : t_OwnerIndex) -> (match p with
  | { f_OwnerIndex_oiDef = dtb__346; f_OwnerIndex_oiData = dtb__347; f_OwnerIndex_oiCtor = dtb__348; f_OwnerIndex_oiKnown = dtb__349 } -> dtb__347
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiCtor = (fun (p : t_OwnerIndex) -> (match p with
  | { f_OwnerIndex_oiDef = dtb__350; f_OwnerIndex_oiData = dtb__351; f_OwnerIndex_oiCtor = dtb__352; f_OwnerIndex_oiKnown = dtb__353 } -> dtb__352
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiKnown = (fun (p : t_OwnerIndex) -> (match p with
  | { f_OwnerIndex_oiDef = dtb__354; f_OwnerIndex_oiData = dtb__355; f_OwnerIndex_oiCtor = dtb__356; f_OwnerIndex_oiKnown = dtb__357 } -> dtb__357
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppSols = (fun (p : t_ProgParts) -> (match p with
  | { f_ProgParts_ppSols = dtb__358; f_ProgParts_ppDatas = dtb__359; f_ProgParts_ppDefs = dtb__360; f_ProgParts_ppGlobals = dtb__361; f_ProgParts_ppInsts = dtb__362; f_ProgParts_ppClasses = dtb__363 } -> dtb__358
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppDatas = (fun (p : t_ProgParts) -> (match p with
  | { f_ProgParts_ppSols = dtb__364; f_ProgParts_ppDatas = dtb__365; f_ProgParts_ppDefs = dtb__366; f_ProgParts_ppGlobals = dtb__367; f_ProgParts_ppInsts = dtb__368; f_ProgParts_ppClasses = dtb__369 } -> dtb__365
  | _ -> failwith "DT: impossible branch"
))

# 589 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppDefs = (fun (p : t_ProgParts) -> (match p with
  | { f_ProgParts_ppSols = dtb__370; f_ProgParts_ppDatas = dtb__371; f_ProgParts_ppDefs = dtb__372; f_ProgParts_ppGlobals = dtb__373; f_ProgParts_ppInsts = dtb__374; f_ProgParts_ppClasses = dtb__375 } -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppGlobals = (fun (p : t_ProgParts) -> (match p with
  | { f_ProgParts_ppSols = dtb__376; f_ProgParts_ppDatas = dtb__377; f_ProgParts_ppDefs = dtb__378; f_ProgParts_ppGlobals = dtb__379; f_ProgParts_ppInsts = dtb__380; f_ProgParts_ppClasses = dtb__381 } -> dtb__379
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppInsts = (fun (p : t_ProgParts) -> (match p with
  | { f_ProgParts_ppSols = dtb__382; f_ProgParts_ppDatas = dtb__383; f_ProgParts_ppDefs = dtb__384; f_ProgParts_ppGlobals = dtb__385; f_ProgParts_ppInsts = dtb__386; f_ProgParts_ppClasses = dtb__387 } -> dtb__386
  | _ -> failwith "DT: impossible branch"
))

# 592 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppClasses = (fun (p : t_ProgParts) -> (match p with
  | { f_ProgParts_ppSols = dtb__388; f_ProgParts_ppDatas = dtb__389; f_ProgParts_ppDefs = dtb__390; f_ProgParts_ppGlobals = dtb__391; f_ProgParts_ppInsts = dtb__392; f_ProgParts_ppClasses = dtb__393 } -> dtb__393
  | _ -> failwith "DT: impossible branch"
))
