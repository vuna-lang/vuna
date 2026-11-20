open Vuna_runtime
type t_Module = { f_Module_moduleNameOf : string; f_Module_modulePackageOf : string; f_Module_moduleImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleImplicitImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleDeclsOf : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Module_moduleExportsOf : t_ExportEntry B_dData_dList.t_List; f_Module_moduleFixitiesOf : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Module_moduleReexportsOf : string B_dData_dList.t_List; f_Module_moduleOpaqueOf : string B_dData_dList.t_List; f_Module_moduleExportIndexOf : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap }
and t_Project = { f_Project_projectEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Project_projectEntryImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectModules : t_Module B_dData_dList.t_List; f_Project_projectEntryPkg : string; f_Project_projectEntryFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List }
and t_Namespaces = { f_Namespaces_nsValues : string B_dData_dList.t_List; f_Namespaces_nsCtors : string B_dData_dList.t_List; f_Namespaces_nsTypes : string B_dData_dList.t_List; f_Namespaces_nsValueSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsTypeSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorCands : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Namespaces_nsRelease : bool }
and t_ExportEntry = { f_ExportEntry_kind : string; f_ExportEntry_public : string; f_ExportEntry_target : string; f_ExportEntry_parent : string }
and t_ExportRef = { f_ExportRef_refKind : string; f_ExportRef_refTarget : string; f_ExportRef_refParent : string }

# 103 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry = (B_dTrait_dEq.C_Eq_Eq ((fun sx sy -> (match sx with
  | { f_ExportEntry_kind = dtb__0; f_ExportEntry_public = dtb__1; f_ExportEntry_target = dtb__2; f_ExportEntry_parent = dtb__3 } -> (match sy with
  | { f_ExportEntry_kind = dtb__4; f_ExportEntry_public = dtb__5; f_ExportEntry_target = dtb__6; f_ExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> (0 = 1)
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((B_dTrait_dEq.v__x61__x61_ v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry) sx) sy) then (0 = 1) else (1 = 1)))))

