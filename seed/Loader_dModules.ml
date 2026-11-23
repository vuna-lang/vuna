open Vuna_runtime
type t_Module = { f_Module_moduleNameOf : string; f_Module_modulePackageOf : string; f_Module_moduleImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleImplicitImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleDeclsOf : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Module_moduleExportsOf : t_ExportEntry B_dData_dList.t_List; f_Module_moduleFixitiesOf : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Module_moduleReexportsOf : string B_dData_dList.t_List; f_Module_moduleOpaqueOf : string B_dData_dList.t_List; f_Module_moduleExportIndexOf : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap }
and t_Project = { f_Project_projectEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Project_projectEntryImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectModules : t_Module B_dData_dList.t_List; f_Project_projectEntryPkg : string; f_Project_projectEntryFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List }
and t_Namespaces = { f_Namespaces_nsValues : string B_dData_dList.t_List; f_Namespaces_nsCtors : string B_dData_dList.t_List; f_Namespaces_nsTypes : string B_dData_dList.t_List; f_Namespaces_nsValueSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsTypeSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorCands : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Namespaces_nsModuleTbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsRelease : bool }
and t_ExportEntry = { f_ExportEntry_kind : string; f_ExportEntry_public : string; f_ExportEntry_target : string; f_ExportEntry_parent : string }
and t_ExportRef = { f_ExportRef_refKind : string; f_ExportRef_refTarget : string; f_ExportRef_refParent : string }

# 105 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry = (B_dTrait_dEq.C_Eq_Eq ((fun sx sy -> (match sx with
  | { f_ExportEntry_kind = dtb__0; f_ExportEntry_public = dtb__1; f_ExportEntry_target = dtb__2; f_ExportEntry_parent = dtb__3 } -> (match sy with
  | { f_ExportEntry_kind = dtb__4; f_ExportEntry_public = dtb__5; f_ExportEntry_target = dtb__6; f_ExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((B_dTrait_dEq.v__x61__x61_ v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry) sx) sy) then false else true))))

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

# 118 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allIdentChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if (if (Frontend_dLexer.v_isIdentStart dtb__84) then true else (Frontend_dLexer.v_isDigit dtb__84)) then (v_allIdentChars dtb__85) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Loader/Modules.vuna"
let v_validSegment = (fun (seg : string) -> (match (B_dData_dList.dtp_unpack seg) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (if (Frontend_dLexer.v_isUpperChar dtb__86) then (v_allIdentChars dtb__87) else false)
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allSegmentsValid = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (if (v_validSegment dtb__88) then (match dtb__89 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_allSegmentsValid dtb__89)
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Loader/Modules.vuna"
let v_validModuleName = (fun (name : string) -> (match (Base_dSource.v_splitOnDot name) with
  | B_dData_dList.C_List_Nil -> false
  | dtb__90 -> (v_allSegmentsValid dtb__90)
))

# 144 "Vuna/Compiler/Loader/Modules.vuna"
let v_mangle = (fun (prefix : string) (name : string) -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

# 162 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sliceEqGo = (fun (i : int) (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) (fuel : int) -> (if (fuel <= 0) then true else (if (i >= n) then true else (if (((dtp_strAt src) (srcOff + i)) = ((dtp_strAt dst) (dstOff + i))) then (((((((v_sliceEqGo (i + 1)) srcOff) src) dstOff) dst) n) (fuel - 1)) else false))))

# 159 "Vuna/Compiler/Loader/Modules.vuna"
let v_sliceEq = (fun (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) -> (((((((v_sliceEqGo 0) srcOff) src) dstOff) dst) n) n))

# 148 "Vuna/Compiler/Loader/Modules.vuna"
let v_isMangled = (fun (prefix : string) (name : string) (target : string) -> (if (prefix = "") then (name = target) else (let lp = (bi_strLength prefix) in (let ln = (bi_strLength name) in (if (if (if ((bi_strLength target) = ((lp + 1) + ln)) then (((dtp_strAt target) lp) = 46) else false) then (((((v_sliceEq 0) prefix) 0) target) lp) else false) then (((((v_sliceEq 0) name) (lp + 1)) target) ln) else false)))))

# 175 "Vuna/Compiler/Loader/Modules.vuna"
let v_ctorCanonical = (fun (prefix : string) (dname : string) (cname : string) -> ((v_mangle prefix) (String.concat "" [dname; "."; cname])))

# 178 "Vuna/Compiler/Loader/Modules.vuna"
let v_importName = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__91; Frontend_dAst.f_Import_importIsQualified = dtb__92; Frontend_dAst.f_Import_importAlias = dtb__93; Frontend_dAst.f_Import_importRef = dtb__94 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Loader/Modules.vuna"
let v_importModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_map v_importName) imports))

# 185 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImportSite = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 201 "Vuna/Compiler/Loader/Modules.vuna"
let v_aliasIs = (fun (q : string) (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (dtb__95 = q)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Loader/Modules.vuna"
let v_lastSegment = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Loader/Modules.vuna"
let v_notEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifierCandidates = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (q : string) -> (let strong = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_map v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_importName imp) = q))) imports))) ((B_dData_dList.v_map v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_aliasIs q) imp))) imports)))) in (if (v_notEmptyList strong) then strong else (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_importName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_lastSegment (v_importName imp)) = q))) imports))))))

