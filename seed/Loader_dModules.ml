open Vuna_runtime
type t_Module = { f_Module_moduleNameOf : string; f_Module_modulePackageOf : string; f_Module_moduleImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleImplicitImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleDeclsOf : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Module_moduleExportsOf : t_ExportEntry B_dData_dList.t_List; f_Module_moduleFixitiesOf : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Module_moduleReexportsOf : string B_dData_dList.t_List; f_Module_moduleOpaqueOf : string B_dData_dList.t_List; f_Module_moduleExportIndexOf : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_Module_moduleFixFactsOf : Frontend_dCst.t_FixityFacts }
and t_Project = { f_Project_projectEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Project_projectEntryImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectModules : t_Module B_dData_dList.t_List; f_Project_projectEntryPkg : string; f_Project_projectEntryFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Project_projectEntryName : string; f_Project_projectEntryFacts : Frontend_dCst.t_FixityFacts }
and t_Namespaces = { f_Namespaces_nsValues : string B_dData_dList.t_List; f_Namespaces_nsCtors : string B_dData_dList.t_List; f_Namespaces_nsTypes : string B_dData_dList.t_List; f_Namespaces_nsValueSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsTypeSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorCands : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Namespaces_nsModuleTbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsOpenNames : string B_dData_dList.t_List; f_Namespaces_nsRelease : bool }
and t_ExportEntry = { f_ExportEntry_kind : string; f_ExportEntry_public : string; f_ExportEntry_target : string; f_ExportEntry_parent : string }
and t_ExportRef = { f_ExportRef_refKind : string; f_ExportRef_refTarget : string; f_ExportRef_refParent : string }

# 98 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry = (B_dTrait_dEq.C_Eq_Eq ((fun sx sy -> (match sx with
  | { f_ExportEntry_kind = dtb__0; f_ExportEntry_public = dtb__1; f_ExportEntry_target = dtb__2; f_ExportEntry_parent = dtb__3 } -> (match sy with
  | { f_ExportEntry_kind = dtb__4; f_ExportEntry_public = dtb__5; f_ExportEntry_target = dtb__6; f_ExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((B_dTrait_dEq.v__x61__x61_ v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry) sx) sy) then false else true))))

# 63 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleAllImportsOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__8; f_Module_modulePackageOf = dtb__9; f_Module_moduleImportsOf = dtb__10; f_Module_moduleImplicitImportsOf = dtb__11; f_Module_moduleDeclsOf = dtb__12; f_Module_moduleExportsOf = dtb__13; f_Module_moduleFixitiesOf = dtb__14; f_Module_moduleReexportsOf = dtb__15; f_Module_moduleOpaqueOf = dtb__16; f_Module_moduleExportIndexOf = dtb__17; f_Module_moduleFixFactsOf = dtb__18 } -> ((B_dData_dList.v_append dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryAllImports = (fun (mc0 : t_Project) -> (match mc0 with
  | { f_Project_projectEntryDecls = dtb__19; f_Project_projectEntryImports = dtb__20; f_Project_projectImplicitImports = dtb__21; f_Project_projectModules = dtb__22; f_Project_projectEntryPkg = dtb__23; f_Project_projectEntryFixities = dtb__24; f_Project_projectEntryName = dtb__25; f_Project_projectEntryFacts = dtb__26 } -> ((B_dData_dList.v_append dtb__20) dtb__21)
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allIdentChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (if (if (Frontend_dLexer.v_isIdentStart dtb__27) then true else (Frontend_dLexer.v_isDigit dtb__27)) then (v_allIdentChars dtb__28) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Loader/Modules.vuna"
let v_validSegment = (fun (seg : string) -> (match (B_dData_dList.dtp_unpack seg) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (if (Frontend_dLexer.v_isUpperChar dtb__29) then (v_allIdentChars dtb__30) else false)
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allSegmentsValid = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (if (v_validSegment dtb__31) then (match dtb__32 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_allSegmentsValid dtb__32)
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Loader/Modules.vuna"
let v_validModuleName = (fun (name : string) -> (match (Base_dSource.v_splitOnDot name) with
  | B_dData_dList.C_List_Nil -> false
  | dtb__33 -> (v_allSegmentsValid dtb__33)
))

# 137 "Vuna/Compiler/Loader/Modules.vuna"
let v_mangle = (fun (prefix : string) (name : string) -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

# 155 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sliceEqGo = (fun (i : int) (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) (fuel : int) -> (if (fuel <= 0) then true else (if (i >= n) then true else (if ((let b = src in let k = (srcOff + i) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = (let b = dst in let k = (dstOff + i) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then (((((((v_sliceEqGo (i + 1)) srcOff) src) dstOff) dst) n) (fuel - 1)) else false))))

# 152 "Vuna/Compiler/Loader/Modules.vuna"
let v_sliceEq = (fun (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) -> (((((((v_sliceEqGo 0) srcOff) src) dstOff) dst) n) n))

# 141 "Vuna/Compiler/Loader/Modules.vuna"
let v_isMangled = (fun (prefix : string) (name : string) (target : string) -> (if (prefix = "") then (name = target) else (let lp = (String.length prefix) in (let ln = (String.length name) in (if (if (if ((String.length target) = ((lp + 1) + ln)) then ((let b = target in let k = lp in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) else false) then (((((v_sliceEq 0) prefix) 0) target) lp) else false) then (((((v_sliceEq 0) name) (lp + 1)) target) ln) else false)))))

# 168 "Vuna/Compiler/Loader/Modules.vuna"
let v_ctorCanonical = (fun (prefix : string) (dname : string) (cname : string) -> ((v_mangle prefix) (String.concat "" [dname; "."; cname])))

# 171 "Vuna/Compiler/Loader/Modules.vuna"
let v_importModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_map Frontend_dAst.v_importName) imports))

# 175 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImportSite = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 191 "Vuna/Compiler/Loader/Modules.vuna"
let v_aliasIs = (fun (q : string) (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (dtb__34 = q)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Loader/Modules.vuna"
let v_lastSegment = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Loader/Modules.vuna"
let v_notEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifierCandidates = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (q : string) -> (let strong = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_map Frontend_dAst.v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((Frontend_dAst.v_importName imp) = q))) imports))) ((B_dData_dList.v_map Frontend_dAst.v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_aliasIs q) imp))) imports)))) in (if (v_notEmptyList strong) then strong else (B_dData_dList.v_nubNames ((B_dData_dList.v_map Frontend_dAst.v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_lastSegment (Frontend_dAst.v_importName imp)) = q))) imports))))))

