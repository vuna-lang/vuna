open Vuna_runtime
type t_SourceInfo = { f_SourceInfo_siPath : string; f_SourceInfo_siHash : string; f_SourceInfo_siMtime : int; f_SourceInfo_siSize : int }
and t_ModuleIface = { f_ModuleIface_miName : string; f_ModuleIface_miPackage : string; f_ModuleIface_miSource : t_SourceInfo; f_ModuleIface_miIfaceHash : string; f_ModuleIface_miDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ModuleIface_miImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_ModuleIface_miImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_ModuleIface_miExports : Loader_dModules.t_ExportEntry B_dData_dList.t_List; f_ModuleIface_miFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_ModuleIface_miDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_ModuleIface_miRecords : Elab_dRecords.t_RecordMeta B_dData_dList.t_List; f_ModuleIface_miPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_ModuleIface_miCached : Driver_dCache.t_CachedProgram; f_ModuleIface_miDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_CanonState = { f_CanonState_csNext : int; f_CanonState_csMap : (int, int) B_dContainer_dHashMap.t_HashMap }
and t_OwnerIndex = { f_OwnerIndex_oiDef : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiData : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiCtor : (string, string) B_dContainer_dHashMap.t_HashMap; f_OwnerIndex_oiKnown : string B_dData_dList.t_List }
and t_ProgParts = { f_ProgParts_ppSols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppDatas : (string, Elab_dTypes.t_DtData B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppDefs : (string, Elab_dTypes.t_DtDef B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppGlobals : (string, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppInsts : (string, Elab_dTypes.t_DtInst B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_ProgParts_ppClasses : (string, Elab_dTypes.t_DtClass B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap }

# 96 "Vuna/Compiler/Driver/Iface.vuna"
let v_siPathOf = (fun (dtb_u_u1 : t_SourceInfo) -> (dtb_u_u1).f_SourceInfo_siPath)

# 99 "Vuna/Compiler/Driver/Iface.vuna"
let v_siHashOf = (fun (dtb_u_u2 : t_SourceInfo) -> (dtb_u_u2).f_SourceInfo_siHash)

# 102 "Vuna/Compiler/Driver/Iface.vuna"
let v_siMtimeOf = (fun (dtb_u_u3 : t_SourceInfo) -> (dtb_u_u3).f_SourceInfo_siMtime)

# 105 "Vuna/Compiler/Driver/Iface.vuna"
let v_siSizeOf = (fun (dtb_u_u4 : t_SourceInfo) -> (dtb_u_u4).f_SourceInfo_siSize)

# 108 "Vuna/Compiler/Driver/Iface.vuna"
let v_miNameOf = (fun (dtb_u_u5 : t_ModuleIface) -> (dtb_u_u5).f_ModuleIface_miName)

# 111 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPackageOf = (fun (dtb_u_u6 : t_ModuleIface) -> (dtb_u_u6).f_ModuleIface_miPackage)

# 114 "Vuna/Compiler/Driver/Iface.vuna"
let v_miCachedOf = (fun (dtb_u_u7 : t_ModuleIface) -> (dtb_u_u7).f_ModuleIface_miCached)

# 117 "Vuna/Compiler/Driver/Iface.vuna"
let v_miIfaceHashOf = (fun (dtb_u_u8 : t_ModuleIface) -> (dtb_u_u8).f_ModuleIface_miIfaceHash)

# 120 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDepHashesOf = (fun (dtb_u_u9 : t_ModuleIface) -> (dtb_u_u9).f_ModuleIface_miDepHashes)

# 123 "Vuna/Compiler/Driver/Iface.vuna"
let v_miSourceOf = (fun (dtb_u_u10 : t_ModuleIface) -> (dtb_u_u10).f_ModuleIface_miSource)

# 126 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImportsOf = (fun (dtb_u_u11 : t_ModuleIface) -> (dtb_u_u11).f_ModuleIface_miImports)

# 129 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImplicitImportsOf = (fun (dtb_u_u12 : t_ModuleIface) -> (dtb_u_u12).f_ModuleIface_miImplicitImports)

# 132 "Vuna/Compiler/Driver/Iface.vuna"
let v_miExportsOf = (fun (dtb_u_u13 : t_ModuleIface) -> (dtb_u_u13).f_ModuleIface_miExports)

# 135 "Vuna/Compiler/Driver/Iface.vuna"
let v_miFixitiesOf = (fun (dtb_u_u14 : t_ModuleIface) -> (dtb_u_u14).f_ModuleIface_miFixities)

# 138 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDeclsOf = (fun (dtb_u_u15 : t_ModuleIface) -> (dtb_u_u15).f_ModuleIface_miDecls)

# 142 "Vuna/Compiler/Driver/Iface.vuna"
let v_miRecordsOf = (fun (dtb_u_u16 : t_ModuleIface) -> (dtb_u_u16).f_ModuleIface_miRecords)

# 145 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPreparedOf = (fun (dtb_u_u17 : t_ModuleIface) -> (dtb_u_u17).f_ModuleIface_miPrepared)

# 150 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDefLocsOf = (fun (dtb_u_u18 : t_ModuleIface) -> (dtb_u_u18).f_ModuleIface_miDefLocs)

# 202 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_lookupDefLoc = (fun (dtb_u_u19 : string) (dtb_u_u20 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u20 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u21, dtb_u_u22) -> (match dtb_u_u21 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u23; B_dData_dPair.f_Pair_second = dtb_u_u24 } -> (match dtb_u_u24 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u25; B_dData_dPair.f_Pair_second = dtb_u_u26 } -> (if (dtb_u_u19 = dtb_u_u23) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u25; B_dData_dPair.f_Pair_second = dtb_u_u26 })) else ((v_lookupDefLoc dtb_u_u19) dtb_u_u22))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Driver/Iface.vuna"
let v_restoreDefLocsSpansDef = (fun (dtb_u_u27 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u28 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan dtb_u_u28) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u29) -> dtb_u_u28
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u30 = ((v_lookupDefLoc (Elab_dTypes.v_dtDefName dtb_u_u28)) dtb_u_u27) in (match dtb_u_u30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u31) -> (match dtb_u_u31 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u32; B_dData_dPair.f_Pair_second = dtb_u_u33 } -> (let dtb_u_u34 = (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = dtb_u_u32; Base_dSource.f_Span_spanStartLine = dtb_u_u33; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = dtb_u_u33; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) in (match dtb_u_u28 with
  | Elab_dTypes.C_DtDef_DtDef (dtb_u_u35, dtb_u_u36, dtb_u_u37, dtb_u_u38) -> (Elab_dTypes.C_DtDef_DtDef (dtb_u_u35, dtb_u_u36, dtb_u_u37, dtb_u_u34))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u39, dtb_u_u40, dtb_u_u41) -> (Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u39, dtb_u_u40, dtb_u_u34))
  | Elab_dTypes.C_DtDef_DtExtern (dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u45) -> (Elab_dTypes.C_DtDef_DtExtern (dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u34))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u28
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Driver/Iface.vuna"
let v_restoreDefLocsSpansIface = (fun (dtb_u_u46 : t_ModuleIface) -> (let dtb_u_u47 = (dtb_u_u46).f_ModuleIface_miCached in (let dtb_u_u48 = { Driver_dCache.f_CachedProgram_cachedDatas = (Driver_dCache.v_cachedDatas dtb_u_u47); Driver_dCache.f_CachedProgram_cachedDefs = ((B_dData_dList.v_map (v_restoreDefLocsSpansDef (dtb_u_u46).f_ModuleIface_miDefLocs)) (Driver_dCache.v_cachedDefs dtb_u_u47)); Driver_dCache.f_CachedProgram_cachedGlobals = (Driver_dCache.v_cachedGlobals dtb_u_u47); Driver_dCache.f_CachedProgram_cachedInsts = (Driver_dCache.v_cachedInsts dtb_u_u47); Driver_dCache.f_CachedProgram_cachedClasses = (Driver_dCache.v_cachedClasses dtb_u_u47); Driver_dCache.f_CachedProgram_cachedOpaque = (Driver_dCache.v_cachedOpaque dtb_u_u47) } in { f_ModuleIface_miName = (dtb_u_u46).f_ModuleIface_miName; f_ModuleIface_miPackage = (dtb_u_u46).f_ModuleIface_miPackage; f_ModuleIface_miSource = (dtb_u_u46).f_ModuleIface_miSource; f_ModuleIface_miIfaceHash = (dtb_u_u46).f_ModuleIface_miIfaceHash; f_ModuleIface_miDepHashes = (dtb_u_u46).f_ModuleIface_miDepHashes; f_ModuleIface_miImports = (dtb_u_u46).f_ModuleIface_miImports; f_ModuleIface_miImplicitImports = (dtb_u_u46).f_ModuleIface_miImplicitImports; f_ModuleIface_miExports = (dtb_u_u46).f_ModuleIface_miExports; f_ModuleIface_miFixities = (dtb_u_u46).f_ModuleIface_miFixities; f_ModuleIface_miDecls = (dtb_u_u46).f_ModuleIface_miDecls; f_ModuleIface_miRecords = (dtb_u_u46).f_ModuleIface_miRecords; f_ModuleIface_miPrepared = (dtb_u_u46).f_ModuleIface_miPrepared; f_ModuleIface_miCached = dtb_u_u48; f_ModuleIface_miDefLocs = (dtb_u_u46).f_ModuleIface_miDefLocs })))

# 156 "Vuna/Compiler/Driver/Iface.vuna"
let v_restoreDefLocsSpans = (fun (dtb_u_u49 : t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_map v_restoreDefLocsSpansIface) dtb_u_u49))

# 207 "Vuna/Compiler/Driver/Iface.vuna"
let v_defLocOf = (fun (dtb_u_u50 : (string) -> string) (dtb_u_u51 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan dtb_u_u51) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u52) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u51); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u50 (dtb_u_u52).Base_dSource.f_Span_spanFile); B_dData_dPair.f_Pair_second = (dtb_u_u52).Base_dSource.f_Span_spanStartLine } }))
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Driver/Iface.vuna"
let v_defLocsOfDefs = (fun (dtb_u_u53 : (string) -> string) (dtb_u_u54 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (dtb_u_u55 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u56 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u55)) (B_dData_dPair.v_firstOf dtb_u_u56)))) ((B_dData_dList.v_mapMaybe (v_defLocOf dtb_u_u53)) dtb_u_u54)))

# 223 "Vuna/Compiler/Driver/Iface.vuna"
let v_preparedForModule = (fun (dtb_u_u57 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u58 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u59 : string) -> (let dtb_u_u60 = ((B_dData_dList.v_filter (fun (dtb_u_u68 : Loader_dModules.t_Module) -> ((Loader_dModules.v_moduleNameOf dtb_u_u68) <> dtb_u_u59))) dtb_u_u57) in (let dtb_u_u61 = ((B_dData_dList.v_concatMap (fun (dtb_u_u67 : Loader_dModules.t_Module) -> (if ((Loader_dModules.v_moduleNameOf dtb_u_u67) = dtb_u_u59) then (Loader_dModules.v_moduleDeclsOf dtb_u_u67) else B_dData_dList.C_List_Nil))) dtb_u_u57) in (let dtb_u_u62 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u60)) dtb_u_u58) in (if ((B_dData_dList.v_length dtb_u_u57) <= 1) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dRecords.v_prepareDeclsWith dtb_u_u62) dtb_u_u61) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u63) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb_u_u64) -> (match (Elab_dDerive.v_expandDerivings (B_dData_dPair.v_secondOf dtb_u_u64)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u65) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb_u_u66) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u66))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 239 "Vuna/Compiler/Driver/Iface.vuna"
let v_setPrepared = (fun (dtb_u_u69 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u70 : t_ModuleIface) -> { f_ModuleIface_miName = (dtb_u_u70).f_ModuleIface_miName; f_ModuleIface_miPackage = (dtb_u_u70).f_ModuleIface_miPackage; f_ModuleIface_miSource = (dtb_u_u70).f_ModuleIface_miSource; f_ModuleIface_miIfaceHash = (dtb_u_u70).f_ModuleIface_miIfaceHash; f_ModuleIface_miDepHashes = (dtb_u_u70).f_ModuleIface_miDepHashes; f_ModuleIface_miImports = (dtb_u_u70).f_ModuleIface_miImports; f_ModuleIface_miImplicitImports = (dtb_u_u70).f_ModuleIface_miImplicitImports; f_ModuleIface_miExports = (dtb_u_u70).f_ModuleIface_miExports; f_ModuleIface_miFixities = (dtb_u_u70).f_ModuleIface_miFixities; f_ModuleIface_miDecls = (dtb_u_u70).f_ModuleIface_miDecls; f_ModuleIface_miRecords = (dtb_u_u70).f_ModuleIface_miRecords; f_ModuleIface_miPrepared = dtb_u_u69; f_ModuleIface_miCached = (dtb_u_u70).f_ModuleIface_miCached; f_ModuleIface_miDefLocs = (dtb_u_u70).f_ModuleIface_miDefLocs })

