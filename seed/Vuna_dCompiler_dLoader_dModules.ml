open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dModules_dModule = { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf : string; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf : t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList }
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
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__8; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__9; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__10; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__11; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__12; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__13; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__14; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__15; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__16 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__17; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__18; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__19; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__20; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__21; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__22; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__23; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__24; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__25 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__26; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__27; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__28; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__29; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__30; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__31; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__32; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__33; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__34 } -> ((Base_dList.v_Base_dList_dappend dtb__28) dtb__29)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__35; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__36; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__37; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__38; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__39; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__40; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__41; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__42; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__43 } -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__44; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__45; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__46; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__47; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__48; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__49; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__50; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__51; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__52 } -> dtb__52
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__53; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__54; f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__55; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__56; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__57; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities = dtb__58; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe = dtb__59; f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete = dtb__60; f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__61 } -> ((Base_dList.v_Base_dList_dappend dtb__54) dtb__55)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (if (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__62) then true else (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__62)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__63) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (Base_dList.dtp_unpack seg) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__64) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__65) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__66) then (match dtb__67 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__67)
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | dtb__68 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__68)
))

let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix name -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

let v_Vuna_dCompiler_dLoader_dModules_dctorCanonical = (fun prefix dname cname -> ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (String.concat "" [dname; "."; cname])))

let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__69; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__70; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__71; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__72 } -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if ((Base_dList.v_Base_dList_dmemName dtb__73) dtb__74) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__74))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match (dtb__75).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__76)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__77; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__75) }, (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__76)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (match dtb__78 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__81 } -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__80) then (if ((Base_dList.v_Base_dList_dmemName dtb__80) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__79)) then ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateModuleAlias (dtb__80))) dtb__80) else (if ((Base_dList.v_Base_dList_dmemName dtb__80) mc1) then (if (dtb__80 = dtb__81) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__79) else ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleAliasConflict (dtb__80))) dtb__80)) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__79))) else ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_InvalidModuleAlias (dtb__80))) dtb__80))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc0 Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateImport) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports))))

let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if (dtb__82).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__83) else (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__82), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__83))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__84) = mc1) then ((fun _u -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__84)))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dmarkImportUsed (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__84))) else (match (dtb__84).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__86) -> (if (dtb__86 = mc1) then ((fun _u -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__84)))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dmarkImportUsed (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__84))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__85) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__85) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (match dtb__88 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__87
  | _ -> (String.concat "" [dtb__87; ", "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__88)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["module "; name; " is not loaded (import list and module table disagree)"])))

let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__89, dtb__90) -> (if (if ((Base_dList.v_Base_dList_dmemName (dtb__89).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) mc0) then ((dtb__89).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport mc0) mc1) dtb__90))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))))) name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))) name) entries))

let rec v_Vuna_dCompiler_dLoader_dModules_dfilterCtors = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (if (if ((dtb__91).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__91).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0) else false) then (Base_dList.C_Base_dList_dList_Cons (dtb__91, ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__92))) else ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__92))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors = (fun entries name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("type", Base_dList.C_Base_dList_dList_Nil))) name) entries))

let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (match dtb__93 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__96 } -> (if ((mc0).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__96).f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest mc0) dtb__94) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (Base_dPair.v_Base_dPair_dsecondOf dtb__97)) dtb__98) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__97)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98)))); "); qualify it"])))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unifyEntryPairs: empty candidates")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root name -> (String.concat "" [(Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root); "/"; (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinSlashes (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)); ".vuna"]))

let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg root name -> (match (root).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root) = importerPkg) then true else ((Base_dList.v_Base_dList_dmemName name) dtb__99))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> ((fun path -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows mc2) dtb__100) mc1) then (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__101) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = path; Base_dPair.f_Base_dPair_dPair_second = dtb__100 }, mc3))) mc4) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__101) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__100), mc4)))) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__101) mc1) mc2) mc3) mc4))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__100) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc4) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir) roots)))

let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir (Base_dPair.v_Base_dPair_dsecondOf candidate)))

let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun roots name importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) name) importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__103 } -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__104))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_AmbiguousModule (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) dtb__102))))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) dtb__102)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots))
  | dtb__106 -> (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__103)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__103))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__102)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__107 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__109; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__110; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__111; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__112; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__113; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__114; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__115; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__116; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__117 } -> (if (dtb__109 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__109; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__110; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__111; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__112; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__113; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__114; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__115; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__116; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__117 })) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__108) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (match dtb__118 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__119; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__120; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__121; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__122; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__123; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__124; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__125; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__126; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__127 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__123))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))))))

let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128) -> (match dtb__128 with
  | { f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__129; f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__130; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__131; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__132; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__133; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__134; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__135; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__136; f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__137 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__134))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__138)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__140) -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__139) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__138; Base_dPair.f_Base_dPair_dPair_second = dtb__140 }, more))))))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dmarkImportUsed dtb__138))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__139) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__141)) (fun es -> ((fun found -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__142) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = e })) found)) more)))))) (if ((Base_dList.v_Base_dList_dlength found) = 0) then 0 else (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dmarkImportUsed dtb__141)))) ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__143)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__145) -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__144) mc2)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__143; Base_dPair.f_Base_dPair_dPair_second = dtb__145 }, more))))))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dmarkImportUsed dtb__143))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__144) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__146)) = mc2) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) mc1) mc2) dtb__147))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__148 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) dtb__150) mc1) dtb__153) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__149))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__159) = mc1) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__149))
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__149)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (if (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls (v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__167)) mc1) (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__167)) then true else ((v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget dtb__168) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