# 211 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_checkImportAliasSyntax = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match (dtb__39).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkImportAliasSyntax dtb__40)
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> (if (v_validSegment dtb__41) then (v_checkImportAliasSyntax dtb__40) else ((Base_dDiag.v_onErrDiag (v_withImportSite (Frontend_dAst.v_importSpan dtb__39))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidModuleAlias (dtb__41))) dtb__41)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Loader/Modules.vuna"
let v_validateImports = (fun (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_checkImportAliasSyntax imports))

# 226 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_openModuleNamesAll = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (if (dtb__42).Frontend_dAst.f_Import_importIsQualified then (v_openModuleNamesAll dtb__43) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.v_importName dtb__42), (v_openModuleNamesAll dtb__43))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Loader/Modules.vuna"
let v_openModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (B_dData_dList.v_nubNames (v_openModuleNamesAll imports)))

# 235 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findImportModule = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (if ((Frontend_dAst.v_importName dtb__44) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_importName dtb__44))) else (match (dtb__44).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> (if (dtb__46 = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_importName dtb__44))) else ((v_findImportModule dtb__45) mc1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findImportModule dtb__45) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_importByPrefix = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (let prefix = (match (dtb__47).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> dtb__49
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb__47).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
) in (if ((B_dData_dString.v_startsWith (prefix ^ ".")) mc1) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_importName dtb__47))) else ((v_importByPrefix dtb__48) mc1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifiedItemImport = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__50, dtb__51, dtb__52) -> ((v_importByPrefix mc0) dtb__50)
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__53, dtb__54) -> ((v_importByPrefix mc0) dtb__53)
  | Frontend_dAst.C_ExportItem_XBare (dtb__55, dtb__56) -> ((v_importByPrefix mc0) dtb__55)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 250 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_reexportedImportNamesGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__57 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__59, dtb__60, dtb__61) -> (match ((v_findImportModule mc0) dtb__59) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__58) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> (if ((B_dData_dList.v_memName dtb__62) mc2) then (((v_reexportedImportNamesGo mc0) dtb__58) mc2) else (((v_reexportedImportNamesGo mc0) dtb__58) (B_dData_dList.C_List__x58__x58_ (dtb__62, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportItem_XModule (dtb__63, dtb__64) -> (match ((v_findImportModule mc0) dtb__63) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__58) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (if ((B_dData_dList.v_memName dtb__65) mc2) then (((v_reexportedImportNamesGo mc0) dtb__58) mc2) else (((v_reexportedImportNamesGo mc0) dtb__58) (B_dData_dList.C_List__x58__x58_ (dtb__65, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_qualifiedItemImport mc0) dtb__57) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__58) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (if ((B_dData_dList.v_memName dtb__66) mc2) then (((v_reexportedImportNamesGo mc0) dtb__58) mc2) else (((v_reexportedImportNamesGo mc0) dtb__58) (B_dData_dList.C_List__x58__x58_ (dtb__66, mc2))))
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (((v_reexportedImportNamesGo imports) items) B_dData_dList.C_List_Nil))

# 297 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNamesOfHeader = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (match dtb__67 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__68; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__69; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__70; Frontend_dAst.f_ModDecl_modDeclExports = dtb__71; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__72; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__73; Frontend_dAst.f_ModDecl_modDeclRef = dtb__74 } -> (if dtb__69 then ((v_reexportedImportNames mc0) dtb__70) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 302 "Vuna/Compiler/Loader/Modules.vuna"
let rec v__ujoinNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (match dtb__76 with
  | B_dData_dList.C_List_Nil -> dtb__75
  | _ -> (String.concat "" [dtb__75; ", "; (v__ujoinNames dtb__76)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Loader/Modules.vuna"
let v_missingModule = (fun (name : string) -> (Base_dDiag.v_icInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

# 413 "Vuna/Compiler/Loader/Modules.vuna"
let v_entriesByName = (fun (name : string) (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) idx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__77) -> dtb__77
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_exportIndexOfGo = (fun (mc0 : t_ExportEntry B_dData_dList.t_List) (mc1 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (let tail = ((v_exportIndexOfGo dtb__79) mc1) in (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__78).f_ExportEntry_public) (B_dData_dList.C_List__x58__x58_ (dtb__78, ((v_entriesByName (dtb__78).f_ExportEntry_public) tail)))) tail))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOf = (fun (entries : t_ExportEntry B_dData_dList.t_List) -> ((v_exportIndexOfGo entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 439 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_lookupExport = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (if (if ((B_dData_dList.v_memName (dtb__80).f_ExportEntry_kind) mc0) then ((dtb__80).f_ExportEntry_public = mc1) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__80)) else (((v_lookupExport mc0) mc1) dtb__81))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValue = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 457 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_filterKinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (if (if ((B_dData_dList.v_memName (dtb__82).f_ExportEntry_kind) mc0) then ((dtb__82).f_ExportEntry_public = mc1) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__82, (((v_filterKinds mc0) mc1) dtb__83))) else (((v_filterKinds mc0) mc1) dtb__83))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValues = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 451 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypes = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 454 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModules = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 465 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtor = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) entries))

# 473 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_filterCtors = (fun (mc0 : string) (mc1 : t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if (if ((dtb__84).f_ExportEntry_kind = "ctor") then ((dtb__84).f_ExportEntry_public = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__84, ((v_filterCtors mc0) dtb__85))) else ((v_filterCtors mc0) dtb__85))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtors = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> ((v_filterCtors name) entries))

# 481 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportType = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 485 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModule = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 488 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModuleIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 491 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValueIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 494 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValuesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 497 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 500 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 503 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorsIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((v_filterCtors name) ((v_entriesByName name) idx)))

# 506 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypeIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 509 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingValueFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> ((Base_dCommon.v_bind (mc0 dtb__86)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportValuesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingValueFrom mc0) dtb__87) mc2)
  | dtb__88 -> ((Base_dCommon.v_bind (((v_modulesExportingValueFrom mc0) dtb__87) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = e })) dtb__88)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingCtorFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> ((Base_dCommon.v_bind (mc0 dtb__89)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (let found = ((v_findExportCtorsIn idx) mc2) in ((Base_dCommon.v_bind (((v_modulesExportingCtorFrom mc0) dtb__90) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = e })) found)) more))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingTypeFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> ((Base_dCommon.v_bind (mc0 dtb__91)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportTypesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingTypeFrom mc0) dtb__92) mc2)
  | dtb__93 -> ((Base_dCommon.v_bind (((v_modulesExportingTypeFrom mc0) dtb__92) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = e })) dtb__93)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sameTargetRest = (fun (mc0 : t_ExportEntry) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> (if ((mc0).f_ExportEntry_target = (dtb__97).f_ExportEntry_target) then ((v_sameTargetRest mc0) dtb__95) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Loader/Modules.vuna"
let v_unifyEntryPairs = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (if ((v_sameTargetRest (B_dData_dPair.v_secondOf dtb__98)) dtb__99) then (Base_dDiag.C_Check_OkC (dtb__98)) else (let mods = (v__ujoinNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99)))) in ((((Base_dDiagnostics_dRn.v_rnNoLoc3 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousName (mc1, mc2, mods))) mc1) mc2) mods)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePath = (fun (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (String.concat "" [(Frontend_dPackages_dPkg.v_rootDir root); "/"; (Base_dSource.v_joinSlashes (Base_dSource.v_splitOnDot name)); ".vuna"]))

# 588 "Vuna/Compiler/Loader/Modules.vuna"
let v_rootAllows = (fun (importerPkg : string) (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (match (root).Frontend_dPackages_dPkg.f_Root_rootExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> (if ((Frontend_dPackages_dPkg.v_rootName root) = importerPkg) then true else ((B_dData_dList.v_memName name) dtb__100))
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_rootOfName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__101) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__101)) else ((v_rootOfName mc0) dtb__102))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_collectModuleFiles = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (let path = ((v_modulePath dtb__103) mc1) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (if (((v_rootAllows mc2) dtb__103) mc1) then ((((((v_collectModuleFiles nFs) dtb__104) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = path; B_dData_dPair.f_Pair_second = dtb__103 }, mc3))) mc4) else ((((((v_collectModuleFiles nFs) dtb__104) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName dtb__103), mc4)))) else ((((((v_collectModuleFiles nFs) dtb__104) mc1) mc2) mc3) mc4)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc3); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Loader/Modules.vuna"
let v__ujoinRootDirs = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (v__ujoinNames ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) roots)))

