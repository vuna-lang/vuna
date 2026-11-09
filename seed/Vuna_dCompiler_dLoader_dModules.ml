open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dModules_dModule = C_Vuna_dCompiler_dLoader_dModules_dModule_Module of (string) * (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dExportEntry Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dProject = C_Vuna_dCompiler_dLoader_dModules_dProject_Project of (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dModule Base_dList.t_Base_dList_dList) * (string) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * (bool) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dNamespaces = C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces of (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * ((string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry of (string) * (string) * (string) * (string)
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef of (string) * (string) * (string)

let rec v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun sx sy -> (match sx with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__0, dtb__1, dtb__2, dtb__3) -> (match sy with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__4, dtb__5, dtb__6, dtb__7) -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> (0 = 1)
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((Base_dEq.v_Base_dEq_deq v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry) sx) sy) then (0 = 1) else (1 = 1)))))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> ((Base_dList.v_Base_dList_dappend dtb__28) dtb__29)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> dtb__52
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Project (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((Base_dList.v_Base_dList_dappend dtb__54) dtb__55)
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

let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | dtb__68 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__68)
))

let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix name -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

let v_Vuna_dCompiler_dLoader_dModules_dctorCanonical = (fun prefix dname cname -> ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (String.concat "" [dname; "."; cname])))

let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if ((Base_dList.v_Base_dList_dmemName dtb__73) dtb__74) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__74))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match (match dtb__75 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__79
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__76)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__81) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__81, (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__75))), (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__76)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (match dtb__82 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__84, dtb__85) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__84) then (if ((Base_dList.v_Base_dList_dmemName dtb__84) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__83)) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": duplicate module alias "; dtb__84]))) else (if ((Base_dList.v_Base_dList_dmemName dtb__84) mc1) then (if (dtb__84 = dtb__85) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__83) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": module alias "; dtb__84; " conflicts with an imported module"])))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__83))) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": invalid module alias "; dtb__84]))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (Base_dResult.C_Base_dResult_dResult_Err ((label ^ ": duplicate import"))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports))))

let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (if (match dtb__86 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__88, dtb__89, dtb__90, dtb__91) -> dtb__89
  | _ -> failwith "DT: impossible branch"
) then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__87) else (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__86), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__87))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__92) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__92))) else (match (match dtb__92 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__96
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> (if (dtb__98 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__92))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__93) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__93) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__100 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__99
  | _ -> (String.concat "" [dtb__99; ", "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__100)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["loader: internal: module "; name; " is not loaded (import list and module table disagree)"]))))

let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (if ((Base_dList.v_Base_dList_dmemName (match dtb__101 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__103, dtb__104, dtb__105, dtb__106) -> dtb__103
  | _ -> failwith "DT: impossible branch"
)) mc0) then ((match dtb__101 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__108
  | _ -> failwith "DT: impossible branch"
) = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__101)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport mc0) mc1) dtb__102))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("val", (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))))) name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("ctor", Base_dList.C_Base_dList_dList_Nil))) name) entries))

let rec v_Vuna_dCompiler_dLoader_dModules_dfilterCtors = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if (if ((match dtb__111 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__113, dtb__114, dtb__115, dtb__116) -> dtb__113
  | _ -> failwith "DT: impossible branch"
) = "ctor") then ((match dtb__111 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__117, dtb__118, dtb__119, dtb__120) -> dtb__118
  | _ -> failwith "DT: impossible branch"
) = mc0) else false) then (Base_dList.C_Base_dList_dList_Cons (dtb__111, ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__112))) else ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors mc0) dtb__112))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors = (fun entries name -> ((v_Vuna_dCompiler_dLoader_dModules_dfilterCtors name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (Base_dList.C_Base_dList_dList_Cons ("type", Base_dList.C_Base_dList_dList_Nil))) name) entries))

let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (match dtb__121 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__123, dtb__124) -> (if ((match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__125, dtb__126, dtb__127, dtb__128) -> dtb__127
  | _ -> failwith "DT: impossible branch"
) = (match dtb__124 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__131
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest mc0) dtb__122) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (Base_dPair.v_Base_dPair_dsecondOf dtb__133)) dtb__134) then (Base_dResult.C_Base_dResult_dResult_Ok (dtb__133)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134)))); "); qualify it"]))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": unknown "; mc1; " "; mc2])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root name -> (String.concat "" [(Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root); "/"; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinSlashes (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)); ".vuna"]))

let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg root name -> (match (match root with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> dtb__137
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__142) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root) = importerPkg) then true else ((Base_dList.v_Base_dList_dmemName name) dtb__142))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> ((fun path -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows mc2) dtb__143) mc1) then (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__144) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (path, dtb__143)), mc3))) mc4) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__144) mc1) mc2) mc3) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__143), mc4)))) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__144) mc1) mc2) mc3) mc4))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__143) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc3), (Base_dList.v_Base_dList_dreverse mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir) roots)))

let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir (Base_dPair.v_Base_dPair_dsecondOf candidate)))

let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun roots name importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) name) importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__145, dtb__146) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match dtb__148 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__147))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["ambiguous module "; name; " (found in: "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) dtb__145)); ")"])))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__146 with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots))
  | dtb__149 -> (((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__146)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__146))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__145)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match dtb__150 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> (if (dtb__152 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160)))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__151) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> (match dtb__161 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__166))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))))))

let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> (match dtb__171 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__177))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__181)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__183) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__182) mc2)) (fun more -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__181, dtb__183)), more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__182) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__184)) (fun es -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__185) mc2)) (fun more -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__184, e)))) ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) mc2))) more)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__186)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__187) mc2)) (fun more -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__186, dtb__188)), more))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__187) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__189)) = mc2) then true else ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) mc1) mc2) dtb__190))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (match dtb__191 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200) -> (if ((((v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget mc0) dtb__193) mc1) dtb__196) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__192))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> (if (((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__201) = mc1) then true else (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__192))
  | _ -> (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls mc0) mc1) dtb__192)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__208, dtb__209) -> (if (((v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls (v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__208)) mc1) (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__208)) then true else ((v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget dtb__209) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