# 258 "Vuna/Compiler/Driver/Iface.vuna"
let v_setDefLocs = (fun (dtb_u_u71 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u72 : t_ModuleIface) -> { f_ModuleIface_miName = (dtb_u_u72).f_ModuleIface_miName; f_ModuleIface_miPackage = (dtb_u_u72).f_ModuleIface_miPackage; f_ModuleIface_miSource = (dtb_u_u72).f_ModuleIface_miSource; f_ModuleIface_miIfaceHash = (dtb_u_u72).f_ModuleIface_miIfaceHash; f_ModuleIface_miDepHashes = (dtb_u_u72).f_ModuleIface_miDepHashes; f_ModuleIface_miImports = (dtb_u_u72).f_ModuleIface_miImports; f_ModuleIface_miImplicitImports = (dtb_u_u72).f_ModuleIface_miImplicitImports; f_ModuleIface_miExports = (dtb_u_u72).f_ModuleIface_miExports; f_ModuleIface_miFixities = (dtb_u_u72).f_ModuleIface_miFixities; f_ModuleIface_miDecls = (dtb_u_u72).f_ModuleIface_miDecls; f_ModuleIface_miRecords = (dtb_u_u72).f_ModuleIface_miRecords; f_ModuleIface_miPrepared = (dtb_u_u72).f_ModuleIface_miPrepared; f_ModuleIface_miCached = (dtb_u_u72).f_ModuleIface_miCached; f_ModuleIface_miDefLocs = dtb_u_u71 })

# 276 "Vuna/Compiler/Driver/Iface.vuna"
let v_hasLocName = (fun (dtb_u_u73 : string B_dData_dList.t_List) (dtb_u_u74 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf dtb_u_u74)) dtb_u_u73))

# 283 "Vuna/Compiler/Driver/Iface.vuna"
let v_mergeDefLocsFrom = (fun (dtb_u_u75 : t_ModuleIface B_dData_dMaybe.t_Maybe) (dtb_u_u76 : t_ModuleIface) -> (match dtb_u_u75 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u77) -> (if ((B_dData_dList.v_length (dtb_u_u76).f_ModuleIface_miDefLocs) > 0) then dtb_u_u76 else (let dtb_u_u78 = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs (dtb_u_u76).f_ModuleIface_miCached)) in (let dtb_u_u79 = ((B_dData_dList.v_filter (v_hasLocName dtb_u_u78)) (dtb_u_u77).f_ModuleIface_miDefLocs) in (if ((B_dData_dList.v_length dtb_u_u79) = 0) then dtb_u_u76 else ((v_setDefLocs dtb_u_u79) dtb_u_u76)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u76
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceSchema = "vuna-iface 36"

# 300 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceHashVersion = "vuna-iface-hash 13 (instance stable key + full-class symbol)"

# 310 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashTextStrong = (fun (dtb_u_u80 : string) -> (Base_dHash.v_contentKey dtb_u_u80))

# 314 "Vuna/Compiler/Driver/Iface.vuna"
let v_shaText = (fun (dtb_u_u81 : string) -> (Base_dHash.v_digestHex (Base_dHash.v_digestOfString dtb_u_u81)))

# 319 "Vuna/Compiler/Driver/Iface.vuna"
let v_payloadDigest = (fun (dtb_u_u82 : string) -> (Base_dHash.v_contentAddress dtb_u_u82))

# 323 "Vuna/Compiler/Driver/Iface.vuna"
let v_partOf = (fun (dtb_u_u83 : string) -> (B_dData_dList.C_List__x58__x58_ ((string_of_int (String.length dtb_u_u83)), (B_dData_dList.C_List__x58__x58_ (":", (B_dData_dList.C_List__x58__x58_ (dtb_u_u83, B_dData_dList.C_List_Nil)))))))

# 330 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_flatParts = (fun (dtb_u_u84 : string B_dData_dList.t_List) -> (match dtb_u_u84 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u85, dtb_u_u86) -> ((B_dData_dList.v_append (v_partOf dtb_u_u85)) (v_flatParts dtb_u_u86))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Driver/Iface.vuna"
let v_digestParts = (fun (dtb_u_u87 : string B_dData_dList.t_List) -> (v_shaText (B_dData_dList.dtp_concatMany (v_flatParts dtb_u_u87))))

# 335 "Vuna/Compiler/Driver/Iface.vuna"
let v_depMissingHash = "missing"

# 342 "Vuna/Compiler/Driver/Iface.vuna"
let v_sortTextPairs = (fun dtb_u_u89 -> ((B_dData_dSort.v_sortBy (fun dtb_u_u90 dtb_u_u91 -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u90)) (B_dData_dPair.v_firstOf dtb_u_u91)))) dtb_u_u89))

# 345 "Vuna/Compiler/Driver/Iface.vuna"
let v_sortByText = (fun dtb_u_u93 dtb_u_u94 -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (v_sortTextPairs ((B_dData_dList.v_map (fun dtb_u_u95 -> { B_dData_dPair.f_Pair_first = (dtb_u_u93 dtb_u_u95); B_dData_dPair.f_Pair_second = dtb_u_u95 })) dtb_u_u94))))

# 355 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonStateEmpty = { f_CanonState_csNext = 0; f_CanonState_csMap = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) }

# 358 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_canonTerm = (fun (dtb_u_u96 : t_CanonState) (dtb_u_u97 : Core_dTerm.t_Term) -> (match dtb_u_u97 with
  | Core_dTerm.C_Term_TIf (dtb_u_u98, dtb_u_u99, dtb_u_u100) -> (let dtb_u_u101 = ((v_canonTerm dtb_u_u96) dtb_u_u98) in (let dtb_u_u102 = ((v_canonTerm (B_dData_dPair.v_secondOf dtb_u_u101)) dtb_u_u99) in (let dtb_u_u103 = ((v_canonTerm (B_dData_dPair.v_secondOf dtb_u_u102)) dtb_u_u100) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((B_dData_dPair.v_firstOf dtb_u_u101), (B_dData_dPair.v_firstOf dtb_u_u102), (B_dData_dPair.v_firstOf dtb_u_u103))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u103) })))
  | Core_dTerm.C_Term_TCase (dtb_u_u104, dtb_u_u105) -> (let dtb_u_u106 = ((v_canonTerm dtb_u_u96) dtb_u_u104) in (let dtb_u_u107 = ((v_canonAlts (B_dData_dPair.v_secondOf dtb_u_u106)) dtb_u_u105) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase ((B_dData_dPair.v_firstOf dtb_u_u106), (B_dData_dPair.v_firstOf dtb_u_u107))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u107) }))
  | Core_dTerm.C_Term_TRecord (dtb_u_u108, dtb_u_u109) -> (let dtb_u_u110 = ((v_canonArgs dtb_u_u96) dtb_u_u109) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecord (dtb_u_u108, (B_dData_dPair.v_firstOf dtb_u_u110))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u110) })
  | Core_dTerm.C_Term_TMk (dtb_u_u111, dtb_u_u112) -> (let dtb_u_u113 = ((v_canonArgs dtb_u_u96) dtb_u_u112) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMk (dtb_u_u111, (B_dData_dPair.v_firstOf dtb_u_u113))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u113) })
  | Core_dTerm.C_Term_TCon (dtb_u_u114, dtb_u_u115) -> (let dtb_u_u116 = ((v_canonArgs dtb_u_u96) dtb_u_u115) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCon (dtb_u_u114, (B_dData_dPair.v_firstOf dtb_u_u116))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u116) })
  | Core_dTerm.C_Term_TApp (dtb_u_u117, dtb_u_u118, dtb_u_u119) -> (let dtb_u_u120 = ((v_canonTerm dtb_u_u96) dtb_u_u117) in (let dtb_u_u121 = ((v_canonTerm (B_dData_dPair.v_secondOf dtb_u_u120)) dtb_u_u118) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((B_dData_dPair.v_firstOf dtb_u_u120), (B_dData_dPair.v_firstOf dtb_u_u121), dtb_u_u119)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u121) }))
  | Core_dTerm.C_Term_TLam (dtb_u_u122, dtb_u_u123, dtb_u_u124, dtb_u_u125, dtb_u_u126) -> (let dtb_u_u127 = ((v_canonTerm dtb_u_u96) dtb_u_u126) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb_u_u122, dtb_u_u123, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (B_dData_dPair.v_firstOf dtb_u_u127))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u127) })
  | Core_dTerm.C_Term_TPi (dtb_u_u128, dtb_u_u129, dtb_u_u130, dtb_u_u131, dtb_u_u132) -> (let dtb_u_u133 = ((v_canonTerm dtb_u_u96) dtb_u_u131) in (let dtb_u_u134 = ((v_canonTerm (B_dData_dPair.v_secondOf dtb_u_u133)) dtb_u_u132) in { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (dtb_u_u128, dtb_u_u129, dtb_u_u130, (B_dData_dPair.v_firstOf dtb_u_u133), (B_dData_dPair.v_firstOf dtb_u_u134))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u134) }))
  | Core_dTerm.C_Term_TMeta (dtb_u_u135) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u135) (dtb_u_u96).f_CanonState_csMap) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u136) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb_u_u136)); B_dData_dPair.f_Pair_second = dtb_u_u96 }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta ((dtb_u_u96).f_CanonState_csNext)); B_dData_dPair.f_Pair_second = { f_CanonState_csNext = ((dtb_u_u96).f_CanonState_csNext + 1); f_CanonState_csMap = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u135) (dtb_u_u96).f_CanonState_csNext) (dtb_u_u96).f_CanonState_csMap) } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u97; B_dData_dPair.f_Pair_second = dtb_u_u96 }
))
# 402 "Vuna/Compiler/Driver/Iface.vuna"
and v_canonArgs = (fun (dtb_u_u137 : t_CanonState) (dtb_u_u138 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u138 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u139, dtb_u_u140) -> (match dtb_u_u139 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u141; B_dData_dPair.f_Pair_second = dtb_u_u142 } -> (let dtb_u_u143 = ((v_canonTerm dtb_u_u137) dtb_u_u141) in (let dtb_u_u144 = ((v_canonArgs (B_dData_dPair.v_secondOf dtb_u_u143)) dtb_u_u140) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u143); B_dData_dPair.f_Pair_second = dtb_u_u142 }, (B_dData_dPair.v_firstOf dtb_u_u144))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u144) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u137 }
  | _ -> failwith "DT: impossible branch"
))
# 410 "Vuna/Compiler/Driver/Iface.vuna"
and v_canonAlts = (fun (dtb_u_u145 : t_CanonState) (dtb_u_u146 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u146 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u147, dtb_u_u148) -> (match dtb_u_u147 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u149; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u150; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u151 } -> (let dtb_u_u152 = ((v_canonTerm dtb_u_u145) dtb_u_u151) in (let dtb_u_u153 = ((v_canonAlts (B_dData_dPair.v_secondOf dtb_u_u152)) dtb_u_u148) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u149; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u150; Core_dTerm.f_CaseAlt_caseAltBody = (B_dData_dPair.v_firstOf dtb_u_u152) }, (B_dData_dPair.v_firstOf dtb_u_u153))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u153) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u145 }
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonTermTop = (fun (dtb_u_u154 : Core_dTerm.t_Term) -> (B_dData_dPair.v_firstOf ((v_canonTerm v_canonStateEmpty) dtb_u_u154)))