# 627 "Vuna/Compiler/Loader/Modules.vuna"
let v_candidateDir = (fun (candidate : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootDir (B_dData_dPair.v_secondOf candidate)))

# 631 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImporterSpan = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 634 "Vuna/Compiler/Loader/Modules.vuna"
let v_findModuleFile = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (name : string) (importerPkg : string) (importerSpan : Base_dSource.t_Span) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_collectModuleFiles nFs) roots) name) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (let allowed = (B_dData_dPair.v_firstOf collected) in (let hidden = (B_dData_dPair.v_secondOf collected) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (let nd_uscrut10 = allowed in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__106 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__105))
  | _ -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (name, (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))) name) (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))
)
  | B_dData_dList.C_List_Nil -> (match hidden with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotFound (name, (v__ujoinRootDirs roots)))) name) (v__ujoinRootDirs roots)))
  | dtb__107 -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (v__ujoinNames hidden)))) name) (v__ujoinNames hidden)))
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 656 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOfOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__108; f_Module_modulePackageOf = dtb__109; f_Module_moduleImportsOf = dtb__110; f_Module_moduleImplicitImportsOf = dtb__111; f_Module_moduleDeclsOf = dtb__112; f_Module_moduleExportsOf = dtb__113; f_Module_moduleFixitiesOf = dtb__114; f_Module_moduleReexportsOf = dtb__115; f_Module_moduleOpaqueOf = dtb__116; f_Module_moduleExportIndexOf = dtb__117; f_Module_moduleFixFactsOf = dtb__118 } -> dtb__117
  | _ -> failwith "DT: impossible branch"
))

