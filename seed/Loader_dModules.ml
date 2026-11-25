open Vuna_runtime
type t_Module = { f_Module_moduleNameOf : string; f_Module_modulePackageOf : string; f_Module_moduleImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleImplicitImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleDeclsOf : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Module_moduleExportsOf : t_ExportEntry B_dData_dList.t_List; f_Module_moduleFixitiesOf : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Module_moduleReexportsOf : string B_dData_dList.t_List; f_Module_moduleOpaqueOf : string B_dData_dList.t_List; f_Module_moduleExportIndexOf : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_Module_moduleFixFactsOf : Frontend_dCst.t_FixityFacts }
and t_Project = { f_Project_projectEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Project_projectEntryImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectModules : t_Module B_dData_dList.t_List; f_Project_projectEntryPkg : string; f_Project_projectEntryFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Project_projectEntryName : string; f_Project_projectEntryFacts : Frontend_dCst.t_FixityFacts }
and t_Namespaces = { f_Namespaces_nsValues : string B_dData_dList.t_List; f_Namespaces_nsCtors : string B_dData_dList.t_List; f_Namespaces_nsTypes : string B_dData_dList.t_List; f_Namespaces_nsValueSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsTypeSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorCands : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Namespaces_nsModuleTbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsRelease : bool }
and t_ExportEntry = { f_ExportEntry_kind : string; f_ExportEntry_public : string; f_ExportEntry_target : string; f_ExportEntry_parent : string }
and t_ExportRef = { f_ExportRef_refKind : string; f_ExportRef_refTarget : string; f_ExportRef_refParent : string }

# 114 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry = (B_dTrait_dEq.C_Eq_Eq ((fun sx sy -> (match sx with
  | { f_ExportEntry_kind = dtb__0; f_ExportEntry_public = dtb__1; f_ExportEntry_target = dtb__2; f_ExportEntry_parent = dtb__3 } -> (match sy with
  | { f_ExportEntry_kind = dtb__4; f_ExportEntry_public = dtb__5; f_ExportEntry_target = dtb__6; f_ExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((B_dTrait_dEq.v__x61__x61_ v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry) sx) sy) then false else true))))

