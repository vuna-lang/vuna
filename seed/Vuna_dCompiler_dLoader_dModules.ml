open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dModules_dModule = { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf : t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dLoader_dModules_dProject = { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules : t_Vuna_dCompiler_dLoader_dModules_dModule Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg : string; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete : bool; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dLoader_dModules_dNamespaces = { f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target : string; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent : string }
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = { f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget : string; f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent : string }

let rec v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun sx sy -> (match sx with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__0; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__1; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__2; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__3 } -> (match sy with
  | { f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__4; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__5; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__6; f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__7 } -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> (0 = 1)
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((Base_dEq.v_Base_dEq_deq v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry) sx) sy) then (0 = 1) else (1 = 1)))))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__8; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__9; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__10; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__11; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__12; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__13; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__14; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__15; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__16; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__17 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__18; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__19; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__20; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__21; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__22; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__23; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__24; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__25; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__26; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__27 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__28; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__29; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__30; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__31; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__32; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__33; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__34; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__35; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__36; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__37 } -> ((Base_dList.v_Base_dList_dappend dtb__30) dtb__31)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__38; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__39; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__40; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__41; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__42; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__43; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__44; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__45; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__46; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__47 } -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__48; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__49; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__50; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__51; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__52; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__53; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__54; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__55; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__56; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__57 } -> dtb__56
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleReexportsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__58; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__59; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__60; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__61; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__62; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__63; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__64; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__65; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__66; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__67 } -> dtb__67
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__68; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__69; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__70; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__71; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__72; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities = dtb__73; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe = dtb__74; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete = dtb__75; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__76 } -> ((Base_dList.v_Base_dList_dappend dtb__69) dtb__70)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__77) then true else (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__77)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__78) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (Base_dList.dtp_unpack seg) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__79) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__80) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__81) then (match dtb__82 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__82)
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | dtb__83 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__83)
))

let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix name -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

let v_Vuna_dCompiler_dLoader_dModules_dctorCanonical = (fun prefix dname cname -> ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (String.concat "" [dname; "."; cname])))

let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__84; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__85; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__86; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__87 } -> dtb__84
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (if ((Base_dList.v_Base_dList_dmemName dtb__88) dtb__89) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__89))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match (dtb__90).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__91)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__90) }, (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__91)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (match dtb__93 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__96 } -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__95) then (if ((Base_dList.v_Base_dList_dmemName dtb__95) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__94)) then ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateModuleAlias (dtb__95))) dtb__95) else (if ((Base_dList.v_Base_dList_dmemName dtb__95) mc1) then (if (dtb__95 = dtb__96) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__94) else ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleAliasConflict (dtb__95))) dtb__95)) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__94))) else ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_InvalidModuleAlias (dtb__95))) dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc0 Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateImport) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports))))

let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (if (dtb__97).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__98) else (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__97), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__98))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__99) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__99))) else (match (dtb__99).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__101) -> (if (dtb__101 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__99))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__100) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule dtb__100) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun imports prefix -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule imports) prefix))

let rec v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__102 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__104, dtb__105) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportModule mc0) dtb__104) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__103) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (if ((Base_dList.v_Base_dList_dmemName dtb__106) mc2) then (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__103) mc2) else (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__103) (Base_dList.C_Base_dList_dList_Cons (dtb__106, mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo mc0) dtb__103) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames = (fun imports items -> (((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo imports) items) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> (match dtb__107 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__108; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__109; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__110; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__111 } -> (if dtb__109 then ((v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames mc0) dtb__110) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__112
  | _ -> (String.concat "" [dtb__112; ", "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__113)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (if (if ((Base_dList.v_Base_dList_dmemName (dtb__114).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) mc0) then ((dtb__114).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport mc0) mc1) dtb__115))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))))) name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))) name) entries))

let rec v_Vuna_dCompiler_dLoader_dModules_dfilterCtors = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (if (if ((dtb__116).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__116).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0) else false) then (Base_dList.C_Base_dList_dList_Cons (dtb__116, ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__117))) else ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__117))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors = (fun entries name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("type", Base_dList.C_Base_dList_dList_Nil))) name) entries))

let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (match dtb__118 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__120; Base_dPair.f_Base_dPair_dPair_second = dtb__121 } -> (if ((mc0).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__121).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest mc0) dtb__119) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (Base_dPair.v_Base_dPair_dsecondOf dtb__122)) dtb__123) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__122)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123)))); "); qualify it"])))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root name -> (String.concat "" [(Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root); "/"; (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinSlashes (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)); ".vuna"]))

let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg root name -> (match (root).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root) = importerPkg) then true else ((Base_dList.v_Base_dList_dmemName name) dtb__124))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows mc2) dtb__125) mc1) then (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__126) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = path; Base_dPair.f_Base_dPair_dPair_second = dtb__125 }, mc3))) mc4) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__126) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__125), mc4)))) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__126) mc1) mc2) mc3) mc4))))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__125) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc4) })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir) roots)))

let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir (Base_dPair.v_Base_dPair_dsecondOf candidate)))

let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun roots name importerPkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) name) importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) (fun collected -> ((fun allowed -> ((fun hidden -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__127))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_AmbiguousModule (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed))))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) allowed)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match hidden with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots))
  | dtb__129 -> (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames hidden))
)
  | _ -> failwith "DT: impossible branch"
)) allowed))) (Base_dPair.v_Base_dPair_dsecondOf collected))) (Base_dPair.v_Base_dPair_dfirstOf collected)))))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__130 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__132; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__133; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__134; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__135; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__136; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__137; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__138; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__139; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__140; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__141 } -> (if (dtb__132 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__132; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__133; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__134; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__135; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__136; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__137; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__138; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__139; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__140; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__141 })) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__131) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__142) -> (match dtb__142 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__143; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__144; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__145; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__146; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__147; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__148; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__149; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__150; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__151; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__152 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__147))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))))))

let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__153) -> (match dtb__153 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__154; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__155; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__156; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__157; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__158; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__159; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__160; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__161; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__162; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__163 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__159))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__164)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__165) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__166 }, more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__165) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__167)) (fun es -> ((fun found -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__168) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = dtb__167; Base_dPair.f_Base_dPair_dPair_second = e })) found)) more)))))) ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__169, dtb__170) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__169)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__170) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__169; Base_dPair.f_Base_dPair_dPair_second = dtb__171 }, more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__170) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__172, dtb__173) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__172)) = mc2) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) mc1) mc2) dtb__173))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__174, dtb__175) -> (match dtb__174 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) dtb__176) mc1) dtb__179) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__175))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__185) = mc1) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__175))
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__175)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> (if (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls (v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__193)) mc1) (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__193)) then true else ((v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget dtb__194) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