# 683 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_takeSegsLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__119, ((v_takeSegsLocal (mc0 - 1)) dtb__120))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_longestIndexPrefix = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (segs : string B_dData_dList.t_List) (k : int) -> (if (k <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findExportModuleIn idx) (Base_dSource.v_joinDots ((v_takeSegsLocal k) segs))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__121) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__121).f_ExportEntry_target; B_dData_dPair.f_Pair_second = k }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestIndexPrefix idx) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 687 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_dropFirst = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123)) else ((v_dropFirst (mc0 - 1)) dtb__123))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findModule = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__124 with
  | { f_Module_moduleNameOf = dtb__126; f_Module_modulePackageOf = dtb__127; f_Module_moduleImportsOf = dtb__128; f_Module_moduleImplicitImportsOf = dtb__129; f_Module_moduleDeclsOf = dtb__130; f_Module_moduleExportsOf = dtb__131; f_Module_moduleFixitiesOf = dtb__132; f_Module_moduleReexportsOf = dtb__133; f_Module_moduleOpaqueOf = dtb__134; f_Module_moduleExportIndexOf = dtb__135; f_Module_moduleFixFactsOf = dtb__136 } -> (if (dtb__126 = mc1) then (B_dData_dMaybe.C_Maybe_Just ({ f_Module_moduleNameOf = dtb__126; f_Module_modulePackageOf = dtb__127; f_Module_moduleImportsOf = dtb__128; f_Module_moduleImplicitImportsOf = dtb__129; f_Module_moduleDeclsOf = dtb__130; f_Module_moduleExportsOf = dtb__131; f_Module_moduleFixitiesOf = dtb__132; f_Module_moduleReexportsOf = dtb__133; f_Module_moduleOpaqueOf = dtb__134; f_Module_moduleExportIndexOf = dtb__135; f_Module_moduleFixFactsOf = dtb__136 })) else ((v_findModule dtb__125) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDecls = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (let nd_uscrut2 = ((v_findModule modules) name) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (match dtb__137 with
  | { f_Module_moduleNameOf = dtb__138; f_Module_modulePackageOf = dtb__139; f_Module_moduleImportsOf = dtb__140; f_Module_moduleImplicitImportsOf = dtb__141; f_Module_moduleDeclsOf = dtb__142; f_Module_moduleExportsOf = dtb__143; f_Module_moduleFixitiesOf = dtb__144; f_Module_moduleReexportsOf = dtb__145; f_Module_moduleOpaqueOf = dtb__146; f_Module_moduleExportIndexOf = dtb__147; f_Module_moduleFixFactsOf = dtb__148 } -> (Base_dDiag.C_Check_OkC (dtb__142))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 321 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleCtors = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((v_moduleDecls modules) name)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.v_ctorsOf decls))))))

# 734 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (if ((Frontend_dAst.v_ctorName dtb__149) = mc0) then true else ((v_anyCtorNamed mc0) dtb__150))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 723 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_isCtorTargetInDecls = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : string) (mc4 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | Frontend_dAst.C_Decl_DData (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> (if (if (((v_isMangled mc0) dtb__153) mc2) then ((v_anyCtorNamed mc3) dtb__156) else false) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__152))
  | Frontend_dAst.C_Decl_DRecord (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (if (((v_isMangled mc0) dtb__162) mc1) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__152))
  | _ -> (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__152)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Loader/Modules.vuna"
