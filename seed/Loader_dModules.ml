open Vuna_runtime
type t_Module = { f_Module_moduleNameOf : string; f_Module_modulePackageOf : string; f_Module_moduleImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleImplicitImportsOf : Frontend_dAst.t_Import B_dData_dList.t_List; f_Module_moduleDeclsOf : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Module_moduleExportsOf : t_ExportEntry B_dData_dList.t_List; f_Module_moduleFixitiesOf : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Module_moduleReexportsOf : string B_dData_dList.t_List; f_Module_moduleOpaqueOf : string B_dData_dList.t_List; f_Module_moduleExportIndexOf : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_Module_moduleFixFactsOf : Frontend_dCst.t_FixityFacts }
and t_Project = { f_Project_projectEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_Project_projectEntryImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectImplicitImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_Project_projectModules : t_Module B_dData_dList.t_List; f_Project_projectEntryPkg : string; f_Project_projectEntryFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_Project_projectEntryName : string; f_Project_projectEntryFacts : Frontend_dCst.t_FixityFacts }
and t_Namespaces = { f_Namespaces_nsValues : string B_dData_dList.t_List; f_Namespaces_nsCtors : string B_dData_dList.t_List; f_Namespaces_nsTypes : string B_dData_dList.t_List; f_Namespaces_nsValueSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsTypeSet : (string, bool) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsCtorCands : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Namespaces_nsModuleTbl : (string, t_Module) B_dContainer_dHashMap.t_HashMap; f_Namespaces_nsOpenNames : string B_dData_dList.t_List; f_Namespaces_nsRelease : bool }
and t_ExportEntry = { f_ExportEntry_kind : string; f_ExportEntry_public : string; f_ExportEntry_target : string; f_ExportEntry_parent : string }
and t_ExportRef = { f_ExportRef_refKind : string; f_ExportRef_refTarget : string; f_ExportRef_refParent : string }

# 98 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry = (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u1 dtb_u_u2 -> (match dtb_u_u1 with
  | { f_ExportEntry_kind = dtb_u_u3; f_ExportEntry_public = dtb_u_u4; f_ExportEntry_target = dtb_u_u5; f_ExportEntry_parent = dtb_u_u6 } -> (match dtb_u_u2 with
  | { f_ExportEntry_kind = dtb_u_u7; f_ExportEntry_public = dtb_u_u8; f_ExportEntry_target = dtb_u_u9; f_ExportEntry_parent = dtb_u_u10 } -> (if (dtb_u_u3 = dtb_u_u7) then (if (dtb_u_u4 = dtb_u_u8) then (if (dtb_u_u5 = dtb_u_u9) then (dtb_u_u6 = dtb_u_u10) else false) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u11 dtb_u_u12 -> (if (((B_dTrait_dEq.v__x61__x61_ v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry) dtb_u_u11) dtb_u_u12) then false else true))))

