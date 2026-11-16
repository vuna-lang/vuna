open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dModules_dModule = { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf : t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf : (string, t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dLoader_dModules_dProject = { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules : t_Vuna_dCompiler_dLoader_dModules_dModule Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg : string; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dLoader_dModules_dNamespaces = { f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease : bool }
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent : string }
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = { f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent : string }

# 103 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun sx sy -> (match sx with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__0; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__1; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__2; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__3 } -> (match sy with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__4; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__5; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__6; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> (0 = 1)
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((Base_dEq.v_Base_dEq_deq v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry) sx) sy) then (0 = 1) else (1 = 1)))))

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
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__28; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__29; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__30; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__31; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__32; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__33; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__34; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__35; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__36; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__37 } -> ((Base_dList.v_Base_dList_dappend dtb__30) dtb__31)
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
  | { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__78; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__79; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__80; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__81; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__82; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__83 } -> ((Base_dList.v_Base_dList_dappend dtb__79) dtb__80)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (if (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__84) then true else (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__84)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__85) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (Base_dList.dtp_unpack seg) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__86) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__87) else false)
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__88) then (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__89)
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
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
let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

# 151 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (if ((Base_dList.v_Base_dList_dmemName dtb__95) dtb__96) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__96))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match (dtb__97).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__98)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__97) }, (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__98)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dwithImportSite = (fun sp d -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp) = "") then d else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp) d)))

# 165 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match (dtb__100).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__102) -> (if (dtb__102 = mc1) then (dtb__100).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan else ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias dtb__101) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias dtb__101) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dduplicateImportSpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__103)) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames dtb__104)) then (dtb__103).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan else (v_Vuna_dCompiler_dLoader_dModules_dduplicateImportSpan dtb__104))
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (match dtb__105 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__107; Base_dPair.f_Base_dPair_dPair_second = dtb__108 } -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__107) then (if ((Base_dList.v_Base_dList_dmemName dtb__107) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__106)) then ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias mc0) dtb__107))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_DuplicateModuleAlias (dtb__107))) dtb__107)) else (if ((Base_dList.v_Base_dList_dmemName dtb__107) mc1) then (if (dtb__107 = dtb__108) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__106) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias mc0) dtb__107))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleAliasConflict (dtb__107))) dtb__107))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__106))) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias mc0) dtb__107))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidModuleAlias (dtb__107))) dtb__107)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite (v_Vuna_dCompiler_dLoader_dModules_dduplicateImportSpan imports))) (Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc0 Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_DuplicateImport)) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases imports) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports))))

# 193 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (if (dtb__109).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__110) else (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__109), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__110))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__111) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__111))) else (match (dtb__111).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> (if (dtb__113 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__111))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__112) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__112) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun imports prefix -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule imports) prefix))

# 215 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__114 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__116, dtb__117) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule mc0) dtb__116) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__115) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (if ((Base_dList.v_Base_dList_dmemName dtb__118) mc2) then (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__115) mc2) else (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__115) (Base_dList.C_Base_dList_dList_Cons (dtb__118, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__115) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames = (fun imports items -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo imports) items) Base_dList.C_Base_dList_dList_Nil))

# 225 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> (match dtb__119 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__120; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__121; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__122; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__123; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__124; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__125; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__126 } -> (if dtb__121 then ((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames mc0) dtb__122) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 230 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__127
  | _ -> (String.concat "" [dtb__127; ", "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__128)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

# 269 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dentriesByName = (fun name idx -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) idx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__129) -> dtb__129
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> ((fun tail -> ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (dtb__130).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) (Base_dList.C_Base_dList_dList_Cons (dtb__130, ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName (dtb__130).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) tail)))) tail)) ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfGo dtb__131) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dexportIndexOf = (fun entries -> ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfGo entries) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 280 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (if (if ((Base_dList.v_Base_dList_dmemName (dtb__132).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) mc0) then ((dtb__132).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport mc0) mc1) dtb__133))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))))) name) entries))

# 288 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))) name) entries))

# 296 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfilterCtors = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (if (if ((dtb__134).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__134).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0) else false) then (Base_dList.C_Base_dList_dList_Cons (dtb__134, ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__135))) else ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__135))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors = (fun entries name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) entries))