# 421 "Vuna/Compiler/Driver/Iface.vuna"
let v_canonMaybe = (fun (dtb_u_u155 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u155 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u156) -> (B_dData_dMaybe.C_Maybe_Just ((v_canonTermTop dtb_u_u156)))
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Driver/Iface.vuna"
let v_defView = (fun (dtb_u_u157 : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u157); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_canonTermTop (Elab_dTypes.v_dtDefType dtb_u_u157)); B_dData_dPair.f_Pair_second = (v_canonMaybe (Elab_dTypes.v_dtDefBody dtb_u_u157)) } })

# 435 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDefView = (fun (dtb_u_u158 : (string, (Core_dTerm.t_Term, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u159 : string B_dData_dList.t_List) -> (match dtb_u_u158 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u160; B_dData_dPair.f_Pair_second = dtb_u_u161 } -> (match dtb_u_u161 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u162; B_dData_dPair.f_Pair_second = dtb_u_u163 } -> ((Base_dBytes.v_encStr dtb_u_u160) ((Core_dCanonical.v_encTerm dtb_u_u162) (((Base_dBytes.v_encMaybe Core_dCanonical.v_encTerm) dtb_u_u163) dtb_u_u159)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDefView = (fun (dtb_u_u164 : string B_dData_dList.t_List) (dtb_u_u165 : Elab_dTypes.t_DtDef) -> (let dtb_u_u166 = (Elab_dTypes.v_dtDefName dtb_u_u165) in (let dtb_u_u167 = (if ((B_dData_dList.v_memName dtb_u_u166) dtb_u_u164) then B_dData_dMaybe.C_Maybe_Nothing else (Elab_dTypes.v_dtDefBody dtb_u_u165)) in { B_dData_dPair.f_Pair_first = dtb_u_u166; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_canonTermTop (Elab_dTypes.v_dtDefType dtb_u_u165)); B_dData_dPair.f_Pair_second = (v_canonMaybe dtb_u_u167) } })))

# 445 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDefs = (fun (dtb_u_u168 : string B_dData_dList.t_List) (dtb_u_u169 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList v_encDefView)) ((v_sortByText (fun (dtb_u_u170 : (string, (Core_dTerm.t_Term, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u170))) ((B_dData_dList.v_map (v_hashDefView dtb_u_u168)) dtb_u_u169)))))

# 450 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOpaque = (fun (dtb_u_u171 : string B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) ((v_sortByText (fun (dtb_u_u172 : string) -> dtb_u_u172)) dtb_u_u171))))

# 454 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDatas = (fun (dtb_u_u173 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtData)) ((v_sortByText (fun (dtb_u_u174 : Elab_dTypes.t_DtData) -> (Elab_dTypes.v_dtDataName dtb_u_u174))) dtb_u_u173))))

# 457 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashInsts = (fun (dtb_u_u175 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtInstSem)) ((v_sortByText Elab_dTypes.v_dtInstKey) dtb_u_u175))))

# 460 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashClasses = (fun (dtb_u_u176 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encDtClassSem)) ((v_sortByText (fun (dtb_u_u177 : Elab_dTypes.t_DtClass) -> (Elab_dTypes.v_dtClassName dtb_u_u177))) dtb_u_u176))))

# 465 "Vuna/Compiler/Driver/Iface.vuna"
let v_encGlobal = (fun (dtb_u_u178 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (dtb_u_u179 : string B_dData_dList.t_List) -> (match dtb_u_u178 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u180; B_dData_dPair.f_Pair_second = dtb_u_u181 } -> ((Base_dBytes.v_encStr dtb_u_u180) ((Core_dCanonical.v_encTerm dtb_u_u181) dtb_u_u179))
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashGlobals = (fun (dtb_u_u182 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList v_encGlobal)) ((v_sortByText (fun (dtb_u_u183 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u183))) dtb_u_u182))))

# 472 "Vuna/Compiler/Driver/Iface.vuna"
let v_exportKeyOf = (fun (dtb_u_u184 : Loader_dModules.t_ExportEntry) -> (String.concat "" [(dtb_u_u184).Loader_dModules.f_ExportEntry_public; "|"; (dtb_u_u184).Loader_dModules.f_ExportEntry_kind; "|"; (dtb_u_u184).Loader_dModules.f_ExportEntry_target; "|"; (dtb_u_u184).Loader_dModules.f_ExportEntry_parent]))

# 475 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashExports = (fun (dtb_u_u185 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encExportEntry)) ((v_sortByText v_exportKeyOf) dtb_u_u185))))

# 479 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashFixities = (fun (dtb_u_u186 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encFixity)) dtb_u_u186)))

# 483 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashRecords = (fun (dtb_u_u187 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encRecordMeta)) dtb_u_u187)))

# 487 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashImports = (fun (dtb_u_u188 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop (Base_dBytes.v_encList Elab_dCanonical.v_encImport)) dtb_u_u188)))

# 493 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDecls = (fun (dtb_u_u189 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_payloadDigest ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encDecls) dtb_u_u189)))

# 498 "Vuna/Compiler/Driver/Iface.vuna"
let v_stripOpaqueDeclBodies = (fun (dtb_u_u190 : string B_dData_dList.t_List) (dtb_u_u191 : Frontend_dAst.t_Decl) -> (match dtb_u_u191 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195) -> (if ((B_dData_dList.v_memName dtb_u_u192) dtb_u_u190) then (Frontend_dAst.C_Decl_DFun (dtb_u_u192, dtb_u_u193, (Frontend_dAst.C_Expr_EVar ("@opaque@", (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u195)))), dtb_u_u195)) else (Frontend_dAst.C_Decl_DFun (dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195)))
  | _ -> dtb_u_u191
))

# 506 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashDeclsForIface = (fun (dtb_u_u196 : string B_dData_dList.t_List) (dtb_u_u197 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (v_hashDecls ((B_dData_dList.v_map (v_stripOpaqueDeclBodies dtb_u_u196)) dtb_u_u197)))

# 511 "Vuna/Compiler/Driver/Iface.vuna"
let v_moduleHashes = (fun (dtb_u_u198 : string) (dtb_u_u199 : string) (dtb_u_u200 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u201 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u202 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (dtb_u_u203 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dtb_u_u204 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u205 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u206 : Driver_dCache.t_CachedProgram) -> (let dtb_u_u207 = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) (Driver_dCache.v_cachedOpaqueOf dtb_u_u206)) in (let dtb_u_u208 = (v_hashImports dtb_u_u200) in (let dtb_u_u209 = (v_hashImports dtb_u_u201) in (let dtb_u_u210 = (v_hashFixities dtb_u_u202) in (let dtb_u_u211 = (v_hashRecords dtb_u_u203) in (let dtb_u_u212 = (v_hashExports dtb_u_u204) in (let dtb_u_u213 = (v_hashDatas (Driver_dCache.v_cachedDatas dtb_u_u206)) in (let dtb_u_u214 = (v_hashGlobals (Driver_dCache.v_cachedGlobals dtb_u_u206)) in (let dtb_u_u215 = (v_hashInsts (Driver_dCache.v_cachedInsts dtb_u_u206)) in (let dtb_u_u216 = (v_hashClasses (Driver_dCache.v_cachedClasses dtb_u_u206)) in (let dtb_u_u217 = (v_hashOpaque (Driver_dCache.v_cachedOpaqueOf dtb_u_u206)) in (let dtb_u_u218 = ((v_hashDeclsForIface dtb_u_u207) dtb_u_u205) in (let dtb_u_u219 = ((v_hashDefs dtb_u_u207) (Driver_dCache.v_cachedDefs dtb_u_u206)) in (v_digestParts (B_dData_dList.C_List__x58__x58_ (v_ifaceHashVersion, (B_dData_dList.C_List__x58__x58_ (dtb_u_u198, (B_dData_dList.C_List__x58__x58_ (dtb_u_u199, (B_dData_dList.C_List__x58__x58_ (dtb_u_u208, (B_dData_dList.C_List__x58__x58_ (dtb_u_u209, (B_dData_dList.C_List__x58__x58_ (dtb_u_u210, (B_dData_dList.C_List__x58__x58_ (dtb_u_u211, (B_dData_dList.C_List__x58__x58_ (dtb_u_u218, (B_dData_dList.C_List__x58__x58_ (dtb_u_u213, (B_dData_dList.C_List__x58__x58_ (dtb_u_u219, (B_dData_dList.C_List__x58__x58_ (dtb_u_u214, (B_dData_dList.C_List__x58__x58_ (dtb_u_u215, (B_dData_dList.C_List__x58__x58_ (dtb_u_u216, (B_dData_dList.C_List__x58__x58_ (dtb_u_u212, (B_dData_dList.C_List__x58__x58_ (dtb_u_u217, B_dData_dList.C_List_Nil)))))))))))))))))))))))))))))))))))))))))))))

# 530 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOfIface = (fun (dtb_u_u220 : t_ModuleIface) -> (((((((((v_moduleHashes (v_miNameOf dtb_u_u220)) (v_miPackageOf dtb_u_u220)) (v_miImportsOf dtb_u_u220)) (v_miImplicitImportsOf dtb_u_u220)) (v_miFixitiesOf dtb_u_u220)) (v_miRecordsOf dtb_u_u220)) (v_miExportsOf dtb_u_u220)) (v_miDeclsOf dtb_u_u220)) (v_miCachedOf dtb_u_u220)))

# 554 "Vuna/Compiler/Driver/Iface.vuna"
let v_tblOwner = (fun (dtb_u_u221 : (string, string) B_dContainer_dHashMap.t_HashMap) (dtb_u_u222 : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u222) dtb_u_u221))

# 557 "Vuna/Compiler/Driver/Iface.vuna"
let v_prefixOwner = (fun (dtb_u_u223 : string B_dData_dList.t_List) (dtb_u_u224 : string) -> (let dtb_u_u225 = (Driver_dOwner.v_modulePrefixOfName dtb_u_u224) in (if ((B_dData_dList.v_memName dtb_u_u225) dtb_u_u223) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u225)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 563 "Vuna/Compiler/Driver/Iface.vuna"
let v_defOwnerOf = (fun (dtb_u_u226 : t_OwnerIndex) (dtb_u_u227 : string) -> (match ((v_tblOwner (dtb_u_u226).f_OwnerIndex_oiDef) dtb_u_u227) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u228) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u228))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot dtb_u_u227) then ((v_prefixOwner (dtb_u_u226).f_OwnerIndex_oiKnown) dtb_u_u227) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 569 "Vuna/Compiler/Driver/Iface.vuna"
let v_dataOwnerOf = (fun (dtb_u_u229 : t_OwnerIndex) (dtb_u_u230 : string) -> (match ((v_tblOwner (dtb_u_u229).f_OwnerIndex_oiData) dtb_u_u230) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u231) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u231))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot dtb_u_u230) then ((v_prefixOwner (dtb_u_u229).f_OwnerIndex_oiKnown) dtb_u_u230) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_ctorFamilyPairs = (fun (dtb_u_u232 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u232 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u233, dtb_u_u234) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u235 : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u235); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataName dtb_u_u233) })) (Elab_dTypes.v_dtDataCtors dtb_u_u233))) (v_ctorFamilyPairs dtb_u_u234))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Driver/Iface.vuna"
let v_ctorOwnerOf = (fun (dtb_u_u236 : t_OwnerIndex) (dtb_u_u237 : string) -> (match ((v_tblOwner (dtb_u_u236).f_OwnerIndex_oiCtor) dtb_u_u237) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> ((v_dataOwnerOf dtb_u_u236) dtb_u_u238)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 589 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifacePreludeNames = ((B_dData_dList.v_append Elab_dPrelude.v_preludeNames) Base_dIntrinsics.v_internalIntrinsicNames)

# 594 "Vuna/Compiler/Driver/Iface.vuna"
let v_globalOwnerOf = (fun (dtb_u_u239 : t_OwnerIndex) (dtb_u_u240 : string) -> (if ((B_dData_dList.v_memName dtb_u_u240) v_ifacePreludeNames) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_defOwnerOf dtb_u_u239) dtb_u_u240) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u241) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u241))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_dataOwnerOf dtb_u_u239) dtb_u_u240) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u242) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u242))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorOwnerOf dtb_u_u239) dtb_u_u240)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 606 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownerIndexOf = (fun (dtb_u_u243 : Driver_dOwner.t_SplitMeta) (dtb_u_u244 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> { f_OwnerIndex_oiDef = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb_u_u243).Driver_dOwner.f_SplitMeta_smDefOwners); f_OwnerIndex_oiData = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb_u_u243).Driver_dOwner.f_SplitMeta_smDataOwners); f_OwnerIndex_oiCtor = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_ctorFamilyPairs dtb_u_u244)); f_OwnerIndex_oiKnown = (dtb_u_u243).Driver_dOwner.f_SplitMeta_smKnownModules })

