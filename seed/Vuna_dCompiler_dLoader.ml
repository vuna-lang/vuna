open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
type t_Vuna_dCompiler_dLoader_dModule = C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule of (string) * (string) * (t_Vuna_dCompiler_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dExportEntry t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dProject = C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject of (t_Vuna_dCompiler_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModule t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dLoader_dExportEntry = C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry of (string) * (string) * (string) * (string)
and t_Vuna_dCompiler_dLoader_dExportRef = C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef of (string) * (string) * (string)

let rec v_Eq_uEq_uVuna_dCompiler_dLoader_dExportEntry = fun () -> (C_Dict_uEq_MkDict_uEq ((fun sx -> (fun sy -> (match sx with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__0, dtb__1, dtb__2, dtb__3) -> (match sy with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__4, dtb__5, dtb__6, dtb__7) -> (if ((bi_eq_str dtb__0) dtb__4) then (if ((bi_eq_str dtb__1) dtb__5) then (if ((bi_eq_str dtb__2) dtb__6) then ((bi_eq_str dtb__3) dtb__7) else false) else false) else false)
  | _ -> ((bi_eq_int 0) 1)
)
  | _ -> failwith "DT: impossible branch"
))), (fun sx -> (fun sy -> (if (((v_eq (v_Eq_uEq_uVuna_dCompiler_dLoader_dExportEntry ())) sx) sy) then ((bi_eq_int 0) 1) else ((bi_eq_int 1) 1))))))

let v_Vuna_dCompiler_dLoader_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dmoduleImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dmoduleImplicitImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> ((v_Base_dList_dappend dtb__34) dtb__35)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dmoduleExportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dprojectEntryDecls = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dprojectEntryImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> dtb__56
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> ((v_Base_dList_dappend dtb__61) dtb__62)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dprojectModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dprojectEntryPkg = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dallIdentChars = (fun chars -> (match chars with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (if (if (v_Vuna_dCompiler_dLexer_disIdentStart dtb__75) then true else (v_Vuna_dCompiler_dLexer_disDigit dtb__75)) then (v_Vuna_dCompiler_dLoader_dallIdentChars dtb__76) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dvalidSegment = (fun seg -> (match (dtp_unpack seg) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (v_Vuna_dCompiler_dLexer_disUpperChar dtb__77) then (v_Vuna_dCompiler_dLoader_dallIdentChars dtb__78) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dallSegmentsValid = (fun segs -> (match segs with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (if (v_Vuna_dCompiler_dLoader_dvalidSegment dtb__79) then (match dtb__80 with
  | C_Base_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dallSegmentsValid dtb__80)
) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dvalidModuleName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Nil -> false
  | dtb__81 -> (v_Vuna_dCompiler_dLoader_dallSegmentsValid dtb__81)
))

let v_Vuna_dCompiler_dLoader_disGlobalCtor = (fun name -> (if (if (if ((bi_eq_str name) "True") then true else ((bi_eq_str name) "False")) then true else ((bi_eq_str name) "Cons")) then true else ((bi_eq_str name) "Nil")))

let v_Vuna_dCompiler_dLoader_dmangle = (fun prefix -> (fun name -> (if ((bi_eq_str prefix) "") then name else ((bi_concat prefix) ((bi_concat ".") name)))))

let v_Vuna_dCompiler_dLoader_dimportName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport (dtb__82, dtb__83, dtb__84, dtb__85) -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dimportIsQualified = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport (dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__87
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dimportAlias = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport (dtb__90, dtb__91, dtb__92, dtb__93) -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dimportModuleNames = (fun imports -> ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dimportName) imports))

let rec v_Vuna_dCompiler_dLoader_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if ((v_Base_dList_dmemName dtb__94) dtb__95) then true else (v_Vuna_dCompiler_dLoader_dhasDuplicateName dtb__95))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dimportAliases = (fun imports -> (match imports with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match (v_Vuna_dCompiler_dLoader_dimportAlias dtb__96) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dimportAliases dtb__97)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, (v_Vuna_dCompiler_dLoader_dimportName dtb__96))), (v_Vuna_dCompiler_dLoader_dimportAliases dtb__97)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dcheckImportAliases = (fun label -> (fun moduleNames -> (fun aliases -> (match aliases with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> (if (v_Vuna_dCompiler_dLoader_dvalidSegment dtb__101) then (if ((v_Base_dList_dmemName dtb__101) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__100)) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": duplicate module alias ") dtb__101)))) else (if ((v_Base_dList_dmemName dtb__101) moduleNames) then (if ((bi_eq_str dtb__101) dtb__102) then (((v_Vuna_dCompiler_dLoader_dcheckImportAliases label) moduleNames) dtb__100) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module alias ") ((bi_concat dtb__101) " conflicts with an imported module")))))) else (((v_Vuna_dCompiler_dLoader_dcheckImportAliases label) moduleNames) dtb__100))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid module alias ") dtb__101)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dvalidateImports = (fun label -> (fun imports -> (if (v_Vuna_dCompiler_dLoader_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": duplicate import"))) else (((v_Vuna_dCompiler_dLoader_dcheckImportAliases label) (v_Vuna_dCompiler_dLoader_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dimportAliases imports)))))

let rec v_Vuna_dCompiler_dLoader_dopenModuleNames = (fun imports -> (match imports with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (if (v_Vuna_dCompiler_dLoader_dimportIsQualified dtb__103) then (v_Vuna_dCompiler_dLoader_dopenModuleNames dtb__104) else (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dimportName dtb__103), (v_Vuna_dCompiler_dLoader_dopenModuleNames dtb__104))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dfindImportPrefix = (fun imports -> (fun prefix -> (match imports with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dimportName dtb__105)) prefix) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dimportName dtb__105))) else (match (v_Vuna_dCompiler_dLoader_dimportAlias dtb__105) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (if ((bi_eq_str dtb__107) prefix) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dimportName dtb__105))) else ((v_Vuna_dCompiler_dLoader_dfindImportPrefix dtb__106) prefix))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dfindImportPrefix dtb__106) prefix)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_d_ujoinNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__109 with
  | C_Base_dList_dList_Nil -> dtb__108
  | _ -> ((bi_concat dtb__108) ((bi_concat ", ") (v_Vuna_dCompiler_dLoader_d_ujoinNames dtb__109)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dentryKind = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dentryPublic = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__114, dtb__115, dtb__116, dtb__117) -> dtb__115
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dentryTarget = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__120
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dentryParent = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__122, dtb__123, dtb__124, dtb__125) -> dtb__125
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dlookupExport = (fun kinds -> (fun name -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (if (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dentryKind dtb__126)) kinds) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryPublic dtb__126)) name) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__126)) else (((v_Vuna_dCompiler_dLoader_dlookupExport kinds) name) dtb__127))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dfindExportValue = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dlookupExport (C_Base_dList_dList_Cons ("val", (C_Base_dList_dList_Cons ("ctor", C_Base_dList_dList_Nil))))) name) entries)))

let v_Vuna_dCompiler_dLoader_dfindExportCtor = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dlookupExport (C_Base_dList_dList_Cons ("ctor", C_Base_dList_dList_Nil))) name) entries)))

let v_Vuna_dCompiler_dLoader_dfindExportType = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dlookupExport (C_Base_dList_dList_Cons ("type", C_Base_dList_dList_Nil))) name) entries)))