# 221 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_checkImportAliasSyntax = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match (dtb__100).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkImportAliasSyntax dtb__101)
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (if (v_validSegment dtb__102) then (v_checkImportAliasSyntax dtb__101) else ((Base_dDiag.v_onErrDiag (v_withImportSite (Frontend_dAst.v_importSpan dtb__100))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidModuleAlias (dtb__102))) dtb__102)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Loader/Modules.vuna"
let v_validateImports = (fun (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_checkImportAliasSyntax imports))

# 236 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_openModuleNamesAll = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (if (dtb__103).Frontend_dAst.f_Import_importIsQualified then (v_openModuleNamesAll dtb__104) else (B_dData_dList.C_List__x58__x58_ ((v_importName dtb__103), (v_openModuleNamesAll dtb__104))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Loader/Modules.vuna"
let v_openModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (B_dData_dList.v_nubNames (v_openModuleNamesAll imports)))

# 245 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findImportModule = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (if ((v_importName dtb__105) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importName dtb__105))) else (match (dtb__105).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (if (dtb__107 = mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importName dtb__105))) else ((v_findImportModule dtb__106) mc1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findImportModule dtb__106) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_importByPrefix = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (let prefix = (match (dtb__108).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> dtb__110
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb__108).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
) in (if ((B_dData_dString.v_startsWith (prefix ^ ".")) mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importName dtb__108))) else ((v_importByPrefix dtb__109) mc1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifiedItemImport = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__111, dtb__112, dtb__113) -> ((v_importByPrefix mc0) dtb__111)
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__114, dtb__115) -> ((v_importByPrefix mc0) dtb__114)
  | Frontend_dAst.C_ExportItem_XBare (dtb__116, dtb__117) -> ((v_importByPrefix mc0) dtb__116)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 260 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_reexportedImportNamesGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__120, dtb__121, dtb__122) -> (match ((v_findImportModule mc0) dtb__120) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__119) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (if ((B_dData_dList.v_memName dtb__123) mc2) then (((v_reexportedImportNamesGo mc0) dtb__119) mc2) else (((v_reexportedImportNamesGo mc0) dtb__119) (B_dData_dList.C_List__x58__x58_ (dtb__123, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportItem_XModule (dtb__124, dtb__125) -> (match ((v_findImportModule mc0) dtb__124) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__119) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (if ((B_dData_dList.v_memName dtb__126) mc2) then (((v_reexportedImportNamesGo mc0) dtb__119) mc2) else (((v_reexportedImportNamesGo mc0) dtb__119) (B_dData_dList.C_List__x58__x58_ (dtb__126, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_qualifiedItemImport mc0) dtb__118) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__119) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (if ((B_dData_dList.v_memName dtb__127) mc2) then (((v_reexportedImportNamesGo mc0) dtb__119) mc2) else (((v_reexportedImportNamesGo mc0) dtb__119) (B_dData_dList.C_List__x58__x58_ (dtb__127, mc2))))
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (((v_reexportedImportNamesGo imports) items) B_dData_dList.C_List_Nil))

# 307 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNamesOfHeader = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__128) -> (match dtb__128 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__129; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__130; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__131; Frontend_dAst.f_ModDecl_modDeclExports = dtb__132; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__133; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__134; Frontend_dAst.f_ModDecl_modDeclRef = dtb__135 } -> (if dtb__130 then ((v_reexportedImportNames mc0) dtb__131) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 312 "Vuna/Compiler/Loader/Modules.vuna"
let rec v__ujoinNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match dtb__137 with
  | B_dData_dList.C_List_Nil -> dtb__136
  | _ -> (String.concat "" [dtb__136; ", "; (v__ujoinNames dtb__137)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Loader/Modules.vuna"
let v_missingModule = (fun (name : string) -> (Base_dDiag.v_icInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

# 348 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleTblOf = (fun (modules : t_Module B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (m : t_Module) -> { B_dData_dPair.f_Pair_first = (v_moduleNameOf m); B_dData_dPair.f_Pair_second = m })) modules)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 423 "Vuna/Compiler/Loader/Modules.vuna"
let v_entriesByName = (fun (name : string) (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) idx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> dtb__138
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_exportIndexOfGo = (fun (mc0 : t_ExportEntry B_dData_dList.t_List) (mc1 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (let tail = ((v_exportIndexOfGo dtb__140) mc1) in (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__139).f_ExportEntry_public) (B_dData_dList.C_List__x58__x58_ (dtb__139, ((v_entriesByName (dtb__139).f_ExportEntry_public) tail)))) tail))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOf = (fun (entries : t_ExportEntry B_dData_dList.t_List) -> ((v_exportIndexOfGo entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 449 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_lookupExport = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (if (if ((B_dData_dList.v_memName (dtb__141).f_ExportEntry_kind) mc0) then ((dtb__141).f_ExportEntry_public = mc1) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__141)) else (((v_lookupExport mc0) mc1) dtb__142))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValue = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 467 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_filterKinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (if (if ((B_dData_dList.v_memName (dtb__143).f_ExportEntry_kind) mc0) then ((dtb__143).f_ExportEntry_public = mc1) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__143, (((v_filterKinds mc0) mc1) dtb__144))) else (((v_filterKinds mc0) mc1) dtb__144))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValues = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 461 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypes = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 464 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModules = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 475 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtor = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) entries))

# 483 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_filterCtors = (fun (mc0 : string) (mc1 : t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (if (if ((dtb__145).f_ExportEntry_kind = "ctor") then ((dtb__145).f_ExportEntry_public = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__145, ((v_filterCtors mc0) dtb__146))) else ((v_filterCtors mc0) dtb__146))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 479 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtors = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> ((v_filterCtors name) entries))

# 491 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportType = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 495 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModule = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 498 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModuleIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 501 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValueIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 504 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValuesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 507 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 510 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 513 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorsIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((v_filterCtors name) ((v_entriesByName name) idx)))

# 516 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypeIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 519 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingValueFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> ((Base_dCommon.v_bind (mc0 dtb__147)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportValuesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingValueFrom mc0) dtb__148) mc2)
  | dtb__149 -> ((Base_dCommon.v_bind (((v_modulesExportingValueFrom mc0) dtb__148) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = e })) dtb__149)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingCtorFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> ((Base_dCommon.v_bind (mc0 dtb__150)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (let found = ((v_findExportCtorsIn idx) mc2) in ((Base_dCommon.v_bind (((v_modulesExportingCtorFrom mc0) dtb__151) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__150; B_dData_dPair.f_Pair_second = e })) found)) more))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingTypeFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> ((Base_dCommon.v_bind (mc0 dtb__152)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportTypesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingTypeFrom mc0) dtb__153) mc2)
  | dtb__154 -> ((Base_dCommon.v_bind (((v_modulesExportingTypeFrom mc0) dtb__153) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = e })) dtb__154)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sameTargetRest = (fun (mc0 : t_ExportEntry) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (match dtb__155 with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> (if ((mc0).f_ExportEntry_target = (dtb__158).f_ExportEntry_target) then ((v_sameTargetRest mc0) dtb__156) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Loader/Modules.vuna"
let v_unifyEntryPairs = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (if ((v_sameTargetRest (B_dData_dPair.v_secondOf dtb__159)) dtb__160) then (Base_dDiag.C_Check_OkC (dtb__159)) else (let mods = (v__ujoinNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160)))) in ((((Base_dDiagnostics_dRn.v_rnNoLoc3 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousName (mc1, mc2, mods))) mc1) mc2) mods)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePath = (fun (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (String.concat "" [(Frontend_dPackages_dPkg.v_rootDir root); "/"; (Base_dSource.v_joinSlashes (Base_dSource.v_splitOnDot name)); ".vuna"]))

# 598 "Vuna/Compiler/Loader/Modules.vuna"
let v_rootAllows = (fun (importerPkg : string) (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (match (root).Frontend_dPackages_dPkg.f_Root_rootExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (if ((Frontend_dPackages_dPkg.v_rootName root) = importerPkg) then true else ((B_dData_dList.v_memName name) dtb__161))
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_rootOfName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__162) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__162)) else ((v_rootOfName mc0) dtb__163))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 611 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleVisibleTo = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (m : t_Module) -> (match ((v_rootOfName (v_modulePackageOf m)) roots) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (((v_rootAllows importerPkg) dtb__164) (v_moduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_collectModuleFiles = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (let path = ((v_modulePath dtb__165) mc1) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (if (((v_rootAllows mc2) dtb__165) mc1) then ((((((v_collectModuleFiles nFs) dtb__166) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = path; B_dData_dPair.f_Pair_second = dtb__165 }, mc3))) mc4) else ((((((v_collectModuleFiles nFs) dtb__166) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName dtb__165), mc4)))) else ((((((v_collectModuleFiles nFs) dtb__166) mc1) mc2) mc3) mc4)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc3); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Loader/Modules.vuna"
let v__ujoinRootDirs = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (v__ujoinNames ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) roots)))

# 637 "Vuna/Compiler/Loader/Modules.vuna"
let v_candidateDir = (fun (candidate : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootDir (B_dData_dPair.v_secondOf candidate)))

# 641 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImporterSpan = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 644 "Vuna/Compiler/Loader/Modules.vuna"
let v_findModuleFile = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (name : string) (importerPkg : string) (importerSpan : Base_dSource.t_Span) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_collectModuleFiles nFs) roots) name) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (let allowed = (B_dData_dPair.v_firstOf collected) in (let hidden = (B_dData_dPair.v_secondOf collected) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (let nd_uscrut10 = allowed in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match dtb__168 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__167))
  | _ -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (name, (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))) name) (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))
)
  | B_dData_dList.C_List_Nil -> (match hidden with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotFound (name, (v__ujoinRootDirs roots)))) name) (v__ujoinRootDirs roots)))
  | dtb__169 -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (v__ujoinNames hidden)))) name) (v__ujoinNames hidden)))
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 666 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOfOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__170; f_Module_modulePackageOf = dtb__171; f_Module_moduleImportsOf = dtb__172; f_Module_moduleImplicitImportsOf = dtb__173; f_Module_moduleDeclsOf = dtb__174; f_Module_moduleExportsOf = dtb__175; f_Module_moduleFixitiesOf = dtb__176; f_Module_moduleReexportsOf = dtb__177; f_Module_moduleOpaqueOf = dtb__178; f_Module_moduleExportIndexOf = dtb__179 } -> dtb__179
  | _ -> failwith "DT: impossible branch"
))