# 63 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleAllImportsOf = (fun (dtb_u_u13 : t_Module) -> (match dtb_u_u13 with
  | { f_Module_moduleNameOf = dtb_u_u14; f_Module_modulePackageOf = dtb_u_u15; f_Module_moduleImportsOf = dtb_u_u16; f_Module_moduleImplicitImportsOf = dtb_u_u17; f_Module_moduleDeclsOf = dtb_u_u18; f_Module_moduleExportsOf = dtb_u_u19; f_Module_moduleFixitiesOf = dtb_u_u20; f_Module_moduleReexportsOf = dtb_u_u21; f_Module_moduleOpaqueOf = dtb_u_u22; f_Module_moduleExportIndexOf = dtb_u_u23; f_Module_moduleFixFactsOf = dtb_u_u24 } -> ((B_dData_dList.v_append dtb_u_u16) dtb_u_u17)
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryAllImports = (fun (dtb_u_u25 : t_Project) -> (match dtb_u_u25 with
  | { f_Project_projectEntryDecls = dtb_u_u26; f_Project_projectEntryImports = dtb_u_u27; f_Project_projectImplicitImports = dtb_u_u28; f_Project_projectModules = dtb_u_u29; f_Project_projectEntryPkg = dtb_u_u30; f_Project_projectEntryFixities = dtb_u_u31; f_Project_projectEntryName = dtb_u_u32; f_Project_projectEntryFacts = dtb_u_u33 } -> ((B_dData_dList.v_append dtb_u_u27) dtb_u_u28)
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allIdentChars = (fun (dtb_u_u34 : int B_dData_dList.t_List) -> (match dtb_u_u34 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> (if (if (Frontend_dLexer.v_isIdentStart dtb_u_u35) then true else (Frontend_dLexer.v_isDigit dtb_u_u35)) then (v_allIdentChars dtb_u_u36) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Loader/Modules.vuna"
let v_validSegment = (fun (dtb_u_u37 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u37) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u38, dtb_u_u39) -> (if (Frontend_dLexer.v_isUpperChar dtb_u_u38) then (v_allIdentChars dtb_u_u39) else false)
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_allSegmentsValid = (fun (dtb_u_u40 : string B_dData_dList.t_List) -> (match dtb_u_u40 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u41, dtb_u_u42) -> (if (v_validSegment dtb_u_u41) then (match dtb_u_u42 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_allSegmentsValid dtb_u_u42)
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Loader/Modules.vuna"
let v_validModuleName = (fun (dtb_u_u43 : string) -> (match (Base_dSource.v_splitOnDot dtb_u_u43) with
  | B_dData_dList.C_List_Nil -> false
  | dtb_u_u44 -> (v_allSegmentsValid dtb_u_u44)
))

# 137 "Vuna/Compiler/Loader/Modules.vuna"
let v_mangle = (fun (dtb_u_u45 : string) (dtb_u_u46 : string) -> (if (dtb_u_u45 = "") then dtb_u_u46 else (String.concat "" [dtb_u_u45; "."; dtb_u_u46])))

# 155 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sliceEqGo = (fun (dtb_u_u47 : int) (dtb_u_u48 : int) (dtb_u_u49 : string) (dtb_u_u50 : int) (dtb_u_u51 : string) (dtb_u_u52 : int) (dtb_u_u53 : int) -> (if (dtb_u_u53 <= 0) then true else (if (dtb_u_u47 >= dtb_u_u52) then true else (if ((let b = dtb_u_u49 in let k = (dtb_u_u48 + dtb_u_u47) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = (let b = dtb_u_u51 in let k = (dtb_u_u50 + dtb_u_u47) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then (((((((v_sliceEqGo (dtb_u_u47 + 1)) dtb_u_u48) dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u52) (dtb_u_u53 - 1)) else false))))

# 152 "Vuna/Compiler/Loader/Modules.vuna"
let v_sliceEq = (fun (dtb_u_u54 : int) (dtb_u_u55 : string) (dtb_u_u56 : int) (dtb_u_u57 : string) (dtb_u_u58 : int) -> (((((((v_sliceEqGo 0) dtb_u_u54) dtb_u_u55) dtb_u_u56) dtb_u_u57) dtb_u_u58) dtb_u_u58))

# 141 "Vuna/Compiler/Loader/Modules.vuna"
let v_isMangled = (fun (dtb_u_u59 : string) (dtb_u_u60 : string) (dtb_u_u61 : string) -> (if (dtb_u_u59 = "") then (dtb_u_u60 = dtb_u_u61) else (let dtb_u_u62 = (String.length dtb_u_u59) in (let dtb_u_u63 = (String.length dtb_u_u60) in (if (if (if ((String.length dtb_u_u61) = ((dtb_u_u62 + 1) + dtb_u_u63)) then ((let b = dtb_u_u61 in let k = dtb_u_u62 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) else false) then (((((v_sliceEq 0) dtb_u_u59) 0) dtb_u_u61) dtb_u_u62) else false) then (((((v_sliceEq 0) dtb_u_u60) (dtb_u_u62 + 1)) dtb_u_u61) dtb_u_u63) else false)))))

# 168 "Vuna/Compiler/Loader/Modules.vuna"
let v_ctorCanonical = (fun (dtb_u_u64 : string) (dtb_u_u65 : string) (dtb_u_u66 : string) -> ((v_mangle dtb_u_u64) (String.concat "" [dtb_u_u65; "."; dtb_u_u66])))

# 171 "Vuna/Compiler/Loader/Modules.vuna"
let v_importModuleNames = (fun (dtb_u_u67 : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_map Frontend_dAst.v_importName) dtb_u_u67))

# 175 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImportSite = (fun (dtb_u_u68 : Base_dSource.t_Span) (dtb_u_u69 : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile dtb_u_u68) = "") then dtb_u_u69 else ((Base_dDiag.v_withFallbackSpan dtb_u_u68) dtb_u_u69)))

# 191 "Vuna/Compiler/Loader/Modules.vuna"
let v_aliasIs = (fun (dtb_u_u70 : string) (dtb_u_u71 : Frontend_dAst.t_Import) -> (match (dtb_u_u71).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u72) -> (dtb_u_u72 = dtb_u_u70)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Loader/Modules.vuna"
let v_lastSegment = (fun (dtb_u_u73 : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u73)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u74; B_dData_dPair.f_Pair_second = dtb_u_u75 } -> dtb_u_u75
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Loader/Modules.vuna"
let v_notEmptyList = (fun dtb_u_u77 -> (match dtb_u_u77 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifierCandidates = (fun (dtb_u_u80 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u81 : string) -> (let dtb_u_u82 = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_map Frontend_dAst.v_importName) ((B_dData_dList.v_filter (fun (dtb_u_u84 : Frontend_dAst.t_Import) -> ((Frontend_dAst.v_importName dtb_u_u84) = dtb_u_u81))) dtb_u_u80))) ((B_dData_dList.v_map Frontend_dAst.v_importName) ((B_dData_dList.v_filter (fun (dtb_u_u85 : Frontend_dAst.t_Import) -> ((v_aliasIs dtb_u_u81) dtb_u_u85))) dtb_u_u80)))) in (if (v_notEmptyList dtb_u_u82) then dtb_u_u82 else (B_dData_dList.v_nubNames ((B_dData_dList.v_map Frontend_dAst.v_importName) ((B_dData_dList.v_filter (fun (dtb_u_u83 : Frontend_dAst.t_Import) -> ((v_lastSegment (Frontend_dAst.v_importName dtb_u_u83)) = dtb_u_u81))) dtb_u_u80))))))

# 211 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_checkImportAliasSyntax = (fun (dtb_u_u87 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match dtb_u_u87 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (match (dtb_u_u88).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkImportAliasSyntax dtb_u_u89)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u90) -> (if (v_validSegment dtb_u_u90) then (v_checkImportAliasSyntax dtb_u_u89) else ((Base_dDiag.v_onErrDiag (v_withImportSite (Frontend_dAst.v_importSpan dtb_u_u88))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidModuleAlias (dtb_u_u90))) dtb_u_u90)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Loader/Modules.vuna"
let v_validateImports = (fun (dtb_u_u92 : string) (dtb_u_u93 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (v_checkImportAliasSyntax dtb_u_u93))

# 226 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_openModuleNamesAll = (fun (dtb_u_u94 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match dtb_u_u94 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if (dtb_u_u95).Frontend_dAst.f_Import_importIsQualified then (v_openModuleNamesAll dtb_u_u96) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.v_importName dtb_u_u95), (v_openModuleNamesAll dtb_u_u96))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Loader/Modules.vuna"
let v_openModuleNames = (fun (dtb_u_u97 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (B_dData_dList.v_nubNames (v_openModuleNamesAll dtb_u_u97)))

# 235 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findImportModule = (fun (dtb_u_u98 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u99 : string) -> (match dtb_u_u98 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u100, dtb_u_u101) -> (if ((Frontend_dAst.v_importName dtb_u_u100) = dtb_u_u99) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_importName dtb_u_u100))) else (match (dtb_u_u100).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u102) -> (if (dtb_u_u102 = dtb_u_u99) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_importName dtb_u_u100))) else ((v_findImportModule dtb_u_u101) dtb_u_u99))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findImportModule dtb_u_u101) dtb_u_u99)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_importByPrefix = (fun (dtb_u_u103 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u104 : string) -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (let dtb_u_u107 = (match (dtb_u_u105).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u108) -> dtb_u_u108
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u105).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
) in (if ((B_dData_dString.v_startsWith (dtb_u_u107 ^ ".")) dtb_u_u104) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_importName dtb_u_u105))) else ((v_importByPrefix dtb_u_u106) dtb_u_u104)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Loader/Modules.vuna"
let v_qualifiedItemImport = (fun (dtb_u_u109 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u110 : Frontend_dAst.t_ExportItem) -> (match dtb_u_u110 with
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u111, dtb_u_u112, dtb_u_u113) -> ((v_importByPrefix dtb_u_u109) dtb_u_u111)
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb_u_u114, dtb_u_u115) -> ((v_importByPrefix dtb_u_u109) dtb_u_u114)
  | Frontend_dAst.C_ExportItem_XBare (dtb_u_u116, dtb_u_u117) -> ((v_importByPrefix dtb_u_u109) dtb_u_u116)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 250 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_reexportedImportNamesGo = (fun (dtb_u_u118 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u119 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u120 : string B_dData_dList.t_List) -> (match dtb_u_u119 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> (match dtb_u_u121 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u123, dtb_u_u124, dtb_u_u125) -> (match ((v_findImportModule dtb_u_u118) dtb_u_u123) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) dtb_u_u120)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u126) -> (if ((B_dData_dList.v_memName dtb_u_u126) dtb_u_u120) then (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) dtb_u_u120) else (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) (B_dData_dList.C_List__x58__x58_ (dtb_u_u126, dtb_u_u120))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportItem_XModule (dtb_u_u127, dtb_u_u128) -> (match ((v_findImportModule dtb_u_u118) dtb_u_u127) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) dtb_u_u120)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u129) -> (if ((B_dData_dList.v_memName dtb_u_u129) dtb_u_u120) then (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) dtb_u_u120) else (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) (B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u120))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_qualifiedItemImport dtb_u_u118) dtb_u_u121) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) dtb_u_u120)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u130) -> (if ((B_dData_dList.v_memName dtb_u_u130) dtb_u_u120) then (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) dtb_u_u120) else (((v_reexportedImportNamesGo dtb_u_u118) dtb_u_u122) (B_dData_dList.C_List__x58__x58_ (dtb_u_u130, dtb_u_u120))))
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u120)
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNames = (fun (dtb_u_u131 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u132 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (((v_reexportedImportNamesGo dtb_u_u131) dtb_u_u132) B_dData_dList.C_List_Nil))

# 297 "Vuna/Compiler/Loader/Modules.vuna"
let v_reexportedImportNamesOfHeader = (fun (dtb_u_u133 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u134 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match dtb_u_u134 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u135) -> (match dtb_u_u135 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u136; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u137; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u138; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u139; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u140; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u141; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u142 } -> (if dtb_u_u137 then ((v_reexportedImportNames dtb_u_u133) dtb_u_u138) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
))

# 302 "Vuna/Compiler/Loader/Modules.vuna"
let rec v__ujoinNames = (fun (dtb_u_u143 : string B_dData_dList.t_List) -> (match dtb_u_u143 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u144, dtb_u_u145) -> (match dtb_u_u145 with
  | B_dData_dList.C_List_Nil -> dtb_u_u144
  | _ -> (String.concat "" [dtb_u_u144; ", "; (v__ujoinNames dtb_u_u145)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Loader/Modules.vuna"
let v_missingModule = (fun (dtb_u_u147 : string) -> (Base_dDiag.v_icInternal (String.concat "" ["module "; dtb_u_u147; " is not loaded (import list and module table disagree)"])))

# 413 "Vuna/Compiler/Loader/Modules.vuna"
let v_entriesByName = (fun (dtb_u_u148 : string) (dtb_u_u149 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u148) dtb_u_u149) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u150) -> dtb_u_u150
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_exportIndexOfGo = (fun (dtb_u_u151 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u152 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u151 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u153, dtb_u_u154) -> (let dtb_u_u155 = ((v_exportIndexOfGo dtb_u_u154) dtb_u_u152) in (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb_u_u153).f_ExportEntry_public) (B_dData_dList.C_List__x58__x58_ (dtb_u_u153, ((v_entriesByName (dtb_u_u153).f_ExportEntry_public) dtb_u_u155)))) dtb_u_u155))
  | B_dData_dList.C_List_Nil -> dtb_u_u152
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOf = (fun (dtb_u_u156 : t_ExportEntry B_dData_dList.t_List) -> ((v_exportIndexOfGo dtb_u_u156) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 439 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_lookupExport = (fun (dtb_u_u157 : string B_dData_dList.t_List) (dtb_u_u158 : string) (dtb_u_u159 : t_ExportEntry B_dData_dList.t_List) -> (match dtb_u_u159 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u160, dtb_u_u161) -> (if (if ((B_dData_dList.v_memName (dtb_u_u160).f_ExportEntry_kind) dtb_u_u157) then ((dtb_u_u160).f_ExportEntry_public = dtb_u_u158) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u160)) else (((v_lookupExport dtb_u_u157) dtb_u_u158) dtb_u_u161))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValue = (fun (dtb_u_u162 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u163 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) dtb_u_u163) dtb_u_u162))

# 457 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_filterKinds = (fun (dtb_u_u164 : string B_dData_dList.t_List) (dtb_u_u165 : string) (dtb_u_u166 : t_ExportEntry B_dData_dList.t_List) -> (match dtb_u_u166 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u167, dtb_u_u168) -> (if (if ((B_dData_dList.v_memName (dtb_u_u167).f_ExportEntry_kind) dtb_u_u164) then ((dtb_u_u167).f_ExportEntry_public = dtb_u_u165) else false) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u167, (((v_filterKinds dtb_u_u164) dtb_u_u165) dtb_u_u168))) else (((v_filterKinds dtb_u_u164) dtb_u_u165) dtb_u_u168))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValues = (fun (dtb_u_u169 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u170 : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) dtb_u_u170) dtb_u_u169))

# 451 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypes = (fun (dtb_u_u171 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u172 : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) dtb_u_u172) dtb_u_u171))

# 454 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModules = (fun (dtb_u_u173 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u174 : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) dtb_u_u174) dtb_u_u173))

# 465 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtor = (fun (dtb_u_u175 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u176 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) dtb_u_u176) dtb_u_u175))

# 473 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_filterCtors = (fun (dtb_u_u177 : string) (dtb_u_u178 : t_ExportEntry B_dData_dList.t_List) -> (match dtb_u_u178 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u179, dtb_u_u180) -> (if (if ((dtb_u_u179).f_ExportEntry_kind = "ctor") then ((dtb_u_u179).f_ExportEntry_public = dtb_u_u177) else false) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u179, ((v_filterCtors dtb_u_u177) dtb_u_u180))) else ((v_filterCtors dtb_u_u177) dtb_u_u180))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtors = (fun (dtb_u_u181 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u182 : string) -> ((v_filterCtors dtb_u_u182) dtb_u_u181))

# 481 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportType = (fun (dtb_u_u183 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u184 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) dtb_u_u184) dtb_u_u183))

# 485 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModule = (fun (dtb_u_u185 : t_ExportEntry B_dData_dList.t_List) (dtb_u_u186 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) dtb_u_u186) dtb_u_u185))

# 488 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportModuleIn = (fun (dtb_u_u187 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u188 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("module", B_dData_dList.C_List_Nil))) dtb_u_u188) ((v_entriesByName dtb_u_u188) dtb_u_u187)))

# 491 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValueIn = (fun (dtb_u_u189 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u190 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) dtb_u_u190) ((v_entriesByName dtb_u_u190) dtb_u_u189)))

# 494 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportValuesIn = (fun (dtb_u_u191 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u192 : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("val", (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))))) dtb_u_u192) ((v_entriesByName dtb_u_u192) dtb_u_u191)))

# 497 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypesIn = (fun (dtb_u_u193 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u194 : string) -> (((v_filterKinds (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) dtb_u_u194) ((v_entriesByName dtb_u_u194) dtb_u_u193)))

# 500 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorIn = (fun (dtb_u_u195 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u196 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("ctor", B_dData_dList.C_List_Nil))) dtb_u_u196) ((v_entriesByName dtb_u_u196) dtb_u_u195)))

# 503 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportCtorsIn = (fun (dtb_u_u197 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u198 : string) -> ((v_filterCtors dtb_u_u198) ((v_entriesByName dtb_u_u198) dtb_u_u197)))

# 506 "Vuna/Compiler/Loader/Modules.vuna"
let v_findExportTypeIn = (fun (dtb_u_u199 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u200 : string) -> (((v_lookupExport (B_dData_dList.C_List__x58__x58_ ("type", B_dData_dList.C_List_Nil))) dtb_u_u200) ((v_entriesByName dtb_u_u200) dtb_u_u199)))

# 509 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingValueFrom = (fun (dtb_u_u201 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (dtb_u_u202 : string B_dData_dList.t_List) (dtb_u_u203 : string) -> (match dtb_u_u202 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u204, dtb_u_u205) -> ((Base_dCommon.v_bind (dtb_u_u201 dtb_u_u204)) (fun (dtb_u_u206 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportValuesIn dtb_u_u206) dtb_u_u203) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingValueFrom dtb_u_u201) dtb_u_u205) dtb_u_u203)
  | dtb_u_u207 -> ((Base_dCommon.v_bind (((v_modulesExportingValueFrom dtb_u_u201) dtb_u_u205) dtb_u_u203)) (fun (dtb_u_u208 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u209 : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb_u_u204; B_dData_dPair.f_Pair_second = dtb_u_u209 })) dtb_u_u207)) dtb_u_u208)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingCtorFrom = (fun (dtb_u_u210 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (dtb_u_u211 : string B_dData_dList.t_List) (dtb_u_u212 : string) -> (match dtb_u_u211 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u213, dtb_u_u214) -> ((Base_dCommon.v_bind (dtb_u_u210 dtb_u_u213)) (fun (dtb_u_u215 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (let dtb_u_u216 = ((v_findExportCtorsIn dtb_u_u215) dtb_u_u212) in ((Base_dCommon.v_bind (((v_modulesExportingCtorFrom dtb_u_u210) dtb_u_u214) dtb_u_u212)) (fun (dtb_u_u217 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u218 : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb_u_u213; B_dData_dPair.f_Pair_second = dtb_u_u218 })) dtb_u_u216)) dtb_u_u217))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_modulesExportingTypeFrom = (fun (dtb_u_u219 : (string) -> (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap Base_dDiag.t_Check) (dtb_u_u220 : string B_dData_dList.t_List) (dtb_u_u221 : string) -> (match dtb_u_u220 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u222, dtb_u_u223) -> ((Base_dCommon.v_bind (dtb_u_u219 dtb_u_u222)) (fun (dtb_u_u224 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((v_findExportTypesIn dtb_u_u224) dtb_u_u221) with
  | B_dData_dList.C_List_Nil -> (((v_modulesExportingTypeFrom dtb_u_u219) dtb_u_u223) dtb_u_u221)
  | dtb_u_u225 -> ((Base_dCommon.v_bind (((v_modulesExportingTypeFrom dtb_u_u219) dtb_u_u223) dtb_u_u221)) (fun (dtb_u_u226 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u227 : t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb_u_u222; B_dData_dPair.f_Pair_second = dtb_u_u227 })) dtb_u_u225)) dtb_u_u226)))))
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_sameTargetRest = (fun (dtb_u_u229 : t_ExportEntry) dtb_u_u230 -> (match dtb_u_u230 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u231, dtb_u_u232) -> (match dtb_u_u231 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u233; B_dData_dPair.f_Pair_second = dtb_u_u234 } -> (if ((dtb_u_u229).f_ExportEntry_target = (dtb_u_u234).f_ExportEntry_target) then ((v_sameTargetRest dtb_u_u229) dtb_u_u232) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Loader/Modules.vuna"
let v_unifyEntryPairs = (fun (dtb_u_u235 : string) (dtb_u_u236 : string) (dtb_u_u237 : string) (dtb_u_u238 : (string, t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u238 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u239, dtb_u_u240) -> (if ((v_sameTargetRest (B_dData_dPair.v_secondOf dtb_u_u239)) dtb_u_u240) then (Base_dDiag.C_Check_OkC (dtb_u_u239)) else (let dtb_u_u241 = (v__ujoinNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dList.C_List__x58__x58_ (dtb_u_u239, dtb_u_u240)))) in ((((Base_dDiagnostics_dRn.v_rnNoLoc3 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousName (dtb_u_u236, dtb_u_u237, dtb_u_u241))) dtb_u_u236) dtb_u_u237) dtb_u_u241)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePath = (fun (dtb_u_u242 : Frontend_dPackages_dPkg.t_Root) (dtb_u_u243 : string) -> (String.concat "" [(Frontend_dPackages_dPkg.v_rootDir dtb_u_u242); "/"; (Base_dSource.v_joinSlashes (Base_dSource.v_splitOnDot dtb_u_u243)); ".vuna"]))

# 588 "Vuna/Compiler/Loader/Modules.vuna"
let v_rootAllows = (fun (dtb_u_u244 : string) (dtb_u_u245 : Frontend_dPackages_dPkg.t_Root) (dtb_u_u246 : string) -> (match (dtb_u_u245).Frontend_dPackages_dPkg.f_Root_rootExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u247) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb_u_u245) = dtb_u_u244) then true else ((B_dData_dList.v_memName dtb_u_u246) dtb_u_u247))
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_rootOfName = (fun (dtb_u_u248 : string) (dtb_u_u249 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match dtb_u_u249 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u250, dtb_u_u251) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb_u_u250) = dtb_u_u248) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u250)) else ((v_rootOfName dtb_u_u248) dtb_u_u251))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_collectModuleFiles = (fun (dtb_u_u252 : string) (dtb_u_u255 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u256 : string) (dtb_u_u257 : string) (dtb_u_u258 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u259 : string B_dData_dList.t_List) -> (match dtb_u_u255 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u260, dtb_u_u261) -> (let dtb_u_u262 = ((v_modulePath dtb_u_u260) dtb_u_u256) in (Obj.repr ((fun (dtb_u_u267 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u270 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u252) dtb_u_u262) dtb_u_u267) in (if dtb_u_u270 then (if (((v_rootAllows dtb_u_u257) dtb_u_u260) dtb_u_u256) then ((Obj.magic ((((((v_collectModuleFiles dtb_u_u252) dtb_u_u261) dtb_u_u256) dtb_u_u257) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u262; B_dData_dPair.f_Pair_second = dtb_u_u260 }, dtb_u_u258))) dtb_u_u259)) dtb_u_u267) else ((Obj.magic ((((((v_collectModuleFiles dtb_u_u252) dtb_u_u261) dtb_u_u256) dtb_u_u257) dtb_u_u258) (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName dtb_u_u260), dtb_u_u259)))) dtb_u_u267)) else ((Obj.magic ((((((v_collectModuleFiles dtb_u_u252) dtb_u_u261) dtb_u_u256) dtb_u_u257) dtb_u_u258) dtb_u_u259)) dtb_u_u267)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u272 = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u258); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u259) } in (Obj.repr ((fun (dtb_u_u273 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u272))))
  | _ -> failwith "DT: impossible branch"
))
# 609 "Vuna/Compiler/Loader/Modules.vuna"
and v_collectModuleFiles_u_udirect = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u260, dtb_u_u261) -> (let dtb_u_u262 = ((v_modulePath dtb_u_u260) mc1) in (let dtb_u_u270 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u262) _u_ueffTok) in (if dtb_u_u270 then (if (((v_rootAllows mc2) dtb_u_u260) mc1) then ((Obj.magic ((((((v_collectModuleFiles nFs) dtb_u_u261) mc1) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u262; B_dData_dPair.f_Pair_second = dtb_u_u260 }, mc3))) mc4)) _u_ueffTok) else ((Obj.magic ((((((v_collectModuleFiles nFs) dtb_u_u261) mc1) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName dtb_u_u260), mc4)))) _u_ueffTok)) else ((Obj.magic ((((((v_collectModuleFiles nFs) dtb_u_u261) mc1) mc2) mc3) mc4)) _u_ueffTok))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u272 = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc3); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc4) } in dtb_u_u272)
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Loader/Modules.vuna"
let v__ujoinRootDirs = (fun (dtb_u_u274 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (v__ujoinNames ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) dtb_u_u274)))