let v_isCtorCanonical = (fun (mname : string) (dname : string) (cname : string) (target : string) -> (let lm = (String.length mname) in (let ld = (String.length dname) in (let lc = (String.length cname) in (let second = ((lm + 1) + ld) in (if (if (if (if (if ((String.length target) = ((second + 1) + lc)) then ((let b = target in let k = lm in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) else false) then ((let b = target in let k = second in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) else false) then (((((v_sliceEq 0) mname) 0) target) lm) else false) then (((((v_sliceEq 0) dname) (lm + 1)) target) ld) else false) then (((((v_sliceEq 0) cname) (second + 1)) target) lc) else false))))))

# 739 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorTarget = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (if ((((v_isCtorCanonical mc0) mc1) (Frontend_dAst.v_ctorName dtb__170)) mc2) then true else ((((v_anyCtorTarget mc0) mc1) mc2) dtb__171))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleNameOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__172; f_Module_modulePackageOf = dtb__173; f_Module_moduleImportsOf = dtb__174; f_Module_moduleImplicitImportsOf = dtb__175; f_Module_moduleDeclsOf = dtb__176; f_Module_moduleExportsOf = dtb__177; f_Module_moduleFixitiesOf = dtb__178; f_Module_moduleReexportsOf = dtb__179; f_Module_moduleOpaqueOf = dtb__180; f_Module_moduleExportIndexOf = dtb__181; f_Module_moduleFixFactsOf = dtb__182 } -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleTblOf = (fun (modules : t_Module B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (m : t_Module) -> { B_dData_dPair.f_Pair_first = (v_moduleNameOf m); B_dData_dPair.f_Pair_second = m })) modules)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 659 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_walkNamespaceIndexFuel = (fun (fuel : int) (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findModule modules) m) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> (if ((B_dData_dList.v_length segs) <= 0) then (B_dData_dMaybe.C_Maybe_Just ((v_moduleNameOf dtb__183))) else (let nd_uscrut6 = (((v_longestIndexPrefix (v_moduleExportIndexOfOf dtb__183)) segs) (B_dData_dList.v_length segs)) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (match dtb__184 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> ((((v_walkNamespaceIndexFuel (fuel - 1)) modules) dtb__185) ((v_dropFirst dtb__186) segs))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 653 "Vuna/Compiler/Loader/Modules.vuna"
let v_walkNamespaceIndex = (fun (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> ((((v_walkNamespaceIndexFuel (1 + (B_dData_dList.v_length segs))) modules) m) segs))

# 353 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModuleIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let joined = (Base_dSource.v_joinDots ((v_takeSegsLocal n) segs)) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) joined) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (((v_walkNamespaceIndex ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dContainer_dHashMap.v_toList tbl))) joined) ((v_dropFirst n) segs))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModuleIn tbl) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 344 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleNameIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> (B_dData_dMaybe.C_Maybe_Just (name))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let segs = (Base_dSource.v_splitOnDot name) in (((v_resolvePathModuleIn tbl) segs) ((B_dData_dList.v_length segs) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModule = (fun (modules : t_Module B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let joined = (Base_dSource.v_joinDots ((v_takeSegsLocal n) segs)) in (match ((v_findModule modules) joined) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> (((v_walkNamespaceIndex modules) joined) ((v_dropFirst n) segs))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModule modules) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 327 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (B_dData_dMaybe.C_Maybe_Just (name))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let segs = (Base_dSource.v_splitOnDot name) in (((v_resolvePathModule modules) segs) ((B_dData_dList.v_length segs) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_resolveModuleName modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> dtb__191
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportsOf = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (let nd_uscrut2 = ((v_findModule modules) ((v_resolvedName modules) name)) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (match dtb__192 with
  | { f_Module_moduleNameOf = dtb__193; f_Module_modulePackageOf = dtb__194; f_Module_moduleImportsOf = dtb__195; f_Module_moduleImplicitImportsOf = dtb__196; f_Module_moduleDeclsOf = dtb__197; f_Module_moduleExportsOf = dtb__198; f_Module_moduleFixitiesOf = dtb__199; f_Module_moduleReexportsOf = dtb__200; f_Module_moduleOpaqueOf = dtb__201; f_Module_moduleExportIndexOf = dtb__202; f_Module_moduleFixFactsOf = dtb__203 } -> (Base_dDiag.C_Check_OkC (dtb__198))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 390 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_normalizeImports = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | { Frontend_dAst.f_Import_importName = dtb__206; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importRef = dtb__209 } -> (match ((v_resolveModuleName mc0) dtb__206) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__206; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importRef = dtb__209 }, ((v_normalizeImports mc0) dtb__205)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__210) -> (if (dtb__210 = dtb__206) then (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__206; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importRef = dtb__209 }, ((v_normalizeImports mc0) dtb__205))) else (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__210; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importRef = dtb__209 }, ((v_normalizeImports mc0) dtb__205))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModule = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) ((v_resolvedName modules) name)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__211) -> (Base_dDiag.C_Check_OkC ((dtb__211).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedNameIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_resolveModuleNameIn tbl) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> dtb__212
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModuleIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((v_resolvedNameIn tbl) name)) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (Base_dDiag.C_Check_OkC ((dtb__213).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValue = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 524 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValueIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (names : string B_dData_dList.t_List) (name : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModuleIn tbl)) names) name))

# 539 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtor = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 544 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtorIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (names : string B_dData_dList.t_List) (name : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModuleIn tbl)) names) name))

# 559 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingTypeIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (names : string B_dData_dList.t_List) (name : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModuleIn tbl)) names) name))