# 637 "Vuna/Compiler/Driver/Iface.vuna"
let v_bucketOf = (fun (dtb_u_u246 : string) dtb_u_u247 -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u246) dtb_u_u247) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u248) -> dtb_u_u248
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_partitionByOwnerGo = (fun dtb_u_u250 dtb_u_u251 dtb_u_u252 -> (match dtb_u_u251 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u253, dtb_u_u254) -> (match (dtb_u_u250 dtb_u_u253) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_partitionByOwnerGo dtb_u_u250) dtb_u_u254) dtb_u_u252)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u255) -> (((v_partitionByOwnerGo dtb_u_u250) dtb_u_u254) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u255) (B_dData_dList.C_List__x58__x58_ (dtb_u_u253, ((v_bucketOf dtb_u_u255) dtb_u_u252)))) dtb_u_u252))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u252
  | _ -> failwith "DT: impossible branch"
))

# 646 "Vuna/Compiler/Driver/Iface.vuna"
let v_reverseBucket = (fun dtb_u_u257 -> (match dtb_u_u257 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u258; B_dData_dPair.f_Pair_second = dtb_u_u259 } -> { B_dData_dPair.f_Pair_first = dtb_u_u258; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u259) }
  | _ -> failwith "DT: impossible branch"
))

# 643 "Vuna/Compiler/Driver/Iface.vuna"
let v_reverseBuckets = (fun dtb_u_u261 -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_reverseBucket) (B_dContainer_dHashMap.v_toList dtb_u_u261))))

# 627 "Vuna/Compiler/Driver/Iface.vuna"
let v_partitionByOwner = (fun dtb_u_u263 dtb_u_u264 -> (v_reverseBuckets (((v_partitionByOwnerGo dtb_u_u263) dtb_u_u264) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))))

# 649 "Vuna/Compiler/Driver/Iface.vuna"
let v_progPartsOf = (fun (dtb_u_u265 : t_OwnerIndex) (dtb_u_u266 : Elab_dTypes.t_DtProgram) -> { f_ProgParts_ppSols = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Elab_dTypes.v_dtProgSols dtb_u_u266)); f_ProgParts_ppDatas = ((v_partitionByOwner (fun (dtb_u_u267 : Elab_dTypes.t_DtData) -> ((v_dataOwnerOf dtb_u_u265) (Elab_dTypes.v_dtDataName dtb_u_u267)))) (Elab_dTypes.v_dtProgDatas dtb_u_u266)); f_ProgParts_ppDefs = ((v_partitionByOwner (fun (dtb_u_u268 : Elab_dTypes.t_DtDef) -> ((v_defOwnerOf dtb_u_u265) (Elab_dTypes.v_dtDefName dtb_u_u268)))) (Elab_dTypes.v_dtProgDefs dtb_u_u266)); f_ProgParts_ppGlobals = ((v_partitionByOwner (fun (dtb_u_u269 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> ((v_globalOwnerOf dtb_u_u265) (B_dData_dPair.v_firstOf dtb_u_u269)))) (Elab_dTypes.v_dtProgGlobals dtb_u_u266)); f_ProgParts_ppInsts = ((v_partitionByOwner (fun (dtb_u_u270 : Elab_dTypes.t_DtInst) -> ((v_defOwnerOf dtb_u_u265) (Elab_dTypes.v_dtInstSym dtb_u_u270)))) (Elab_dTypes.v_dtProgInsts dtb_u_u266)); f_ProgParts_ppClasses = ((v_partitionByOwner (fun (dtb_u_u271 : Elab_dTypes.t_DtClass) -> ((v_defOwnerOf dtb_u_u265) (Elab_dTypes.v_dtClassName dtb_u_u271)))) (Elab_dTypes.v_dtProgClasses dtb_u_u266)) })

# 661 "Vuna/Compiler/Driver/Iface.vuna"
let v_cpOfModule = (fun (dtb_u_u272 : t_ProgParts) (dtb_u_u273 : Elab_dTypes.t_DtProgram) (dtb_u_u274 : string) (dtb_u_u275 : string B_dData_dList.t_List) -> (let dtb_u_u276 = ((v_bucketOf dtb_u_u274) (dtb_u_u272).f_ProgParts_ppDatas) in (let dtb_u_u277 = ((v_bucketOf dtb_u_u274) (dtb_u_u272).f_ProgParts_ppDefs) in (let dtb_u_u278 = ((v_bucketOf dtb_u_u274) (dtb_u_u272).f_ProgParts_ppGlobals) in (let dtb_u_u279 = ((v_bucketOf dtb_u_u274) (dtb_u_u272).f_ProgParts_ppInsts) in (let dtb_u_u280 = ((v_bucketOf dtb_u_u274) (dtb_u_u272).f_ProgParts_ppClasses) in (let dtb_u_u281 = { Elab_dTypes.f_DtProgram_dtProgDatas = dtb_u_u276; Elab_dTypes.f_DtProgram_dtProgDefs = dtb_u_u277; Elab_dTypes.f_DtProgram_dtProgGoals = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb_u_u273); Elab_dTypes.f_DtProgram_dtProgGlobals = dtb_u_u278; Elab_dTypes.f_DtProgram_dtProgInsts = dtb_u_u279; Elab_dTypes.f_DtProgram_dtProgClasses = dtb_u_u280; Elab_dTypes.f_DtProgram_dtProgNext = 0; Elab_dTypes.f_DtProgram_dtProgDepths = B_dData_dList.C_List_Nil; Elab_dTypes.f_DtProgram_dtProgWarnings = B_dData_dList.C_List_Nil } in ((Driver_dCache.v_withCachedOpaque dtb_u_u275) ((Driver_dCache.v_cachedOfProgramWith (dtb_u_u272).f_ProgParts_ppSols) dtb_u_u281)))))))))

# 672 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_sourceOf = (fun (dtb_u_u282 : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u283 : string) -> (match dtb_u_u282 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u284, dtb_u_u285) -> (match dtb_u_u284 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u286; B_dData_dPair.f_Pair_second = dtb_u_u287 } -> (if (dtb_u_u286 = dtb_u_u283) then dtb_u_u287 else ((v_sourceOf dtb_u_u285) dtb_u_u283))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_SourceInfo_siPath = ""; f_SourceInfo_siHash = ""; f_SourceInfo_siMtime = 0; f_SourceInfo_siSize = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Driver/Iface.vuna"
let v_importNameOf = (fun (dtb_u_u288 : Frontend_dAst.t_Import) -> (dtb_u_u288).Frontend_dAst.f_Import_importName)

# 679 "Vuna/Compiler/Driver/Iface.vuna"
let v_importNamesOfModule = (fun (dtb_u_u289 : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_importNameOf) ((B_dData_dList.v_append (dtb_u_u289).Loader_dModules.f_Module_moduleImportsOf) (dtb_u_u289).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 684 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_hasMissingDep = (fun (dtb_u_u290 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u290 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u291, dtb_u_u292) -> (match dtb_u_u291 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u293; B_dData_dPair.f_Pair_second = dtb_u_u294 } -> (if (dtb_u_u294 = v_depMissingHash) then true else (v_hasMissingDep dtb_u_u292))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 688 "Vuna/Compiler/Driver/Iface.vuna"
let v_hashOfImportName = (fun (dtb_u_u295 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u296 : string) -> (match ((B_dData_dList.v_lookupPair dtb_u_u296) dtb_u_u295) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u297) -> dtb_u_u297
  | B_dData_dMaybe.C_Maybe_Nothing -> v_depMissingHash
  | _ -> failwith "DT: impossible branch"
))

# 694 "Vuna/Compiler/Driver/Iface.vuna"
let v_depHashesOf = (fun (dtb_u_u298 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u299 : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (dtb_u_u300 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u300; B_dData_dPair.f_Pair_second = ((v_hashOfImportName dtb_u_u298) dtb_u_u300) })) (v_importNamesOfModule dtb_u_u299)))

# 697 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_cleanIfaceOf = (fun (dtb_u_u301 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u302 : string) -> (match dtb_u_u301 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u303, dtb_u_u304) -> (if ((v_miNameOf dtb_u_u303) = dtb_u_u302) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u303)) else ((v_cleanIfaceOf dtb_u_u304) dtb_u_u302))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 706 "Vuna/Compiler/Driver/Iface.vuna"
let v_mkIfaceBase = (fun (dtb_u_u305 : string) (dtb_u_u306 : t_ProgParts) (dtb_u_u307 : Elab_dTypes.t_DtProgram) (dtb_u_u308 : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u309 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u310 : (string) -> string) (dtb_u_u311 : Loader_dModules.t_Module) -> (match ((v_cleanIfaceOf dtb_u_u309) (Loader_dModules.v_moduleNameOf dtb_u_u311)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u312) -> dtb_u_u312
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u313 = (Loader_dModules.v_moduleNameOf dtb_u_u311) in (let dtb_u_u314 = ((((v_cpOfModule dtb_u_u306) dtb_u_u307) dtb_u_u313) (Loader_dModules.v_moduleOpaqueOf dtb_u_u311)) in (let dtb_u_u315 = (Elab_dRecords.v_recordsOfDecls (dtb_u_u311).Loader_dModules.f_Module_moduleDeclsOf) in (let dtb_u_u316 = (((((((((v_moduleHashes dtb_u_u313) dtb_u_u305) (dtb_u_u311).Loader_dModules.f_Module_moduleImportsOf) (dtb_u_u311).Loader_dModules.f_Module_moduleImplicitImportsOf) (dtb_u_u311).Loader_dModules.f_Module_moduleFixitiesOf) dtb_u_u315) (dtb_u_u311).Loader_dModules.f_Module_moduleExportsOf) (dtb_u_u311).Loader_dModules.f_Module_moduleDeclsOf) dtb_u_u314) in { f_ModuleIface_miName = dtb_u_u313; f_ModuleIface_miPackage = dtb_u_u305; f_ModuleIface_miSource = ((v_sourceOf dtb_u_u308) dtb_u_u313); f_ModuleIface_miIfaceHash = dtb_u_u316; f_ModuleIface_miDepHashes = B_dData_dList.C_List_Nil; f_ModuleIface_miImports = (dtb_u_u311).Loader_dModules.f_Module_moduleImportsOf; f_ModuleIface_miImplicitImports = (dtb_u_u311).Loader_dModules.f_Module_moduleImplicitImportsOf; f_ModuleIface_miExports = (dtb_u_u311).Loader_dModules.f_Module_moduleExportsOf; f_ModuleIface_miFixities = (dtb_u_u311).Loader_dModules.f_Module_moduleFixitiesOf; f_ModuleIface_miDecls = (dtb_u_u311).Loader_dModules.f_Module_moduleDeclsOf; f_ModuleIface_miRecords = dtb_u_u315; f_ModuleIface_miPrepared = B_dData_dList.C_List_Nil; f_ModuleIface_miCached = dtb_u_u314; f_ModuleIface_miDefLocs = ((v_defLocsOfDefs dtb_u_u310) (Driver_dCache.v_cachedDefs dtb_u_u314)) }))))
  | _ -> failwith "DT: impossible branch"
))