# 63 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleNameOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__8; f_Module_modulePackageOf = dtb__9; f_Module_moduleImportsOf = dtb__10; f_Module_moduleImplicitImportsOf = dtb__11; f_Module_moduleDeclsOf = dtb__12; f_Module_moduleExportsOf = dtb__13; f_Module_moduleFixitiesOf = dtb__14; f_Module_moduleReexportsOf = dtb__15; f_Module_moduleOpaqueOf = dtb__16; f_Module_moduleExportIndexOf = dtb__17; f_Module_moduleFixFactsOf = dtb__18 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePackageOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__19; f_Module_modulePackageOf = dtb__20; f_Module_moduleImportsOf = dtb__21; f_Module_moduleImplicitImportsOf = dtb__22; f_Module_moduleDeclsOf = dtb__23; f_Module_moduleExportsOf = dtb__24; f_Module_moduleFixitiesOf = dtb__25; f_Module_moduleReexportsOf = dtb__26; f_Module_moduleOpaqueOf = dtb__27; f_Module_moduleExportIndexOf = dtb__28; f_Module_moduleFixFactsOf = dtb__29 } -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleAllImportsOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__30; f_Module_modulePackageOf = dtb__31; f_Module_moduleImportsOf = dtb__32; f_Module_moduleImplicitImportsOf = dtb__33; f_Module_moduleDeclsOf = dtb__34; f_Module_moduleExportsOf = dtb__35; f_Module_moduleFixitiesOf = dtb__36; f_Module_moduleReexportsOf = dtb__37; f_Module_moduleOpaqueOf = dtb__38; f_Module_moduleExportIndexOf = dtb__39; f_Module_moduleFixFactsOf = dtb__40 } -> ((B_dData_dList.v_append dtb__32) dtb__33)
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDeclsOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__41; f_Module_modulePackageOf = dtb__42; f_Module_moduleImportsOf = dtb__43; f_Module_moduleImplicitImportsOf = dtb__44; f_Module_moduleDeclsOf = dtb__45; f_Module_moduleExportsOf = dtb__46; f_Module_moduleFixitiesOf = dtb__47; f_Module_moduleReexportsOf = dtb__48; f_Module_moduleOpaqueOf = dtb__49; f_Module_moduleExportIndexOf = dtb__50; f_Module_moduleFixFactsOf = dtb__51 } -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleFixitiesOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__52; f_Module_modulePackageOf = dtb__53; f_Module_moduleImportsOf = dtb__54; f_Module_moduleImplicitImportsOf = dtb__55; f_Module_moduleDeclsOf = dtb__56; f_Module_moduleExportsOf = dtb__57; f_Module_moduleFixitiesOf = dtb__58; f_Module_moduleReexportsOf = dtb__59; f_Module_moduleOpaqueOf = dtb__60; f_Module_moduleExportIndexOf = dtb__61; f_Module_moduleFixFactsOf = dtb__62 } -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleReexportsOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__63; f_Module_modulePackageOf = dtb__64; f_Module_moduleImportsOf = dtb__65; f_Module_moduleImplicitImportsOf = dtb__66; f_Module_moduleDeclsOf = dtb__67; f_Module_moduleExportsOf = dtb__68; f_Module_moduleFixitiesOf = dtb__69; f_Module_moduleReexportsOf = dtb__70; f_Module_moduleOpaqueOf = dtb__71; f_Module_moduleExportIndexOf = dtb__72; f_Module_moduleFixFactsOf = dtb__73 } -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleOpaqueOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__74; f_Module_modulePackageOf = dtb__75; f_Module_moduleImportsOf = dtb__76; f_Module_moduleImplicitImportsOf = dtb__77; f_Module_moduleDeclsOf = dtb__78; f_Module_moduleExportsOf = dtb__79; f_Module_moduleFixitiesOf = dtb__80; f_Module_moduleReexportsOf = dtb__81; f_Module_moduleOpaqueOf = dtb__82; f_Module_moduleExportIndexOf = dtb__83; f_Module_moduleFixFactsOf = dtb__84 } -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryAllImports = (fun (mc0 : t_Project) -> (match mc0 with
  | { f_Project_projectEntryDecls = dtb__85; f_Project_projectEntryImports = dtb__86; f_Project_projectImplicitImports = dtb__87; f_Project_projectModules = dtb__88; f_Project_projectEntryPkg = dtb__89; f_Project_projectEntryFixities = dtb__90; f_Project_projectEntryName = dtb__91; f_Project_projectEntryFacts = dtb__92 } -> ((B_dData_dList.v_append dtb__86) dtb__87)
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allIdentChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (if (if (Frontend_dLexer.v_isIdentStart dtb__93) then true else (Frontend_dLexer.v_isDigit dtb__93)) then (v_allIdentChars dtb__94) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Loader/Modules.vuna"
let v_validSegment = (fun (seg : string) -> (match (B_dData_dList.dtp_unpack seg) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (if (Frontend_dLexer.v_isUpperChar dtb__95) then (v_allIdentChars dtb__96) else false)
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allSegmentsValid = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (if (v_validSegment dtb__97) then (match dtb__98 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_allSegmentsValid dtb__98)
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Loader/Modules.vuna"
let v_validModuleName = (fun (name : string) -> (match (Base_dSource.v_splitOnDot name) with
  | B_dData_dList.C_List_Nil -> false
  | dtb__99 -> (v_allSegmentsValid dtb__99)
))

# 153 "Vuna/Compiler/Loader/Modules.vuna"
let v_mangle = (fun (prefix : string) (name : string) -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

# 171 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sliceEqGo = (fun (i : int) (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) (fuel : int) -> (if (fuel <= 0) then true else (if (i >= n) then true else (if (((dtp_strAt src) (srcOff + i)) = ((dtp_strAt dst) (dstOff + i))) then (((((((v_sliceEqGo (i + 1)) srcOff) src) dstOff) dst) n) (fuel - 1)) else false))))

# 168 "Vuna/Compiler/Loader/Modules.vuna"
let v_sliceEq = (fun (srcOff : int) (src : string) (dstOff : int) (dst : string) (n : int) -> (((((((v_sliceEqGo 0) srcOff) src) dstOff) dst) n) n))

# 157 "Vuna/Compiler/Loader/Modules.vuna"
let v_isMangled = (fun (prefix : string) (name : string) (target : string) -> (if (prefix = "") then (name = target) else (let lp = (bi_strLength prefix) in (let ln = (bi_strLength name) in (if (if (if ((bi_strLength target) = ((lp + 1) + ln)) then (((dtp_strAt target) lp) = 46) else false) then (((((v_sliceEq 0) prefix) 0) target) lp) else false) then (((((v_sliceEq 0) name) (lp + 1)) target) ln) else false)))))

# 184 "Vuna/Compiler/Loader/Modules.vuna"
let v_ctorCanonical = (fun (prefix : string) (dname : string) (cname : string) -> ((v_mangle prefix) (String.concat "" [dname; "."; cname])))

# 187 "Vuna/Compiler/Loader/Modules.vuna"
let v_importModuleName = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__100; Frontend_dAst.f_Import_importIsQualified = dtb__101; Frontend_dAst.f_Import_importAlias = dtb__102; Frontend_dAst.f_Import_importRef = dtb__103 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Loader/Modules.vuna"
let v_importModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_map v_importModuleName) imports))

# 194 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImportSite = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 211 "Vuna/Compiler/Loader/Modules.vuna"
let v_aliasIs = (fun (q : string) (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> (dtb__104 = q)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Loader/Modules.vuna"
let v_lastSegment = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Loader/Modules.vuna"
let v_notEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifierCandidates = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (q : string) -> (let strong = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_map v_importModuleName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_importModuleName imp) = q))) imports))) ((B_dData_dList.v_map v_importModuleName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_aliasIs q) imp))) imports)))) in (if (v_notEmptyList strong) then strong else (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_importModuleName) ((B_dData_dList.v_filter (fun (imp : Frontend_dAst.t_Import) -> ((v_lastSegment (v_importModuleName imp)) = q))) imports))))))

# 231 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_checkImportAliasSyntax = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match (dtb__109).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkImportAliasSyntax dtb__110)
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (if (v_validSegment dtb__111) then (v_checkImportAliasSyntax dtb__110) else ((Base_dDiag.v_onErrDiag (v_withImportSite (Frontend_dAst.v_importSpan dtb__109))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidModuleAlias (dtb__111))) dtb__111)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Loader/Modules.vuna"
let v_validateImports = (fun (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_checkImportAliasSyntax imports))

# 246 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_openModuleNamesAll = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (if (dtb__112).Frontend_dAst.f_Import_importIsQualified then (v_openModuleNamesAll dtb__113) else (B_dData_dList.C_List__x58__x58_ ((v_importModuleName dtb__112), (v_openModuleNamesAll dtb__113))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Loader/Modules.vuna"
let v_openModuleNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (B_dData_dList.v_nubNames (v_openModuleNamesAll imports)))