# 627 "Vuna/Compiler/Loader/Modules.vuna"
let v_candidateDir = (fun (dtb_u_u275 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootDir (B_dData_dPair.v_secondOf dtb_u_u275)))

# 631 "Vuna/Compiler/Loader/Modules.vuna"
let v_withImporterSpan = (fun (dtb_u_u276 : Base_dSource.t_Span) (dtb_u_u277 : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile dtb_u_u276) = "") then dtb_u_u277 else ((Base_dDiag.v_withFallbackSpan dtb_u_u276) dtb_u_u277)))

# 634 "Vuna/Compiler/Loader/Modules.vuna"
let v_findModuleFile = (fun (dtb_u_u278 : string) (dtb_u_u281 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u282 : string) (dtb_u_u283 : string) (dtb_u_u284 : Base_dSource.t_Span) -> (Obj.repr ((fun (dtb_u_u289 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u292 = (((((((v_collectModuleFiles_u_udirect dtb_u_u278) dtb_u_u281) dtb_u_u282) dtb_u_u283) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u289) in (let dtb_u_u293 = (B_dData_dPair.v_firstOf dtb_u_u292) in (let dtb_u_u294 = (B_dData_dPair.v_secondOf dtb_u_u292) in (let dtb_u_u296 = (let dtb_u_u298 = dtb_u_u293 in (match dtb_u_u298 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u299, dtb_u_u300) -> (match dtb_u_u300 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u299))
  | _ -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan dtb_u_u284)) (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (dtb_u_u282, (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) dtb_u_u293))))) dtb_u_u282) (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) dtb_u_u293))))
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u294 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan dtb_u_u284)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotFound (dtb_u_u282, (v__ujoinRootDirs dtb_u_u281)))) dtb_u_u282) (v__ujoinRootDirs dtb_u_u281)))
  | dtb_u_u301 -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan dtb_u_u284)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (dtb_u_u282, (v__ujoinNames dtb_u_u294)))) dtb_u_u282) (v__ujoinNames dtb_u_u294)))
)
  | _ -> failwith "DT: impossible branch"
)) in dtb_u_u296))))))))