# 54 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleNameOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__8; f_Module_modulePackageOf = dtb__9; f_Module_moduleImportsOf = dtb__10; f_Module_moduleImplicitImportsOf = dtb__11; f_Module_moduleDeclsOf = dtb__12; f_Module_moduleExportsOf = dtb__13; f_Module_moduleFixitiesOf = dtb__14; f_Module_moduleReexportsOf = dtb__15; f_Module_moduleOpaqueOf = dtb__16; f_Module_moduleExportIndexOf = dtb__17 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePackageOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__18; f_Module_modulePackageOf = dtb__19; f_Module_moduleImportsOf = dtb__20; f_Module_moduleImplicitImportsOf = dtb__21; f_Module_moduleDeclsOf = dtb__22; f_Module_moduleExportsOf = dtb__23; f_Module_moduleFixitiesOf = dtb__24; f_Module_moduleReexportsOf = dtb__25; f_Module_moduleOpaqueOf = dtb__26; f_Module_moduleExportIndexOf = dtb__27 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleAllImportsOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__28; f_Module_modulePackageOf = dtb__29; f_Module_moduleImportsOf = dtb__30; f_Module_moduleImplicitImportsOf = dtb__31; f_Module_moduleDeclsOf = dtb__32; f_Module_moduleExportsOf = dtb__33; f_Module_moduleFixitiesOf = dtb__34; f_Module_moduleReexportsOf = dtb__35; f_Module_moduleOpaqueOf = dtb__36; f_Module_moduleExportIndexOf = dtb__37 } -> ((B_dData_dList.v_append dtb__30) dtb__31)
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDeclsOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__38; f_Module_modulePackageOf = dtb__39; f_Module_moduleImportsOf = dtb__40; f_Module_moduleImplicitImportsOf = dtb__41; f_Module_moduleDeclsOf = dtb__42; f_Module_moduleExportsOf = dtb__43; f_Module_moduleFixitiesOf = dtb__44; f_Module_moduleReexportsOf = dtb__45; f_Module_moduleOpaqueOf = dtb__46; f_Module_moduleExportIndexOf = dtb__47 } -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleFixitiesOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__48; f_Module_modulePackageOf = dtb__49; f_Module_moduleImportsOf = dtb__50; f_Module_moduleImplicitImportsOf = dtb__51; f_Module_moduleDeclsOf = dtb__52; f_Module_moduleExportsOf = dtb__53; f_Module_moduleFixitiesOf = dtb__54; f_Module_moduleReexportsOf = dtb__55; f_Module_moduleOpaqueOf = dtb__56; f_Module_moduleExportIndexOf = dtb__57 } -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleReexportsOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__58; f_Module_modulePackageOf = dtb__59; f_Module_moduleImportsOf = dtb__60; f_Module_moduleImplicitImportsOf = dtb__61; f_Module_moduleDeclsOf = dtb__62; f_Module_moduleExportsOf = dtb__63; f_Module_moduleFixitiesOf = dtb__64; f_Module_moduleReexportsOf = dtb__65; f_Module_moduleOpaqueOf = dtb__66; f_Module_moduleExportIndexOf = dtb__67 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleOpaqueOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__68; f_Module_modulePackageOf = dtb__69; f_Module_moduleImportsOf = dtb__70; f_Module_moduleImplicitImportsOf = dtb__71; f_Module_moduleDeclsOf = dtb__72; f_Module_moduleExportsOf = dtb__73; f_Module_moduleFixitiesOf = dtb__74; f_Module_moduleReexportsOf = dtb__75; f_Module_moduleOpaqueOf = dtb__76; f_Module_moduleExportIndexOf = dtb__77 } -> dtb__76
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryAllImports = (fun (mc0 : t_Project) -> (match mc0 with
  | { f_Project_projectEntryDecls = dtb__78; f_Project_projectEntryImports = dtb__79; f_Project_projectImplicitImports = dtb__80; f_Project_projectModules = dtb__81; f_Project_projectEntryPkg = dtb__82; f_Project_projectEntryFixities = dtb__83 } -> ((B_dData_dList.v_append dtb__79) dtb__80)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allIdentChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if (if (Frontend_dLexer.v_isIdentStart dtb__84) then true else (Frontend_dLexer.v_isDigit dtb__84)) then (v_allIdentChars dtb__85) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Loader/Modules.vuna"
let v_validSegment = (fun (seg : string) -> (match (B_dData_dList.dtp_unpack seg) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (if (Frontend_dLexer.v_isUpperChar dtb__86) then (v_allIdentChars dtb__87) else false)
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allSegmentsValid = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (if (v_validSegment dtb__88) then (match dtb__89 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_allSegmentsValid dtb__89)
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 136 "Vuna/Compiler/Loader/Modules.vuna"
let v_validModuleName = (fun (name : string) -> (match (Base_dSource.v_splitOnDot name) with
  | B_dData_dList.C_List_Nil -> false
  | dtb__90 -> (v_allSegmentsValid dtb__90)
))

# 142 "Vuna/Compiler/Loader/Modules.vuna"
let v_mangle = (fun (prefix : string) (name : string) -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

# 160 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sliceEqGo = (fun (i : int) (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) (fuel : int) -> (if (fuel <= 0) then true else (if (i >= n) then true else (if (((dtp_strAt src) (srcOff + i)) = ((dtp_strAt dst) (dstOff + i))) then (((((((v_sliceEqGo (i + 1)) srcOff) src) dstOff) dst) n) (fuel - 1)) else false))))

# 157 "Vuna/Compiler/Loader/Modules.vuna"
let v_sliceEq = (fun (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) -> (((((((v_sliceEqGo 0) srcOff) src) dstOff) dst) n) n))

# 146 "Vuna/Compiler/Loader/Modules.vuna"
let v_isMangled = (fun (prefix : string) (name : string) (target : string) -> (if (prefix = "") then (name = target) else ((fun lp -> ((fun ln -> (if (if (if ((bi_strLength target) = ((lp + 1) + ln)) then (((dtp_strAt target) lp) = 46) else false) then (((((v_sliceEq 0) prefix) 0) target) lp) else false) then (((((v_sliceEq 0) name) (lp + 1)) target) ln) else false)) (bi_strLength name))) (bi_strLength prefix))))

# 173 "Vuna/Compiler/Loader/Modules.vuna"
let v_ctorCanonical = (fun (prefix : string) (dname : string) (cname : string) -> ((v_mangle prefix) (String.concat "" [dname; "."; cname])))

# 176 "Vuna/Compiler/Loader/Modules.vuna"
let v_importName = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__91; Frontend_dAst.f_Import_importIsQualified = dtb__92; Frontend_dAst.f_Import_importAlias = dtb__93; Frontend_dAst.f_Import_importSpan = dtb__94 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Loader/Modules.vuna"
let v_importModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_map v_importName) imports))

# 183 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImportSite = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 199 "Vuna/Compiler/Loader/Modules.vuna"
let v_aliasIs = (fun (q : string) (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (dtb__95 = q)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Loader/Modules.vuna"
let v_lastSegment = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Loader/Modules.vuna"
let v_notEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifierCandidates = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (q : string) -> ((fun strong -> (if (v_notEmptyList strong) then strong else (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_lastSegment (v_importName imp)) = q))) imports))))) (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_map v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_importName imp) = q))) imports))) ((B_dData_dList.v_map v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_aliasIs q) imp))) imports))))))

