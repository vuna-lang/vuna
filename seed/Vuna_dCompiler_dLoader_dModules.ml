open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser
type t_Vuna_dCompiler_dLoader_dModules_dModule = C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dExportEntry t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dProject = C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject of (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dModule t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry of (string) * (string) * (string) * (string)
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef of (string) * (string) * (string)

let rec v_Base_dEq_dEq_uBase_dEq_dEq_uVuna_dCompiler_dLoader_dModules_dExportEntry = fun () -> (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun sx -> (fun sy -> (match sx with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__0, dtb__1, dtb__2, dtb__3) -> (match sy with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__4, dtb__5, dtb__6, dtb__7) -> (if ((bi_eq_str dtb__0) dtb__4) then (if ((bi_eq_str dtb__1) dtb__5) then (if ((bi_eq_str dtb__2) dtb__6) then ((bi_eq_str dtb__3) dtb__7) else false) else false) else false)
  | _ -> ((bi_eq_int 0) 1)
)
  | _ -> failwith "DT: impossible branch"
))), (fun sx -> (fun sy -> (if (((v_Base_dEq_deq (v_Base_dEq_dEq_uBase_dEq_dEq_uVuna_dCompiler_dLoader_dModules_dExportEntry ())) sx) sy) then ((bi_eq_int 0) 1) else ((bi_eq_int 1) 1))))))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleImplicitImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> ((v_Base_dList_dappend dtb__34) dtb__35)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleExportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryDecls = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> dtb__56
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> ((v_Base_dList_dappend dtb__61) dtb__62)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryPkg = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun chars -> (match chars with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__75) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__75)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__76) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (dtp_unpack seg) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__77) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__78) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun segs -> (match segs with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__79) then (match dtb__80 with
  | C_Base_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__80)
) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Nil -> false
  | dtb__81 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__81)
))

let v_Vuna_dCompiler_dLoader_dModules_disGlobalCtor = (fun name -> (if (if (if ((bi_eq_str name) "True") then true else ((bi_eq_str name) "False")) then true else ((bi_eq_str name) "Cons")) then true else ((bi_eq_str name) "Nil")))

let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix -> (fun name -> (if ((bi_eq_str prefix) "") then name else ((bi_concat prefix) ((bi_concat ".") name)))))

let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__82, dtb__83, dtb__84, dtb__85) -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportIsQualified = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__87
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportAlias = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__90, dtb__91, dtb__92, dtb__93) -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if ((v_Base_dList_dmemName dtb__94) dtb__95) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__95))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun imports -> (match imports with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match (v_Vuna_dCompiler_dLoader_dModules_dimportAlias dtb__96) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__97)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__96))), (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__97)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun label -> (fun moduleNames -> (fun aliases -> (match aliases with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__101) then (if ((v_Base_dList_dmemName dtb__101) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__100)) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": duplicate module alias ") dtb__101)))) else (if ((v_Base_dList_dmemName dtb__101) moduleNames) then (if ((bi_eq_str dtb__101) dtb__102) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) moduleNames) dtb__100) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module alias ") ((bi_concat dtb__101) " conflicts with an imported module")))))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) moduleNames) dtb__100))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid module alias ") dtb__101)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label -> (fun imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": duplicate import"))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports)))))

let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun imports -> (match imports with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (if (v_Vuna_dCompiler_dLoader_dModules_dimportIsQualified dtb__103) then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__104) else (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__103), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__104))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun imports -> (fun prefix -> (match imports with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__105)) prefix) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__105))) else (match (v_Vuna_dCompiler_dLoader_dModules_dimportAlias dtb__105) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (if ((bi_eq_str dtb__107) prefix) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__105))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__106) prefix))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__106) prefix)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__109 with
  | C_Base_dList_dList_Nil -> dtb__108
  | _ -> ((bi_concat dtb__108) ((bi_concat ", ") (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__109)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "loader: internal: module ") ((bi_concat name) " is not loaded (import list and module table disagree)")))))

let v_Vuna_dCompiler_dLoader_dModules_dentryKind = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryPublic = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__114, dtb__115, dtb__116, dtb__117) -> dtb__115
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryTarget = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__120
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryParent = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__122, dtb__123, dtb__124, dtb__125) -> dtb__125
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun kinds -> (fun name -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (if (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__126)) kinds) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__126)) name) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__126)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport kinds) name) dtb__127))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Cons ("val", (C_Base_dList_dList_Cons ("ctor", C_Base_dList_dList_Nil))))) name) entries)))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Cons ("ctor", C_Base_dList_dList_Nil))) name) entries)))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Cons ("type", C_Base_dList_dList_Nil))) name) entries)))

let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun e -> (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> true
  | C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (match dtb__128 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__131)) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest e) dtb__129) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (v_Base_dPair_dsecondOf dtb__132)) dtb__133) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__132)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": ambiguous ") ((bi_concat mc1) ((bi_concat " ") ((bi_concat mc2) ((bi_concat " (imported from ") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) (C_Base_dList_dList_Cons (dtb__132, dtb__133))))) "); qualify it"))))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": unknown ") ((bi_concat mc1) ((bi_concat " ") mc2))))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root -> (fun name -> ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) ((bi_concat "/") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) ".vuna")))))

let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg -> (fun root -> (fun name -> (match (v_Vuna_dCompiler_dPackages_dPkg_drootExports root) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__134) -> (if ((bi_eq_str (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) importerPkg) then true else ((v_Base_dList_dmemName name) dtb__134))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun roots -> (fun name -> (fun importerPkg -> (fun allowed -> (fun hidden -> (match roots with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse allowed), (v_Base_dList_dreverse hidden)))
  | C_Base_dList_dList_Cons (dtb__135, dtb__136) -> ((fun path -> (if (dtp_fileExists path) then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows importerPkg) dtb__135) name) then (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__136) name) importerPkg) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (path, dtb__135)), allowed))) hidden) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__136) name) importerPkg) allowed) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__135), hidden)))) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__136) name) importerPkg) allowed) hidden))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__135) name))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dPackages_dPkg_drootDir) roots)))

let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (v_Vuna_dCompiler_dPackages_dPkg_drootDir (v_Base_dPair_dsecondOf candidate)))

let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun roots -> (fun name -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) name) importerPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, dtb__138) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__140 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__139))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous module ") ((bi_concat name) ((bi_concat " (found in: ") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) dtb__137))) ")"))))))
)
  | C_Base_dList_dList_Nil -> (match dtb__138 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module ") ((bi_concat name) ((bi_concat " not found (roots: ") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)) ")"))))))
  | dtb__141 -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module ") ((bi_concat name) ((bi_concat " is not exported by package ") (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__138))))))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__137)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun modules -> (fun name -> (match modules with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__142 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> (if ((bi_eq_str dtb__144) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149)))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__143) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (match dtb__150 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__155))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls)))))))

let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (match dtb__157 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__163))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__164, dtb__165) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__164)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__166) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) dtb__165) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__166)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) dtb__165) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__167, dtb__168) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__167)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__169) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) dtb__168) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__167, dtb__169)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) dtb__168) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__170, dtb__171) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__170)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) dtb__171) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__172)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) dtb__171) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))))

let v_Vuna_dCompiler_dLoader_dModules_drefKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__173, dtb__174, dtb__175) -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_drefTarget = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__176, dtb__177, dtb__178) -> dtb__177
  | _ -> failwith "DT: impossible branch"
))