# 742 "Vuna/Compiler/Driver/Iface.vuna"
let v_finishIface = (fun (dtb_u_u317 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u318 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u319 : Loader_dModules.t_Module) (dtb_u_u320 : t_ModuleIface) -> (match ((v_cleanIfaceOf dtb_u_u318) (v_miNameOf dtb_u_u320)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u321) -> dtb_u_u321
  | B_dData_dMaybe.C_Maybe_Nothing -> { f_ModuleIface_miName = (v_miNameOf dtb_u_u320); f_ModuleIface_miPackage = (v_miPackageOf dtb_u_u320); f_ModuleIface_miSource = (v_miSourceOf dtb_u_u320); f_ModuleIface_miIfaceHash = (v_miIfaceHashOf dtb_u_u320); f_ModuleIface_miDepHashes = ((v_depHashesOf dtb_u_u317) dtb_u_u319); f_ModuleIface_miImports = (v_miImportsOf dtb_u_u320); f_ModuleIface_miImplicitImports = (v_miImplicitImportsOf dtb_u_u320); f_ModuleIface_miExports = (v_miExportsOf dtb_u_u320); f_ModuleIface_miFixities = (v_miFixitiesOf dtb_u_u320); f_ModuleIface_miDecls = (v_miDeclsOf dtb_u_u320); f_ModuleIface_miRecords = (v_miRecordsOf dtb_u_u320); f_ModuleIface_miPrepared = (v_miPreparedOf dtb_u_u320); f_ModuleIface_miCached = (v_miCachedOf dtb_u_u320); f_ModuleIface_miDefLocs = (v_miDefLocsOf dtb_u_u320) }
  | _ -> failwith "DT: impossible branch"
))

# 763 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifacesGo = (fun (dtb_u_u322 : string) (dtb_u_u323 : t_ProgParts) (dtb_u_u324 : Elab_dTypes.t_DtProgram) (dtb_u_u325 : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u326 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u327 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u328 : (string) -> string) (dtb_u_u329 : Loader_dModules.t_Module B_dData_dList.t_List) -> (let dtb_u_u330 = ((B_dData_dList.v_map (fun (dtb_u_u335 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = dtb_u_u335; B_dData_dPair.f_Pair_second = (((((((v_mkIfaceBase dtb_u_u322) dtb_u_u323) dtb_u_u324) dtb_u_u325) dtb_u_u327) dtb_u_u328) dtb_u_u335) })) dtb_u_u329) in (let dtb_u_u331 = ((B_dData_dList.v_map (fun (dtb_u_u334 : (Loader_dModules.t_Module, t_ModuleIface) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (v_miNameOf (B_dData_dPair.v_secondOf dtb_u_u334)); B_dData_dPair.f_Pair_second = (v_miIfaceHashOf (B_dData_dPair.v_secondOf dtb_u_u334)) })) dtb_u_u330) in (let dtb_u_u332 = ((B_dData_dList.v_append dtb_u_u326) dtb_u_u331) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (fun (dtb_u_u333 : (Loader_dModules.t_Module, t_ModuleIface) B_dData_dPair.t_Pair) -> ((((v_finishIface dtb_u_u332) dtb_u_u327) (B_dData_dPair.v_firstOf dtb_u_u333)) (B_dData_dPair.v_secondOf dtb_u_u333)))) dtb_u_u330); B_dData_dPair.f_Pair_second = dtb_u_u332 }))))

# 776 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownerOfAny = (fun (dtb_u_u336 : t_OwnerIndex) (dtb_u_u337 : string) -> (match ((v_defOwnerOf dtb_u_u336) dtb_u_u337) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u338) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u338))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_dataOwnerOf dtb_u_u336) dtb_u_u337) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u339) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u339))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorOwnerOf dtb_u_u336) dtb_u_u337)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Driver/Iface.vuna"
let v_coverageIssueOf = (fun (dtb_u_u340 : t_OwnerIndex) (dtb_u_u341 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u342 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u343 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u344 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u345 : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u345) dtb_u_u344) then "" else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u345) dtb_u_u342) then "" else (match ((v_ownerOfAny dtb_u_u340) dtb_u_u345) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u346) -> (if (dtb_u_u346 = Driver_dOwner.v_entryOwner) then "" else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u346) dtb_u_u341) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u345) dtb_u_u343) then "" else (String.concat "" ["missing-from-iface "; dtb_u_u345; " -> "; dtb_u_u346])) else ""))
  | B_dData_dMaybe.C_Maybe_Nothing -> ("unowned " ^ dtb_u_u345)
  | _ -> failwith "DT: impossible branch"
))))

# 796 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_coverageIssueGo = (fun (dtb_u_u347 : t_OwnerIndex) (dtb_u_u348 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u349 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u350 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u351 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u352 : string B_dData_dList.t_List) -> (match dtb_u_u352 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u353, dtb_u_u354) -> (let dtb_u_u355 = ((((((v_coverageIssueOf dtb_u_u347) dtb_u_u348) dtb_u_u349) dtb_u_u350) dtb_u_u351) dtb_u_u353) in (if (dtb_u_u355 = "") then ((((((v_coverageIssueGo dtb_u_u347) dtb_u_u348) dtb_u_u349) dtb_u_u350) dtb_u_u351) dtb_u_u354) else dtb_u_u355))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 803 "Vuna/Compiler/Driver/Iface.vuna"
let v_isSealName = (fun (dtb_u_u356 : string) -> ((B_dData_dString.v_startsWith "vuna_seal_") dtb_u_u356))

# 806 "Vuna/Compiler/Driver/Iface.vuna"
let v_artifactNamesOf = (fun (dtb_u_u357 : Elab_dTypes.t_DtProgram) -> ((B_dData_dList.v_filter (fun (dtb_u_u358 : string) -> (B_dData_dBool.v_not (v_isSealName dtb_u_u358)))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Elab_dTypes.v_dtProgDatas dtb_u_u357))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Elab_dTypes.v_dtProgDefs dtb_u_u357))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstSym) (Elab_dTypes.v_dtProgInsts dtb_u_u357))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Elab_dTypes.v_dtProgClasses dtb_u_u357))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Elab_dTypes.v_dtProgGlobals dtb_u_u357))))))))

# 813 "Vuna/Compiler/Driver/Iface.vuna"
let v_dataNamesOf = (fun (dtb_u_u359 : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Driver_dCache.v_cachedDatas dtb_u_u359)))

# 816 "Vuna/Compiler/Driver/Iface.vuna"
let v_ctorNamesOf = (fun (dtb_u_u360 : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u361 : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors dtb_u_u361)))) (Driver_dCache.v_cachedDatas dtb_u_u360)))

# 819 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceNamesOf = (fun (dtb_u_u362 : t_ModuleIface) -> (let dtb_u_u363 = (v_miCachedOf dtb_u_u362) in ((B_dData_dList.v_append (v_dataNamesOf dtb_u_u363)) ((B_dData_dList.v_append (v_ctorNamesOf dtb_u_u363)) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs dtb_u_u363))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstSym) (Driver_dCache.v_cachedInsts dtb_u_u363))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Driver_dCache.v_cachedClasses dtb_u_u363))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Driver_dCache.v_cachedGlobals dtb_u_u363)))))))))

# 827 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceArtifactNames = (fun (dtb_u_u364 : t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_ifaceNamesOf) dtb_u_u364))

# 830 "Vuna/Compiler/Driver/Iface.vuna"
let v_firstCoverageIssue = (fun (dtb_u_u365 : t_OwnerIndex) (dtb_u_u366 : string B_dData_dList.t_List) (dtb_u_u367 : string B_dData_dList.t_List) (dtb_u_u368 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u369 : Elab_dTypes.t_DtProgram) -> (let dtb_u_u370 = (v_ifaceArtifactNames dtb_u_u368) in (let dtb_u_u371 = (B_dContainer_dHashMap.v_ofNames dtb_u_u370) in (let dtb_u_u372 = (B_dContainer_dHashMap.v_ofNames dtb_u_u366) in (let dtb_u_u373 = (B_dContainer_dHashMap.v_ofNames dtb_u_u367) in (let dtb_u_u374 = (B_dContainer_dHashMap.v_ofNames v_ifacePreludeNames) in (let dtb_u_u375 = ((((((v_coverageIssueGo dtb_u_u365) dtb_u_u372) dtb_u_u373) dtb_u_u371) dtb_u_u374) (v_artifactNamesOf dtb_u_u369)) in (if (dtb_u_u375 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u375))))))))))

# 846 "Vuna/Compiler/Driver/Iface.vuna"
let v_coverageResult = (fun (dtb_u_u376 : t_OwnerIndex) (dtb_u_u377 : string B_dData_dList.t_List) (dtb_u_u378 : string B_dData_dList.t_List) (dtb_u_u379 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u380 : Elab_dTypes.t_DtProgram) -> (match (((((v_firstCoverageIssue dtb_u_u376) dtb_u_u377) dtb_u_u378) dtb_u_u379) dtb_u_u380) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u381) -> (Base_dDiag.v_icInternal ("iface: " ^ dtb_u_u381))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u379))
  | _ -> failwith "DT: impossible branch"
))

# 852 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceOfPackage = (fun (dtb_u_u382 : string) (dtb_u_u383 : (string, t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u384 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u385 : string B_dData_dList.t_List) (dtb_u_u386 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u387 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u388 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u389 : Elab_dTypes.t_DtProgram) (dtb_u_u390 : (string) -> string) -> (let dtb_u_u391 = (B_dData_dList.v_reverse ((B_dData_dList.v_filter (fun (dtb_u_u400 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u400) = dtb_u_u382))) dtb_u_u387)) in (let dtb_u_u392 = ((B_dData_dList.v_map (fun (dtb_u_u399 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u399); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u399) })) dtb_u_u387) in (let dtb_u_u393 = ((Driver_dOwner.v_splitMetaOf dtb_u_u392) dtb_u_u388) in (let dtb_u_u394 = ((v_ownerIndexOf dtb_u_u393) (Elab_dTypes.v_dtProgDatas dtb_u_u389)) in (let dtb_u_u395 = ((v_progPartsOf dtb_u_u394) dtb_u_u389) in (let dtb_u_u396 = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) dtb_u_u391) in (match ((((((((v_ifacesGo dtb_u_u382) dtb_u_u395) dtb_u_u389) dtb_u_u383) dtb_u_u384) dtb_u_u386) dtb_u_u390) dtb_u_u391) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u397; B_dData_dPair.f_Pair_second = dtb_u_u398 } -> (((((v_coverageResult dtb_u_u394) dtb_u_u396) dtb_u_u385) dtb_u_u397) dtb_u_u389)
  | _ -> failwith "DT: impossible branch"
))))))))

# 873 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_findNamedModule = (fun (dtb_u_u401 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u402 : string) -> (match dtb_u_u401 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u403, dtb_u_u404) -> (if ((Loader_dModules.v_moduleNameOf dtb_u_u403) = dtb_u_u402) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u403)) else ((v_findNamedModule dtb_u_u404) dtb_u_u402))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 880 "Vuna/Compiler/Driver/Iface.vuna"
let v_sameOwner = (fun (dtb_u_u405 : string) (dtb_u_u406 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u406 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u407) -> (dtb_u_u407 = dtb_u_u405)
  | _ -> failwith "DT: impossible branch"
))