# 219 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_checkImportAliasSyntax = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match (dtb__100).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkImportAliasSyntax dtb__101)
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (if (v_validSegment dtb__102) then (v_checkImportAliasSyntax dtb__101) else ((Base_dDiag.v_onErrDiag (v_withImportSite (dtb__100).Frontend_dAst.f_Import_importSpan)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidModuleAlias (dtb__102))) dtb__102)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Loader/Modules.vuna"
let v_validateImports = (fun (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_checkImportAliasSyntax imports))

# 234 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_openModuleNamesAll = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (if (dtb__103).Frontend_dAst.f_Import_importIsQualified then (v_openModuleNamesAll dtb__104) else (B_dData_dList.C_List__x58__x58_ ((v_importName dtb__103), (v_openModuleNamesAll dtb__104))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Loader/Modules.vuna"
let v_openModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (B_dData_dList.v_nubNames (v_openModuleNamesAll imports)))

# 243 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findImportModule = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (if ((v_importName dtb__105) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importName dtb__105))) else (match (dtb__105).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (if (dtb__107 = mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importName dtb__105))) else ((v_findImportModule dtb__106) mc1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findImportModule dtb__106) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_reexportedImportNamesGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (match dtb__108 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__110, dtb__111, dtb__112) -> (match ((v_findImportModule mc0) dtb__110) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__109) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (if ((B_dData_dList.v_memName dtb__113) mc2) then (((v_reexportedImportNamesGo mc0) dtb__109) mc2) else (((v_reexportedImportNamesGo mc0) dtb__109) (B_dData_dList.C_List__x58__x58_ (dtb__113, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportItem_XModule (dtb__114, dtb__115) -> (match ((v_findImportModule mc0) dtb__114) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__109) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (if ((B_dData_dList.v_memName dtb__116) mc2) then (((v_reexportedImportNamesGo mc0) dtb__109) mc2) else (((v_reexportedImportNamesGo mc0) dtb__109) (B_dData_dList.C_List__x58__x58_ (dtb__116, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_reexportedImportNamesGo mc0) dtb__109) mc2)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (((v_reexportedImportNamesGo imports) items) B_dData_dList.C_List_Nil))