# 255 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findImportModule = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (if ((v_importModuleName dtb__114) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importModuleName dtb__114))) else (match (dtb__114).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (if (dtb__116 = mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importModuleName dtb__114))) else ((v_findImportModule dtb__115) mc1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findImportModule dtb__115) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_importByPrefix = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (let prefix = (match (dtb__117).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__119) -> dtb__119
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb__117).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
) in (if ((B_dData_dString.v_startsWith (prefix ^ ".")) mc1) then (B_dData_dMaybe.C_Maybe_Just ((v_importModuleName dtb__117))) else ((v_importByPrefix dtb__118) mc1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifiedItemImport = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__120, dtb__121, dtb__122) -> ((v_importByPrefix mc0) dtb__120)
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__123, dtb__124) -> ((v_importByPrefix mc0) dtb__123)
  | Frontend_dAst.C_ExportItem_XBare (dtb__125, dtb__126) -> ((v_importByPrefix mc0) dtb__125)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 270 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_reexportedImportNamesGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (match dtb__127 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__129, dtb__130, dtb__131) -> (match ((v_findImportModule mc0) dtb__129) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__128) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__132) -> (if ((B_dData_dList.v_memName dtb__132) mc2) then (((v_reexportedImportNamesGo mc0) dtb__128) mc2) else (((v_reexportedImportNamesGo mc0) dtb__128) (B_dData_dList.C_List__x58__x58_ (dtb__132, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportItem_XModule (dtb__133, dtb__134) -> (match ((v_findImportModule mc0) dtb__133) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__128) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (if ((B_dData_dList.v_memName dtb__135) mc2) then (((v_reexportedImportNamesGo mc0) dtb__128) mc2) else (((v_reexportedImportNamesGo mc0) dtb__128) (B_dData_dList.C_List__x58__x58_ (dtb__135, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_qualifiedItemImport mc0) dtb__127) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo mc0) dtb__128) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (if ((B_dData_dList.v_memName dtb__136) mc2) then (((v_reexportedImportNamesGo mc0) dtb__128) mc2) else (((v_reexportedImportNamesGo mc0) dtb__128) (B_dData_dList.C_List__x58__x58_ (dtb__136, mc2))))
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNames = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (((v_reexportedImportNamesGo imports) items) B_dData_dList.C_List_Nil))

# 317 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNamesOfHeader = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (match dtb__137 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__138; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__139; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__140; Frontend_dAst.f_ModDecl_modDeclExports = dtb__141; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__142; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__143; Frontend_dAst.f_ModDecl_modDeclRef = dtb__144 } -> (if dtb__139 then ((v_reexportedImportNames mc0) dtb__140) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 322 "Vuna/Compiler/Loader/Modules.vuna"
let rec v__ujoinNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match dtb__146 with
  | B_dData_dList.C_List_Nil -> dtb__145
  | _ -> (String.concat "" [dtb__145; ", "; (v__ujoinNames dtb__146)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Loader/Modules.vuna"
let v_missingModule = (fun (name : string) -> (Base_dDiag.v_icInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

# 358 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleTblOf = (fun (modules : t_Module B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (m : t_Module) -> { B_dData_dPair.f_Pair_first = (v_moduleNameOf m); B_dData_dPair.f_Pair_second = m })) modules)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 433 "Vuna/Compiler/Loader/Modules.vuna"
let v_entriesByName = (fun (name : string) (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) idx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> dtb__147
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_exportIndexOfGo = (fun (mc0 : t_ExportEntry B_dData_dList.t_List) (mc1 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> (let tail = ((v_exportIndexOfGo dtb__149) mc1) in (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__148).f_ExportEntry_public) (B_dData_dList.C_List__x58__x58_ (dtb__148, ((v_entriesByName (dtb__148).f_ExportEntry_public) tail)))) tail))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOf = (fun (entries : t_ExportEntry B_dData_dList.t_List) -> ((v_exportIndexOfGo entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 459 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_lookupExport = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (if (if ((B_dData_dList.v_memName (dtb__150).f_ExportEntry_kind) mc0) then ((dtb__150).f_ExportEntry_public = mc1) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__150)) else (((v_lookupExport mc0) mc1) dtb__151))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValue = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 477 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_filterKinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if (if ((B_dData_dList.v_memName (dtb__152).f_ExportEntry_kind) mc0) then ((dtb__152).f_ExportEntry_public = mc1) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__152, (((v_filterKinds mc0) mc1) dtb__153))) else (((v_filterKinds mc0) mc1) dtb__153))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValues = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) entries))

# 471 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypes = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 474 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModules = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 485 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtor = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) entries))

# 493 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_filterCtors = (fun (mc0 : string) (mc1 : t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (if (if ((dtb__154).f_ExportEntry_kind = "ctor") then ((dtb__154).f_ExportEntry_public = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__154, ((v_filterCtors mc0) dtb__155))) else ((v_filterCtors mc0) dtb__155))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtors = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> ((v_filterCtors name) entries))

# 501 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportType = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) entries))

# 505 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModule = (fun (entries : t_ExportEntry B_dData_dList.t_List) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) entries))

# 508 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModuleIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 511 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValueIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 514 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValuesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) name) ((v_entriesByName name) idx)))

# 517 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypesIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 520 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 523 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorsIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((v_filterCtors name) ((v_entriesByName name) idx)))

# 526 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypeIn = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) name) ((v_entriesByName name) idx)))

# 529 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingValueFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> ((Base_dCommon.v_bind (mc0 dtb__156)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportValuesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingValueFrom mc0) dtb__157) mc2)
  | dtb__158 -> ((Base_dCommon.v_bind (((v_modulesExportingValueFrom mc0) dtb__157) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = e })) dtb__158)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingCtorFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> ((Base_dCommon.v_bind (mc0 dtb__159)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (let found = ((v_findExportCtorsIn idx) mc2) in ((Base_dCommon.v_bind (((v_modulesExportingCtorFrom mc0) dtb__160) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = e })) found)) more))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingTypeFrom = (fun (mc0 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> ((Base_dCommon.v_bind (mc0 dtb__161)) (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportTypesIn idx) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingTypeFrom mc0) dtb__162) mc2)
  | dtb__163 -> ((Base_dCommon.v_bind (((v_modulesExportingTypeFrom mc0) dtb__162) mc2)) (fun (more : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = e })) dtb__163)) more)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sameTargetRest = (fun (mc0 : t_ExportEntry) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (match dtb__164 with
  | { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } -> (if ((mc0).f_ExportEntry_target = (dtb__167).f_ExportEntry_target) then ((v_sameTargetRest mc0) dtb__165) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 592 "Vuna/Compiler/Loader/Modules.vuna"
let v_unifyEntryPairs = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (if ((v_sameTargetRest (B_dData_dPair.v_secondOf dtb__168)) dtb__169) then (Base_dDiag.C_Check_OkC (dtb__168)) else (let mods = (v__ujoinNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169)))) in ((((Base_dDiagnostics_dRn.v_rnNoLoc3 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousName (mc1, mc2, mods))) mc1) mc2) mods)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePath = (fun (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (String.concat "" [(Frontend_dPackages_dPkg.v_rootDir root); "/"; (Base_dSource.v_joinSlashes (Base_dSource.v_splitOnDot name)); ".vuna"]))

# 608 "Vuna/Compiler/Loader/Modules.vuna"
let v_rootAllows = (fun (importerPkg : string) (root : Frontend_dPackages_dPkg.t_Root) (name : string) -> (match (root).Frontend_dPackages_dPkg.f_Root_rootExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> (if ((Frontend_dPackages_dPkg.v_rootName root) = importerPkg) then true else ((B_dData_dList.v_memName name) dtb__170))
  | _ -> failwith "DT: impossible branch"
))

# 614 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_rootOfName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__171) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__171)) else ((v_rootOfName mc0) dtb__172))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleVisibleTo = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (m : t_Module) -> (match ((v_rootOfName (v_modulePackageOf m)) roots) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> (((v_rootAllows importerPkg) dtb__173) (v_moduleNameOf m))
  | _ -> failwith "DT: impossible branch"
))