let rec v_Vuna_dCompiler_dLoader_dsameTargetRest = (fun e -> (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (match dtb__128 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dentryTarget dtb__131)) then ((v_Vuna_dCompiler_dLoader_dsameTargetRest e) dtb__129) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dunifyEntryPairs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (if ((v_Vuna_dCompiler_dLoader_dsameTargetRest (v_Base_dPair_dsecondOf dtb__132)) dtb__133) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__132)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": ambiguous ") ((bi_concat mc1) ((bi_concat " ") ((bi_concat mc2) ((bi_concat " (imported from ") ((bi_concat (v_Vuna_dCompiler_dLoader_d_ujoinNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) (C_Base_dList_dList_Cons (dtb__132, dtb__133))))) "); qualify it"))))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": unknown ") ((bi_concat mc1) ((bi_concat " ") mc2))))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dmodulePath = (fun root -> (fun name -> ((bi_concat (v_Vuna_dCompiler_dPkg_drootDir root)) ((bi_concat "/") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) ".vuna")))))

let v_Vuna_dCompiler_dLoader_drootAllows = (fun importerPkg -> (fun root -> (fun name -> (match (v_Vuna_dCompiler_dPkg_drootExports root) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__134) -> (if ((bi_eq_str (v_Vuna_dCompiler_dPkg_drootName root)) importerPkg) then true else ((v_Base_dList_dmemName name) dtb__134))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dcollectModuleFiles = (fun roots -> (fun name -> (fun importerPkg -> (fun allowed -> (fun hidden -> (match roots with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse allowed), (v_Base_dList_dreverse hidden)))
  | C_Base_dList_dList_Cons (dtb__135, dtb__136) -> ((fun path -> (if (dtp_fileExists path) then (if (((v_Vuna_dCompiler_dLoader_drootAllows importerPkg) dtb__135) name) then (((((v_Vuna_dCompiler_dLoader_dcollectModuleFiles dtb__136) name) importerPkg) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (path, dtb__135)), allowed))) hidden) else (((((v_Vuna_dCompiler_dLoader_dcollectModuleFiles dtb__136) name) importerPkg) allowed) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPkg_drootName dtb__135), hidden)))) else (((((v_Vuna_dCompiler_dLoader_dcollectModuleFiles dtb__136) name) importerPkg) allowed) hidden))) ((v_Vuna_dCompiler_dLoader_dmodulePath dtb__135) name))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drootDir) roots)))

let v_Vuna_dCompiler_dLoader_dcandidateDir = (fun candidate -> (v_Vuna_dCompiler_dPkg_drootDir (v_Base_dPair_dsecondOf candidate)))

let v_Vuna_dCompiler_dLoader_dfindModuleFile = (fun roots -> (fun name -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dcollectModuleFiles roots) name) importerPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, dtb__138) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__140 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__139))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous module ") ((bi_concat name) ((bi_concat " (found in: ") ((bi_concat (v_Vuna_dCompiler_dLoader_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dcandidateDir) dtb__137))) ")"))))))
)
  | C_Base_dList_dList_Nil -> (match dtb__138 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module ") ((bi_concat name) ((bi_concat " not found (roots: ") ((bi_concat (v_Vuna_dCompiler_dLoader_d_ujoinRootDirs roots)) ")"))))))
  | dtb__141 -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module ") ((bi_concat name) ((bi_concat " is not exported by package ") (v_Vuna_dCompiler_dLoader_d_ujoinNames dtb__138))))))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__137)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dfindModule = (fun modules -> (fun name -> (match modules with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__142 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> (if ((bi_eq_str dtb__144) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149)))) else ((v_Vuna_dCompiler_dLoader_dfindModule dtb__143) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dmoduleDecls = (fun modules -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (match dtb__150 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> dtb__155
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dmoduleCtors = (fun modules -> (fun name -> (v_Vuna_dCompiler_dAst_dctorsOf ((v_Vuna_dCompiler_dLoader_dmoduleDecls modules) name))))

let v_Vuna_dCompiler_dLoader_dexportsOf = (fun modules -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (match dtb__157 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> dtb__163
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match ((v_Vuna_dCompiler_dLoader_dfindExportValue ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__164)) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__166) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__166)), (((v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules) dtb__165) name)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules) dtb__165) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dmodulesExportingValue = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match ((v_Vuna_dCompiler_dLoader_dfindExportCtor ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__167)) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__169) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__167, dtb__169)), (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules) dtb__168) name)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules) dtb__168) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dmodulesExportingCtor = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__170)) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__172)), (((v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules) dtb__171) name)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules) dtb__171) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dmodulesExportingType = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dopenModuleNames imports)) name))))

let v_Vuna_dCompiler_dLoader_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dBuiltins_dbuiltinArity name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_disBuiltinTraitName = (fun name -> (if (if ((bi_eq_str name) "Show") then true else ((bi_eq_str name) "Eq")) then true else ((bi_eq_str name) "Ord")))

let v_Vuna_dCompiler_dLoader_ddtPreludeNames = fun () -> (C_Base_dList_dList_Cons ("Type", (C_Base_dList_dList_Cons ("->", (C_Base_dList_dList_Cons ("_", (C_Base_dList_dList_Cons ("Int", (C_Base_dList_dList_Cons ("String", (C_Base_dList_dList_Cons ("+", (C_Base_dList_dList_Cons ("-", (C_Base_dList_dList_Cons ("*", (C_Base_dList_dList_Cons ("/", (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", (C_Base_dList_dList_Cons ("++", (C_Base_dList_dList_Cons ("&&", (C_Base_dList_dList_Cons ("||", (C_Base_dList_dList_Cons ("strFromInt", (C_Base_dList_dList_Cons ("strUnpack", (C_Base_dList_dList_Cons ("strPack", (C_Base_dList_dList_Cons ("strLength", (C_Base_dList_dList_Cons ("show", (C_Base_dList_dList_Cons ("eq", (C_Base_dList_dList_Cons ("neq", (C_Base_dList_dList_Cons ("lt", (C_Base_dList_dList_Cons ("le", (C_Base_dList_dList_Cons ("gt", (C_Base_dList_dList_Cons ("ge", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dLoader_disDtPreludeName = (fun name -> ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_ddtPreludeNames ())))

let v_Vuna_dCompiler_dLoader_disPreludeTraitMethod = (fun name -> (if (if (if (if (if (if ((bi_eq_str name) "show") then true else ((bi_eq_str name) "eq")) then true else ((bi_eq_str name) "neq")) then true else ((bi_eq_str name) "lt")) then true else ((bi_eq_str name) "le")) then true else ((bi_eq_str name) "gt")) then true else ((bi_eq_str name) "ge")))

let v_Vuna_dCompiler_dLoader_dresolveQualified = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor dtb__175) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__175)) else (match ((v_Vuna_dCompiler_dLoader_dfindExportValue ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__176)) dtb__175) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__177) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__177)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__175) ((bi_concat " is not exported by ") dtb__176))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__174))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dresolveQualifiedCtor = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__180) -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor dtb__179) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__179)) else (match ((v_Vuna_dCompiler_dLoader_dfindExportCtor ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__180)) dtb__179) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__181)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": constructor ") ((bi_concat dtb__179) ((bi_concat " is not exported by ") dtb__180))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__178))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dLoader_dfoldFieldChain = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (mc0, dtb__182, mc2))) dtb__183) mc2)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dtakeSegs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__184, dtb__185) -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (dtb__184, ((v_Vuna_dCompiler_dLoader_dtakeSegs ((bi_sub mc0) 1)) dtb__185))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_ddropSegs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (if ((bi_le_int mc0) 0) then (C_Base_dList_dList_Cons (dtb__186, dtb__187)) else ((v_Vuna_dCompiler_dLoader_ddropSegs ((bi_sub mc0) 1)) dtb__187))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dresolveQualifiedPath = (fun modules -> (fun label -> (fun imports -> (fun segs -> (fun n -> (fun sp -> (if ((bi_le_int n) 1) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) else (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) (v_Vuna_dCompiler_dCommon_djoinDots ((v_Vuna_dCompiler_dLoader_dtakeSegs ((bi_sub n) 1)) segs))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (match dtb__190 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor dtb__189) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__189, sp)))))) else (match ((v_Vuna_dCompiler_dLoader_dfindExportValue ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__188)) dtb__189) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__191) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__191), sp))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__189) ((bi_concat " is not exported by ") dtb__188))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dfindExportValue ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__188)) dtb__189) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__192), sp))) dtb__190) sp)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__189) ((bi_concat " is not exported by ") dtb__188))))))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_ddropSegs ((bi_sub n) 1)) segs))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dLoader_dresolveQualifiedPath modules) label) imports) segs) ((bi_sub n) 1)) sp)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dLoader_dresolveCtor = (fun modules -> (fun label -> (fun prefix -> (fun ownCtors -> (fun imports -> (fun name -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dresolveQualifiedCtor modules) label) imports) name) else (if ((v_Base_dList_dmemName name) ownCtors) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))) else (match (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtor modules) imports) name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown constructor ") ((bi_concat name) ((v_Vuna_dCompiler_dCommon_dsuggest name) ownCtors))))))
  | dtb__193 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "constructor") name) dtb__193)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))