# 279 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNamesOfHeader = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (match dtb__117 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__118; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__119; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__120; Frontend_dAst.f_ModDecl_modDeclExports = dtb__121; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__122; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__123; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__124 } -> (if dtb__119 then ((v_reexportedImportNames mc0) dtb__120) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 284 "Vuna/Compiler/Loader/Modules.vuna"
let rec v__ujoinNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (match dtb__126 with
  | B_dData_dList.C_List_Nil -> dtb__125
  | _ -> (String.concat "" [dtb__125; ", "; (v__ujoinNames dtb__126)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Loader/Modules.vuna"
let v_missingModule = (fun (name : string) -> (Base_dDiag.v_icInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

# 367 "Vuna/Compiler/Loader/Modules.vuna"
let v_entriesByName = (fun (name : string) (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) idx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> dtb__127
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_exportIndexOfGo = (fun (mc0 : t_ExportEntry B_dData_dList.t_List) (mc1 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> ((fun tail -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (dtb__128).f_ExportEntry_public) (B_dData_dList.C_List__x58__x58_ (dtb__128, ((v_entriesByName (dtb__128).f_ExportEntry_public) tail)))) tail)) ((v_exportIndexOfGo dtb__129) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOf = (fun (entries : t_ExportEntry B_dData_dList.t_List) -> ((v_exportIndexOfGo entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))

# 380 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_lookupExport = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (if (if ((B_dData_dList.v_memName (dtb__130).f_ExportEntry_kind) mc0) then ((dtb__130).f_ExportEntry_public = mc1) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__130)) else (((v_lookupExport mc0) mc1) dtb__131))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValue = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 398 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_filterKinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (if (if ((B_dData_dList.v_memName (dtb__132).f_ExportEntry_kind) mc0) then ((dtb__132).f_ExportEntry_public = mc1) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__132, (((v_filterKinds mc0) mc1) dtb__133))) else (((v_filterKinds mc0) mc1) dtb__133))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValues = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 392 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypes = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 395 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModules = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 406 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtor = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) entries))

# 414 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_filterCtors = (fun (mc0 : string) (mc1 : t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (if (if ((dtb__134).f_ExportEntry_kind = "ctor") then ((dtb__134).f_ExportEntry_public = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__134, ((v_filterCtors mc0) dtb__135))) else ((v_filterCtors mc0) dtb__135))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtors = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> ((v_filterCtors name) entries))

# 422 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportType = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 426 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModule = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 429 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModuleIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 432 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValueIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 435 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValuesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 438 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 441 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 444 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorsIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((v_filterCtors name) ((v_entriesByName name) idx)))

# 447 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypeIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 494 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sameTargetRest = (fun (mc0 : t_ExportEntry) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match dtb__136 with
  | { B_dData_dPair.f_Pair_first = dtb__138; B_dData_dPair.f_Pair_second = dtb__139 } -> (if ((mc0).f_ExportEntry_target = (dtb__139).f_ExportEntry_target) then ((v_sameTargetRest mc0) dtb__137) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Loader/Modules.vuna"
let v_unifyEntryPairs = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (if ((v_sameTargetRest (B_dData_dPair.v_secondOf dtb__140)) dtb__141) then (Base_dDiag.C_Check_OkC (dtb__140)) else (Base_dDiag.v_icInternal (String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v__ujoinNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141)))); "); qualifying at the use site is the supported path"])))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePath = (fun (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (String.concat "" [(Frontend_dPackages_dPkg.v_rootDir root); "/"; (Base_dSource.v_joinSlashes (Base_dSource.v_splitOnDot name)); ".vuna"]))

# 511 "Vuna/Compiler/Loader/Modules.vuna"
let v_rootAllows = (fun (importerPkg : string) (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (match (root).Frontend_dPackages_dPkg.f_Root_rootExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (if ((Frontend_dPackages_dPkg.v_rootName root) = importerPkg) then true else ((B_dData_dList.v_memName name) dtb__142))
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_collectModuleFiles = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (if (((v_rootAllows mc2) dtb__143) mc1) then ((((((v_collectModuleFiles nFs) dtb__144) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = path; B_dData_dPair.f_Pair_second = dtb__143 }, mc3))) mc4) else ((((((v_collectModuleFiles nFs) dtb__144) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName dtb__143), mc4)))) else ((((((v_collectModuleFiles nFs) dtb__144) mc1) mc2) mc3) mc4))))) ((v_modulePath dtb__143) mc1))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc3); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Loader/Modules.vuna"
let v__ujoinRootDirs = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (v__ujoinNames ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) roots)))

