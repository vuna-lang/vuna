open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dModules_dModule = { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf : t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dLoader_dModules_dProject = { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules : t_Vuna_dCompiler_dLoader_dModules_dModule Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg : string; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dLoader_dModules_dNamespaces = { f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease : bool }
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent : string }
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = { f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent : string }

# 99 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun sx sy -> (match sx with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__0; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__1; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__2; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__3 } -> (match sy with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__4; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__5; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__6; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> (0 = 1)
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((Base_dEq.v_Base_dEq_deq v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry) sx) sy) then (0 = 1) else (1 = 1)))))

# 50 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__8; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__9; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__10; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__11; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__12; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__13; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__14; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__15; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__16 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__17; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__18; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__19; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__20; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__21; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__22; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__23; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__24; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__25 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__26; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__27; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__28; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__29; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__30; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__31; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__32; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__33; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__34 } -> ((Base_dList.v_Base_dList_dappend dtb__28) dtb__29)
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__35; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__36; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__37; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__38; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__39; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__40; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__41; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__42; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__43 } -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__44; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__45; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__46; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__47; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__48; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__49; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__50; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__51; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__52 } -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleReexportsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__53; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__54; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__55; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__56; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__57; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__58; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__59; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__60; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__61 } -> dtb__60
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleOpaqueOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__62; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__63; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__64; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__65; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__66; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__67; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__68; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__69; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__70 } -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__71; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__72; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__73; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__74; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__75; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__76 } -> ((Base_dList.v_Base_dList_dappend dtb__72) dtb__73)
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__77) then true else (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__77)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__78) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (Base_dList.dtp_unpack seg) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__79) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__80) else false)
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__81) then (match dtb__82 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__82)
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | dtb__83 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__83)
))

# 133 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix name -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

# 139 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dctorCanonical = (fun prefix dname cname -> ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (String.concat "" [dname; "."; cname])))

# 142 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__84; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__85; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__86; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__87 } -> dtb__84
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

# 148 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (if ((Base_dList.v_Base_dList_dmemName dtb__88) dtb__89) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__89))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match (dtb__90).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__91)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__90) }, (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__91)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dwithImportSite = (fun sp d -> (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp) = "") then d else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp) d)))

# 162 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (match (dtb__93).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> (if (dtb__95 = mc1) then (dtb__93).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan else ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias dtb__94) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias dtb__94) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dduplicateImportSpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__96)) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames dtb__97)) then (dtb__96).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan else (v_Vuna_dCompiler_dLoader_dModules_dduplicateImportSpan dtb__97))
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__98 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__100; Base_dPair.f_Base_dPair_dPair_second = dtb__101 } -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__100) then (if ((Base_dList.v_Base_dList_dmemName dtb__100) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__99)) then ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias mc0) dtb__100))) ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateModuleAlias (dtb__100))) dtb__100)) else (if ((Base_dList.v_Base_dList_dmemName dtb__100) mc1) then (if (dtb__100 = dtb__101) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__99) else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias mc0) dtb__100))) ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleAliasConflict (dtb__100))) dtb__100))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__99))) else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite ((v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias mc0) dtb__100))) ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_InvalidModuleAlias (dtb__100))) dtb__100)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImportSite (v_Vuna_dCompiler_dLoader_dModules_dduplicateImportSpan imports))) (Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc0 Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateImport)) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases imports) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports))))

# 190 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (if (dtb__102).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__103) else (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__102), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__103))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__104) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__104))) else (match (dtb__104).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (if (dtb__106 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__104))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__105) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__105) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun imports prefix -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule imports) prefix))

# 212 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__107 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__109, dtb__110) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule mc0) dtb__109) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__108) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (if ((Base_dList.v_Base_dList_dmemName dtb__111) mc2) then (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__108) mc2) else (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__108) (Base_dList.C_Base_dList_dList_Cons (dtb__111, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__108) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames = (fun imports items -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo imports) items) Base_dList.C_Base_dList_dList_Nil))