let v_Vuna_dCompiler_dLoader_dcheckBinder = (fun label -> (fun name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid variable name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))))

let v_Vuna_dCompiler_dLoader_dcheckTopName = (fun label -> (fun name -> (if ((bi_eq_str name) "_") then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": invalid top-level name _ (bare _ is reserved)"))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid top-level name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name))))))

let v_Vuna_dCompiler_dLoader_dresolveTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))))))))

let rec v_Vuna_dCompiler_dLoader_dresolvePattern = (fun modules -> (fun label -> (fun prefix -> (fun ownCtors -> (fun imports -> (fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__194) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__194)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__195, dtb__196) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckBinder label) dtb__195)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__195, dtb__196)), (C_Base_dList_dList_Cons (dtb__195, C_Base_dList_dList_Nil))))))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__197, dtb__198) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__197, dtb__198)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__199, dtb__200) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__199, dtb__200)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__201, dtb__202, dtb__203) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__201)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports)) dtb__202)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__203)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPRecord (dtb__204, dtb__205, dtb__206) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__204)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveRecordPatternField modules) label) prefix) ownCtors) imports)) dtb__205)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPRecord (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__206)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dLoader_dresolveRecordPatternField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern mc0) mc1) mc2) mc3) mc4) dtb__208)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__209, dtb__210) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__209)), dtb__210))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dLoader_dcollectRecBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (match dtb__211 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__213, dtb__214) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern mc0) mc1) mc2) mc3) mc4) dtb__213)) (fun pr -> (match pr with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__215, dtb__216) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__212)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__217, dtb__218) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__216) dtb__217), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__215, dtb__214)), dtb__218))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dLoader_ddesugarDo = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__219, dtb__220) -> (match dtb__219 with
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDBind (dtb__221, dtb__222, dtb__223) -> (match dtb__221 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__224) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__220)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", dtb__223)), (C_Base_dList_dList_Cons (dtb__222, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_do_ignore", C_Base_dList_dList_Nil)), tail, dtb__223)), C_Base_dList_dList_Nil)))), dtb__223))))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__225, dtb__226) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__220)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", dtb__223)), (C_Base_dList_dList_Cons (dtb__222, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam ((C_Base_dList_dList_Cons (dtb__225, C_Base_dList_dList_Nil)), tail, dtb__223)), C_Base_dList_dList_Nil)))), dtb__223))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("do bind pattern must be a variable or _"))
)
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDExpr (dtb__227, dtb__228) -> (match dtb__220 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__227))
  | _ -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__220)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", dtb__228)), (C_Base_dList_dList_Cons (dtb__227, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_do_ignore", C_Base_dList_dList_Nil)), tail, dtb__228)), C_Base_dList_dList_Nil)))), dtb__228))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("do block needs at least one statement"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dresolveCtorDecl = (fun label -> (fun prefix -> (fun ctor -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor ctor) then (C_Base_dResult_dResult_Base_dResult_dOk (ctor)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) ctor)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) ctor)))))))))

let v_Vuna_dCompiler_dLoader_disLowerTypeName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (v_Vuna_dCompiler_dLexer_disLowerChar dtb__229)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dstartsUpperName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__231, dtb__232) -> (if ((bi_ge_int dtb__231) 65) then ((bi_le_int dtb__231) 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dresolveTypeName = (fun modules -> (fun label -> (fun prefix -> (fun ownTypes -> (fun imports -> (fun name -> (if ((v_Base_dList_dmemName name) ownTypes) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))) else (if (if (if (if (if ((bi_eq_str name) "Int") then true else ((bi_eq_str name) "String")) then true else ((bi_eq_str name) "Bool")) then true else ((bi_eq_str name) "Type")) then true else ((bi_eq_str name) "->")) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disBuiltinTraitName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disLowerTypeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__233, dtb__234) -> ((fun typePrefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) typePrefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat typePrefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__235) -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__235)) dtb__234) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__236) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__236)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": type ") ((bi_concat dtb__234) ((bi_concat " is not exported by ") dtb__235))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__233))
  | _ -> failwith "DT: impossible branch"
) else (match (((v_Vuna_dCompiler_dLoader_dmodulesExportingType modules) imports) name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown type ") name))))
  | dtb__237 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "type") name) dtb__237)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))))

let v_Vuna_dCompiler_dLoader_dresolveTypeTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))))))))