# 693 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_takeSegsLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__180, ((v_takeSegsLocal (mc0 - 1)) dtb__181))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 684 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_longestIndexPrefix = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (segs : string B_dData_dList.t_List) (k : int) -> (if (k <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findExportModuleIn idx) (Base_dSource.v_joinDots ((v_takeSegsLocal k) segs))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__182).f_ExportEntry_target; B_dData_dPair.f_Pair_second = k }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestIndexPrefix idx) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 697 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_dropFirst = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184)) else ((v_dropFirst (mc0 - 1)) dtb__184))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 701 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findModule = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { f_Module_moduleNameOf = dtb__187; f_Module_modulePackageOf = dtb__188; f_Module_moduleImportsOf = dtb__189; f_Module_moduleImplicitImportsOf = dtb__190; f_Module_moduleDeclsOf = dtb__191; f_Module_moduleExportsOf = dtb__192; f_Module_moduleFixitiesOf = dtb__193; f_Module_moduleReexportsOf = dtb__194; f_Module_moduleOpaqueOf = dtb__195; f_Module_moduleExportIndexOf = dtb__196 } -> (if (dtb__187 = mc1) then (B_dData_dMaybe.C_Maybe_Just ({ f_Module_moduleNameOf = dtb__187; f_Module_modulePackageOf = dtb__188; f_Module_moduleImportsOf = dtb__189; f_Module_moduleImplicitImportsOf = dtb__190; f_Module_moduleDeclsOf = dtb__191; f_Module_moduleExportsOf = dtb__192; f_Module_moduleFixitiesOf = dtb__193; f_Module_moduleReexportsOf = dtb__194; f_Module_moduleOpaqueOf = dtb__195; f_Module_moduleExportIndexOf = dtb__196 })) else ((v_findModule dtb__186) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDecls = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (let nd_uscrut2 = ((v_findModule modules) name) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> (match dtb__197 with
  | { f_Module_moduleNameOf = dtb__198; f_Module_modulePackageOf = dtb__199; f_Module_moduleImportsOf = dtb__200; f_Module_moduleImplicitImportsOf = dtb__201; f_Module_moduleDeclsOf = dtb__202; f_Module_moduleExportsOf = dtb__203; f_Module_moduleFixitiesOf = dtb__204; f_Module_moduleReexportsOf = dtb__205; f_Module_moduleOpaqueOf = dtb__206; f_Module_moduleExportIndexOf = dtb__207 } -> (Base_dDiag.C_Check_OkC (dtb__202))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 331 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleCtors = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((v_moduleDecls modules) name)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.v_ctorsOf decls))))))