# 884 "Vuna/Compiler/Driver/Iface.vuna"
let v_ownedByModule = (fun (dtb_u_u408 : t_OwnerIndex) (dtb_u_u409 : string) (dtb_u_u410 : string) -> ((v_sameOwner dtb_u_u409) ((v_globalOwnerOf dtb_u_u408) dtb_u_u410)))

# 893 "Vuna/Compiler/Driver/Iface.vuna"
let rec v_allOwnedPresent = (fun (dtb_u_u411 : t_OwnerIndex) (dtb_u_u412 : string B_dData_dList.t_List) (dtb_u_u413 : string) (dtb_u_u414 : string B_dData_dList.t_List) (dtb_u_u415 : string B_dData_dList.t_List) -> (match dtb_u_u414 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u416, dtb_u_u417) -> (let dtb_u_u418 = (if ((B_dData_dList.v_memName dtb_u_u416) dtb_u_u412) then true else (B_dData_dBool.v_not (((v_ownedByModule dtb_u_u411) dtb_u_u413) dtb_u_u416))) in (if dtb_u_u418 then (((((v_allOwnedPresent dtb_u_u411) dtb_u_u412) dtb_u_u413) dtb_u_u417) dtb_u_u415) else (if ((B_dData_dList.v_memName dtb_u_u416) dtb_u_u415) then (((((v_allOwnedPresent dtb_u_u411) dtb_u_u412) dtb_u_u413) dtb_u_u417) dtb_u_u415) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 887 "Vuna/Compiler/Driver/Iface.vuna"
let v_moduleCoverageOk = (fun (dtb_u_u419 : t_OwnerIndex) (dtb_u_u420 : string B_dData_dList.t_List) (dtb_u_u421 : string) (dtb_u_u422 : Elab_dTypes.t_DtProgram) (dtb_u_u423 : t_ModuleIface) -> (let dtb_u_u424 = (v_ifaceNamesOf dtb_u_u423) in (((((v_allOwnedPresent dtb_u_u419) dtb_u_u420) dtb_u_u421) (v_artifactNamesOf dtb_u_u422)) dtb_u_u424)))

# 903 "Vuna/Compiler/Driver/Iface.vuna"
let v_ifaceOfModule = (fun (dtb_u_u425 : string) (dtb_u_u426 : t_SourceInfo) (dtb_u_u427 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u428 : string B_dData_dList.t_List) (dtb_u_u429 : t_ModuleIface B_dData_dList.t_List) (dtb_u_u430 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u431 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u432 : Elab_dTypes.t_DtProgram) (dtb_u_u433 : (string) -> string) (dtb_u_u434 : string) -> (let dtb_u_u435 = (B_dData_dList.v_reverse ((B_dData_dList.v_filter (fun (dtb_u_u449 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u449) = dtb_u_u425))) dtb_u_u430)) in (let dtb_u_u436 = ((B_dData_dList.v_map (fun (dtb_u_u448 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u448); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u448) })) dtb_u_u430) in (let dtb_u_u437 = ((Driver_dOwner.v_splitMetaOf dtb_u_u436) dtb_u_u431) in (let dtb_u_u438 = ((v_ownerIndexOf dtb_u_u437) (Elab_dTypes.v_dtProgDatas dtb_u_u432)) in (let dtb_u_u439 = ((v_progPartsOf dtb_u_u438) dtb_u_u432) in (let dtb_u_u440 = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) dtb_u_u435) in (match ((v_findNamedModule dtb_u_u435) dtb_u_u434) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["iface: module "; dtb_u_u434; " is not part of the checked package"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u441) -> (let dtb_u_u442 = (((((((v_mkIfaceBase dtb_u_u425) dtb_u_u439) dtb_u_u432) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u434; B_dData_dPair.f_Pair_second = dtb_u_u426 }, B_dData_dList.C_List_Nil))) B_dData_dList.C_List_Nil) dtb_u_u433) dtb_u_u441) in (let dtb_u_u443 = ((B_dData_dList.v_append dtb_u_u427) ((B_dData_dList.v_map (fun (dtb_u_u447 : t_ModuleIface) -> { B_dData_dPair.f_Pair_first = (v_miNameOf dtb_u_u447); B_dData_dPair.f_Pair_second = (v_miIfaceHashOf dtb_u_u447) })) ((B_dData_dList.v_append dtb_u_u429) (B_dData_dList.C_List__x58__x58_ (dtb_u_u442, B_dData_dList.C_List_Nil))))) in (let dtb_u_u444 = ((((v_finishIface dtb_u_u443) B_dData_dList.C_List_Nil) dtb_u_u441) dtb_u_u442) in (let dtb_u_u445 = (match (((v_preparedForModule dtb_u_u435) dtb_u_u431) dtb_u_u434) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u444
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u446) -> ((v_setPrepared dtb_u_u446) dtb_u_u444)
  | _ -> failwith "DT: impossible branch"
) in (if (((((v_moduleCoverageOk dtb_u_u438) dtb_u_u428) dtb_u_u434) dtb_u_u432) dtb_u_u445) then (Base_dDiag.C_Check_OkC (dtb_u_u445)) else (Base_dDiag.v_icInternal (String.concat "" ["iface: module "; dtb_u_u434; " has uncovered artifacts"])))))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 928 "Vuna/Compiler/Driver/Iface.vuna"
let[@tail_mod_cons] rec v_moduleNamesOf = (fun (dtb_u_u450 : t_ModuleIface B_dData_dList.t_List) -> (match dtb_u_u450 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u451, dtb_u_u452) -> (B_dData_dList.C_List__x58__x58_ ((v_miNameOf dtb_u_u451), (v_moduleNamesOf dtb_u_u452)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 933 "Vuna/Compiler/Driver/Iface.vuna"
let v_encSourceInfo = (fun (dtb_u_u453 : t_SourceInfo) (dtb_u_u454 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u453).f_SourceInfo_siPath) ((Base_dBytes.v_encStr (dtb_u_u453).f_SourceInfo_siHash) ((Base_dBytes.v_encInt (dtb_u_u453).f_SourceInfo_siMtime) ((Base_dBytes.v_encInt (dtb_u_u453).f_SourceInfo_siSize) dtb_u_u454)))))

# 936 "Vuna/Compiler/Driver/Iface.vuna"
let v_decSourceInfo = (fun (dtb_u_u455 : int) (dtb_u_u456 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u455 - 1)) dtb_u_u456)) (fun (dtb_u_u457 : string) (dtb_u_u458 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u455 - 1)) dtb_u_u458)) (fun (dtb_u_u459 : string) (dtb_u_u460 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u455 - 1)) dtb_u_u460)) (fun (dtb_u_u461 : int) (dtb_u_u462 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u455 - 1)) dtb_u_u462)) (fun (dtb_u_u463 : int) (dtb_u_u464 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_SourceInfo_siPath = dtb_u_u457; f_SourceInfo_siHash = dtb_u_u459; f_SourceInfo_siMtime = dtb_u_u461; f_SourceInfo_siSize = dtb_u_u463 }; B_dData_dPair.f_Pair_second = dtb_u_u464 })))))))))))

# 942 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDepPair = (fun (dtb_u_u465 : (string, string) B_dData_dPair.t_Pair) (dtb_u_u466 : string B_dData_dList.t_List) -> (match dtb_u_u465 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u467; B_dData_dPair.f_Pair_second = dtb_u_u468 } -> ((Base_dBytes.v_encStr dtb_u_u467) ((Base_dBytes.v_encStr dtb_u_u468) dtb_u_u466))
  | _ -> failwith "DT: impossible branch"
))

# 945 "Vuna/Compiler/Driver/Iface.vuna"
let v_decDepPair = (fun (dtb_u_u469 : int) (dtb_u_u470 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u469 - 1)) dtb_u_u470)) (fun (dtb_u_u471 : string) (dtb_u_u472 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u469 - 1)) dtb_u_u472)) (fun (dtb_u_u473 : string) (dtb_u_u474 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u471; B_dData_dPair.f_Pair_second = dtb_u_u473 }; B_dData_dPair.f_Pair_second = dtb_u_u474 })))))))

# 952 "Vuna/Compiler/Driver/Iface.vuna"
let v_encDefLoc = (fun (dtb_u_u475 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u476 : string B_dData_dList.t_List) -> (match dtb_u_u475 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u477; B_dData_dPair.f_Pair_second = dtb_u_u478 } -> (match dtb_u_u478 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u479; B_dData_dPair.f_Pair_second = dtb_u_u480 } -> ((Base_dBytes.v_encStr dtb_u_u477) ((Base_dBytes.v_encStr dtb_u_u479) ((Base_dBytes.v_encInt dtb_u_u480) dtb_u_u476)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 955 "Vuna/Compiler/Driver/Iface.vuna"
let v_decDefLoc = (fun (dtb_u_u481 : int) (dtb_u_u482 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u481 - 1)) dtb_u_u482)) (fun (dtb_u_u483 : string) (dtb_u_u484 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (dtb_u_u481 - 1)) dtb_u_u484)) (fun (dtb_u_u485 : string) (dtb_u_u486 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decInt (dtb_u_u481 - 1)) dtb_u_u486)) (fun (dtb_u_u487 : int) (dtb_u_u488 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u483; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u485; B_dData_dPair.f_Pair_second = dtb_u_u487 } }; B_dData_dPair.f_Pair_second = dtb_u_u488 })))))))))

# 962 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIfacePayload = (fun (dtb_u_u489 : t_ModuleIface) (dtb_u_u490 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u489).f_ModuleIface_miName) ((Base_dBytes.v_encStr (dtb_u_u489).f_ModuleIface_miPackage) ((v_encSourceInfo (dtb_u_u489).f_ModuleIface_miSource) ((Base_dBytes.v_encStr (dtb_u_u489).f_ModuleIface_miIfaceHash) (((Base_dBytes.v_encList v_encDepPair) (dtb_u_u489).f_ModuleIface_miDepHashes) (((Base_dBytes.v_encList Elab_dCanonical.v_encImport) (dtb_u_u489).f_ModuleIface_miImports) (((Base_dBytes.v_encList Elab_dCanonical.v_encImport) (dtb_u_u489).f_ModuleIface_miImplicitImports) (((Base_dBytes.v_encList Elab_dCanonical.v_encExportEntry) (dtb_u_u489).f_ModuleIface_miExports) (((Base_dBytes.v_encList Elab_dCanonical.v_encFixity) (dtb_u_u489).f_ModuleIface_miFixities) (((Base_dBytes.v_encList Frontend_dCanonical_dAst.v_encDecl) (dtb_u_u489).f_ModuleIface_miDecls) (((Base_dBytes.v_encList Elab_dCanonical.v_encRecordMeta) (dtb_u_u489).f_ModuleIface_miRecords) (((Base_dBytes.v_encList Frontend_dCanonical_dAst.v_encDecl) (dtb_u_u489).f_ModuleIface_miPrepared) ((Driver_dCache.v_encCachedProgram (dtb_u_u489).f_ModuleIface_miCached) (((Base_dBytes.v_encList v_encDefLoc) (dtb_u_u489).f_ModuleIface_miDefLocs) dtb_u_u490)))))))))))))))

# 969 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIfaceAt = v_encModuleIfacePayload

# 972 "Vuna/Compiler/Driver/Iface.vuna"
let v_encModuleIface = (fun (dtb_u_u491 : t_ModuleIface) -> ((Base_dBytes.v_encTop v_encModuleIfacePayload) dtb_u_u491))