let v_Vuna_dCompiler_dLoader_dresolveInstanceName = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__238) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName mc0) mc1) dtb__238)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (n))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dLoader_dmangle mc1) "#default")))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_disPrivateName = (fun name -> ((v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dprivateExportMsg = (fun prefix -> (fun sp -> (fun name -> ((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export private name ") ((bi_concat name) " (names starting with _ are module-private)"))))))))

let rec v_Vuna_dCompiler_dLoader_dfindOwnData = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__239, dtb__240) -> (match dtb__239 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (if ((bi_eq_str dtb__241) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, ((v_Base_dList_dmap v_Vuna_dCompiler_dAst_dctorName) dtb__244))))) else ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__240))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251) -> (if ((bi_eq_str dtb__247) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, (C_Base_dList_dList_Cons (dtb__247, C_Base_dList_dList_Nil)))))) else ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__240))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__252, dtb__253, dtb__254, dtb__255) -> (if ((bi_eq_str dtb__252) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__252, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__254))))) else ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__240))
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__240)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindOwnFn = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__256, dtb__257) -> (match dtb__256 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__258, dtb__259, dtb__260, dtb__261) -> (if ((bi_eq_str dtb__258) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) dtb__257))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__262, dtb__263, dtb__264) -> (if ((bi_eq_str dtb__262) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) dtb__257))
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) dtb__257)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindCtorNamed = (fun name -> (fun ctors -> (match ctors with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__265, dtb__266) -> (if ((bi_eq_str (v_Vuna_dCompiler_dAst_dctorName dtb__265)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dAst_dctorName dtb__265))) else ((v_Vuna_dCompiler_dLoader_dfindCtorNamed name) dtb__266))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindMethodNamed = (fun d2685 -> (fun name -> (fun methods -> (match methods with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__267, dtb__268) -> (match dtb__267 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__269, dtb__270) -> (if (((v_eq d2685) dtb__269) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__269)) else (((v_Vuna_dCompiler_dLoader_dfindMethodNamed d2685) name) dtb__268))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dfindOwnInstanceName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (match dtb__271 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (if dtb__274 then ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__272) else (match dtb__273 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__278) -> (if ((bi_eq_str dtb__278) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__278)) else ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__272))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__272)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__272)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindOwnCtorName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__279, dtb__280) -> (match dtb__279 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__281, dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> (match ((v_Vuna_dCompiler_dLoader_dfindCtorNamed name) dtb__284) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__287) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__281, dtb__287))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__280)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (if ((bi_eq_str dtb__288) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__288, dtb__288)))) else ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__280))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__293, dtb__294, dtb__295, dtb__296) -> (match (((v_Vuna_dCompiler_dLoader_dfindMethodNamed (v_Eq_uEq_uString ())) name) dtb__295) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__297) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__293, dtb__297))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__280)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__280)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_downCtorEntries = (fun prefix -> (fun dname -> (fun names -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__298, dtb__299) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__298) then (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dname) dtb__299) else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("ctor", dtb__298, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__298), ((v_Vuna_dCompiler_dLoader_dmangle prefix) dname))), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dname) dtb__299))))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dctorEntriesOfType = (fun typeTarget -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__300, dtb__301) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind dtb__300)) "ctor") then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryParent dtb__300)) typeTarget) else false) then (C_Base_dList_dList_Cons (dtb__300, ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType typeTarget) dtb__301))) else ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType typeTarget) dtb__301))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_ddeclImplicitExports = (fun prefix -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__302) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__302, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__302), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__302) ((v_Base_dList_dmap v_Vuna_dCompiler_dAst_dctorName) dtb__305)))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__308) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__308, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__308), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__308) (C_Base_dList_dList_Cons (dtb__308, C_Base_dList_dList_Nil))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__313, dtb__314, dtb__315, dtb__316) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__313) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__313, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__313), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__313) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__315)))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (if dtb__318 then C_Base_dList_dList_Nil else (match dtb__317 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__322) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__322) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("val", dtb__322, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__322), "")), C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__323, dtb__324, dtb__325) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__323) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("val", dtb__323, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__323), "")), C_Base_dList_dList_Nil)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__326, dtb__327, dtb__328, dtb__329) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__326) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("val", dtb__326, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__326), "")), C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_drefKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__330, dtb__331, dtb__332) -> dtb__330
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_drefTarget = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__333, dtb__334, dtb__335) -> dtb__334
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_disRecordDecl = (fun dname -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__336, dtb__337) -> (match dtb__336 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__338, dtb__339, dtb__340, dtb__341, dtb__342) -> (if ((bi_eq_str dtb__338) dname) then true else ((v_Vuna_dCompiler_dLoader_disRecordDecl dname) dtb__337))
  | _ -> ((v_Vuna_dCompiler_dLoader_disRecordDecl dname) dtb__337)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_disRecordTarget = (fun modules -> (fun decls -> (fun prefix -> (fun target -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__343, dtb__344) -> ((fun m -> (if ((bi_eq_str m) prefix) then ((v_Vuna_dCompiler_dLoader_disRecordDecl dtb__344) decls) else (match ((v_Vuna_dCompiler_dLoader_dfindModule modules) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__345) -> (match dtb__345 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> ((v_Vuna_dCompiler_dLoader_disRecordDecl dtb__344) dtb__350)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dCommon_djoinDots dtb__343))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dtypeRefDominates = (fun modules -> (fun decls -> (fun prefix -> (fun tr -> (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__352) -> (match dtb__352 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__353, dtb__354, dtb__355) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__356) -> (match dtb__356 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__357, dtb__358, dtb__359) -> (if (if (if ((bi_eq_str dtb__353) "type") then ((bi_eq_str dtb__357) "ctor") else false) then ((bi_eq_str dtb__354) dtb__358) else false) then ((((v_Vuna_dCompiler_dLoader_disRecordTarget modules) decls) prefix) dtb__354) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_drefEntryList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__360) -> (match dtb__360 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__361, dtb__362, dtb__363) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__361, mc0, dtb__362, dtb__363)), C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_downOrImportedTypeRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnData name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__364) -> (match dtb__364 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__365, dtb__366) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("type", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__365), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dLoader_dmodulesExportingType modules) imports) name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | dtb__367 -> (match ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix) "type") name) dtb__367) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__368) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__368))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__369) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("type", (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf dtb__369)), ""))))))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_downOrImportedValueRef2 = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__370) -> (match dtb__370 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__371, dtb__372) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("ctor", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__372), ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__371)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules) imports) name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | dtb__373 -> (match ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix) "name") name) dtb__373) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__374) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__374))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__375) -> ((fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ((v_Vuna_dCompiler_dLoader_dentryKind e), (v_Vuna_dCompiler_dLoader_dentryTarget e), (v_Vuna_dCompiler_dLoader_dentryParent e)))))))) (v_Base_dPair_dsecondOf dtb__375))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_downOrImportedValueRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__376) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__376), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__377) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__377), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dexportSelective = (fun modules -> (fun prefix -> (fun m -> (fun base -> (fun name -> (fun sp -> (match ((v_Vuna_dCompiler_dLoader_dfindExportValue ((v_Vuna_dCompiler_dLoader_dexportsOf modules) m)) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__378) -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType ((v_Vuna_dCompiler_dLoader_dexportsOf modules) m)) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__379) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ((v_Vuna_dCompiler_dLoader_dentryKind dtb__378), base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__378), (v_Vuna_dCompiler_dLoader_dentryParent dtb__378))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__379), "")), C_Base_dList_dList_Nil))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ((v_Vuna_dCompiler_dLoader_dentryKind dtb__378), base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__378), (v_Vuna_dCompiler_dLoader_dentryParent dtb__378))), C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType ((v_Vuna_dCompiler_dLoader_dexportsOf modules) m)) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__380) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__380), "")), C_Base_dList_dList_Nil))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dexportBare = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__381, dtb__382) -> (match dtb__381 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dprivateExportMsg prefix) sp) name))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__383) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__384) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_drefEntryList name) tr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__385) -> (if (((((v_Vuna_dCompiler_dLoader_dtypeRefDominates modules) decls) prefix) tr) vr) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_drefEntryList name) tr))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__386) -> ((((((v_Vuna_dCompiler_dLoader_dexportSelective modules) prefix) dtb__386) dtb__382) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__381))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dexportTypeAll = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__387, dtb__388) -> (match dtb__387 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dprivateExportMsg prefix) sp) name))) else (match ((v_Vuna_dCompiler_dLoader_dfindOwnData name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__389) -> (match dtb__389 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__390, dtb__391) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", name, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__390), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__390) dtb__391)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dLoader_dmodulesExportingType modules) imports) name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | dtb__392 -> (match ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix) "type") name) dtb__392) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__393) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__393))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__394) -> ((fun m -> ((fun tgt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType tgt) ((v_Vuna_dCompiler_dLoader_dexportsOf modules) m))))))) (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf dtb__394)))) (v_Base_dPair_dfirstOf dtb__394))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__395) -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__395)) dtb__388) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__396) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__388, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__396), "")), ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dentryTarget dtb__396)) ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__395))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": type ") ((bi_concat dtb__388) ((bi_concat " is not exported by ") dtb__395))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__387))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dexportItemEntries = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun item -> (match item with
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXModule (dtb__397, dtb__398) -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) dtb__397) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__398)) ((bi_concat ": module ") ((bi_concat dtb__397) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__399) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__399)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXTypeAll (dtb__400, dtb__401) -> ((((((v_Vuna_dCompiler_dLoader_dexportTypeAll modules) prefix) decls) imports) dtb__400) dtb__401)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXBare (dtb__402, dtb__403) -> ((((((v_Vuna_dCompiler_dLoader_dexportBare modules) prefix) decls) imports) dtb__402) dtb__403)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dLoader_dhasSamePublicKind = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__404, dtb__405) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind e)) (v_Vuna_dCompiler_dLoader_dentryKind dtb__404)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dentryPublic dtb__404)) else false) then true else ((v_Vuna_dCompiler_dLoader_dhasSamePublicKind e) dtb__405))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_ddedupeImplicitExports = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__406, dtb__407) -> (if ((v_Vuna_dCompiler_dLoader_dhasSamePublicKind dtb__406) dtb__407) then (v_Vuna_dCompiler_dLoader_ddedupeImplicitExports dtb__407) else (C_Base_dList_dList_Cons (dtb__406, (v_Vuna_dCompiler_dLoader_ddedupeImplicitExports dtb__407))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dimplicitExports = (fun prefix -> (fun decls -> (v_Vuna_dCompiler_dLoader_ddedupeImplicitExports ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_ddeclImplicitExports prefix)) decls))))