# 629 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_collectModuleFiles = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (let path = ((v_modulePath dtb__174) mc1) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (if (((v_rootAllows mc2) dtb__174) mc1) then ((((((v_collectModuleFiles nFs) dtb__175) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = path; B_dData_dPair.f_Pair_second = dtb__174 }, mc3))) mc4) else ((((((v_collectModuleFiles nFs) dtb__175) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName dtb__174), mc4)))) else ((((((v_collectModuleFiles nFs) dtb__175) mc1) mc2) mc3) mc4)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc3); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Loader/Modules.vuna"
let v__ujoinRootDirs = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (v__ujoinNames ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) roots)))

# 647 "Vuna/Compiler/Loader/Modules.vuna"
let v_candidateDir = (fun (candidate : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootDir (B_dData_dPair.v_secondOf candidate)))

# 651 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImporterSpan = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then d else ((Base_dDiag.v_withFallbackSpan sp) d)))

# 654 "Vuna/Compiler/Loader/Modules.vuna"
let v_findModuleFile = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (name : string) (importerPkg : string) (importerSpan : Base_dSource.t_Span) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_collectModuleFiles nFs) roots) name) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (let allowed = (B_dData_dPair.v_firstOf collected) in (let hidden = (B_dData_dPair.v_secondOf collected) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (let nd_uscrut10 = allowed in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (match dtb__177 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__176))
  | _ -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (name, (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))) name) (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) allowed))))
)
  | B_dData_dList.C_List_Nil -> (match hidden with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotFound (name, (v__ujoinRootDirs roots)))) name) (v__ujoinRootDirs roots)))
  | dtb__178 -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (v__ujoinNames hidden)))) name) (v__ujoinNames hidden)))
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 676 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOfOf = (fun (mc0 : t_Module) -> (match mc0 with
  | { f_Module_moduleNameOf = dtb__179; f_Module_modulePackageOf = dtb__180; f_Module_moduleImportsOf = dtb__181; f_Module_moduleImplicitImportsOf = dtb__182; f_Module_moduleDeclsOf = dtb__183; f_Module_moduleExportsOf = dtb__184; f_Module_moduleFixitiesOf = dtb__185; f_Module_moduleReexportsOf = dtb__186; f_Module_moduleOpaqueOf = dtb__187; f_Module_moduleExportIndexOf = dtb__188; f_Module_moduleFixFactsOf = dtb__189 } -> dtb__188
  | _ -> failwith "DT: impossible branch"
))