# 563 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingType = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 27 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePackageOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__214; f_Module_modulePackageOf = dtb__215; f_Module_moduleImportsOf = dtb__216; f_Module_moduleImplicitImportsOf = dtb__217; f_Module_moduleDeclsOf = dtb__218; f_Module_moduleExportsOf = dtb__219; f_Module_moduleFixitiesOf = dtb__220; f_Module_moduleReexportsOf = dtb__221; f_Module_moduleOpaqueOf = dtb__222; f_Module_moduleExportIndexOf = dtb__223; f_Module_moduleFixFactsOf = dtb__224 } -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleVisibleTo = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (m : t_Module) -> (match ((v_rootOfName (v_modulePackageOf m)) roots) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (((v_rootAllows importerPkg) dtb__225) (v_moduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleImportsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__226; f_Module_modulePackageOf = dtb__227; f_Module_moduleImportsOf = dtb__228; f_Module_moduleImplicitImportsOf = dtb__229; f_Module_moduleDeclsOf = dtb__230; f_Module_moduleExportsOf = dtb__231; f_Module_moduleFixitiesOf = dtb__232; f_Module_moduleReexportsOf = dtb__233; f_Module_moduleOpaqueOf = dtb__234; f_Module_moduleExportIndexOf = dtb__235; f_Module_moduleFixFactsOf = dtb__236 } -> dtb__228
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleImplicitImportsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__237; f_Module_modulePackageOf = dtb__238; f_Module_moduleImportsOf = dtb__239; f_Module_moduleImplicitImportsOf = dtb__240; f_Module_moduleDeclsOf = dtb__241; f_Module_moduleExportsOf = dtb__242; f_Module_moduleFixitiesOf = dtb__243; f_Module_moduleReexportsOf = dtb__244; f_Module_moduleOpaqueOf = dtb__245; f_Module_moduleExportIndexOf = dtb__246; f_Module_moduleFixFactsOf = dtb__247 } -> dtb__240
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDeclsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__248; f_Module_modulePackageOf = dtb__249; f_Module_moduleImportsOf = dtb__250; f_Module_moduleImplicitImportsOf = dtb__251; f_Module_moduleDeclsOf = dtb__252; f_Module_moduleExportsOf = dtb__253; f_Module_moduleFixitiesOf = dtb__254; f_Module_moduleReexportsOf = dtb__255; f_Module_moduleOpaqueOf = dtb__256; f_Module_moduleExportIndexOf = dtb__257; f_Module_moduleFixFactsOf = dtb__258 } -> dtb__252
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyModuleCtorTarget = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (let mname = (v_moduleNameOf dtb__259) in (if (B_dData_dBool.v_not ((B_dData_dString.v_startsWith mname) mc1)) then ((((v_anyModuleCtorTarget dtb__260) mc1) mc2) mc3) else (if (((((v_isCtorTargetInDecls mname) mc1) mc2) mc3) (v_moduleDeclsOf dtb__259)) then true else ((((v_anyModuleCtorTarget dtb__260) mc1) mc2) mc3))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Loader/Modules.vuna"
let v_isDataOrRecordCtorTarget = (fun (modules : t_Module B_dData_dList.t_List) (target : string) -> (let cname = (Base_dSource.v_lastSeg target) in (let dprefix = (Base_dSource.v_prefixOfName target) in (if (dprefix = "") then false else ((((v_anyModuleCtorTarget modules) target) dprefix) cname)))))

# 31 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__261; f_Module_modulePackageOf = dtb__262; f_Module_moduleImportsOf = dtb__263; f_Module_moduleImplicitImportsOf = dtb__264; f_Module_moduleDeclsOf = dtb__265; f_Module_moduleExportsOf = dtb__266; f_Module_moduleFixitiesOf = dtb__267; f_Module_moduleReexportsOf = dtb__268; f_Module_moduleOpaqueOf = dtb__269; f_Module_moduleExportIndexOf = dtb__270; f_Module_moduleFixFactsOf = dtb__271 } -> dtb__266
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleFixitiesOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__272; f_Module_modulePackageOf = dtb__273; f_Module_moduleImportsOf = dtb__274; f_Module_moduleImplicitImportsOf = dtb__275; f_Module_moduleDeclsOf = dtb__276; f_Module_moduleExportsOf = dtb__277; f_Module_moduleFixitiesOf = dtb__278; f_Module_moduleReexportsOf = dtb__279; f_Module_moduleOpaqueOf = dtb__280; f_Module_moduleExportIndexOf = dtb__281; f_Module_moduleFixFactsOf = dtb__282 } -> dtb__278
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleReexportsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__283; f_Module_modulePackageOf = dtb__284; f_Module_moduleImportsOf = dtb__285; f_Module_moduleImplicitImportsOf = dtb__286; f_Module_moduleDeclsOf = dtb__287; f_Module_moduleExportsOf = dtb__288; f_Module_moduleFixitiesOf = dtb__289; f_Module_moduleReexportsOf = dtb__290; f_Module_moduleOpaqueOf = dtb__291; f_Module_moduleExportIndexOf = dtb__292; f_Module_moduleFixFactsOf = dtb__293 } -> dtb__290
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleOpaqueOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__294; f_Module_modulePackageOf = dtb__295; f_Module_moduleImportsOf = dtb__296; f_Module_moduleImplicitImportsOf = dtb__297; f_Module_moduleDeclsOf = dtb__298; f_Module_moduleExportsOf = dtb__299; f_Module_moduleFixitiesOf = dtb__300; f_Module_moduleReexportsOf = dtb__301; f_Module_moduleOpaqueOf = dtb__302; f_Module_moduleExportIndexOf = dtb__303; f_Module_moduleFixFactsOf = dtb__304 } -> dtb__302
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__305; f_Module_modulePackageOf = dtb__306; f_Module_moduleImportsOf = dtb__307; f_Module_moduleImplicitImportsOf = dtb__308; f_Module_moduleDeclsOf = dtb__309; f_Module_moduleExportsOf = dtb__310; f_Module_moduleFixitiesOf = dtb__311; f_Module_moduleReexportsOf = dtb__312; f_Module_moduleOpaqueOf = dtb__313; f_Module_moduleExportIndexOf = dtb__314; f_Module_moduleFixFactsOf = dtb__315 } -> dtb__314
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleFixFactsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__316; f_Module_modulePackageOf = dtb__317; f_Module_moduleImportsOf = dtb__318; f_Module_moduleImplicitImportsOf = dtb__319; f_Module_moduleDeclsOf = dtb__320; f_Module_moduleExportsOf = dtb__321; f_Module_moduleFixitiesOf = dtb__322; f_Module_moduleReexportsOf = dtb__323; f_Module_moduleOpaqueOf = dtb__324; f_Module_moduleExportIndexOf = dtb__325; f_Module_moduleFixFactsOf = dtb__326 } -> dtb__326
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryDecls = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__327; f_Project_projectEntryImports = dtb__328; f_Project_projectImplicitImports = dtb__329; f_Project_projectModules = dtb__330; f_Project_projectEntryPkg = dtb__331; f_Project_projectEntryFixities = dtb__332; f_Project_projectEntryName = dtb__333; f_Project_projectEntryFacts = dtb__334 } -> dtb__327
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryImports = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__335; f_Project_projectEntryImports = dtb__336; f_Project_projectImplicitImports = dtb__337; f_Project_projectModules = dtb__338; f_Project_projectEntryPkg = dtb__339; f_Project_projectEntryFixities = dtb__340; f_Project_projectEntryName = dtb__341; f_Project_projectEntryFacts = dtb__342 } -> dtb__336
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectImplicitImports = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__343; f_Project_projectEntryImports = dtb__344; f_Project_projectImplicitImports = dtb__345; f_Project_projectModules = dtb__346; f_Project_projectEntryPkg = dtb__347; f_Project_projectEntryFixities = dtb__348; f_Project_projectEntryName = dtb__349; f_Project_projectEntryFacts = dtb__350 } -> dtb__345
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectModules = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__351; f_Project_projectEntryImports = dtb__352; f_Project_projectImplicitImports = dtb__353; f_Project_projectModules = dtb__354; f_Project_projectEntryPkg = dtb__355; f_Project_projectEntryFixities = dtb__356; f_Project_projectEntryName = dtb__357; f_Project_projectEntryFacts = dtb__358 } -> dtb__354
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryPkg = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__359; f_Project_projectEntryImports = dtb__360; f_Project_projectImplicitImports = dtb__361; f_Project_projectModules = dtb__362; f_Project_projectEntryPkg = dtb__363; f_Project_projectEntryFixities = dtb__364; f_Project_projectEntryName = dtb__365; f_Project_projectEntryFacts = dtb__366 } -> dtb__363
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryFixities = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__367; f_Project_projectEntryImports = dtb__368; f_Project_projectImplicitImports = dtb__369; f_Project_projectModules = dtb__370; f_Project_projectEntryPkg = dtb__371; f_Project_projectEntryFixities = dtb__372; f_Project_projectEntryName = dtb__373; f_Project_projectEntryFacts = dtb__374 } -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryName = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__375; f_Project_projectEntryImports = dtb__376; f_Project_projectImplicitImports = dtb__377; f_Project_projectModules = dtb__378; f_Project_projectEntryPkg = dtb__379; f_Project_projectEntryFixities = dtb__380; f_Project_projectEntryName = dtb__381; f_Project_projectEntryFacts = dtb__382 } -> dtb__381
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryFacts = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__383; f_Project_projectEntryImports = dtb__384; f_Project_projectImplicitImports = dtb__385; f_Project_projectModules = dtb__386; f_Project_projectEntryPkg = dtb__387; f_Project_projectEntryFixities = dtb__388; f_Project_projectEntryName = dtb__389; f_Project_projectEntryFacts = dtb__390 } -> dtb__390
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsValues = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__391; f_Namespaces_nsCtors = dtb__392; f_Namespaces_nsTypes = dtb__393; f_Namespaces_nsValueSet = dtb__394; f_Namespaces_nsCtorSet = dtb__395; f_Namespaces_nsTypeSet = dtb__396; f_Namespaces_nsCtorCands = dtb__397; f_Namespaces_nsModuleTbl = dtb__398; f_Namespaces_nsOpenNames = dtb__399; f_Namespaces_nsRelease = dtb__400 } -> dtb__391
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtors = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__401; f_Namespaces_nsCtors = dtb__402; f_Namespaces_nsTypes = dtb__403; f_Namespaces_nsValueSet = dtb__404; f_Namespaces_nsCtorSet = dtb__405; f_Namespaces_nsTypeSet = dtb__406; f_Namespaces_nsCtorCands = dtb__407; f_Namespaces_nsModuleTbl = dtb__408; f_Namespaces_nsOpenNames = dtb__409; f_Namespaces_nsRelease = dtb__410 } -> dtb__402
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsTypes = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__411; f_Namespaces_nsCtors = dtb__412; f_Namespaces_nsTypes = dtb__413; f_Namespaces_nsValueSet = dtb__414; f_Namespaces_nsCtorSet = dtb__415; f_Namespaces_nsTypeSet = dtb__416; f_Namespaces_nsCtorCands = dtb__417; f_Namespaces_nsModuleTbl = dtb__418; f_Namespaces_nsOpenNames = dtb__419; f_Namespaces_nsRelease = dtb__420 } -> dtb__413
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsValueSet = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__421; f_Namespaces_nsCtors = dtb__422; f_Namespaces_nsTypes = dtb__423; f_Namespaces_nsValueSet = dtb__424; f_Namespaces_nsCtorSet = dtb__425; f_Namespaces_nsTypeSet = dtb__426; f_Namespaces_nsCtorCands = dtb__427; f_Namespaces_nsModuleTbl = dtb__428; f_Namespaces_nsOpenNames = dtb__429; f_Namespaces_nsRelease = dtb__430 } -> dtb__424
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtorSet = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__431; f_Namespaces_nsCtors = dtb__432; f_Namespaces_nsTypes = dtb__433; f_Namespaces_nsValueSet = dtb__434; f_Namespaces_nsCtorSet = dtb__435; f_Namespaces_nsTypeSet = dtb__436; f_Namespaces_nsCtorCands = dtb__437; f_Namespaces_nsModuleTbl = dtb__438; f_Namespaces_nsOpenNames = dtb__439; f_Namespaces_nsRelease = dtb__440 } -> dtb__435
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsTypeSet = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__441; f_Namespaces_nsCtors = dtb__442; f_Namespaces_nsTypes = dtb__443; f_Namespaces_nsValueSet = dtb__444; f_Namespaces_nsCtorSet = dtb__445; f_Namespaces_nsTypeSet = dtb__446; f_Namespaces_nsCtorCands = dtb__447; f_Namespaces_nsModuleTbl = dtb__448; f_Namespaces_nsOpenNames = dtb__449; f_Namespaces_nsRelease = dtb__450 } -> dtb__446
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtorCands = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__451; f_Namespaces_nsCtors = dtb__452; f_Namespaces_nsTypes = dtb__453; f_Namespaces_nsValueSet = dtb__454; f_Namespaces_nsCtorSet = dtb__455; f_Namespaces_nsTypeSet = dtb__456; f_Namespaces_nsCtorCands = dtb__457; f_Namespaces_nsModuleTbl = dtb__458; f_Namespaces_nsOpenNames = dtb__459; f_Namespaces_nsRelease = dtb__460 } -> dtb__457
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsModuleTbl = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__461; f_Namespaces_nsCtors = dtb__462; f_Namespaces_nsTypes = dtb__463; f_Namespaces_nsValueSet = dtb__464; f_Namespaces_nsCtorSet = dtb__465; f_Namespaces_nsTypeSet = dtb__466; f_Namespaces_nsCtorCands = dtb__467; f_Namespaces_nsModuleTbl = dtb__468; f_Namespaces_nsOpenNames = dtb__469; f_Namespaces_nsRelease = dtb__470 } -> dtb__468
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsOpenNames = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__471; f_Namespaces_nsCtors = dtb__472; f_Namespaces_nsTypes = dtb__473; f_Namespaces_nsValueSet = dtb__474; f_Namespaces_nsCtorSet = dtb__475; f_Namespaces_nsTypeSet = dtb__476; f_Namespaces_nsCtorCands = dtb__477; f_Namespaces_nsModuleTbl = dtb__478; f_Namespaces_nsOpenNames = dtb__479; f_Namespaces_nsRelease = dtb__480 } -> dtb__479
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsRelease = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__481; f_Namespaces_nsCtors = dtb__482; f_Namespaces_nsTypes = dtb__483; f_Namespaces_nsValueSet = dtb__484; f_Namespaces_nsCtorSet = dtb__485; f_Namespaces_nsTypeSet = dtb__486; f_Namespaces_nsCtorCands = dtb__487; f_Namespaces_nsModuleTbl = dtb__488; f_Namespaces_nsOpenNames = dtb__489; f_Namespaces_nsRelease = dtb__490 } -> dtb__490
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Loader/Modules.vuna"
let v_kind = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__491; f_ExportEntry_public = dtb__492; f_ExportEntry_target = dtb__493; f_ExportEntry_parent = dtb__494 } -> dtb__491
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Loader/Modules.vuna"
let v_public = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__495; f_ExportEntry_public = dtb__496; f_ExportEntry_target = dtb__497; f_ExportEntry_parent = dtb__498 } -> dtb__496
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Loader/Modules.vuna"
let v_target = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__499; f_ExportEntry_public = dtb__500; f_ExportEntry_target = dtb__501; f_ExportEntry_parent = dtb__502 } -> dtb__501
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Loader/Modules.vuna"
let v_parent = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__503; f_ExportEntry_public = dtb__504; f_ExportEntry_target = dtb__505; f_ExportEntry_parent = dtb__506 } -> dtb__506
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Loader/Modules.vuna"
let v_refKind = (fun (p : t_ExportRef) -> (match p with
  | { f_ExportRef_refKind = dtb__507; f_ExportRef_refTarget = dtb__508; f_ExportRef_refParent = dtb__509 } -> dtb__507
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Loader/Modules.vuna"
let v_refTarget = (fun (p : t_ExportRef) -> (match p with
  | { f_ExportRef_refKind = dtb__510; f_ExportRef_refTarget = dtb__511; f_ExportRef_refParent = dtb__512 } -> dtb__511
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Loader/Modules.vuna"
let v_refParent = (fun (p : t_ExportRef) -> (match p with
  | { f_ExportRef_refKind = dtb__513; f_ExportRef_refTarget = dtb__514; f_ExportRef_refParent = dtb__515 } -> dtb__515
  | _ -> failwith "DT: impossible branch"
))