let rec v_Vuna_dCompiler_dLoader_dhasConflictingExport = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__408, dtb__409) -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind e)) (v_Vuna_dCompiler_dLoader_dentryKind dtb__408)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dentryPublic dtb__408)) else false) then ((bi_neq_str (v_Vuna_dCompiler_dLoader_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dentryTarget dtb__408)) else false) then true else ((v_Vuna_dCompiler_dLoader_dhasConflictingExport e) dtb__409))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dsameExportEntry = (fun e -> (fun e2 -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind e)) (v_Vuna_dCompiler_dLoader_dentryKind e2)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dentryPublic e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dentryTarget e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryParent e)) (v_Vuna_dCompiler_dLoader_dentryParent e2)) else false)))

let rec v_Vuna_dCompiler_dLoader_dmemExportEntries = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__410, dtb__411) -> (if ((v_Vuna_dCompiler_dLoader_dsameExportEntry e) dtb__410) then true else ((v_Vuna_dCompiler_dLoader_dmemExportEntries e) dtb__411))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_ddedupeExportEntries = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__412, dtb__413) -> (if ((v_Vuna_dCompiler_dLoader_dmemExportEntries dtb__412) dtb__413) then (v_Vuna_dCompiler_dLoader_ddedupeExportEntries dtb__413) else (C_Base_dList_dList_Cons (dtb__412, (v_Vuna_dCompiler_dLoader_ddedupeExportEntries dtb__413))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dcheckExportDuplicates = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__414, dtb__415) -> (if ((v_Vuna_dCompiler_dLoader_dhasConflictingExport dtb__414) dtb__415) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": duplicate export ") (v_Vuna_dCompiler_dLoader_dentryPublic dtb__414))))) else ((v_Vuna_dCompiler_dLoader_dcheckExportDuplicates mc0) dtb__415))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dexportItemKey = (fun item -> (match item with
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXBare (dtb__416, dtb__417) -> ((bi_concat "bare:") dtb__416)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXTypeAll (dtb__418, dtb__419) -> ((bi_concat "typeall:") dtb__418)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXModule (dtb__420, dtb__421) -> ((bi_concat "module:") dtb__420)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dmemExportItemKey = (fun key -> (fun items -> (match items with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__422, dtb__423) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dexportItemKey dtb__422)) key) then true else ((v_Vuna_dCompiler_dLoader_dmemExportItemKey key) dtb__423))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dexportItemName = (fun item -> (match item with
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXBare (dtb__424, dtb__425) -> dtb__424
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXTypeAll (dtb__426, dtb__427) -> dtb__426
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXModule (dtb__428, dtb__429) -> dtb__428
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dduplicateExportItem = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__430, dtb__431) -> (if ((v_Vuna_dCompiler_dLoader_dmemExportItemKey (v_Vuna_dCompiler_dLoader_dexportItemKey dtb__430)) dtb__431) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dexportItemName dtb__430))) else (v_Vuna_dCompiler_dLoader_dduplicateExportItem dtb__431))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dcheckExportItemDuplicates = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__432, dtb__433) -> (match (v_Vuna_dCompiler_dLoader_dduplicateExportItem (C_Base_dList_dList_Cons (dtb__432, dtb__433))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__434) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": duplicate export ") dtb__434))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dcheckExportItemDuplicates mc0) dtb__433)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dexplicitExports = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__435, dtb__436) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckExportItemDuplicates mc1) (C_Base_dList_dList_Cons (dtb__435, dtb__436)))) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dexportItemEntries mc0) mc1) mc2) mc3) dtb__435)) (fun es -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dexplicitExports mc0) mc1) mc2) mc3) dtb__436)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_ddedupeExportEntries ((v_Base_dList_dappend es) tail))))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dvalidateModuleHeader = (fun label -> (fun hdr -> (match hdr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__437) -> (match dtb__437 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__438, dtb__439, dtb__440, dtb__441) -> (if ((bi_eq_str dtb__438) label) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__441)) ((bi_concat ": module name mismatch: source declares ") dtb__438)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dcomputeExports = (fun modules -> (fun prefix -> (fun hdr -> (fun imports -> (fun decls -> (match hdr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dimplicitExports prefix) decls)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__442) -> (match dtb__442 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__443, dtb__444, dtb__445, dtb__446) -> (if dtb__444 then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dexplicitExports modules) prefix) decls) imports) dtb__445)) (fun es -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckExportDuplicates prefix) es)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dimplicitExports prefix) decls))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dshowCycle = (fun name -> (fun stack -> (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse (C_Base_dList_dList_Cons (name, stack))))))

let v_Vuna_dCompiler_dLoader_dimplicitPreludeDeps = (fun importerPkg -> (fun deps -> (match deps with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__447, dtb__448) -> (match dtb__448 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport ("Prelude", false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Nil))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c)))) deps))) ")"))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c)))) deps))) ")"))))
)))