# 538 "Vuna/Compiler/Loader/Modules.vuna"
let v_candidateDir = (fun (candidate : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootDir (B_dData_dPair.v_secondOf candidate)))

# 542 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImporterSpan = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 545 "Vuna/Compiler/Loader/Modules.vuna"
let v_findModuleFile = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (name : string) (importerPkg : string) (importerSpan : Base_dSource.t_Span) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_collectModuleFiles nFs) roots) name) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> ((fun allowed -> ((fun hidden -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match dtb__146 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__145))
  | _ -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (name, (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))) name) (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))
)
  | B_dData_dList.C_List_Nil -> (match hidden with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotFound (name, (v__ujoinRootDirs roots)))) name) (v__ujoinRootDirs roots)))
  | dtb__147 -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (v__ujoinNames hidden)))) name) (v__ujoinNames hidden)))
)
  | _ -> failwith "DT: impossible branch"
)) allowed))) (B_dData_dPair.v_secondOf collected))) (B_dData_dPair.v_firstOf collected)))))

# 567 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOfOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__148; f_Module_modulePackageOf = dtb__149; f_Module_moduleImportsOf = dtb__150; f_Module_moduleImplicitImportsOf = dtb__151; f_Module_moduleDeclsOf = dtb__152; f_Module_moduleExportsOf = dtb__153; f_Module_moduleFixitiesOf = dtb__154; f_Module_moduleReexportsOf = dtb__155; f_Module_moduleOpaqueOf = dtb__156; f_Module_moduleExportIndexOf = dtb__157 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_takeSegsLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__158, ((v_takeSegsLocal (mc0 - 1)) dtb__159))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_longestIndexPrefix = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (segs : string B_dData_dList.t_List) (k : int) -> (if (k <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findExportModuleIn idx) (Base_dSource.v_joinDots ((v_takeSegsLocal k) segs))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__160).f_ExportEntry_target; B_dData_dPair.f_Pair_second = k }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestIndexPrefix idx) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 598 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_dropFirst = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162)) else ((v_dropFirst (mc0 - 1)) dtb__162))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 602 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findModule = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { f_Module_moduleNameOf = dtb__165; f_Module_modulePackageOf = dtb__166; f_Module_moduleImportsOf = dtb__167; f_Module_moduleImplicitImportsOf = dtb__168; f_Module_moduleDeclsOf = dtb__169; f_Module_moduleExportsOf = dtb__170; f_Module_moduleFixitiesOf = dtb__171; f_Module_moduleReexportsOf = dtb__172; f_Module_moduleOpaqueOf = dtb__173; f_Module_moduleExportIndexOf = dtb__174 } -> (if (dtb__165 = mc1) then (B_dData_dMaybe.C_Maybe_Just ({ f_Module_moduleNameOf = dtb__165; f_Module_modulePackageOf = dtb__166; f_Module_moduleImportsOf = dtb__167; f_Module_moduleImplicitImportsOf = dtb__168; f_Module_moduleDeclsOf = dtb__169; f_Module_moduleExportsOf = dtb__170; f_Module_moduleFixitiesOf = dtb__171; f_Module_moduleReexportsOf = dtb__172; f_Module_moduleOpaqueOf = dtb__173; f_Module_moduleExportIndexOf = dtb__174 })) else ((v_findModule dtb__164) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDecls = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> (match dtb__175 with
  | { f_Module_moduleNameOf = dtb__176; f_Module_modulePackageOf = dtb__177; f_Module_moduleImportsOf = dtb__178; f_Module_moduleImplicitImportsOf = dtb__179; f_Module_moduleDeclsOf = dtb__180; f_Module_moduleExportsOf = dtb__181; f_Module_moduleFixitiesOf = dtb__182; f_Module_moduleReexportsOf = dtb__183; f_Module_moduleOpaqueOf = dtb__184; f_Module_moduleExportIndexOf = dtb__185 } -> (Base_dDiag.C_Check_OkC (dtb__180))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_findModule modules) name)))