# 669 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_walkNamespaceIndexFuel = (fun (fuel : int) (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findModule modules) m) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (if ((B_dData_dList.v_length segs) <= 0) then (B_dData_dMaybe.C_Maybe_Just ((v_moduleNameOf dtb__208))) else (let nd_uscrut6 = (((v_longestIndexPrefix (v_moduleExportIndexOfOf dtb__208)) segs) (B_dData_dList.v_length segs)) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (match dtb__209 with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> ((((v_walkNamespaceIndexFuel (fuel - 1)) modules) dtb__210) ((v_dropFirst dtb__211) segs))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 663 "Vuna/Compiler/Loader/Modules.vuna"
let v_walkNamespaceIndex = (fun (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> ((((v_walkNamespaceIndexFuel (1 + (B_dData_dList.v_length segs))) modules) m) segs))

# 363 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModuleIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let joined = (Base_dSource.v_joinDots ((v_takeSegsLocal n) segs)) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) joined) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> (((v_walkNamespaceIndex ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dContainer_dHashMap.v_toList tbl))) joined) ((v_dropFirst n) segs))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModuleIn tbl) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 354 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleNameIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (B_dData_dMaybe.C_Maybe_Just (name))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let segs = (Base_dSource.v_splitOnDot name) in (((v_resolvePathModuleIn tbl) segs) ((B_dData_dList.v_length segs) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModule = (fun (modules : t_Module B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let joined = (Base_dSource.v_joinDots ((v_takeSegsLocal n) segs)) in (match ((v_findModule modules) joined) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> (((v_walkNamespaceIndex modules) joined) ((v_dropFirst n) segs))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModule modules) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 337 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__215) -> (B_dData_dMaybe.C_Maybe_Just (name))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let segs = (Base_dSource.v_splitOnDot name) in (((v_resolvePathModule modules) segs) ((B_dData_dList.v_length segs) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_resolveModuleName modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__216) -> dtb__216
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportsOf = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (let nd_uscrut2 = ((v_findModule modules) ((v_resolvedName modules) name)) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (match dtb__217 with
  | { f_Module_moduleNameOf = dtb__218; f_Module_modulePackageOf = dtb__219; f_Module_moduleImportsOf = dtb__220; f_Module_moduleImplicitImportsOf = dtb__221; f_Module_moduleDeclsOf = dtb__222; f_Module_moduleExportsOf = dtb__223; f_Module_moduleFixitiesOf = dtb__224; f_Module_moduleReexportsOf = dtb__225; f_Module_moduleOpaqueOf = dtb__226; f_Module_moduleExportIndexOf = dtb__227 } -> (Base_dDiag.C_Check_OkC (dtb__223))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 400 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_normalizeImports = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match dtb__228 with
  | { Frontend_dAst.f_Import_importName = dtb__230; Frontend_dAst.f_Import_importIsQualified = dtb__231; Frontend_dAst.f_Import_importAlias = dtb__232; Frontend_dAst.f_Import_importRef = dtb__233 } -> (match ((v_resolveModuleName mc0) dtb__230) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__230; Frontend_dAst.f_Import_importIsQualified = dtb__231; Frontend_dAst.f_Import_importAlias = dtb__232; Frontend_dAst.f_Import_importRef = dtb__233 }, ((v_normalizeImports mc0) dtb__229)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (if (dtb__234 = dtb__230) then (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__230; Frontend_dAst.f_Import_importIsQualified = dtb__231; Frontend_dAst.f_Import_importAlias = dtb__232; Frontend_dAst.f_Import_importRef = dtb__233 }, ((v_normalizeImports mc0) dtb__229))) else (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__234; Frontend_dAst.f_Import_importIsQualified = dtb__231; Frontend_dAst.f_Import_importAlias = dtb__232; Frontend_dAst.f_Import_importRef = dtb__233 }, ((v_normalizeImports mc0) dtb__229))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModule = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) ((v_resolvedName modules) name)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (Base_dDiag.C_Check_OkC ((dtb__235).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedNameIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_resolveModuleNameIn tbl) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__236) -> dtb__236
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModuleIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((v_resolvedNameIn tbl) name)) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> (Base_dDiag.C_Check_OkC ((dtb__237).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValue = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 534 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValueIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModuleIn tbl)) (v_openModuleNames imports)) name))