let v_Vuna_dCompiler_dLoader_dimplicitPreludeFrom = (fun roots -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dcollectModuleFiles roots) "Prelude") importerPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__449, dtb__450) -> ((v_Vuna_dCompiler_dLoader_dimplicitPreludeDeps importerPkg) ((v_Base_dList_dfilter (fun c -> ((bi_neq_str (v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c))) importerPkg))) dtb__449))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dimplicitPrelude = (fun roots -> (fun importerPkg -> (fun currentName -> (fun imports -> (if ((bi_eq_str importerPkg) "") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (if ((bi_eq_str currentName) "Prelude") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (if ((v_Base_dList_dmemName "Prelude") (v_Vuna_dCompiler_dLoader_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else ((v_Vuna_dCompiler_dLoader_dimplicitPreludeFrom roots) importerPkg))))))))

let rec v_Vuna_dCompiler_dLoader_dloadAll = (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun imports -> (match imports with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dList_dList_Cons (dtb__451, dtb__452) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadModule roots) importerPkg) modules) stack) (v_Vuna_dCompiler_dLoader_dimportName dtb__451))) (fun modules2 -> (((((v_Vuna_dCompiler_dLoader_dloadAll roots) importerPkg) modules2) stack) dtb__452)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dLoader_dloadModule = (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__453) -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) stack) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "import cycle: ") ((v_Vuna_dCompiler_dLoader_dshowCycle name) stack)))) else (if (v_Vuna_dCompiler_dLoader_dvalidModuleName name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dParser_dparseSource path) (dtp_readFile path))) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (dtb__454, dtb__455, dtb__456) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateModuleHeader name) dtb__454)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateImports name) dtb__455)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dimplicitPrelude roots) (v_Vuna_dCompiler_dPkg_drootName root)) name) dtb__455)) (fun implicit -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll roots) (v_Vuna_dCompiler_dPkg_drootName root)) modules) (C_Base_dList_dList_Cons (name, stack))) ((v_Base_dList_dappend dtb__455) implicit))) (fun modules2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dcomputeExports modules2) name) dtb__454) dtb__455) dtb__456)) (fun exports -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (name, (v_Vuna_dCompiler_dPkg_drootName root), dtb__455, implicit, dtb__456, exports)), modules2))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf found))) (v_Base_dPair_dfirstOf found)))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "invalid module name: ") name)))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dloadProject = (fun roots -> (fun entryPkg -> (fun entry -> (if (dtp_fileExists entry) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dParser_dparseSource entry) (dtp_readFile entry))) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (dtb__457, dtb__458, dtb__459) -> (match dtb__457 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__460) -> (match dtb__460 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__461, dtb__462, dtb__463, dtb__464) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module header is not allowed in entry file (") ((bi_concat entry) ")"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateImports "<entry>") dtb__458)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dimplicitPrelude roots) entryPkg) "") dtb__458)) (fun implicit -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll roots) entryPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) ((v_Base_dList_dappend dtb__458) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__459, dtb__458, implicit, modules, entryPkg))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "entry file not found: ") entry)))))))

let v_Vuna_dCompiler_dLoader_dloadProjectModules = (fun roots -> (fun entryPkg -> (fun names -> ((fun entryImports -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll roots) entryPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) entryImports)) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, modules, entryPkg))))))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport (n, false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names)))))

let v_Vuna_dCompiler_dLoader_dpackageAllowsEffects = (fun pkg -> (if (if ((bi_eq_str pkg) "vuna") then true else ((bi_eq_str pkg) "vuna-compiler")) then true else ((bi_eq_str pkg) "vuna-base")))

let v_Vuna_dCompiler_dLoader_disEffectfulBuiltin = (fun name -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((bi_eq_str name) "print") then true else ((bi_eq_str name) "readFile")) then true else ((bi_eq_str name) "writeFile")) then true else ((bi_eq_str name) "getArgs")) then true else ((bi_eq_str name) "readLine")) then true else ((bi_eq_str name) "readDir")) then true else ((bi_eq_str name) "isDirectory")) then true else ((bi_eq_str name) "makeDir")) then true else ((bi_eq_str name) "removeFile")) then true else ((bi_eq_str name) "fileExists")) then true else ((bi_eq_str name) "fileMtime")) then true else ((bi_eq_str name) "fileSize")) then true else ((bi_eq_str name) "exit")) then true else ((bi_eq_str name) "prim_print")) then true else ((bi_eq_str name) "prim_readFile")) then true else ((bi_eq_str name) "prim_writeFile")) then true else ((bi_eq_str name) "prim_getArgs")) then true else ((bi_eq_str name) "prim_readLine")) then true else ((bi_eq_str name) "prim_readDir")) then true else ((bi_eq_str name) "prim_isDirectory")) then true else ((bi_eq_str name) "prim_makeDir")) then true else ((bi_eq_str name) "prim_removeFile")) then true else ((bi_eq_str name) "prim_fileExists")) then true else ((bi_eq_str name) "prim_fileMtime")) then true else ((bi_eq_str name) "prim_fileSize")) then true else ((bi_eq_str name) "prim_exit")) then true else ((bi_eq_str name) "prim_runIn")))

let v_Vuna_dCompiler_dLoader_dresolveGlobal = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun imports -> (fun scope -> (fun name -> (if ((v_Base_dList_dmemName name) scope) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disGlobalCtor name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dresolveQualified modules) label) imports) name) else (if ((v_Base_dList_dmemName name) own) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dLoader_disEffectfulBuiltin name) then (match (((v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules) imports) name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (name))
  | dtb__465 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "name") name) dtb__465)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
) else (if (v_Vuna_dCompiler_dLoader_disBuiltinName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disBuiltinTraitName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disPreludeTraitMethod name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disDtPreludeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (match (((v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules) imports) name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unbound variable ") ((bi_concat name) ((v_Vuna_dCompiler_dCommon_dsuggest name) ((v_Base_dList_dappend own) scope)))))))
  | dtb__466 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "name") name) dtb__466)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))))))))))))))))

let v_Vuna_dCompiler_dLoader_dresolveDottedExpr = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun imports -> (fun scope -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid dotted name ") name))))
  | C_Base_dList_dList_Cons (dtb__467, dtb__468) -> (if ((v_Base_dList_dmemName dtb__467) scope) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__467, sp))) dtb__468) sp))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveQualifiedPath modules) label) imports) (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (v_Base_dList_dlength (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__469) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__469))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName dtb__467) own) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__467), sp))) dtb__468) sp))) else (if (v_Vuna_dCompiler_dLoader_disBuiltinName dtb__467) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__467, sp))) dtb__468) sp))) else (if (v_Vuna_dCompiler_dLoader_dstartsUpperName dtb__467) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat dtb__467) " is not imported"))))) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__467)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (n, sp))) dtb__468) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dLoader_dresolveAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__470, dtb__471) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern mc0) mc1) mc2) mc4) mc5) dtb__470)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__472, dtb__473) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr mc0) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__473) mc6)) dtb__471)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__472, body2))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dresolveLet = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun rec_u -> (fun binds -> (fun body -> (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dresolveRecLet modules) label) prefix) own) ownCtors) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dresolveLetSeq modules) label) prefix) own) ownCtors) imports) scope) binds) body))))))))))))