# 703 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_takeSegsLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__190, ((v_takeSegsLocal (mc0 - 1)) dtb__191))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 694 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_longestIndexPrefix = (fun (idx : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (segs : string B_dData_dList.t_List) (k : int) -> (if (k <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findExportModuleIn idx) (Base_dSource.v_joinDots ((v_takeSegsLocal k) segs))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__192).f_ExportEntry_target; B_dData_dPair.f_Pair_second = k }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestIndexPrefix idx) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 707 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_dropFirst = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194)) else ((v_dropFirst (mc0 - 1)) dtb__194))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findModule = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (match dtb__195 with
  | { f_Module_moduleNameOf = dtb__197; f_Module_modulePackageOf = dtb__198; f_Module_moduleImportsOf = dtb__199; f_Module_moduleImplicitImportsOf = dtb__200; f_Module_moduleDeclsOf = dtb__201; f_Module_moduleExportsOf = dtb__202; f_Module_moduleFixitiesOf = dtb__203; f_Module_moduleReexportsOf = dtb__204; f_Module_moduleOpaqueOf = dtb__205; f_Module_moduleExportIndexOf = dtb__206; f_Module_moduleFixFactsOf = dtb__207 } -> (if (dtb__197 = mc1) then (B_dData_dMaybe.C_Maybe_Just ({ f_Module_moduleNameOf = dtb__197; f_Module_modulePackageOf = dtb__198; f_Module_moduleImportsOf = dtb__199; f_Module_moduleImplicitImportsOf = dtb__200; f_Module_moduleDeclsOf = dtb__201; f_Module_moduleExportsOf = dtb__202; f_Module_moduleFixitiesOf = dtb__203; f_Module_moduleReexportsOf = dtb__204; f_Module_moduleOpaqueOf = dtb__205; f_Module_moduleExportIndexOf = dtb__206; f_Module_moduleFixFactsOf = dtb__207 })) else ((v_findModule dtb__196) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDecls = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (let nd_uscrut2 = ((v_findModule modules) name) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (match dtb__208 with
  | { f_Module_moduleNameOf = dtb__209; f_Module_modulePackageOf = dtb__210; f_Module_moduleImportsOf = dtb__211; f_Module_moduleImplicitImportsOf = dtb__212; f_Module_moduleDeclsOf = dtb__213; f_Module_moduleExportsOf = dtb__214; f_Module_moduleFixitiesOf = dtb__215; f_Module_moduleReexportsOf = dtb__216; f_Module_moduleOpaqueOf = dtb__217; f_Module_moduleExportIndexOf = dtb__218; f_Module_moduleFixFactsOf = dtb__219 } -> (Base_dDiag.C_Check_OkC (dtb__213))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 341 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleCtors = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((v_moduleDecls modules) name)) (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.v_ctorsOf decls))))))

# 679 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_walkNamespaceIndexFuel = (fun (fuel : int) (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findModule modules) m) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (if ((B_dData_dList.v_length segs) <= 0) then (B_dData_dMaybe.C_Maybe_Just ((v_moduleNameOf dtb__220))) else (let nd_uscrut6 = (((v_longestIndexPrefix (v_moduleExportIndexOfOf dtb__220)) segs) (B_dData_dList.v_length segs)) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__221) -> (match dtb__221 with
  | { B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = dtb__223 } -> ((((v_walkNamespaceIndexFuel (fuel - 1)) modules) dtb__222) ((v_dropFirst dtb__223) segs))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 673 "Vuna/Compiler/Loader/Modules.vuna"
let v_walkNamespaceIndex = (fun (modules : t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> ((((v_walkNamespaceIndexFuel (1 + (B_dData_dList.v_length segs))) modules) m) segs))

# 373 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModuleIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let joined = (Base_dSource.v_joinDots ((v_takeSegsLocal n) segs)) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) joined) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__224) -> (((v_walkNamespaceIndex ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dContainer_dHashMap.v_toList tbl))) joined) ((v_dropFirst n) segs))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModuleIn tbl) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 364 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleNameIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (B_dData_dMaybe.C_Maybe_Just (name))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let segs = (Base_dSource.v_splitOnDot name) in (((v_resolvePathModuleIn tbl) segs) ((B_dData_dList.v_length segs) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModule = (fun (modules : t_Module B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let joined = (Base_dSource.v_joinDots ((v_takeSegsLocal n) segs)) in (match ((v_findModule modules) joined) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__226) -> (((v_walkNamespaceIndex modules) joined) ((v_dropFirst n) segs))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModule modules) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 347 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> (B_dData_dMaybe.C_Maybe_Just (name))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let segs = (Base_dSource.v_splitOnDot name) in (((v_resolvePathModule modules) segs) ((B_dData_dList.v_length segs) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedName = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_resolveModuleName modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__228) -> dtb__228
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportsOf = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (let nd_uscrut2 = ((v_findModule modules) ((v_resolvedName modules) name)) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> (match dtb__229 with
  | { f_Module_moduleNameOf = dtb__230; f_Module_modulePackageOf = dtb__231; f_Module_moduleImportsOf = dtb__232; f_Module_moduleImplicitImportsOf = dtb__233; f_Module_moduleDeclsOf = dtb__234; f_Module_moduleExportsOf = dtb__235; f_Module_moduleFixitiesOf = dtb__236; f_Module_moduleReexportsOf = dtb__237; f_Module_moduleOpaqueOf = dtb__238; f_Module_moduleExportIndexOf = dtb__239; f_Module_moduleFixFactsOf = dtb__240 } -> (Base_dDiag.C_Check_OkC (dtb__235))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 410 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_normalizeImports = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (match dtb__241 with
  | { Frontend_dAst.f_Import_importName = dtb__243; Frontend_dAst.f_Import_importIsQualified = dtb__244; Frontend_dAst.f_Import_importAlias = dtb__245; Frontend_dAst.f_Import_importRef = dtb__246 } -> (match ((v_resolveModuleName mc0) dtb__243) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__243; Frontend_dAst.f_Import_importIsQualified = dtb__244; Frontend_dAst.f_Import_importAlias = dtb__245; Frontend_dAst.f_Import_importRef = dtb__246 }, ((v_normalizeImports mc0) dtb__242)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (if (dtb__247 = dtb__243) then (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__243; Frontend_dAst.f_Import_importIsQualified = dtb__244; Frontend_dAst.f_Import_importAlias = dtb__245; Frontend_dAst.f_Import_importRef = dtb__246 }, ((v_normalizeImports mc0) dtb__242))) else (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__247; Frontend_dAst.f_Import_importIsQualified = dtb__244; Frontend_dAst.f_Import_importAlias = dtb__245; Frontend_dAst.f_Import_importRef = dtb__246 }, ((v_normalizeImports mc0) dtb__242))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModule = (fun (modules : t_Module B_dData_dList.t_List) (name : string) -> (match ((v_findModule modules) ((v_resolvedName modules) name)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__248) -> (Base_dDiag.C_Check_OkC ((dtb__248).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedNameIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_resolveModuleNameIn tbl) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__249) -> dtb__249
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModuleIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((v_resolvedNameIn tbl) name)) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__250) -> (Base_dDiag.C_Check_OkC ((dtb__250).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValue = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 544 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValueIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModuleIn tbl)) (v_openModuleNames imports)) name))