# 549 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtor = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 554 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtorIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModuleIn tbl)) (v_openModuleNames imports)) name))

# 569 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingTypeIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModuleIn tbl)) (v_openModuleNames imports)) name))

# 573 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingType = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 744 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (if ((Frontend_dAst.v_ctorName dtb__238) = mc0) then true else ((v_anyCtorNamed mc0) dtb__239))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 733 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_isCtorTargetInDecls = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : string) (mc4 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__240, dtb__241) -> (match dtb__240 with
  | Frontend_dAst.C_Decl_DData (dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249, dtb__250) -> (if (if (((v_isMangled mc0) dtb__242) mc2) then ((v_anyCtorNamed mc3) dtb__245) else false) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__241))
  | Frontend_dAst.C_Decl_DRecord (dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257, dtb__258) -> (if (((v_isMangled mc0) dtb__251) mc1) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__241))
  | _ -> (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__241)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 719 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyModuleCtorTarget = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (let mname = (v_moduleNameOf dtb__259) in (if (B_dData_dBool.v_not ((B_dData_dString.v_startsWith mname) mc1)) then ((((v_anyModuleCtorTarget dtb__260) mc1) mc2) mc3) else (if (((((v_isCtorTargetInDecls mname) mc1) mc2) mc3) (v_moduleDeclsOf dtb__259)) then true else ((((v_anyModuleCtorTarget dtb__260) mc1) mc2) mc3))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 712 "Vuna/Compiler/Loader/Modules.vuna"
let v_isDataOrRecordCtorTarget = (fun (modules : t_Module B_dData_dList.t_List) (target : string) -> (let cname = (Base_dSource.v_lastSeg target) in (let dprefix = (Base_dSource.v_prefixOfName target) in (if (dprefix = "") then false else ((((v_anyModuleCtorTarget modules) target) dprefix) cname)))))

# 755 "Vuna/Compiler/Loader/Modules.vuna"
let v_isCtorCanonical = (fun (mname : string) (dname : string) (cname : string) (target : string) -> (let lm = (bi_strLength mname) in (let ld = (bi_strLength dname) in (let lc = (bi_strLength cname) in (let second = ((lm + 1) + ld) in (if (if (if (if (if ((bi_strLength target) = ((second + 1) + lc)) then (((dtp_strAt target) lm) = 46) else false) then (((dtp_strAt target) second) = 46) else false) then (((((v_sliceEq 0) mname) 0) target) lm) else false) then (((((v_sliceEq 0) dname) (lm + 1)) target) ld) else false) then (((((v_sliceEq 0) cname) (second + 1)) target) lc) else false))))))

# 749 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorTarget = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (if ((((v_isCtorCanonical mc0) mc1) (Frontend_dAst.v_ctorName dtb__261)) mc2) then true else ((((v_anyCtorTarget mc0) mc1) mc2) dtb__262))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
