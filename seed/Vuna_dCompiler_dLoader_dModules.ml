open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dModules_dModule = { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf : t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf : (string, t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap }
and t_Vuna_dCompiler_dLoader_dModules_dProject = { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules : t_Vuna_dCompiler_dLoader_dModules_dModule Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg : string; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dLoader_dModules_dNamespaces = { f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease : bool }
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent : string }
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = { f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent : string }

# 103 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry = (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun sx sy -> (match sx with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__0; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__1; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__2; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__3 } -> (match sy with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__4; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__5; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__6; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> (0 = 1)
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry) sx) sy) then (0 = 1) else (1 = 1)))))

# 54 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__8; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__9; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__10; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__11; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__12; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__13; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__14; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__15; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__16; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__17 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__18; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__19; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__20; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__21; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__22; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__23; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__24; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__25; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__26; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__27 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__28; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__29; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__30; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__31; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__32; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__33; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__34; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__35; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__36; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__37 } -> ((Base_dData_dList.v_Base_dData_dList_dappend dtb__30) dtb__31)
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__38; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__39; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__40; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__41; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__42; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__43; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__44; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__45; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__46; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__47 } -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__48; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__49; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__50; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__51; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__52; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__53; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__54; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__55; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__56; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__57 } -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleReexportsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__58; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__59; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__60; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__61; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__62; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__63; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__64; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__65; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__66; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__67 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleOpaqueOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__68; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__69; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__70; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__71; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__72; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__73; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__74; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__75; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__76; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__77 } -> dtb__76
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__78; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__79; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__80; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__81; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__82; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__83 } -> ((Base_dData_dList.v_Base_dData_dList_dappend dtb__79) dtb__80)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__84, dtb__85) -> (if (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__84) then true else (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__84)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__85) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (Base_dData_dList.dtp_unpack seg) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__86) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__87) else false)
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__88) then (match dtb__89 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__89)
) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | dtb__90 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__90)
))

# 137 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix name -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

# 142 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dctorCanonical = (fun prefix dname cname -> ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (String.concat "" [dname; "."; cname])))

# 145 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__91; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__92; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__93; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__94 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

# 152 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dwithImportSite = (fun sp d -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp) = "") then d else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp) d)))

# 166 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_daliasIs = (fun q imp -> (match (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__95) -> (dtb__95 = q)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dlastSegment = (fun name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__96; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__97 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dnotEmptyList = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__98, dtb__99) -> true
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dqualifierCandidates = (fun imports q -> ((fun strong -> (if (v_Vuna_dCompiler_dLoader_dModules_dnotEmptyList strong) then strong else (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun imp -> ((v_Vuna_dCompiler_dLoader_dModules_dlastSegment (v_Vuna_dCompiler_dLoader_dModules_dimportName imp)) = q))) imports))))) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun imp -> ((v_Vuna_dCompiler_dLoader_dModules_dimportName imp) = q))) imports))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun imp -> ((v_Vuna_dCompiler_dLoader_dModules_daliasIs q) imp))) imports))))))

# 184 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliasSyntax = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__100, dtb__101) -> (match (dtb__100).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliasSyntax dtb__101)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__102) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__102) then (v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliasSyntax dtb__101) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite (dtb__100).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidModuleAlias (dtb__102))) dtb__102)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label imports -> (v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliasSyntax imports))

# 192 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__103, dtb__104) -> (if (dtb__103).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__104) else (Base_dData_dList.v_Base_dData_dList_dnubNames (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__103), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__104)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__105) = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__105))) else (match (dtb__105).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__107) -> (if (dtb__107 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__105))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__106) mc1))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__106) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__108, dtb__109) -> (match dtb__108 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__110, dtb__111, dtb__112) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule mc0) dtb__110) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__109) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__113) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__113) mc2) then (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__109) mc2) else (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__109) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__114, dtb__115) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule mc0) dtb__114) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__109) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__116) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__116) mc2) then (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__109) mc2) else (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__109) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__109) mc2)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames = (fun imports items -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo imports) items) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 226 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117) -> (match dtb__117 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__118; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__119; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__120; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__121; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__122; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__123; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__124 } -> (if dtb__119 then ((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames mc0) dtb__120) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 231 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> (match dtb__126 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__125
  | _ -> (String.concat "" [dtb__125; ", "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__126)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

# 299 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dentriesByName = (fun name idx -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) idx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__127) -> dtb__127
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, dtb__129) -> ((fun tail -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) (dtb__128).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName (dtb__128).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) tail)))) tail)) ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfGo dtb__129) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dexportIndexOf = (fun entries -> ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfGo entries) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 310 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (if (if ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__130).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) mc0) then ((dtb__130).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc1) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__130)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport mc0) mc1) dtb__131))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("val", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("ctor", Base_dData_dList.C_Base_dData_dList_dList_Nil))))) name) entries))