# 303 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleCtors = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((v_moduleDecls modules) name)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.v_ctorsOf decls))))))

# 570 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_walkNamespaceIndexFuel = (fun (fuel : int) (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findModule modules) m) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> (if ((B_dData_dList.v_length segs) <= 0) then (B_dData_dMaybe.C_Maybe_Just ((v_moduleNameOf dtb__186))) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> ((((v_walkNamespaceIndexFuel (fuel - 1)) modules) dtb__188) ((v_dropFirst dtb__189) segs))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((v_longestIndexPrefix (v_moduleExportIndexOfOf dtb__186)) segs) (B_dData_dList.v_length segs))))
  | _ -> failwith "DT: impossible branch"
)))

# 564 "Vuna/Compiler/Loader/Modules.vuna"
let v_walkNamespaceIndex = (fun (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> ((((v_walkNamespaceIndexFuel (1 + (B_dData_dList.v_length segs))) modules) m) segs))

# 318 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModule = (fun (modules : t_Module B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then B_dData_dMaybe.C_Maybe_Nothing else ((fun joined -> (match ((v_findModule modules) joined) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (((v_walkNamespaceIndex modules) joined) ((v_dropFirst n) segs))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModule modules) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
)) (Base_dSource.v_joinDots ((v_takeSegsLocal n) segs)))))

# 309 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> (B_dData_dMaybe.C_Maybe_Just (name))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun segs -> (((v_resolvePathModule modules) segs) ((B_dData_dList.v_length segs) - 1))) (Base_dSource.v_splitOnDot name))
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_resolveModuleName modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> dtb__192
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportsOf = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (match dtb__193 with
  | { f_Module_moduleNameOf = dtb__194; f_Module_modulePackageOf = dtb__195; f_Module_moduleImportsOf = dtb__196; f_Module_moduleImplicitImportsOf = dtb__197; f_Module_moduleDeclsOf = dtb__198; f_Module_moduleExportsOf = dtb__199; f_Module_moduleFixitiesOf = dtb__200; f_Module_moduleReexportsOf = dtb__201; f_Module_moduleOpaqueOf = dtb__202; f_Module_moduleExportIndexOf = dtb__203 } -> (Base_dDiag.C_Check_OkC (dtb__199))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_findModule modules) ((v_resolvedName modules) name))))

# 344 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_normalizeImports = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | { Frontend_dAst.f_Import_importName = dtb__206; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importSpan = dtb__209 } -> (match ((v_resolveModuleName mc0) dtb__206) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__206; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importSpan = dtb__209 }, ((v_normalizeImports mc0) dtb__205)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__210) -> (if (dtb__210 = dtb__206) then (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__206; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importSpan = dtb__209 }, ((v_normalizeImports mc0) dtb__205))) else (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__210; Frontend_dAst.f_Import_importIsQualified = dtb__207; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importSpan = dtb__209 }, ((v_normalizeImports mc0) dtb__205))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModule = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) ((v_resolvedName modules) name)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__211) -> (Base_dDiag.C_Check_OkC ((dtb__211).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingValueFrom = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> ((Base_dCommon.v_bind ((v_exportIndexOfModule mc0) dtb__212)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportValuesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingValueFrom mc0) dtb__213) mc2)
  | dtb__214 -> ((Base_dCommon.v_bind (((v_modulesExportingValueFrom mc0) dtb__213) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__212; B_dData_dPair.f_Pair_second = e })) dtb__214)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValue = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingValueFrom modules) (v_openModuleNames imports)) name))