# 302 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("type", Base_dList.C_Base_dList_dList_Nil))) name) entries))

# 305 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportValueIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 308 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 311 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorsIn = (fun idx name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 314 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportTypeIn = (fun idx name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("type", Base_dList.C_Base_dList_dList_Nil))) name) ((v_Vuna_dCompiler_dLoader_dModules_dentriesByName name) idx)))

# 357 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match dtb__136 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__138; Base_dPair.f_Base_dPair_dPair_second = dtb__139 } -> (if ((mc0).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__139).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest mc0) dtb__137) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (Base_dPair.v_Base_dPair_dsecondOf dtb__140)) dtb__141) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__140)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141)))); "); qualify it"])))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root name -> (String.concat "" [(Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir root); "/"; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinSlashes (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)); ".vuna"]))

# 372 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg root name -> (match (root).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__142) -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root) = importerPkg) then true else ((Base_dList.v_Base_dList_dmemName name) dtb__142))
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun nFs mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows mc2) dtb__143) mc1) then ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) dtb__144) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = path; Base_dPair.f_Base_dPair_dPair_second = dtb__143 }, mc3))) mc4) else ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) dtb__144) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName dtb__143), mc4)))) else ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) dtb__144) mc1) mc2) mc3) mc4))))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__143) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir) roots)))

# 394 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir (Base_dPair.v_Base_dPair_dsecondOf candidate)))

# 398 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan = (fun sp d -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp) = "") then d else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp) d)))

# 401 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun nFs roots name importerPkg importerSpan -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) roots) name) importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) (fun collected -> ((fun allowed -> ((fun hidden -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match dtb__146 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__145))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed))))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed))))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match hidden with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr2 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))
  | dtb__147 -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr2 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden)))
)
  | _ -> failwith "DT: impossible branch"
)) allowed))) (Base_dPair.v_Base_dPair_dsecondOf collected))) (Base_dPair.v_Base_dPair_dfirstOf collected)))))

# 421 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__148 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__150; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__151; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__152; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__153; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__154; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__155; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__156; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__157; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__158; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__159 } -> (if (dtb__150 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__150; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__151; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__152; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__153; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__154; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__155; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__156; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__157; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__158; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__159 })) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__149) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (match dtb__160 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__161; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__162; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__163; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__164; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__165; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__166; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__167; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__168; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__169; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__170 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

# 248 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))))))

# 252 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> (match dtb__171 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__172; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__173; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__174; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__175; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__176; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__177; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__178; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__179; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__180; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__181 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__177))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

# 274 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule = (fun modules name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__182) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__182).f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule mc0) dtb__183)) (fun idx -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValueIn idx) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__184) mc2)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__183; Base_dPair.f_Base_dPair_dPair_second = dtb__185 }, more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__184) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 331 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule mc0) dtb__186)) (fun idx -> ((fun found -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__187) mc2)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = dtb__186; Base_dPair.f_Base_dPair_dPair_second = e })) found)) more)))))) ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorsIn idx) mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 343 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule mc0) dtb__188)) (fun idx -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportTypeIn idx) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__190) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__189) mc2)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__188; Base_dPair.f_Base_dPair_dPair_second = dtb__190 }, more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__189) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 459 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__191) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dModules_danyCtorNamed mc0) dtb__192))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> (match dtb__193 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (if (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__195) = mc2) then ((v_Vuna_dCompiler_dLoader_dModules_danyCtorNamed mc3) dtb__198) else false) then true else (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__194))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__204) = mc1) then true else (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__194))
  | _ -> (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) mc2) mc3) dtb__194)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 437 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> ((fun mname -> (if (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith mname) mc1)) then ((((v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget dtb__213) mc1) mc2) mc3) else (if (((((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mname) mc1) mc2) mc3) (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__212)) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget dtb__213) mc1) mc2) mc3)))) (v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__212))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget = (fun modules target -> ((fun cname -> ((fun dprefix -> (if (dprefix = "") then false else ((((v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget modules) target) dprefix) cname))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName target))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg target)))

# 464 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__214, dtb__215) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__214)) = mc2) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) mc1) mc2) dtb__215))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