# 978 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfacePayload = (fun (dtb_u_u492 : int) (dtb_u_u493 : Base_dBytes.t_Cur) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Base_dBytes.v_decStr (dtb_u_u492 - 1)) dtb_u_u493)) (fun dtb_u_u494 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Base_dBytes.v_decStr (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u494))) (fun dtb_u_u495 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((v_decSourceInfo (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u495))) (fun dtb_u_u496 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Base_dBytes.v_decStr (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u496))) (fun dtb_u_u497 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList v_decDepPair) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u497))) (fun dtb_u_u498 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decImport) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u498))) (fun dtb_u_u499 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decImport) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u499))) (fun dtb_u_u500 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decExportEntry) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u500))) (fun dtb_u_u501 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decFixity) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u501))) (fun dtb_u_u502 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Frontend_dCanonical_dAst.v_decDecl) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u502))) (fun dtb_u_u503 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Elab_dCanonical.v_decRecordMeta) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u503))) (fun dtb_u_u504 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList Frontend_dCanonical_dAst.v_decDecl) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u504))) (fun dtb_u_u505 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) ((Driver_dCache.v_decCachedProgram (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u505))) (fun dtb_u_u506 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dData_dMaybe.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) (((Base_dBytes.v_decList v_decDefLoc) (dtb_u_u492 - 1)) (B_dData_dPair.v_secondOf dtb_u_u506))) (fun dtb_u_u507 -> ((B_dTrait_dApplicative.v_pure B_dData_dMaybe.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) { B_dData_dPair.f_Pair_first = { f_ModuleIface_miName = (B_dData_dPair.v_firstOf dtb_u_u494); f_ModuleIface_miPackage = (B_dData_dPair.v_firstOf dtb_u_u495); f_ModuleIface_miSource = (B_dData_dPair.v_firstOf dtb_u_u496); f_ModuleIface_miIfaceHash = (B_dData_dPair.v_firstOf dtb_u_u497); f_ModuleIface_miDepHashes = (B_dData_dPair.v_firstOf dtb_u_u498); f_ModuleIface_miImports = (B_dData_dPair.v_firstOf dtb_u_u499); f_ModuleIface_miImplicitImports = (B_dData_dPair.v_firstOf dtb_u_u500); f_ModuleIface_miExports = (B_dData_dPair.v_firstOf dtb_u_u501); f_ModuleIface_miFixities = (B_dData_dPair.v_firstOf dtb_u_u502); f_ModuleIface_miDecls = (B_dData_dPair.v_firstOf dtb_u_u503); f_ModuleIface_miRecords = (B_dData_dPair.v_firstOf dtb_u_u504); f_ModuleIface_miPrepared = (B_dData_dPair.v_firstOf dtb_u_u505); f_ModuleIface_miCached = (B_dData_dPair.v_firstOf dtb_u_u506); f_ModuleIface_miDefLocs = (B_dData_dPair.v_firstOf dtb_u_u507) }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u507) }))))))))))))))))))))))))))))))

# 975 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfaceAt = v_decModuleIfacePayload