# 634 "Vuna/Compiler/Loader/Modules.vuna"
let v_findModuleFile_u_udirect = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (name : string) (importerPkg : string) (importerSpan : Base_dSource.t_Span) _u_ueffTok -> (let dtb_u_u292 = (((((((v_collectModuleFiles_u_udirect nFs) roots) name) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) _u_ueffTok) in (let dtb_u_u293 = (B_dData_dPair.v_firstOf dtb_u_u292) in (let dtb_u_u294 = (B_dData_dPair.v_secondOf dtb_u_u292) in (let dtb_u_u296 = (let dtb_u_u298 = dtb_u_u293 in (match dtb_u_u298 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u299, dtb_u_u300) -> (match dtb_u_u300 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u299))
  | _ -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (name, (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) dtb_u_u293))))) name) (v__ujoinNames ((B_dData_dList.v_map v_candidateDir) dtb_u_u293))))
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u294 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotFound (name, (v__ujoinRootDirs roots)))) name) (v__ujoinRootDirs roots)))
  | dtb_u_u301 -> ((Base_dDiag.v_onErrDiag (v_withImporterSpan importerSpan)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (v__ujoinNames dtb_u_u294)))) name) (v__ujoinNames dtb_u_u294)))
)
  | _ -> failwith "DT: impossible branch"
)) in dtb_u_u296)))))

# 656 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOfOf = (fun (dtb_u_u302 : t_Module) -> (match dtb_u_u302 with
  | { f_Module_moduleNameOf = dtb_u_u303; f_Module_modulePackageOf = dtb_u_u304; f_Module_moduleImportsOf = dtb_u_u305; f_Module_moduleImplicitImportsOf = dtb_u_u306; f_Module_moduleDeclsOf = dtb_u_u307; f_Module_moduleExportsOf = dtb_u_u308; f_Module_moduleFixitiesOf = dtb_u_u309; f_Module_moduleReexportsOf = dtb_u_u310; f_Module_moduleOpaqueOf = dtb_u_u311; f_Module_moduleExportIndexOf = dtb_u_u312; f_Module_moduleFixFactsOf = dtb_u_u313 } -> dtb_u_u312
  | _ -> failwith "DT: impossible branch"
))

# 683 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_takeSegsLocal = (fun (dtb_u_u314 : int) (dtb_u_u315 : string B_dData_dList.t_List) -> (match dtb_u_u315 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u316, dtb_u_u317) -> (if (dtb_u_u314 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb_u_u316, ((v_takeSegsLocal (dtb_u_u314 - 1)) dtb_u_u317))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_longestIndexPrefix = (fun (dtb_u_u318 : (string, t_ExportEntry B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u319 : string B_dData_dList.t_List) (dtb_u_u320 : int) -> (if (dtb_u_u320 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findExportModuleIn dtb_u_u318) (Base_dSource.v_joinDots ((v_takeSegsLocal dtb_u_u320) dtb_u_u319))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u321) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb_u_u321).f_ExportEntry_target; B_dData_dPair.f_Pair_second = dtb_u_u320 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestIndexPrefix dtb_u_u318) dtb_u_u319) (dtb_u_u320 - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 687 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_dropFirst = (fun (dtb_u_u322 : int) (dtb_u_u323 : string B_dData_dList.t_List) -> (match dtb_u_u323 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u324, dtb_u_u325) -> (if (dtb_u_u322 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u324, dtb_u_u325)) else ((v_dropFirst (dtb_u_u322 - 1)) dtb_u_u325))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_findModule = (fun (dtb_u_u326 : t_Module B_dData_dList.t_List) (dtb_u_u327 : string) -> (match dtb_u_u326 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u328, dtb_u_u329) -> (match dtb_u_u328 with
  | { f_Module_moduleNameOf = dtb_u_u330; f_Module_modulePackageOf = dtb_u_u331; f_Module_moduleImportsOf = dtb_u_u332; f_Module_moduleImplicitImportsOf = dtb_u_u333; f_Module_moduleDeclsOf = dtb_u_u334; f_Module_moduleExportsOf = dtb_u_u335; f_Module_moduleFixitiesOf = dtb_u_u336; f_Module_moduleReexportsOf = dtb_u_u337; f_Module_moduleOpaqueOf = dtb_u_u338; f_Module_moduleExportIndexOf = dtb_u_u339; f_Module_moduleFixFactsOf = dtb_u_u340 } -> (if (dtb_u_u330 = dtb_u_u327) then (B_dData_dMaybe.C_Maybe_Just ({ f_Module_moduleNameOf = dtb_u_u330; f_Module_modulePackageOf = dtb_u_u331; f_Module_moduleImportsOf = dtb_u_u332; f_Module_moduleImplicitImportsOf = dtb_u_u333; f_Module_moduleDeclsOf = dtb_u_u334; f_Module_moduleExportsOf = dtb_u_u335; f_Module_moduleFixitiesOf = dtb_u_u336; f_Module_moduleReexportsOf = dtb_u_u337; f_Module_moduleOpaqueOf = dtb_u_u338; f_Module_moduleExportIndexOf = dtb_u_u339; f_Module_moduleFixFactsOf = dtb_u_u340 })) else ((v_findModule dtb_u_u329) dtb_u_u327))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDecls = (fun (dtb_u_u341 : t_Module B_dData_dList.t_List) (dtb_u_u342 : string) -> (let dtb_u_u343 = ((v_findModule dtb_u_u341) dtb_u_u342) in (match dtb_u_u343 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule dtb_u_u342)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u344) -> (match dtb_u_u344 with
  | { f_Module_moduleNameOf = dtb_u_u345; f_Module_modulePackageOf = dtb_u_u346; f_Module_moduleImportsOf = dtb_u_u347; f_Module_moduleImplicitImportsOf = dtb_u_u348; f_Module_moduleDeclsOf = dtb_u_u349; f_Module_moduleExportsOf = dtb_u_u350; f_Module_moduleFixitiesOf = dtb_u_u351; f_Module_moduleReexportsOf = dtb_u_u352; f_Module_moduleOpaqueOf = dtb_u_u353; f_Module_moduleExportIndexOf = dtb_u_u354; f_Module_moduleFixFactsOf = dtb_u_u355 } -> (Base_dDiag.C_Check_OkC (dtb_u_u349))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 321 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleCtors = (fun (dtb_u_u356 : t_Module B_dData_dList.t_List) (dtb_u_u357 : string) -> ((Base_dCommon.v_bind ((v_moduleDecls dtb_u_u356) dtb_u_u357)) (fun (dtb_u_u358 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.v_ctorsOf dtb_u_u358))))))