# 559 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtor = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 564 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtorIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModuleIn tbl)) (v_openModuleNames imports)) name))

# 579 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingTypeIn = (fun (tbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModuleIn tbl)) (v_openModuleNames imports)) name))

# 583 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingType = (fun (modules : t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModule modules)) (v_openModuleNames imports)) name))

# 754 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (if ((Frontend_dAst.v_ctorName dtb__251) = mc0) then true else ((v_anyCtorNamed mc0) dtb__252))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 743 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_isCtorTargetInDecls = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : string) (mc4 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> (match dtb__253 with
  | Frontend_dAst.C_Decl_DData (dtb__255, dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263) -> (if (if (((v_isMangled mc0) dtb__255) mc2) then ((v_anyCtorNamed mc3) dtb__258) else false) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__254))
  | Frontend_dAst.C_Decl_DRecord (dtb__264, dtb__265, dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271) -> (if (((v_isMangled mc0) dtb__264) mc1) then true else (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__254))
  | _ -> (((((v_isCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__254)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyModuleCtorTarget = (fun (mc0 : t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__272, dtb__273) -> (let mname = (v_moduleNameOf dtb__272) in (if (B_dData_dBool.v_not ((B_dData_dString.v_startsWith mname) mc1)) then ((((v_anyModuleCtorTarget dtb__273) mc1) mc2) mc3) else (if (((((v_isCtorTargetInDecls mname) mc1) mc2) mc3) (v_moduleDeclsOf dtb__272)) then true else ((((v_anyModuleCtorTarget dtb__273) mc1) mc2) mc3))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Loader/Modules.vuna"
let v_isDataOrRecordCtorTarget = (fun (modules : t_Module B_dData_dList.t_List) (target : string) -> (let cname = (Base_dSource.v_lastSeg target) in (let dprefix = (Base_dSource.v_prefixOfName target) in (if (dprefix = "") then false else ((((v_anyModuleCtorTarget modules) target) dprefix) cname)))))

# 765 "Vuna/Compiler/Loader/Modules.vuna"
let v_isCtorCanonical = (fun (mname : string) (dname : string) (cname : string) (target : string) -> (let lm = (bi_strLength mname) in (let ld = (bi_strLength dname) in (let lc = (bi_strLength cname) in (let second = ((lm + 1) + ld) in (if (if (if (if (if ((bi_strLength target) = ((second + 1) + lc)) then (((dtp_strAt target) lm) = 46) else false) then (((dtp_strAt target) second) = 46) else false) then (((((v_sliceEq 0) mname) 0) target) lm) else false) then (((((v_sliceEq 0) dname) (lm + 1)) target) ld) else false) then (((((v_sliceEq 0) cname) (second + 1)) target) lc) else false))))))

# 759 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorTarget = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__274, dtb__275) -> (if ((((v_isCtorCanonical mc0) mc1) (Frontend_dAst.v_ctorName dtb__274)) mc2) then true else ((((v_anyCtorTarget mc0) mc1) mc2) dtb__275))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleImportsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__276; f_Module_modulePackageOf = dtb__277; f_Module_moduleImportsOf = dtb__278; f_Module_moduleImplicitImportsOf = dtb__279; f_Module_moduleDeclsOf = dtb__280; f_Module_moduleExportsOf = dtb__281; f_Module_moduleFixitiesOf = dtb__282; f_Module_moduleReexportsOf = dtb__283; f_Module_moduleOpaqueOf = dtb__284; f_Module_moduleExportIndexOf = dtb__285; f_Module_moduleFixFactsOf = dtb__286 } -> dtb__278
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleImplicitImportsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__287; f_Module_modulePackageOf = dtb__288; f_Module_moduleImportsOf = dtb__289; f_Module_moduleImplicitImportsOf = dtb__290; f_Module_moduleDeclsOf = dtb__291; f_Module_moduleExportsOf = dtb__292; f_Module_moduleFixitiesOf = dtb__293; f_Module_moduleReexportsOf = dtb__294; f_Module_moduleOpaqueOf = dtb__295; f_Module_moduleExportIndexOf = dtb__296; f_Module_moduleFixFactsOf = dtb__297 } -> dtb__290
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__298; f_Module_modulePackageOf = dtb__299; f_Module_moduleImportsOf = dtb__300; f_Module_moduleImplicitImportsOf = dtb__301; f_Module_moduleDeclsOf = dtb__302; f_Module_moduleExportsOf = dtb__303; f_Module_moduleFixitiesOf = dtb__304; f_Module_moduleReexportsOf = dtb__305; f_Module_moduleOpaqueOf = dtb__306; f_Module_moduleExportIndexOf = dtb__307; f_Module_moduleFixFactsOf = dtb__308 } -> dtb__303
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__309; f_Module_modulePackageOf = dtb__310; f_Module_moduleImportsOf = dtb__311; f_Module_moduleImplicitImportsOf = dtb__312; f_Module_moduleDeclsOf = dtb__313; f_Module_moduleExportsOf = dtb__314; f_Module_moduleFixitiesOf = dtb__315; f_Module_moduleReexportsOf = dtb__316; f_Module_moduleOpaqueOf = dtb__317; f_Module_moduleExportIndexOf = dtb__318; f_Module_moduleFixFactsOf = dtb__319 } -> dtb__318
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleFixFactsOf = (fun (p : t_Module) -> (match p with
  | { f_Module_moduleNameOf = dtb__320; f_Module_modulePackageOf = dtb__321; f_Module_moduleImportsOf = dtb__322; f_Module_moduleImplicitImportsOf = dtb__323; f_Module_moduleDeclsOf = dtb__324; f_Module_moduleExportsOf = dtb__325; f_Module_moduleFixitiesOf = dtb__326; f_Module_moduleReexportsOf = dtb__327; f_Module_moduleOpaqueOf = dtb__328; f_Module_moduleExportIndexOf = dtb__329; f_Module_moduleFixFactsOf = dtb__330 } -> dtb__330
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryDecls = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__331; f_Project_projectEntryImports = dtb__332; f_Project_projectImplicitImports = dtb__333; f_Project_projectModules = dtb__334; f_Project_projectEntryPkg = dtb__335; f_Project_projectEntryFixities = dtb__336; f_Project_projectEntryName = dtb__337; f_Project_projectEntryFacts = dtb__338 } -> dtb__331
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryImports = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__339; f_Project_projectEntryImports = dtb__340; f_Project_projectImplicitImports = dtb__341; f_Project_projectModules = dtb__342; f_Project_projectEntryPkg = dtb__343; f_Project_projectEntryFixities = dtb__344; f_Project_projectEntryName = dtb__345; f_Project_projectEntryFacts = dtb__346 } -> dtb__340
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectImplicitImports = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__347; f_Project_projectEntryImports = dtb__348; f_Project_projectImplicitImports = dtb__349; f_Project_projectModules = dtb__350; f_Project_projectEntryPkg = dtb__351; f_Project_projectEntryFixities = dtb__352; f_Project_projectEntryName = dtb__353; f_Project_projectEntryFacts = dtb__354 } -> dtb__349
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectModules = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__355; f_Project_projectEntryImports = dtb__356; f_Project_projectImplicitImports = dtb__357; f_Project_projectModules = dtb__358; f_Project_projectEntryPkg = dtb__359; f_Project_projectEntryFixities = dtb__360; f_Project_projectEntryName = dtb__361; f_Project_projectEntryFacts = dtb__362 } -> dtb__358
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryPkg = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__363; f_Project_projectEntryImports = dtb__364; f_Project_projectImplicitImports = dtb__365; f_Project_projectModules = dtb__366; f_Project_projectEntryPkg = dtb__367; f_Project_projectEntryFixities = dtb__368; f_Project_projectEntryName = dtb__369; f_Project_projectEntryFacts = dtb__370 } -> dtb__367
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryFixities = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__371; f_Project_projectEntryImports = dtb__372; f_Project_projectImplicitImports = dtb__373; f_Project_projectModules = dtb__374; f_Project_projectEntryPkg = dtb__375; f_Project_projectEntryFixities = dtb__376; f_Project_projectEntryName = dtb__377; f_Project_projectEntryFacts = dtb__378 } -> dtb__376
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryName = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__379; f_Project_projectEntryImports = dtb__380; f_Project_projectImplicitImports = dtb__381; f_Project_projectModules = dtb__382; f_Project_projectEntryPkg = dtb__383; f_Project_projectEntryFixities = dtb__384; f_Project_projectEntryName = dtb__385; f_Project_projectEntryFacts = dtb__386 } -> dtb__385
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryFacts = (fun (p : t_Project) -> (match p with
  | { f_Project_projectEntryDecls = dtb__387; f_Project_projectEntryImports = dtb__388; f_Project_projectImplicitImports = dtb__389; f_Project_projectModules = dtb__390; f_Project_projectEntryPkg = dtb__391; f_Project_projectEntryFixities = dtb__392; f_Project_projectEntryName = dtb__393; f_Project_projectEntryFacts = dtb__394 } -> dtb__394
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsValues = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__395; f_Namespaces_nsCtors = dtb__396; f_Namespaces_nsTypes = dtb__397; f_Namespaces_nsValueSet = dtb__398; f_Namespaces_nsCtorSet = dtb__399; f_Namespaces_nsTypeSet = dtb__400; f_Namespaces_nsCtorCands = dtb__401; f_Namespaces_nsModuleTbl = dtb__402; f_Namespaces_nsRelease = dtb__403 } -> dtb__395
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtors = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__404; f_Namespaces_nsCtors = dtb__405; f_Namespaces_nsTypes = dtb__406; f_Namespaces_nsValueSet = dtb__407; f_Namespaces_nsCtorSet = dtb__408; f_Namespaces_nsTypeSet = dtb__409; f_Namespaces_nsCtorCands = dtb__410; f_Namespaces_nsModuleTbl = dtb__411; f_Namespaces_nsRelease = dtb__412 } -> dtb__405
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsTypes = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__413; f_Namespaces_nsCtors = dtb__414; f_Namespaces_nsTypes = dtb__415; f_Namespaces_nsValueSet = dtb__416; f_Namespaces_nsCtorSet = dtb__417; f_Namespaces_nsTypeSet = dtb__418; f_Namespaces_nsCtorCands = dtb__419; f_Namespaces_nsModuleTbl = dtb__420; f_Namespaces_nsRelease = dtb__421 } -> dtb__415
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsValueSet = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__422; f_Namespaces_nsCtors = dtb__423; f_Namespaces_nsTypes = dtb__424; f_Namespaces_nsValueSet = dtb__425; f_Namespaces_nsCtorSet = dtb__426; f_Namespaces_nsTypeSet = dtb__427; f_Namespaces_nsCtorCands = dtb__428; f_Namespaces_nsModuleTbl = dtb__429; f_Namespaces_nsRelease = dtb__430 } -> dtb__425
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtorSet = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__431; f_Namespaces_nsCtors = dtb__432; f_Namespaces_nsTypes = dtb__433; f_Namespaces_nsValueSet = dtb__434; f_Namespaces_nsCtorSet = dtb__435; f_Namespaces_nsTypeSet = dtb__436; f_Namespaces_nsCtorCands = dtb__437; f_Namespaces_nsModuleTbl = dtb__438; f_Namespaces_nsRelease = dtb__439 } -> dtb__435
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsTypeSet = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__440; f_Namespaces_nsCtors = dtb__441; f_Namespaces_nsTypes = dtb__442; f_Namespaces_nsValueSet = dtb__443; f_Namespaces_nsCtorSet = dtb__444; f_Namespaces_nsTypeSet = dtb__445; f_Namespaces_nsCtorCands = dtb__446; f_Namespaces_nsModuleTbl = dtb__447; f_Namespaces_nsRelease = dtb__448 } -> dtb__445
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtorCands = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__449; f_Namespaces_nsCtors = dtb__450; f_Namespaces_nsTypes = dtb__451; f_Namespaces_nsValueSet = dtb__452; f_Namespaces_nsCtorSet = dtb__453; f_Namespaces_nsTypeSet = dtb__454; f_Namespaces_nsCtorCands = dtb__455; f_Namespaces_nsModuleTbl = dtb__456; f_Namespaces_nsRelease = dtb__457 } -> dtb__455
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsModuleTbl = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__458; f_Namespaces_nsCtors = dtb__459; f_Namespaces_nsTypes = dtb__460; f_Namespaces_nsValueSet = dtb__461; f_Namespaces_nsCtorSet = dtb__462; f_Namespaces_nsTypeSet = dtb__463; f_Namespaces_nsCtorCands = dtb__464; f_Namespaces_nsModuleTbl = dtb__465; f_Namespaces_nsRelease = dtb__466 } -> dtb__465
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsRelease = (fun (p : t_Namespaces) -> (match p with
  | { f_Namespaces_nsValues = dtb__467; f_Namespaces_nsCtors = dtb__468; f_Namespaces_nsTypes = dtb__469; f_Namespaces_nsValueSet = dtb__470; f_Namespaces_nsCtorSet = dtb__471; f_Namespaces_nsTypeSet = dtb__472; f_Namespaces_nsCtorCands = dtb__473; f_Namespaces_nsModuleTbl = dtb__474; f_Namespaces_nsRelease = dtb__475 } -> dtb__475
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Loader/Modules.vuna"
let v_kind = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__476; f_ExportEntry_public = dtb__477; f_ExportEntry_target = dtb__478; f_ExportEntry_parent = dtb__479 } -> dtb__476
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Loader/Modules.vuna"
let v_public = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__480; f_ExportEntry_public = dtb__481; f_ExportEntry_target = dtb__482; f_ExportEntry_parent = dtb__483 } -> dtb__481
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Loader/Modules.vuna"
let v_target = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__484; f_ExportEntry_public = dtb__485; f_ExportEntry_target = dtb__486; f_ExportEntry_parent = dtb__487 } -> dtb__486
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Loader/Modules.vuna"
let v_parent = (fun (p : t_ExportEntry) -> (match p with
  | { f_ExportEntry_kind = dtb__488; f_ExportEntry_public = dtb__489; f_ExportEntry_target = dtb__490; f_ExportEntry_parent = dtb__491 } -> dtb__491
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Loader/Modules.vuna"
let v_refKind = (fun (p : t_ExportRef) -> (match p with
  | { f_ExportRef_refKind = dtb__492; f_ExportRef_refTarget = dtb__493; f_ExportRef_refParent = dtb__494 } -> dtb__492
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Loader/Modules.vuna"
let v_refTarget = (fun (p : t_ExportRef) -> (match p with
  | { f_ExportRef_refKind = dtb__495; f_ExportRef_refTarget = dtb__496; f_ExportRef_refParent = dtb__497 } -> dtb__496
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Loader/Modules.vuna"
let v_refParent = (fun (p : t_ExportRef) -> (match p with
  | { f_ExportRef_refKind = dtb__498; f_ExportRef_refTarget = dtb__499; f_ExportRef_refParent = dtb__500 } -> dtb__500
  | _ -> failwith "DT: impossible branch"
))