# 328 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfilterKinds = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (if (if ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__132).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) mc0) then ((dtb__132).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc1) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, (((v_Vuna_dCompiler_dLoader_dModules_dfilterKinds mc0) mc1) dtb__133))) else (((v_Vuna_dCompiler_dLoader_dModules_dfilterKinds mc0) mc1) dtb__133))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportValues = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dfilterKinds (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("val", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("ctor", Base_dData_dList.C_Base_dData_dList_dList_Nil))))) name) entries))

# 322 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportTypes = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dfilterKinds (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("type", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) entries))

# 325 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportModules = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dfilterKinds (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("module", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) entries))

# 334 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("ctor", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) entries))

# 342 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfilterCtors = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (if (if ((dtb__134).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__134).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__134, ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__135))) else ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__135))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors = (fun entries name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) entries))

# 348 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("type", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) entries))

# 352 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportModule = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("module", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) entries))

# 355 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportModuleIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("module", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 358 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportValueIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("val", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("ctor", Base_dData_dList.C_Base_dData_dList_dList_Nil))))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 361 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportValuesIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dfilterKinds (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("val", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("ctor", Base_dData_dList.C_Base_dData_dList_dList_Nil))))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 364 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportTypesIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dfilterKinds (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("type", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 367 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("ctor", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 370 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorsIn = (fun idx name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 373 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportTypeIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("type", Base_dData_dList.C_Base_dData_dList_dList_Nil))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 416 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__136, dtb__137) -> (match dtb__136 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__138; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__139 } -> (if ((mc0).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__139).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest mc0) dtb__137) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__141) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__140)) dtb__141) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__140)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__141)))); "); qualify it"])))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root name -> (String.concat "" [(Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir root); "/"; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinSlashes (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)); ".vuna"]))

# 431 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg root name -> (match (root).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__142) -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root) = importerPkg) then true else ((Base_dData_dList.v_Base_dData_dList_dmemName name) dtb__142))
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun nFs mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__143, dtb__144) -> ((fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows mc2) dtb__143) mc1) then ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) dtb__144) mc1) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = path; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__143 }, mc3))) mc4) else ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) dtb__144) mc1) mc2) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName dtb__143), mc4)))) else ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) dtb__144) mc1) mc2) mc3) mc4))))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__143) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc3); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir) roots)))

# 455 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir (Base_dData_dPair.v_Base_dData_dPair_dsecondOf candidate)))

# 459 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan = (fun sp d -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp) = "") then d else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp) d)))

# 462 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun nFs roots name importerPkg importerSpan -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) roots) name) importerPkg) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun collected -> ((fun allowed -> ((fun hidden -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (match dtb__146 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__145))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed))))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed))))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match hidden with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr2 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))
  | dtb__147 -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr2 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden)))
)
  | _ -> failwith "DT: impossible branch"
)) allowed))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf collected))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf collected)))))

# 487 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleExportIndexOfOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__148; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__149; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__150; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__151; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__152; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__153; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__154; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__155; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__156; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__157 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dtakeSegsLocal = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, ((v_Vuna_dCompiler_dLoader_dModules_dtakeSegsLocal (mc0 - 1)) dtb__159))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dlongestIndexPrefix = (fun idx segs k -> (if (k <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportModuleIn idx) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dModules_dtakeSegsLocal k) segs))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__160) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__160).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Base_dData_dPair.f_Base_dData_dPair_dPair_second = k }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dlongestIndexPrefix idx) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 509 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_ddropFirst = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__161, dtb__162) -> (if (mc0 <= 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__161, dtb__162)) else ((v_Vuna_dCompiler_dLoader_dModules_ddropFirst (mc0 - 1)) dtb__162))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__165; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__166; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__167; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__168; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__169; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__170; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__171; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__172; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__173; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__174 } -> (if (dtb__165 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__165; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__166; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__167; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__168; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__169; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__170; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__171; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__172; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__173; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__174 })) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__164) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__175) -> (match dtb__175 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__176; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__177; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__178; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__179; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__180; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__181; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__182; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__183; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__184; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__185 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__180))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