# 998 "Vuna/Compiler/Driver/Iface.vuna"
let v_decModuleIfaceComplete = (fun (dtb_u_u508 : string) -> (let dtb_u_u509 = ((v_decModuleIfacePayload (String.length dtb_u_u508)) (Base_dBytes.v_curOf dtb_u_u508)) in (match dtb_u_u509 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u510) -> (match dtb_u_u510 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u511; B_dData_dPair.f_Pair_second = dtb_u_u512 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u512) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u511)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 59 "Vuna/Compiler/Driver/Iface.vuna"
let v_siPath = (fun (dtb_u_u513 : t_SourceInfo) -> (match dtb_u_u513 with
  | { f_SourceInfo_siPath = dtb_u_u514; f_SourceInfo_siHash = dtb_u_u515; f_SourceInfo_siMtime = dtb_u_u516; f_SourceInfo_siSize = dtb_u_u517 } -> dtb_u_u514
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Driver/Iface.vuna"
let v_siHash = (fun (dtb_u_u518 : t_SourceInfo) -> (match dtb_u_u518 with
  | { f_SourceInfo_siPath = dtb_u_u519; f_SourceInfo_siHash = dtb_u_u520; f_SourceInfo_siMtime = dtb_u_u521; f_SourceInfo_siSize = dtb_u_u522 } -> dtb_u_u520
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Driver/Iface.vuna"
let v_siMtime = (fun (dtb_u_u523 : t_SourceInfo) -> (match dtb_u_u523 with
  | { f_SourceInfo_siPath = dtb_u_u524; f_SourceInfo_siHash = dtb_u_u525; f_SourceInfo_siMtime = dtb_u_u526; f_SourceInfo_siSize = dtb_u_u527 } -> dtb_u_u526
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Driver/Iface.vuna"
let v_siSize = (fun (dtb_u_u528 : t_SourceInfo) -> (match dtb_u_u528 with
  | { f_SourceInfo_siPath = dtb_u_u529; f_SourceInfo_siHash = dtb_u_u530; f_SourceInfo_siMtime = dtb_u_u531; f_SourceInfo_siSize = dtb_u_u532 } -> dtb_u_u532
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Driver/Iface.vuna"
let v_miName = (fun (dtb_u_u533 : t_ModuleIface) -> (match dtb_u_u533 with
  | { f_ModuleIface_miName = dtb_u_u534; f_ModuleIface_miPackage = dtb_u_u535; f_ModuleIface_miSource = dtb_u_u536; f_ModuleIface_miIfaceHash = dtb_u_u537; f_ModuleIface_miDepHashes = dtb_u_u538; f_ModuleIface_miImports = dtb_u_u539; f_ModuleIface_miImplicitImports = dtb_u_u540; f_ModuleIface_miExports = dtb_u_u541; f_ModuleIface_miFixities = dtb_u_u542; f_ModuleIface_miDecls = dtb_u_u543; f_ModuleIface_miRecords = dtb_u_u544; f_ModuleIface_miPrepared = dtb_u_u545; f_ModuleIface_miCached = dtb_u_u546; f_ModuleIface_miDefLocs = dtb_u_u547 } -> dtb_u_u534
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPackage = (fun (dtb_u_u548 : t_ModuleIface) -> (match dtb_u_u548 with
  | { f_ModuleIface_miName = dtb_u_u549; f_ModuleIface_miPackage = dtb_u_u550; f_ModuleIface_miSource = dtb_u_u551; f_ModuleIface_miIfaceHash = dtb_u_u552; f_ModuleIface_miDepHashes = dtb_u_u553; f_ModuleIface_miImports = dtb_u_u554; f_ModuleIface_miImplicitImports = dtb_u_u555; f_ModuleIface_miExports = dtb_u_u556; f_ModuleIface_miFixities = dtb_u_u557; f_ModuleIface_miDecls = dtb_u_u558; f_ModuleIface_miRecords = dtb_u_u559; f_ModuleIface_miPrepared = dtb_u_u560; f_ModuleIface_miCached = dtb_u_u561; f_ModuleIface_miDefLocs = dtb_u_u562 } -> dtb_u_u550
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Driver/Iface.vuna"
let v_miSource = (fun (dtb_u_u563 : t_ModuleIface) -> (match dtb_u_u563 with
  | { f_ModuleIface_miName = dtb_u_u564; f_ModuleIface_miPackage = dtb_u_u565; f_ModuleIface_miSource = dtb_u_u566; f_ModuleIface_miIfaceHash = dtb_u_u567; f_ModuleIface_miDepHashes = dtb_u_u568; f_ModuleIface_miImports = dtb_u_u569; f_ModuleIface_miImplicitImports = dtb_u_u570; f_ModuleIface_miExports = dtb_u_u571; f_ModuleIface_miFixities = dtb_u_u572; f_ModuleIface_miDecls = dtb_u_u573; f_ModuleIface_miRecords = dtb_u_u574; f_ModuleIface_miPrepared = dtb_u_u575; f_ModuleIface_miCached = dtb_u_u576; f_ModuleIface_miDefLocs = dtb_u_u577 } -> dtb_u_u566
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Driver/Iface.vuna"
let v_miIfaceHash = (fun (dtb_u_u578 : t_ModuleIface) -> (match dtb_u_u578 with
  | { f_ModuleIface_miName = dtb_u_u579; f_ModuleIface_miPackage = dtb_u_u580; f_ModuleIface_miSource = dtb_u_u581; f_ModuleIface_miIfaceHash = dtb_u_u582; f_ModuleIface_miDepHashes = dtb_u_u583; f_ModuleIface_miImports = dtb_u_u584; f_ModuleIface_miImplicitImports = dtb_u_u585; f_ModuleIface_miExports = dtb_u_u586; f_ModuleIface_miFixities = dtb_u_u587; f_ModuleIface_miDecls = dtb_u_u588; f_ModuleIface_miRecords = dtb_u_u589; f_ModuleIface_miPrepared = dtb_u_u590; f_ModuleIface_miCached = dtb_u_u591; f_ModuleIface_miDefLocs = dtb_u_u592 } -> dtb_u_u582
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDepHashes = (fun (dtb_u_u593 : t_ModuleIface) -> (match dtb_u_u593 with
  | { f_ModuleIface_miName = dtb_u_u594; f_ModuleIface_miPackage = dtb_u_u595; f_ModuleIface_miSource = dtb_u_u596; f_ModuleIface_miIfaceHash = dtb_u_u597; f_ModuleIface_miDepHashes = dtb_u_u598; f_ModuleIface_miImports = dtb_u_u599; f_ModuleIface_miImplicitImports = dtb_u_u600; f_ModuleIface_miExports = dtb_u_u601; f_ModuleIface_miFixities = dtb_u_u602; f_ModuleIface_miDecls = dtb_u_u603; f_ModuleIface_miRecords = dtb_u_u604; f_ModuleIface_miPrepared = dtb_u_u605; f_ModuleIface_miCached = dtb_u_u606; f_ModuleIface_miDefLocs = dtb_u_u607 } -> dtb_u_u598
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImports = (fun (dtb_u_u608 : t_ModuleIface) -> (match dtb_u_u608 with
  | { f_ModuleIface_miName = dtb_u_u609; f_ModuleIface_miPackage = dtb_u_u610; f_ModuleIface_miSource = dtb_u_u611; f_ModuleIface_miIfaceHash = dtb_u_u612; f_ModuleIface_miDepHashes = dtb_u_u613; f_ModuleIface_miImports = dtb_u_u614; f_ModuleIface_miImplicitImports = dtb_u_u615; f_ModuleIface_miExports = dtb_u_u616; f_ModuleIface_miFixities = dtb_u_u617; f_ModuleIface_miDecls = dtb_u_u618; f_ModuleIface_miRecords = dtb_u_u619; f_ModuleIface_miPrepared = dtb_u_u620; f_ModuleIface_miCached = dtb_u_u621; f_ModuleIface_miDefLocs = dtb_u_u622 } -> dtb_u_u614
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Driver/Iface.vuna"
let v_miImplicitImports = (fun (dtb_u_u623 : t_ModuleIface) -> (match dtb_u_u623 with
  | { f_ModuleIface_miName = dtb_u_u624; f_ModuleIface_miPackage = dtb_u_u625; f_ModuleIface_miSource = dtb_u_u626; f_ModuleIface_miIfaceHash = dtb_u_u627; f_ModuleIface_miDepHashes = dtb_u_u628; f_ModuleIface_miImports = dtb_u_u629; f_ModuleIface_miImplicitImports = dtb_u_u630; f_ModuleIface_miExports = dtb_u_u631; f_ModuleIface_miFixities = dtb_u_u632; f_ModuleIface_miDecls = dtb_u_u633; f_ModuleIface_miRecords = dtb_u_u634; f_ModuleIface_miPrepared = dtb_u_u635; f_ModuleIface_miCached = dtb_u_u636; f_ModuleIface_miDefLocs = dtb_u_u637 } -> dtb_u_u630
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Iface.vuna"
let v_miExports = (fun (dtb_u_u638 : t_ModuleIface) -> (match dtb_u_u638 with
  | { f_ModuleIface_miName = dtb_u_u639; f_ModuleIface_miPackage = dtb_u_u640; f_ModuleIface_miSource = dtb_u_u641; f_ModuleIface_miIfaceHash = dtb_u_u642; f_ModuleIface_miDepHashes = dtb_u_u643; f_ModuleIface_miImports = dtb_u_u644; f_ModuleIface_miImplicitImports = dtb_u_u645; f_ModuleIface_miExports = dtb_u_u646; f_ModuleIface_miFixities = dtb_u_u647; f_ModuleIface_miDecls = dtb_u_u648; f_ModuleIface_miRecords = dtb_u_u649; f_ModuleIface_miPrepared = dtb_u_u650; f_ModuleIface_miCached = dtb_u_u651; f_ModuleIface_miDefLocs = dtb_u_u652 } -> dtb_u_u646
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Driver/Iface.vuna"
let v_miFixities = (fun (dtb_u_u653 : t_ModuleIface) -> (match dtb_u_u653 with
  | { f_ModuleIface_miName = dtb_u_u654; f_ModuleIface_miPackage = dtb_u_u655; f_ModuleIface_miSource = dtb_u_u656; f_ModuleIface_miIfaceHash = dtb_u_u657; f_ModuleIface_miDepHashes = dtb_u_u658; f_ModuleIface_miImports = dtb_u_u659; f_ModuleIface_miImplicitImports = dtb_u_u660; f_ModuleIface_miExports = dtb_u_u661; f_ModuleIface_miFixities = dtb_u_u662; f_ModuleIface_miDecls = dtb_u_u663; f_ModuleIface_miRecords = dtb_u_u664; f_ModuleIface_miPrepared = dtb_u_u665; f_ModuleIface_miCached = dtb_u_u666; f_ModuleIface_miDefLocs = dtb_u_u667 } -> dtb_u_u662
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDecls = (fun (dtb_u_u668 : t_ModuleIface) -> (match dtb_u_u668 with
  | { f_ModuleIface_miName = dtb_u_u669; f_ModuleIface_miPackage = dtb_u_u670; f_ModuleIface_miSource = dtb_u_u671; f_ModuleIface_miIfaceHash = dtb_u_u672; f_ModuleIface_miDepHashes = dtb_u_u673; f_ModuleIface_miImports = dtb_u_u674; f_ModuleIface_miImplicitImports = dtb_u_u675; f_ModuleIface_miExports = dtb_u_u676; f_ModuleIface_miFixities = dtb_u_u677; f_ModuleIface_miDecls = dtb_u_u678; f_ModuleIface_miRecords = dtb_u_u679; f_ModuleIface_miPrepared = dtb_u_u680; f_ModuleIface_miCached = dtb_u_u681; f_ModuleIface_miDefLocs = dtb_u_u682 } -> dtb_u_u678
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/Iface.vuna"
let v_miRecords = (fun (dtb_u_u683 : t_ModuleIface) -> (match dtb_u_u683 with
  | { f_ModuleIface_miName = dtb_u_u684; f_ModuleIface_miPackage = dtb_u_u685; f_ModuleIface_miSource = dtb_u_u686; f_ModuleIface_miIfaceHash = dtb_u_u687; f_ModuleIface_miDepHashes = dtb_u_u688; f_ModuleIface_miImports = dtb_u_u689; f_ModuleIface_miImplicitImports = dtb_u_u690; f_ModuleIface_miExports = dtb_u_u691; f_ModuleIface_miFixities = dtb_u_u692; f_ModuleIface_miDecls = dtb_u_u693; f_ModuleIface_miRecords = dtb_u_u694; f_ModuleIface_miPrepared = dtb_u_u695; f_ModuleIface_miCached = dtb_u_u696; f_ModuleIface_miDefLocs = dtb_u_u697 } -> dtb_u_u694
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Driver/Iface.vuna"
let v_miPrepared = (fun (dtb_u_u698 : t_ModuleIface) -> (match dtb_u_u698 with
  | { f_ModuleIface_miName = dtb_u_u699; f_ModuleIface_miPackage = dtb_u_u700; f_ModuleIface_miSource = dtb_u_u701; f_ModuleIface_miIfaceHash = dtb_u_u702; f_ModuleIface_miDepHashes = dtb_u_u703; f_ModuleIface_miImports = dtb_u_u704; f_ModuleIface_miImplicitImports = dtb_u_u705; f_ModuleIface_miExports = dtb_u_u706; f_ModuleIface_miFixities = dtb_u_u707; f_ModuleIface_miDecls = dtb_u_u708; f_ModuleIface_miRecords = dtb_u_u709; f_ModuleIface_miPrepared = dtb_u_u710; f_ModuleIface_miCached = dtb_u_u711; f_ModuleIface_miDefLocs = dtb_u_u712 } -> dtb_u_u710
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/Iface.vuna"
let v_miCached = (fun (dtb_u_u713 : t_ModuleIface) -> (match dtb_u_u713 with
  | { f_ModuleIface_miName = dtb_u_u714; f_ModuleIface_miPackage = dtb_u_u715; f_ModuleIface_miSource = dtb_u_u716; f_ModuleIface_miIfaceHash = dtb_u_u717; f_ModuleIface_miDepHashes = dtb_u_u718; f_ModuleIface_miImports = dtb_u_u719; f_ModuleIface_miImplicitImports = dtb_u_u720; f_ModuleIface_miExports = dtb_u_u721; f_ModuleIface_miFixities = dtb_u_u722; f_ModuleIface_miDecls = dtb_u_u723; f_ModuleIface_miRecords = dtb_u_u724; f_ModuleIface_miPrepared = dtb_u_u725; f_ModuleIface_miCached = dtb_u_u726; f_ModuleIface_miDefLocs = dtb_u_u727 } -> dtb_u_u726
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Driver/Iface.vuna"
let v_miDefLocs = (fun (dtb_u_u728 : t_ModuleIface) -> (match dtb_u_u728 with
  | { f_ModuleIface_miName = dtb_u_u729; f_ModuleIface_miPackage = dtb_u_u730; f_ModuleIface_miSource = dtb_u_u731; f_ModuleIface_miIfaceHash = dtb_u_u732; f_ModuleIface_miDepHashes = dtb_u_u733; f_ModuleIface_miImports = dtb_u_u734; f_ModuleIface_miImplicitImports = dtb_u_u735; f_ModuleIface_miExports = dtb_u_u736; f_ModuleIface_miFixities = dtb_u_u737; f_ModuleIface_miDecls = dtb_u_u738; f_ModuleIface_miRecords = dtb_u_u739; f_ModuleIface_miPrepared = dtb_u_u740; f_ModuleIface_miCached = dtb_u_u741; f_ModuleIface_miDefLocs = dtb_u_u742 } -> dtb_u_u742
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Driver/Iface.vuna"
let v_csNext = (fun (dtb_u_u743 : t_CanonState) -> (match dtb_u_u743 with
  | { f_CanonState_csNext = dtb_u_u744; f_CanonState_csMap = dtb_u_u745 } -> dtb_u_u744
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Driver/Iface.vuna"
let v_csMap = (fun (dtb_u_u746 : t_CanonState) -> (match dtb_u_u746 with
  | { f_CanonState_csNext = dtb_u_u747; f_CanonState_csMap = dtb_u_u748 } -> dtb_u_u748
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiDef = (fun (dtb_u_u749 : t_OwnerIndex) -> (match dtb_u_u749 with
  | { f_OwnerIndex_oiDef = dtb_u_u750; f_OwnerIndex_oiData = dtb_u_u751; f_OwnerIndex_oiCtor = dtb_u_u752; f_OwnerIndex_oiKnown = dtb_u_u753 } -> dtb_u_u750
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiData = (fun (dtb_u_u754 : t_OwnerIndex) -> (match dtb_u_u754 with
  | { f_OwnerIndex_oiDef = dtb_u_u755; f_OwnerIndex_oiData = dtb_u_u756; f_OwnerIndex_oiCtor = dtb_u_u757; f_OwnerIndex_oiKnown = dtb_u_u758 } -> dtb_u_u756
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiCtor = (fun (dtb_u_u759 : t_OwnerIndex) -> (match dtb_u_u759 with
  | { f_OwnerIndex_oiDef = dtb_u_u760; f_OwnerIndex_oiData = dtb_u_u761; f_OwnerIndex_oiCtor = dtb_u_u762; f_OwnerIndex_oiKnown = dtb_u_u763 } -> dtb_u_u762
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Driver/Iface.vuna"
let v_oiKnown = (fun (dtb_u_u764 : t_OwnerIndex) -> (match dtb_u_u764 with
  | { f_OwnerIndex_oiDef = dtb_u_u765; f_OwnerIndex_oiData = dtb_u_u766; f_OwnerIndex_oiCtor = dtb_u_u767; f_OwnerIndex_oiKnown = dtb_u_u768 } -> dtb_u_u768
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppSols = (fun (dtb_u_u769 : t_ProgParts) -> (match dtb_u_u769 with
  | { f_ProgParts_ppSols = dtb_u_u770; f_ProgParts_ppDatas = dtb_u_u771; f_ProgParts_ppDefs = dtb_u_u772; f_ProgParts_ppGlobals = dtb_u_u773; f_ProgParts_ppInsts = dtb_u_u774; f_ProgParts_ppClasses = dtb_u_u775 } -> dtb_u_u770
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppDatas = (fun (dtb_u_u776 : t_ProgParts) -> (match dtb_u_u776 with
  | { f_ProgParts_ppSols = dtb_u_u777; f_ProgParts_ppDatas = dtb_u_u778; f_ProgParts_ppDefs = dtb_u_u779; f_ProgParts_ppGlobals = dtb_u_u780; f_ProgParts_ppInsts = dtb_u_u781; f_ProgParts_ppClasses = dtb_u_u782 } -> dtb_u_u778
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppDefs = (fun (dtb_u_u783 : t_ProgParts) -> (match dtb_u_u783 with
  | { f_ProgParts_ppSols = dtb_u_u784; f_ProgParts_ppDatas = dtb_u_u785; f_ProgParts_ppDefs = dtb_u_u786; f_ProgParts_ppGlobals = dtb_u_u787; f_ProgParts_ppInsts = dtb_u_u788; f_ProgParts_ppClasses = dtb_u_u789 } -> dtb_u_u786
  | _ -> failwith "DT: impossible branch"
))

# 622 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppGlobals = (fun (dtb_u_u790 : t_ProgParts) -> (match dtb_u_u790 with
  | { f_ProgParts_ppSols = dtb_u_u791; f_ProgParts_ppDatas = dtb_u_u792; f_ProgParts_ppDefs = dtb_u_u793; f_ProgParts_ppGlobals = dtb_u_u794; f_ProgParts_ppInsts = dtb_u_u795; f_ProgParts_ppClasses = dtb_u_u796 } -> dtb_u_u794
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppInsts = (fun (dtb_u_u797 : t_ProgParts) -> (match dtb_u_u797 with
  | { f_ProgParts_ppSols = dtb_u_u798; f_ProgParts_ppDatas = dtb_u_u799; f_ProgParts_ppDefs = dtb_u_u800; f_ProgParts_ppGlobals = dtb_u_u801; f_ProgParts_ppInsts = dtb_u_u802; f_ProgParts_ppClasses = dtb_u_u803 } -> dtb_u_u802
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Driver/Iface.vuna"
let v_ppClasses = (fun (dtb_u_u804 : t_ProgParts) -> (match dtb_u_u804 with
  | { f_ProgParts_ppSols = dtb_u_u805; f_ProgParts_ppDatas = dtb_u_u806; f_ProgParts_ppDefs = dtb_u_u807; f_ProgParts_ppGlobals = dtb_u_u808; f_ProgParts_ppInsts = dtb_u_u809; f_ProgParts_ppClasses = dtb_u_u810 } -> dtb_u_u810
  | _ -> failwith "DT: impossible branch"
))