# 465 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingCtorFrom = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> ((Base_dCommon.v_bind ((v_exportIndexOfModule mc0) dtb__215)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> ((fun found -> ((Base_dCommon.v_bind (((v_modulesExportingCtorFrom mc0) dtb__216) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = e })) found)) more)))))) ((v_findExportCtorsIn idx) mc2))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtor = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingCtorFrom modules) (v_openModuleNames imports)) name))

# 479 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingTypeFrom = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__217, dtb__218) -> ((Base_dCommon.v_bind ((v_exportIndexOfModule mc0) dtb__217)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportTypesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingTypeFrom mc0) dtb__218) mc2)
  | dtb__219 -> ((Base_dCommon.v_bind (((v_modulesExportingTypeFrom mc0) dtb__218) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = e })) dtb__219)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingType = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingTypeFrom modules) (v_openModuleNames imports)) name))

# 645 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> (if ((Frontend_dAst.v_ctorName dtb__220) = mc0) then true else ((v_anyCtorNamed mc0) dtb__221))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_isCtorTargetInDecls = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : string) (mc4 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | Frontend_dAst.C_Decl_DData (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> (if (if (((v_isMangled mc0) dtb__224) mc2) then ((v_anyCtorNamed mc3) dtb__227) else false) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__223))
  | Frontend_dAst.C_Decl_DRecord (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> (if (((v_isMangled mc0) dtb__233) mc1) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__223))
  | _ -> (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__223)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyModuleCtorTarget = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> ((fun mname -> (if (B_dData_dBool.v_not ((B_dData_dString.v_startsWith mname) mc1)) then ((((v_anyModuleCtorTarget dtb__242) mc1) mc2) mc3) else (if (((((v_isCtorTargetInDecls mname) mc1) mc2) mc3) (v_moduleDeclsOf dtb__241)) then true else ((((v_anyModuleCtorTarget dtb__242) mc1) mc2) mc3)))) (v_moduleNameOf dtb__241))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Loader/Modules.vuna"
let v_isDataOrRecordCtorTarget = (fun (modules : t_Module B_dData_dList.t_List) (target : string) -> ((fun cname -> ((fun dprefix -> (if (dprefix = "") then false else ((((v_anyModuleCtorTarget modules) target) dprefix) cname))) (Base_dSource.v_prefixOfName target))) (Base_dSource.v_lastSeg target)))

# 656 "Vuna/Compiler/Loader/Modules.vuna"
let v_isCtorCanonical = (fun (mname : string) (dname : string) (cname : string) (target : string) -> ((fun lm -> ((fun ld -> ((fun lc -> ((fun second -> (if (if (if (if (if ((bi_strLength target) = ((second + 1) + lc)) then (((dtp_strAt target) lm) = 46) else false) then (((dtp_strAt target) second) = 46) else false) then (((((v_sliceEq 0) mname) 0) target) lm) else false) then (((((v_sliceEq 0) dname) (lm + 1)) target) ld) else false) then (((((v_sliceEq 0) cname) (second + 1)) target) lc) else false)) ((lm + 1) + ld))) (bi_strLength cname))) (bi_strLength dname))) (bi_strLength mname)))

# 650 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorTarget = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__243, dtb__244) -> (if ((((v_isCtorCanonical mc0) mc1) (Frontend_dAst.v_ctorName dtb__243)) mc2) then true else ((((v_anyCtorTarget mc0) mc1) mc2) dtb__244))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