and v_Vuna_dCompiler_dLoader_dresolveLetSeq = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (match binds with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, b))))))
  | C_Base_dList_dList_Cons (dtb__474, dtb__475) -> (match dtb__474 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__476, dtb__477) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__477)) (fun value2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports) dtb__476)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__478, dtb__479) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dresolveLetSeq modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend dtb__479) scope)) dtb__475) body)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__480, dtb__481) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__478, value2)), dtb__480)), dtb__481))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dresolveRecLet = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (match ((((((v_Vuna_dCompiler_dLoader_dcollectRecBinds modules) label) prefix) ownCtors) imports) binds) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__482) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__482))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__483) -> (match dtb__483 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__484, dtb__485) -> ((fun scope2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveRecValues modules) label) prefix) own) ownCtors) imports) scope2) dtb__485)) (fun values2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope2) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (values2, b))))))))) ((v_Base_dList_dappend dtb__484) scope))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dresolveRecValues = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dList_dList_Cons (dtb__486, dtb__487) -> (match dtb__486 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__488, dtb__489) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__489)) (fun value2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveRecValues mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__487)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__488, value2)), tail))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dresolveExpr = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__490, dtb__491) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__490) then ((((((((v_Vuna_dCompiler_dLoader_dresolveDottedExpr modules) label) prefix) own) imports) scope) dtb__490) dtb__491) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__490)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (n, dtb__491)))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__492, dtb__493) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__492, dtb__493))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__494, dtb__495) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__494, dtb__495))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__496, dtb__497, dtb__498) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dcheckBinder label)) dtb__496)) (fun _u -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend dtb__496) scope)) dtb__497)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__496, b, dtb__498))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__499, dtb__500, dtb__501) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__499)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) a))) dtb__500)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn2, args2, dtb__501))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__504)) (fun dom2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend (C_Base_dList_dList_Cons (dtb__502, C_Base_dList_dList_Nil))) scope)) dtb__505)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__502, dtb__503, dom2, cod2, dtb__506))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__507, dtb__508, dtb__509, dtb__510) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dLoader_dresolveLet modules) label) prefix) own) ownCtors) imports) scope) dtb__509) dtb__507) dtb__508)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__511, dtb__512) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__511, dtb__512, dtb__509, dtb__510))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__513, dtb__514, dtb__515) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__513)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveAlt modules) label) prefix) own) ownCtors) imports) scope)) dtb__514)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (scrut2, alts2, dtb__515))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__516, dtb__517, dtb__518, dtb__519) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__516)) (fun c2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__517)) (fun t2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__518)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (c2, t2, e2, dtb__519))))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__520, dtb__521, dtb__522) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__520)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (b, dtb__521, dtb__522))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__523, dtb__524, dtb__525) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__523)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveFieldValue modules) label) prefix) own) ownCtors) imports) scope)) dtb__524)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (name2, fs, dtb__525))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__526, dtb__527, dtb__528) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__526)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveFieldValue modules) label) prefix) own) ownCtors) imports) scope)) dtb__527)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (b, fs, dtb__528))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__529, dtb__530, dtb__531) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__529)) (fun m2 -> (match (((((((v_Vuna_dCompiler_dLoader_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__530) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__532) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown instance name ") ((bi_concat dtb__530) ((bi_concat " (@") ((bi_concat dtb__530) ")")))))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__533) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (m2, dtb__533, dtb__531))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__534, dtb__535) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__534)) (fun e -> ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) e)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__536, dtb__537, dtb__538) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__536)) (fun v2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__537)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (v2, t2, dtb__538))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dresolveFieldValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__539, dtb__540) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__540)) (fun v -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__539, v))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dLoader_dfirstEffect = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__541, dtb__542) -> (match dtb__541 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__543) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__543))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dfirstEffect dtb__542)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_deffExpr = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__544, dtb__545) -> (if (v_Vuna_dCompiler_dLoader_disEffectfulBuiltin dtb__544) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__544)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__546, dtb__547) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__548, dtb__549) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__550, dtb__551, dtb__552) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__551)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__553, dtb__554, dtb__555) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__553), ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffExpr) dtb__554))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__556, dtb__557, dtb__558, dtb__559) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffBinds dtb__556), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__557), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__560, dtb__561, dtb__562) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__560), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffAlts dtb__561), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__563, dtb__564, dtb__565, dtb__566) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__563), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__564), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__565), C_Base_dList_dList_Nil)))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__567, dtb__568, dtb__569) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__567)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__570, dtb__571, dtb__572) -> (v_Vuna_dCompiler_dLoader_deffFields dtb__571)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__573, dtb__574, dtb__575) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__573), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffFields dtb__574), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__576, dtb__577, dtb__578) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__579, dtb__580, dtb__581, dtb__582, dtb__583) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__581), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__582), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__584, dtb__585) -> (v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDo) dtb__584))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__586, dtb__587, dtb__588) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__586)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__589, dtb__590) -> (match dtb__589 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__591, dtb__592) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__592), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffBinds dtb__590), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__593, dtb__594) -> (match dtb__593 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__595, dtb__596) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__596), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffAlts dtb__594), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffFields = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__597, dtb__598) -> (match dtb__597 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__599, dtb__600) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__600), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffFields dtb__598), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffDo = (fun s -> (match s with
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDBind (dtb__601, dtb__602, dtb__603) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__602)
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDExpr (dtb__604, dtb__605) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__604)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_deffDecl = (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__606, dtb__607, dtb__608, dtb__609) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__608)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__610, dtb__611, dtb__612, dtb__613) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__614, dtb__615, dtb__616, dtb__617, dtb__618) -> (v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDecl) dtb__617))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dLoader_deffDecls = (fun decls -> (v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDecl) decls)))

let v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins = (fun label -> (fun pkg -> (fun decls -> (if (v_Vuna_dCompiler_dLoader_dpackageAllowsEffects pkg) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (if (if ((bi_eq_str pkg) "") then ((bi_neq_str label) "<entry>") else false) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (match (v_Vuna_dCompiler_dLoader_deffDecls decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__619) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": effectful builtin `") ((bi_concat dtb__619) ((bi_concat "` is not available in package ") ((bi_concat pkg) " (use Base.IO)")))))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dtyShape = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__620, dtb__621) -> ((bi_concat "var ") dtb__620)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__622, dtb__623, dtb__624) -> "app"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__625, dtb__626) -> "int"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__627, dtb__628) -> "str"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__629, dtb__630, dtb__631) -> "lam"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__632, dtb__633, dtb__634, dtb__635) -> "let"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__636, dtb__637, dtb__638) -> "case"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__639, dtb__640, dtb__641, dtb__642) -> "if"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__643, dtb__644) -> "do"
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dresolveTypeExpr = (fun modules -> (fun label -> (fun prefix -> (fun ownTypes -> (fun imports -> (fun ty -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__645, dtb__646, dtb__647, dtb__648, dtb__649) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__647)) (fun dom2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__648)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__645, dtb__646, dom2, cod2, dtb__649))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__650, dtb__651, dtb__652) -> (match dtb__650 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__653, dtb__654) -> (if ((bi_eq_str dtb__653) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk (ty)) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__650)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports)) dtb__651)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn2, args2, dtb__652)))))))))
  | _ -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__650)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports)) dtb__651)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn2, args2, dtb__652))))))))
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__655, dtb__656) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeName modules) label) prefix) ownTypes) imports) dtb__655)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (n, dtb__656))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__657, dtb__658) -> (C_Base_dResult_dResult_Base_dResult_dOk (ty))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid type expression (") ((bi_concat (v_Vuna_dCompiler_dLoader_dtyShape ty)) ")")))))
)) ty)))))))