# 222 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__112) -> (match dtb__112 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__113; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__114; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__115; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__116; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__117; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__118; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__119 } -> (if dtb__114 then ((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames mc0) dtb__115) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 227 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__120
  | _ -> (String.concat "" [dtb__120; ", "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__121)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

# 255 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (if (if ((Base_dList.v_Base_dList_dmemName (dtb__122).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) mc0) then ((dtb__122).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport mc0) mc1) dtb__123))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))))) name) entries))

# 263 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))) name) entries))

# 272 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfilterCtors = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__124, dtb__125) -> (if (if ((dtb__124).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__124).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0) else false) then (Base_dList.C_Base_dList_dList_Cons (dtb__124, ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__125))) else ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__125))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors = (fun entries name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) entries))

# 278 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("type", Base_dList.C_Base_dList_dList_Nil))) name) entries))

# 321 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (match dtb__126 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__128; Base_dPair.f_Base_dPair_dPair_second = dtb__129 } -> (if ((mc0).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__129).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest mc0) dtb__127) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (Base_dPair.v_Base_dPair_dsecondOf dtb__130)) dtb__131) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__130)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131)))); "); qualify it"])))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root name -> (String.concat "" [(Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root); "/"; (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinSlashes (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)); ".vuna"]))

# 336 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg root name -> (match (root).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root) = importerPkg) then true else ((Base_dList.v_Base_dList_dmemName name) dtb__132))
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path))) (fun exists -> (if exists then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows mc2) dtb__133) mc1) then (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__134) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = path; Base_dPair.f_Base_dPair_dPair_second = dtb__133 }, mc3))) mc4) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__134) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__133), mc4)))) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__134) mc1) mc2) mc3) mc4))))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__133) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir) roots)))

# 358 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir (Base_dPair.v_Base_dPair_dsecondOf candidate)))

# 362 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan = (fun sp d -> (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp) = "") then d else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp) d)))

# 365 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun roots name importerPkg importerSpan -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) name) importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) (fun collected -> ((fun allowed -> ((fun hidden -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__135))
  | _ -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_AmbiguousModule (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed))))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed))))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match hidden with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))
  | dtb__137 -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan importerSpan)) (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden)))
)
  | _ -> failwith "DT: impossible branch"
)) allowed))) (Base_dPair.v_Base_dPair_dsecondOf collected))) (Base_dPair.v_Base_dPair_dfirstOf collected)))))

# 385 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (match dtb__138 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__140; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__141; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__142; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__143; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__144; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__145; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__146; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__147; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__148 } -> (if (dtb__140 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__140; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__141; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__142; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__143; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__144; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__145; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__146; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__147; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__148 })) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__139) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149) -> (match dtb__149 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__150; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__151; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__152; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__153; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__154; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__155; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__156; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__157; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__158 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__154))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

# 245 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))))))

# 249 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__159) -> (match dtb__159 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__160; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__161; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__162; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__163; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__164; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__165; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__166; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__167; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__168 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

# 281 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__169, dtb__170) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__169)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__170) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__169; Base_dPair.f_Base_dPair_dPair_second = dtb__171 }, more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__170) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 295 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__172, dtb__173) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__172)) (fun es -> ((fun found -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__173) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = e })) found)) more)))))) ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 307 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__174, dtb__175) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__174)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__175) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__174; Base_dPair.f_Base_dPair_dPair_second = dtb__176 }, more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__175) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Loader/Modules.vuna"
let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

# 411 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__177)) = mc2) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) mc1) mc2) dtb__178))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (match dtb__179 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) dtb__181) mc1) dtb__184) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__180))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__190) = mc1) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__180))
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__180)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Loader/Modules.vuna"
let rec v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (if (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls (v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__198)) mc1) (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__198)) then true else ((v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget dtb__199) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