# 734 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorNamed = (fun (dtb_u_u359 : string) (dtb_u_u360 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u360 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u361, dtb_u_u362) -> (if ((Frontend_dAst.v_ctorName dtb_u_u361) = dtb_u_u359) then true else ((v_anyCtorNamed dtb_u_u359) dtb_u_u362))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 723 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_isCtorTargetInDecls = (fun (dtb_u_u363 : string) (dtb_u_u364 : string) (dtb_u_u365 : string) (dtb_u_u366 : string) (dtb_u_u367 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u367 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u368, dtb_u_u369) -> (match dtb_u_u368 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u370, dtb_u_u371, dtb_u_u372, dtb_u_u373, dtb_u_u374, dtb_u_u375, dtb_u_u376, dtb_u_u377, dtb_u_u378) -> (if (if (((v_isMangled dtb_u_u363) dtb_u_u370) dtb_u_u365) then ((v_anyCtorNamed dtb_u_u366) dtb_u_u373) else false) then true else (((((v_isCtorTargetInDecls dtb_u_u363) dtb_u_u364) dtb_u_u365) dtb_u_u366) dtb_u_u369))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u379, dtb_u_u380, dtb_u_u381, dtb_u_u382, dtb_u_u383, dtb_u_u384, dtb_u_u385, dtb_u_u386) -> (if (((v_isMangled dtb_u_u363) dtb_u_u379) dtb_u_u364) then true else (((((v_isCtorTargetInDecls dtb_u_u363) dtb_u_u364) dtb_u_u365) dtb_u_u366) dtb_u_u369))
  | _ -> (((((v_isCtorTargetInDecls dtb_u_u363) dtb_u_u364) dtb_u_u365) dtb_u_u366) dtb_u_u369)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Loader/Modules.vuna"
let v_isCtorCanonical = (fun (dtb_u_u387 : string) (dtb_u_u388 : string) (dtb_u_u389 : string) (dtb_u_u390 : string) -> (let dtb_u_u391 = (String.length dtb_u_u387) in (let dtb_u_u392 = (String.length dtb_u_u388) in (let dtb_u_u393 = (String.length dtb_u_u389) in (let dtb_u_u394 = ((dtb_u_u391 + 1) + dtb_u_u392) in (if (if (if (if (if ((String.length dtb_u_u390) = ((dtb_u_u394 + 1) + dtb_u_u393)) then ((let b = dtb_u_u390 in let k = dtb_u_u391 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) else false) then ((let b = dtb_u_u390 in let k = dtb_u_u394 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 46) else false) then (((((v_sliceEq 0) dtb_u_u387) 0) dtb_u_u390) dtb_u_u391) else false) then (((((v_sliceEq 0) dtb_u_u388) (dtb_u_u391 + 1)) dtb_u_u390) dtb_u_u392) else false) then (((((v_sliceEq 0) dtb_u_u389) (dtb_u_u394 + 1)) dtb_u_u390) dtb_u_u393) else false))))))

# 739 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyCtorTarget = (fun (dtb_u_u395 : string) (dtb_u_u396 : string) (dtb_u_u397 : string) (dtb_u_u398 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u398 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u399, dtb_u_u400) -> (if ((((v_isCtorCanonical dtb_u_u395) dtb_u_u396) (Frontend_dAst.v_ctorName dtb_u_u399)) dtb_u_u397) then true else ((((v_anyCtorTarget dtb_u_u395) dtb_u_u396) dtb_u_u397) dtb_u_u400))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleNameOf = (fun (dtb_u_u401 : t_Module) -> (match dtb_u_u401 with
  | { f_Module_moduleNameOf = dtb_u_u402; f_Module_modulePackageOf = dtb_u_u403; f_Module_moduleImportsOf = dtb_u_u404; f_Module_moduleImplicitImportsOf = dtb_u_u405; f_Module_moduleDeclsOf = dtb_u_u406; f_Module_moduleExportsOf = dtb_u_u407; f_Module_moduleFixitiesOf = dtb_u_u408; f_Module_moduleReexportsOf = dtb_u_u409; f_Module_moduleOpaqueOf = dtb_u_u410; f_Module_moduleExportIndexOf = dtb_u_u411; f_Module_moduleFixFactsOf = dtb_u_u412 } -> dtb_u_u402
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleTblOf = (fun (dtb_u_u413 : t_Module B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u414 : t_Module) -> { B_dData_dPair.f_Pair_first = (v_moduleNameOf dtb_u_u414); B_dData_dPair.f_Pair_second = dtb_u_u414 })) dtb_u_u413)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 659 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_walkNamespaceIndexFuel = (fun (dtb_u_u415 : int) (dtb_u_u416 : t_Module B_dData_dList.t_List) (dtb_u_u417 : string) (dtb_u_u418 : string B_dData_dList.t_List) -> (if (dtb_u_u415 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((v_findModule dtb_u_u416) dtb_u_u417) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u419) -> (if ((B_dData_dList.v_length dtb_u_u418) <= 0) then (B_dData_dMaybe.C_Maybe_Just ((v_moduleNameOf dtb_u_u419))) else (let dtb_u_u420 = (((v_longestIndexPrefix (v_moduleExportIndexOfOf dtb_u_u419)) dtb_u_u418) (B_dData_dList.v_length dtb_u_u418)) in (match dtb_u_u420 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u421) -> (match dtb_u_u421 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u422; B_dData_dPair.f_Pair_second = dtb_u_u423 } -> ((((v_walkNamespaceIndexFuel (dtb_u_u415 - 1)) dtb_u_u416) dtb_u_u422) ((v_dropFirst dtb_u_u423) dtb_u_u418))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 653 "Vuna/Compiler/Loader/Modules.vuna"
let v_walkNamespaceIndex = (fun (dtb_u_u424 : t_Module B_dData_dList.t_List) (dtb_u_u425 : string) (dtb_u_u426 : string B_dData_dList.t_List) -> ((((v_walkNamespaceIndexFuel (1 + (B_dData_dList.v_length dtb_u_u426))) dtb_u_u424) dtb_u_u425) dtb_u_u426))

# 353 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModuleIn = (fun (dtb_u_u427 : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u428 : string B_dData_dList.t_List) (dtb_u_u429 : int) -> (if (dtb_u_u429 < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u430 = (Base_dSource.v_joinDots ((v_takeSegsLocal dtb_u_u429) dtb_u_u428)) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u430) dtb_u_u427) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u431) -> (((v_walkNamespaceIndex ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dContainer_dHashMap.v_toList dtb_u_u427))) dtb_u_u430) ((v_dropFirst dtb_u_u429) dtb_u_u428))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModuleIn dtb_u_u427) dtb_u_u428) (dtb_u_u429 - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 344 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleNameIn = (fun (dtb_u_u432 : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u433 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u433) dtb_u_u432) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u434) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u433))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u435 = (Base_dSource.v_splitOnDot dtb_u_u433) in (((v_resolvePathModuleIn dtb_u_u432) dtb_u_u435) ((B_dData_dList.v_length dtb_u_u435) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_resolvePathModule = (fun (dtb_u_u436 : t_Module B_dData_dList.t_List) (dtb_u_u437 : string B_dData_dList.t_List) (dtb_u_u438 : int) -> (if (dtb_u_u438 < 1) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u439 = (Base_dSource.v_joinDots ((v_takeSegsLocal dtb_u_u438) dtb_u_u437)) in (match ((v_findModule dtb_u_u436) dtb_u_u439) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u440) -> (((v_walkNamespaceIndex dtb_u_u436) dtb_u_u439) ((v_dropFirst dtb_u_u438) dtb_u_u437))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_resolvePathModule dtb_u_u436) dtb_u_u437) (dtb_u_u438 - 1))
  | _ -> failwith "DT: impossible branch"
))))