# 249 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))))))

# 490 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dwalkNamespaceIndexFuel = (fun fuel modules m segs -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__186) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength segs) <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__186))) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__187) -> (match dtb__187 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__188; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__189 } -> ((((v_Vuna_dCompiler_dLoader_dModules_dwalkNamespaceIndexFuel (fuel - 1)) modules) dtb__188) ((v_Vuna_dCompiler_dLoader_dModules_ddropFirst dtb__189) segs))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dModules_dlongestIndexPrefix (v_Vuna_dCompiler_dLoader_dModules_dmoduleExportIndexOfOf dtb__186)) segs) (Base_dData_dList.v_Base_dData_dList_dlength segs))))
  | _ -> failwith "DT: impossible branch"
)))

# 484 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dwalkNamespaceIndex = (fun modules m segs -> ((((v_Vuna_dCompiler_dLoader_dModules_dwalkNamespaceIndexFuel (1 + (Base_dData_dList.v_Base_dData_dList_dlength segs))) modules) m) segs))

# 260 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dresolvePathModule = (fun modules segs n -> (if (n < 1) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dModules_dtakeSegsLocal n) segs))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__190) -> (((v_Vuna_dCompiler_dLoader_dModules_dwalkNamespaceIndex modules) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dModules_dtakeSegsLocal n) segs))) ((v_Vuna_dCompiler_dLoader_dModules_ddropFirst n) segs))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dresolvePathModule modules) segs) (n - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 255 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dresolveModuleName = (fun modules name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__191) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (name))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dresolvePathModule modules) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) - 1))
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dresolvedName = (fun modules name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dresolveModuleName modules) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__192) -> dtb__192
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__193) -> (match dtb__193 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__194; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__195; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__196; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__197; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__198; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__199; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__200; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__201; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__202; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__203 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__199))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) ((v_Vuna_dCompiler_dLoader_dModules_dresolvedName modules) name))))

# 279 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__206; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__207; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__208; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__209 } -> (match ((v_Vuna_dCompiler_dLoader_dModules_dresolveModuleName mc0) dtb__206) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__206; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__207; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__208; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__209 }, ((v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports mc0) dtb__205)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__210) -> (if (dtb__210 = dtb__206) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__206; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__207; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__208; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__209 }, ((v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports mc0) dtb__205))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__210; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__207; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__208; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__209 }, ((v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports mc0) dtb__205))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule = (fun modules name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) ((v_Vuna_dCompiler_dLoader_dModules_dresolvedName modules) name)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__211) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__211).f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__212, dtb__213) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule mc0) dtb__212)) (fun idx -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValuesIn idx) mc2) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__213) mc2)
  | dtb__214 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__213) mc2)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun e -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__212; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e })) dtb__214)) more)))))
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 390 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule mc0) dtb__215)) (fun idx -> ((fun found -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__216) mc2)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun e -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__215; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e })) found)) more)))))) ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorsIn idx) mc2))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 402 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__217, dtb__218) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule mc0) dtb__217)) (fun idx -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportTypesIn idx) mc2) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__218) mc2)
  | dtb__219 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__218) mc2)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun e -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__217; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e })) dtb__219)) more)))))
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 411 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 551 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__221) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__220) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dModules_danyCtorNamed mc0) dtb__221))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> (if (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__224) = mc2) then ((v_Vuna_dCompiler_dLoader_dModules_danyCtorNamed mc3) dtb__227) else false) then true else (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__223))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__233) = mc1) then true else (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__223))
  | _ -> (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__223)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__241, dtb__242) -> ((fun mname -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dString.v_Base_dData_dString_dstartsWith mname) mc1)) then ((((v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget dtb__242) mc1) mc2) mc3) else (if (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mname) mc1) mc2) mc3) (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__241)) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget dtb__242) mc1) mc2) mc3)))) (v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__241))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget = (fun modules target -> ((fun cname -> ((fun dprefix -> (if (dprefix = "") then false else ((((v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget modules) target) dprefix) cname))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName target))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg target)))

# 556 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__243, dtb__244) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__243)) = mc2) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) mc1) mc2) dtb__244))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