let v_Vuna_dCompiler_dLoader_dresolveCtorSpec = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__659, dtb__660, dtb__661, dtb__662) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveCtorDecl mc1) mc2) dtb__659)) (fun c2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr mc0) mc1) mc2) mc3) mc4) dtb__660)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (c2, ty2, dtb__661, dtb__662))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dresolveRecordField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dAst_dField_Vuna_dCompiler_dAst_dField (dtb__663, dtb__664, dtb__665) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckBinder mc1) dtb__663)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr mc0) mc1) mc2) mc3) mc4) dtb__664)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dField_Vuna_dCompiler_dAst_dField (dtb__663, ty2, dtb__665))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dresolveTraitMethod = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__666, dtb__667) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName mc1) mc2) dtb__666)) (fun n -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr mc0) mc1) mc2) mc3) mc4) dtb__667)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (n, ty2))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dresolveInstanceMethod = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__668, dtb__669, dtb__670) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) dtb__668)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__669)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__668, ty2, dtb__670))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__671, dtb__672, dtb__673, dtb__674) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) dtb__671)) (fun _u -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports)) dtb__672)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__673)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__671, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__674))))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": instance body may only contain method signatures/definitions")))
)))))))))

let v_Vuna_dCompiler_dLoader_dresolveDecl = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__675, dtb__676, dtb__677, dtb__678, dtb__679, dtb__680) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTypeTopName label) prefix) dtb__675)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveCtorSpec modules) label) prefix) ownTypes) imports)) dtb__678)) (fun ctors2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeName modules) label) prefix) ownTypes) imports)) dtb__679)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dn, dtb__676, dtb__677, ctors2, ds2, dtb__680))))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__681, dtb__682, dtb__683, dtb__684, dtb__685) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTypeTopName label) prefix) dtb__681)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveRecordField modules) label) prefix) ownTypes) imports)) dtb__683)) (fun fields2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeName modules) label) prefix) ownTypes) imports)) dtb__684)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dn, dtb__682, fields2, ds2, dtb__685))))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__686, dtb__687, dtb__688, dtb__689) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTypeTopName label) prefix) dtb__686)) (fun tn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTraitMethod modules) label) prefix) ownTypes) imports)) dtb__688)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (tn, dtb__687, ms, dtb__689))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__690, dtb__691, dtb__692, dtb__693, dtb__694) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveInstanceName label) prefix) dtb__690)) (fun in2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__692)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveInstanceMethod modules) label) prefix) own) ownCtors) ownTypes) imports)) dtb__693)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (in2, dtb__691, head2, ms, dtb__694))))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__695, dtb__696, dtb__697) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName label) prefix) dtb__695)) (fun n -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__696)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (n, ty2, dtb__697))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__698, dtb__699, dtb__700, dtb__701) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName label) prefix) dtb__698)) (fun n -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports)) dtb__699)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__700)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (n, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__701))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dresolveProgram = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun decls -> ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveDecl modules) label) prefix) own) ownCtors) ownTypes) imports)) decls)))))))))

let v_Vuna_dCompiler_dLoader_dresolveEntry = (fun modules -> (fun entryPkg -> (fun imports -> (fun decls -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveProgram modules) "<entry>") "") ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames decls)) (v_Vuna_dCompiler_dAst_dtypeNamesOf decls))) (v_Vuna_dCompiler_dAst_dctorsOf decls)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dctorsOf decls)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames decls)) (v_Vuna_dCompiler_dAst_dtypeNamesOf decls)))) imports) decls)) (fun d -> (((v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins "<entry>") entryPkg) d)))))))

let rec v_Vuna_dCompiler_dLoader_dresolveModules = (fun modules -> (match modules with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__702, dtb__703) -> (match dtb__702 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveProgram modules) dtb__704) dtb__704) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__708)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__708))) (v_Vuna_dCompiler_dAst_dctorsOf dtb__708)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dctorsOf dtb__708)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__708)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__708)))) ((v_Base_dList_dappend dtb__706) dtb__707)) dtb__708)) (fun d -> (((v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins dtb__704) dtb__705) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModules dtb__703)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__710, dtb__711) -> (match dtb__710 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__712, dtb__713, dtb__714, dtb__715, dtb__716, dtb__717) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveProgram (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__712, dtb__713, dtb__714, dtb__715, dtb__716, dtb__717)), dtb__711))) dtb__712) dtb__712) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__716)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__716))) (v_Vuna_dCompiler_dAst_dctorsOf dtb__716)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dctorsOf dtb__716)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__716)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__716)))) ((v_Base_dList_dappend dtb__714) dtb__715)) dtb__716)) (fun d -> (((v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins dtb__712) dtb__713) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModulesKeep dtb__711)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__712, dtb__713, dtb__714, dtb__715, d1, dtb__717)), d2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dresolveProject = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__718, dtb__719, dtb__720, dtb__721, dtb__722) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dresolveEntry dtb__721) dtb__722) ((v_Base_dList_dappend dtb__719) dtb__720)) dtb__718)) (fun entryDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModulesKeep dtb__721)) (fun modules2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dloadProgram = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProject roots) entryPkg) entry)) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject p)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend (v_Base_dPair_dfirstOf r)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf) (v_Base_dPair_dsecondOf r))))))))))))

let v_Vuna_dCompiler_dLoader_dloadProgramRaw = (fun roots -> (fun entry -> (((v_Vuna_dCompiler_dLoader_dloadProgram ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drawRoot) roots)) "") entry)))

let v_Vuna_dCompiler_dLoader_dorderedProjectDecls = (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject p)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf r)))) (v_Base_dPair_dfirstOf r)))))))

let v_Vuna_dCompiler_dLoader_dloadProgramOrdered = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProject roots) entryPkg) entry)) v_Vuna_dCompiler_dLoader_dorderedProjectDecls))))

let v_Vuna_dCompiler_dLoader_dloadProgramRawOrdered = (fun roots -> (fun entry -> (((v_Vuna_dCompiler_dLoader_dloadProgramOrdered ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drawRoot) roots)) "") entry)))

let v_Vuna_dCompiler_dLoader_dloadProgramRawOrderedSource = (fun roots -> (fun label -> (fun source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dParser_dparseSource label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (dtb__723, dtb__724, dtb__725) -> (match dtb__723 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__726) -> (match dtb__726 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__727, dtb__728, dtb__729, dtb__730) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module header is not allowed in entry source (") ((bi_concat label) ")"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateImports "<entry>") dtb__724)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drawRoot) roots)) "") C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) dtb__724)) (fun modules -> (v_Vuna_dCompiler_dLoader_dorderedProjectDecls (C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__725, dtb__724, C_Base_dList_dList_Nil, modules, "")))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