# 327 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolveModuleName = (fun (dtb_u_u441 : t_Module B_dData_dList.t_List) (dtb_u_u442 : string) -> (match ((v_findModule dtb_u_u441) dtb_u_u442) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u443) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u442))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u444 = (Base_dSource.v_splitOnDot dtb_u_u442) in (((v_resolvePathModule dtb_u_u441) dtb_u_u444) ((B_dData_dList.v_length dtb_u_u444) - 1)))
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedName = (fun (dtb_u_u445 : t_Module B_dData_dList.t_List) (dtb_u_u446 : string) -> (match ((v_resolveModuleName dtb_u_u445) dtb_u_u446) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u447) -> dtb_u_u447
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u446
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportsOf = (fun (dtb_u_u448 : t_Module B_dData_dList.t_List) (dtb_u_u449 : string) -> (let dtb_u_u450 = ((v_findModule dtb_u_u448) ((v_resolvedName dtb_u_u448) dtb_u_u449)) in (match dtb_u_u450 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule dtb_u_u449)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u451) -> (match dtb_u_u451 with
  | { f_Module_moduleNameOf = dtb_u_u452; f_Module_modulePackageOf = dtb_u_u453; f_Module_moduleImportsOf = dtb_u_u454; f_Module_moduleImplicitImportsOf = dtb_u_u455; f_Module_moduleDeclsOf = dtb_u_u456; f_Module_moduleExportsOf = dtb_u_u457; f_Module_moduleFixitiesOf = dtb_u_u458; f_Module_moduleReexportsOf = dtb_u_u459; f_Module_moduleOpaqueOf = dtb_u_u460; f_Module_moduleExportIndexOf = dtb_u_u461; f_Module_moduleFixFactsOf = dtb_u_u462 } -> (Base_dDiag.C_Check_OkC (dtb_u_u457))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 390 "Vuna/Compiler/Loader/Modules.vuna"
let[@tail_mod_cons] rec v_normalizeImports = (fun (dtb_u_u463 : t_Module B_dData_dList.t_List) (dtb_u_u464 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match dtb_u_u464 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u465, dtb_u_u466) -> (match dtb_u_u465 with
  | { Frontend_dAst.f_Import_importName = dtb_u_u467; Frontend_dAst.f_Import_importIsQualified = dtb_u_u468; Frontend_dAst.f_Import_importAlias = dtb_u_u469; Frontend_dAst.f_Import_importRef = dtb_u_u470 } -> (match ((v_resolveModuleName dtb_u_u463) dtb_u_u467) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb_u_u467; Frontend_dAst.f_Import_importIsQualified = dtb_u_u468; Frontend_dAst.f_Import_importAlias = dtb_u_u469; Frontend_dAst.f_Import_importRef = dtb_u_u470 }, ((v_normalizeImports dtb_u_u463) dtb_u_u466)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u471) -> (if (dtb_u_u471 = dtb_u_u467) then (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb_u_u467; Frontend_dAst.f_Import_importIsQualified = dtb_u_u468; Frontend_dAst.f_Import_importAlias = dtb_u_u469; Frontend_dAst.f_Import_importRef = dtb_u_u470 }, ((v_normalizeImports dtb_u_u463) dtb_u_u466))) else (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb_u_u471; Frontend_dAst.f_Import_importIsQualified = dtb_u_u468; Frontend_dAst.f_Import_importAlias = dtb_u_u469; Frontend_dAst.f_Import_importRef = dtb_u_u470 }, ((v_normalizeImports dtb_u_u463) dtb_u_u466))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModule = (fun (dtb_u_u472 : t_Module B_dData_dList.t_List) (dtb_u_u473 : string) -> (match ((v_findModule dtb_u_u472) ((v_resolvedName dtb_u_u472) dtb_u_u473)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u474) -> (Base_dDiag.C_Check_OkC ((dtb_u_u474).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule dtb_u_u473)
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Loader/Modules.vuna"
let v_resolvedNameIn = (fun (dtb_u_u475 : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u476 : string) -> (match ((v_resolveModuleNameIn dtb_u_u475) dtb_u_u476) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u477) -> dtb_u_u477
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u476
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Loader/Modules.vuna"
let v_exportIndexOfModuleIn = (fun (dtb_u_u478 : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u479 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((v_resolvedNameIn dtb_u_u478) dtb_u_u479)) dtb_u_u478) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u480) -> (Base_dDiag.C_Check_OkC ((dtb_u_u480).f_Module_moduleExportIndexOf))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_missingModule dtb_u_u479)
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValue = (fun (dtb_u_u481 : t_Module B_dData_dList.t_List) (dtb_u_u482 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u483 : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModule dtb_u_u481)) (v_openModuleNames dtb_u_u482)) dtb_u_u483))

# 524 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingValueIn = (fun (dtb_u_u484 : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u485 : string B_dData_dList.t_List) (dtb_u_u486 : string) -> (((v_modulesExportingValueFrom (v_exportIndexOfModuleIn dtb_u_u484)) dtb_u_u485) dtb_u_u486))

# 539 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtor = (fun (dtb_u_u487 : t_Module B_dData_dList.t_List) (dtb_u_u488 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u489 : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModule dtb_u_u487)) (v_openModuleNames dtb_u_u488)) dtb_u_u489))

# 544 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingCtorIn = (fun (dtb_u_u490 : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u491 : string B_dData_dList.t_List) (dtb_u_u492 : string) -> (((v_modulesExportingCtorFrom (v_exportIndexOfModuleIn dtb_u_u490)) dtb_u_u491) dtb_u_u492))

# 559 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingTypeIn = (fun (dtb_u_u493 : (string, t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u494 : string B_dData_dList.t_List) (dtb_u_u495 : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModuleIn dtb_u_u493)) dtb_u_u494) dtb_u_u495))

# 563 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulesExportingType = (fun (dtb_u_u496 : t_Module B_dData_dList.t_List) (dtb_u_u497 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u498 : string) -> (((v_modulesExportingTypeFrom (v_exportIndexOfModule dtb_u_u496)) (v_openModuleNames dtb_u_u497)) dtb_u_u498))

# 27 "Vuna/Compiler/Loader/Modules.vuna"
let v_modulePackageOf = (fun (dtb_u_u499 : t_Module) -> (match dtb_u_u499 with
  | { f_Module_moduleNameOf = dtb_u_u500; f_Module_modulePackageOf = dtb_u_u501; f_Module_moduleImportsOf = dtb_u_u502; f_Module_moduleImplicitImportsOf = dtb_u_u503; f_Module_moduleDeclsOf = dtb_u_u504; f_Module_moduleExportsOf = dtb_u_u505; f_Module_moduleFixitiesOf = dtb_u_u506; f_Module_moduleReexportsOf = dtb_u_u507; f_Module_moduleOpaqueOf = dtb_u_u508; f_Module_moduleExportIndexOf = dtb_u_u509; f_Module_moduleFixFactsOf = dtb_u_u510 } -> dtb_u_u501
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleVisibleTo = (fun (dtb_u_u511 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u512 : string) (dtb_u_u513 : t_Module) -> (match ((v_rootOfName (v_modulePackageOf dtb_u_u513)) dtb_u_u511) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u514) -> (((v_rootAllows dtb_u_u512) dtb_u_u514) (v_moduleNameOf dtb_u_u513))
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleImportsOf = (fun (dtb_u_u515 : t_Module) -> (match dtb_u_u515 with
  | { f_Module_moduleNameOf = dtb_u_u516; f_Module_modulePackageOf = dtb_u_u517; f_Module_moduleImportsOf = dtb_u_u518; f_Module_moduleImplicitImportsOf = dtb_u_u519; f_Module_moduleDeclsOf = dtb_u_u520; f_Module_moduleExportsOf = dtb_u_u521; f_Module_moduleFixitiesOf = dtb_u_u522; f_Module_moduleReexportsOf = dtb_u_u523; f_Module_moduleOpaqueOf = dtb_u_u524; f_Module_moduleExportIndexOf = dtb_u_u525; f_Module_moduleFixFactsOf = dtb_u_u526 } -> dtb_u_u518
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleImplicitImportsOf = (fun (dtb_u_u527 : t_Module) -> (match dtb_u_u527 with
  | { f_Module_moduleNameOf = dtb_u_u528; f_Module_modulePackageOf = dtb_u_u529; f_Module_moduleImportsOf = dtb_u_u530; f_Module_moduleImplicitImportsOf = dtb_u_u531; f_Module_moduleDeclsOf = dtb_u_u532; f_Module_moduleExportsOf = dtb_u_u533; f_Module_moduleFixitiesOf = dtb_u_u534; f_Module_moduleReexportsOf = dtb_u_u535; f_Module_moduleOpaqueOf = dtb_u_u536; f_Module_moduleExportIndexOf = dtb_u_u537; f_Module_moduleFixFactsOf = dtb_u_u538 } -> dtb_u_u531
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleDeclsOf = (fun (dtb_u_u539 : t_Module) -> (match dtb_u_u539 with
  | { f_Module_moduleNameOf = dtb_u_u540; f_Module_modulePackageOf = dtb_u_u541; f_Module_moduleImportsOf = dtb_u_u542; f_Module_moduleImplicitImportsOf = dtb_u_u543; f_Module_moduleDeclsOf = dtb_u_u544; f_Module_moduleExportsOf = dtb_u_u545; f_Module_moduleFixitiesOf = dtb_u_u546; f_Module_moduleReexportsOf = dtb_u_u547; f_Module_moduleOpaqueOf = dtb_u_u548; f_Module_moduleExportIndexOf = dtb_u_u549; f_Module_moduleFixFactsOf = dtb_u_u550 } -> dtb_u_u544
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_anyModuleCtorTarget = (fun (dtb_u_u551 : t_Module B_dData_dList.t_List) (dtb_u_u552 : string) (dtb_u_u553 : string) (dtb_u_u554 : string) -> (match dtb_u_u551 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u555, dtb_u_u556) -> (let dtb_u_u557 = (v_moduleNameOf dtb_u_u555) in (if (B_dData_dBool.v_not ((B_dData_dString.v_startsWith dtb_u_u557) dtb_u_u552)) then ((((v_anyModuleCtorTarget dtb_u_u556) dtb_u_u552) dtb_u_u553) dtb_u_u554) else (if (((((v_isCtorTargetInDecls dtb_u_u557) dtb_u_u552) dtb_u_u553) dtb_u_u554) (v_moduleDeclsOf dtb_u_u555)) then true else ((((v_anyModuleCtorTarget dtb_u_u556) dtb_u_u552) dtb_u_u553) dtb_u_u554))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Loader/Modules.vuna"
let v_isDataOrRecordCtorTarget = (fun (dtb_u_u558 : t_Module B_dData_dList.t_List) (dtb_u_u559 : string) -> (let dtb_u_u560 = (Base_dSource.v_lastSeg dtb_u_u559) in (let dtb_u_u561 = (Base_dSource.v_prefixOfName dtb_u_u559) in (if (dtb_u_u561 = "") then false else ((((v_anyModuleCtorTarget dtb_u_u558) dtb_u_u559) dtb_u_u561) dtb_u_u560)))))

# 31 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportsOf = (fun (dtb_u_u562 : t_Module) -> (match dtb_u_u562 with
  | { f_Module_moduleNameOf = dtb_u_u563; f_Module_modulePackageOf = dtb_u_u564; f_Module_moduleImportsOf = dtb_u_u565; f_Module_moduleImplicitImportsOf = dtb_u_u566; f_Module_moduleDeclsOf = dtb_u_u567; f_Module_moduleExportsOf = dtb_u_u568; f_Module_moduleFixitiesOf = dtb_u_u569; f_Module_moduleReexportsOf = dtb_u_u570; f_Module_moduleOpaqueOf = dtb_u_u571; f_Module_moduleExportIndexOf = dtb_u_u572; f_Module_moduleFixFactsOf = dtb_u_u573 } -> dtb_u_u568
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleFixitiesOf = (fun (dtb_u_u574 : t_Module) -> (match dtb_u_u574 with
  | { f_Module_moduleNameOf = dtb_u_u575; f_Module_modulePackageOf = dtb_u_u576; f_Module_moduleImportsOf = dtb_u_u577; f_Module_moduleImplicitImportsOf = dtb_u_u578; f_Module_moduleDeclsOf = dtb_u_u579; f_Module_moduleExportsOf = dtb_u_u580; f_Module_moduleFixitiesOf = dtb_u_u581; f_Module_moduleReexportsOf = dtb_u_u582; f_Module_moduleOpaqueOf = dtb_u_u583; f_Module_moduleExportIndexOf = dtb_u_u584; f_Module_moduleFixFactsOf = dtb_u_u585 } -> dtb_u_u581
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleReexportsOf = (fun (dtb_u_u586 : t_Module) -> (match dtb_u_u586 with
  | { f_Module_moduleNameOf = dtb_u_u587; f_Module_modulePackageOf = dtb_u_u588; f_Module_moduleImportsOf = dtb_u_u589; f_Module_moduleImplicitImportsOf = dtb_u_u590; f_Module_moduleDeclsOf = dtb_u_u591; f_Module_moduleExportsOf = dtb_u_u592; f_Module_moduleFixitiesOf = dtb_u_u593; f_Module_moduleReexportsOf = dtb_u_u594; f_Module_moduleOpaqueOf = dtb_u_u595; f_Module_moduleExportIndexOf = dtb_u_u596; f_Module_moduleFixFactsOf = dtb_u_u597 } -> dtb_u_u594
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleOpaqueOf = (fun (dtb_u_u598 : t_Module) -> (match dtb_u_u598 with
  | { f_Module_moduleNameOf = dtb_u_u599; f_Module_modulePackageOf = dtb_u_u600; f_Module_moduleImportsOf = dtb_u_u601; f_Module_moduleImplicitImportsOf = dtb_u_u602; f_Module_moduleDeclsOf = dtb_u_u603; f_Module_moduleExportsOf = dtb_u_u604; f_Module_moduleFixitiesOf = dtb_u_u605; f_Module_moduleReexportsOf = dtb_u_u606; f_Module_moduleOpaqueOf = dtb_u_u607; f_Module_moduleExportIndexOf = dtb_u_u608; f_Module_moduleFixFactsOf = dtb_u_u609 } -> dtb_u_u607
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleExportIndexOf = (fun (dtb_u_u610 : t_Module) -> (match dtb_u_u610 with
  | { f_Module_moduleNameOf = dtb_u_u611; f_Module_modulePackageOf = dtb_u_u612; f_Module_moduleImportsOf = dtb_u_u613; f_Module_moduleImplicitImportsOf = dtb_u_u614; f_Module_moduleDeclsOf = dtb_u_u615; f_Module_moduleExportsOf = dtb_u_u616; f_Module_moduleFixitiesOf = dtb_u_u617; f_Module_moduleReexportsOf = dtb_u_u618; f_Module_moduleOpaqueOf = dtb_u_u619; f_Module_moduleExportIndexOf = dtb_u_u620; f_Module_moduleFixFactsOf = dtb_u_u621 } -> dtb_u_u620
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Loader/Modules.vuna"
let v_moduleFixFactsOf = (fun (dtb_u_u622 : t_Module) -> (match dtb_u_u622 with
  | { f_Module_moduleNameOf = dtb_u_u623; f_Module_modulePackageOf = dtb_u_u624; f_Module_moduleImportsOf = dtb_u_u625; f_Module_moduleImplicitImportsOf = dtb_u_u626; f_Module_moduleDeclsOf = dtb_u_u627; f_Module_moduleExportsOf = dtb_u_u628; f_Module_moduleFixitiesOf = dtb_u_u629; f_Module_moduleReexportsOf = dtb_u_u630; f_Module_moduleOpaqueOf = dtb_u_u631; f_Module_moduleExportIndexOf = dtb_u_u632; f_Module_moduleFixFactsOf = dtb_u_u633 } -> dtb_u_u633
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryDecls = (fun (dtb_u_u634 : t_Project) -> (match dtb_u_u634 with
  | { f_Project_projectEntryDecls = dtb_u_u635; f_Project_projectEntryImports = dtb_u_u636; f_Project_projectImplicitImports = dtb_u_u637; f_Project_projectModules = dtb_u_u638; f_Project_projectEntryPkg = dtb_u_u639; f_Project_projectEntryFixities = dtb_u_u640; f_Project_projectEntryName = dtb_u_u641; f_Project_projectEntryFacts = dtb_u_u642 } -> dtb_u_u635
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryImports = (fun (dtb_u_u643 : t_Project) -> (match dtb_u_u643 with
  | { f_Project_projectEntryDecls = dtb_u_u644; f_Project_projectEntryImports = dtb_u_u645; f_Project_projectImplicitImports = dtb_u_u646; f_Project_projectModules = dtb_u_u647; f_Project_projectEntryPkg = dtb_u_u648; f_Project_projectEntryFixities = dtb_u_u649; f_Project_projectEntryName = dtb_u_u650; f_Project_projectEntryFacts = dtb_u_u651 } -> dtb_u_u645
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectImplicitImports = (fun (dtb_u_u652 : t_Project) -> (match dtb_u_u652 with
  | { f_Project_projectEntryDecls = dtb_u_u653; f_Project_projectEntryImports = dtb_u_u654; f_Project_projectImplicitImports = dtb_u_u655; f_Project_projectModules = dtb_u_u656; f_Project_projectEntryPkg = dtb_u_u657; f_Project_projectEntryFixities = dtb_u_u658; f_Project_projectEntryName = dtb_u_u659; f_Project_projectEntryFacts = dtb_u_u660 } -> dtb_u_u655
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectModules = (fun (dtb_u_u661 : t_Project) -> (match dtb_u_u661 with
  | { f_Project_projectEntryDecls = dtb_u_u662; f_Project_projectEntryImports = dtb_u_u663; f_Project_projectImplicitImports = dtb_u_u664; f_Project_projectModules = dtb_u_u665; f_Project_projectEntryPkg = dtb_u_u666; f_Project_projectEntryFixities = dtb_u_u667; f_Project_projectEntryName = dtb_u_u668; f_Project_projectEntryFacts = dtb_u_u669 } -> dtb_u_u665
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryPkg = (fun (dtb_u_u670 : t_Project) -> (match dtb_u_u670 with
  | { f_Project_projectEntryDecls = dtb_u_u671; f_Project_projectEntryImports = dtb_u_u672; f_Project_projectImplicitImports = dtb_u_u673; f_Project_projectModules = dtb_u_u674; f_Project_projectEntryPkg = dtb_u_u675; f_Project_projectEntryFixities = dtb_u_u676; f_Project_projectEntryName = dtb_u_u677; f_Project_projectEntryFacts = dtb_u_u678 } -> dtb_u_u675
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryFixities = (fun (dtb_u_u679 : t_Project) -> (match dtb_u_u679 with
  | { f_Project_projectEntryDecls = dtb_u_u680; f_Project_projectEntryImports = dtb_u_u681; f_Project_projectImplicitImports = dtb_u_u682; f_Project_projectModules = dtb_u_u683; f_Project_projectEntryPkg = dtb_u_u684; f_Project_projectEntryFixities = dtb_u_u685; f_Project_projectEntryName = dtb_u_u686; f_Project_projectEntryFacts = dtb_u_u687 } -> dtb_u_u685
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryName = (fun (dtb_u_u688 : t_Project) -> (match dtb_u_u688 with
  | { f_Project_projectEntryDecls = dtb_u_u689; f_Project_projectEntryImports = dtb_u_u690; f_Project_projectImplicitImports = dtb_u_u691; f_Project_projectModules = dtb_u_u692; f_Project_projectEntryPkg = dtb_u_u693; f_Project_projectEntryFixities = dtb_u_u694; f_Project_projectEntryName = dtb_u_u695; f_Project_projectEntryFacts = dtb_u_u696 } -> dtb_u_u695
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Loader/Modules.vuna"
let v_projectEntryFacts = (fun (dtb_u_u697 : t_Project) -> (match dtb_u_u697 with
  | { f_Project_projectEntryDecls = dtb_u_u698; f_Project_projectEntryImports = dtb_u_u699; f_Project_projectImplicitImports = dtb_u_u700; f_Project_projectModules = dtb_u_u701; f_Project_projectEntryPkg = dtb_u_u702; f_Project_projectEntryFixities = dtb_u_u703; f_Project_projectEntryName = dtb_u_u704; f_Project_projectEntryFacts = dtb_u_u705 } -> dtb_u_u705
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsValues = (fun (dtb_u_u706 : t_Namespaces) -> (match dtb_u_u706 with
  | { f_Namespaces_nsValues = dtb_u_u707; f_Namespaces_nsCtors = dtb_u_u708; f_Namespaces_nsTypes = dtb_u_u709; f_Namespaces_nsValueSet = dtb_u_u710; f_Namespaces_nsCtorSet = dtb_u_u711; f_Namespaces_nsTypeSet = dtb_u_u712; f_Namespaces_nsCtorCands = dtb_u_u713; f_Namespaces_nsModuleTbl = dtb_u_u714; f_Namespaces_nsOpenNames = dtb_u_u715; f_Namespaces_nsRelease = dtb_u_u716 } -> dtb_u_u707
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtors = (fun (dtb_u_u717 : t_Namespaces) -> (match dtb_u_u717 with
  | { f_Namespaces_nsValues = dtb_u_u718; f_Namespaces_nsCtors = dtb_u_u719; f_Namespaces_nsTypes = dtb_u_u720; f_Namespaces_nsValueSet = dtb_u_u721; f_Namespaces_nsCtorSet = dtb_u_u722; f_Namespaces_nsTypeSet = dtb_u_u723; f_Namespaces_nsCtorCands = dtb_u_u724; f_Namespaces_nsModuleTbl = dtb_u_u725; f_Namespaces_nsOpenNames = dtb_u_u726; f_Namespaces_nsRelease = dtb_u_u727 } -> dtb_u_u719
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsTypes = (fun (dtb_u_u728 : t_Namespaces) -> (match dtb_u_u728 with
  | { f_Namespaces_nsValues = dtb_u_u729; f_Namespaces_nsCtors = dtb_u_u730; f_Namespaces_nsTypes = dtb_u_u731; f_Namespaces_nsValueSet = dtb_u_u732; f_Namespaces_nsCtorSet = dtb_u_u733; f_Namespaces_nsTypeSet = dtb_u_u734; f_Namespaces_nsCtorCands = dtb_u_u735; f_Namespaces_nsModuleTbl = dtb_u_u736; f_Namespaces_nsOpenNames = dtb_u_u737; f_Namespaces_nsRelease = dtb_u_u738 } -> dtb_u_u731
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsValueSet = (fun (dtb_u_u739 : t_Namespaces) -> (match dtb_u_u739 with
  | { f_Namespaces_nsValues = dtb_u_u740; f_Namespaces_nsCtors = dtb_u_u741; f_Namespaces_nsTypes = dtb_u_u742; f_Namespaces_nsValueSet = dtb_u_u743; f_Namespaces_nsCtorSet = dtb_u_u744; f_Namespaces_nsTypeSet = dtb_u_u745; f_Namespaces_nsCtorCands = dtb_u_u746; f_Namespaces_nsModuleTbl = dtb_u_u747; f_Namespaces_nsOpenNames = dtb_u_u748; f_Namespaces_nsRelease = dtb_u_u749 } -> dtb_u_u743
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtorSet = (fun (dtb_u_u750 : t_Namespaces) -> (match dtb_u_u750 with
  | { f_Namespaces_nsValues = dtb_u_u751; f_Namespaces_nsCtors = dtb_u_u752; f_Namespaces_nsTypes = dtb_u_u753; f_Namespaces_nsValueSet = dtb_u_u754; f_Namespaces_nsCtorSet = dtb_u_u755; f_Namespaces_nsTypeSet = dtb_u_u756; f_Namespaces_nsCtorCands = dtb_u_u757; f_Namespaces_nsModuleTbl = dtb_u_u758; f_Namespaces_nsOpenNames = dtb_u_u759; f_Namespaces_nsRelease = dtb_u_u760 } -> dtb_u_u755
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsTypeSet = (fun (dtb_u_u761 : t_Namespaces) -> (match dtb_u_u761 with
  | { f_Namespaces_nsValues = dtb_u_u762; f_Namespaces_nsCtors = dtb_u_u763; f_Namespaces_nsTypes = dtb_u_u764; f_Namespaces_nsValueSet = dtb_u_u765; f_Namespaces_nsCtorSet = dtb_u_u766; f_Namespaces_nsTypeSet = dtb_u_u767; f_Namespaces_nsCtorCands = dtb_u_u768; f_Namespaces_nsModuleTbl = dtb_u_u769; f_Namespaces_nsOpenNames = dtb_u_u770; f_Namespaces_nsRelease = dtb_u_u771 } -> dtb_u_u767
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsCtorCands = (fun (dtb_u_u772 : t_Namespaces) -> (match dtb_u_u772 with
  | { f_Namespaces_nsValues = dtb_u_u773; f_Namespaces_nsCtors = dtb_u_u774; f_Namespaces_nsTypes = dtb_u_u775; f_Namespaces_nsValueSet = dtb_u_u776; f_Namespaces_nsCtorSet = dtb_u_u777; f_Namespaces_nsTypeSet = dtb_u_u778; f_Namespaces_nsCtorCands = dtb_u_u779; f_Namespaces_nsModuleTbl = dtb_u_u780; f_Namespaces_nsOpenNames = dtb_u_u781; f_Namespaces_nsRelease = dtb_u_u782 } -> dtb_u_u779
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsModuleTbl = (fun (dtb_u_u783 : t_Namespaces) -> (match dtb_u_u783 with
  | { f_Namespaces_nsValues = dtb_u_u784; f_Namespaces_nsCtors = dtb_u_u785; f_Namespaces_nsTypes = dtb_u_u786; f_Namespaces_nsValueSet = dtb_u_u787; f_Namespaces_nsCtorSet = dtb_u_u788; f_Namespaces_nsTypeSet = dtb_u_u789; f_Namespaces_nsCtorCands = dtb_u_u790; f_Namespaces_nsModuleTbl = dtb_u_u791; f_Namespaces_nsOpenNames = dtb_u_u792; f_Namespaces_nsRelease = dtb_u_u793 } -> dtb_u_u791
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsOpenNames = (fun (dtb_u_u794 : t_Namespaces) -> (match dtb_u_u794 with
  | { f_Namespaces_nsValues = dtb_u_u795; f_Namespaces_nsCtors = dtb_u_u796; f_Namespaces_nsTypes = dtb_u_u797; f_Namespaces_nsValueSet = dtb_u_u798; f_Namespaces_nsCtorSet = dtb_u_u799; f_Namespaces_nsTypeSet = dtb_u_u800; f_Namespaces_nsCtorCands = dtb_u_u801; f_Namespaces_nsModuleTbl = dtb_u_u802; f_Namespaces_nsOpenNames = dtb_u_u803; f_Namespaces_nsRelease = dtb_u_u804 } -> dtb_u_u803
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Loader/Modules.vuna"
let v_nsRelease = (fun (dtb_u_u805 : t_Namespaces) -> (match dtb_u_u805 with
  | { f_Namespaces_nsValues = dtb_u_u806; f_Namespaces_nsCtors = dtb_u_u807; f_Namespaces_nsTypes = dtb_u_u808; f_Namespaces_nsValueSet = dtb_u_u809; f_Namespaces_nsCtorSet = dtb_u_u810; f_Namespaces_nsTypeSet = dtb_u_u811; f_Namespaces_nsCtorCands = dtb_u_u812; f_Namespaces_nsModuleTbl = dtb_u_u813; f_Namespaces_nsOpenNames = dtb_u_u814; f_Namespaces_nsRelease = dtb_u_u815 } -> dtb_u_u815
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Loader/Modules.vuna"
let v_kind = (fun (dtb_u_u816 : t_ExportEntry) -> (match dtb_u_u816 with
  | { f_ExportEntry_kind = dtb_u_u817; f_ExportEntry_public = dtb_u_u818; f_ExportEntry_target = dtb_u_u819; f_ExportEntry_parent = dtb_u_u820 } -> dtb_u_u817
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Loader/Modules.vuna"
let v_public = (fun (dtb_u_u821 : t_ExportEntry) -> (match dtb_u_u821 with
  | { f_ExportEntry_kind = dtb_u_u822; f_ExportEntry_public = dtb_u_u823; f_ExportEntry_target = dtb_u_u824; f_ExportEntry_parent = dtb_u_u825 } -> dtb_u_u823
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Loader/Modules.vuna"
let v_target = (fun (dtb_u_u826 : t_ExportEntry) -> (match dtb_u_u826 with
  | { f_ExportEntry_kind = dtb_u_u827; f_ExportEntry_public = dtb_u_u828; f_ExportEntry_target = dtb_u_u829; f_ExportEntry_parent = dtb_u_u830 } -> dtb_u_u829
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Loader/Modules.vuna"
let v_parent = (fun (dtb_u_u831 : t_ExportEntry) -> (match dtb_u_u831 with
  | { f_ExportEntry_kind = dtb_u_u832; f_ExportEntry_public = dtb_u_u833; f_ExportEntry_target = dtb_u_u834; f_ExportEntry_parent = dtb_u_u835 } -> dtb_u_u835
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Loader/Modules.vuna"
let v_refKind = (fun (dtb_u_u836 : t_ExportRef) -> (match dtb_u_u836 with
  | { f_ExportRef_refKind = dtb_u_u837; f_ExportRef_refTarget = dtb_u_u838; f_ExportRef_refParent = dtb_u_u839 } -> dtb_u_u837
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Loader/Modules.vuna"
let v_refTarget = (fun (dtb_u_u840 : t_ExportRef) -> (match dtb_u_u840 with
  | { f_ExportRef_refKind = dtb_u_u841; f_ExportRef_refTarget = dtb_u_u842; f_ExportRef_refParent = dtb_u_u843 } -> dtb_u_u842
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Loader/Modules.vuna"
let v_refParent = (fun (dtb_u_u844 : t_ExportRef) -> (match dtb_u_u844 with
  | { f_ExportRef_refKind = dtb_u_u845; f_ExportRef_refTarget = dtb_u_u846; f_ExportRef_refParent = dtb_u_u847 } -> dtb_u_u847
  | _ -> failwith "DT: impossible branch"
))
